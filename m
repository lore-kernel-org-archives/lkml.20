Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426287;
	b=mrexcpBKfMccseasYqlAozlYiirmvPtI5KUPo/oLPjpLjLSbaRwxBUbmdRhM6v/2VRJx
	 4kehGlXuZWFgyU/eUnIuzwh1EW+TDaz+itj991XfE/1qBPpSbQOeAP+Lgr3PQgNNVtasQ
	 sksxUf93jfeSOtQ+B1ru4Z2cxYh0mgJBCoJCK0HTp4fSiR1OUVB95w7HA4GoTp/xgGzHC
	 TP1b65VUGYi39Zmk2gKQd99FuwgJG/lZu5JezNKAxnu+SFU77gJo3aBSvuUTqHgOuxJ0d
	 MJe4RkuR8jNl+ou7kKS+u1hGfokimeUOZ6lALSm0Hriqd/dHUw5r8mk2JUNb3rXSfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426287;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
	b=VPJW8/EwC1og5/8aGxHTfYuFF10IYeUywvtN4SGGz61D31pHG8iy8OCNY0xMDWU8wOQY
	 qrYRQl6EzwX48ab6JLy0sH5swRnRtlM5Yyh5IS0yGMSqXHyi63YWrBtvRWooqFDl6p0ZC
	 dt5y3UW6zKU68FFBry8+UnpK2pl9Xy2OWD2nPryizufQyBH0bkk2ke8DL1CUYOTD/xXOX
	 Xweo2tHZW/yhwdS3fyPpeWPB9Z5Z2dI++pQKAHh6j3rO8kNYNecD5FmlBCyBbQBmUJdCZ
	 k3whgBmXD7IioC1WQRaDdsyNPEEyW1BaNlTlZoc7+j3IoC1gqr/K1nqy3uhflWLhHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UZkPfKGu;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44D606A8B4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F44D606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UZkPfKGu
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1813784a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426287; x=1795031087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=QiHV65VeCo+2m4v/NKJZPgad1wy4vbl2QBKBKyOaK476G96Pp/Qzgl3TZ6qdCUwsC1
         p8LYsc8FKHJCr2/EjH3dmvZtKqBhihduN5cB7lQBVep7Ajv2aZSFkpk+ikuKJahM58Ib
         RCWG7/Fn1by48Wfc1B+ykaVnoBTzVSAClwA6mOvbywDASFzUixA8tXbikya6HmL9aam6
         t4xz1H42v3mAozw66pEMqKcmwFsPopPFU825JD17vh22+XGgXQJs2MOedwILMHCzwBlw
         hlZrhYZn3ykuLci6jBzkOENlKAABx5N4wg5XUn7O5FWNFFb/7Q96qo7y7Mhw+QdhWVt7
         /p8A==
X-Forwarded-Encrypted: i=1; AL+hErF5bYYV/QBZ3NS+txxez1ucCU2qrZ86LIacckSZj6X2R6Ab31fe4UnfCC+hwN7lFyIDwA8Q8F6UTcZnC2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3aK8Y2cp74Vnhq6/Zz4UlOOEGeGbolxl1oJLTs4SSsB2WTnFu
	VMaHLaYAKcdv1PIbgmyzyCH43ADFj7/NucuhuG+no5hSMV0LEij/9+It3xtiPB4Y4N7PhGGIWNl
	/Br9fkG/R0iiRecwmHdpqpsHh+JIZEyxQoF/tJ8phAvUE9OsaQxal2XcYqOkByv37nVp73Y9UWF
	8eYTub4czt3ZKoo6S3R78Pj0gNIoAzkEN2shgydRFuAvfgGXhJwEXcbdUVzMj9TUykIcEPj5rON
	xzGrfr5szYigZ5T
