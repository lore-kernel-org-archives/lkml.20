Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792466531;
	b=JpbcFM7jrsB1j92xaSFK8r7NyfU5AORCss/g7/t6cZoXiRQKHrEpmrW8nQbe2FjXGNss
	 0AMNzP3R/U6gy10TVAQtRSgdkH5Z1ryEH1vxYJTXOYvZ6CVlgAfmZalODI6YB0+mKqLCE
	 /hK9FaBNctQ40F8DdecpaW4N21jJOYeVBjcoSVyoKylAJmTIXE8w9pimlv+I/mYMY5+qL
	 zqrCUdEkrQU+LeenN6X/xXzMy1103CV4p0BuHCZfhqyvrkrLdw+2em7NiIK7HWEmsgier
	 qBEjpb6jWtvd/N8TXKnyTYM/ayHCvCiwIl1vw6BxOCVBSUnbsPr/c9a+jDWe+FZotZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GJ0jzd45ePDV29eKZJ4sBGXJjhUAwze4eIfc7K86wG8=;
	b=duqRV9WEdGfrh/48NNQBEcNf9kA9GLR2d4y3lnyTNlQxAKkSlyPqy3JxVhdOUAIb1Icu
	 4QrEdvhIcjQpWhUhIbJltG2k5UBB2Ubx7IL4xh6Dcve5YeYrsOrV+4kGonPMbVa7OPPSc
	 g1OFPLWEIdIv4o2ALpRZBA3peENS3J57Ajd1s2DUNNLhpqRhgG8jhA5x543oJoP8i+G67
	 Z5jjMt61VK0GZpqJJQpGdJNYrM0NYKifqy41VznTMCqPVNlc0Nclvars8Y3ydIm4pq6Gn
	 9//RkeXPc97SzOERejT6oHsRu7+f3lV0y2cmdfEXq/IMppDQgZyHawLheMxytocw+tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="j1oLPN/E";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB3E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB3E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1oLPN/E
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so2400615e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792466530; cv=none;
        d=google.com; s=arc-20260327;
        b=h+QHGYOx1lNGteP0JBL0Q6qqnJp+cHAZTlnnAt4QCgEG7U8jmDqmyI5YNe7cJiN1TV
         iqKLfwwG6E3y6FrDnpk/o4Ya0tkjvH+5g+I8A1dZSqHlWndr39mHiMrNx42m+6107tvY
         0GvW3gEHv7HnM19qmY7HJeLgRMP3YeK2DV2+HnFobTKvfxnxz0vD+MDuoq3mSUAkiGcu
         0q/K+O9161Slu7mMGqwx0PmjXpZ2QcROtLHCbbv59fNKIpXExnbBUTIQIweM5a3G4MnQ
         RbsC8l+AAeRmuOfbOwIKPhhnw0dlP+d11tEzCJBfbCyIMdlyzfeAzePpSoKCPdZzSFky
         PSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJ0jzd45ePDV29eKZJ4sBGXJjhUAwze4eIfc7K86wG8=;
        fh=PHqq3rQgFMyOFtgDFvNv+3vvXbeV8vrOyOkUsrcE2HA=;
        b=YtoNgfgjHgcvphoVCiRXfTM1+oGP0xqe6uFIvYFC7gIKECdmac/Ic42FZil5m5LVi/
         2048TDxy8ZApH6PZ00Pq1u+SxvjQpxZaLSBDZptRF+IFPdjZac5Jli9R6AAlCzPtU3e1
         VRbar1GF4tL9vaPXi/FOeaXJ8f1QgTurTJpwFO6BxlgWEo3f+DJ8yj/gi9BFZjFRNiju
         MozAX/xMIFX7x1PT5P3ejo4iJUZiPwOwL9Tks29d06DkSeZdy1ZEQCZrCoMHgYD94UXG
         Rnh91bePQv+8TCN7UhpXEPvcTdfOgoR3tD0YtaNqaui/dORc7xxT9xmnjReAqhJfOhPX
         wUkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792466530; x=1793071330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJ0jzd45ePDV29eKZJ4sBGXJjhUAwze4eIfc7K86wG8=;
        b=j1oLPN/EYvJvvDYP+kbo+2GkKG6dFYzF38/9uXb1XsJfEF8136ueXM7ykSJ2HMD1B2
         h/mmGntS95VCOMj9ikT4uBhlsKkwxIbC7bjeU2uajLrpDGtOnKq29FXgXx4HXwMPKw+t
         3JHnKeaPN9Oyoh/T3XZuSKXZcC+iguIgzv4VgeG2wkWIfcvFXVAnPadTaz+UR8+6Sx8c
         5X9bx9hI8ptiGo4KWbO6fyNt2VfTSMnZY7PEf8atrbRXOltw6G9iPngJmttfRJp8BqFH
         Ua4SByNJSyKaqr/MF2XsISWjePVYJW/dG1aUidKjT+IdG5aGmw8C3/Rli1SNnsQBz/cC
         m6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466530; x=1793071330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ0jzd45ePDV29eKZJ4sBGXJjhUAwze4eIfc7K86wG8=;
        b=DNYQc426+BQuSSB0b/Bo8mpZGrze0StZGPdM8VRdsKl6yHoyLP0g1UPHkLV5axAAwV
         fSnOt6x4FDPLBU0B2xgpqgyiJRJg6HmwEEWg3MWi9ZXpZb9n1hST3v9XmBu+11plyR62
         r06Ww4QIJ/QK9fwVYyfqbWlAgftvZb9jiHlRje7LzfqnbSSMRy5a3OjdE/t8PbbEoiow
         PTxXNe3AK+WyDXBr3vWyCw310Tiqs0kwwzO3x/WcCPX8osQldd0uEoCgPgdOFSMgD42E
         TFjLGSJIcuqfiMNA7RRkScnLLrnOy63t4cG9mnRXbSgOpnB/rvZJZJ/MMFU4WIC/mrVy
         rO1g==
