Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D274C226D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951509; cv=none; b=gfSjNGs4gybk+O2l5jNsxO5Rcc3qi7WY8CYvRSAMojGkvveZI2Nxejx92GBTqAw7bQgCtRNwax2mILbavR5W+4u9utmGq7MLjmx+boOXWgeYCwWcyNOgeaRAiiUyYF1/t5VKff9vOgK0AUsKCyB1FXbGipD1D88UVoRUR4ZF1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951509; c=relaxed/simple;
	bh=fNt4+C/Jemn3Y22Z1OBgTZ1eIobkHZtRnqubE4Txtx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtrIWAfVvGH+67HgSPfEXl8kpnnN11BpuMdYfS4PW8b1MVv9dov9Dp9o2i3t0N40rQhsjOxhOhhZj2ioZxrSYjutxQO/9+Dw7KW1H8PHY/PlO/aQ8NuLTAmNLXflTTDaj1Gn44MZiZT36jAiZIgmzXovQsXd14sS47eQKAbvTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Idp0gYtp; arc=none smtp.client-ip=91.218.175.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Idp0gYtp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fNt4+C/Jemn3Y22Z1OBgTZ1eIobkHZtRnqubE4Txtx4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790951504; v=1; x=1791556304;
 b=Idp0gYtpWGYjkeXNoo2wSF64iZ+ABrtlm+zTzmukcdlYGUGD20AgHIZ2R5cLWjcuIOO90xfA
 zAXUJEg/TWWiEgg3slZNKwIciBuuNgS+d/3RrLJ8xdW1idBEvshKFeW9k+LRWcg9W/tQKqjBhsO
 OfdF8I8dgnWCbND9DCT3IuvLkPKe+pp3c2/ToGsI2RWL97QeZQ8R5cOh7H/sE40iyCfYf9Ut9Y9
 Y6itqu+crvznq/jmzv6VZ5rmzXcIenXnBfJR9+fkqh4k4OYXRFcQJQmyqsbcS8xPUQb2aZKRe3v
 lpLM/QULvgC4wp1TFh2BCS15weKaZGsOlTa0KjLHUM5Zw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6bffca1b5471be7;
	Fri, 02 Oct 2026 14:31:34 +0000
X-Mizu-Trace-ID: f6bffca1b5471be7
X-Migadu-Flow: FLOW_OUT
Date: Fri, 2 Oct 2026 22:31:25 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
Message-ID: <ar_APS7UG25kXXYH@wyuan.org>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131020.266120-2-chenyou910331@gmail.com>


On 2026-09-29 21:10:15 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> The English original moved from admin-guide/ to process/ in
> commit 44ac5abac86b ("Documentation/security-bugs: move from
> admin-guide/ to process/"), but the translation stayed behind.
> checktransupdate.py locates the English original from the translation's
> path, so it currently reports:
> 
>   Cannot find the origin path for
>   Documentation/translations/zh_TW/admin-guide/security-bugs.rst

Yes, right.

> Move it to match the English layout, and list it under "Dealing with
> bugs" in process/index.rst as the English index does.  The content is
> unchanged; its :Original: reference already points at
> process/security-bugs and resolves the same way from the new location.

> The translation has only had mechanical changes since it was imported in
> 2021, and the English document did not change between that import and
> its move,

Hmm, is it? What does "mechanical changes" means? Does it mean small
changes like typos, format, and etc.?

Maybe I got it wrong, but I noticed that the current version has quite a
few new sections and additional content, though. Am I misunderstanding
something?

But I guess you might just have made a typing mistake here. The diff
below should be fine.

> so the move commit is the English version this translation mirrors.

That's right.

> It is also the oldest baseline the tool can use: checktransupdate.py
> does not follow renames, so a commit from before the move would make
> it fall back to comparing dates and report the file as up to date.

Right.

> update to commit 44ac5abac86b ("Documentation/security-bugs: move from
> admin-guide/ to process/")

Checked, and indeed. Current translation is aligned with 44ac5ab.

Thanks.
