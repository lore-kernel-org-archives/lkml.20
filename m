Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4449B1F1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818449; cv=none; b=J50nOv6cDItw5llyrm9xmJuJeHo4iyXKQ+g1WXBGxtvqUoFnOO9X0BUozTjy7VNNpofmlUuR3+prkjArVyJ+SJkA/e56udnWGu24Ahw67s20EXLxBGZxcUhiZDa+CFFywY9S0rTWupJ+BwmnNO+r7vS2qyiPMFoTK8U/mPcfeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818449; c=relaxed/simple;
	bh=hYDKT3xArZmciyLfJYiXIMbcjnMjQlt/qr8tZhfeJQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lywnc+JuhhxjnX3cVxjXCT7rSygEtgSO+cYz0dJGR8TdugxCpaAY3z2JllxC0Oi/zHY5Nl00+gTsyYuu4tmTtLHdSewsoXEkrTc2SahsrdiiSl06W5fcpgND0M2k27Fg3pAaHWCTl528Q2kyMFPqTvfFtTj64g3cetmm0YkIJ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNaENbaa; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNaENbaa"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3115c4451c8so2106859eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818447; x=1792423247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yar2nzXprexqPKj2vgCvzCiguNq4T5j0jFeUqERpoec=;
        b=pNaENbaaVScDLNmnSaWKX3ru1C9yAOfmpXsdmT/AeTzYiOJSRVaf7LVscoFZ77QM1a
         etmLL10qNNRyDIISglgeyew8e3inIm5spA+FpruBQQVyrs8UvBuLG0mNQyB3Isc0jvIl
         MUAkLYXbmonY3Px1omiIZWXJi1fszmraW6CH2Qxsmokn8n/qbbljJQARZo8OiaI6/O85
         XaGW2Nku9KTrwQmy3K/jSvdhbWl9zrHtMVmhHfudQwuc+gCUWlL+EwYWf/SrpG+5CDZq
         f1/YjoHXzW+dYxW1DeDeU+261+Q0iXjsRilWC7KGcE2MRqnDPZ1QFYBczgQhaqJxM2rt
         gC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818447; x=1792423247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yar2nzXprexqPKj2vgCvzCiguNq4T5j0jFeUqERpoec=;
        b=TRNoam8nXRKDXDY+7jzPJ+32m9TPDuji1/r/DnOa0kXOt8jqznxbK0O8aOmIRT3utf
         cwQC4aCzSP5Rp3STnr1sJ2fuxGSSinsBXpYysM/GJt2b+WMtMhZz9cvaTPRWJ4dY/pd8
         pG2jP2uUhncvhWO2AJKyWYEZ0z3EP+4h1M8aSDIIUMAlAeGrJUYKyiw/aXewl1ByMAgI
         GT9c0518a9geWB50x2sKYbIXO0rFWq4RHoNCd9pxCOIleXPuYAcDghYcvVg8vPywLALq
         BcQ6Cq6+TBzheXiCF48uKNq6jMT4ZbVbqCVnqXzS1qrNjRtjC0qKknebzk+e/QoN3Orw
         YHJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ0djllDBCYBUORmpmPQdC+d+PMzPKrFBmcCTV5lZLPpNJ0Bi08yQRbKyS4oq0gZUDMih2i0efLTWmwRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQkmkB9JbAxnDauD3i3sXJI2Dh0En+S+2HEQ/dXx+tOyygovcp
	5rYd39DyXH/TAlreXOewMc/JIUjZyyLad9or4NkAsCIKOx2TuY1FVmBH
X-Gm-Gg: AYBFou2UJG5y89wWQITVQAmN6A7klcmWDBTE7/oTCytVWpDYaQzIjDne5GRAk+WoTDM
	p+wVUe4NFfC/NM2/8/5CseSK4j7bAAWiUTXsrxKCIba3tVZlkiUkKd+wNkPuXBw+Jq59dB1oCzC
	V7nTXM/HqkcGmHyNMAhN49vDAVbu3V1bi3kgPWsI4YwBrnSJnaQn23z6Jnle+10h78jZwxInh9x
	mz2mSOEnzmkCu/+430HTcNLjVazndGdrqvZVKMfkz94bk42oZVTT8AOuSDlNNj7SCq/hCozyjdp
	o4uZyw7eDdZVHC1ennvvzYNtPSXs1aRQ74ecpNW5XukOJ1HG823zep2X0V41WNwBQLCV52mpNvC
	S2ecd+SHczZfy0D74Z/YlxOX/hVCXKxY6EfgEr+FpYyBDNyxuXVgYDstwRLW4VKy+PYQPSA0DmQ
	17pL6KOuQKCgfF6TJZOoEGBVAZFlUocRZFoxbEedhd/d27iCupazl1KtFFU1l2eeoC5FUpdFIQO
	1MSE8I8u8Otzddig1702RkwAqWmq0dIXl2n4U7Hy1I+Q/ORWVZSLbg556Iwz0F5N5vGX1Md
X-Received: by 2002:a05:7301:241c:b0:353:7f47:8168 with SMTP id 5a478bee46e88-3537f479117mr15344492eec.17.1791818446888;
        Mon, 12 Oct 2026 08:20:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm14939172eec.19.2026.10.12.08.20.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:20:46 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] thermal/fw: Fix kernel-doc parameter names
Date: Mon, 12 Oct 2026 20:50:32 +0530
Message-ID: <20261012152037.33461-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for thermal_fwnode_cooling_device_register() still names the
old device tree arguments np and of_index, and
devm_thermal_fwnode_cooling_device_register() documents fw_index rather
than fwn_index. Rename them to match the code and reword the device tree
reference as a firmware node one.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/thermal/thermal_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_fw.c b/drivers/thermal/thermal_fw.c
index e8bd2049c..7c28bfada 100644
--- a/drivers/thermal/thermal_fw.c
+++ b/drivers/thermal/thermal_fw.c
@@ -11,13 +11,13 @@
 
 /**
  * thermal_fwnode_cooling_device_register() - register an thermal cooling device
- * @np:		a pointer to a device tree node.
- * @of_index:	a cooling device index in the cooling controller
+ * @fwnode:	a pointer to a firmware node.
+ * @fwn_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
  *
- * This function will register a cooling device with device tree node reference.
+ * This function will register a cooling device with a firmware node reference.
  * This interface function adds a new thermal cooling device (fan/processor/...)
  * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
  * to all the thermal zone devices registered at the same time.
@@ -71,7 +71,7 @@ __devm_thermal_fwnode_cooling_device_register(struct device *dev, struct fwnode_
 /**
  * devm_thermal_fwnode_cooling_device_register() - register a thermal cooling device
  * @dev:	a valid struct device pointer of a sensor device.
- * @fw_index:	a cooling device index in the cooling controller
+ * @fwn_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:	standard thermal cooling devices callbacks.
-- 
2.46.0

