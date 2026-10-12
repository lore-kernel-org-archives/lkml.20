Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34941331200
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806315; cv=none; b=GbxP5hvFBd78ld9/T/Y29yE01/jZtkyJjD6PJs+7PjMGMcLOkMPNgPOMkTs4AXLawUQ/OxquEOnCfoOL06oZspJBkAlIdeUDe6hdee8lnh8eP4DtyULGG0yl5Aef7cbaB/aRYUY4vS18cFChvoZLEjDUrJzRAEQghjhWASyPBdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806315; c=relaxed/simple;
	bh=ZN1vayRctHh8NpBgSGCZwcKF9qbdnQM1w14tC/GzSnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZ89hdMyJ2B+RWH3g91RWCqw6l11EASurm4ALqAKMJZI5qQUFZlf5ywrpSfUgTCMArtRwI8R5wiObxa5XvdenRTaeFTiEPqAGP+mQCBeQsrzwtkjZ7mCTKmC3wy6sjhbyOG7Bt6Vq7tM0d4RCPVszE+b8qjnEE3VMQ0t00tGX9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dDd6HIw5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIxRFW4A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dDd6HIw5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIxRFW4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791806313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZN1vayRctHh8NpBgSGCZwcKF9qbdnQM1w14tC/GzSnc=;
	b=dDd6HIw5mnK6D/V84ey9XV3EXe2OH+RpM//PLumhMMaP6feAFe+NeNEw5yFmFcD4z/M4Js
	vbry7rpsts+OYCRI1NTnDJ1wdmdFa1MTtGa32458vjubDFqrdq0yFja8VD5abUOt31rv5w
	iPkNUNdR+MxOQjxgrOxBMhFk/BHhwCI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-X5WjvHWkNIqko4GlsYoY0Q-1; Mon, 12 Oct 2026 11:58:30 +0000
X-MC-Unique: X5WjvHWkNIqko4GlsYoY0Q-1
X-Mimecast-MFC-AGG-ID: X5WjvHWkNIqko4GlsYoY0Q_1791806309
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso15120605e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791806309; x=1792411109; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZN1vayRctHh8NpBgSGCZwcKF9qbdnQM1w14tC/GzSnc=;
        b=cIxRFW4AHMzc2ZwtUghm7lDyeMCWvsk2to4ZmmQg/km/f9ZD8jwRKUAlfVMtpoxJls
         CeBl1+gXLlN3c+9xy8dCK03G1a5UwpBgH3OSFPsreWR/PoKpAnube/y86KZWDSOJueak
         mGcP4FW6KcrmZ7ue+OwIMLzD9i5CdxWoFXvqIdGQ/z6XhTZUdyqIKFUWnaiDaB9rM7pt
         0Tzvdy8Ok7PU8q1XaTlwUzBjx/mZVCRLILaanXunzrUuA5PmGwH8NVl9BiZQu0Kz29VP
         FoFK4e1GzTYmAae/ClBkIt3/h3R0v4w6Rc5KQR/Yh5BmZGJCW2yGL+5LPJ/vI4DVscui
         OfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806309; x=1792411109;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZN1vayRctHh8NpBgSGCZwcKF9qbdnQM1w14tC/GzSnc=;
        b=1df+jxC2k29rYN8u/07e8IrEZp2Kb+WAqeqKxC+UtD2FzA1+ep52NdkOhU1L21yLtq
         f2qmS0SYdzxNHOSJWyg5QlXVM6Cx7uohIMg8Hol6kuwex7i/2etp9LbV8TSkxzqd7WuY
         cXJ66kFmq7E6hUTmTub0Sk9P6ipH9FxLd8U5p1+jMFqaXNA/Cije1yMUoXi7Zllu4Q9P
         gHFQQOSQVdPPzF+PBwjR9PFovSE8sf/PDTRna2e4S0mvQxYPTmK0oVpKJJbNVI/x/Cdb
         6IFubazJPRL2CMWuW94v6It09i7lrndVMwuRjou8l/lNrss7c41pI4DuXBIl/uB0cKrL
         212A==
X-Forwarded-Encrypted: i=1; AKwUvBy1mzM5E5tI0RW5pBWTrC77GqcOjyTQSkfn4xMeoJK+seuUSbEu05XIQGCxva3vKK37/b/fs8JY48xwFQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYID/PVxWfAaQPSovmPFXCjocXLzt837U+DlR7tytS4OHQWr52wV
	3vJC5R9LNSPv5C24y3LwU6xncvE+PhU4JkKV+n5YfQnkW5+m/hejk7NarOgfBxFjg7i9QAoumCQ
	mkLZ+O15WXcpXM/bwvlWIHkbn3mXdpQrGWB8poLGL1j2EisMLZeWw8kzU+6NMRUdsXA==
X-Gm-Gg: AYBFou3iR7ZYdcljXzqzT4nSknhVn+BKfxtfoUnGvP16E4CHzVfI7gKD1+54oRZChZw
	8x45UTCLTDK0chvpF0b9Qe0CYXuZiDi+d/WsMVL1zZuZDvD457oknw1pXjvX8FJ8IqQeLF9v5bb
	AZ9NyC2TQB5sJ980pdepvwJ/Zjod9Rh2BuTDKZtzUWmRzvQ7McNG/jR3SWy/j4u4dwYawFJujYS
	FWKCv8S9MfeQJSpcZydZqyJ4pf++tNpb8CkC8SV7EqDl2A42mEpl5mXGFFAUZ1sTKInk9yr/Buq
	ls9gRcVzRVvWL7JkY91ae9AS9CWOs7p0pgxuO9lOwIkcq1LccwBdjcsa8wt2eKqbh45G3W/sqWi
	w06Bdmr/ZhYbkvjXCz5BEAJy1/8fj
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr171082695e9.26.1791806309397;
        Mon, 12 Oct 2026 04:58:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr171082355e9.26.1791806308919;
        Mon, 12 Oct 2026 04:58:28 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20228336f8f.9.2026.10.12.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:58:28 -0700 (PDT)
Message-ID: <3eb0948c9ca67f64b3b311f823cd0f7628033c68.camel@redhat.com>
Subject: Re: [PATCH v7 00/14] rv: Add task latency over budget RV monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 13:58:27 +0200
In-Reply-To: <cover.1791745088.git.wen.yang@linux.dev>
References: <cover.1791745088.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-12 at 03:39 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> This series introduces tlob (task latency over budget), a per-task
> hybrid automaton RV monitor that measures elapsed wall-clock time across
> a user-delimited code section and emits an error when the elapsed time
> exceeds a configurable budget.

Hi Wen,

there's been a conversation at the LPC conference about completely migratin=
g RV
to BPF.
While we aren't sure of its feasibility yet, and it will take time, it's
something to keep in mind for new contributions.

First of all, would dropping RV in-kernel support negatively affect your cu=
rrent
workflow?

About this series, completely converting it to BPF isn't trivial, I can kee=
p on
reviewing it and we could upstream it in-kernel, then convert it later (tog=
ether
with the work with other HA).
But I'd prioritise not affecting the in-kernel implementation much to keep =
it on
par with the BPF one.

I'd first like to focus on what should the rv userspace tool support for a
monitor like yours to be useful. You'd have all reporting as stdout (or any=
 BPF
reactor you'd want to write), then we should probably support some way to s=
et
the uprobe location and threshold before loading.
Would you really need dynamic uprobe addition?

What do you think?

Thanks,
Gabriele