X-Gm-Gg: AYBFou2tgrRJ9CO+3gHZU6s/GUfO2l9zbSFCEOUDx6FXFKVcVV+ukEzs8++069+7lEh
	/3P8uFXfcpjdUucf1G0NrsvkFxLj65qyjhOxTlcE5lYvrraNxghij5hNuWX/QZM2WGknGGuKsJW
	B10svYEdViIy66x5rqe74F9whNBVSd8h0PC6dAfKTRD1YBnVVJKtxvK9cqj4PbafoUlCLPCz6/S
	xQuKuvGQh+vmVuHx+3JdxFumRCk+1qm4Tsw4o30rXD7MxKkxT6Jbr9NtUAmtfbymoxajB9W7jtC
	TF3shJNX8xSNR2+eR9y7IDj5eszjU7P8cIfPeQZMqfTA4Z8s5I+fTOVUC1IeMPQ6uNvnj8qFkTY
	MMOmhWkxI7ktS+poRcWtEG7nA7H/c9FxzQJwBYZDDh3ETVn5LZf1Sk8zhH8fBkG3wWU2agk/z1t
	F5TCmEPzsf4ZnAv5m0Aje5G6XSyiyqAdw2
X-Received: by 2002:a17:90b:1d0c:b0:3b0:d77f:9e7 with SMTP id 98e67ed59e1d1-3b182e6f80fmr3119531a91.18.1794426286825;
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c34a14sm285078a91.3.2026.11.11.11.44.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so6952066eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426285; x=1795031085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=UZkPfKGuAF9BGRlxMTV+L6PI1sKR61LRtXcPSu8flR/Jvm3MDS568MH4MQPTcrJgd/
         /+ekArU0IDsRPF62EW2vrx7HwOKRT8Mi+CqcwUln5AoDiJwmKfG7IUZqJUAa4HL2S83G
         AYKkyfNkhHYNIrnaIU1me0nFrqgXQfzgQSu90=
X-Forwarded-Encrypted: i=1; AL+hErGcBR0+HvkhToErZg3xkJPBWYO0h4E2zfaaGveSoa8C08apVEwT+VYLI3WbCUUftIpAy+mHcxLyK4MSFqI=@vger.kernel.org
X-Received: by 2002:a05:7300:51d3:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3768385dbcemr4144910eec.4.1794426285029;
        Wed, 11 Nov 2026 11:44:45 -0800 (PST)
X-Received: by 2002:a05:7300:51d3:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3768385dbcemr4144865eec.4.1794426284141;
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:43 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v12 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Wed, 11 Nov 2026 14:44:24 -0500
Message-Id: <20261111194426.1652644-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
allowing the second part of it to be used as an internal function for the
core.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/core.c    | 10 ++++++++++
 drivers/mmc/core/core.h    |  1 +
 drivers/mmc/core/sdio_io.c |  7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 677e445dc48c..6cbb5ee6200c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1422,6 +1422,16 @@ int mmc_handle_undervoltage(struct mmc_host *host)
 	return host->bus_ops->handle_undervoltage(host);
 }
 
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
+{
+	if (flags & ~host->pm_caps)
+		return -EINVAL;
+
+	/* function suspend methods are serialized, hence no lock needed */
+	host->pm_flags |= flags;
+	return 0;
+}
+
 /*
  * Assign a mmc bus handler to a host. Only one bus handler may control a
  * host at any given time.
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 9be2875608ce..d3a2ff00b18f 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
 void mmc_regulator_register_undervoltage_notifier(struct mmc_host *host);
 void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *host);
 void mmc_undervoltage_workfn(struct work_struct *work);
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
 
 static inline void mmc_delay(unsigned int ms)
 {
diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
index 12716ec0e35d..99f857514b63 100644
--- a/drivers/mmc/core/sdio_io.c
+++ b/drivers/mmc/core/sdio_io.c
@@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func, mmc_pm_flag_t flags)
 
 	host = func->card->host;
 
-	if (flags & ~host->pm_caps)
-		return -EINVAL;
-
-	/* function suspend methods are serialized, hence no lock needed */
-	host->pm_flags |= flags;
-	return 0;
+	return mmc_set_host_pm_flags(host, flags);
 }
 EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
 
