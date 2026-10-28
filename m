Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153974;
	b=JyJqu+xbZnSt1WD/eXpVbTD+HTi+QGNWr+UddkWf71M/shQ/dy/CCw/w+zsRK/f2y2Vr
	 NIE9N14Sn8net3YK6uhyG3q0MtJ5zbayHOCShGvtvUzLQ27zpIox3xEY+MDev3yPcwkOz
	 aevoRvX6maDAz07kB94G9FStLbMkUE+dIyhonWHBVXBYEGHfZD+45WvIdvF63sKZVr1VD
	 TiT7iDIkgHFOFeRmmR7g/Sla9pmIXiIpAM1rrCaMJzVtCXrlakG1UxAn+autYVVqLQyfj
	 zWJ/70BcZSG7BbfSN9EN+BEgAxkwouaD/+WZDYjswrozOzLdQln9Q5C584WdGQ2R4pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d1zxzlRIebjyBsptrZ+JHLQ00yEGCQvdNik5g5EMBYk=;
	b=EI5feA930tfSugyVOtQHImUV3I4k+GE0tqrEV4FBOZH3njNbZ6Q/EmNYx9k4web7jmu4
	 IrteD/BiQNqDiMhNwGO2TX/Uufh5KkYwFh1ysE2APjYAjqfnyD70wsqbbXzT7K974JL65
	 BTeegEubypvxebaNUHhWnkqyytba/KabMgzWsjzgzleQ2PTHMOolglPT3wtdECmR5xg1y
	 /dljBVlwE4FKcMeudzBO7PCWKpXREKdobHVh8LE5chEkZ5QqF/Eo7aaRd7z1f7PxX2bDz
	 BhKGhkbDSHeWvG6YLS7ucfbAVJpOhPRKQuEzctuIUjvcgn+4YqCxod+oJ2mj7H2vgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4SMamLo;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCCB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCCB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4SMamLo
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eafb65e163so365707e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153972; x=1793758772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1zxzlRIebjyBsptrZ+JHLQ00yEGCQvdNik5g5EMBYk=;
        b=n4SMamLoTIFOHnFw0lvHy0iwz/3qHhNxe1RiXPeL9oaFo5riHEeGD9b6Dn999/2hZF
         B7S20IjNaxsr6nSAkCJxbcrnA5WXYvXGVJd0AjIt6igDi7LDiBQAOwqbxqTYL0B8VnKI
         r36iFO9+J4hwSgO+Tjz3UGUiVYFJmBsf47LcTszJOv5OtTbaqMyNkoKLjp3wMcRFB7FX
         QY+hYL7ZfBNzIX9rmBFFuK1NHTULFCCQF9MqEV7J8Dxyh+a3ZRusedAg2aUnXxCMcuhz
         BO130H2o5A2kV6cSpYLyy7XFxRB48zLJXYlNrYc/HcOtajxsyr6Zgsd2rVi2Pg0Edz5x
         gwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153972; x=1793758772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1zxzlRIebjyBsptrZ+JHLQ00yEGCQvdNik5g5EMBYk=;
        b=J6Tg0YMWv/jiKk2yAhixpkJVOKuTFwAUveabqaMOlKiC86Yx0F7m499j6GEiRVfa5G
         HQIfhZZ+r3qCiqJGNcs23pHLY5PLZNc7oIQXw2Bym1zQTwpI1O0wmZ0sag+i30HhEZMP
         fHAVmjfDekNh/C7yUjH4KQ3O3E6wj+pHtGN5QkFfJpqOg8o2GVRoBcgt0dUAIINcI1Pt
         84Pu6N0P/gH7eIsJTDYbfFe8Nox4lYiv36xilctRPsGp17owW/QzxWflVsjaBaC40MPa
         eNEfRAS+Z15rPGSdWZV1KvuDsuhO4NslVTINShIF3DvFAs0cuU9B2Mu4xfVzGTTALMu7
         fCvw==
X-Forwarded-Encrypted: i=1; AKwUvBxhDsFEWAhZUIdG6Cm2egFm5g0Tbd0jQS/3/9o66mo5h+X4KfTyUIBMh9Jznq/rZL2xpmAz9Dg1nKBmTTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+w2Rxq92XdUNyhy0vOzvsfSKnP57Kst3y5hN5jJe3nZrYoQtt
	UfDpRJtj11OWcbkNGePApIXdAc6chZYLvSXXKHaNVj5hQ1HDHVSLziKq
