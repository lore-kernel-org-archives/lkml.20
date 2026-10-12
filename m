Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663DE2DB7BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806515; cv=pass; b=RbTjl1n8uA4yULoPQtL1hDGLZl63jGNb5Qjg3OgNEe2Ef3wgs4tkJx81WNAQXRJGWCid0grNXax2nTkacqi5LeGvAe8pKegQU0TZTPEDhvwnGwg05fZODSEbT1p19l+SHo49+5u3JalL46Spi0t1dVieQkbmCqa6S2aFSQm8a5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806515; c=relaxed/simple;
	bh=gV5B2sBpBlIQzBgTg+Qlc96+XsC83/hddevESU1nvNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKm/CXjEGkMjdmnXHRAV7ZiWDIEgY+oetro5F/669vUvnUpr4M2heei/57q5HxD7XuVD7dOtQrAANXTKM1EKL/CRPR0ts3YWV0tYYtK653zj+p/jl7crSBpXDPiJIJ9plrmqvP4ax6WdwMxUzF42IxZJS4M49pJmUYv+kN51HC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USazWZih; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USazWZih"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b056d58f2aso10345757b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791806513; cv=none;
        d=google.com; s=arc-20260327;
        b=jwFoQnAmAyYohkdrxhcP4YWpTSFAUSMFW+jqmpx3+VFV5uQIi20ZF16L4tlJHQfZ4l
         M2J7XZrhvRVvo3jeckr16KJbnMt7lR9Z4LYxT74VlrPs4cK9LXd0mJLr/mAyKKO9l2mF
         vy7dVCdT7HbPt/Zt/vDv/GjfylUlCEY8gvUMxx06XAcNFyvPP5JV+dJJSs/8d739Ubf9
         mGYqRWO6S342jI+egR5Fc+eohdeRA1xL+QD0ZHIoM7Sb1iT7kc/mVyfyZTZoIjsN98oT
         12JYcGRWi5gTNjvpC/f8WoN/cV+QyZAlAW+AZ6mcXKHACwDshqj74oLw4A5nOppAuxAy
         xQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gV5B2sBpBlIQzBgTg+Qlc96+XsC83/hddevESU1nvNg=;
        fh=tC50SJeS6VbVjbDNdlSN7tiBN9Qym3lHz3Npb5vafVs=;
        b=h1n4drw15F/cmYMTuQA78BEn8qVya+vH+CrIefGTBPSr0+OAv6B0sSWeBc0nbWExvP
         nuzzm6qTccu1ENXOzn7cZllIA2l6WODPy8LsyHczvLKZvJ8ctKr2jHxRadqbbSUro9sa
         UOLsLUHJyd7mUo6lnb6SLtRW0JBna3wvq/WghvtPOFvjXv8QRUqyi1QkIwinzmIYzHbr
         MkpXx6SJIGLm0Fq4+fZG91SMB6yaJ/RdgbJ37iSDUSPCqpyXGXqfWdSvwdH2VeL4Tzx6
         DM0IfP0m3kiE+OUeUZd2Dm1W6tgh7PssH7/HSllfCDPhgGmQNRRTiOGP5JZrv7QysMHo
         pwcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806513; x=1792411313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gV5B2sBpBlIQzBgTg+Qlc96+XsC83/hddevESU1nvNg=;
        b=USazWZihPFFkXOuRD1xhI4IptdewtwejCea2CItTANmo+jFdgm1oWjhejjod1O/nCe
         xgPO1mrnsLIfn8+GsnZjyFbw+X4Jbf5N9WOSI2SccjTaKPCGgQYTakAbRVcLEcKeozyO
         tR0FqY69C+z9300+/S3Y7fqKv1EZFFaIZY3IQBbyncMeNfcvd66+MM4DOfk5kkrh/J8p
         oJZ9uiYnnLUKVYC1+mli0gm2Wz6+QAZt3a2s6OL3tm+bI0GzN2JWTyV/DkE99UfIsplW
         R+I50F6NKpnZvEEzFuALqqHeJKmre0FCXYTiqFnYJpdjZxycWqU0t043UiEDntgLPwin
         LztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806513; x=1792411313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV5B2sBpBlIQzBgTg+Qlc96+XsC83/hddevESU1nvNg=;
        b=EOh120y3cXLzGNj1yiQVKX0jmTQ9hwOO3IGbnioDrcCVjrpA/f03i8e8U4adhWaNJM
         9soagJbQzlqr2qfqxIvIJn9k4a3d7LBVbLtgMdznJ9BY32wE70uztlKlhRXFjCvwNjHD
         No2v8DWPySPQ9VJ0ptq5dAhgrG/zaBlQnl6+b+RGBd+g1/JxkMSNDLySYEbiWMl1WvJd
         CMf04xZH5Z+bcWwgZJkFfZOE12Jx7hrK2vlle96R4Hv1ldAFDoFy9n33V9LijhWQCafA
         lEbzmBD67NDgADB+RawpsQX9iA3EM+T/l5MJkeqGdwI8MdM9LjBIbUftVuSINaSWHqvG
         mklw==
