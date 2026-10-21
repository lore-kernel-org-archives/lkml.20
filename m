Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792580164;
	b=3qZmukp81tGAAKSYmFSVa0li3JpExqRJuZi8sNP+u5uPfRjsgV9cWkkAGQdQiXWc5sdF
	 Q05ETEY2Y7HxwywHDpqky7r2Q9kYhxsaa7oSc3CEr0zyEg7MIhk9cCMq3iFX8F68Xl7k/
	 PDqA5UlG+TR1RaGxx0ZPH1FQ/jQ67bwe8GlBol6zo/qtUP5D1hHrTGzrN6jtrs94AG7ZC
	 s9AAkkdLpu3DiHv61Ih/KzdZQHVqh1einw0QGLEhnRBVpg5vNWUBY1YJpnXCgKeS6EhGH
	 0nEcU1/64mUrT3Zu2WSd7xVl7Danr2DQsC+M9YDNrBDFBjGPQnyMZ5smwGHNTJrDLfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4dkFwPF8mYUAaBh9IOGYKB+nWS60kkd0r3c1QMBo9hw=;
	b=tf4gzf4d4DNhvaDE79l8AkhCkQqFu4HfzpoGa4pdkZINGgE3U6Iqaj/H1e83s7EVgENi
	 l8bPk8yESvtOkWUzXzJnRBasGCQGXfubFOYPBf4Q3neALp1KobbMoVhdkRE4TCpPvxYbq
	 9T6VzQ/nIx6ZeO52hLjZejI8+JApoNjhMU/9Ny01eqICZ3HK3dpbJzuZCxWeL+uPd4NIY
	 pY51uLkJGsvxPnWk3h5G2PhbMnCcFQUGuwT2LXyNnp9ZHZA+5vsx92X1Y31FXrThQl4i3
	 nIO2/NEfc8DV32BoInbhdpS8K4J/NeLst5Vrl7FicetZrAuyQhA7mvoA95X9eeJOXgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LStKsrBA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA05606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LStKsrBA
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8acda240937so4774697b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792580157; cv=none;
        d=google.com; s=arc-20260327;
        b=rz2sYxbgKSkw1goXhYpWnV0W3gV2s8Ij8+QWXi06A9n/D/YNU6J8EXdW64SLmhdyhn
         5NMk5sdIpAWyjtbxEmGQlGtJ+Zhwmkmx7Un7o83sPIoJvwR7kFtd15om617d3jqrHfJz
         np7H80w+0+m+OwMMuSEcd5jiPhXQNHDgkJxK3Tm6Kk3SZ1UiZ5zxnVuM/6OF9km883pg
         M1XuDX8WMLTVAn1XpxzMeECFhSPh2vmXjsmPHt4gORVaMmIXTHzXzKKoOaHCVKjD3rcj
         tnlPfCGOUvrm51axm4M6010KRkvuq+E8IPLuErhQ6J6vtUl9KjbXdFOB9f+Yw3o1Fbs9
         F2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4dkFwPF8mYUAaBh9IOGYKB+nWS60kkd0r3c1QMBo9hw=;
        fh=/l+uV2VLQZSprlHmn1I4e6Uhfu26IMFDKnsxccSGxXM=;
        b=U7/HiYDmjIfixbyo+c6N/CnWq99b9eZq3d6lBM7pAV2r5fHg3cL1LmZQmTU5d3Ij0x
         /rrj1ttw7A4q7C21PVlzFxwMe2G00b/Kyn6n+UTBgBmsRZIDOiznW5kObomLWV1Hu+h5
         4p8qQ62y+3NWnUCmphtbtVQ6JuaP8vMPx+owV8sHf9Fs3cLbidXxnUnJMIEQwU3Ocsec
         OycTAjxtQwiaRp1FIuLzFG5vpgIYi5AKq2xhw56PqGv3jdhCeSSgm84y292PJ32qdpc+
         7LKcI7hFKyzapvfPMMZbQP5poIQ6oLJIy/hjKjtwNwRVTIEY6nku8x4p1y20FqaY5ZsI
         qOCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792580157; x=1793184957; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dkFwPF8mYUAaBh9IOGYKB+nWS60kkd0r3c1QMBo9hw=;
        b=LStKsrBAmkLyaIDo7eVvgJ/m9vUfRWLRIyJ6OihLsx6GHpMB7F8VmhEb9hY54nkHT+
         XAsvZTrvDT3kC7e7pHIkkp1p0svg27WFaKT5upHJaufLe0yv7syM14crajjJrwyX9cB9
         RXQCO8tRKSb7PW0WqE9heGNj6QsK/hQ7AT/K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580157; x=1793184957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dkFwPF8mYUAaBh9IOGYKB+nWS60kkd0r3c1QMBo9hw=;
        b=smUQP50Cb7XzZjK+Yldt7OZ8oCujDcp+k1MJDhLj0GlSFT0hhG0ey+Wj6ZekLQ4dOd
         RXFjmISQzxaOEKKhN+rqZW9hZ5JH2HH9YJxtg837z6dibadLTDuUkmvMsryRhVScYlXr
         9BAuIaU4saw/AOhfKqowYkEMA4Jr6Wz2+hvLqNVcSZZIfAatvofnmWPdz2221xd0Gb+M
         +Ou31muzp2ivGO/16NRRzIW+q6peHDiRPl1lYialD690TvDXciY5V3IVbZtKJZ/sG+FV
         EdcC/u0wyYK5hvR6srBnTC+OzK4F8ZyWfF0aylgO1jJMGjsnrGkOvVY9RceeZcwr//jc
         SpPg==
