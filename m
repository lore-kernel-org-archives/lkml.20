Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793709902;
	b=Q6RhpeNlKQsonmS3WhPrvvsxEQsQVWoP1W5sJUPES7xbe7+VfFV4lA+hT+uENQ7Q23gG
	 BxbuW+pfpMwKDlJkJ4z+oxxFYH7JiKYUwsrnryzP2jrgUoo09Bmw1k7hBBsoDxEGPPPmI
	 YWlvEfoEG0ATNNdPbnriEHavum8S4S1VIKFrz8Uj+9OV+ehXoTVy7DgYEAdMTVrcjRoCH
	 QdXkiG8D79qR21hGizz4Dh5g6RL69l0xseg8GoaHxtNhN6kd2RwpMTcq9Xz7+Cn5B6yuf
	 9mNpvjoxgzTcigp4wb4RR3s+NO8CzgFBSptO60w42HORb+3BAB1GBz2+keY1GqOaN3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cJss4DTSAFF0TC2y24FFpMgu2U/hDyAjjGTYiZ+imqE=;
	b=pRLPzQSqsfb3DXFYlqOTDJiO/62Wqt6cR5jhKS9h56rXWOLrRg0eraA5zzpEgyEe5Sc6
	 1TOoUunEicBr6wtqeoA8fVHGS7gXeqV3VcesKXRXNYeOM4zwQlita00EwWusIwqvSbYsU
	 2yneiGBBToSam3aRhcaoc89WC5A49R04JaWQ+sEclR8XJWl2LwzHTNzVx7JmOTtwfUY1i
	 6azCKsF1H7yPG75Czfprw1ooaWV5DCZC5TvLu6M6lyMCNfwmiG225bfuaJmrq3NpZ5dm+
	 SnDJ2hX8Sfh903qYrFW6PSRmxkRPH0KWJemsnt3N+Odl6F8oSiwAPWQeSpv/tLH3wpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X7YIwu+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB15606EE9A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB15606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X7YIwu+P
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-483a66818edso2110561fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793709901; cv=none;
        d=google.com; s=arc-20260327;
        b=K1ZNRtZ/BqhioERDjsw7/TOnY+l0ky1FILjtlFIrKr9BWEAg0g/yJErIIPOMH9NI6w
         zwLbdCSu7uXTGYUm8gTNVa4gXbFnppNGwrnKeyQ1Wwltfb3l3L4oXqeWV0nJS4W0F2B5
         jU9okPirrMtIn4eq4CreQFuz/N9C180urV/Dy7CPbCGrTMQZYuUA2cbroHZpf3EKlQa0
         s2dtAUOEgYNIAOR2/YAW5o84znVyBLJSofiDF90Iu2A0mMnRZLgVDIL7llKruU7pEnR+
         90V7RmCaeS2fAXYqGZn0GXnwNEVmLePftwb8CoKfQ3Xz17Fy25BiwWEnow25KZUnAV3i
         oCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJss4DTSAFF0TC2y24FFpMgu2U/hDyAjjGTYiZ+imqE=;
        fh=kaO86XFgcOYocdn8+KWCSiDPHgC1UDfzpAa4wQPT6G0=;
        b=YbcKiD7umDZ/ieTipxhdSBgJrSB6ukfiB2PMAliXBAfRvBhaieiDGEqckhJflS94np
         64ggDhYvwBhrXKgCGc2mlHfPZVwDEj5CrIk05EE/GGAGpEkziOEdP9XixtRBO4z+aMNc
         MRGzECjS+5sAckY8ZXJI7+gAUz7bC1S/0p0zJG0Ysnk9gJqAX2O7d1cHtYkf80ZYk9DM
         ucLUzTa7eD/6sgHWxgfsE1MwI/bWTg9kjg60f5BaT/DkvgyAZ2VViczM1rS4Tdx6fVLj
         WsRgQ6zEEiQ6qd0LnoyqenMUEfpJR7l9A513bspCR9gheXHpCaMrp3WIx5EMDnlqXmW/
         BEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793709901; x=1794314701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cJss4DTSAFF0TC2y24FFpMgu2U/hDyAjjGTYiZ+imqE=;
        b=X7YIwu+P57YbvarctNfqfO7T/pAsbLAUPr1ZHvH/QyvkiDBJARSLe/e5hzhvwmWD1m
         FDB9O1eM0jLjHjBT7zIhZtEfxB9hxtt+GPeuaY5adipemtw5ydKNpOA0sR63qXoszWhS
         87S1+WFmEQeF/jRnHieppIfgUe2st71Xy4FZmpakVMOZzWdeMduHI6JUsrvD/P86AWrf
         Z7ARWoEr3qErGbGvkfpcLu5SYYuErQ1f4g8XJOZuHfQ02SjF5rMvGCqIViryEQwVKXpB
         d+nxfcnLqnitYjnnRLlt9+xm2QRhKRcsb0HU82egfjN2OYCC5xcxMpwf7/RukhY6xzVx
         /Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709901; x=1794314701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJss4DTSAFF0TC2y24FFpMgu2U/hDyAjjGTYiZ+imqE=;
        b=tzxF2A+qPezKnodu7TAyaVJc4Etccc4FNms3qH3W7bh4ijLF2I4UTixBXFhlkPcsc1
         +eczbbT9YWDJ8u/OW5zXJbM06mJt6ROwb0UaD4mhVioGAe/+DYZLdeg3JRNOaWa4h+gk
         JAS5SEmwOAl8N3/3DaEOsfNOO4QvHE8VgXHoIENTuZfLc3HpOdgcJlpHyEU8w5W0BYyu
         p4TY8K2h/0VFbSqEHSOpBNZ+Y3EFk20uzWejJJkKjJVifdd5mo4AlJ1QVrnH9AB0yLqx
         1ZKezYubdZZVscnzI7fQ2Qy76UE97owadSxIyeR2kg6rXPV2Vw4oxs1jg9sBWPJi9aYO
         4mVw==
