Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039380;
	b=V7aA8cnkEqFj5gd5T9k6ohdADXDFbgF4qNkmt7oPD68ZlRf0bWXpxAGTQ/FBs0FeJr7h
	 FyUcWQRIp5KBTsbZ8MD7apqusoW0VWRYdS8oZ+gM6bf4KIwLDopqDkdcKj3kpkf3D3z5v
	 Aev+SyJmwtYozwEGsEkSml+dVa0Z9fG3Qgd6vfHX321nBNxHN7RxuSMnIiOzZs/cU/XLw
	 uca7/cYTA6d0Hmd4lVsfquLniebfQF8++/xPsd4KZcxafHhI+/cW1bTqmo6Vi8iPQi1TQ
	 7ToztnaAavvypWJHO4Jez+pNi4lQFMvH5oBVIH6AKV8KuYFeSmDtqyigb8BqR78gQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039380;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=hKQtTYanbfK+D39DMAVsJm5LX5nwb8v4A3ZTMWqb4WrgFp+038BtBuTZuJjaGcgYiLZX
	 d76MVTBK6tofJGEPiF2U55ABsXSUZFvnlYlfFmtgGIGc4VnKhqU5ywTZgM1IMN0J0X3Kx
	 vuIQztDxpRmLD83gMszY/A4Irt8G1OupAI1+XPa6huY5ymCevARBkSR8exfik2KYDtC2E
	 QvjWendowXo6xzBdtqT93n6l0KKedAPSpbwgct0C7I7Tqg4sOIUK5pWvA2tWBIDboxQJT
	 oeC8CmzZf0AbMrC93NhagPuiu4mGhI00lJ4s9vUQRVFRhxsBmE3PUsv37CVCDTtfd7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkWvrgmd;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96E60A262B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B96E60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkWvrgmd
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc502d509c0so988802a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039380; x=1793644180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=qdllYGKzjrC6EqQPTpw2uRciYC7mqvAkOumgeDxKHoHyWTAYntIqQPGLDRA2eJje2q
         pStmoxG+1n6l/F97ZKo0mo2qZz+xeWGSj2kVQ6LI7yparL1ItRYjVFYy30morFlQflE+
         ekKaGYFXYbBOAijoWQ4hAbxKnwV9SRqcxZT34OUc4pJJ7bV4QsCG7gISm+yUIDLq0iFB
         Td4QI23jYQ464t9N2qeH/W3IsNR0mVst0yMbM0kWdbTPJCV5cvCRtRHs7aoy5QezlpZq
         2yLwJ/ZLwOyW4B7GQYHRAfs2p+HyYPK2PliWTY1zlX9BWOS7InviDpxpW5c++1BOZ5+p
         xLzg==
X-Gm-Message-State: AFq9FYL0jSvk+HKrvzaFfXYUvzKrZQKSrWR0QrqviyHARVwXQZC/qPJE
	rZAaVsUfmg4yEIZ+ByY2/EhCZJfxGxGzpA9GfREafMlgXuk/hkXLRWukolNmaG0BbcR5R/6Yt3F
	BCOMrBBgysnzkUEGJgeyXLECJU3co0GGxoWApPbFcXp46rZTQ0GiLvsZLrTFxaQIbFLtO8STPdg
	j6NejiH1yMPniplihh6pehrTU/dkBxhNEk/ODq+iVzd8T20wHaodPrUrxz66klK+VMX7SpeN92R
	0eh3Q6w13WDpqrXPS3filFy
X-Gm-Gg: AYBFou01TIjHvwLXsA8WGwK0grirroztl+kKKG9cBznOG03Xc50ipSROQcshAnslIHs
	U+VlKjHrIAVzox+F0XSL6/LU0YiVdjs7u2rItUyhfu59gJUXkvcbaYEADWX7o9ZcZvDBXXpYtxr
	RQJotR2zThLub801UqMbLd9f9yncH0p+1Enx78VsRRVeRBUMSbdm8CIxSn1uOzTEn9dWkytoHeY
	gVsXWYoHk3I4iq6UGKo40iEnmcBogZ+s+LfI80kX/UpBNiKbfFUYkaY4YkZ4dxqWimyxEXvGIPX
	Up5h8m3hm4YRnaD1ETjbcMzs5W0HMDxaOAlZS0hYwPqRv9iyMtiS3yPIePBqiySt4VMOSNyfjbP
	jDs25B6QC/4ytxg7EfmmzC7iureOHI0+MRcuMBK/ZVnXYv/xVc4xqQLf2i604Ipg6elNZUvNJMC
	bJZ8fzokC1lgibOglgeXHp0Zaq3h4ZltokPzF+RB9n
X-Received: by 2002:a17:90b:4e83:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ade9b2cf01mr6186249a91.6.1793039379887;
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f13ecsm262604a91.4.2026.10.26.11.29.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so4801768eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039377; x=1793644177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=WkWvrgmdvdVuovyLoQ3QJgYuz1ZkJj9eQ56bDBXGJlNmvDc5/db+VnWwVBgraYA3BX
         5NqUKfVwLYOR5Uq5CWryYRJgPNXZ2AIdqgoaHz2WDjt3tA3B6N4nzczbwzWlzxEZFunG
         U6FMoXcAUqSPRCdf0kOkcjTd9hVjcAYxjwkvM=
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413483eec.32.1793039377071;
        Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413439eec.32.1793039376159;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
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
Subject: [PATCH v2 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:56 -0700
Message-ID: <20261026182856.3168686-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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

