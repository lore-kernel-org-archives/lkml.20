Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154626;
	b=hlgQHCQ6J7LWkNwE92uLC1TlYmKvQwoDfbBQ5y1BuKFmBztBePcc80MnpzgBDM/i02rT
	 YaMYbBUMlT1z9vvFX0JvekX+Uqr+G+86JrIr8DBo18etc1NgyDk3R2wQWdVKPMS9aK0x8
	 7VmYuNij+XdFb7TmGqAoRCP4awjXv+Mf7JH7LM6trOS53L1jRDic1mm0NF6ELHPsGZhNC
	 zz/XA9aCl9ZNqC0pceEA8v6FqphLTSFGcLtV7jWcMyVs2X2APURjSo8us8MJw+nkQKblR
	 KoQor2HTCV53rL29G5IydiSmruBj+1L8YDM1JCb+XGA9YIRPOBw6vUwbimZkuOZnt7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
	b=OUlhnbjwBnPBtOgrpFoMfsvDi/SsIKr9GwZGFpDTc8yB/VAlJA48ErXdC5S09ekFsjPw
	 81OVJBUWa+XR6irhPXgGj2ShpsG+jtd8ISFbEqc3GVLh0XRuwSFktdIQI5VZWZNo63v3y
	 bCj1Nu2NUKksg9DApCbkQap8ybFSOEbNuH2fmxd/grwHIVWqEa4LomvajJiGr5Q6PQsiI
	 RSs02b8X0FqjZFC7Fuo6XVDDHTL8YhwHVSNnNEjODU/kaE68XYhXKjiCJvb1sOQQpU+aA
	 7zpS/Vssnd8FlpBrBLQcxOB/19g586BwKygfWIWNVj42t+SWNMGdhgHvbW0KVROjLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/FBcu0h";
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CACF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/FBcu0h
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so346077241.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154624; x=1793759424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
        b=Z/FBcu0hjKcS82+4EvqpgC7rUp3tcRi9xHWrzEFKKFZMlEP6VGPNTRRZS+eyjZAaPJ
         v95c4AuAnTD2Pn4KUoFrpZU1ckaS7AwDTAFi34N0a66y6w2RcDQJqzhMsheX75GmwVZG
         2/ueA94G7C2g4RGeTVJ4fCrhXOVAxOwaitmimXXi0h5XuUk82+r6QQwIfrpGqkJkfSKg
         lqhmWfOPP71lHiTvhP0ADYM67ltDOp7ERCid3VZXnav2mohlhSjNs2JSY4Io+LGTrfam
         83BLBpkNAIonrmSUd2cqnnvK9yQuBKJXqHxTHtpQkL/HExV/glAbTExcoR7R6qdFKyOg
         j9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154624; x=1793759424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
        b=XyRWrbInv2mA3J2u3IyUeYQcK+5Z4ZnLs8uhl/ZnUJAFWpkmhdz3/R+Ts4irQp1xKP
         8uzn8ETFwKF13YKu70BVFA+z+3mNdrAEgnGkVNEvfUafz3cVHICwY04cbDXGK5BxUqD+
         5j4onGzstQWCmjhz8Mr5Ls9sCfu+nokN/CAQhgbGN1WR9AIu7esI3eoLk5YxxpCM5rIq
         cFq9ssbwijc6UBpun0b8E46FzBsJYuKwRKDA+ITEwwN2FmKKLwHdiiyIBEYJtrER6Rsm
         Idj7Mo1g4T+qkwP96BSqbt5SQYPRwcWH4yDB8cWFZTKM8LA3kW1S1NWptyFHIuL1Po85
         u+PA==
X-Forwarded-Encrypted: i=1; AKwUvBzU4CLUtgq4zmrBiK9O9d6sHRRSf+HLCzs9DmcwG8Jcj9UCvNfKWcQ7Lrlg4nT/tFwnLfenntv9VYjH1Ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGSbL+xrsQRk68wekSm5M00GbxjT1ALUgakQcapKndt2G3UIGv
	3H6iSifJ71blpzgZjqrzy6OlXxPfqRwERagalDr1ug32TjAlR3gcDDj/
X-Gm-Gg: AYBFou1R8FbUc3r31RKqqjKi/yCzbKoGH1nK/06mZlxvHd3/BZZmLIobzn8OKkL3bPp
	tqMiwJChxR6JyfBs4pXGD5ZZg/SUqn3z90zACnn46JKNhH9O8O0NDQK8o4fF8jTLTOnWLdpUlYP
	zaDlkRAF/AIIbWIDMZSUDviqaV4PAuCkCwZ1zfQ+qJanFQsw9VCTaKASqHjNRlFXzklfJdgGeu0
	b/JisCXreLY74oLnYFLs463uzK90+HYRjtTpt7LS3sEiW6e+JvMVN+8yuVQeePygHD1WjklPVh0
	/MropPKpgyYvF2z8auUbVFJIlLgdLzSJqE/DO9nIHhtexns/Bvf6mBKjTJr4VFCbuaK5Xnez0hu
	UyDC61fQnd2NURPz0nKJNLXEcsSo9zX93rRt8gZdlTwq6Ms+CJzcnHMR5eJ/2tvO6nrpUfi0U05
	vN30KjIbbSWyRqIsD9oXBYcnrKVnNVmu0dnoKbkMMcP7i38UPU6h7otoWz8zl+xx0HwRFl4wmR9
	BAE0IdaGWG+sU53B5N4AUQy4SmF/9FGEs7AV2+TJybUyTNQTonExLEU37bC6AllLCSlzq07xZfD
	y6Mrq9NW6bah86El34UU3fxrRggJEmmKA2dPoio7cOc4/nztZ7rg
X-Received: by 2002:a05:6102:3fa8:b0:7cc:776:6c5c with SMTP id ada2fe7eead31-7d03a4b9a28mr541141137.7.1793154624534;
        Tue, 27 Oct 2026 19:30:24 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f5cebbbsm486020e0c.0.2026.10.27.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:30:23 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] iio: adc: ti-ads1298: add ADS1299 support
Date: Tue, 27 Oct 2026 23:30:14 -0300
Message-ID: <20261028023015.31876-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5nycDs6ImZV8X5@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-7-stephanbrrs8@gmail.com> <at5nycDs6ImZV8X5@ashevche-desk.local>
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

On Sun, Oct 25, 2026 at 10:34:17PM +0200, Andy Shevchenko wrote:
> Make this a list, see how other drivers (recently updated to support more HW)
> do it.

> Fix multi-line comment style, make the text of tristate in Kconfig, this one,
> and in the MODULE_DESCRIPTION() the same.

Will do both.

> > +	/* TI sells the 8-channel part as plain ADS1299 */
> > +	if (indio_dev->num_channels == ADS1298_MAX_CHANNELS)
> > +		indio_dev->name = "ads1299";
> > +	else
> > +		indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads1299-%u",
> > +						 indio_dev->num_channels);
>
> Why do we need this? Can't we derive it from IIO ABI?

To name the part, as the driver already does for the ADS129x: since
ti,ads1298 was the only compatible, it builds the name from the ID
("ads129%u%s", so ads1294, ads1296r, ...). The ADS1299-4 and -6 differ
from the ADS1299 only in channel count, so the name follows the same
rule. Userspace can count the channels, but "name" is documented as the
physical chip. If you prefer "ads1299" for all three, I'll do that.

> It's not used outside of the loop, make it local to that for-loop.

Will do.

Thanks,
Stephan
