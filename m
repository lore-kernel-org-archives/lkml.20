Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513515;
	b=t8sGK1CNiKeRvzuUJCYr/SC26fiIF093E8L7fOrZNLYniI6y7H8xNNjxFcxqFvhnjIbk
	 HGCgGdpbWlKnm980VjxJh0UZILcRkVmFJFl+S3KZLltrJsDCk6lauIwAjnmgBh/GSH6kd
	 ak5z00IEvKX9RQB5f7Tb6+uAQK3eRHRehTvIzr9BT7qFxEUkv9Tt71gBUgvY4KlbwmKiH
	 xCRGHgRFhmPtpPZHFvuBR+MK1BZZoOnOnngw5yfIeoFgH7ZqfmoysNB5+j6Wogk6ZSGRE
	 cSSb7/7thBOerQdTU+wRjFRwOw0aHQX9QR7oFHHdmbsw++O3YSKC6qxIN7o7PZJc2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
	b=M8jYhu+0Pinqclbxws+cIgQks7FhU/TrCHhlN8plrn0VRd5Dk3ZBjxu08G5MXFIkGOi3
	 LlTgo9ZSMMfRHlmFViwXePtS2VI8Jy7yFQ8n98L91rlwGTG3HwyW1WwFYqcU+wURMWin6
	 blpA05GOiXh/kyApGzm0LPlSgBXo9J0yULVUUGI214pqgbaLgFxalHNcBX2GSTFSaGb+x
	 VnW9LUJqAvUf24YZNqsxPKyDJ9KfLiijzDTctZzy4cs5LHCx6LKOIbsKFj0bx/muj8gHF
	 W7gTmYhflNfbDE5JfKtf9CHjMhITsLBJNpV7rjnl7NTEPkvUk7xi7//PfvkdIQThxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT2rIuBM;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0865606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0865606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT2rIuBM
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso745350241.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513514; x=1793118314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
        b=FT2rIuBMmyXTaQsPut2rxO01PTvpI0lTY6Gq2VMb3qGEgVtC19MBPB/rn7nr7p6HyO
         TO/H/iA8b9O29s+mQZ+hfNcV2whFbpDaBm/g3ERJRPzbD+3TiOUWzHON0XVUBl5+5z/u
         8rtAha4fAXDelEfpY8h1/9qWzU8ajpi+ARdPc+slGCtkYBBy5M0rScjU5nAeZJBg7UTY
         V0Xi4igg/jtxBNWZCGcyIPyaE1zIFT1xr5UM4xDl1UfmdqJ20e050ITJ6tJ0Lguimjt6
         GyvCKsfV4cKgGwRNj8v4++sMdJzx7FX2YVBKb3AR18SodGJkMGuHIDrFt9xyAJnEfwkX
         wn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513514; x=1793118314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
        b=fuSO33iXOQx1VBK3RXi8Rp4QykqxbAYqkBhydwiGJSFI8sMR/EVFrfC0z/iYf2DNYB
         dKRlAlcpni6BLKiPHWvBfgO3k+TxVsBClb/K0EfIPfMJPnZx4I9sBbSWv62oxxN2Eq9W
         DUKmwZzrXfZNy57kSVtMaDe3WoxokVS6mONugwaqSrHd1bcJM/W4gUEk1wOwRTvcFsPW
         1H6AtJXyYZsP9J9QpN++qWR/Q0Lygx4lCk0VzqfwpJzjdEb//FraZXL4pD7iRjZnsZHg
         kYE2XAVxg4ledhqbHx18mFCrJurIXK3RGe/uwzPMERgMGEIpu/SVd+UAqpFi5H2OlCKW
         mMDw==
X-Forwarded-Encrypted: i=1; AKwUvBxtzD7Xv3MuioS4irdWTuRFgJS88jHTAlTOgtSZbViEg06vsH4ffk+75hT+EPdjsdZJ5INea0sV9QsYP3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJHnBfCZ86JdgFNBv46trY/6xU2UEgiZljTaco8HjVP1LbfdTF
	0GUG0ogubW1+mVmrXq41iuAMoPePLJ3VpMQB0Ne/aF1s3M9v3/CxUrjH
