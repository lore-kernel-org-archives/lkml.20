Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715191;
	b=m1er9Ftd/OALDLCSLBIKpXFfypQPpTFFrctVKzPSr4Uyl/mFibFNU+cxazMRxbSqSeWE
	 P1lCNwqmvk4eSAEEPtfzCZlB/QMdFKnP0RNYWAXtN3KP5NpHCBvS+FsMY8SNDGIuRoaXK
	 nshkB6ioG6Zx5DVtw3oO2KqEetw1ib5TmxyGBaK2yosx8d8iBWa/ex3Dzn1t4w4ifmLqS
	 LQjGVTlvT964vRICjgYft0f1MJ9KrbhDPr2Ewktyc99HkuUEXUOR1y7IPzceeSpaTC0WA
	 Hbqlebu8jKIeTwi9eT3yITHHgpPYlQ29bscbnvNK6lgKu0nHRG+L7FWqTrN3fQZ6Tuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HL04h1yc9M4hwxY/BxNlJ65GkcTfjvC+va5ivgCWeBs=;
	b=3/zuTksgW1HFIUOOOq1Gh19D2MIKMLeR15uotL5Bm40zc4JbmhAGrpAeAcYt2IXci1sK
	 AwtWNuN5l8RnF/dQuieRiFOtB49jEpX09QofpoGzdbQ6wsEUpx97QEtpMXIDn9AkJDV8o
	 IKsFloC4O1+UBBzc5WnH/Racuz/RNEB3t6G75QXJgVhFRinq0DmDhehNVf5sBYC4uikc1
	 YDkLBVux1BBuXt5UTmPf8qXWZO+LodRJi1/LHLKG7sUNyVdm6rpM52NliS7WD2EHlG3Fg
	 pQ3SlYYL3bWSDrvveFws+hQ0yChidtt5/uqZuJ8qDd7tfhT23K3umWZp7xHtJrfc4Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APtZSFjT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A2606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APtZSFjT
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3ac4f373d3bso29405321fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715189; cv=none;
        d=google.com; s=arc-20260327;
        b=kpG8jiX0SOvFFe6Rjqc8k0WkWJst033uXKblLhKxCghtlluaeovofXe+qplhtiIAqB
         owYHJ3K0jLdxtqM65hygKQ0Zop78Hk3e/F1Ht7zmi0eBrG0h6SxBnxn2gTTminOzY3HJ
         ItMYDVupHHfn22hcvieNenyX+pcaTXWjYqt0kjj5c+eMiTIgCDV9Th6FBGON+C33tAlt
         ZILphOCkttwADrjsAUvqLw6/G3VOex5akdfxvmbBwjFfAhqRakLTapWjGvtD/rQEZM2C
         r0qopKwe6VVl04hFnRwD8f9Z+/SPoAGwdiL+YCUxrCHFj647+THMi+2Q8gtxMwikRONG
         NJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HL04h1yc9M4hwxY/BxNlJ65GkcTfjvC+va5ivgCWeBs=;
        fh=BIZFDT0+pIFQBQRhuthKUUNSMvWv6mC5MGudQesacQo=;
        b=gK4BRIxVnHokO5GjkXiFQmZI7xR0wnKdRSgvCRfE5a35I4XC/QURAPHvmAnsgdcqm5
         tmqRDM2gEp6OgPQf8mrGNv/s1lbdPOLoTSGo7V+f/4x4OvnaaI+glSlaVD1l7TNv9IKJ
         y/NjvmBNzXbNS7/Bo8Bkg05g1jq30mlEJrs+3jCXRxCwVup4H+avJJLO+w0dHK9OHOS8
         iayZhIwSeXohScA2UM3tGkEEgOmPXDojRzrtPUPabjRWEjP89p7v7a1OzoZ00lGo4Pyz
         xRhR66bgrLh6glHHm8AANDGGnoaNfQ3xTC3Tirv1LyH8pbU1jPHgx9bw1fOyj9fGGnYp
         kRBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715189; x=1794319989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HL04h1yc9M4hwxY/BxNlJ65GkcTfjvC+va5ivgCWeBs=;
        b=APtZSFjTMWO8qjF7GxxiWwzto/kwZF7nZ7TuzyxegZ3QQg47qjf7Q9FEsZ/gsaIbZS
         CvVufX3TCvXgBGLnjkWvSfbo9FIhWjdpSmA0z+Tn1/LcjXcVhyu/s1fj7xEcyb7xxCjf
         ZZ4MsVpybYhKKOjPTf/Wn/RJPmwBBuJOEqq8JR07cUEwnJKfYYbl7qiKVOxrRDOLXCUn
         QDsfnO1A9Nt4oBz7gr322PjtesSZ7D/GkMuq5GqWlDS6O7ZEbQ/jawnq7zgZ8sxtmbnh
         MJfcsSKqWsR1bBzqZvo3vWNrIMWFO222i/3C8XRE1Rit9rybjTP6Th61UvW4DNUHvq+Q
         ntwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715189; x=1794319989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL04h1yc9M4hwxY/BxNlJ65GkcTfjvC+va5ivgCWeBs=;
        b=KCh13rP9EfPooeyNzalpoJ7hAAomqR6dCDgo0OfnSBzMNTORCnKnNsI3Jc2+5mr+5A
         Xo2Qi5R+jcGpJ5RELY+Vx5Tle3kvTYITB6zQ5HAwcRaLKq1dnMRkH8VQy0UTEaVm1mVG
         VMQKzYvLAPe3Mshl83mF2pB+FUubdW3Ls98npqA6xm6vH+yqcouZkajowBeita1cd37z
         RxveJfMKpLvtXF4tpQ9HHvTcborDWi8qRLllj0Wx90Q8AbivjOfSmhWplENrQ4kBaxJP
         I8eT0eQDxz6CUWVfY9Z/pHRSQ0b9AyWh1AJIoj9V4wdXGjblMnfrAGaNHQRXJNgibqlh
         Knxw==
