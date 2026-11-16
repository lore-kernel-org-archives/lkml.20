Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856927;
	b=s1DVX5KPG+UcKUc1pcG7EWAzpL3IgWB2ytERr5/hBjc0MIk6WDTsfTMDWy6eoayCjUgq
	 +C5jRL0wyo0yEbcyqZ5OFmCqke+QaGW9ssodJ8ylAU2AXz9AusGqT/mHuGIOKoJCpFQNa
	 hBXnbXbSp0boT0MeeIipkks/cKReMFX7uqhVSL/QYzdvhj372/dflWqnk6+IpNdsFpkSE
	 Vb8hU6M/qq39WBxiLxsWStwrfx7pfuEr42ATn4M/dOXMOxkT3FFXb4AvDYj9CEMOHMcc7
	 dsbnpfZycvD0jqycH/0LzIm4jDuMlDi8tS+9SKO3CxhhAPGx1qm737tdJH4xg3tfsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
	b=q9V/EP3TDbqMKNOAiRsqdKf0bio2JxzhIUl96y1/tLhauJY8Q+9mcmOPwZ/NMgSD+aBP
	 0fHUw1/v+C4e2pFHGRJ8AO7Ish+P6xJnA8ffBcmZpV5KBoeKRk+CbAne33bIHCIzJRCfZ
	 Yf0m3QoAOXOa29lTOJw4ZkTTQ7O84QIvx1cLNHvhsBN23lGc0xh5Gqo/0fWaMjkiEO8w+
	 UcDPTXuBx7Plvw3N5xLD7x4maJdbEQl6Sk3D6mJqVm3VDJKJdhjU6qxF5A47EJMSh3Vin
	 DF0lvxbU8UicOfFgQvGiPGSacgSH0cdmUacnPK/FnZYD3bjjtCWPCiykI8ia1UtUfHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nRMS7S/+";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B711606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B711606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRMS7S/+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso3440592eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794856926; x=1795461726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
        b=nRMS7S/+s2Is0hyBZzp0u0FXGwf3uGVRM53Rnx6JBxjL18C39IVe8tfqvxRbjadSNK
         WUioEZPqrBNefjqg6vGnQg89ClP/bpuUyPvN9pF6ydLpc9SmQDEvwH75UlY4CUUq3jFN
         piaRj6AKYi5LkOXB+e5Dbz2l8jO4vvVkIw+WO/YJacySO2wPyu9IYH6/ZYim+TXEAVji
         YMoZqDc0ll/DLm8VfyP3YG5x9wbKxYJWKQJyKKSa03bADwy2nHK+ZNuP6Tp3vBlKXO8c
         qJKNqWqw+l3KUbclJP4S/YG3mCssdy2kOT75XLkYFx1XLfoUPFyJTGQuNEapvB6eIiJZ
         Tlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856926; x=1795461726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
        b=zFozCUFtSmQdO8rM9ohUBIjhgAegCZTx7hY+VmUe8jXrXp6HgUu6ysPdtbRQ6yhL19
         1EWBNv6FsPL6/oxXI9ZaWRMcpskAZUkxd8AnMV+ysWR+KHds+uG9gGfwgRW95FgL7wdU
         TlI5ID7WM5cF8C6j+G6+qfyoKijSUn3cbSRJKOiFpn2ZFY/rJikbdgfg5X08JVmP3tJq
         OlREjNwH03zur8BsTVlvbEC1Kr/6+Emdq8vOTN/nCG68WUgwkMWLdaTtN1Ju655dKIRR
         xhoaQSA/Kfktb+bR4otH5XOF/d3PeIdu4IVEBLv7E0AVaaPzmvxEZUTSutXMyiMenEGc
         GC5Q==
X-Forwarded-Encrypted: i=1; AL+hErHu28FcJLsz64kJaaptDstPSl/k8NO/PLk46nzhZqkz4Q88xrD4MP/sPeHYH0U0k0J+K7xqSvp7dgzTf9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9liVd1SGI0753G/hif+GFtQRZ1IlF73v9zDy2m7IUh69Y5ys84
	xX/xl5/NscCpEH+D38drpmFIwYjYYFSpf+kPsRGJyq5v9SMkJ14FLELF
