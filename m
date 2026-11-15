Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731876;
	b=eHhI85c/h9Sz1meqUKaiymCfJe+MOU/v/GexGdQCSFLy7U/BmwrNcGp2rYpBIVvisAnE
	 L5dYAow13dPflybNz3hvm7jyvUmoaM0iFLoEK6LJs0LzqYW+pPaoWtMW2+rSgLa6LPi6s
	 ptaQzGFLbvy/ySNR6zKSJ3/Ez1oDpPArWtYTrrP/ba+8nOZwBAvKDa+iyUh4RH50Kzp96
	 gFh85Df2uah1I2WFUb85IkS5JA+wseSMKdIyhQzUlF6TorOLXUsvVBizgLp70ESf00hoq
	 zJgbwAky9e4HgiqEVb52pxfYbtPq3RD6LIJR2l/N7vs40ip6U9bTqR80dCiUumDnYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
	b=ML4jSWERaIwzxUpoi4+qZ9QrvQR2pdl8r91GzMavEROieiLqq8iyPbjEGXm2sEYERe3t
	 2Fv1aXy71N0D7rdGHstZ8Ng+jz4oTlE948a88r8ALNsLu/a5IaHPB2CmeiZxkx3qh09/A
	 Tkfo2uod+ZxOA0L8MclV7CYgqGI3Vkv5Y9JmPBJin2NOTAAuPHi1r060qqjH2bwg+8Byq
	 u2t6qGdJoRBOLfP4Cgfkqtgykm6RzqA34br+LCxZ1WKr+nC3qi2fp866gOhmocEIzG/1m
	 cOnA4muG+EZtCgkt/81+IOg/3zQBpFiWYIo0u+Ki9EPf6g6WmZkM1sZVyrdziQEkRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zB5gkDW1;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F76606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zB5gkDW1
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505186727fso443356966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731874; x=1795336674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
        b=zB5gkDW1BqXh1JNvLccWrWrGO3i5x3t/XGqujrE9aStiElStX+CTSJLCXROTO01pkX
         leRQ8gKHYsQUQqYjgcBGYqxVVnmO0t2Eq6WtTqBGFpBMcL0344Xr4SqRkrX0BeHr8p6w
         V1IKWXxIc4YKyfdS0U4kmaqQovnl9QZN2WWSEl43ISd5+P9aqjEYKV6+aaRCeCzdkM4z
         4ea/tVNnxTyBzZ8MntZTwqHaY0qdZ7C2L3/7a+VL/zkTIEsS//Q3S2gWY7Yhol/Vwnoc
         r/EoCDlXpFauYAQLNdoLdb8kG7Suk10lneEhlTKgY8qt+cN2wTGrLw+PRkeQS412oB69
         v8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731874; x=1795336674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
        b=FNPxBAd78NCSxf+GTWBQD44QARnajCWHeJ+ZM8IRg4tuXnb6WSipSehL0RDvgEkSvX
         26TwyrdDlcSjxQA+TS55jHUQPip5MCetdEjGjAyKUPHQfUsQIDnZBHPIPjnkpAejGrp3
         jmbzU0upNeYxj48GTm4VijcfdajYBheZsHOazR56kJY1c9WkqpQiRDUGt0TPQMCbMqsr
         R74cXFhhZjLGjqXzK2DO2c3kpJGTF6lDxFxrlZqL4oL5igszjsjg+ScLiSBvIxwaXl00
         cImRv/c6R81jj81Xfb06U4peC8NMomGkAn1CTPryCe5FdsGCMyQa1jgXD+001P3Yx/0q
         YznQ==
X-Forwarded-Encrypted: i=1; AL+hErEmBuimpfQKmCU7YZPb8XTasxqDZnUrdpmc3brNNvk9JRbzHCMm3vE407ZxNZJ1292FeZBxOEkEv2gZLA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3z2Vq+fbrrM4tWD6CaHQzrtcVE5K3HEwgzxVimQF8so7z8pMA
	JqZq376OJzwRoUB9jwwvKKK+kdCQ2FlG3g2x7VMhmeMiN6jQLZQyUpcl
X-Gm-Gg: AYBFou3AAIrn40k5TTFQmOCcy9j91ptXmIAnUtV5y6Pqe8td6L5bKUcr7akMeZ/xLxf
	i+KKxCp+dSU4tLnVlcnS/fnTwHTd13Wbo663kw41W3E+DE5bfxMJy93kSqpLjs47h5DTtAF1E/Y
	UNcxN9WY5cgWMjXoyGBhp1DADHTPk8fdrAI9vTfJHouvlzJmH4vU/HpaU5QSU/pkQULCW+LbbTF
	xs0winM9ZssZyyHqPEE0RmPX7Vdmq7Qi+fyQstQjDPGQMXEVFiukQIf/gif+7I4ABafEhblphxk
	4DyEx/1RA3tcumjQUHgvf3JVM5FrD5zUq/khn5/8nvrIk69qfJnBr0shc7a++OjuWI7HgFz8pIa
	ovRpXx0YnsJI4twmSMjTawQl6j+oFZikU88gtfmG5ImtLe0KtiBNMSB1HIzVzelW1zTn7rqKVrc
	rYxaCcBUFQqMUX4stzLuqj54jKqdEIOKH3C13pPv4yxdevc8SsTJjm29tGdm+KqEAwc0ZI3bgc4
	jvtMJEBxaSLfs74QigAlWrzLJbFGX0Ow29wWfReA/9ihFtPSHt1mH/TanSCrnlARkOp8xjS4sqJ
	+vdsxFSQ8qn8MNiHm2/vvyAty23R+7a6NxRyym+dSxQxxHISbTyKyP9bE6ZKNYd9YpGXm0ggKBE
	/57iAucOH/VTJWWouYwG7q0Vu2xLQ3gg=
X-Received: by 2002:a17:906:c14f:b0:c50:5a51:632f with SMTP id a640c23a62f3a-c50963ce147mr624639366b.39.1794731874281;
        Sun, 15 Nov 2026 00:37:54 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:37:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun, 15 Nov 2026 10:37:37 +0200
Message-ID: <20261115083741.62140-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:
- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match

Changes in v3:
- LTR501_INTENSITY_CHANNEL macro adjusted to set predefined info_mask_shared_by_type,
  info_mask_shared_by_type_available and info_mask_shared_by_all_available
- added info_mask_separate_available and info_mask_shared_by_all_available to
  proximity channel
- fixed IIO_CHAN_INFO_SCALE for IIO_INTENSITY since table has -1 entries
- fixed indio_dev->name asignment
- dropped ltr501_has_als_support helper
- fixed channel finding in ltr501_trigger_handler
- isolated more accesses to ALS registers if no_als_support is enabled

Changes in v4:
- adjusted intensity scale passing
- int_time and samp_freq converted into 2d arrays
- for_each_set_bit() + iio_find_channel_from_si() > iio_for_each_active_channel()
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 425 +++++++++---------
 2 files changed, 209 insertions(+), 217 deletions(-)

-- 
2.53.0

