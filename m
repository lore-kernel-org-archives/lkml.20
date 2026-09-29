Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135D4F5E04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674127; cv=none; b=arX6gdIFoGr4wMtVEycIJt3X4bxCyYRQ5OIY6euYFmeRyAQ2hzrjHYiTdA9huxGKp2UWBAXxrO1VmCtl+MKO9ENoqCGaCTl5ABW/v5Cxo+tAmta/nqb5W3iZRXYwiamC52EL54+V049FmWphP0Vza+98VJEhr4jT303UyKNEq0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674127; c=relaxed/simple;
	bh=d2AdCcLoSMXGArgXKV93LIaXtFwYO2qc3OCZ1tm9oko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRtdrzGzqqKNbZAnBVRuB2TilDHOt8ClHio+JHaggBDu5zUQFTdrW0FqmdGL9THYORBYdLIZEV385XhBsWtO8yPUrEMbM/E9BH46XHn5Dgt9fQOtdNc9IDe+OI4LdluE0CXR55hu3w/X3iUVDEP55B6Ezcf+F1lTa3bihU4rCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlbwRYLH; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlbwRYLH"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso33275811fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674118; x=1791278918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OhnNj1c8wkM0rfJ75w5XkRFhHnimGOE3ImwOPsJtt8=;
        b=QlbwRYLHejAv7TOSjIBEoaHbLEEbpoCEGzLk2En62hYfCSwI4km6Oku+2QJk3M/vyb
         cxpgMsUFOYb1ME70Ft19g23se85Ml65nE1ljLrebPtM/Ij01UB312+RHbmx9D+2XfjCm
         9TAs8Gq7shYvPUTl2eLOz3MDDgWIzOKmDGX10FWUTw3O8FOUiWNcvwxM0ITT1nWuTPHa
         Gm5sxYrHU5vSXelc5FphdFzkq0VfnbO8WDPL76++5o8+nZGiN3A64L2BT96M2zADFGnr
         1KKCP08W59FhYDBi5QgvMsEPzXqxa/Fy36CHD+ncJVcKuZ0a6aZrNDx9VwHte35h0cWw
         f0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674118; x=1791278918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OhnNj1c8wkM0rfJ75w5XkRFhHnimGOE3ImwOPsJtt8=;
        b=h+gflPHtf48MtZuNMZeSdiEKlloCPBVQ+Os3ft/uGYs82npbk3QAOMXLocBbA0Jp9T
         IsNdLkqeVdeO+rcFn7iV3euKy19qHu03bDBghKhC6HrSvScsqySDcT9a4KoQhmunQd3N
         GuDOT1veYuobIiqt/s0kwDMLP9wkiveY7GxryIwLSJA+fwXM9KqpLh4T0CjIy/AUno9m
         oL5r9C6Pu94OElrqrRuyA6tO/xL7Ay2PdSkwjZUk+k5gNC7civXh5Rl0nb8OhPDHHNFc
         kgkH78J8Youbmh+zZL1MU5a53CRxEZKBWfjabJHrQ0wWVVItttlhLi5rrM5bhbLWfBWm
         x0CQ==
X-Forwarded-Encrypted: i=1; AKwUvByxImLj3nYD7p4n0rb1yyYUhEZA8gn9oetGTat+O/VKRZ7860RJaK1usVyTt56wR1qDvRSK3oDVfDndOtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN420OVblxnPHG54nPU6I58/RmTgYo5hXTJQ2Yya+s5DEFe+UH
	TjeI7GJrwnxHul+jJhoBbVdUL6myYZZ7P8EcvWTJS0Ew7NVa+iwKM9is
X-Gm-Gg: AYBFou0ZGh1/P2WhZgzoPYMFo6oVSgCsFpwbaT86vbDBKWF5cyDeovrmtLvsxwwQ/0d
	qn54/sP89EUIiwm9PNvC24l6QeFUF68Zkuh6Fcf7JKc4n8dVzUPYeEsO2On9mK2MMXf/TZbihyk
	g2CzLI+8GTH64HCt2XB3NGoHf/wXuLr2pX7c5FAJT2/HZQadWyvXGtYLOMKqYik6a17r8Lakxxb
	Sz7eDCVb5HItIGaAh89vQeyigsbeGzBIgXWa1hX17giPweVeVrcMMSlKTF5YKwGIEdxwND2yd4J
	5icSKHEJkfTTSxVDglb0b0oC9W4Uh5A7lupQNoiPZs2hdzrs+Wm0ik/Hm3opXOz6DDDNO5ttRnL
	oZ3cWCgAb6xgbTXZr54XGosKZKChqGy4bsr37XTdRjG+/QDuoPIRshI2zmKmpF0nIsBI+IZuanB
	yZ5QiOYLl9QPQ4cFEdMy/J5lc599E4ERc1mGqTm8ZYhasXvgiNTZMD65CFl9qNmkV6gkxwD5II0
	6qngIhvTew=
X-Received: by 2002:a05:6512:398e:b0:5b6:1a7c:fd92 with SMTP id 2adb3069b0e04-5b8df0e4a6emr6242302e87.56.1790674118381;
        Tue, 29 Sep 2026 02:28:38 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:38 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 2/4] media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
Date: Tue, 29 Sep 2026 12:26:59 +0300
Message-ID: <20260929092700.1776966-4-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACPI HID Lenovo uses for the ST VD55G1 IR camera of the ThinkPad
X1 Carbon Gen 14. The firmware describes one CSI-2 data lane and, as
usual, no link frequency, so the value has to come from this table; the
vd55g1 driver requires exactly one.

Use 402 MHz (804 Mbps). The sensor derives its MIPI rate and clock tree
from this value and the IPU7 CSI-2 receiver reads the same value back
through V4L2_CID_LINK_FREQ, so both ends agree by construction. At
804 Mbps a full-width 10-bit line takes about 11 us on the link, which
allows well over 100 fps at full resolution; lower rates lengthen every
line proportionally. The rate is in the lower half of the 250 to
1200 Mbps range the sensor supports and is the one validated on the
hardware, where 804x704 streams at 58 fps.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index e476e269a..8bd200896 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -122,6 +122,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+	/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
+	IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.55.0