X-Gm-Gg: AYBFou0GXR15agJhCDTP1pyA2QLtpNZmsozUZPJX/xL1Eg7L7Gc6GcbO88C4MYYB3At
	ZJLazFWLW43XZS4SydHafYSny0nZ8lY6dw0Vd1nMnWUHlQc99yhN/h7Qy30YP0qOuVeoQiI9Ko0
	GpUWFPAUq2BV44g1Q6J4RVZB8PIfRjHbPvPyTTzvXSTBRbzAAIWnDjxcOMdi4myUTwbyURkY2m8
	PWri7R5BysqoX0HZfI2XFsH6sAXxRlPY4U8gsIKwPlVrSypldQ8YsblQK4c28lDU/KNS5frpPlp
	K8gMlCopaCFhsV9Cyq/MFLYQoNucst0K3rGctS8kb5bUnxql8jXBAKdB2A9HA6bTiXT0xs4Ehit
	i/QhgZpk5bKLVbhT/cdoBJfZbE0QDRBE03n8DabcrC8GRDKhcWotghVrYklkYuaBXwaoQPYuyWU
	9DjI1/OQBnCpp/OwoYvQzvSffF0yKMy7pWZHJuVSJ7UclCiLt3+0KtmoJQz7wTHV7PCnI85Ezph
	zsLjNAOEqHgxVCborwGtGIcWteAy+M4W0A9hhWcC3JGsF8ZyQJaBHdIoWjGCsmmmrnC+NZHJ1uO
	oL1S6DAvxwJY2gveoUSjiRQUO7D7DqmYSvan1JFHYe0/GQeDDPObuQVTkOsopjxwm8xnmaeGqu5
	8CwdjDOZEADcgslE+VsnWrz/xrSshRIww8Bj1hTZHZB7CMER7tOHnwgtUt1AftRPXpv8BRYd8ns
	36y1Z9vHfGdh7a8qTZWF2KtyaxdyO/R7G9sP91QeIP2w==
X-Received: by 2002:a05:7301:d189:b0:36f:a651:d649 with SMTP id 5a478bee46e88-37964b08e64mr11776840eec.4.1794856925787;
        Mon, 16 Nov 2026 11:22:05 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34908993eec.22.2026.11.16.11.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:22:05 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Tue, 17 Nov 2026 00:51:56 +0530
Message-ID: <20261116192156.33333-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-5-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com> <20261115083741.62140-5-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 10:37:41AM +0200, Svyatoslav Ryhel wrote:
> -	if (test_bit(0, indio_dev->active_scan_mask) ||
> -	    test_bit(1, indio_dev->active_scan_mask))
> -		mask |= LTR501_STATUS_ALS_RDY;
> -	if (test_bit(2, indio_dev->active_scan_mask))
> -		mask |= LTR501_STATUS_PS_RDY;
> +	iio_for_each_active_channel(indio_dev, chan_idx) {
> +		const struct iio_chan_spec *chan = &indio_dev->channels[chan_idx];

iio_for_each_active_channel() walks the bits of active_scan_mask, so
chan_idx is a scan index, not an index into indio_dev->channels[].
The two only match when every channel before it has scan_index ==
array position. That holds for ltr659_channels[], but not for
ltr501_channels[] (also used by ltr559) or ltr301_channels[]: entry 0
there is LTR501_LIGHT_CHANNEL() with .scan_index = -1, so scan bit N
maps to channels[N + 1].

On ltr501/ltr559 that gives:

  scan bit 0 (intensity_both)  -> channels[0], IIO_LIGHT: no RDY bit set
  scan bit 1 (intensity_ir)    -> channels[1], IIO_INTENSITY: ALS_RDY (ok)
  scan bit 2 (proximity)       -> channels[2], IIO_INTENSITY: ALS_RDY
  scan bit 3 (timestamp)       -> channels[3], IIO_PROXIMITY: PS_RDY

So a proximity-only buffer waits for ALS_RDY and never reads PS (the
"if (mask & LTR501_STATUS_PS_RDY)" block is skipped), and pushes
zeros; intensity_both alone gives mask == 0 and also pushes zeros;
and enabling the timestamp makes an ALS-only capture wait for PS_RDY
as well. On ltr301 bit 0 is likewise lost.

> +		if (chan->type == IIO_INTENSITY)
> +			mask |= LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type == IIO_PROXIMITY)
> +			mask |= LTR501_STATUS_PS_RDY;
> +	}

This is what iio_find_channel_from_si() is for, as Jonathan suggested
on v3. With the export patch you sent separately, something like

	iio_for_each_active_channel(indio_dev, scan_idx) {
		const struct iio_chan_spec *chan =
			iio_find_channel_from_si(indio_dev, scan_idx);
		...
	}

(it also returns the timestamp channel, which matches neither type)
would keep the type-based check working for all four chips. Since
this patch is the export's only user, it is probably best to fold the
export into this series.

Thanks,
Arnav
