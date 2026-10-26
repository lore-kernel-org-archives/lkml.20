Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986289;
	b=JuW/cDjhLRlaZ8QMQ4wE7Y6dkJkHeeOg9UCKECrK+6yW6wPINTGovtKZuNlbkIS0LmgA
	 f7kIuJHcJ3rx4q2GvqhJ19NZHWTI4rSaOtlT3FcuoyVr/RUWxfFef1uZ/nvlCqMK2QoMz
	 7z6iN/RnIktFQSuOfx0/J5QSG766JaoCII7gOlzAM7384Bm1EIRg7nEDBWecYuO7WMPN7
	 UQaxV3YoAGP4NjrnVzOPVEND4NOP11J95uqq54Yps9462RxqRQ++wMLfqxZxcxbz9FUXx
	 OfNNxwgRupe+ydhLo0oz9FL9o7RMaPQAi81/YHC613KLvLJnQ15V+DJlaA2g2nZTEog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
	b=lvHW0KYSUABS/UKsDXUEn9SmjvQ7muit0qBN6vqHj+KEQsQIdNLhXrmrNFdkVo7o7yUH
	 kQIjoB74hiPeEEOXwvX1OjqFAlzVnXPQ59Roj7ONMnKyv/nZ7xzgQdNwD7wKa+neBuMOC
	 GyD4d5l+1JqhEIcyZcweYC4NBZ7eEFfjEaJtXuYP5DQBErIE+KhgL6BB0LPB9N4Oc12vs
	 1/Jczkkray8cM35iK5f8M0YVcY718LRObu2qLbVcdrr7bZ3OmF3HNbUibs7b7zPkO2j9J
	 XkJgJ1smyl2G8hQJRhERpum8lJBgaosZsrKQ2oKwpxW1GwztlR7K5erNrF1xKXjOkXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZI0qVFz;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D57A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D57A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZI0qVFz
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso1356149241.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986287; x=1793591087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
        b=PZI0qVFzdLhpLXhzbHGKdoD/1uf3IVOBmnibJVbb+XPXpULEfVaymH6iUPbYnP2RNG
         fSHMFkRdkdulojLA7Yg82U1nzDpKbCzofeFqfrYyXUCBBe+3vLpnuo9w6QWVu8rUO6KX
         C9crbexWoN3nO+694eJkzeKtKthvVErsJKOxwp95si8YkHerGDgvqjWKLTGUvdF/6xTi
         +/TErvLy5ZTFua+sW/443VVIAdJ2+KAtfjC2coBCd1h+3CyXI7wKwzaGgx6UGfOIShzs
         4tnBt9e+bJpdm+nO25+A2gVJ6uecScTsanhmzo2mg7FBcfo7pw4A8HL/nuHMbYrKVbNU
         Gjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986287; x=1793591087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
        b=WivF1q56+Eikb3RnB0G2DXAjZUf7NBkM3Y+suDOyUN1pK1CGlKv3lIpLY65AjXQIJH
         OQmJ0Z5iQsdSk8lQMDEHcmSW/3ugHVnr3gW7WX96vNjOuokdmECrWDHOUvZaH/wDCJ0m
         BsVFXSbipr8HbP3MTUBU1ghKj/TRFUdQ+1uwpoKtNI4qR9PFb5GiQtK40mM9yurUzvX+
         BKktV4VeehHLAwD7TxHOQSKQB7HS1voyfqkEqA/oD9Bit5ac+8clgoMwkSzS7UueaGD/
         ObAt0sVP2ryApiFNGMZYV8iaq/lFuwFu6355ElHwym3v4HM8BB/V8bJuPyKv3xMQPkb0
         mH5A==
X-Forwarded-Encrypted: i=1; AKwUvBws2VHLfpft28nOMYn/MoA3M3Cm7rjVbTRMFCi2bArtDXcrX+8ugsSCdjqg7LuOOB8ymsY7jZpPuJXp+qY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm80nJ/agxVvoRvHgxOGmsGT1KNrmr1beCJA3/P4MLu/IomQbF
	ZZ5WvTGxP7VzHkuHLGzcNVrwM4RsYbuEyWWH/EEy4cCs3BJXHHKnhbkJ
