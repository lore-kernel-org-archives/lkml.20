Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130997;
	b=5Sg1sTn9F+FdWwWSgNBj/OcMAcH4cq5Th8VIhVRd1tretNqaMCrXXcBxMz/Fym76VwIO
	 jlAWdSp+ClsTTNLnsOt3/78Ujk1nt29pj29/TCoZeLwlKKsTTg9oBLCRM0iBl7jyAEKz/
	 Vfgc3BY/m+XHFBZ6URaoFYkGZsO7XYHzjCU3VnjLx6af+8elYrbAphtBBQagGY3QKRrl1
	 vhpr3c2tFQ3F17ancqUJRONdoL0Nqyz6W1p8KFGc5XxAEhVGFH4ax4oRg6/tuh/ccjX6B
	 +eQnzW4TXhlx7uXC9QnbZLc8OfA2juxkAeg97FLMO5oYYjJJLFtWlWvgOqt7MUVYZVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
	b=5jqS/q0AMkHqeTWLgB5gumSFkUAErRpMAPIPsOo3VSAZPRzCg9eHrNhbk4o2uMrKzqVH
	 5dw1qrHT2y3ZdonwmovwHMjUGV34glW8nASjYmHda+bQFhrtzffAAlWU0JkIo9D3fGk6N
	 mNEWHuucGf7Ki7AKRRnrg7nff8NswQT2kEkziJ7qgPyBBSSHCdBReAIJyl8e1EqWl9FfN
	 DNRgueX58LDMJXj/kqm/TgUFzmRC1e/x0vsWC9R9wphoAs95Jxy7N82vXvKn4U/RVOOdy
	 dftzJ++KBXYUt+lILJfkNlz8VqX3taTMCU9xNYaCIdwx9MrGrH05HRlLikPHCzuhBQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBvCECDt;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF38606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF38606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBvCECDt
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so17842a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130996; x=1794735796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
        b=CBvCECDtMZ21MHgiuUBGSs384znpHFFtpjSrrAQkXfe85KqphHgLSFvfxAvdzrkMqp
         lPQ6YLRo5/91Nah7agor6YI1kCUC13rbeClY8J5ktIkTBElwTG/IvI1ssJmrKYzwXeUX
         BtPFXQfmZxkB8M4Os8xUBPTbuToUTi9YGVoIvI5RJoUJUJMO3x2zm+NRjeRvi3/Oub64
         Ow3AXEq7yS97bbF7xquCHLnHJijBuaFnb3xDUTY5L0w4IkfIrjmUpdDq1OqHaVA35Z+h
         URnmaCgOKTw9zoeybRl6ij3S1WZkzZ8jnUaa57gvI91NJ4v7a8i1Ja4Ry+1J1ohmkme6
         vekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130996; x=1794735796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
        b=cO5AblPYShgCqC5cL5bJo+JQVHfyBKUAtE4SjhOjOsZt4NcisEF7nLM91Jf78P2sey
         6ibcTyzyjc6PxKTb06cV2DLWtiS7cZav0+HpX2EYZYK1D4VAg+/WGHHDrIZnwJkJpZha
         cr8YU+onI2SZrdMOhx8Ct7tNsQdmrQ9h75yGtleWuNg+xLiYh34fOHptTtAHq5QHSPk/
         u9Aq3xvgr/ZDZscXckkz0TbyNsDhSsUICiKfgg9uAaEKHqaZ9Zb3KlId9VEudpRN1vhF
         SuYq+egpzJcQHUdh31fHhROOFcYGkI0RglCPj0El5E5iOdiIf3HrpVFBQDVI757TUTvn
         bV/w==
X-Forwarded-Encrypted: i=1; AL+hErGEBOqnLXhu36TzRpqHmvuO/Ch8imaCAPT7KSCtpqbw+DytcqHEhGOWwmI14Cn+tQUubXi2KvH8LRYNgRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uebPj3b5iSg8/gQxjdU+m0mU2Ptv8FPrxEiU77Pv+1m3YXkqQ
	EphUqSKcoLBgBHK22V61mUSQaXLASH1ieK69rL+XspSS8EujSr6ex93v
X-Gm-Gg: AYBFou33jfRfp81bgL6k98mSweMHIy422kS6kyBgdVkP84ZyweB7okXj+Wz2teSg8zc
	ed4AxxGR1KX+9swGkYsFuhUeA+Dx41TmAr5asnXEowLsF9DReat2nbI8mnnT50j/XKkTRpD/Oqh
	khLcF6GefG/hXsBREXvPcSuCw+wtI5B+NNL2jeUCHCbvYVR4NN4JEsvZ3jE1IGGCTwD/P2z7xdZ
	5K19n04z3jcoJdkMEffdxGEttbo4MZGpO8Cl61ESTfHJNPI5XOJNefUbjk3OLtvFCnEOLVgpyqX
	C95CMB1OFX/fcEzjzsn0x4KhP/r12ENB5OGAA9F+Ey83LP5q+O5B8dYxwGD+KlkQ/EiTzQMomn3
	7z3vzzEBmh4KUjHY5VC/rUjvQfiLg1nKKfHglOy4FuELed6s+qybxJFyLH7p5Ex4OQt734bIfpj
	qIq88IRs5ba1IIS/wwtiGo/oMwsLmgC/q0mFSBVUoOd13B7tN/JzV1xtl7wJE7vJURXLpbgpb4j
	O1pUFkFMsZ6XZX4b0u910xBRz3QSW+QF9GFtK2DyYhV6SvdE17UFQzI10jA0nsdcYW8JnpvtZvC
	iF0rLq6uBRpIUqsgQ50pn11ovPXSJuAzOs4Wm3wRYueeP7KykW+8/yTr0vonKVGgEvYPhvW1J3Z
	KWd1ymAUeoA==
X-Received: by 2002:a05:6402:4010:b0:6b6:f7f7:dd88 with SMTP id 4fb4d7f45d1cf-6b72246afc1mr634054a12.17.1794130995645;
        Sun, 08 Nov 2026 01:43:15 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:14 -0800 (PST)
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
Subject: [PATCH v3 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun,  8 Nov 2026 11:42:49 +0200
Message-ID: <20261108094253.83899-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 424 +++++++++---------
 2 files changed, 208 insertions(+), 217 deletions(-)

-- 
2.53.0

