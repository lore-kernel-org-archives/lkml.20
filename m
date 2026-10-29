Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793292932;
	b=O82pnf8Gp1rO2mAnXH3DjslZNokHOrJPRzqnQS9Slc0L4o8xFkyw/ovvKoOtqePud58L
	 39SSkqmA/LJcnZZyOgjs3yx6QcpUAvewHVlsP9A1JHu1u6jvd6sx+19guoont9IfWiPqo
	 qwettAxQJuQEvVlizYZuSId7VhhCQBnXFUer1DPVaGFljYEaNr2qiSNrrLjcf2UM20dO6
	 1HTXZ2bWsbBjXmZcNojnN1W25wYi+hiimkJ3RMvY5M5wiA0Yju5N0LapRoZkeMVUp/Qlc
	 zHRZJvxd7b9xq94ioT/+2cV9vPXFVoVhrRnqyWiKJ30sVDSMTXXBUfpvHcIVXZt/TaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292932;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Received:From:In-Reply-To:References:MIME-Version:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
	b=ZdoI0z/8WjcCZKxi5ZZ4/r+Sy/GZJWNIvnonVQ+FA7qdBKUKepn/Q+4P3Cc7MsuGX0w5
	 lcDauXQEMC4bhwskDlAwHJ7Fn4x3X+mwxYb7wz2aeZ8KV21Nq+l1oele6wVi0aADzr3yZ
	 dtgm471u7dr4jZZylQXKtMo2pcw3Rj8B94YVENe6fkMfUVOX/OvbPmMLC5JXytnOCPKJ4
	 JNMEMO2292Yr82YTJdy+lxQeJpQ48uicYcIehf4SvPawBN65NXv0thaOWez/nxsCjcxvA
	 WsZ1dCMfUSehOwWxmNwQ9R+z53GyhtSZbqHJcdmGvWYJ20kGbiHz8LL1zWeZw1u1LyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RhlV2mA2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k4loJjiY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3926E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RhlV2mA2;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k4loJjiY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793292931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
	b=RhlV2mA2079QE8KGFWHDWxyHgvTa1V7KLCMFbGfYjQLmoqrFLrDf6peIwYAp1I8z+dCkbM
	DVBfVI8E/JVazf33ezs84DVdIjzJKcY0AwZ9VukHGHxaJhR0rWb0+s00jGtvBlr+F2XirC
	XvmmUlheQvgshdurmcCGyEHgeJiFpTk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-YaOJtKWjPTG7c60Mhby9Zw-1; Thu, 29 Oct 2026 12:55:30 -0400
