Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA1146AECF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806407; cv=none; b=jrRiZktzdvCuvP5Ll3rSpg4g/DtmE9/oGsqTrQ/Pz7ujfxi3ctV733R0U+aQ+MWFfQWaZEtRTPe+RzUoqoJhl4waSMn8vIdFs0JVNATdd+4wtmrvvZd9pqImlK/l1sQZGLKhPM34+0uEAiE17kdskjF7oE4QBKyPc14GGqP5v7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806407; c=relaxed/simple;
	bh=VEJhzSBCAvjIGbrluYdUMnZeAPSBNrY0yfuKHbyU4m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDaRcOJZCqJkjkdrIjiDEr+HoRED8XZ/ACRGvmFu9WLworBSAJChnjBLXYFEY/R9Pw1RmdZ/Gui/oCpslJuRQJyEPUeCcws7Z65aoZR65+7o8QwAFaNQkv/U7JYd2EmsxRAikIlbuOLT4I4QNXmggLFUrxre9qMNnNNG7mRXifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbMrh+uB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbMrh+uB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1741783f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806401; x=1792411201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=jbMrh+uBgA+AJOQG7krjucr81r8mlyalzL+mkBBxRkSNF3mhbfGVj6JpZGwmvEPwVc
         MAPwE+idIZbDGj2oyg+Shkl7Y8V4u3A/lPqdFduNaPi3nTpL0lasoyXLcu9Z0HNBYDT0
         nmzNMnSq1zG/shvwpHy/19/3j9/hEX7FybtqU3xftkPFskuDk1ee/dy8CNtENU05UTJS
         LGxWkTh2uzS3sxSfKpVXDDf+3LNlbNhiLImHEOVNAGkjyJJwEdDFH6dXb3zXSeFNw48f
         nMCT4Yyl/xAuczwvgC3ySP/uMqZJPjIh8u3xeHFI3N7ogIG7CZfn+nC4llY5bfP26WoL
         2bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806401; x=1792411201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=0pyR0p25t9Hqc32EkwEs6bjnbO1yswncQjcBBBP5oEnYJvYPPXj9a543A7Wf8Y9geA
         YW+n7ZrhDlpWoMzBoutXIlqaquDssVMUL5eNWdBSMgVDsZ338VouYdB/tdXnr6Cz+ZnQ
         /xcxEkEdbA9Z9Gni84XTpAu/iFzXJdUQg0/peESDZFD9IP+dRpLffH5VmIouHQ9YOuIT
         ed3qhgk4WUyc4KzpNKpxD/TiyXfg3TzfzR2VkZx7Sft4jsLCZD/kr1BNNTWYcjSCE1Xe
         6Ww6fy8Ip5EpmTt+ka58zINGJLtYltLmsE9QplOgZgwXSMHVHviEzcIVnaROGSkbqL+X
         j/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPQoixh9Wz2SP04fmRqNGJQGkMp7FU8SkjrMWEeuZomTYJcZ4i+03KXxuTyZelcF9qggIyP6VauCmIlns=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRuMouiNLNv0mDDDVPBxfNNW40Yivd96oM4HEY5qnWoONtA/DH
	qZa5xCuoqdnPF56UDjuNzlq16/r+wEB4KRkO32JFUbKc6BgrW84YNvsf
X-Gm-Gg: AYBFou1L95QS8DwcKhtEcYtyKLbgkaulhVlwJ4ekcd1uLsPS/sw0y3lAll1plET7FgS
	/0sEgyg56W6MkzYiiw/AEQGZt2bBlmnzT7ctqvwiaV6Idu5T+BhD+fI1LiY6hJFhKkcriA2gacc
	o4rrAI+6tf3faS5X/tYXk3bzJck+/dF2s2uhLk2LITIO6U7V8GBVn0cjwKDEGOsHeaiat7d8T6E
	tofDI+1plUUNVKtOeOjpZD9JWInzql0N2C8YtK+BciBkFH/EFpp4LFKLYFoXqa9LIeUj6l0iShR
	0g8/vRGPAzr1o0Hl2cZkKNUPh5UaTuAtcLEXq781izP8B69+pm3A3r9AJDctRuFZlENBuv+QKhe
	Ne3evvl9LnJexIKwJzbbZdfgeGN6ngchC/8UF1GDJjZ1/GkKNUO3xolAe2WJC89Hf6dZksLTbKI
	VLH6YuIepK2rjA2/fYBRnJyiAiVesiWnaHMe6AjAefF1ShZi3/6iBCTQA4zdDv1thIwlP66djkK
	ZGJORjpUeY8VRxEr3LzVwQqQh81IEwni0wmludV5Q5rDTrmps39qdVGw6rj+bNIu8ozxBmBKisi
	2XTFgdkxbJp5+jMkyQ3XwyU=
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr13875223f8f.26.1791806400904;
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v9 0/3] clk: add support for Airoha AN7583 clock
Date: Mon, 12 Oct 2026 13:59:50 +0200
Message-ID: <20261012115954.92718-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 258 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 347 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

