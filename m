Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A538DC71
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155833; cv=pass; b=hhZw7RZHwLfH3q/i79a6Tz3C6oCd9Zq/ZXpeyRAFt5J/9pWRFYpb2/qGWzI4gcW+4wgqwvoboPPLwq5VzQxTwQMHa7FytZ0nYW2Po94GN1xRl/BPB1zhffaQJx+B1Sm7Aehs4ea8SO98/p/d6R6lVIicO9yM7pUkZ0wm/HHbRvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155833; c=relaxed/simple;
	bh=yJOOToxkAkkDWuxX+DQ8CmAe8YR1dGRhzSMXe+5DDPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCyLKFDRgdoXj7S9wtiUHJ4Bt9+6bF4/dy7Zq25z3vYsqL04C3i1ESzA9pdM/4VRPLJpsSx+8Ej6bbgSV1vBCuab6IbaQx/5ikR3vQlaX/A6AUledk2Eba+y8MCP0l3LqTppscxF30YLKH+rkLGBZ8202dOdSxIp+zqycsMPpv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKeUjK0W; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKeUjK0W"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b01910b499so2818706e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155828; cv=none;
        d=google.com; s=arc-20260327;
        b=erGX1W2gdBNpeGY2CO2E4LX/FNQRNhBuywSko4ERTKfh0zyEizRrTqyTuX1JlHy7uM
         P9SFZl0HflIc0HpHTdD8Tdq5nYD3HnOncM2cBUwEIAkiU/NplLDJ9Iu1lJdt6zmYvXrI
         +DwU2qXUZJ5CzXDfrgse/zoVFvf4FEP4Xi6hUHbisPkex3ividiK1U4c7HcKnfLTP6bf
         1SkpyUWnIZl64gVW4Lu1z8kk7awSBEhlvpEZu7DwcFQouhP6hXQayzYHRugijoMSqjx5
         dvvPIkxqfisOndGcfZ8Dxj/W1amI0Nsq5/go/unxyJHtFrF6elKCnxNXj4i4clHWAnkx
         pRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        fh=X5VzvW2T4fVuQcXPXX+7r6Rt0iRo4uM1XdzBwVlttQQ=;
        b=bbbX3yKvZRowEjPMCaeKDDpebrvD7yq2fkowVFAhpqJ6SPU8KTbiaPwMr/SBlbgXp5
         xtoNkBTZXV6REOTRrViiIcKaWeIkdU5Mj8jSxprWYnNtv5F3qFaEbH29uT7wKJa+OP91
         jGM3m6VY2612WQhqKYn9cTaqbjTf+JB5rBVhdE5BMgmSB2LC6f18Sa9FdDguPsHZzOWI
         5F94wfYRVwBkk/XYAzK6kU66tpJh6D3ekm5/ekbOQkvQ/IIvZPh3OuYeA3bm9ftI4nyC
         s8jiCzkReZ6WSfOk4+hVIiRuEcCb4rVvZRWpAJpATuWl2LdaqR8yEdL0uAUNGoy6AEHu
         mUrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155828; x=1788760628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        b=XKeUjK0Wz12iE7Zf6P93LQPxUcocZmfhcCR3rvFhS5pco1GsH5XcFplLPyFRJeezv+
         6OxcC2NNXiVjLVrz0JukDIlB6cE0sX/x9m9/E96gIy2H6aniH5L0R4WZre2/7WhyxRWx
         a7THdAAYkV0J2cG2+Ycz0pCdL6AP9TgWWHkXicdPTDT+cjnNWQwAWB+74bCBNPNta0l5
         lKdQNu+5Hb8xVzyjwC7188rYN2gF8OcG93gjEX57ZcyWXZRB1gnwtDNAKj7hMDu94Sw5
         rARoq8YrBh1Du6tFMd/sPktXAaou/Qv93QBK/CV65RpKfVI95w3L02VHH+cq4D/f/AxI
         8p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155828; x=1788760628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        b=DZjmZW5Mo1/HWOPa3s31THP69zcsAG698zBXrnwCP9kV0CcvpLATsIocnVi9862yER
         1Nf67gB2ZSr8/Zt6pLBJyUJboyfzpr0GIYi96NA3yRPLByPdec2ieavGw74COk7Iyd6I
         m7o0RkPXEgLXypfCwDs5FUZ1rulEGFFjIS5EUiYFKeOWvfViH5WjGcQuR33XI+M4zkPy
         optuxq91RMPnhNnz8xG6E1dpbcwWMrCAhwD6NsyVfms/knpvcSq9uoeOCK7YATpk/lS+
         ijClbH2HNm+RdDfZBDsNJMWrODngB/l2Rfycg5QUmkp5M/M9aguKS1H1rAq3plJwA9TQ
         kAIA==
