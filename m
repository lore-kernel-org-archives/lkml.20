Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383879;
	b=qJG2mM8fQpvsMTmy1utObRIIHHHlpvZ5fosI0q22lcy/87/e1Oyasbjk1ozhFTqUhTSc
	 G+xC43KEm2pLnayvFoG/GUPof/ONhCN4GXHMIZgsq7AWb6tMQYBP/CfPSYSP6wxlh6+XR
	 /KBXLz3R/M4r621dfw0cU56cUOdDVfsN5UOpRZ2MmehH0EmpzLylCGO406IiQhucFNzNJ
	 yejw/XpwSDtJ3UxB59MewTkbxKInlJjnstfw4Db1tzKimknqrlnUpjUGAVxtWOQ/LmH8u
	 DlyUxedxIqpheWqEP62j91nxMb1miOoiYvSBqXDpQ9yatouWQJ9fGHz5C4W0g3VZ+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383879;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
	b=Y78WXsmCwYamMaHzXILQ49+pKSt2QWLR2N3gmUmR3ZkvJMdqiEJGcbBEPcNemib9dcgh
	 jLoN2v2MYrwILV45fOOo1Kec/Wth8zW3RpIJZPomdDqGBKGRiT8tTAQagOBx9EagbL1XM
	 C5dWHCQkbUulEEmOqGyt2rakrbFrn2912lZGvyXmR4Zb97rz2EKot+daOHCHQiejRo+QB
	 ocumXv0irVKrxBoKXA8KFMpLpQVAphya0ISqcCogae3nL1oCMPGSFDBaud2YGC8eyGCVe
	 gY0CRuHqGSoO/5YxXw3/DLl65WSfljL5Qhi8hqcCmzpeiPRPf2rsBgzTRo3tvqZlZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+lUk9S5;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B9606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+lUk9S5
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1467364a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383878; x=1793988678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
        b=nRMM9ooOoABhY13QnwzpwdwQh8OJayAcdPoh9DP4QNJCCO3obiS8JV+QC59GWquh38
         YB2XLOGrYvHfGVwspz6Czjo/Lx7q+Tz2SkK3jQOMHneDlKqft/kl0GF55GMI5pMrOrRX
         ZhSjYpGlT+V7h73a8+wbI2FQ1SmdhJOZXzgs9Y+OExxyVXZqnxrdn1mC9MROtSHXoZVB
         8k56Lh4/wj4TBxly7iYi9BuTdz9s3c+M9/Si3MgbQwnSpFYNgg8XLY2ogGaUDlALbtNq
         ibhtsUeuuMkYTeLyUTA7S6jnZ4pY6CvpbVs3xyUsTfXtfLbOdaustRYfkbu3spoJW4NL
         1qVA==
X-Forwarded-Encrypted: i=1; AKwUvBx5pPxop3J/TcXIItXpNPkZ0L/Y04aqxvU4Iq083ix6HY8i/qdoV3Xe1Nr8D5gkVXuM+BnkOsuehWYtTtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBNPurWzD0RAMzpYL3Xnq/JE2oZ47dcKuKLsRgf/ubeFHdShPO
	bLbcNy3ZLEsuDxI3w/8N0ucIcDvxdoYT5OapPE8Wf3wQKE5Z4QBKX9UNFN25TwrM9iIUmNbcBkv
	eZhMxQYymkct6YwhHOwC2I6OKCIl4OIm0OWlZn+bhOMpHa8qYYyOyt4o/bxEax0cyDkgxOBvJdH
	bU/xAmcAbJYOmqfQYG6jK0xaV3In+XbHhEFMZu+t4FMSvIe5Z4GdEbjnvdhmSv6UUJDmqWFSI3Y
	qlYLBPqpCXQv2VB