X-Gm-Gg: AYBFou24IZxOwO70mDCwB7CjZuw+eyVLWeGZZ3l9+C4EUvVz5dCDCuwu/qz0bJjcKnk
	huP13+Af+D5brf8UA28crld4RDx/mJ1D92VAfNmPdGRu2RppREPv7nQ8ILF5OHvcBXKIr3n3sy8
	ZO1EJ33FgLxpFjm2UtULB+L3DhjxOc0uN/gMIkrxrK3dkTW5RGfHg+FgmhxMwnGToTzH4MxmD3m
	BIERoX3KWjKKKVKrYzSiEaq69Ryjg2JeuiDmzvIGqexJ4QsK4Ordr6SQBV5jAB4+SU3XRsOW8Ox
	Dvqv1HDd7/NTklEkRaJSZtzVEURXeOVyCXxIEXW5oKc4EBhgDhhgsRKzofg3G+5rKmE7fMrISKB
	kU7tDrPY/zyO2VWRlB4FJsqCiI2R/eM/mOPMs4UWAMm4NSHomhHJtS7vbCszWTaKs/uWlhg71lP
	L8snz2hRy2v624zLZeGfayPE0VCoARFqa4I8yr0UBozanvLlwlgCpD5VhKdlud/V0u/aY3EtoUX
	eHrimxIsxjM4ESQlkinqS0kf14BTEPDeQZVD0n0FvKkY6BYEZfn0DmhIMFFJYhVs0y/WOHsIFb/
	ZW0X
X-Received: by 2002:a05:6122:328b:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ec4cbc5ab1mr563052e0c.4.1793153972570;
        Tue, 27 Oct 2026 19:19:32 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f9210c3sm403450e0c.8.2026.10.27.19.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:19:31 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iio: adc: ti-ads1298: fix power-up and clock handling
Date: Tue, 27 Oct 2026 23:19:15 -0300
Message-ID: <20261028021915.29695-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <184780c8-6d87-4983-8399-6e509a250cfc@topic.nl>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-3-stephanbrrs8@gmail.com> <184780c8-6d87-4983-8399-6e509a250cfc@topic.nl>
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

Hi Mike,

On Mon, Oct 26, 2026 at 07:27:22AM +0100, Mike Looijmans wrote:
> On 25-10-2026 01:13, Stephan Costa Barros wrote:
> > - The datasheet powers up the supplies first, then the clock, then
> >    waits t_POR = 2^18 clock cycles (128 ms at 2.048 MHz) before the
> >    reset. The driver enabled an external clock and the vref supply
> >    before AVDD, reset right away, and did not wait for the 150 ms
> >    start-up of the internal reference. Follow the datasheet. Probe takes
> >    about 280 ms longer.
>
> The driver followed the correct procedure: Keep reset asserted until the
> power is enabled.
>
> We've seen the chips misbehave when the power supplies ramp up
> erratically. Keeping them in reset until the power supplies are stable
> solves that issue, if a reset signal is available. The driver is based
> on real experience with these chips.

Thanks, that experience is what I lack here.

The patch keeps that: RESET is still requested asserted before anything
is enabled, and released only after AVDD, VREF and the clock are on.
What changes is that AVDD now comes before the clock and VREF, and that
the driver waits t_POR before releasing RESET. "reset right away" meant
releasing it without that wait; I'll reword it.

Is AVDD before the clock fine with you? Section 11.1 asks to keep all
digital inputs, CLK included, low until the supplies are stable.

> There is no need to wait for the internal reference startup. The
> internal reference only affects the ADC performance, it isn't required
> for digital communication. By the time userspace gets to use the driver,
> those 150 ms will have passed already.

Agreed, I'll drop that wait.

> We actually have 8 (or more) of these chips on a single board. If it
> takes 8x 280 ms extra to boot such a board, it will fail to meet medical
> specs (reboot in 5 seconds).

Understood. Without the reference wait it is t_POR alone, 128 ms per
chip at 2.048 MHz, still about 1 s for 8 chips probed one after another.

> The ADS1298 datasheet says "18" clock cycles, not "2^18". Quite a
> difference. We would definitely have noticed if the reset timeout was
> that far off.

I read 2^18 in the current revision, SBAS459K (August 2015), Table 38:
"t_POR, Wait after power up until reset, MIN 2^18 t_CLK", with the note
"When using an external clock, t_POR timing does not start until CLK is
valid". Its revision history lists "Changed power-up reset wait time in
Table 38", so older revisions may differ. The 18 t_CLK in Figure 105 is
the wait after the reset pulse, which the driver already does. The
ADS1299 datasheet (SBAS499C, Table 30) gives 2^18 t_CLK as well.

That said, I have not seen the missing wait cause a failure on hardware.
On my board the supplies are up long before the driver probes, so t_POR
has passed by then, and that may be the case on yours too. Does the
driver switch the supplies on your boards, or are they on from boot?

In v3 the supply order, the t_POR wait and the clock rate become
separate patches, as Jonathan asked, so each can be judged on its own.

Regards,
Stephan
