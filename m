Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C63BED46
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987816; cv=pass; b=r8VYbzgr726kuMD6wStViTzhvOq6jRdErSHsrgWD0R3tbR3L5OlOggNPmWWGKm9B4hJAil6A0rlElTsh0FOuYecUz6oLH/Rzxu6PFl0jiUti18+2pralgnwq34HllIwwvncNT7eviX4MGbisU5jwQ5Im7pPYeqKmTLvAeLLcoEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987816; c=relaxed/simple;
	bh=Woe2iMMll82HWKqtI+/v0PQqwijQ4Zx8JPySiZfxnJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoYm3d5AQlkXoWwxV8xjjgCZV+1aKE/68j2eLqiuNoRLje8K02rDesvB/iCZlLzdJeS2OEuSmquewUJ98vgfLzeATy7z3pjl5xmjl4czPUw2FbEO6l2AodtdksApcjQihWJrmjCFU2Wx8SV5ka9EvM3E7xx1F7P4XO9QviwQAhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz+hGiIO; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz+hGiIO"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so51422161fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788987813; cv=none;
        d=google.com; s=arc-20260327;
        b=rIeG0sPRofA0BYSVO6HfK+Fv12ZfwYyX5XFf6VqH/Cz/oRM22EhXR01ieNgkQ8uitQ
         XfkAWxQP8GTwRYi8x2G4yOxBg1pjMGJIeflGZ0aeHF4l+BhAPZhHdK4EpRDZKuhrjny5
         xP3z4hYiAIfs2cgUTNptvQHJvCfPTgDeCC2hHs4CiIAcsSh5ZNJcK+j+zGXQfccRx9ZO
         8ACb4ist+jEF1qMJ/WyBPaNWNuXBC+EcONNG3x2p3mLxoxG6h0XxO1iFuvSbyiACemG6
         Cdo+uYpZpSMgTHmubYl9AvAekj3RvJmLlJt+2yBkC6EeOKjpH13hkLw07ubx/H/GzXch
         CBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QOSuGBOZT9M6KIAo4leiz4E8LztOD1fqEqF+/FyjpRo=;
        fh=Sqn1cL93YcbZ/JtcheFaWg93sMcdaDJDIk812Ff5W5I=;
        b=D8d1vU666CNm4dUKOR43CV6zqp4be20AIhgaGHX8Y2jZPWBPevO/akM3SbeFTO+dNi
         7ndiLgw+G78nBbBVAynBPFS9503DgQc2i2C0sHENNY2j+foFPgxDCd0p4moNhzFmpmkV
         vXKNWRPIzlifKEBqCIKCJObpbPJ5wtDTHqgXPweIV/kIWNemIHTwWbUKFU9sC3y8k5Au
         be3/EtVQOhpvWQy2B2+ZIoLKj6WEfwUtDhtXU3kizLLhwhIWiAaQf7D48ywfFi34EwX1
         jAOK1+b8pdhH4700BJxCTNBzAX0cSRMD7iyCBVMMd0OjqHbtgA4z2LGqRCyAxNgQxBR2
         dP6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788987813; x=1789592613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QOSuGBOZT9M6KIAo4leiz4E8LztOD1fqEqF+/FyjpRo=;
        b=Vz+hGiIOPyvSQTmDoe16yeyNxBis6btrMWy+Dw8SoCJO47oPweeHRWVKnF5GxTRadI
         9Z7xb7WxXiyxndDPUNDkzei5kza21MM9AkBNoVtx4pN2dVLvek6ZWzHYjHrPYoxyT4vg
         eAqeM08Q9Zi4GosYnPTXyQxYkqPbTVcBuL1Sa94qUyZ3Mcc0k2OoP7bsYQMjq0j5jJxJ
         +ZPvaerOibHK1A5RNPE2+hp7GcPijHvvBuTa3xFoUiqrHSfd0bbbYmSnLnLQudbFpxBQ
         ypSDnnl5/D5yRYvlDklUGPdUe7cF2uXxg96BrPD0SLAfjsuxLuSVK7zT5H0epH4SFlgf
         Vd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987813; x=1789592613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOSuGBOZT9M6KIAo4leiz4E8LztOD1fqEqF+/FyjpRo=;
        b=gmdAtigLnxp9KGTk8cUNMOX0oJshIhGDQ3RZJQlQv66dNa2yOr5h4qNFxsAsuEedRL
         19vqBIRbWH6mvbem8sygiG8BGun9DCNVo0n77vN6Pwj1xAvJ+8G0doiskwGKvzqWtHZr
         uNd7Kk+t0FUFkT7MlEQtnwKRxr6G75wst2lExHXQTI/1aaNuycP4AH57HJr2x4lx8wRA
         GUm8gDkOVQDXONo1RDDbMG9xIp3xIVz5WpkrKcCJExm+/z3bmMs/Fo6SVD5hCwCV53KL
         OR1DbKs1HzR3qheppTcZdMcP007/im0/uEXJdKW34yY8uUjEtT4UP26ritkC67+Hz183
         wTbA==
