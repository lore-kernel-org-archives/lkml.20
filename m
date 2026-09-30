Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687E530DEE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804641; cv=none; b=NqUQl8BKXZjTRMqBQWsRe1z1c9TjDl+9J0kyHoBz2FhRgRD+Bm1V4sbMgdWjbD677OVqPJY1VpMP82tqqDkywiCSWdrYC4DuRekl9Yi2RaomCT1fPPj63Za00PdGQcil0r+MdyE2uwDkklzLUJBGXzSDJ1/AAWuxJduy7pBwLxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804641; c=relaxed/simple;
	bh=zgdwX0TIMKK91epseI7rcjjeGGouedZrHpXeiMjSxVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlMcmgT6H5NIbDBcIxeIbB9Ny4yh/x2guDdaesDKCLDrj2qCtXFdBH+Ou3LlbodVsq8NzOfoJuo+gXIpdhvtuYkopLXDVq9s+DMDybwnRnrbNgo1pXBUFbHiZdvhN3AekB1MkLzYKEEq8Yw5shMW3kILqFxEHzfRh0Q92ZXWRzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpR3VHvD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpR3VHvD"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1278189a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804637; x=1791409437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngaE6v3nlI6k6bFrkuZv4otYMxnOuZHTH+fgJ02VtrI=;
        b=dpR3VHvDbiw0wTpzLbFuuy2FfkHfvG0liL/OFdino4YLATwzi0OyZjP3HnuHdlB+cg
         hhHsVDBbwEtfdKGhl1YAkcUJMJSZnirbUBjktkRi1Hc/gGq34AduYqXjRYraMjimYrFf
         3ImD4V0RLJSpQEC2kxdtOVz16Ny3VXiqv3we3SwpG33pREkOAkZ1ibDOfKHs6cBamvgq
         +tc2yH6e4hJTKVRrTEv1ltBpdqaqTiJPVp8VYSJBvy7sFYNJQoDJ1o9NsxTDkGSxxsOu
         fU9UwjcXk0fUzT8vDTiFw0tirJ3qZQSIzPzpsETtWIEH0XzawJO+/MJmxd3wov6oHYHq
         Wpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804637; x=1791409437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngaE6v3nlI6k6bFrkuZv4otYMxnOuZHTH+fgJ02VtrI=;
        b=F72eK+qRq313MiFaPmnXU4/flWYUOEQelPkET65ABydyeW08tPzmlXhPC/BZSWr52V
         RgYy/l+QclCDOL5k+DLWiDPazj9cJpTJtVuWuB9eEMB/tE8gdQ4QkNTVzYsNFGIDWqP9
         Eu1N/inV1Yw9Jkm7ov6fpWmShg40rA79h3mqDWR/5PNnamBk3I9wnOdDKzIGtXCfC+S+
         GnXF1bHY8AiXsGWubrIC2/fYHfjLvwIugbtaPfQMXmY20H1rF8SVjbM/X8/4VOWKkhMw
         gyb3psbP3DNHBLH4XMvSSB0Vm0ESoDNoWu3ZIRxIZOA87mOzxYhbUBuJjQ6lncYyBopy
         xXtw==
X-Gm-Message-State: AFq9FYIWa84Xj1E5vrqvpk3UfygqBffPhGYscuoH6UHJ0g2f8LQgjjWj
	vSbR5vrWryRSUkapAnv60OvaRoA+EHBS5jje3gGYUO4mTCoA39as9vDBsWHQWlMN
X-Gm-Gg: AYBFou1Nb68g19vLHPsVe1/yoLtV3wJD2rv5/sk+QylfGJeE+8VicVzejwbY7QNhJeV
	jJu6UmNZ477ZT+DRDUjQYhS5PxMhDJnawDYF8fyV91POnBGforrf/utHaz4a9zE7PbQqvAlydTE
	C6SFAwYQceh56bCdXGXXCPZE+0ZFet8TRxBsP7j5ER6oTI3gILnOGK6QNdZ6c44RQ2lcBtjjnjq
	rVbKxsVu3IpKAVH+qg5NgKCgLzytPDj9lB7KfjF+90LS1n+fjFx/747GlwyoUcmbL8c6ltGhFkU
	5ZsisqyZ0XNRnHm//m2OVIFDq3x8bC3KpbssIzgjtEjzK6uEaH4PCjKpawS1OkhPigufbZ0Um/W
	iUAuMOY/S4ysfeJH1zxXMkXryQERmJs+Nk1eAPVYHHLMB331QsUp6+CYV5Acvi8st0aaiAm6I0g
	J8sWfZsQ4lG1Y/m/FwP5nNAYrRQ1sbp77lXs22+B1PoXvOtPSRIFm8zg20MGxlAZTpNI0=
X-Received: by 2002:a17:90b:51:b0:3a2:a98e:7a2b with SMTP id 98e67ed59e1d1-3a4d1914382mr2194523a91.57.1790804637185;
        Wed, 30 Sep 2026 14:43:57 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:56 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 8/9] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Wed, 30 Sep 2026 14:43:20 -0700
Message-ID: <20260930214321.600863-9-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Assisted-by: Claude Code:claude-opus-4-8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..15fe4d057 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

