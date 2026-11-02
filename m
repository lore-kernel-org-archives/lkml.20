Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793627923;
	b=pzGYiBs7histAcUS3gSo+fk14cPykXj85Y7hpjq5rQA4F5rJ3De1Pzud4WhYYN+ztApc
	 /953hQqw3H4Zx5mRUPHylrXkJhD4JwBwXmmd8HpM1rsR3VS9X/536UpqmcwIApHuw817Z
	 hWPadaOQ11bhfeGOaVi+C/dEzGJeQ/Mj4aA3CIwIB0hZfTUY3SZwn8/ZfQvjw/viki+bI
	 jyzLTDuh4QeDCr1CS7LRMEDhDSblJpEUSLMcuHAGRtRdMSUAdIdnEle7TNcgk4lJbn+8P
	 oJ6njvlbf72Qg5dLCFFHQnyN3/zVYvFMWVI9JH2Mjp85R1u177zj/XJPq5ilfuaqFWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nJ6alN4H3+Zgsia4c2nyz/5yJfYPVV0Oy8Rx7dpjduk=;
	b=L+rBhQWwrIqhkEFD9nGxiKEjz+fYYOhFzNdp03hEwSON47tHzQIpviZai2CobDnXzee2
	 a3P+mQD0sziqaDYOvblodWf7ttNignrqU3zuIkkhxhFIxtXOVX/93Q2NGqRjhlRP+aAh/
	 0m8m53A5cy35jWWCcr1KtY0V2/IgIO9WMczs2x7pYjkxPr6MnQ7wNlnWav/pkfLjk1kyj
	 gk3+RhYinxDWSk2AIwdw6KxHcexhIaz2Ng/EDpr7SAdzsCmMgXwNurP6zMWzRa+lwZXxS
	 AR9QMSViBKloGNAN/kdnU/sKwEO1CB/7sYYKl/jtIAtdhvSZHo33Ga1RjTV9TZaCyEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG8lqduC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4060A381B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD4060A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG8lqduC
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2eb4a9a580eso3217495ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793627923; cv=none;
        d=google.com; s=arc-20260327;
        b=LT71ZMBWY9rGl/kepIGHBk53nd9xSITk84TZbFNnwXi57Ryki7R2ee0hfAMIeWebfy
         Zm4YcksFfAfYuzkayWLupvKgcPNFluzDEU9blf2OR+bCqkavPzV3Koe9bVGS3tiTjeE+
         DnV9lbbh2k+JCgjZlPKThv9wK+8EOAerAh1kBfwQz2hGCyTtltlKhZfCk8WK5ZHgLKDh
         fzbqicc5C5cl8I+t4/27o10W87bK28GOcFZml8h3bUynb45IfPl640WCbQaTC4HHhCB8
         /rA2nc8zqQ3GAW1/GI5kAwWjs1pOqCFYfA8BGIdkb2IUuoYxEjl12cXUWadUnDAUlkf3
         5IXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nJ6alN4H3+Zgsia4c2nyz/5yJfYPVV0Oy8Rx7dpjduk=;
        fh=jfhU2Vne7l2qkHOJBR+eSq8FTfFlkBT0wkxlO+5yJHE=;
        b=ipqf/QcjVC6s9G4ysOg0SHDTh+RuFQu8VE9IlGeck34JWUSjrHdSbkTlilMvmbDVq4
         GqyRecIGrnOG6O3veMDHEzudQtl9+0DW3JJBaKbkuaD4roMIm1FW9jTI9dNkIA5gG5GT
         d3s4bjx4QVRyb3gVnfJWLzExO7RzPVE2FTHGx6SHCTTLVpBRHdFBV811HJ8y1Lb+9QJW
         Jg20NJR27qLRTBc6v5E+4EQG8GkwWHY3JpnmyDn5NIil9AWJ7Cc/WlsXeodJ22L9cnzP
         JArWAntp3nOIcJgnuaDm06YXDZiwSUqBmsEfRLWuhncrpDQNxO2hkPVRZWU7HD6OYXcP
         XAcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627923; x=1794232723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJ6alN4H3+Zgsia4c2nyz/5yJfYPVV0Oy8Rx7dpjduk=;
        b=UG8lqduCFcmB3GSi/r0rOsIoNN2nxFVMA7ZH5ulYFt6RGY1r53oTxHG9LHwaNhxjOf
         YEncyQ238K/UZt42Ca2v+1V/MXMseWNOaftVqk9oE4vjL4fFmNS5jb98jjBzC1ksGcxS
         VUgAEQkQz+kv6hm3IfKGaiHE34sbhuwGz3FTfj3GDIkP1/Vd+JXsY5KPIk6+jB7ny+bG
         +P92D+eJgIYL4fDKgg/88fyPkCR5m0skYI+EMtpN9zN/vLgjwkV8l4bnCvb8TuGT1i6g
         bKmxg54r41eM1SNeHcJWSeAAsnxaHt5dRIl9GnPJG2omIdSEZVIHCnZ0H6a6YaZrJe7U
         BnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627923; x=1794232723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJ6alN4H3+Zgsia4c2nyz/5yJfYPVV0Oy8Rx7dpjduk=;
        b=UYRrfpnJ0zniTlHlHyzhmGK668OOUrCbz6M/sXfahCpGmpflmJ+ROO/sle1NDtv6Mc
         pFfjr01jnaM/ORL7lDaRgOI4mVh8MRKARnmRbUhIuWcNPZ/lONETzNNlcwtFF8fSJK9W
         D+snU2HVKmFB24UreuLm02f87cF2uT6HiFFj3JQVXc3gLwTtdJPt55K8x9uaqzHrT4me
         ICiunGQ2CKzaLNafQqGtUuI6bRw/WtADWb7GjEDnFSSMx7mkw7jeV4YQITpgf9S66seg
         KtgmxVZH/j9e+rP1eFr48W+LLe/GFxzF6GLfjeVxxBhZmL2SdkkvQC1wErck4mOTvRmu
         vF6w==