X-Forwarded-Encrypted: i=1; AKwUvBwMAtz4h9/cSvZMVwYH5l0AzJrOJWhCY8Ij5dv0+CjTndJ0dn7hee34XemdIWjNCO8H148e8BIu+FRZYGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DojWSaS/E6g/3/G+f6zaV/4QdXmaBYhBmF/UHy5xBgLe2eZjo
	KtodPe/cmrPtFd9zXuNpaBVjODZJbQyapE+PwARbCRV96GyVqs9nP2MyxnxaRRIc21zbBhZuwY/
	k/scvBSHG6f0JBRfZctjS2CHcYs4BXlE=
X-Gm-Gg: AYBFou0C9ik8DBlVANAgFwuC3DbYHLSmZpNDRMUWfFkQ+PZHbZ9Z2R1pfxvTVpF9nHI
	o6eV4Cawt6ytPer1B5shl7J6knRDJ6dkbxrfJ3gPZdEhD3mpfgWa9wIVGENZJIzPHphlbEs1a2q
	TaZDP9qcv2EXhchXQH0JhQUeVS0fHcW3VzFdnqgYy9V5iXV+Wt5cpm4Opk8BEn0MkARd1egkpTu
	TLRnKyPs0gI6QSX+ILbSMnCziCh0bKncfviDANBDyNBMsywGpvaTPxolUpNAuYk4fvoKJ5xWAni
	ZWo/TrUECiMw0hkdbGx8666HMk9bD0/rGDf68Le5qy3zjotH6hcMVteRcg+lQGNA0RukqskVycI
	XWINk9Pv7oE0ur0rKHo6JXxQ6IBiM7vHlDX7QbCzwHGWPNkvoqC+rbJcIWnWpehWLs4kFB2PJvh
	IszaRLRFtsk15b1GK5Qg==
X-Received: by 2002:ac2:4c52:0:b0:5bf:ce41:7a8f with SMTP id
 2adb3069b0e04-5bfd957d192mr4098858e87.53.1793715188505; Tue, 03 Nov 2026
 06:13:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102150146.19777-1-jianyungao89@gmail.com> <717984c9-a0c2-43d8-a801-d36c18c7040d@web.de>
In-Reply-To: <717984c9-a0c2-43d8-a801-d36c18c7040d@web.de>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Tue, 3 Nov 2026 22:12:41 +0800
X-Gm-Features: AclHuK-MfLQMs5fQ5T8G-7KqHA8RnCDfPbXHT1W5k5aa0ReYsJ56PCXds9stJu4
Message-ID: <CAHP3+4BfTma1tQLbGLzy3aAzx05eR0QKOfmL0V-X5vEeOWtAEg@mail.gmail.com>
Subject: Re: [PATCH] xfs: fix temporary cursor leak in btree shift corruption paths
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-xfs@vger.kernel.org, Carlos Maiolino <cem@kernel.org>, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	"Bill O'Donnell" <billodo@sgi.com>, "Darrick J. Wong" <djwong@kernel.org>, David Chinner <david@fromorbit.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Lachlan McIlroy <lachlan@sgi.com>, 
	Viktor Malik <vmalik@redhat.com>, Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,
Thanks for the review and the suggestion. I agree that centralizing
the error handling paths in these functions would improve readability.
However, to keep this patch focused strictly on the cursor leak fix
(as per the 'one patch, one thing' principle), I would prefer to
submit the code clean-up as a separate follow-up patch if that's
acceptable. I will review the affected functions and see if there are
any obvious style issues worth addressing.
Best regards,
Jianyun

On Tue, Nov 3, 2026 at 6:43=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> =E2=80=A6
> > held by the duplicated cursor.  Jump to error1 instead, which calls
> > xfs_btree_del_cursor(tcur, XFS_BTREE_ERROR) to properly release all
> > resources.
>
> Can further source code clean-up become helpful for affected function imp=
lementations?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv7.4-rc1#n526
>
> Regards,
> Markus
