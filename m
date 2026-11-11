Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794408666;
	b=tXgwa0YAvzdF5v7DixmFm1NRHu/EXLuOB6i2IV/lJfp7Wo9vrJDnLdCETbs+Ny7gbaUD
	 BKVVWEgQj3IreIBNe+xCl/225WRh15X0RqvXSQn1xEl8XZrEBqVfiy4pl2cjxbSggBBIo
	 YiSdPA9UNz1uKanEwSo3J4URPsQvU15SGM9RzUN4G80Wc7cIQwFp/2BXiYQ80CXHxBJA2
	 Hiyidu3q4oxoMbrqfgIfkGm+F1b9pm+Yu0m0SgcH6XMLTYk6NOqOK5Rr+Zg+sA2QTAbQ6
	 v3ZOL81cuRI+9kCfrHNu4Cw5yMiR6xvqV5NvIiNVR3f7vanZJ3+dZMZ0QbSVju1O/eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408666;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=2hu5TpdMLVTdAA0q6U3O2c6TIRIRZWKhs36CHsulp2Y=;
	b=tc4mdczp5la8QRIoAO2G6Qs4vppBatHttGzASqnG0/rM6pIyTHORdZA0SOAnKADHJRWz
	 fYivBalH7f+Qe+OQkty9GyM0XvsjwHvPkDSYTmOgSPglx/fWfq7OtbJ9kRQY8NKQgOFdK
	 Eh4ovf6+jYcwLTFvnSQ1RUSyZr+I+Y3XPH0UQdhcaxP6RBPHxyjXLhAIA3F2957KCGbMx
	 V/ol26pXpibecz/YSPih39QAGZd133QHfRE8d20CHGJ0MGuw2B8LXoGnMOxndm1UI9NzF
	 a+zyXmUfiTuCXl+Dd+HkmvgV3zGugrrGOVmPuEt9F3Rm/OO4Fn0ZVm/K7uf/rsoGZzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GmZ0XR4m;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B1teWHin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E8606A8BC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06E8606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GmZ0XR4m;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B1teWHin
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794408664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hu5TpdMLVTdAA0q6U3O2c6TIRIRZWKhs36CHsulp2Y=;
	b=GmZ0XR4mrCF/5G2oOrASvh4Muy7Ntl1Ixqb9Si3KUnWBuncP1Y4NBsi6SzsSWisxbmEFuO
	pHz8qrdfRqp8bBd/kNnwIgmkmgG0LD5d6osIG/1CA6tRXbzo4md9pcbXtzh+IUlrrMTqWb
	ulGQT0zrSTF5SAmm9Icu5JNFuU4Exn8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-QV5zLSJyN_SIJ3NJ5domww-1; Wed, 11 Nov 2026 09:51:03 -0500
X-MC-Unique: QV5zLSJyN_SIJ3NJ5domww-1
X-Mimecast-MFC-AGG-ID: QV5zLSJyN_SIJ3NJ5domww_1794408662
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c40bbd26f74so298467366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794408662; cv=none;
        d=google.com; s=arc-20260327;
        b=Xjx+H+joS/9ybjPdmEc8boRjpIqAc8lxidQMiekEecdb4bjl3hu1yK7F/iT1unV7GU
         Kv7ETLggWB+yogvSXU15kDIOKPUaOnngshCVK2Pge+zs3G0JPd763BjqMX9uYOzULtWe
         L5QarPFl6rpZl6rfJyTHkh7V3iShLTLFEqE7tzUG7APndYhzISXR23xOuFvY2pXvH+rB
         4P+S1hKEw/K+CFreiEPk/F0UwVIGXilGn/r8h3tmorZqA9ez006WfSyNIQ4PyTUZVHxt
         jB5CU0HLp6y0RR239hr3DVGWNyF4QGmniu28Aiy6YkLHTMiogGk/lrOZXoHDO0uJ4PWN
         Gd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2hu5TpdMLVTdAA0q6U3O2c6TIRIRZWKhs36CHsulp2Y=;
        fh=0ZSofiR1cQ/Qyn1YpZU8WVxxVj72xJgOURXvU0LN3wQ=;
        b=YdgB6VT/kaN9LEumJezHRSqduRnlVcdunY6cfW0E1D4QoXDIN+wowI9naPTItr/DEU
         0Q/U6pGBiJXDj7mdc690oafxjD4RS9WEhSsfbwwppzXbwCUiQS6zesnntMO+ww5Dzku8
         FR286YB7lHO4dqq4F8tvuHDbwEWkWTPwuuM1UspfRRg9dN770EuvF2Gn/FYf9Gf8f7FY
         U9dAY8mJeWnc04ypkUDIYZkaYQz5THId7x8v0VyV4/hzyZd8SPDzlgjWkxlz+eRCkcrY
         wmitOvkjnzKNKsXmFrBNp4bMPBkLjJnDEu1DTCxnSt7mlXGB9mrKCHDuJBWUlIHVL5QL
         2GQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794408662; x=1795013462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2hu5TpdMLVTdAA0q6U3O2c6TIRIRZWKhs36CHsulp2Y=;
        b=B1teWHinaoAB0q7eCy3QOwI0RPrgyFDZxTwxOLKwZz7RzL4XBGeHd100YY1v4ps6HV
         iQFRooZ//QGEP9ltk3ggWqr5NVi+0sjxIjGJUuLMnxer4XzImDDBomOJR9vRL/alNayI
         Eep+LFtKxgYbdMYDbSBa22Dmn3pna12B51QagiGwp1zpE3OnCbJZcyEvtS2QnNJSAflb
         nEeZY/QJievxhxZEFV1Vx2juhRTOxSrTuWCxPwu6BIrihwD/I5U7UY/fjnBAEz2SlsJR
         3AQA6Vum4CpBhApvSKtQ9BqUkhnnK1F3y31aWabaz6dHvz2BV5BacuTySXNE5r5MXL8D
         T3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408662; x=1795013462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hu5TpdMLVTdAA0q6U3O2c6TIRIRZWKhs36CHsulp2Y=;
        b=0X16xZKbqsGwoZ/o/qXpU82DSBesSGLuNDStYpw10tHotRnY8tdn2pURZTQMUCTpwJ
         dJJjGAY4ckJxRsEJu6rAir9kWNbVTJel1aK2y8lyYDp/ZZ3aCHx7hfihP1avdgl0gb93
         OOXcyE6KVgYb86Kp7FjeF1dPDMXzhzBCNxJafFMvnKA+3iKRC4xMy8SfVhro29m20w45
         +SUnzue/uXizOBQZBhx3hmEEDuTyzn0DUfHsNYF+ltxryroViTg8+WOFkRm5rAuhnVuJ
         NK0Ws5k2+Sm24L+D+vcbk2RBcAvW1+/plG+yfj7DzGB3/ysq0RTHmMwS9aiNi36f2RYV
         gHgA==
