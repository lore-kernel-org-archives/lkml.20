Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514855;
	b=fmxFChJq7pMbjQIMo3FkNSCiYHTxrq70uT+gjTd+rapmYlH21NDx+QzmwwevnfhkJJey
	 ed9N/jRYvPKcXLQM/fBoUEnAfubyGRsidAK15Van0Mjf8FcTGWCdIfAPgcC6GclkVkW+D
	 0PpflKHm/jDfhk/g9ZtcViEAbj/9bTWkjan1+HvvqwXgNXzb7wS2B0oUrlp/0Byn4WwnQ
	 nPi15Sjc28BOsZqNd27HNhOSYm0bEyrmZ2sMwMMTAEosCPNfXh8DYrXZo5VGaB9W/HY1S
	 SExHF2GMb0jLH9PEcUqNluxXau5igNi/m/0+XKb0SpIQhGEMYPf8j2qHy4tFYtZB6uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=c/OfYeoduBJGc0yF1/CQVvbKOujqnKo2QInGW9Dhwrk=;
	b=Jr4GbjiaIVMuLfNq+GAW/CzG97u32twRnfJj7MKZZ366JcBGGnvlSOGXP+gNjWzbGgB1
	 B5VlE1/1cF7FdYpJb/TaQNfDaSMDxdMqvBra3kzquuJlJsC5vBVgBsuTatHbrreF5tRmd
	 wVxKt+pL6FULFyiqoA3RFG5z0JvxnE3MU1JP+FfM11agvvmnVIQk8ckHXn3rwX54g2NK5
	 J+C4QVT7X4qKkVDzNm5uTWZdHkawIeq5PWT4t9gUKenvCZZJ8ZP6gwuB0cSXMJ1r13CKd
	 DJFU+h3N7IvLY6ds1ohIYwuAxggt8olvXUuDRSwtVtZwXRh890t4xd/iYGH4tVH78Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=olrr5DTZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25754606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25754606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=olrr5DTZ
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46556b9e02cso649722fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514854; cv=none;
        d=google.com; s=arc-20260327;
        b=PHuQ/WHz8cw1XuUnOQ3a/KdHxUeZLHu0I5WGZPXxz7pY/xDTC1JXo+UJoZ2r77+I5G
         9kSSju/4/fTmdjDb7z3G74s8pVdJRxyE+INMu9kULVeVhieZ6uYrNrDb2RIfWVDJEvoy
         3Ma5KTuhNxw8Odkj99CJ8A/QFucxefURQtrBppMh70tKufMbDyudyk7E8nzALmyy16Lc
         8jSYPeglL5bNNru03sN02HICYpMLcbsVtFkuyHAYKyVJEzabuV89MxYpAc+uS6YQVtZ+
         YThfq0jKKAy3FMFtTY9vS1Sq7Qj5ANyDgBJa2kFrDAhCkHVxW7T9Izqo63Z5I+E9pAsR
         hZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c/OfYeoduBJGc0yF1/CQVvbKOujqnKo2QInGW9Dhwrk=;
        fh=8DeIgmreoJANBn+yR6Ih/wU7Vyf698otS+uyDbdkk7o=;
        b=nJAnA0VWG5An/n2BeoWWhBHcQ1bsVii29phLiJn+K/Q4ghlSNxo4EZOGWfGoh8YxQ5
         EEFqbozAOzVaPBBfTyUDLuODmxDY5JqDKKbtyc+VfXoeVS/pbdbP+qsZi8Vrk8c3GtCo
         SU/j5uOPPnymL/P6jb77YidpdQ/+DzTNXm9WmqxyBQVCobl/afYm2pRPfYTS2hAHFhmR
         LfAtRLruWz+9YCp+kf/8MZbvELA4V0N1+7w7GnJqzqcvvZRTyuJOwcmQevaMucfi6anA
         cSUAZDHtIXP7LSP5S7T89PPhaKbv/eePq/2zOFBXZZcu9hICYZBOaB5GZLcJNdPo9Eyi
         FJfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514854; x=1793119654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/OfYeoduBJGc0yF1/CQVvbKOujqnKo2QInGW9Dhwrk=;
        b=olrr5DTZdM3NIuyKsHj4u5iFbFILrKKTt/kVLWnLB0QpMpfRxjngwZ4OA3GXDuNn5z
         1Ysgv4f5TPjhLSgexyK58FOkqyGDTASwgrXBlmENlTUAA4/ejVL79zBmDe+Q6hvQ9LTY
         dBjSz0k6+HHEh6j9/a6ppPiE68Gy2gY+xll9rJMcEDh5Ti8njrq9ymPemCCAks7G04IE
         kkdDPSU3x9gRNh42GanBFwDCLwv4M2U5QMUu+8Ok8zUaSD6asS6hdnWdjKwW7ta0ThRw
         dimlgLFs0696qfWaZTK+JzMXSfSDpCCW7Y6uhbJyyJAFBJ9mLVLhiB5EKhsZyGOxvATR
         7fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514854; x=1793119654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/OfYeoduBJGc0yF1/CQVvbKOujqnKo2QInGW9Dhwrk=;
        b=d4NYhzWVnP9YOMUEUE23qiYDLs/11Qab90Gt3M6RjYle5w45UJY4vN0A2z0AAgJVRk
         2mGDHh3KZ3tOuIXsdWxW5Es5NPqJKUmKh1IZAj2BTqp5C+r9fJihyTdai9VFpnkW/e3Q
         HVHdWQvCgWlzQfD2abskJYiK4DDzCJVo7H8wUvhn9zwqtCnzpBDQYQKA45zb2ireiMXD
         LeF8MaYNWHbSVTjSCo7QLcQLXNTMBcz1qroVsH0Zec0dPGgplWHTXdDI4fuxnp7dYSQB
         06yDURAMFmn4rVUP/QscMEUvH1bAeMgCksirTIlXK7Hck456ItUfYLXN+EPdejciA4hK
         8uCg==
