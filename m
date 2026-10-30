Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383881;
	b=IINxqmrR3rqF9GNUo+vtyijC9S38djmn9unEBXs90PxhYytzHY0foKe3v8j1Yf5hZQ6f
	 WaiLisEffG6TL9uSD4ThJYWKKkoW24F4OV3xu7tmueqy+vl99/1/pJIbt+6IHw2T2uYmv
	 SyOuDZNvCWnQtYwU9hY2oGVX14WbCyS5z60vwApwAv2dbHMP7AfcLbr771eBAyHBfZw5H
	 JWBQkDzUFi7dj7OmdszESAkpZ96FBcUXGvnLqUxAwN01LfJ1ipmrEofGhpe26pPFAADw5
	 +HVa2TuJd956Ux8RbWkeDv8W1MN/RmJHD1skwOm7E8Oi5xQZ2mZPZyHoiz5cgUgguCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383881;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
	b=37vwUPkXiRrGyhbZUpiNSPcl07MgtBKJtLVLkO8jeC5k8MosE2Ef4xU+hk38M3YPwiL5
	 +rjN4Vy4INXT5jor94FZjni0r6svUiUdbxC89QBXMp+BkS/CLklG+nuzduvycY4ku5zje
	 r0eJiEav1aC9zosLnwCCPue3pBRW3xQr0mLZDIeJIWCjIORTglirgjFxWGgP240/at4pm
	 1ZV0adGspgqEdFMD/FXztxTthkWX69ctdQmypVhfokdNIzAXUbEYOQegR7WcvGfeSsCwj
	 FohtKU9T+rXdbO6Wg1eAuIFBHQ+ch9LM2FLlUAM69GABd5WtW6qkeJ+lCwN1CThCeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f1xbbqKr;
	arc=none smtp.remote-ip=74.125.82.99
Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1031606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1031606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f1xbbqKr
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so575291c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383880; x=1793988680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
        b=zOFT5usyw8L0OxKaSdqy4rohyMmKJfJmq2mYGD8VUvHDMDHJnaVWhLDeC7Gyndi2iH
         lkvg/2a82X3+IPd1dj24qch5WGMnP/0Cir5j5iioWzlyQUwlU8wBrzw8JwtM3GvPOZr0
         BRPBpQdMSS65AHGKdkAEmvbRmPea3l6tOHdyHnZTgR7hCfh1NTFaZXyxorACRTZ2PTm6
         OqkDW2aZzYhmdUOHzO17VNCzfbbGDl34nvH1UH9PcLHQxjSkuZUwh6ImVrJNwVHV3EDG
         pOm1OXKlDwxEjdtB1d2Mt0YyYxj19le5OtZCTc3ovaXdH2C2De62t9h/6ofcUu9I+DpB
         cFHA==
X-Forwarded-Encrypted: i=1; AKwUvBxROhJMApIQn0hRRDHlkRRPgooW1GYXKXaJlb/8rXqm+3VdwUshVvKNQ2gaHcCTdjImKgQNGh69+Okx1yI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMxLSMCaHxD4IUeQOOt+fA2jbRBvRNPysF3vNNYBe+APVwkzRm
	LDMmSkeCFCKjGH+0M0IaTMw5SEHem7HVmy+Jp0ie7OQ9hlzSOiW+HtZYfTDBVCCpX8VzDVl99fr
	ELn9H07ExpFsv86aB7zoT4c5ANc6qXSFdeLSE05q+ANdQPTLS72xFMRiZyD6n1AQ+MWK3nVYK9R
	nXegaXF0KfJsT0/0tfl7D9VAVEsidBoRVPZ1waQbtcMpBp/QbfkFwjpT44tqrVB7cu7Oa8os6c7
	D7bHoMeEK5QhC4G
X-Gm-Gg: AYBFou2szRLNMrF5a6wqBHUB6T35i+47cAS1zka2NjdFUrfbLii0alTsY9RAFB10VzZ
	fP67LTkE2fgM19jXQYoxtLvY9s9oLj+1JjZN/ZvUkr4YOqeNZVAO3kpWD8M6Ks0sr5hHy5e5/xr
	G4AKPmdijtzyQTKRfqo9CXOky6Fhe5th30v2i/HMBQ51a3zp3iXP2E+bSfeVY9NwLUA9mJ0XAmU
	9QaWqgOPo/7RPC6M90b0H9dmXdfO0usJK0jC2l02SaeAo8dJrCBDDJ7qVVAghXa1vDhgcCRrbgz
	qMk//k3VfTJ+02vFw+lipBgA6M75bdKgSoPxzxDsTuLAEWFRtXLrhwqQI6P6YTKpkotBXfI0wPJ
	8D35HlRn4yrdIhcqGrdgEmK4BXkrQXNPDGIZk7j6HLiLcIK5RgulHlwTx6fbhRlGleYHaqdTpyq
	0dykZEB9Yxf2UL19uy2D3P52eENKQ/fyz6
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr4142313c88.13.1793383879463;
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1ac1969eab2sm59699c88.10.2026.10.30.11.11.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-156b5338d4bso487020c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383878; x=1793988678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
        b=f1xbbqKrzozmHU/o50WWafFcelqr71majZcEtQY8OBGXLUIQLd/wNgDZlB9xZ1ump9
         NLzQQhGkg58b809MQ5EkxYv6AwxiXF4QY44LL5zm02t+lgB15yQbzjmSATDHTgUKSotJ
         MWQq134951FSrzbh9ij4abDoenkhn+MmM15Xk=
X-Forwarded-Encrypted: i=1; AKwUvByLQMJx/8Y65BusQAfa4d2nRsba8hJ6TMLLCImsIEdhlA8v36hWb/9FraZz3d+o90ZAwZ/SPyJhcAb+8Dc=@vger.kernel.org
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr3766304c88.47.1793383876122;
        Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr3766262c88.47.1793383875256;
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:14 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v11 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Fri, 30 Oct 2026 14:10:31 -0400
Message-Id: <20261030181034.3811225-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
 
-- 
2.34.1

