Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309144;
	b=vkS2CfhAAauHxYy1FMaLBtLwVLb6qee6GUuLoZ9hIzEQDJgB0PdL2/qF2GVKvGju0BAp
	 OmyE+AASTv9IGAG26dmlV3CYxM4xVrWVeEo5upfXDmPWuqVUh3o5YDjHCopWnlHlRplwH
	 Z7Y7gMScGjZnnjyjf9NWqYEstxdPkOx9J3I48F2nNnvMCyLbpxGMXnLPI306JR2GFYam4
	 OZsnSkvaPvHfx9EFlyMlUMkmnSqLoz5MYKtjzouldxvyA0Knak6u7rH4QftbRhn+7m4FR
	 BKk0uSciO907aUQbduBQm3lF6ihS1bW8lg+5O/IqoRPWZY2OjLzxyga3U1SiWmSa6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=it0tvPZb8Lv53LqDj9fLrJs187jv4ZTwj6g78NO6cs1mRi7xVF1FESyS/mKDknGs4Mgz
	 dukIHz3xEboBvVc4LtkMBttQLe62+rxrtVickYPidygTdBdv4KAbnbgt4kXq2Gj411Pxx
	 yF17/7UYtx48Glqv4Fm2tJYzz9Uqg5aDKEVDyr2Ny9zbPVFUlFghKngxaKBCR2PLKTTNA
	 hWHqtEOvacAYpx2O4Sid233Yb2kBhCExx3UZl0mdLdv2NV81eTuLn47xQByyxMrwtqo7j
	 j/jwu6vBzHWnsG8ZWEfR46FmSTCMKI17C58i8qIKt0l5IRi2ROv++r5R3V5+NjwllzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rs2bK4nk;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB0606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FB0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rs2bK4nk
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so32651a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309143; x=1793913943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=Mfok7BRu4ExHxK3KxOtHWw57i0icJwoShjwjr8m8Lnym7DNs5ocTXDG5FxoIBEWwoy
         RsVjz3SUrX0HPUFwBZgp+AXHOetm995PIVe4MV4dbUxwGCrwxj+r5P5DYIxXQgBM1C8r
         zIpwP4dUb6e5/NrNS/1h5BFFyn0GPb/FyDCf+FkimLbBXZgSQmC384e+9i2u4fUTV6D8
         G0NiSFhbCSrC/giPdxqSkxNXHmidf/GNcDzPtcW1w1npKatmbzSn81mNFYNXJjbSe+E7
         Ul2CKXfZnJ6UOaAkuWbpsLv6IITw6j1lNfK+VkZGDlGsqcXyk/Jgh+773tkuUfuoIenu
         1+gQ==
X-Gm-Message-State: AFq9FYJfkgYEfX59jGt3GXbOKYJcYENa6vYBYP3KZ7vgZN4TmheYzZ3V
	5skk8dpHcgas4DfebRnxRHTrpFX9plcBym7pPaC/MieGpgnjcITwIoSH3FQqLVOW3BW/koT5i9R
	M6JQk6ZK9KreMR9QegGSaW0V5IzfOaQuM+BWdWycV0zMThuFaaNlterwghB8nQ///mL/7Km2SeI
	737gqd2jnMXKxMnHI2MbkK0AiLXlq5q5GukNM67HF1/4TuppOffvvV6nw3odYqgLb1lLk/akt9i
	kH3kHv1wgPj/FjdL9lw7VYcCKE=
X-Gm-Gg: AYBFou183gUIBP/FU8XVqnr7dF4Z8LMCFDqDWcnEItZoC46BZsbs/dnYYdKPBH5m7ns
	2OyoD5BtSXTTlzNbBHbpCYVpHXAxkdixoz5j2XREdNKHMrKeNR5WDi6tr2UW50ArskW/b35mx1l
	TtmDaHu1AxRd1260Rg7NyRq+yYPgmcO4Hf8mdnIqyfpdlIkJAkhRJmQl61AJrsVVKJTyBUdlvAy
	5BgzQ3mWiP2TL2d//stL+Vvial4Afu8wfcW5oyLfkzcSr4WNgsU/I/TFUEOEiJ75YICTuWjX6LI
	D249HlPB7nCfx4x3L7xCA25MlJKgz4AycMuhqCJeisDt6J+8bgTVkfAZjpjmaDx2GnaMbzQfA9e
	15nIWPE5uUwaVDjgAwzWbrDOkVVqWFFMqoumMaQvPgk4QHol5qmDFQhnDl+HBg1KGbFpnwglAY7
	l/yxBqAxDr8jf2CuZWkfUSmf6QExMI6aNUVgDFR45Q
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr170852a91.16.1793309142917;
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae845878b5sm646935a91.4.2026.10.29.14.25.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5339739b343so56031061cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309141; x=1793913941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=Rs2bK4nkBOivnc52MHFqCl1oW9Lha/BFHMGDBU/VMkaLsFOcAS5QQzdQwc4x/CTH9D
         upkYTM+uNILLD+eGTWWMIm0I1s/60qZ538/h1SE5TxsKbE7G4PftioJKnsEXnd3Ctl/G
         ZcV6iLeiYXWdGpYBAWrKbMTsiH/V42F+C6PHU=
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5567461cf.27.1793309141504;
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5566901cf.27.1793309140847;
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:13 -0700
Message-ID: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
remain enabled, but the disabled controller leaves the eSATA ports
unavailable.

With explicit IDM clock/reset setup and the corrected shared PHY
register aperture in place, enable the controller on BCM958625HR.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 53acae385822..f6717ca76aef 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -184,6 +184,7 @@ partition@700000 {
 
 &sata {
 	/delete-property/ dma-coherent;
+	status = "okay";
 };
 
 &sata_phy0 {
-- 
2.53.0