X-Gm-Gg: AYBFou1XuINm9TSBBKyNy8O7O1+4gN4duLFMCU1c55mINn3pf+7UMETNDvNff4dcifK
	H2wjptW2amssgWeTpQsEtvuljfnMgJr5rAF/zTRZzF/Jqw0r7WkNdqkw2Ky9zzX5TQyPAR8uidY
	ox6PgXKBgo3MGIIC/pGgZEfDQqpJzZra8HqiHPwxcU/QUI7Mv6FKH1LvYV1RJgkFpvVkCZWmrFP
	z+XioYCo42U5kww4L8lmu+4sxr88lP63yFDUNz91t9UHW0SwhXsVE/rxcyNSS1efBpSzSpT8S66
	T/mfdVVoaQIEc4tOhVJH3zHRZ20q6gRrd6nJZYV6b8QT8oApanlf2m5C7BmhJ9XMtquHTHaoDPX
	YU4oepS5Y269UXNTnyYZBM1swEYKFBOhYcwQp+TFzCjyOAFLbd7kBKCzDv653Fpxie0kctN7iYW
	wbh4GComE3b5EZkDQVnd0mFwRLNLz3ZS/nxnG743UvpwrVVPQdktfAW0xikYLYeg+b23qFvA6wm
	dN7IiGSKfVCzRTtm8jCxz2ZWOIcu166IJGyfXDHkV4+HNSvwunc70gr9rxN/niubKNKhS3qH3dA
	rwwFiz2PQae7kKB+8LVZ
X-Received: by 2002:a05:6102:83cb:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7ce5cd2d77fmr1526100137.16.1792986286951;
        Sun, 25 Oct 2026 20:44:46 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e6cfb52sm7116134241.2.2026.10.25.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:45 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Felipe Calliari <calliarifelipe@gmail.com>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: ov02c10: Split the PLL registers off the mode tables
Date: Mon, 26 Oct 2026 00:44:24 -0300
Message-ID: <20261026034425.74516-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <asAYI3pjBMHAdnTv@kekkonen.localdomain>
References: <20260923144257.119076-1-calliarifelipe@gmail.com> <20260923234100.318151-1-calliarifelipe@gmail.com> <20260923234100.318151-4-calliarifelipe@gmail.com> <asAYI3pjBMHAdnTv@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thanks for the review.

On Fri, Oct 02, 2026 at 11:46:27PM +0300, Sakari Ailus wrote:
> On Wed, Sep 23, 2026 at 08:40:58PM -0300, Felipe Calliari wrote:
> >  static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> > -	{0x0301, 0x08},
> > -	{0x0303, 0x06},
>
> I haven't tried to figure out what this register exatly is, but this patch
> changes how this register is programmed. After this patch, the value of
> this register is always 5.

It was always 5 before this patch too. ov02c10_enable_streams() writes
the common table and then the per-lane table, and both per-lane tables
write 0x0303 and 0x0305 again:

  common table:  0x0303 = 0x06, 0x0305 = 0xe0
  1-lane table:  0x0303 = 0x05, 0x0305 = 0x90
  2-lane table:  0x0303 = 0x05, 0x0305 = 0x90

The tables are written every time streaming starts, after the sensor
is powered up, and the sensor only starts streaming afterwards, when
0x0100 is set. So when streaming starts, 0x0303 is always 0x05 and
0x0305 always 0x90, before and after this patch.

The tables come from the out-of-tree driver [1], where each mode table
has the same pair: 0x06 and 0xe0 at the top, and 0x05 and 0x90 under a
"// plls" comment at its end.

Still, you're right that the patch changes how the register is
programmed, and the commit message didn't say so. In v4 the series no
longer touches these writes: the common table is left alone, 0x0303 =
0x06 and 0x0305 = 0xe0 included, and only the "plls" block of the
per-lane tables moves into the PLL table, which is written right after
the common table. Every register write is kept, with the same value, so
0x0303 still starts at 0x06 and is then set to 0x05, and there is no
change in behaviour.

If you'd like the repeated writes in the common table dropped, I can do
that in a separate patch after this series is merged.

> > +static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {
>
> I guess some of these settings are determining link frequency or pixel
> rate, so they're not generic to anything using 19,2 MHz external clock.

You're right, they set both. I have no PLL documentation, but sweeping
the registers on my 26 MHz unit shows that 0x0304/0x0305 is the
multiplier for the link and 0x0315/0x0316 the one for the pixel clock.
0x031c divides the pixel clock, and 0x0301 and 0x0303 act on the link.

In v4 the PLL table goes with the link frequency instead, as in
ov08x40: a link_freq_configs[] array indexed like
link_freq_menu_items[], each entry holding the PLL table and the
external clock rate it is for. Probe picks the first link frequency
listed by the firmware that the external clock can produce.

There were no comments on patches 4 and 5, so I'll send v4 once I've
tested it on my hardware.

[1] https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c

--
Regards,
Felipe