X-Forwarded-Encrypted: i=1; AKwUvByzZbVCLV865f6MqmoLeHPC7sDM9WLfqN2qcARzt9/KmbXPoe6kob29LYhsAJq+9FOUaXv8higQFlpDZq8=@vger.kernel.org
X-Gm-Message-State: AFuF++ln+pCUigJYn4BUuZvuWRcwkNFIJ86wPR83gUHZyx/6DWFU+BKA
	+vyMPudDvikeHEQdDThsdla6TuU+Zvwr0DPnc7/Js9NG+3R6Ok9K5wjRV3XtYYFM2oAVz4PpMVX
	xG6rlRJJpA8us24ESVEVQUmPpYUlnIM2GtuL2
X-Gm-Gg: AYBFou2c7TE6505sGnKzo9qR/Cxpr1vRnxjViWAMm4Bg011jkDevIEWWL2pBMn5eLOH
	UKHl09jp0i2AZinrs6idllvu/SZKGY+iWNaV95ft9eksH2/wS8faK0D9S7FrB0/c8gRQ4Cncvay
	1ZjGnDzbdf+IPNE1ihYnoCVGConBzfcQ4CLhq+Nm0Nk/q4XRjvO+zFWtoH2U4y3Jm3f78AA2tsJ
	hL6LN0LGuv6IW6ggrE+ry4mqQ/uXhvA0fd4hKxslIc9tMhtmAzXBUJG+4lbw410Dnhoy4s0/Kq9
	PD2e6Pr1M77RVS/Cbou5ZbIKkzumDhy+tJ7PCopFzUZsddcBqM/j+L8sQ44ppE9Ie15fGWQDlkU
	LABC6uGL6TrBQYXDPt9FRGBnMoOFACU/wPUk05eqr8+hB
X-Received: by 2002:a05:6512:b8d:b0:5b6:1a7c:28 with SMTP id
 2adb3069b0e04-5b61a7c0215mr6003626e87.43.1788987812940; Wed, 09 Sep 2026
 14:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
 <20260907035746.2189242-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260907035746.2189242-1-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 14:03:20 -0700
X-Gm-Features: AcwNN1UYYkHafCjlI7TIc2HEqXYrPv2bUE1rGzZnomZAxNA3fndG9uFj3uWF4Ho
Message-ID: <CACOAw_zhxctzmRhzGSA0mUvQ+jBjiPSz23FjUu-VtmSpNWq7Eg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 8:57=E2=80=AFPM Nanzhe Zhao <nzzhao.sigma@gmail.com>=
 wrote:
>
> On Thu, 3 Sep 2026 21:04:36 -0700, Daeho Jeong wrote:
> > In __has_merged_page(), target->mapping is directly dereferenced. For t=
ail
> > pages, target->mapping contains compound_head metadata rather than a va=
lid
> > address_space pointer, leading to a kernel crash when accessing
> > target->mapping->host.
>
> Thanks for the review.
>
> I've been testing on 6.18-based (Android) and 7.2-rc5 trees, and in
> both of them bio_for_each_folio_all() goes through bio_first_folio(),
> which resolves the head folio from the bvec directly:
>
>     fi->folio =3D page_folio(bvec->bv_page);
>
> So the folio yielded to __has_merged_page() should always be the head
> folio there.
>
> Are you testing on a 6.12-based Android kernel? In 6.12,
> __has_merged_page() still iterated with bio_for_each_segment_all() and
> took bvec->bv_page directly as target, so a tail page would make
> target->mapping point at the compound_head metadata and crash on
> target->mapping->host.
>
> If so, would it be possible to retest on a 6.18 Android kernel, where
> the iterator normalizes to the head folio?

Yes, you are right. I forgot I backported your patch to 6.12 kernel to
check whether it's working. :)
Thanks for the confirmation.

>
> Thanks,
> Nanzhe