X-Forwarded-Encrypted: i=1; AL+hErEZlt6vi32jRUV6tWZGWhI+D+UOFdEK3riiIISw7ipGnCHa+zUTOPynv4pSgEExJeqozdChwtGt1yGLBUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvo6Ha9MqxcTWfaDgWhdQmA9x/xsG68l5L1WRh3OSGRq0BvSd
	XMGVHtdlofcV8fI7RWHYjc0LUmp1i/jNuiVA+Z4moCPIOY1tqvJ1kD9I+mlr2BWU64zu+kCAvoG
	cPQjUm9cvYGQ/3LLD8ggwtrbMWkEAbRjeKBXz6OYF0SzycrcQqRwurSeHCnj4ywArWiBiRcMShb
	h2Z5yBJTUIgpvNPLw8t2R4LLKYX1SAW5+RU7GYkp6y
X-Gm-Gg: AYBFou1Qa8fOiP8aTPbzO6kq3YOaZ5lH3UumnZfnekoCcKKzrrQ8rVQIRdGCl+Qjf5u
	gHRGb1VNqraJmCzj1A//NSGhICwjZMUznOhyljw2l+DtqCaTQHG01W1DV4E3dj2Svq0p1xhcQPY
	egq6U+/gFsHaLaxPRbSgy9zA/fWkJUrtZRglkXoMaFWlW1C4KgO6FfXcN/7I7g5D2RHhfQo7jUL
	hqlmP+Vi9e7kfK4DbpJ5bALhOyWwGPc/BmFPBYLLV0Wmw==
X-Received: by 2002:a17:907:3e1e:b0:c50:475d:980e with SMTP id a640c23a62f3a-c5066ca9f9emr181823566b.38.1794408662015;
        Wed, 11 Nov 2026 06:51:02 -0800 (PST)
X-Received: by 2002:a17:907:3e1e:b0:c50:475d:980e with SMTP id
 a640c23a62f3a-c5066ca9f9emr181822066b.38.1794408661612; Wed, 11 Nov 2026
 06:51:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111110200.30415-1-jeff@bencteux.fr> <e817126f-83b7-4450-a893-ac4e59460ae1@app.fastmail.com>
 <avRzKRB2f_dP-xEv@ultrabook.localdomain> <6f26e8fd-6198-4c2c-9702-3b7b8dc73f7c@app.fastmail.com>
In-Reply-To: <6f26e8fd-6198-4c2c-9702-3b7b8dc73f7c@app.fastmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 11 Nov 2026 11:50:48 -0300
X-Gm-Features: AclHuK9bWqPtxsq5yiZl7_GWpS_B8DMo81VBx_AeLSjplhjtXPuSUA6-AMhuzyg
Message-ID: <CAABTaaCAhp7n-yNLMPoyJ6=uYaLjkA82KT0CTG4MGfKHdjMvDQ@mail.gmail.com>
Subject: Re: [PATCH] audit: add missing syscalls to signal class
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jeffrey Bencteux <jeff@bencteux.fr>, Paul Moore <paul@paul-moore.com>, 
	Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:31=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Nov 11, 2026, at 14:52, Jeffrey Bencteux wrote:
> > On Wed, Nov 11, 2026 at 12:18:01PM +0100, Arnd Bergmann wrote:
> >> Why the #ifdef checks? These should be available on all architectures.
> >
> > I included them as convention, should they be removed?
>
> Not sure where the convention comes from, it just seemed
> odd that you have the #ifdef checks for the newly added
> entries but not the ones that are already in this file.
>
> I had not checked the other files that have similar ones.
>
>      Arnd
>

Hello everyone!

It's not a convention. Arnd is right, ifdef checks should only be used
for the ones that are not available on all architectures.

Jeffrey, please take a look in this commit c0d73c09381e ("audit: add
missing syscalls to PERM class tables"). Note that '__NR_statx' is not
guarded by a ifdef.

I hope it helps.

-Ricardo