X-MC-Unique: YaOJtKWjPTG7c60Mhby9Zw-1
X-Mimecast-MFC-AGG-ID: YaOJtKWjPTG7c60Mhby9Zw_1793292929
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so555984985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793292929; cv=none;
        d=google.com; s=arc-20260327;
        b=bw5aqqn/NyFlYVD4C7wfyRDNkmzP6uPgMSFJMUOwQAnSCd5S19Wz/Ib/BhKpYXY/Fg
         ZB1irD3S4T2/fPvZdqnDt02ZYSca1CG+h23y77OrlHeAY0lL44hTl0iIxmHWVtqWwm9M
         aPD/pTUSf49ggPi0MDVAxHBG9+KXe/DdfmQDvnEQvdaLLj3ukqR8FY8VA/ej0Al3Dxda
         CyBpNwjvl0DFnsKLsMcKLJgcqnqTrwaLygkRlUY9viSBaXTUtNl0rD+5UTeHnIYdTwEO
         X9P5l0bd0ojlWQ7xiV8ZDq2v774UbWOynWbLMvhNLzO3CfJ/V0NKaGc3NXulDZ2vH0CP
         Uz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
        fh=v01FAU0M0xwIPoYBg0aVWt1wpN/NlPnRBNCK+2o7oYg=;
        b=N66a3Zfk77SaD8MvE0VifFl7uk1d5wTZ9viuZbFbD0HNZtetKn4oD3D1u8VRYCfMFj
         kT6MhJEbEdi3B7YA9ikZEY4ktSg0iT6RKDrXKdnjiNnJ5h6ax9Qf20RKJnSUefSYWGQ7
         yqLp/JFDaety+n2knv/pyZiMD+rlY6inObQfEDAsZnSh+4N3qRpGy8zCqGZzfrqiqcQG
         MraDajLbdIi16Yzyk+O+Uo2dNg0v4GGAH1wpuCmUiaOS5Wb/5dOzggQQTeoVgVn24yNR
         m8ppPjRa5tUVwEcw4b4GgHFgPg7KF0Lh9tFE13vrNr4/Cv8r71JNR4fEn5VCc9wjuHSl
         IE4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793292929; x=1793897729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
        b=k4loJjiYuPsPj70mz8xAQiOcH7lPyg94p6jK3SllFObC/N/YQ5DcZOyeymkHcPGTCT
         SmPrvjYWw/GzsmVN6Z2ONecvAiPUdMfvH5E8DBW0D5ypPgHidYgrwS4Ckqh1g2q3ReSO
         f5xRjSUiYvVF1Tcd3NBh5H78zoB5wEZ717+Plw9UvXZxvDqj9XA8UWrmhGGiHd42jFvB
         l2qWA1x9bS5ZyWNalD0dM5nmN0N5ccxEiesOagFI/HOOhR689hGy+TabBO5zBqMwf3wY
         ZLR8thr20iOwmIalPt9giW0sQJMtkolDhwI80W/R2SBs4h3hczloX5AK6CxY0xeAG78K
         nLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292929; x=1793897729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
        b=FaU3y8VIL2d+uXC7gqroNxR9rhRjVUCpMWkVZHG1rQZpo+3TkMr2aVYbXCIJcu0+yR
         nObb8TAt+jj2DfQo1W9lOaRAYONSMwPXAXedMXbN9FLPVdzB3qzyGrKn489bORDpx6Q4
         t0jQk7JKqt9MUtf7l2yyZAaO9eDxoxRvaDmvO3Atbnz4a9I8RvQP1LNGWCN2a4xGhvNz
         pQfpyrfB9mdG9f0GBWTFnOIut6lU3HJLtboypIUPBTPQqT4lH3BiIM1c3E1iBurtIxaY
         hVB/llLJf3MaB0+ToRnJPlxaEBj+YEXpgBy7lOSBclr+YA3RFs2aFHQ+Fm62+M7opEmS
         rPnA==
X-Forwarded-Encrypted: i=1; AKwUvBxy7Ycmi6oQPiC5mskQarE1vRX4F3UvYAPUShGPKlCzbREEYb7eBiDERC2bJZOqtbNU+36AAUfkRllT8x4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDVqgD8zdqIDY9WdU46WQyGk0mK8IQp+XohhUU1TN9LYM9sw6Q
	5PMQYD11dZ2pN9rPMrGvAUOw8lth/dkUUti3wCxYk2nM1jvjydYrsbUS7eFx57uPGSrGoqESROt
	Rs+PUyQBuH/LO6XtsF/GIx0CI5iJLKtAEp1dszCfyb+1VBRDcvZyddQEZWTovCllLaBT/x+5zy7
	g6Ahq601QCkcSPW9oBqr31BEg/VwzJmzdhirQVoGku
X-Gm-Gg: AYBFou2swngJ8Bk6ouGwVYQOYDCuHsR+lgJV73s56+hduazIS1lDU2giaitkQcybpUB
	ig8DYaiQgiP5VnxoxAuSqTfd8IQYvF9PL5JsN6jse9IBno+iaTYHRYb4KEKGE9LM7sMPDD9Mb+U
	QyljOt2LUjTumm50od0xmyUx9Dhrf1Da6fe5brhzg9QXXEhPl5cHJyKzg=