X-Forwarded-Encrypted: i=1; AKwUvBygPElMTYxAxraqlD/Im+xRZ91cCmWvuKaTXBPUHf6haq4sFwnewh8bAKYIEAk/r2hyN56UYLH4v2yt22c=@vger.kernel.org
X-Gm-Message-State: APuU4Z++C6XKutoOZ9M5PucFDIFu2Yuiny6AkMDot3LECyLDw8XmbpGt
	BgCITF1ba97Qgml57RCVRcYynoac5OnxS66sJ8GMQaDEpIKBJwlFvjkHVKCMO98PCjcjm9inXXT
	cOiRcgrQpRwKxrJQ2gaZPVipiPjcMsvs=
X-Gm-Gg: AYBFou1EfALdR1TECAmgDXcZwVkUUqwHLhV5/oTIEKBiVV1oDu0GAIUkY+OMQzT2h5o
	WA1ZYO733xf6Z8GbsMiSwdaC4Nn3iXQQAaOVt3ZCcllCQHch00xh8k8F4TabYR2ZCewA2JyCdan
	Tkl0C+VwG8YSenZ9XWp0AXZj9+CNibu0ciNKcHHg/teMy/7yEom4T4m/MQGq13mU45FTaPTifEL
	MbnsmqzJB7VgzejJcHsIQsld7mnZ6r8V0XwSOM34j9Ek2d21/aiTnSojhUTcQ7Ku3/k4XIWrIaT
	kmhRVszHiMkpYjGplcvahI9XWjXpOfsdKbjz3hG1DJ2rNL2VfsZFuj24HDNS/zk2WVyP9Te0GRH
	uXcoEwF4Pitqt43ZSp5BC04ph9xADq8U+W1h5UJRR7+L5wcUHCADjaY1uNVmPprZf6IrEyUGDka
	W08XdP4dvixMM2SVYsxKP+ZSKkuvEtNaxgyI13lWFmWg1N
X-Received: by 2002:a17:902:d501:b0:2e9:6468:1ff1 with SMTP id
 d9443c01a7336-2eb3648bf2cmr153268595ad.2.1793627922776; Mon, 02 Nov 2026
 05:58:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGxFSwnBDM93ouN6Aq2ppm5zF1h19XE6NJ92NT2UEhMP1P4xEg@mail.gmail.com>
In-Reply-To: <CAGxFSwnBDM93ouN6Aq2ppm5zF1h19XE6NJ92NT2UEhMP1P4xEg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 08:58:31 -0500
X-Gm-Features: AclHuK_W2nYNzhWcT-bUVBFipztB_PsZmQptpzSQo4X8vrE-d5Ne3PfFZ8Lk8pA
Message-ID: <CADnq5_PyctWJK2k4-CutYFNPkuMprmZE98d2JjodBQkTLGJhDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add firmware file fallback for APU VBIOS discovery
To: Arnaud BERTRAND <arnaud078@gmail.com>
Cc: Oz Tiram <oz@shift-computing.de>, airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:07=E2=80=AFAM Arnaud BERTRAND <arnaud078@gmail.com=
> wrote:
>
> Hello,
>
> I have two dGPUs : a Radeon RX 6800
> XT and a Radeon RX 6800. They both report the same PCI identity
> 1002:73bf and each has a different VBIOS.
> I hit the same VFCT bus-number mismatch on 7.2.10, but with a different
> outcome: on my machine the device-identity fallback actively breaks the s=
econd
> dGPU.
> I patched my kernel to remove the fallback, but I would like to have a
> better solution for my use case.
> Would it be possible to apply the patch only to APUs ? That would keep
> Oz's APU case working but a dGPU with a stale bus number would fall
> through to its own ROM, which is the source that is
> guaranteed to match the card in the slot.
> I can provide more details if needed, I am out of my depth here.

Should be fixed with this patch series:
https://patchwork.freedesktop.org/series/176969/

Alex

> Thanks
> Arnaud
