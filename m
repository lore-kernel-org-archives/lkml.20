Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912120;
	b=CYuPU57eiBiJw4Tw07TMPa7AwrDmCam2UFmWYSYQZddGhy0P9pk0zgZ0T2wxnVVoLq41
	 eWgRpE1vhjC+isMHCuir+hzrFhRWB3wunqmXW/aUVHYoVSrTE3aRLdDxYatNUZNVt/hWY
	 U9B/ZbsL3pqX2POpGDo4qnr2l9PJ8yfiKiqFYVO2KO0Kaqi1UUVLVKPzjoHfNrEWM2y26
	 dEHHnW9tI4DFGaoCZwj+GfQ7ht3lv3vufwA6y/Fnr+T3E+rnY0/786LcBV0kccfefAoRy
	 s1MEosmnkrUukw8RrbxDuO21NCF91ecPLXKQJeqbrPDIKip5JpQqdmSjLbmD21eNTGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L4KOYqWx580iSeGrUMZkCkNhUGinBxxLvt7tMIPLBDc=;
	b=djmo6wDJhIBqFFlq8kCRc1DoACfqK4eLpUIkS81j/f3RuTCHVhK+ffBKPBI2UFnJX+H9
	 2q0ANWZ1DSMYpwB4MYc/E84MMA4mxyvMUILLIN2oKvDiKjl9IqoqdUexyA/WNEO6CfpKL
	 uHTpCJ1gA5cGsLMAG1QEMrER6eGaZfqN/3Ttjjvo5o0g2STBKoa128Y/ZKfTGGODlyikT
	 Za2Lq3t5cC0EwA4MX4iVIeHe46uhduTlUkXJAJzsbKLCNen4wrFcrltYZuWU+k++wzmn8
	 kezWB+GhdNagBHgmXqPjD3KagDIUcuM2KyTCDUAfQnT6xD7CEZeuSwW55uazYuJSoaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VacCkSJW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VacCkSJW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso6660330eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912118; x=1795516918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4KOYqWx580iSeGrUMZkCkNhUGinBxxLvt7tMIPLBDc=;
        b=VacCkSJWfgrSjFRQ+4vuPBmDOU1Braf46fyBOsDxjiqANqIEAQcmoi12iwoXoyvHKj
         xK86sMaUlmdzAoQj9RTiqOyDd7VAWF0jm66tjujttFaYUxvCnEPZMGLn2uIWUvpmVmEd
         8VkwjKmu2mraZFFVLgr+IQoqbILhH1z0ll+AGzSKT4tGydnom18ohVNMuJCc6EtGxMoE
         juo3LCNGOOeohOkobAXhgyppA1yYENPvfhNNUaT5BfyHAb8/KjINurW+b6jZ31IeQA2h
         LpIR4fKOBHDWup4Bkc8p/AW6yWYGprbY1QGxpshslQ/iTkyP8BFrW4ejgmxjIj1fok4m
         UOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912118; x=1795516918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4KOYqWx580iSeGrUMZkCkNhUGinBxxLvt7tMIPLBDc=;
        b=anMM0xFy/BqvEQhTRSs9mcssk/G3Ps2WquGZJYZ4W6Wom2HulCBY+4lmpAXvIZUT77
         4UcmqPq6OzjJB+S3ZlzHfDO4u/FB7/QBzM/9d3MIrSsxYBris/r1nxcPUJN7Dpn1x+b1
         NO2ZRXlpBJHirXmKfFDIB+PYsKEKckGl+h0vWobFFQaWAtVg1OWhGrkl2sxRah9Ipgb1
         PJ4LK1PX9U/gRB1yz+wd5oTCUtplfcJsTXVGtyANCgvoim5T6ZZSOHdFx/eqiIeGx2o0
         SXrWSO+j1m8pM5fX9bwXDbOawOQkoopPELmlACtFEmQL+mey0dkl3f0vHtSqQvdx7uPT
         /QFQ==
