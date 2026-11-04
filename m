Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782459;
	b=o4WZUhX6PNn/Mki/IQL2ePHYV19BhO0ugCngI6514QzKTY0L8jWRk3ZN8Q9Q+0KctwtW
	 ckaVzQG1xKYWMZknskwpgrt4TviUqqcUUifwlNWohSfTwqZ+zezKevrmtoNEtXIBDX6VG
	 kdfVQLQceunfQa3FiIbiP04KtmYUOoMX49J9WxiftMLVb6GhklR9lrwIdP5OQFGNIfeZK
	 5GQkwjl1lQQNuvqBrpB5fPrAcozRkDI1SX8kWSXmqdP77/L4qGOGemm10Xpk8RKICi5dL
	 +iDEou3HMRMvIUGW4pB3ozPtHq5z3/KCtZOPWhqImm9eixeJrFHgjfTv673D9Rikxrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
	b=ExrAcOqLl4YfTugGGvulaqkt/tJmSEZ3AGgk/wQMPk94Fl7JIhqlS6u0L7bw7L2oJIin
	 VmgLsXp1sn519Ht6nKA1xC35sBEarjovWcfE6/vr1eXO2J7+f761I7i54StmSQwlPRpCI
	 ySa6mAy4dMQVQCdJRvJCSYAbKWM2JutHOar9jdbtw4QgnrWWNoCSBwNF5q5kT3zdvAlJa
	 5bGPkEd3E55N0fgWdS90QHRfzcVIBrryCmjs1BSQjbWtW1EvK5jwvaazPRARxXNFlblzB
	 3l4B53NGmoI5q9bqlnRY/rXZdWh62KhezWNRdsgYTaMqhlvlHLeE3Th+6H0x7q3q2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B00606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B00606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d63f60bcso6641917b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782458; x=1794387258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=hxZ0G9Ms2bXEh5gQJZdNqjnx2lpt6R1XWLc8qWOrdhhjkK+LOEjyXqIOolu6ay0jTq
         GyZrycPkfvSjp3XlXU2LmYduWVgjHEwJfeVAPEtyyGOB6mgJ8UakSs7StUoej6/oZ+6L
         tGV6+SkSg5NZOvGBXbC5dZQ39prmruKSPmBQX0INnv0KscvaGOSDkkaYre2oZZ+MZ2Is
         ywu1wQqVelzsnzzG3ZrnvNx59HwAHvMlSvpIniWRyNP/y42RtWYToDxN3KHfao8vzzC9
         kSX/XpkllP4D7BRvdqFTAqnwzVBatbteWhKGYI2d/7Kyxx9irXthmzRlMFDpycX9jehZ
         xw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782458; x=1794387258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=AjXjvuxO9CQ2mhKAIlr4SJbaw3UFIhf2F3rDts7/gtHj8+T175Krv34HlOuYTqzbt4
         FFfOOIPa4v9RzGrsM7v3cKGNNan6D4TkaFXYTt6oZ2UX5AK07uEz04DJpgW/lsFvQFMC
         YcQkQNj29J+NRAarvJiUaOpMbPM2Z2XN/kx5kBInmOzKyEm1zjOHhm71xZJeWkpJLxsF
         IuUVw9/gTwsunFCJSDETQWNO+qZG/2MQkfM50buxOnuEiu6EwSF26R2e3dtxM6wRKe0f
         tRYcGCEDVgJLiDKrDDi6TCLOU4lHzQznqsTjzqbr9UAJStkcTmPg3wl000Mk8q9/X6St
         XEfw==
X-Forwarded-Encrypted: i=1; AKwUvBxPIgqRLTIeZgzoXApwJ+pWpecsgYy/nnUNumYQGyXovmlD8DGUXeoYsniQYIusdT38wzSF/bajLR2iOo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v0yTBAF+1vo5+TPXKT6148Zs/1gxXpjXZ/eSkNdZAabRio3wj
	8fSNIcQD9q99R2JV2qOgyDddWg4IT3EpSdgOeeJjG3u+8jrgIZTFrgSj
X-Gm-Gg: AYBFou3n0/NvUWO4shZQ9es3O+eqGG2VWTCJX7oiFeGxsiCc5WrlIca5gB1t5ziZPWO
	zM8VnO2qz2pXo9QquNiiBZjeyFTk/2R2vQ4Jnh4HoafZPErkrjemec2Kl7DSWcz9qzrf1QPSdi8
	Mdg8tzbZJI/IOwlsqu1sngA8AhEqBBttZT0fk0WTf8JZTcDgQPOXagG+PASieUA7u79NfCyp7kB
	jEIBpW/MUrbqxKcZ0YsxlCeQ3kZjYuGwCBIi+6hHUfwUQN6QWd2QysFNhEjZc42zxAap9rkDhIF
	vpXXuVQZINylDx1LUkiot/ydS6yEzSpHgtGbDWejFk0zaZ9s6oyktEP+kgegmpopxNuROH79PDY
	Jw1uWuwiYv3gCSRztH0rVpefRyDCQ0E14GobKkWpnOYg5L+aDGlSY3U8PmZ26/cUfBJY4BKozd6
	Ab1kXnk8ZgQJNANd+W3QGzH8b6XICEUEBSS2+gnZ92IC4N/RlIeN0oMrg/xpf42qfNLvPaIbakI
	GlR5cprjE/NkzbTHk7/06HfmaNiKxBRz78HzF7l6ZkQIMaxa4prkNNMsO2/CGdXMQLZjIUsB7wL
	XdpSPtKUR0P8cLh6Hrm45m1iyN4XVaP8rXoMYuLm20LiW9Yjm/m2qdn+u4MDHCGNEnBZlK5C0v3
	vx2embfFYCtWRA6urTVCvvTKT
X-Received: by 2002:a05:690c:dc8:b0:8a8:7fda:15ee with SMTP id 00721157ae682-8b2b676a6e5mr116717537b3.50.1793782458184;
        Wed, 04 Nov 2026 00:54:18 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3174sm14420647b3.12.2026.11.04.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:54:16 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 4 Nov 2026 05:54:07 -0300
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 01/10] iio: frequency: ad9910: powerdown fix
Message-ID: <ynwpqktxxbunqm3ee3q7iogrjynlz3egrwryfb33vsp7x6wcqr@uhfsxwrpsyhu>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-1-0e9224ddf7b7@analog.com>
 <20261104002042.10064e8b@jic23-hlaptop>
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
In-Reply-To: <20261104002042.10064e8b@jic23-hlaptop>

On 04/11/26 00:20, Jonathan Cameron wrote:
> On Tue, 03 Nov 2026 11:52:57 -0300
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Enable the software powerdown on all the applicable CFR1 register bits at
> > once with an IO update.
> > 
> > It turns out that DIGITAL and REFCLK_INPUT powerdown do need an IO update
> > when enabling the powerdown, but that is not the case when powering it up
> > again. It is an asymmetric behavior, which was observed while profiling
> > power consumption in the lab.
> 
> Just to be absolutely sure I understand this right... The bug today
> wastes power but otherwise doesn't break using the device?

Correct! 

> 
> I'm just trying to judge urgency of applying this. Is it fine
> to go with the changes that follow later in the series or do
> I need to rush it in, potentially delaying the rest.

I'd say that there is no rush.

-- 
Kind regards,

Rodrigo Alencar