X-Received: by 2002:a05:620a:1a27:b0:93b:ef24:bc8c with SMTP id af79cd13be357-94408cde203mr957070585a.47.1793292929311;
        Thu, 29 Oct 2026 09:55:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a27:b0:93b:ef24:bc8c with SMTP id
 af79cd13be357-94408cde203mr957065685a.47.1793292928789; Thu, 29 Oct 2026
 09:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 09:55:28 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 09:55:28 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <18f0bae1-5cdb-460c-a147-33cd1fa2acdf@leemhuis.info>
References: <20260804140403.16337-1-kfastov@gmail.com> <20260804162924.0268f80a@fedora-21.home>
 <CABWhNekebS6dt=Ft+74iG4YpCq-5ZcV1EvvERNxT612VUOC9Ww@mail.gmail.com> <18f0bae1-5cdb-460c-a147-33cd1fa2acdf@leemhuis.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 09:55:28 -0700
X-Gm-Features: AclHuK-xgAN_fR_dbuTYNWejWEVdFE5MAwn_KoUGHzvKxdpt-_9FR1Wg7w13_Us
Message-ID: <CAAiTLFXd=LK93e=f3PE1f6y5m15yVknqqVNBei5rLz2AnSJ4pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-shmem: Install writable PTEs for write faults
To: Thorsten Leemhuis <regressions@leemhuis.info>, Konstantin Fastov <kfastov@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> [CCing Paolo and Sergio]
>
> On 8/4/26 16:57, Konstantin Fastov wrote:
>> =D0=B2=D1=82, 4 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 17:29, B=
oris Brezillon <boris.brezillon@collabora.com>:
>>> On Tue,  4 Aug 2026 17:04:03 +0300
>>> Konstantin Fastov <kfastov@gmail.com> wrote:
>>>
>>>> Since the introduction of dirty tracking, drm_gem_shmem_vm_ops has a
>>>> .pfn_mkwrite handler.  Its presence makes vma_wants_writenotify() true=
,
>>>> so vma_set_page_prot() removes the write bit from vm_page_prot of
>>>> shared mappings, and the vmf_insert_pfn() call in the fault handler no=
w
>>>> installs read-only PTEs even when serving a write fault.
>>>>
>>>> For regular CPU accesses this is transparent: the retried access fault=
s
>>>> again on the present read-only PTE, goes through wp_pfn_shared() into
>>>> .pfn_mkwrite() and the PTE is upgraded to writable.  But consumers tha=
t
>>>> resolve faults through fixup_user_fault() + follow_pfnmap_start()
>>>> perform no such retry.  In particular KVM's hva_to_pfn_remapped(),
>>>> after "successfully" handling a write fault, finds a present read-only
>>>> PTE, treats it as KVM_PFN_ERR_RO_FAULT and fails the vcpu run with
>>>> EFAULT.  Observed as AsahiLinux/linux#560: muvm/libkrun microVMs
>>>> mapping virtio-gpu blob resources die with EFAULT on first GPU access.
>>>> The traced failing sequence: [...]
>>>
>>> The same issue is being discussed here [1].
>>> [...]
>>> [1]https://lore.kernel.org/dri-devel/20260804120529.1730187-1-pbonzini@=
redhat.com/
>>
>> Thanks, I missed that series, I searched dri-devel but not the kvm list.
>> Paolo's patches 1-2 are indeed the same fix (down to the same function
>> name), so please consider my patch superseded by his series. [...]
> FWIW, it seems that series takes a while to get polished and mainlined:
> https://lore.kernel.org/all/CABgObfYgZ87%3DW%2B6E%3DN%3DWwTuyYkaoKU3hqd84=
JDTSAvT3_9dh6w@mail.gmail.com/
>
> To quote: "It ballooned a bit and getting acks from everyone involved is
> hard... Either I or Sergio will get back to it."
>
> Is that something you/AsahiLinux/the world can live with?

Asahi still ships their own kernel with downstream patches, and have
backported Paolo's series. But for the rest of the world this is pretty
bad, as it means anything that requires virtio-gpu with blob mappings
(venus, native context, etc..) is broken.

Since the proper fix is going to take a while, I think having some form
of interim solution could be a good idea.