X-Gm-Gg: AYBFou1cpfcJ8ZFsEcm3BNghhdnKIIZLt4EM3DHeVOV44nOJqQReRBIcvZKvWm5rrn+
	REybPvzbDTfMpXbgO8NgpZVRrr1D3BrneaS5sFH+WJgp3YNLupxh1OSHbw7wJ/eZ2PSkJ0LCFW3
	EuUzGFFbBI4NWBrN4ohBlztqMDzbhrLYGXn0/Ck7VfIkBjVv/wQZ6sjIioI57XwXObyTm32WaTi
	RiEcNQY9kYJoXgzKKCTvkm5WoMHJNdaGTiXmLyUnfToyBpdgHuFJgIPa02qWggvPKbVv2YI+yLN
	uNYR+CaPKtcScS7+yJ4Bqh1E2Fne4UAOgMst2PbkeHJglRb1f3VOVCZu4EGqTZmh7/SCoqr+6/b
	iN2cAkY1MwojvGGi7whcMK67eiHpsfY24iw9mPlNzWw73Y9MDqYzAgUMPS53BMWbRgobWc+TJLP
	hfpIqFc/ZEonAjwjgvo8mSBzSQ878RShy+
X-Received: by 2002:a17:90b:1d03:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ae8984de33mr2635453a91.60.1793383878088;
        Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85eb5999sm741736a91.1.2026.10.30.11.11.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18eb2616974so3039514c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383876; x=1793988676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
        b=Y+lUk9S52GpgSqkFxmpOfwNnhOpqBRdpXpu1/8vLyKaJGY07IortaOe0UY4bTFVUq5
         Bm3LbOqSgh+5UyjNsRbMx/sQIGHPm1rou/dSCabXxtaffBO2XI8WpeRc8e1720IiSvNP
         aFKWSqGxxcJrjWQ8gTm4FXYTQEf9/dsH6bAkY=
X-Forwarded-Encrypted: i=1; AKwUvBytUfkM86y/T8fBTipYNiJa+XJPsFubvQnS+ikOcy3pntEnB+yTTyqQBiw5FWO7oyr2/xpvJSdix/Ac9KQ=@vger.kernel.org
X-Received: by 2002:a05:701b:2910:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1ac5a0b4358mr3869604c88.16.1793383873730;
        Fri, 30 Oct 2026 11:11:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2910:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1ac5a0b4358mr3869550c88.16.1793383872956;
        Fri, 30 Oct 2026 11:11:12 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:12 -0700 (PDT)
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
Subject: [PATCH v11 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Fri, 30 Oct 2026 14:10:30 -0400
Message-Id: <20261030181034.3811225-4-kamal.dasu@broadcom.com>
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

The DT property keep-power-in-suspend, allows us to specify whether the
platform is capable of keeping the power to the card during system suspend.
Up until now, this has been restricted to be used for SDIO cards only, but
let's add the initial support to allow this for eMMC too.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index a02b04938e1a..c936272bcd81 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -38,6 +38,7 @@ enum mmc_poweroff_type {
 	MMC_POWEROFF_SHUTDOWN,
 	MMC_POWEROFF_UNDERVOLTAGE,
 	MMC_POWEROFF_UNBIND,
+	MMC_NO_POWEROFF_SUSPEND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
+		if (host->retune_period) {
+			mmc_retune_timer_stop(host);
+			mmc_retune_needed(host);
+		}
+		mmc_card_set_suspended(host->card);
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2193,9 +2203,15 @@ static void mmc_remove(struct mmc_host *host)
  */
 static int mmc_suspend(struct mmc_host *host)
 {
+	enum mmc_poweroff_type pm_type = MMC_POWEROFF_SUSPEND;
 	int err;
 
-	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_resume(&host->card->dev);
+		pm_type = MMC_NO_POWEROFF_SUSPEND;
+	}
+
+	err = _mmc_suspend(host, pm_type);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2260,7 +2276,13 @@ static int mmc_shutdown(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_set_active(&host->card->dev);
+		mmc_card_clr_suspended(host->card);
+	}
+
 	pm_runtime_enable(&host->card->dev);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
 
-- 
2.34.1