X-Forwarded-Encrypted: i=1; AL+hErFnE1bpY8uWMzvmrdeHY4cclgExn7H3Sg40//j0KY+xCP3baE3KIW+9Nr0zuJY7wn8mwYFrrwuZBNPuv1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qtx/Xuq/HApW+ieix0IvqRb7UQyluP0rvOkomhk3RKQdqWoYC
	ze9AnmY8b+Hma+gosJSqQaO5K4G2abInXVZp4dK3++6HO3W/b4Jgff5a
X-Gm-Gg: AZFdTZfLRnNVxCZgIiR65cA0J0ZbkPAvj2S8us8e6Ji2GM6/KMSMW6kLGAtP9vO4pHD
	0GsM79xRpcT7xZXZ4kC3h4EIW+7GDS85EzovZrD+duVIUE94bL97roVYs+DxnEezXZibA9k2pXU
	zI6St/zsQnK83xw/eFjZ1JB2jbFARq/I8Ih5voq2IQEeeP9D4qUX2XLzYqmevgIqwbLywePr9rT
	ocFc+QB4H7mTRk2bKNNmUH5njNl4t1bCmY/dgylyHp6RkDPLwZM2qDBDACS/MwdhhOGtEUBfjuB
	V5vt4l382HWs3qzX3bHPhibYoHsvfd1FAhhdyaHbMYmxNQRk6NFP/wuURgi0q5OkY4JjAEyM5Gt
	BJgcbLcyb56ut0wVvHaQotdgbfve0bkF/IS1Vkl9O2yGJQXvLZibDN9l+jU3yX4Rte7/efDLwFc
	tTwSGaKQr3tGQMqruDE2Ci16Z0RRAQ+4LRj0hBWqN7XDyUVKBMi57TbhrEEfI74CKgo33Z+RNGQ
	Ss/kQ5KNEsKntb9giCiKAMOJ5koEyXYLY6gDN5oPPSGkfMNeNoEX5mAICqKGaJiMXa3JFBJD6RS
	MdSJoatIn90/0y5H3hF91kBKzEIiKpmQW9q7DAQxQBIDpwxvGsm8jA/ApvfNo5KjqkrHtS9Y9he
	T4BqlAnbTXYYHAAIr7JtesqyivaRSIDYUGvgX/BOXNYQunYcBfl3tYGORP/y1eUcZ+MsG5Hhdtw
	HGZbJcsfV8l9quA8XU+Ex3M6yCajkGonF09ouJTPYIbw==
X-Received: by 2002:a05:7301:1810:b0:381:610e:4045 with SMTP id 5a478bee46e88-381610e40ebmr1507561eec.8.1794912118275;
        Tue, 17 Nov 2026 02:41:58 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm37871973eec.4.2026.11.17.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:41:57 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: bh1745: fix 16-bit register accesses
Date: Tue, 17 Nov 2026 16:11:52 +0530
Message-ID: <20261117104152.137597-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avwqtvhrxmgLe8np@ashevche-desk.local>
References: <20261116194214.45174-1-kapoorarnav43@gmail.com> <avwqtvhrxmgLe8np@ashevche-desk.local>
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

On Tue, Nov 17, 2026 at 12:21:42PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 17, 2026 at 01:12:10AM +0530, Arnav Kapoor wrote:
> > - bh1745_trigger_handler() stores the raw bytes in a u16 although the
> >   scan type is IIO_CPU.
>
> I didn't get this, what's the problem here?

The handler does regmap_bulk_read(..., &value, 2) into a u16 and puts
that straight into scan.chans[], so the buffer gets the register bytes
as they come off the bus, LSB first. The channels declare
.endianness = IIO_CPU, so user space reads each sample as a native u16.
That is right on little-endian, but on big-endian every sample comes
out byte-swapped. The patch reads into an __le16 and stores
le16_to_cpu(value), so the data matches IIO_CPU on both.

I'll reword that bullet in v2 to say this directly.

> Otherwise seems legit to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

> And you also need to add
>
> asm/byteorder.h.

Will do in v2.

Thanks,
Arnav
