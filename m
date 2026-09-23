Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FBE497B7C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191658; cv=none; b=pUMhicM3CiaPRsd+m6w/joXAV33MvLLC5pV2DQ8NMJ9L03l/piHAXyiX73FNNR2dc5Oo7aohIAiIaKkFRoq5EJvimYpPQsnGJQZhdnX7LFyAdkORCHwNy3f/RCcykzPy/xpP2yFGWkz5Mo5aRdT8rCToyvbjJCF2kgeBSsj6Ppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191658; c=relaxed/simple;
	bh=VHu/LsuO7hwtLY9CoaKhEh/T7gDBn38UfvFSZ9AHtYA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=e8DHmsaBwUc/NVd4rBfn2EXdrGfSCSCeF8yav2dtghsUOi7bwmKs5+faZlhVHuQyLitY/b75+d7bzC/rnSwz6Ygsf+L2TUINRF1iscYDkSpMTptT2FAdorVM6zq/YyHMNu0aKLFTRax0p/4h+Bl3cmBOWMfH7G/S6gkdRQxb7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmwqpdDU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmwqpdDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318491F000FF;
	Wed, 23 Sep 2026 19:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191657;
	bh=p7zYITZakqFcHp1eB4vkVi/sdWRjU1mR4esXb9jrA5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lmwqpdDUUV7N3QqAE+HiTI8eO6WOL5dJ0SvkwVhD0Cf6hHBdkGOv7t1vDTIenHA6o
	 IOjoc1tr8VtUzc2DdKUhsyBOB6J1NS8T0y31R5tgL+dOoPmuFQC0Dq38JMVpGBVSBS
	 qRkcZ91Lyqjn185z5rhUAsOrSZzswRslsW9OCegVD1CwEpzuhHRDvoLjZ4Lca6L5Ur
	 QdjNipttrQQMb5SMb+Lsd0xJaMQLqfxb8oRlimQvVsCUy+kihWe174pXJ7CXa6cvBs
	 nCNisF9sR/+WINkbXJrcrkZ4r0mmXYDc80t1lPY+/1XkzyUH8Ht7RI3pUbiWcBH5OX
	 k+E08hIq6UeaQ==
Date: Wed, 23 Sep 2026 09:27:36 -1000
Message-ID: <731a01cb1a08c0b66af6a772a4cdac10@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] tools/workqueue/wq_dump.py: Add busy worker inspection
 and BH pool states
In-Reply-To: <20260923031344.60494-1-atomlin@atomlin.com>
References: <20260923031344.60494-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Aaron.

On Tue, Sep 22, 2026 at 11:13:44PM -0400, Aaron Tomlin wrote:
> +                            fn_name = prog.symbol(func).name
...
> +                        except (drgn.FaultError, LookupError):
> +                            continue

prog.symbol() raises LookupError when drgn has no symbol for the address,
e.g. a work function in a module whose debug info drgn didn't load. That
gets retried like a transient fault and the busy worker is then dropped
without any output. Maybe fall back to the raw address?

    try:
        fn_name = prog.symbol(func).name
    except LookupError:
        fn_name = hex(func)

Thanks.

--
tejun
