Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781113;
	b=R9lq0OiCYAs+V2a22nMx0yy1XCu8DoYJxlAkkP/kxuzQevdpzhsGghRkAm4f394IWI5x
	 /yJqgWb2iQ0KmqzRwbTTo/Uf5lTx14T+2mviH/bT79/py29IEEgdwmHjfthA4G+0dSbcj
	 SSYfp5nPM1psugA6elPbu9NHC8L7mIQgurkwGE0NaYiLFv7IgY4ZrtXGthn2vC9q32I9t
	 suh4uvY3VFymVTxxDzYbEl+APvpN0qBfVr35UbMQkjJeZF7YYFj927w3/VvYgMPWBamiE
	 vajk0U94STs8kYn4v/6E7pCIJHiT6+cTq7YPJ+YyUkXKivE88Cf/jwCQKXZGLjmR8sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
	b=pYq7CqoOlUqy/2tItu4capt9Yp0NgGby+Hf9qlA4LhMOzyMpj/x/CPYJR2QxR8DoTzWR
	 FNEJSUVWgVUIkeF4uVr7pcatVshDGRD0oRU+v8YhoQzktF0AsDIniQp5IYJFY7lB7PelI
	 kssIwcB5qSoh79/3B9jgo+Uo2Cz2Ep9NZW1+lgmmw4Sn4/nytZMl35RdFN3wHepQ4b6lt
	 awzYjJ1FO36QM6WnUhUQ9lBz5UReXieF34/2a0C9Pi6lbO7BWcW/VaReDV9JhA/pLJbsC
	 mfO6wA8gcOIdN0TZ6ECql/wN0ZfbLUv1WC6+x3X1mYhPUXqOmq9Pyf8JwncFW3557lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl12hccU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B04606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B04606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl12hccU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ecc11bd26so313118eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781112; x=1795385912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
        b=hl12hccUVxYDW0zF3xMwx12XdbjOy1q+DGTYEWZSnlgIWtx+BujqEXwWaVXtzPlegq
         bBhJ4ocHjqdY3Ke1M7V2xqG8xCocseWx1EiWPoJ7sx83k/LSezEAltYKQ2leyxJYC/U7
         8jgtz7kNV564uccTFQ3bZAJX8EEpj8bfIGtd0Y3b1gENQeeVYnb+a/E5ZlsYd/4adn/5
         zajP+pg/4c0hSzmG0evdfN+0Dgj4U9iDdjJv3BmY9uBBPnkI2JpbHEq2NqtSOWhdJhmd
         o+fpnFU9sJ7PJn9kP6s2y/ChrCbF9BWlRCaArArgdZfY/PR0zy63hhmxZcks7dunZGaJ
         ybJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781112; x=1795385912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpshBwpP8nrcyZIgCaEpwnlsFopChh0GnbxP5EKQpwM=;
        b=IPW21GXUyrSgE/4DiY4HoPQ2fckWrPUC+j1xTkkJfK/afNPDe794ExPwYdfA/aNGme
         sC/pX+8Yp8/6VMeMZ7TrBgv+v8T6u/X9w4QIzhu+DtglD4EfM8xzBlHWMKAsQ8vNxZ0O
         6pKPnyd3mD9qrdNMcwJ41ZLVuLvUpQk94Z8B+7fyMQBDdtfohFX5XatPtur460t3zv/n
         fNPeAJ88sZMU37ABqdQQ/JgX4tkf2DuGVMtOg3wcte5VZEPgdtOFQCsBKAI0BheLOlfo
         hMgluX6ju2P1zqAAvPLrril7N6hxdfQudu5L22HmfL8m45drEt10Odj656VLHmlDhi/2
         svDw==
X-Forwarded-Encrypted: i=1; AL+hErH7Rpvf8KetvO0xxPuLR8SFQDoofdCtok+EJHmmAMeOq+pTZ/0RudQ7/RwHK7Z/jJgPyGh+++SGJw9J7hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jQcQoDm+vZltpE0rb+E0z8GhReP+jH32Hd2Qp0Le/hUomtiJa
	CS/vqWimBDuArZqtyJk5y+hyaJD1mTEjC1kFcn/3+zp8ffGaFjX3z//p
X-Gm-Gg: AYBFou3hX63ds6Cc0Gwl3b7sQ2pMHN3YksQ47y5ag7C5ZFrvAbBwvpe36/QOcZ8qqlu
	Sb/ElCCPR+y9xE80ARzuow8g0Ohj9U1cywvr5mvJmGY9DcN8g/y9A2DV3lKDjJkzuTW6UncAOyx
	oaUorfj56ijkVA41TvB+k/wrrDu59KdNtlcK6+JwWPWffeejrEl3UI0nMd4hsLZETRWTeFcc4+4
	5ePrAzhnR8NSMWQU7mVcwO4Q/A62RWuuyRrBqfSWqpKTxGbPEo06ExpWWVCz9cdBLU7wSMHX2Me
	vFhvPy41GVnCQyAR8YDAxIwyhVofP3t8Ykh98tvkUUlY1L8Ia0tCMuepP/INKT/5lh3njaTOEtm
	x+occkGvDFJ7LoXD+226ukF9wP5gwerQKn/uC60AyNU4rEglBNUblPDpd04ZJjDHhTErO6cVXEc
	89qIbUe65DpXfGephNYAp8m5igmStIYCiKO68X0tWxGcmpOQbBSR2kdAGRxY93BjuT2/p9xU0d7
	YeJNZvZ3RgUGM0TgJX93b+RO7LVVwjZozaWuX6yfzX51JOJQq74tdBycwSfDTITMMuTt/DLEYgv
	duBg31PH4Y9nY/Wp/lnq0kKyMZkPz4+ctAObkxORKn1WA4SSDd/jzleXueeWmxgd0F5VK3Xm/hQ
	Yqrvz0qV3ANnTc76w+ejaQbgDGPaFe+ZhloXNgwG+RDDMgLvY3UYH21R3u6xX6ULHcgGHapS9pI
	MU9o+uoZ6kSdcvtzIRw2pvZiJGqIULB8p0
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr12826511eec.0.1794781112527;
        Sun, 15 Nov 2026 14:18:32 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:610:7dd7::e91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm26765616eec.6.2026.11.15.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:18:32 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: firassharary3@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Mon, 16 Nov 2026 07:18:21 +0900
Message-ID: <20261115221821.2928690-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115175301.8516-1-firassharary3@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com> <20261115175301.8516-1-firassharary3@gmail.com>
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

Hi Firas,

On Sat, Nov 15, 2026 at 05:53:01PM +0000, Firas Sharary wrote:
> Tested-by: Firas Sharary <firassharary3@gmail.com> # Surface Pro 7+

Thanks for the test, I'm glad it works as expected.

Thanks,
Antoine