X-Forwarded-Encrypted: i=1; AKwUvByXnMtAYvNnnyxJqIdRIM0zPoLaxwkpLgResUhMk/3nUydHTXgXrCVvsHGkE9Bafpvp7YNbSk+UQIm9cYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I8ApRsPX1gteM/5gvPh3OAimongFZSYgQrLO+h788YIQY1XWJ
	MSluNNUDWzbzD83lPRIAtzYt1dZGCfTaXt4Tm6GlPtpQG9aw6BpaSrd9VwhDEPlu01oRUV99ykA
	xdQUlnwq8XJ668IpDlWOwhw12QTiOa/XUia7T4KsM
X-Gm-Gg: AYBFou0ofJ/xc243JRH835qMYNQx0hlXMxfLYyDgHKPxbrQnsq95GYg65xA6EKAUcO5
	+/eEVAQv8PrUhHpbJdC2EMXJa/NYO0NhS0ZHoIGGwhAsS1SwVmbkVtx/mHC+u8NcDYttjZT6kes
	huUn19dx/B+gan0CGi3Z9WgAfh4ckQFccaYSEPh+7/uzA1gNCXegq8OaGxr3/FZy+0RIqk4vJjl
	1dUcpiYD4QUrHLEYVccgpO6aU7cQ/T3wZVtjJBPrl3vm5CTo/D/SRYBbnOxDeGzXmTM7zV3oCuQ
	H77Ipbm4P1v9fNQhH7a2D+b4qnvLx2XgANe+fMchMUl6cPnNRJilpuVu4QL2ZinXmK6itELFEPb
	oNyX2NK0rYnxgkGwJRGbE/Va/ODjM5vfF6YDUIfp17l8zHKwewjnczbhxK/cp5Z6aGFL/T0ZN3a
	lpMEEEryM=
X-Received: by 2002:a05:6871:c8cd:b0:494:76db:2aa8 with SMTP id
 586e51a60fabf-4a90730f375mr7994740fac.5.1793709900334; Tue, 03 Nov 2026
 04:45:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030173254.2000665-1-dhu@x6u.co>
In-Reply-To: <20261030173254.2000665-1-dhu@x6u.co>
From: Jacob Moroni <jmoroni@google.com>
Date: Tue, 3 Nov 2026 07:44:19 -0500
X-Gm-Features: AclHuK8nDugVTssmfIb-0C2nE1vAsrv5to5v5OGV3nTs3pUaP90m0Vgw84uKISA
Message-ID: <CAHYDg1QgFnyKEA_Dbx5dpdUV6Hfs3w+japBgBGeR3iD9UG72dg@mail.gmail.com>
Subject: Re: [PATCH rdma-next] RDMA/irdma: Free cq with a safer cq num reference
To: David Hu <dhu@x6u.co>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hu <xuehaohu@google.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jacob Moroni <jmoroni@google.com>

On Fri, Oct 30, 2026 at 1:33=E2=80=AFPM David Hu <dhu@x6u.co> wrote:
>
> From: David Hu <xuehaohu@google.com>
>
> Within a iwcq, `cq_num` is allocated first, and only
> copied to an inner uk structure, `cq_uk.cq_id` at a
> later stage. Freeing cq by `cq_uk.cq_id` before the
> later stage leads to a cq id leak.
>
> Free `iwcq->cq_num` instead, which is allocated
> right after initial rsrc allocation.
>
> Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261016202909.1289496-1-dhu@x6u.c=
o?part=3D4
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
>  drivers/infiniband/hw/irdma/verbs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/=
irdma/verbs.c
> index c91c55917de9..1726a0ddeac8 100644
> --- a/drivers/infiniband/hw/irdma/verbs.c
> +++ b/drivers/infiniband/hw/irdma/verbs.c
> @@ -1948,8 +1948,6 @@ static void irdma_srq_free_rsrc(struct irdma_pci_f =
*rf, struct irdma_srq *iwsrq)
>   */
>  static void irdma_cq_free_rsrc(struct irdma_pci_f *rf, struct irdma_cq *=
iwcq)
>  {
> -       struct irdma_sc_cq *cq =3D &iwcq->sc_cq;
> -
>         if (!iwcq->user_mode) {
>                 dma_free_coherent(rf->sc_dev.hw->device, iwcq->kmem.size,
>                                   iwcq->kmem.va, iwcq->kmem.pa);
> @@ -1975,7 +1973,7 @@ static void irdma_cq_free_rsrc(struct irdma_pci_f *=
rf, struct irdma_cq *iwcq)
>                 }
>         }
>
> -       irdma_free_rsrc(rf, rf->allocated_cqs, cq->cq_uk.cq_id);
> +       irdma_free_rsrc(rf, rf->allocated_cqs, iwcq->cq_num);
>  }
>
>  /**
>
> base-commit: c3e8e9451e6f1b69f685b75e0fbf14f3d0fb2539
> --
> 2.56.0.317.g454f8302e1-goog
>
