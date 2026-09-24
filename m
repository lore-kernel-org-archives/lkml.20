Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E839891F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270367; cv=none; b=qT4eJcbByLwUsNLShqz3LYExobVEbZ79PRv3WD2tDaXo5fV0MJkgqtKSx3XBfxBzkkO7Hq4XYYJlOkZIFiUPKGwOzNvWPM4CdrSWims5ishuULS52URyeN/dGJtXy6dn+rlr74ixOAyg1+/jwCyKBErfCQYo27xxBLcjLLRH4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270367; c=relaxed/simple;
	bh=EyBcA/Tev/w21v3ps54k1u/khzZboHd8p90RlqkDXVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1FkU+eZA/jx9YKRoONUMGWw5zJa51BxOir2zewhiHkKRY8ZACz3uxImUzOKKEuXRvAAc2ibz5Amg331oQzTiqyZd3egl7xVAW/xx0igz5du8RYQVCk0sETiwt7uLm4kDP8NUBQvbzLdj/+7HYmlWVT2VnG6LnxQoppouRkcJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljZQCWZ5; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljZQCWZ5"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so19022451fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270364; x=1790875164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3E0X8b6Xsqtylg83ebF8p2MOGz7r4MjOPY7FVP1I+Q=;
        b=ljZQCWZ5rij70ieOuZ4HQsx5GnZ47ERim9yuxscVlGrQr0VyOp+O7MV0GyuqusQ6Yn
         iqWFf4KzRvtnGq9vAF4GLk+P3X7UKnLjN04ViF9jfOovhK1oQVMs7pb3KokmKZs78i4X
         roaTJwP/jedSHihjJ2FVE7FpiP+Nj8fOC16Yfk60lwxmGgl9ojhEhagf2HNLH7kdunoq
         TH7PlxTqvsTd4VGGBEUY/edzt5/xx+KB1dls5/6v6097s8/O+d0kB0eeJ8FCLSRJru3f
         vOWINVocWw0WZbN0OQPvKcbINdYAKqisZY+1QF2UcFaHXqsKd9zCBeW4d594e/KExXPh
         m4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270364; x=1790875164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3E0X8b6Xsqtylg83ebF8p2MOGz7r4MjOPY7FVP1I+Q=;
        b=B7nYMZdiWB0pwymiGEuydly2yB//BQScVed4rBIOj1NtqyYD7XpfNDgoUf/peB3jnC
         tW6EPzQAvoIQvENVyfv+NjhB640I9XP1WdnEU3xY+aF8YTqMlive1320WMXyp4YLY6Zl
         RIvq9ft/xd2CoItgmQg445H7O47PbJw/EcYxpO5Ee19CVaLc2vuAOo/TpfLJqNDelpyy
         1SK7ezOzv+s8p4mozW5xM3U1HXuC72glh8N9FnFKplQEtsrbpm0xWQcY4pW2yOfWPatN
         SZRrj1uePPkbAmmreAwF1qfRswpRaacMpqDqSb5F9rclS09UX5kF4MlX2Ct06s+kcAx1
         gOWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1kBBqWZ4Kprbx45jRsydlmyR6stjSqLvtujfvDE/OsPQPTBF9QO/Xt+zrOy1DGNmFPE0PKlDyUCYhsZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mizuF1wkcviNG7efrfA4P92X6iuIHubqx8jPHoh6HSTZY/6g0o
	CXagzaqaa5QFwdmupHtmsLe52rkGeN7JYyA9W7nKVNrKck8egwTU70/r
X-Gm-Gg: AYBFou30Jnx475s3YKXujEvwdlKcKvKNJN9rUTOCCDtqWb7yHajC19tOYwdnEWSFS4l
	9JyoASzRPp3GvvLi/nlenjj2xuy39n0Yx2eYqAV3gk6LA8Wd2ktPpovcD+nH0L2I/l6/Gjtvqzi
	gAqmC6E9cei2xI1dc3+zaNHSYJUDbCKKyUpuNrqoN2CKUbCFgdGpCDYhZGagHgE+z+dqx21Qeeq
	d/Pq4RSJok4XxhKEmlW62Yoatmm9Lz9TmpGGSssnb/7Zx4qOJMibGR9FxulM8HSE+jjjv3ZmGO6
	TgHZ/knEXVCd4z7z5PSM1sRttDjB4/liAOBm6CcIE6pAnh1wTWuTPTETyB2rLS/5NKu9kjQpv9e
	QNSXlAOusMKrMCKG5cE+HNj62wWypnxbafTZC1aBeSAMSqrRgfct1afrdkmP60Xiugjbk878qEu
	ouT+Yv/XxZLFDV5XyOIfnnFgHzN2QPwGhRmy+R2hFtf6IVQAW8D0RxuV1kmVGYIxwv0XMYi6nea
	ilnEtCZdfMThcc=
X-Received: by 2002:a2e:bc16:0:b0:3a4:9b64:9811 with SMTP id 38308e7fff4ca-3a63c0de06amr8123461fa.15.1790270363193;
        Thu, 24 Sep 2026 10:19:23 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:22 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 2/4] media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
Date: Thu, 24 Sep 2026 20:18:18 +0300
Message-ID: <20260924171820.1179823-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
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
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index bd64c0400..5941428ed 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -101,6 +101,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
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

