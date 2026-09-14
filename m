Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D0386568;
	Mon, 14 Sep 2026 06:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365986; cv=none; b=R4y0uFOwan6r3Wa0buQCSCZdvz4LmNwPJURDco6vv4ABRbPoxI3pT1blJsl6eQKS3wISccdpe+/U8JMVuKpyZsRn2yygQdc9iTx4Hv9/134Xije4LMVwXtxIjStZbD6plnRDpwWMQwik6ZJOWrgotEkOL32yerYG87rSOFcpWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365986; c=relaxed/simple;
	bh=DixS3tEKSYRrT3FZLg+4MjDlPssTyO7kEHO/LWsK2vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HnxJBBBuEuuDyFfhGqzUjXB0RghpPQvz5ySFr8mDjkOto+ZZfkT2+ndxQCH+wOhtKjxJFJCjdrT00wz53XV+52QTgnTIo4Kv9GePt1XJTznxvB0p0TjnPg5LcRPuGT4XJFyQEmUAJ4NFrFUzLnSsj6S1TxR0a6SiS5IKqPP+y5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W9aZreI3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W9aZreI3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fvuBTJV1Dk/Ie/KYF79kHSdwiXYxbsMSNO4Fc9UKz0o=; b=W9aZreI3epRThy7331DjmM/0PA
	r4ERMCz5LLco6M8kdqrAqVMlRWoTJlrEHQfpB5as56vf8GSa21lqYZKUMSKAyH+anfcVc+X1ZW2Gw
	p35ms9MmcVqfyHJdphQN/tH/oxYP4B1rTStbbA69uZwFRa0Ih92MyyIjrdvl56qu8rlA9DAd/azk6
	y8M/JPx4ttzPvUqhMZAIi8t9GC/gla4+O1f+JDgxc2HTVkw+nPVehpPs7Qd6knBbpR+QLDGkQ9efo
	Cm2q3q5cD8ZNB9qxj1TW/+MyKI7Q37wnBs1zzpxv0S4IUKFIgVmV4fJK3/eaOUPMT2/+WxtbPUdtN
	IlIUn3UQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zpY-00000002PUa-2Upr;
	Mon, 14 Sep 2026 06:06:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Michal Simek <michal.simek@amd.com>,
	Ronak Jain <ronak.jain@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] firmware: zynqmp: use literal blocks for commands
Date: Sun, 13 Sep 2026 23:06:15 -0700
Message-ID: <20260914060615.1398531-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use literal blocks for 'cat' and 'echo' commands to separate them from
the surrounding text. Otherwise the lines run together, without any
clear break before or after the commands.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Michal Simek <michal.simek@amd.com>
Cc: Ronak Jain <ronak.jain@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
 1 file changed, 50 insertions(+), 20 deletions(-)

--- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
+++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
@@ -141,32 +141,44 @@ Description:
 
 		Usage:
 
-		Select over temperature config ID to enable/disable feature
+		Select over temperature config ID to enable/disable feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check over temperature config ID is selected or not
+		Check over temperature config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 1.
 
-		Select over temperature config ID to configure OT limit
+		Select over temperature config ID to configure OT limit::
+
 		# echo 2 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check over temperature config ID is selected or not
+		Check over temperature config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 2.
 
-		Select external watchdog config ID to enable/disable feature
+		Select external watchdog config ID to enable/disable feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check external watchdog config ID is selected or not
+		Check external watchdog config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 3.
 
-		Select external watchdog config ID to configure time interval
+		Select external watchdog config ID to configure time interval::
+
 		# echo 4 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check external watchdog config ID is selected or not
+		Check external watchdog config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 4.
 
 Users:		Xilinx
@@ -205,52 +217,70 @@ Description:
 
 		Usage:
 
-		Enable over temperature feature
+		Enable over temperature feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature feature is enabled or not
+		Check whether the over temperature feature is enabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 1.
 
-		Disable over temperature feature
+		Disable over temperature feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 0 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature feature is disabled or not
+		Check whether the over temperature feature is disabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 0.
 
-		Configure over temperature limit to 50 Degree Celsius
+		Configure over temperature limit to 50 Degree Celsius::
+
 		# echo 2 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 50 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature limit is configured or not
+		Check whether the over temperature limit is configured or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 50.
 
-		Enable external watchdog feature
+		Enable external watchdog feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog feature is enabled or not
+		Check whether the external watchdog feature is enabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 1.
 
-		Disable external watchdog feature
+		Disable external watchdog feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 0 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog feature is disabled or not
+		Check whether the external watchdog feature is disabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 0.
 
-		Configure external watchdog timer interval to 500ms
+		Configure external watchdog timer interval to 500ms::
+
 		# echo 4 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 500 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog timer interval is configured or not
+		Check whether the external watchdog timer interval is configured or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 500.
 
 Users:		Xilinx
