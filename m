Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839038;
	b=eGS7pvqlhm5xYY/tFGG1N5ptq4lVWMQfPACkkkCvI7vp1uehql2/KLQcwMJa7yIjsL1r
	 q+oSvd3kyW9ZPJLzAjNSsjMLi/bHmzQtkAEmBurloG2uu0KNnv+hVJqbdD4QT+lSwWoUh
	 ZuoDXR3R1mhalWx8K1n+NYM1P0pv6aV7Q97TpuG3vMi6cV2z8HnAZP5o5LxHnKaxV+WLQ
	 e7Jn7boggAicMGy4Qud2Rtzfyg+b/G4MPPHuTmEq5iyi00p/yZkxKHPxnU36LWoyhs56/
	 et6UsKYyOxK7VhfILLc4Fhj1pfLuVFnRp5REJOPtuaIINXHeL5hhNnLhfa42IsSLbXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839038;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=EoaRfVjB+wiF8oKOlK4L7ySxFsN81xtIauFrg21540Q=;
	b=y113yBoaCrT9kIu97ltxzyqFQVXRxa3srdIC+Bc8QpH/zlRFgOGR5MBSX8KVMsIvmW/5
	 jS0qp/6K3NafS19VuRpZfSXsDTL067oNzRjDWygaTkdkaSzd8h8CYeGnYc5Cju9FzFB9R
	 IJ/PKUMKZsw/FVFyIpAS5HWJFj0BNBOMSB3G2Gy6Ut/fBlm5QgA+hh2ekKFLNiwzb8NUg
	 FSPxTCYMloDuYDUtjI2fXjbjphc1Zni3PfJjtI+xs7sBj3Qa3q35rhJk/+j2OCuLLE2BE
	 35V+MHUX7r5ItTMqdZ8ZsNeAjrO2EHUl4Lw1frsX1PXR+fplUFNCyd/Io6nTYDIfOaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=WkyY1K4n;
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB7C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=WkyY1K4n
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261116142353660f4a68440002077e
        for <linux-kernel@vger.kernel.org>;
        Mon, 16 Nov 2026 15:23:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EoaRfVjB+wiF8oKOlK4L7ySxFsN81xtIauFrg21540Q=;
 b=WkyY1K4nA4fnMTreG6yN44Wnr81nn+eCydr4/qctmmDy/L87HS2HlZ9ifD2SfJhs0C53E6
 T08sJC/0QGq47diHmVj75R0zyn0NsoNVs8f2NK0FhFvDPD/D9IVolYGwIt+fft40ASa5la9M
 Kx+mza9L4b/VMdfxW79jBo2Or57bymZqSBYxuxuBCSxr099c7eAndnLu4CBlxQ3yEYifwYsY
 4o8UfkxwX9S3HEz9lysf+xAl3jjoi3Bxzl89NHrgWYx3Mm4FSQfvPrKPqPJroJn7J4/oy01G
 +llpmNIeWUVDUDCnxG9b1ko4iIspAoXrMpNcGhg6cEfLd9K9djJ4DRbw==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: andi.shyti@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: baocheng.su@siemens.com,
	tobias.schaffner@siemens.com,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86/siemens: simatic-ipc: enable support for RW-548A
Date: Mon, 16 Nov 2026 15:23:51 +0100
Message-ID: <20261116142351.1228943-4-benedikt.niedermayr@siemens.com>
In-Reply-To: <20261116142351.1228943-1-benedikt.niedermayr@siemens.com>
References: <20261116142351.1228943-1-benedikt.niedermayr@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

This patch enables the platform detection of Siemens Simatic
RW-548A IPCs.

The nct6775 driver is used for hwmon support and needs to be loaded
during platform detection.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/platform/x86/siemens/simatic-ipc.c         | 3 +++
 include/linux/platform_data/x86/simatic-ipc-base.h | 2 ++
 include/linux/platform_data/x86/simatic-ipc.h      | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
index 8f99032897dd..2efaf9ac2be5 100644
--- a/drivers/platform/x86/siemens/simatic-ipc.c
+++ b/drivers/platform/x86/siemens/simatic-ipc.c
@@ -84,6 +84,9 @@ static struct {
 	{SIMATIC_IPC_IPCBX_59A,
 		SIMATIC_IPC_DEVICE_BX_59A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_BX_59A,
 		{ "i2c-nct6126", "nct6775", "adt7475", "emc1403", "w83627hf_wdt"  }},
+	{SIMATIC_IPC_IPCRW_548A,
+		SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_NONE,
+		{ "nct6775" }},
 };
 
 static int register_platform_devices(u32 station_id)
diff --git a/include/linux/platform_data/x86/simatic-ipc-base.h b/include/linux/platform_data/x86/simatic-ipc-base.h
index 2d7f7120ba6b..214a13d42ef2 100644
--- a/include/linux/platform_data/x86/simatic-ipc-base.h
+++ b/include/linux/platform_data/x86/simatic-ipc-base.h
@@ -23,6 +23,8 @@
 #define SIMATIC_IPC_DEVICE_BX_21A 6
 #define SIMATIC_IPC_DEVICE_BX_39A 7
 #define SIMATIC_IPC_DEVICE_BX_59A 8
+#define SIMATIC_IPC_DEVICE_RW_548A 9
+
 
 struct simatic_ipc_platform {
 	u8	devmode;
diff --git a/include/linux/platform_data/x86/simatic-ipc.h b/include/linux/platform_data/x86/simatic-ipc.h
index 8d8b3b919674..4cdcf865a7f1 100644
--- a/include/linux/platform_data/x86/simatic-ipc.h
+++ b/include/linux/platform_data/x86/simatic-ipc.h
@@ -38,6 +38,7 @@ enum simatic_ipc_station_ids {
 	SIMATIC_IPC_IPCBX_21A = 0x00001101,
 	SIMATIC_IPC_IPCBX_56A = 0x00001201,
 	SIMATIC_IPC_IPCBX_59A = 0x00001202,
+	SIMATIC_IPC_IPCRW_548A = 0x00001402,
 };
 
 static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
-- 
2.43.0

