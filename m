Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385548;
	b=Z6Ww5TBOJJxmS861D6uZ+2L6kLX73OCZWvLrMSxqeQJRXI/T15JQyRCOPMilVJnxHFMh
	 p2s/CtrOcgPWlQbpkTTWg/TrbM77E4YNiuLuh50xCs5BbujeVZYyMvE25HKWiVStWOCj6
	 9pSkRIZevsuJIzq9EfsrqNNCQ5ZlGADNc+aK/2v9i6vviYreJNrzFKgWneiicvlJUz3zu
	 nMpUQ+CJclbJL9afoQoqk6+xFz4+Z7xBKT27PNPYyi3vHf92gIVV1qqypyW5iSZmUX28r
	 AczpNoxYYYzH+7DkvpPRYhgG4kSIUkD61PRnrf0FE785IW5AH/BpeyQup+dz4xbVqTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p/g4K4FmtPtb1dRwFi9A+STto81LNLv+WliespFcyzg=;
	b=FVXy5eCkbji5oZc83JFjHvVIk0E2fiLsSkIySuUb6CPXXVP99xfS0einID/MMo8DlNOF
	 puvXBvwzllzMQ6f5W1ky46YRma2urrju8u6FlCpeCBKwTi5O/ZCb5DiVKSaSEQGopYdfj
	 baZZ51Qnau0wGrcBlJY+a7iLZq0jIjhMBQz78GIXq2k5xaoDMLNu1uWiQdOfCiqztXUYl
	 s8JgO16/9/kO0AZYrdk1gDeqYkZ7EDTrxF71gu/nxeRxkOpT97TNgBrW7ejci5L66rxQP
	 hTKkfm2qqZGuvZSQVo7FRoXvexiOe8Izs2VB6yQnqxfRD3FRCH5BL8/QEHF/gq5wCXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LSdL35Ul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD38606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD38606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LSdL35Ul
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11554355e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793385547; cv=none;
        d=google.com; s=arc-20260327;
        b=Bycq2QIaqxuCFXDGxhotAuFalhsdHo8fc18ZZilpj5yGaHzQmuh1Wl5LGO6ByWY2pm
         NA/OiFV29ZgN6fETb93oCxwmYMSCBPwmb90WGG2ui3z2IWrKALnUmS3RbowOT0EHmEI0
         XXRJhO8bna0aqImPzeSUgreowhg6B2FhPdZCB04/VGXGBsKqM4b4qyBB+G1w2FK+LGL9
         MdHI1/qMjZLi1Tl67/DktrgpmjGfH5iSpGpvqMXmMDF/NhAsQtv92bP6BJuV1/aF5eaT
         6zmQjZx2b2KQ58yrdM0trVaGS3s4wJ3Kbm/utTj1HQWcBp89Qaf3Z/UvhAD0Dk7MvfpT
         6cfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/g4K4FmtPtb1dRwFi9A+STto81LNLv+WliespFcyzg=;
        fh=CQebkif13ipIJaWExieqD8RrAEYHlmnUHRu77dEAp5I=;
        b=Y5L+2BZ19/Z5YNq74sTNyiZhRcv65mimw0zFX8y2jTBM72YIz1XsrTDOf96/vizqqr
         xwhWbaN5gdMfxVC6gPgapSP9mtqGhwYIhIUKDtMZ3FMXa5gggT51LY5XNWk99EPPMzrx
         fLQPSgsR5yPhJwrOygGHxYmChZQeykiQOGjEyRiR1gHQnUxEV6/1v/yoV9xl1/LWpfaB
         15JrUiwx0qMckZ8r9niynSpQntw2z+RfnijuAtVNN5TfgKkXaTdOvELs9vZ4C6jaiSmr
         Uv+0snpeK7dSWd+1qZ1xRTZFaFBjunhMGfhGVHA5SBEw9sj442aCy8l1PFwWOCoyr3eK
         qdHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793385547; x=1793990347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/g4K4FmtPtb1dRwFi9A+STto81LNLv+WliespFcyzg=;
        b=LSdL35Ulq9xfjDQ6H+dQkccbZ0x/jdESebThG8XZE9+T2w6HWh9YQY1lJVKBTSIO35
         34IKIbaYw3l+bpwtxs0d8oWKwHJu17cNHabalfv1Vmg0ud/84n77g6apO3MavsUPDw3R
         vhks0PReE6AAtVbjTv1Q5GdKdCktjluJjbkmMhONTew55gjTZS1S1Ys5qYiuRe3vYOUU
         UC/pMGjsjowrL5r4o0VZtFmiNWELPbWJ2VF4NQeF3/CFgeutZjp8x4Ef4qoS7h0WZqWZ
         crdV92/djZvDWI5o9Vzsf5D9sT7I5zKrusMW4zd570veSJcYDXZthbD0jZS7jEzxeLSH
         7Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385547; x=1793990347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/g4K4FmtPtb1dRwFi9A+STto81LNLv+WliespFcyzg=;
        b=l1Z59qcFcmO1F/Y5AiS9Asw4FIjJdi3tEp3iGF9L5ERjQ2V4GWLMWd/HER71Y8mD5m
         ppEd9xNO4diWSn64azJBIkNh3o8vh9KZ7XUC0okqqdvMdWutOoXCCIP1wGrFyBaeQHOK
         LEvPcQZXSgzNa+KRppZRSx8bRtotuQVQyo9Qr40x3RJ/MxylCryw2urhVOKYqKlFLF8O
         Yw5RB+PWqsWB+Gar3N8zCBmSRDPuWMGnZ6WxDZY6Y+BnBwiHZ5vV7idAmDy7zrkxeGAp
         CRJbQmEkou2KmjSj3AI9w0VMIkpQPhjf7o1deFPQtbheoPBA1wGnfCFFvUXQCOxSGzTA
         +J9g==