X-Gm-Gg: AYBFou26VfFp0FJcc/25KrwxxWerNaJjaXME2NBnh0DpzvfymR4yOz8afcRRbPdzlWY
	HEts2bDO+Ji9tZz+GJbbnJhHPDIoIfvr4Lxivo0yXHxM1To+Cu/sEv3Ju88ptBXY2oAWGcTWOf4
	Ca1HUrOjhmboeaHwthEx107f0wTItzUv7vHnhllPkDp/g3yu9SdaIvZGVeAjog9t/KSaB67cANo
	JR3faaL8TQtsLxZl8f76MRK98+EaKCzOlFRXNqc6JByZmj8wv0e+kr9kAwGrt+a6bi7p0Jb5LKG
	pNHlJTMZ0SAIXwvaNwY+uyfYu5i8x5pK5Pa4kkwk+NNHzyz9V3VXS8yFfJTJlpK3uN5hbQge2Ff
	rrUCCXGTsGSfCD5rYu+Q5xqEGdFv+mGN/RxI0oB5SWTWJQAm4xstmH5yI1oZt2SnJde3AYP4Xle
	SRYvlA8hdVhqNi6VukV3EsdPPoPbtcvs/rFalnrlalXONe6N+qZc8NLVSosqGVrDqkO1jxZM8hp
	QWGdJjkUU0frpjfq6YZbQTKhnGyNq3HgKbLVvlvIObl6Wqyw1K3yXkb8DLXyzC6bioGQV05oR5R
	WeM3ik/599/zTrKWN2XAOzo9tfZH9C2Q
X-Received: by 2002:a05:6102:947:b0:7c3:68c9:d24b with SMTP id ada2fe7eead31-7cc369c11fbmr1937696137.17.1792513513614;
        Tue, 20 Oct 2026 09:25:13 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e0ba56sm297984241.1.2026.10.20.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:25:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:25:10 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, corbet@lwn.net, khan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] ALSA: jockey3: Add support for Reloop Jockey 3
 DJ controllers
Message-ID: <u74rh4prk6dvevot57p5ewimezjfcrkidw7zznqomcebixvmrg@rngpubtcmrnm>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
 <874iegh5u1.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iegh5u1.wl-tiwai@suse.de>

On Tue, Oct 20, 2026 at 03:14:30PM +0200, Takashi Iwai wrote:
> > 
> > Frank van de Pol (13):
> >   ALSA: jockey3: Add probe skeleton for Reloop Jockey 3 DJ controllers
> >   ALSA: jockey3: Start the bulk streams
> >   ALSA: jockey3: Add PCM playback
> >   ALSA: jockey3: Add PCM capture
> >   ALSA: jockey3: Add KUnit tests for the Ploytec codec
> >   ALSA: jockey3: Add optimized codec variants
> >   ALSA: jockey3: Coalesce several packets into one URB
> >   ALSA: jockey3: Recover a stalled stream
> >   ALSA: jockey3: Add a watchdog for mid-stream stalls
> >   ALSA: jockey3: Add sample rate switching
> >   ALSA: jockey3: Add MIDI support
> >   ALSA: jockey3: Add power management
> >   ALSA: jockey3: Add driver documentation
> 
> Thanks, this makes it much easier to digest and review.

Thank you.  The functional splitting took quite a bit more effort than I
initially expected, but am happy with the result and makes it much easier to
understand how and why it all pieces together.

> Now it's already a time for 7.4 merge window, so I'll check the series
> after merge window is closed.  Meanwhile, Sashiko already reviewed,
> and you can enjoy its complaints :)

I already started analysing the Sashiko feedback and take advantage of the
findings/analysis to further improve/harden the driver.  I'm quite impressed
with this tool and think it will help improve the code base.

Good luck with the merge!  I'll regularly rebase the driver to keep up-date
with the latest kernel, and submit a v6 patch-series (same split as the v5)
for your review in two weeks or so.

> 
> 
> Takashi
>  
