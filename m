Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063234;
	b=z7aUfC6fjQeE7zA1Ua6GxmLnlq8mlImNVsq0lw50FuYshnVQrMOYIhaP+eaYVo4lTQMl
	 NM1DWArcLPjhM9pcJCDbuIRH9bFM57pgsyMI3g+YU0kZMOzThS+aOax7ezjX/fhqWhGaG
	 VNcRVN9GpXG+FmPltPFKpdIvC7VJlLdzSNCPwkGpdQNTWv0Nzfm5eym6I0K05mqA/qDe2
	 k7hb8en9SyDaZqLlpXK7carc1rvw8/9P9OWGStYEAcINDqh1xmiKTMrgWBncEJuvJYUK0
	 ahT5pZ+DniG85zUpUOPQ54/8ia7n5IENWQASPqyntuviuxy5cb1EVaSN8eVOkpb/4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
	b=TW9d/4ME8iulp9J+gp2xZzHPPh7bGzKDU07LgRnSsbfBxpPrvHeW4yDOghG0QKSkMxqG
	 pxUWyaBFDsb7MbRXJMHcUMpkvbiaafX2wYktHo7qcklYQJqwpf6lWnCEQaWLhwgSYfeAN
	 yGlInurEhhgbEASEMqecg6VHMQoqW29Q/aMKvu7TVB9SD0+AtJv3tUt7Yvyh5LfUogVCj
	 z+4zG5Gngzb/zwcr9bROLs08J73hH61MI7V/uIXjht/pVDXgAFJlkEzkNRB2DUv8ja5JV
	 FIutzBnXCvf7LG1XUi1Ah6aIF++xhGYTb7etbP7gDfX63Dag/BTIQwvMP0gkAE8QQcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PVYnLtwm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD57606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PVYnLtwm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35d0be18c71so579771eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063233; x=1793668033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=PVYnLtwm70tT95O4Uv7YMB8Et9uODxOHNv+T6a3NrEqKIDvU4e5NW/3X1s/nZW/eR1
         miRhvrwaPJy7I+3t/q9nz3y5ghFBQXE35M1yzkRI/SlelyVbU6s8eDoPEE4VX6YYskfY
         eebLieAqnTfWJBwzDQxr77P1M+U1A/gM6Re54SHmAi2WUA/yBgRCHtkgLeZw8Nh11/Eq
         6rbUJo0nKwH7PjFGdf2H9601QL5yOKS1Dprb5s0qOo834w2oy4EO86MunCM5F6caTmNK
         HcoLVCojp3gvIwrCmy9u1ZnKNEBeCkTGnQQfVYsirAe3vyrl8uvhwYFS4rA7AwlRC3Zw
         1+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063233; x=1793668033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=Ji/8ZOdEy8xV2ey4LIvYR4+j+NPevY8bPh202bVI2U8KXtS5rB++rW3lDXsB+Wd//V
         +xSowIfmolAVCV/gg1mbgUCDq/l39Sin6oKF9Ovu9YIYusRH8jP8+bM9UUQca5E9kBcA
         C20zqQELdJBo/kW1kXBsXTxsXZLlupj/Nzpydygn7lv3/pzn3X49Z/eeojFPX4LxW6uj
         43RHjoWLCW2FOU9YHZQbEqHZUV7/Eovj0391jbTMaxIkN0beafP6BCBzBr23Bf211TOs
         rooqtxI3N4JbeEwnth0vou+/dvsH3sc8uiAs+REVi1jEzxKDiYLnexdRW5L1EY5ztf37
         jf+w==
X-Forwarded-Encrypted: i=1; AKwUvBxApwYdGFBFmicxo6Gr2fQ356aM78p3t1S/q6eJazR4mgNCM0pRqE6L5B4Vjf0tlsxI5d2Jb65iqbdzB2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/xy/fJCf5oAhp1aXmBqWaWlG8Z2XX6e1Q9DH9NoVZX2TR1LWS
	2tQNdcAoGjPqpg4N5f8C5SXUdaMJIrzubq+Aqf4W/XMYRw00QTsnIusd
X-Gm-Gg: AYBFou20EEKlMSLsj89UuVuT6MIWVZE8r574MoQRn2zZtfNP83ZP0f2CWcdwyCo7NPb
	j2MoM0sDaVOFFTNumPvliOe5f80LRTMIdWkwjDWzTp9o87bW2i4KfCQCAncJDpEaNHPcYcsmxSV
	YwADo33VsnbcRfXU3YAtvgcf19vIBpYfRyBmmDPkB3wQeM0+QxAkgNtmljOonGtA1Y7IFhLdtjj
	LCJ8LAR+rcCJKGvMmqbLyB7TI+hBC0xRETwCPPW3Z8dBJrpUDIfasXx5AqQAdMSdSKax3zFg/lq
	pD0DpoxWlpLZWHBzVVyBznY7CgwVAznhx0hQB+hRT4ynPHTtJ2aGS+I+mswLzC5hBAgAyscCBge
	EkIosSoFI+bxjtRc1B1bxQqU6dhHcUdbtBmrpxQCAPZZ+ygLhgIomqVu0cIeLOwZ1ivSWR3YK3z
	DICp4uXM4JvnJQK9usJbpDFgmAPvRy5waghbTkZ4wMpaMtWuIqz48cDwHLF1rNHjLomiZ8Iptkq
	W6VL0a1ZyesokA0+Z+WmhFtBmZw7w471pLu4uUt2LcsFmoNOBo8toOQ3qFLNnE/7MECk/A4oQTK
	NkPnoKnsmTAcBpRdYSgX9EE=
X-Received: by 2002:a05:7023:c013:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1a3c485419amr1593552c88.12.1793063232714;
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm27239759c88.3.2026.10.26.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:07:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Message-ID: <at_45tVmsWaYAv7W@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
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
In-Reply-To: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>

On Mon, Oct 26, 2026 at 02:51:16PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> > Hi,
> >
> > This series converts the Cragganmore 6410 board to generic software nodes
> > and device properties, allowing the removal of legacy GPIO lookup tables.
> >
> > We add software node propagation support to the wm831x MFD core to route
> > DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> > Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> > from legacy GPIO lookup tables to software nodes and properties. This
> > eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> > GPIO chip names from previous conversions.
> >
> > Hopefully Krzysztof can finish merging the series through the soc tree
> > once Lee acks the MFD part.
> 
> Hi Dmitry,
> 
> This all looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm a bit unsure about how this fits into your wider plan, i.e. why it
> is helpful to replace the lookup tables with device properties in
> this file:
> Are you working towards eliminating all gpio lookup tables from
> the ~50 files currently defining them, or is there an immediate
> benefit to doing this one in particular even without the others?

Yes, I would like to eventually remove the lookup tables and rely only
on software nodes. How quickly I can do that is a big question, but
I'll try ;)

> 
> Do you plan to also eliminate the uses of the legacy gpio
> interfaces in mach-s3c, e.g. the hardcoded numbers
> in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
> crag6410_machine_init(), or the pin config in
> s3c64xx_i2s_cfg_gpio()?

Let me take a look.

Thanks.

-- 
Dmitry
