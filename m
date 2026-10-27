Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111020;
	b=KYCsK6sL8TFJl9kqcQ2aE4iuBfbxv/SN3SUBbT6C4QgxZc8VQWMqAlXOCp8mdRwnT1qx
	 TRW2YfQMmG+MHdZbN58JQ2Y4qDLquTjf96rJfS6JF7BVOUJ2Z5htLAe4OUwODGtWupacF
	 S/VLS3EJ76/ZuEciANKouJrfYgAHw22hi8LjiHE+UUlhIG0Z5mjqBjYgweXeEbnqaE+rN
	 R08a28H8nkg8MkrRzH9Kjt3eNBoC2SxcyF+hek2rsZQFbzQZxd3/d9Fu5Vp/o0VqnY1he
	 NONs5O1P/FPZCXr0qvvEPMw2v0fJJhcUkCo5xWbK7QJCoghTBRuMSddgKXFPL7TSDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111020;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BuIlLwMd2FMVO0k1lyniVsasMmiDEzVa6CkIfR/Asag=;
	b=qFHHY47YdFLrxIK+TAfHsOFcg5lE+U0Q1ZOGgsX83jhsvuZvQpD9Q8MPlvIOPaDpsx/Q
	 mWejuo5Si9xMwsK8psC8pks2ric/PZKEIyAjfiX1bUzCl2yDMyPUqfvcPcoXTtU5D7zbc
	 wZMnwgrRa7q1rBhkLatQUSd9a075k3MCR0Zd+ORD0yZuwNqbD40dOgXv8ytSfJw7CSkTI
	 /6+DYDAEJm49Zk7z1bIA76WMEZ4bjWqdPagQGz9MHzd4nN0WMuyg1ETUhVoK8KEjsbq82
	 7Nu7LGbDuJJ81/iuz9ATL6WojNu2n5LxCjG4H5aTJJ7IMtS10DWddFMWVoMROI2uGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FmRMfUvS;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265A60A2605
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E265A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FmRMfUvS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bu
	IlLwMd2FMVO0k1lyniVsasMmiDEzVa6CkIfR/Asag=; b=FmRMfUvSHAZ5PIOqSY
	Gn4Tsp6t1pa/bZznDvD1UIimArcauK3vVR4XBisWfJ8N68OWDWi3haBAb+vBgTwB
	81P0c0k8P1Mqxqq7RKayYFffqdJtchAuDbgn/xaTeBsXAGQ6OwM/7nODpLtLLoxz
	wHFxQ7lt74h0NdXENxHyJ8TTU=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDn3o7Cs+BqSuuRCQ--.48315S2;
	Tue, 27 Oct 2026 22:22:59 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] staging: greybus: fix loopback Kconfig help
Date: Tue, 27 Oct 2026 22:22:58 +0800
Message-ID: <20261027142258.1720002-1-linfordwu@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:QCgvCgDn3o7Cs+BqSuuRCQ--.48315S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWxKFWUAw4UZryrtF43ZFb_yoWfKFX_ua
	sYqr1xAr9YkryIkayIqFs5ZryI9a1qqrWku3Z0yrZxXr13A347X34DW3Z8JF48Wa15Gry3
	urWkZFnIyr17AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_5Ef5UUUUU==
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbC8QPvj2rgs8P2lQAA3L

The loopback driver help text describes the debug log class and names
gb-log.ko. Update it to describe the loopback class and the actual
module name, gb-loopback.ko.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 drivers/staging/greybus/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index e1d7ffdf4..3ff475500 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -75,10 +75,10 @@ config GREYBUS_LOOPBACK
 	tristate "Greybus Loopback Class driver"
 	help
 	  Select this option if you have a device that follows the
-	  Greybus Debug Log Class specification.
+	  Greybus Loopback Class specification.
 
 	  To compile this code as a module, chose M here: the module
-	  will be called gb-log.ko
+	  will be called gb-loopback.ko
 
 config GREYBUS_POWER
 	tristate "Greybus Powersupply Class driver"
-- 
2.43.0

