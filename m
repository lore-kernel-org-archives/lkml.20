Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426285;
	b=Yo4hDYlShI/kpnXk0YrFGop1AXbCu1vmvH4g/xmAGVGVrr1oGD3pavqnAgzniHGt75xc
	 bJHvrYSFaQkYsWe/6VwjyHffXRbf6Cri2OD7jiDZr7xFLGPaeag2UZ3hK5udVewfQEgjK
	 XAp3PRcxPVpElYhzltUBWhCxBpKmLdUROFM44ztsBolcoZieS1iJuXCoTOxT+aPjd0Jqn
	 xH9xtPf8KsJ4FZ514CvUOLk/qYz6DAV3XNHaRLQk56FtDV0OBmNjSkt6SVaIGqOUc4Jck
	 ermbibBszsU9qbqCbPL6FrHCEQwpvf3BhKw4uJoAsXBD83+kgbeQFwzsXuBvU2QLXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426285;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
	b=J8uns2GxnFmEtXf2Hru7EiUs6Is8i2FgZLC1O6FIal9RHLGbhs2U949oW6OfB8htTP6r
	 828QCsGeT6ap4VXLWB3iLYUpaV8LPqKDDbcpGWBuA252Aj43gETKEvLUk4P4rBJzvbc+n
	 XppV1Wy7uWTpu8RPf1pBq5vCVDZrffNx7xPdQsQccB4Dg0LWH7QTGt6k12BdsyOed0I95
	 Lgzlwx8toqECAI2xDLuPaEcXO8JQixwRIMBAwpTc5imgZyWRdcgDUHdB0r4YM1T+PoOKW
	 Y4K23dxJCbxKXGRwtcjnQoagYhPn7w9vV55mpDM9Rjuu1o+gaKK3MWJ/LAWEbo+WKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SqWRsp7M;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0D606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C0D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SqWRsp7M
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ed06b725fdso1438115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426284; x=1795031084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
        b=D+nvEcFmXmQoTuiDeyZlg7a9WW3a9+RscLx8rXdz2RxLrPmGYseijK9QRdwB0onj2i
         frk6ZwzFk+hPD1U04kicJu5Kq2u3MFHtGzYf9sBOJFZgRKxla+/zwwuAYiMCKzr0bSzh
         puS5E008QFoQ9MzmOviUe9Szx9fWmYbqqJHmGNfaBARsscrLUoXSnxyUMeuOTvYvmR7e
         nx3LCNBO7riibLy/sq2P5ZiTxHzlSVuqvB70Z311f5B1U2llxzdXTxjD0xLm00+eW5My
         KgTeuugUF+1elOTwZDt5nt30FUGecHcz+ScNOFuWL2Bku9yHu1atuOLarJr3Ra6sTXHn
         qS3Q==
X-Forwarded-Encrypted: i=1; AL+hErE9aXc+mMVQfMgGnLw/NfNMOXTxMs0x3ZnLtbYSEea5o63ksd0UEH201ioaGBPc8bH9q1KhLQKP+QNVTGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DG3j1QfqBBu8+Mlxw6egW5E5KXxwqgxYm8qS0jvfbfl8MFEnQ
	WlIKafni9/68M3PpFW9mrr3dDv0SgskpyDo8cM45ex71N08IDGj4AbMXmvbXcFzMrFcUKcSFtVA
	n/GAd8myKvNGlN9M2f3ReJvU4p6XauHUmdyXP9LRlFMcmjY+OyC+Tw6ze2AJvkJDu6r6Yflj7Bs
	AVqKdB5ubwE244JOi6vT8cG1OlgVmQryM6uxemQilnNaILyeCDQCav0v5Y7sYmKlVVX3usIls8o
	3wr0yIKVl85OwGO
X-Gm-Gg: AYBFou3W5E0SpiZoNNFg5Fgc4Jet1KAnEYAq3Vt4Urt1m9yuY4rbf5YyvTECfkwGYki
	lRgTWc6Ue9+w2ZVh3NQLFSSpDV+dIrbH78pXKStcSXuCtUWcADlhwjxbnnRG/jyX/N+fuGuigoU
	R/WK4Or2UCjMh7Ih6yYpHgaWm/DVFXaRhd70P6cFmvrVqkve+asxd6R4utwklJsqIamKUTdzVDi
	iG1mljg8B4uQucvKNhUeppRszfJATraBy69NCJnuWTjV/MqPFaDv7/Rv7R7TGCKu7SS+NPaEWDo
	tzibFPa6mntvacYOoFcnAkpje6sfIftwKT2AuIX5/fyIg9iSF05UTbHHYZyCd7NQqwDAp/FSZqv
	Wx+ycZ40L3+8JFMJUOEmiHkw8QOxGsUDSpImRYg4tIyanAmABHgR6HybSr4399RQI27Nb+TJjYt
	f1nFXwdnCfVsbYH+nDB7FqY5jhHMgjjNkd
X-Received: by 2002:a17:90b:5785:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b197caa72dmr269665a91.25.1794426284385;
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c4ee96sm255461a91.6.2026.11.11.11.44.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so96589eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426282; x=1795031082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
        b=SqWRsp7MaMdHWnk7sLziaHk33Lv/GcBK/g7nvA9anoUqe7Bk5umaiY1KiAQjvt8u5E
         B6GHdrKED7JkWzAbpNKnounKd5PWu7BK8oLinnQv+FOpRckP0ZK9WjeSbJNKP002XmBZ
         isrZA+sXn6y4qtZjqotQUZ2kide1UuDJ7VyQc=
X-Forwarded-Encrypted: i=1; AL+hErEyiWLVDtJNuO4dxeeImOZUGgeNTe6ztiO1p4uQyiALx2UB1TsJqwj92DRPdxMmoq5cCIEqw4Blhl/u9x8=@vger.kernel.org
X-Received: by 2002:a05:7301:d183:b0:371:32df:5ee2 with SMTP id 5a478bee46e88-377e15f0744mr486473eec.16.1794426282162;
        Wed, 11 Nov 2026 11:44:42 -0800 (PST)
X-Received: by 2002:a05:7301:d183:b0:371:32df:5ee2 with SMTP id 5a478bee46e88-377e15f0744mr486429eec.16.1794426281449;
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:40 -0800 (PST)
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
Subject: [PATCH v12 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Wed, 11 Nov 2026 14:44:23 -0500
Message-Id: <20261111194426.1652644-4-kamal.dasu@broadcom.com>
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
 