X-Forwarded-Encrypted: i=1; AKwUvByt1aDJvZ4JENE27CRPJM8O+E/i3OGuhG57NIQXwsJRIYRn7jse273jeixIHj28kltT03HsSWOg3gAuKH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmvEgllh1JwfAEUyGGmJ0F44Mhx+pNqpdYUAE+QkXKL9l1CQeb
	CXC+IJ4tbqnDAn5hJz9zjrZl4OYDIHmslqe1JyTAFeIb4d341Vjf6yfCtuDGM98jM99g964s8hh
	c+EHm7Xy8g46OBreNSAK1i7Rd3U8lR0k=
X-Gm-Gg: AYBFou056Z5Y8W4O4ro11hkGd4NioFMrlm/IybPTcVTQdy2gTsmezfO1ZmMLdBBcuCC
	nLSuxwEmxvELFKqXhS7yurJwNsNno5RjZsuWYbxwf4oPS6S/F5MAtK8/r46sA2WWIZaaMUhIXYY
	Dk1PsTyiXlaBo/jpm4Hi+ILu8+CJUv1UJY62AYMXThaNIrJSTTxhFazUV1SYg3qKjyzB7ZVZDfP
	o8GlyS/d7yGOYRwV4IcK9qmJOANjSHRFESTDXuKjlGbQ7cw7MEAT6qnLC+i5H+CDh7/T5vHSaBo
	Y5Gh/r6/iglOF8THgdv76xOKS5spsI9U7bfsrTXj3vWl
X-Received: by 2002:a05:6512:1055:b0:5b4:5a42:ab3d with SMTP id
 2adb3069b0e04-5b5f61530e4mr1709713e87.8.1788155828153; Sun, 30 Aug 2026
 22:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828061607.240845-1-zenghongling@kylinos.cn> <20260828061607.240845-2-zenghongling@kylinos.cn>
In-Reply-To: <20260828061607.240845-2-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 14:56:54 +0900
X-Gm-Features: AcwNN1UEO22loL_9cAauGdY1uAnAW-E3bmZBOHdEltAmoHBEhjOa9i53okdSeAU
Message-ID: <CANFS6bbNoXUMBzAV2yAdXSgBD-VaP8_bxY7f-E56qQdNkpX5XA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:16, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> ntfs_filemap_page_mkwrite() calls iomap_page_mkwrite() without holding
> mapping->invalidate_lock, so a concurrent truncate or fallocate can be
> in the middle of invalidating pagecache and rewriting the runlist while
> the write fault maps blocks and dirties the folio.  This races with
> ntfs_attr_fallocate(), which merges clusters into the in-memory
> runlist, drops the runlist lock, and only afterwards zeroes the newly
> allocated clusters on disk; and with the punch-hole/insert/collapse
> paths that free clusters after truncating the cache.
>
> Per Documentation/filesystems/locking.rst, ->page_mkwrite() must ensure
> there are no truncate/invalidate races, "usually mapping->invalidate_lock
> is suitable for proper serialization".  xfs takes its mmaplock (=3D the
> invalidate_lock rwsem) shared in exactly this path.
>
> Take invalidate_lock shared around iomap_page_mkwrite().  The read-only
> fault path is already covered because filemap_fault() itself grabs
> invalidate_lock shared on instantiation/read paths; only page_mkwrite
> was bypassing it in this driver.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