X-Forwarded-Encrypted: i=1; AKwUvBw3X6lefTapvuioELIbs/CllDCKnN7odkY1eOiLEpVgiSA6gsDlwa87gCr1RfgPDnRfvUSVleqtig3dtO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHdBLrQ772AAFkS/zwIJ0z5vJfb8QZjdHTwccsWXnjB1rEJFQZ
	donCYyN7OcRqu3L9zxZhiiUNCu9r65I1vWb3Mj1PT4j7sV/2qN/KWkyisWsYkNhMmZ3PC06h8R5
	bRR9hy1NLDQRe8kgYa1YL41ja8ORKH37Z/xh0KqLBLw==
X-Gm-Gg: AYBFou0EWsOuz/kRNyk5t8iMu9DadgNTCOuuJvDq9JCePaWVAvg0YtOdANjmOJ2RVZ8
	PjwTOVl1IvpbFrB5nx+gv3YyLP9f9TUiBXzt5yy65ME+CNnBbuJNULhwtXlhvJIyxxg8h2jWB5o
	JfYv6mRCQAX0Xw6as+Xwcd0FvO+vNsR62Wz1KskimlLpJEAOUwdjGGsVa0MjJh32Lu4lYtrS52r
	V484xA5Sv0OonTbhjJJMStr3PMjeKb9bKwh970b+3gTsfMtVeVA53vPeBSSLE7mAJYI1OGLhudh
	huil0ryhj+HwXMUtYvsLs3o/OIqmwl6C2+IU/dob1co3GY5/ozQxLSrx8PTyyVOh3DgZH5BwKeU
	fEhjhO0uv1mQdjXNHxoOVuurTa+F9iD5es/9hte0=
X-Received: by 2002:a05:690c:e1d1:20b0:8b0:ad90:98c6 with SMTP id
 00721157ae682-8b134013d3cmr5679527b3.35.1792580157475; Wed, 21 Oct 2026
 03:55:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
In-Reply-To: <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 21 Oct 2026 19:55:39 +0900
X-Gm-Features: AclHuK-tt_OVDrOG_j7NK25609Kp5bxH3a2aysFucE6vALWwnla60mO_ZldS66Y
Message-ID: <CAFr9PXmntwx06iMc200d9HPoOeCE7XURpS9jiWhB3ud_+QQggA@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Colton Pawielski <colton.pawielski@gmail.com>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	dlemoal@kernel.org, cassel@kernel.org, linux-sh@vger.kernel.org, 
	linux-ide@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	fuchsfl@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Colton,

On Wed, 21 Oct 2026 at 10:05, Colton Pawielski
<colton.pawielski@gmail.com> wrote:
> In testing I could often lock up the board when transferring data over
> SSH. I don't believe it's related to this series and am fairly sure it's
> in the 8139cp driver. I have a candidate fix that I plan to send in
> a couple of days once I've tested it further and there's no more
> lockups on my hardware.

There seems to be two issues: One it interrupts for every packet when
the 8139cp can hold off and not storm the processor, and there is some
issue with the chip refusing to send small skbs so the network layer
starts locking up/timing out. I was planning to send fixes this
weekend but if your fix is one of those, send your version, cc me and
I'll test it out.

Thanks,

Daniel