X-Forwarded-Encrypted: i=1; AKwUvBxf4LRKv0rXHCfmK7XPjWOb1JqqQRODL2HkYj6uVcf8BeMM1V8mPWyScotl1Y7S0fh6OVTKh8bGifIhEZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEgTLE/J1Et4/vNDETJVyMekiAJyQs8abKWUmVFKz41ArbO9fM
	rrWDz3S3BOk5NO4b/82JThcuabQZHdzJpe3JGiQydYb6/KFmz/saazLJeKfg0ygUrQX61oMwqDW
	pDV62KV8Nks52ZmNMhwL6yaZqSH4iEuxDcmZoFaWOog==
X-Gm-Gg: AYBFou3SVOymmfS+8J+e5JMu1pAEc19HWNuwomNS5uu9U2l4iy3xHOk4gD1JbriQZK3
	9EjmR6KGSEqm194lfvq7BKzxcGMQnA0yJs9S1R17vRO5ma3mn+Fy3z/fjmPx3uZ7f7sOhhov8rA
	b4X+wOTOfjghM6b+66bcwBM4s8ThSqnOJGpiOQn1yyvPs+Ji70lKnyVZds3Z1BBt6E6Jqd2NRFP
	Wx0CNK2VwcH5KWs5UqAzq9KeldiKwht2HDQbeTy7oq19ftgU2TpRnnD96FqmKeU6YhEhmhafyJm
	vxwIHd1AKFxSCMlaCny8Tlr+e55fA5hJO6T91UAk1AW0e5t7M0BSuYzvASezy+yQM7lFDc5caNL
	BLky0QfOgdMENRQ==
X-Received: by 2002:a05:6870:322d:b0:48f:e0f6:bff2 with SMTP id
 586e51a60fabf-4a7ba8d0c4emr1959821fac.30.1792514853988; Tue, 20 Oct 2026
 09:47:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020101225.917959-1-thnkslprpt@gmail.com> <E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org>
In-Reply-To: <E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Tue, 20 Oct 2026 19:47:22 +0300
X-Gm-Features: AclHuK9UAMBtxeiBbqWEmGyJ_ft7PbgPsstiHHalCVMIOe1ehaJRimoFYBnEHic
Message-ID: <CAKOB7-YhfVyoo95LtfOSkJTVxgjOA0bxPBndca5L+9M9MXTSHw@mail.gmail.com>
Subject: Re: [PATCH] profiling: fix sampling step on 64-bit big-endian systems
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'm happy to try it anyway - just so I know how for future patches.
I'll see how many I can run through before my laptop gives up ;-)

On Tue, 20 Oct 2026 at 18:07, Bradley Morgan <brads@mainlining.org> wrote:
>
> On 20 October 2026 11:12:24 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
> >read_profile() stores the sampling step in an unsigned long
> >but copies only four bytes to userspace. On 64-bit
> >big-endian systems (not common obviously), this copies
> >the upper 32 bits and discards teh rest, causing
> >/proc/profile to report zero for normal shift values.
> >
> >Cast to unsigned int so we get the correct 4 bytes, while
> >keeping the shift calculation in unsigned long.
> >
> >A small C reproducer under qemu-s390x reproduced this and
> >proved the fix works for prof_shift=2.
>
> If you wanna be 100% sure that this is regression free, you could test
> building on all arches. Sometimes linking fails in cases.
>
> >
> >Fixes: 2d186afd04d6 ("profiling: fix shift-out-of-bounds bugs")
> >Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> >---
> >
> > kernel/profile.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/kernel/profile.c b/kernel/profile.c
> >index 1fcf1adcf4eb0..e7defa90a34c9 100644
> >--- a/kernel/profile.c
> >+++ b/kernel/profile.c
> >@@ -156,7 +156,7 @@ read_profile(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> >       unsigned long p = *ppos;
> >       ssize_t read;
> >       char *pnt;
> >-      unsigned long sample_step = 1UL << prof_shift;
> >+      unsigned int sample_step = (unsigned int)(1UL << prof_shift);
>
> But this would compile anyway.
>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>
>
> >
> >       if (p >= (prof_len+1)*sizeof(unsigned int))
> >               return 0;
> >
>
> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