X-Forwarded-Encrypted: i=1; AKwUvBzg4HfbzaIgXfw+XCGVxSQUYafYmvVe9NW6ZpHHtIr6eqDzFF5UqsEMw+waEd2/J8wm6ATyJ+H+vlyawVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfcqPnLrFkTjPDfsrsA82waSDHmuRBtGmvwgGMKphzzNYlbMAo
	+u8qHU2K+p8c7ElC3nmHIaICCd82BWAndmx8hJRwmjLG4oyeC2kQEKe43kxQz4BxnV23orhWssm
	98EKVtbI1TJIWdSXkO8YRum21qm61G/4=
X-Gm-Gg: AYBFou3YaZ1kWaekFTI/kdTPZDqIpjjmY07TIFnRUQegRj0bscfGnFrV4Io6v247umn
	HtgL67l67zZC3i/Kv7PoZ53mZ58XFpNRR+51caET/OtPep8DeBPt0AeK4FqF5kpSpJvabJggBXP
	0vTQoYrF+ECjdjiavCZlJd+orx/bQRm0pjg3j1ArCM0Ij6ChBjQV/wb8xMx2ud9UQLqZmZB9+qx
	VoYBCwtuBfVQsTiyGynLAsVwB6nlGyZHrpW9i1zCRjBDhl0HPvepRY6mqJNDjwXj1/tsJ29A7Ml
	CU3F4T4X42Nt1ZBF6PUxeH6h/776i3+i27ZyRStVZZ31ATqCeCWL1zD9gw==
X-Received: by 2002:a05:690c:6d84:b0:8a9:693a:324 with SMTP id
 00721157ae682-8b07eebe1a9mr27465947b3.109.1791806513335; Mon, 12 Oct 2026
 05:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0089-v2-4c67f48d4e2d0fc85990@gmail.com>
 <asx3pAlqeVkKNRfB@p15>
In-Reply-To: <asx3pAlqeVkKNRfB@p15>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 12 Oct 2026 20:01:42 +0800
X-Gm-Features: AclHuK9MLaOJLQyfdx9u13-P_RgbYiln9n7RlXoxbs8O1PYqa5uw7ofXstfpRSA
Message-ID: <CAFRLqsXYWo9+ZkdK6xE6Pp1KCanPXmvd-A6-us_NsDmcsCnU4A@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: Pin the node manager module for open debugfs files
To: Heming Zhao <heming.zhao@suse.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	akpm@linux-foundation.org, kmehltretter@gmail.com, ericterminal@gmail.com, 
	kees@kernel.org, sunil.mushran@oracle.com, christophe.jaillet@wanadoo.fr, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heming,

>
> Thanks for spotting this. I applied the same test to
> /sys/kernel/debug/ocfs2/<id>/fs_state and confirmed the same issue.
> It looks like all debugfs ops in ocfs2 are missing .owner.
> Would you have time to check and fix them?
>
> Thanks,
> Heming
>

Thank you for the reviewing.

I=E2=80=99ll go through the rest of them, add the missing .owner =3D THIS_M=
ODULE
where needed.

Best regards,
Cen Zhang