X-Forwarded-Encrypted: i=1; AKwUvBxz5GM1dGE9NBLl3oNENCDw5mDsuG107yVOUdK011ZkbCHiYGqD13TlH2dLkYxv/XjKGY/PqQOWUTB3pmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8qNxMaA+Tai99qVl21EZU5fUnWW0ugIdJEB4pblFaVEbZNEu
	3cydQfG8FxlSGHiQAYR9xOBgOKyRVnZvb2rQqvEmUSOoJd+hiNzqTSAmtxuumlYhkW3dDGmN8RM
	rfzqWl66gW2QTdPeNlwyHtcEdFPHe/0g=
X-Gm-Gg: AYBFou3ozpC6mIo4kbXxHV98RxGnw0Yev0pEQpxCb8qzwYV4FDFUTmytiZ8ieyC10K1
	sJ/6z5l96fW8ZWR11nZGE3FynWCH3GSwtrGaZlK5iDuPUK/AsRJtXVT6GDOKsnhezH7CbwxuDpX
	mPqLQOkofkahWWNuLyTgf2orLenPORTeR40EZ/TvOKHg7kClPTTpk5kBXHkJMVgkvXJ6xS77JCn
	b4Yi3ze/xEiLYzQPf9QskZPHnoHW99gVF+wiArzSP1ZbndAPlLve6Hxsjv0fvm44PwL+5Wac9co
	xnnK7JIZj92AYkXHg5ZUDx4ek5QBvfOI+DQAjZ6LC+dfFGYvSJAh2y5LPrby1BxPO5XMezSuh3L
	/Zab4kVCYmZZQ
X-Received: by 2002:a05:600c:4455:b0:4a1:c6f5:2450 with SMTP id
 5b1f17b1804b1-4a1f50a260amr15362205e9.17.1792466529668; Mon, 19 Oct 2026
 20:22:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-2-0f00417b41bc@gmail.com>
 <20261004083036.613169-1-kunwu.chan@gmail.com> <CALa+Y17BOR0DBLS9-vns2SQfRhCueT0f82XCVojHhg9uacOX+w@mail.gmail.com>
In-Reply-To: <CALa+Y17BOR0DBLS9-vns2SQfRhCueT0f82XCVojHhg9uacOX+w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 20 Oct 2026 11:21:58 +0800
X-Gm-Features: AclHuK8qSfFyajdptQhJ0NGpKFtfIDqK4tiHr-fgZMp9gM24ujXx87HbJLiQhf8
Message-ID: <CAN_Opa9=5dqD7CUpczUAz67HjmvUYE5vLMSgSVqzcKLAcjVxng@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/9] mm/damon/core: replace the access report
 buffer with per-context rings
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, Wei Xu <weixugc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[...]
>
> So in v4 [1] the drain no longer touches nr_accesses at all; its scale
> stays with the access check primitives, independent of the PMU and its
> sampling settings.  A sample instead raises the region's probe_hits[]

Thanks, Ravi. Separating PMU samples from nr_accesses sounds reasonable.
I haven=E2=80=99t had a chance to review v4 yet, but I=E2=80=99ll take a cl=
oser look when I get
some time.

Thanks,
Kunwu
[...]
