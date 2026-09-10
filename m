Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52679514761
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061398; cv=none; b=j2fPKrDyVjab4kznGGBMnQnuJX9sMbMQoJuVgwIKlSro3xCG50/tqMSPfs9T4/3P3VtGT+VwqreJQ7wkW++6RSB0Ggjbau5xlYf2YQGvZf0pzfZDx8j/PO/pikoWR50zqasG/DbFWeiO2Bhs/ye6KyT+LzvlcWpmsiXKysI37wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061398; c=relaxed/simple;
	bh=D4QYHRJLshyPhJaj6mMPQ6wjpUyoqFWLft1f4k5dvnc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lG8nPUG2FqsmHVRVsfBmBx4t9k7ClkvFgsscBdwvmW9imNp3zgyY4Qp8pH1Pg37x6WG2tlua7Ws/SqUuOm4BKztJvrIChPT2Utnq5J138pn7vGGLIFfX54+GFS7Jt9UPIGNleEv0igRGYUlKeYnNWWFv3XKZRguR3dNCG5Wwpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKJvFdA+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKJvFdA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0151F000FF;
	Thu, 10 Sep 2026 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061386;
	bh=dmIMohshCKTyCpgoZrk/7b2P8bD+ZIoR4fMLfVIgFAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oKJvFdA+WcbUxPwY9Nl/cCfALx1E8EAwENFa105wCq9fsf9fh7PHYvA2L1T/4sv+e
	 tq5siRXa8vBB0zIEucNLrlrFCVQafWB8iuuKQmEIVXUZpNuHXkJUdsD8Z3/xQybBgh
	 B2MdH5UqofvoNmIfDZBUJxzorWxIPuomQ01lGnAywtPgV9H67vyS/AoB4a8poTKMUH
	 UUZnQAg4rMH1ew8e44Lge/21CFtj9+dH5A62zwrShPuS1CP7MvZDeSVRu3ppHu9EMd
	 F2pTMjc0NjUnYAZ11eF0RPPKBewVPPqre2MAAVAvPZe+R7PPrP2PLuSRdK/C3fb6Zt
	 pWgp4/OMb0PLw==
Date: Thu, 10 Sep 2026 07:29:45 -1000
Message-ID: <35e5c7afa2d90310ceba68cb1c5064c8@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 pmladek@suse.com, marco.crivellari@suse.com, gustavold@gmail.com,
 david.dai@linux.dev, kernel-team@meta.com, tj@kernel.org
Subject: Re: [PATCH 4/5] workqueue: build percpu pwqs through the attrs path
In-Reply-To: <aqKCaEe5mcYjv6vB@gmail.com>
References: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
 <20260819-wq_realsplit-v1-4-6ad3c3f48be8@debian.org>
 <144b3dc986135ebe34f671cdd02bd8aa@kernel.org>
 <aqKCaEe5mcYjv6vB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Sep 10, 2026 at 03:13:15AM -0700, Breno Leitao wrote:
> Sure. Would a if() in put_pwq() cause harm? This is what I came up with.
> Any chance it would be acceptable?

A failed system workqueue allocation hits BUG_ON() in workqueue_init_early()
anyway. Please use BUG_ON(!pwq_release_worker) with a comment explaining why
the failure is unrecoverable.

Thanks.

-- 
tejun