X-Forwarded-Encrypted: i=1; AKwUvBxXsl8hxK9AHpdXbFOlxmPj/2ytnykEozNat+NdTQMkK6oPUGMcHJAcFlBbP3cw1vIg9vlFEsXTc7Zmfes=@vger.kernel.org
X-Gm-Message-State: AFq9FYLru3/h71V0ibKr4Gv0Wwow+YyZ+CFSDseqXRWarU5iqB3Q9RDV
	OQXdjjufnPNawuvQ6cHDp4RIqWoGBC29BhPIpsdunSsoV2XaXbXxJRPv9VvL8gk31oruP9Rt0Mj
	DDQLWKGeFsuxmZdhclWbt6NMeqDTwcEJPZrHolQ8=
X-Gm-Gg: AYBFou0SKWf7bIKMvjW7z7SUpE1N5iNcM7DesN++o84DS9ZfoGfg6tZHMO4Co1rURXW
	+coZfmknPL2OosrZJH20BVP/MKaO4QdSW/gR0LazdlIIUFJYanWUEPSEkai8W26KvU1Lm15VCEr
	7uczFvC0ojS4wkcE7i6zk/q2DJSkrrZNN2NSwjaMeWjsqn6utRNZw6mVsp+gM3pXhatFattrmiY
	m7P5bmuo3xTF9tSyYmHTESc88ZSLIdZgEb39Du2pGR0P+bRHlZr+1sWQrlnJ8ZuRTfYHmVcmjGd
	JzwRBCRcjIou599ehUKV+72D2bN15LJx5rSmzmafu20oxlZtjnTMENzzDeyiF/PkcOXDej0uQnA
	MHGCvlYuf2gdq0NsBM1G1P6sKmlSwjB3wSSJlBQfcZK1sPSVowe6MX7aPDqfAX3QUsLxgfXF/2h
	htTbelhrFzRwBdiesyUJYfAfJcMRM1EhBHfoH8+NxV++nhzwqPYFYvDiw2kQlxWAKdZo1gD6MJq
	L4sALb+AkHNMKAmCwQQvN8J
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4ac1793e81cmr75097525e9.13.1793385546303; Fri, 30 Oct 2026
 11:39:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030054227.35453-1-dennylin0707@gmail.com> <20261030054227.35453-2-dennylin0707@gmail.com>
In-Reply-To: <20261030054227.35453-2-dennylin0707@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 30 Oct 2026 11:38:54 -0700
X-Gm-Features: AclHuK9S7RaThJXRkKbXDXL0g5Mew_YdBPQsGToRc1UW-4Fiv2yGxauXCnLy0jM
Message-ID: <CANDhNCpUkqNDZL6A5KD+SMRaFtWu=2k+9V99zBe2hnOEV8iL3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] timekeeping: Read getboottime64() offsets under
 the sequence counter
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: tglx@kernel.org, sboyd@kernel.org, mlichvar@redhat.com, 
	akpm@linux-foundation.org, oleg@redhat.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:42=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com=
> wrote:
>
> getboottime64() computes the wall-clock boot timestamp from offs_real
> minus offs_boot without checking tk_core.seq. A concurrent timekeeping
> update can leave the reader with an inconsistent pair of offsets or,
> on 32-bit systems, a torn 64-bit offset, producing an incorrect boot
> timestamp.
>
> Read both offsets under tk_core.seq and retry if an update overlaps
> the sample. Convert the resulting local value to a timespec64 afterward.
>
> Fixes: 7c3f1a573237 ("Introduce boot based time")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> New prerequisite in v2, addressing Andrew Morton's review.
>
>  kernel/time/timekeeping.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index dcf47f1ffdcf..7d7a7372f3c8 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -2700,7 +2700,13 @@ void update_wall_time(void)
>  void getboottime64(struct timespec64 *ts)
>  {
>         struct timekeeper *tk =3D &tk_core.timekeeper;
> -       ktime_t t =3D ktime_sub(tk->offs_real, tk->offs_boot);
> +       unsigned int seq;
> +       ktime_t t;
> +
> +       do {
> +               seq =3D read_seqcount_begin(&tk_core.seq);
> +               t =3D ktime_sub(tk->offs_real, tk->offs_boot);
> +       } while (read_seqcount_retry(&tk_core.seq, seq));
>
>         *ts =3D ktime_to_timespec64(t);
>  }

Seems reasonable to me. Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>
