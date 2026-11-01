Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551476;
	b=Vg9cTEYnx+m82YPGVOpnX/047o4OotsJnkdiQsIZkZqxKMVnzGYm7lnc7bd3p2pm8Exi
	 noppsS0D+2AZX9ZGaPr+McKuaNog45OOBkafHtqsGv0e/wO8NxeoDidTiVQ6MyFUajiwb
	 iAoBJJCv4QGxdYjMcqh7mTvJzWVihkdbLISS6S0LYh0uJN7nJfxtdXBRbbw3aYfhx1IY0
	 MLXeDcdcVSrsn+pbRoCgc5xlwHFti+wjijjPzaWTosS5xEU/0NGs77rEA6P7fMoVr6qjL
	 oXMu/LXK82cUXUN52lBF76FwUcJhpos7EDQdMJjxb7cWNOlVlXj4yThZd8J6hetRZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=;
	b=dW9lQzmYyAi9pHFw2v3p0mTkqBoIsDme02on87KvJ0Lam0qC+6rBQ66PC9PythdHbmcj
	 s3IilAB6rU2PaOZfP4zXCUxgYzMZYNTwNBSq9T70Sz0yT83rIuYDbK8GLcyjDJ6RgppId
	 Z2oIpUNUiTkBBnZjILBrCxNVI34CaPrquEGn9439nxvznJhTdqSGC41cKDdKAwTH/N2V7
	 YhC0um+Ol4cochAIPAOSsIjorUF2ctQPE7Wg4LLk7O3XnPuveFeg3P0UEc9xji7lpE9oX
	 TFsKzJw39SwHwOfDAs6yf4fxaYo1vOnFFJyjlTKwcOm4HDFSWSZwR84rxd6BGRcvaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOGeyGay;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F172B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOGeyGay
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369fc2e984fso224840eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551475; x=1794156275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=;
        b=xOGeyGayz+OGSJ8gV4I/TWxWvQCCci5c+IIYaLYByXD40JdHHQaHh7waRJMx9bS8KT
         EpSI2pUC/3Eom9ha2HzT93PYvx1H+KwVOay2FMwM5g1S3u9a4voF/6D+Iswqeu/gEcaw
         uZzqwerwT/yAOaVKubuoZ/9tjjFVrAJDp2qVEzZ7MA5Q8M1bh7g1k+wd829I136G2lbv
         5KzFXI9srPzM4C5a/3bdk1+UaF8TQehtBNtjXf8809SH7LIQ3AAVaz89lkqrAewzQX8o
         LhCuj0O3CiyU3aB914iMT+WXx9k0ipK1Fcz800O/PGgzsmLq4wFtzBf9EZvNjWxsC0Jd
         b5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551475; x=1794156275;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=;
        b=cmClDemRtCBjWUixeCkXRHra+Tj1hm+cXxHJj52VvXG3MKRpfc341W/iPJXp6elpK0
         uQ/lxHg2VelnrNVk86Apt60S8h5IJBn3RQDEcG63BD3nNG8QQ31mBvrS6cs2lp90jx+e
         U65JPy1thm+WJ5H3qPK2p8e4B0u9YqxCCBG/9O23+GECaiAAooXbbYyvWVq8O1bUJPfN
         ZJgjD1kLWjN/nIJMTugyMfTukO7Uc1a0s31pdzjkb6sqMoj4nzpZGq+XvJxmHBP1gAbq
         2lhjdFXPVeQqnMl8jErl0bOklaZQohuGQuf6mKy0JMltUje2aipfUQdSTZjykFrZBn/j
         ScPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7qHrUYitNCzdHXX6XX7RZ2WSszB2PJLI7xzXegIiQ9FmdvuJKaOn660ZLc+I67w2k2uF5/HYsuWXfrb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NmHLhMfSFaU28kx0lp11akA4Dpm3Yjm9SKlBH4FEwnqxNQtPC
	aI1U1ghzncA3jdvAhyv94CjR5zDYpYNHSP9UwQZOZP9FBjCcZGY8ftf7
