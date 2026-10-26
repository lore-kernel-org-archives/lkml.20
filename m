Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039377;
	b=03g7q3JLcvy5c+JI3mnymBH2KikWWEdhi8JonTpAfvBDY8ArPI3W1+xTPc4PlslVigbn
	 rkpDR2oC/J5S4KwzU4Ucq5/svG+ivhbDKNYrlWxuKBRLZERSVF9ld+7ujyrKRB2YEHGbu
	 Yame+XqTXxlwPHFfYduFusyH3i847m7+s/yPenPttLvZnMKbSx5q40uUYqQzHwpy9VFIo
	 qlYi4kma0Rd6SSsQseEet9laj61azr7HHSR5/gy9JeI6hufCF4d6RraQeHbSKAbTE+MWV
	 7coi+hOHL0UM2FXas+Jb0gK/mwjQ8nUkUT2MSjEkYJ7PqCloteypej+eJrpMz/b+10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=3o3ch1i40pY4MU7f8SuEF5muPq3+UXjGFJ/rbgnkDf/5O6sdm4MGH4YG35/CVBmaJw4e
	 DmenMd2hrGcSnSE7lK5WT3ADtXRoiqOH5TVeYqB+8FWTaXmRLV6R5vRG2itkECf42MXuY
	 i1Pw+EF4rMzkD4fUxtnAQTG6eOOW7Un5NGs0uQWkf5/L8tISJdZM1A63R1F9eNq2q0nU+
	 fHyx1KycPic0ht5e+9hOkvcdoL+9ivf3xspF5wbOzJlE11RKGJsun+Ezy1CBmo9vm8wIa
	 J3bGigmSbZ1HzBKDlDM3+YSB+aBGxdv2k/5utaZfeWNXE0iLPy8SrYm7rZXEKJc1RVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z5Qc5eoF;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73060A260B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E73060A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z5Qc5eoF
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1771388a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039377; x=1793644177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=tKkwmqAK6JcRf1eo/7DlTO2BhviaQWbOFIEFAkpdJfxscS/Oya2gYme2NOh9HVtcu7
         hubOvCvFkTEfDazupydR2NM8eynka7yo1WVeEfH/Q9BGeE0/m8oxscxnz0B7OsKu29ys
         L/37jfW/iZ+4YZ+TflC8ucOWlliavWlLzHKUXilk+8mQA7eAvhLVmXSGszfZVa9cGPQZ
         yM/l+L4ro1nGxnLrcoO07W7AGVoVN3d1Kf8N8MAzpPCijEEjQd8odiq1mkna5YJ1qm/3
         TvxwoRoYHdIxpiIiW/weRAuXIb3vsUR6e8hQepEk4w2XBN5UIMGe7+B0wIcwx4TkvvIb
         ktwA==
X-Gm-Message-State: AFq9FYKY4naxuDyu2q//sAQpLb1vHJufzXqsH8uyv7DpHplepL/Z0+C7
	Ie9EK/T4G2TrSCjyOU7oDR5Mn84FbSkXhDZ6nnf+3m15JD2wCppSRwYDSKEoHgjhPy/OwxN69dN
	BaaO/tmAyJ/KS6mtLSBBWPm7gcN2YhTB4fI/TxoeyIQVYVM5hxM4qTpmx9biBz3y6qnV1Pqw/Sz
	1CKEGnumuL7ddRyFXdZRmFb6duPalZJ8FlGpC5R2R96Y2QNWJDluzvME0+HWusdX0HLROiw+L/c
	5cOKwNYVTkwOhCe8lt7OLTPMV8=
X-Gm-Gg: AYBFou1VtSdP8QW1LDlzf7d0ip/PCYanC6rdcbk1Lv5oJC64VtVknipfSI6hFdInMcC
	bVCUqvnuyQ3Lx4e4mq/lUR8eK3/a3lb56YGsc74DXj4dS2jDckyMDwkBj/3IvGX/rQgqNyTZUyp
	2b00bLU0sNnKPYooCxFgH89IufNNsKYMZy0aUUDTX11C3Clmx6ia4aS5eHXFhSXZKduYlfYIydU
	C6aBfI0QU//huFL/B8IemeJwMTKYe0nJPUsAB4VJv2RiTmoSoViUS428pv7ohfiIi295CNmz7S1
	oOyxriLJmNzIZTiu1Su5+3Hn/zBv5SWp3jc0hk+dfkpGNhl6GtyGIBQqHFA6FYvo1QnMHM4FucM
	iZ4sBDunfMOWA2GbtRRLo1+CD4ChvGjCDDUOUtvwgIeCNrUEPteFo4J+YxZazMXHQJqem8uB7c8
	eWyu/WLAb60E6BKY/NjYLsBVpyfxquQ0S+hOndFSZL
X-Received: by 2002:a17:90b:48cb:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3adea9dca32mr6280172a91.21.1793039376915;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd8cc92f5basm100146a12.0.2026.10.26.11.29.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso16942eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039375; x=1793644175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=Z5Qc5eoFJ4yTzUPCzin8xMh/jZ2htI+0wdsdhJjzUK4MoQJ7oy0AgTTx8ItpkwKe7z
         OBiudo4wQiTgrzwHBHkSJzfyQ8IuCmDz4t8ato16mGpzTl/n6DQ0AGNIKROJcn2UDimn
         b4TQypDjMBTmsz0LYaXbHk79qv2rCuVkTxbvQ=
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027377eec.40.1793039374864;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027323eec.40.1793039374121;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:55 -0700
Message-ID: <20261026182856.3168686-6-florian.fainelli@broadcom.com>
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

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0

