Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851548;
	b=qU/8fRQzQF+dI7ra6x7LMQtxn2Ocgl34ltfdItKWQYDp5XVAGgmtIHSvSBVVAKzpBJND
	 q47vTh42WCYFXfjlUEJHab5ru9wQAmrFXhhe1vhqawggrVs9oAP92zH401IyxWNh6HFZu
	 Q1CFqs8RSjSlqsDP7hp+PwZg0OkGahcrP5zXAWL69VqciS0aBAnBRAm1KW03F2SnTFtv8
	 Dso9jJAwdgQ6zmoR3jPd25rtZ+Bp/hNWY+od52G3k/NBNhAQ/HI/E7YBJY3+N+HmPg6d3
	 oXMtEq5jmJtUOD27p1rt7Ecnn2XYs+rPwiEf2DIisn129uzOWRoZo6RAKpQhdWQI60A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
	b=Uj3rBEd3FcxWGoOOFhEzHASCrQxLmVHniNVIDtge7dI5r0U3F8Kccq2TNrg5LJG32kg+
	 pqiDAgNSGokx0pyHFNrGnZgqIzrbBj9nn7RuDW5ZHiCunDuBoBEVc0JSNHYNCtodorBFN
	 yCJXkDcYZ6uWiEZaPD1KHzUsVFq3jvRcmDjSl2QLn1801r8oCgxBzw3EeKIzh05UO/PYv
	 UdktNu6SFrUMiKqfEU9nI1ol0QDSlrabg1TDSKP+ZsxwIEObnuMNZNwzGtNlemo7rFSHF
	 m2ioFL1ufdmG0u+Z8VnjBVM0QDt39ffGMn13stfPnOhgcOhVdAVpZIaTUJyYpJJHhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EiHA6/VL";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A1606A897
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514A1606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiHA6/VL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23313305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=EiHA6/VL7T0syc28WB7DUZlL9JItrTQFkuyP5mHTAqSdArLCtgFfTxjWkVTyNsn5I7
         2/l5Nr3JawGIpB41F6WSjbSMO2fKd92MukNU29kyHsVIPQovbSW8Pta114C93mfnhKF7
         1N405J2LtLyA6Q0Z70LxwpocOxSAvICqG/q9OHETafOXYHfXWjqJs/GwhSK9tC2EO3CT
         jC11ZsvgVIe3JyRAauk5ZMh9mglon2gQy7iC1RXiXuxsryEDIzD6jdcT9OFPDB1kw7Sr
         XeT/XrnIeZxHmqUWicMd3XzrR9t9u6fqFYRn4OAk5IlihdVxto9aYhxbbQhsxq33xSd3
         vhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=EXe8Gu/1G4ckvsiIonbmctUbcPW3uJEjeY7I+oFNLXOZP/YKX6gOiawuP7wPzZndo6
         bvRWjruuEMkNfn5GpFfo2iKknoSqfIBVTG0ZavWsbc+3gkqePd9l37iAyPgiGkaUExCl
         A4CrTIqR/mSamk2xoXJ/5V1PMh/oA/k3S/5SYuHbvXInscIjcMo+FLO/z9L2ZJ10k/XG
         7Ntje9beVGl77l+3GTjRTfSj5mU0dxLvEYX83MzyrIOZCDf19UELrvSOUoCHTRnu72My
         gpl7YUjVnZ6ogDCd/tWn9y8D/JS6SVA2oR/7XeWEyQo1wKdoKjWenzg1otPVUmiGlQi6
         QJag==
X-Forwarded-Encrypted: i=1; AL+hErGNeVsIYfqUbETWgPoqvQkeJ4kpEbthlxl7rVOuTgwyagWMpqKWcgOWoy7FUHbwZ3/QpsCv69tgMcX+gPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wc4vVnWlrbLngOO72FFnB0Fiae4ZwrssWeI4gy7e+bKLqL34C
	Xru4n1wLeQpJrpPLbktLzXH4awaydRFT8xWbOufPDqf+yw9atxcDNN0eujC2DymDH9t9ztUu
X-Gm-Gg: AYBFou1SFwI0iibYUxG1fYSlkhgwiAf4kKVubi5yJzvDm2oQUYjfVZeLM9UDlaVMucM
	85v19N71bIJSyuVNbWlVp7nrbBYBJ1bBK6PnSa1Rd9TVJ76DIx1vkaUcw7nOzPFDPeU7JPxxx1M
	nE4GBRLUxQZNQy9ENBVOETqB88TYSO8ysgPN4n1nALQIvRtJZPeCAO6SmSD0ahtlI2nsmgJSPjn
	jTJfyLkH+QVF0MCBsbLMLuwjnXFq4np1HhbUYrA3KqG4BjgPbkzXBUc+xuerZiBnYYOtcYHZ6cX
	nmtP0zXN9VgGTiTLSEjp0vb1IOjQKuxlSAYo3NHv0F7I/mURx6mVnvUvTvtan0R/8go3vE29HjE
	iRG0Qm30xGJzj9an01hWbLfKHCSDWX9IuumhEAhoaLt20UVanDoT+Nlj6JBBknTgrv+7IGNAQg6
	GC6b6oefpi2wv/Uy5BZinlQUultTxDnC3TW15TUjz5/mdU2fSVKnP76WCihWgX5Vmd5mnZLAYQa
	0XOAyaPI6O9Y+FWJeTB+I38WExF2ZElookfHO05ucdulUb7ng85sh9gtB/0UM3NFS7wGbsOFBzj
	tkJ9c8S+WCSA5dxIPjcO5LpMtIm8nPnggRXw3u5pJBE9LDGlAmZ0qarE/Zo+P6uL2iE=
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr247795715e9.31.1794851536667;
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 3/3] media: atomisp: csi2-bridge: Add IMX175 sensor config
Date: Mon, 16 Nov 2026 17:51:51 +0000
Message-ID: <20261116175151.20150-4-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
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

Sensors without an entry in atomisp_sensor_configs[] default to 1 CSI-2
data lane, unless the firmware provides a CsiLanes setting, which the
Lenovo ThinkPad 10 (20C1/20C3) does not. The IMX175 rear camera of this
machine uses 4 lanes, which the imx175 driver requires, so add an entry
for its ACPI HID INTCF1A.

The firmware's own camera _DSM data is consistent with this: it returns
0x0104 for the IMX175 and 0x0101 for the 1-lane OV2722 front camera from
the same method (GUID 918ab242-c37c-450a-9d0f-f47ab97c3dea), which
appears to encode the lane count in the low byte.

The VCM is left disabled: the firmware does not name the VCM type and
driving it has not been tested.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: atomisp configures the primary port for 4 lanes and the IMX175
streams in both of its modes.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..239c287ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -360,6 +360,7 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INTCF1A", 4, false),	/* IMX175 */
 	{}
 };
 
-- 
2.43.0