X-Gm-Gg: AYBFou0JhuEBHvzXvxGkF5ia4ssv0eGSYWDvyg8FvPEXLHLktYvue1kOwr4Ujl0Ql6Y
	YB9S5dvYUHz3NSCSTL9dGRVyCXg7NssF9uQQH4RJ3C0G9z5MNbiEyikVO5vRw9TILDmtQUISuTQ
	/aI53vMe0WtlPl3zjPI06uaLpd2cNOJ+HQoR8m7lA6I2kIvuz8WspdjCuh5sXbz0ZQpo2zx1N2x
	mFHMs8fMjazdcuUYSKGDjl1qzZEJpiBIwc8XzI6cxVoUw5MWxNH8Pi6GcGf1cJ+vNBVlUeQZi9y
	4pr2h2BrJiq2ET/6cYDmaDvKKfWdIB6vzUc5Z0ZVO6fu3axSLGygN3hSLZ6YhsAF5rXrf+GH2XS
	Xkxz98ccdxj48/bt373SxTvgj8x0NQuEW2+ZAYUSvu6s7nkpKvZcQh8LYdu4yDHWspW3RtoCVjR
	erP4eW20tTrGTns+wSiPgAJ5PWeqkBSh4tRQ5dwBfdzcc0RkLfZ/Ospdd2IPTeZb5VRZN9+aG1k
	gXsE38crShCaVtAZzxyoYhY8B/yMWv5M/cXUIpqMo3Y6eRh9PA3XIf50rheo7Cnoxp7ElFtpNZn
	XAIoNd3c/EKpZ9pq8+hSsQs7BXWoWnPLENcVwT49wfNvb38Bgvg=
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a4235ceddmr15771035eec.2.1793551474787;
        Sun, 01 Nov 2026 08:44:34 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:44:34 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Mon,  2 Nov 2026 01:44:02 +0900
Message-ID: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
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

These patches fix two problems in the MT6363 regulator driver that can be
seen from the code. They are on top of regulator for-next, where the driver
is the same as in master and v7.2.12.

Patch 1: the registers have 8 bits but the regmap has 16-bit values, so
every write also writes the next register. For example, disabling one of
VS2 and VBUCK1-7 also disables VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}. The
MT6373 driver on the list has 16-bit values too, so its next version will
want the same change.

Patch 2: VSRAM_{CPUB,CPUM,CPUL,APU} use the enable and low power registers
of the BUCK1 group instead of their own, so disabling one of them disables
VS1.

Testing: none of this has run on hardware, because the bootloader of my
board (Lenovo TB375FC, MT6897) is still locked. Each patch builds with W=1.
The driver file also ran unchanged in user space, against a model of the
registers made from MediaTek's header and driver, before and after the
patches:

 - 16 of the 33 checks of the model fail before and pass after. The 9 that
   still fail are about the VEMC voltage callbacks and the overcurrent
   handling, for which I have fixes that I would like to test first.
 - ASan reports a stack buffer overflow in the BUCK_TOP key write before
   patch 1, and nothing after it.
 - The resolved table of the 35 rails differs from MediaTek's driver in 8
   entries before patch 2, and in none after it.

The model comes from MediaTek's sources, so it does not show how the chip
really behaves. A Tested-by from anyone with an MT8196 or MT6991 board would
be very welcome.

How this was made: Claude (claude-opus-5-5, an AI coding assistant) found
both problems while comparing the driver with MediaTek's driver in the
OnePlus MT6897 kernel, during a longer session of porting mainline Linux to
this tablet. It wrote the patches, their changelogs and this letter, and it
ran the checks above. I reviewed the result before signing off.

GIBEOM LEE (이기범) (2):
  regulator: mt6363: Use 8-bit regmap values
  regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs

 drivers/regulator/mt6363-regulator.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

