Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039826;
	b=BH5g/6IlJIaoV1LG+dR89q3VPn0jkj8mCm7TOGpdb7yQvP+gitukEh1OCAj6GUGuWCdc
	 4+b3Zm7WpufARD7spS07J0jjBHh+mKqTI6gYykM4+33eVrCGNSEK9fpjrm0NSltL8Z5sX
	 rY+jjWYCRhGeOZhxHPf6eEMX+M67Qy8XQ0pdM3GTMphKojlkpMWYX8qkRuLM8fGc0Gdej
	 sazkesfwFXKY488vFzJd9AkaiCJQJqJBp05Gmff/AQdAuaG9oxChL8udGqf85nR1EYsnw
	 feEmDPGJf2Croyzw5/wgjgc6uagqinH/XrHrOuyYdC1aqAl253aQJDFUTC8SCA0xTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039826;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=pFy9DTFVt55Hlw0TWdeeVECea6FWxuOyUJBkeKW402/vEgtnoROTf6bAGpPm7itkCpOs
	 rtf//zICbw1luub6GnWpiCRj0rrP/2t7e4dIS8VfyzTbIfHDYxZ8ZulxuxxxtYygA43f9
	 oSAw30t7WKAIpWFemt4oaICpFcpf8py1gt4KXvP3ypyDKnf+QrrBkiuK4oDeab+rz6IOX
	 RardtaZ6RNUdmsK3N1P+iIQUa5H5lfnxz5JSEzplg3Y3qGKEyQ0DFpy14fatYHs9QSFSv
	 mAomX4RvSv+qA43z5/I0CmNsbtkhw8D+6LDb5KaKMFmGKI9XCTHmkSOIXslEmz3KVLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mm0hduLg;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C374606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C374606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mm0hduLg
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so3287436a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039825; x=1793644625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=zsIEQbt+81IS0V5f95JDERL+WRA5iqHT7nmHhihQgy807tE+CerlmKbjij/IZklCQz
         EuKhUvOVmPASJTAinK+S6WwwOfMaKV27h5EwggM1MM5Tr7OsPbMIuViDpqjNmRoi8iNc
         S5ZkpySsG18Ri+xzTQXYfnJobDcRIhWOL6ADhMD4NyWT2mu22nCFFyeb32OJwBocqq8k
         ONEbuGm04e9I88BaQLNyHlhu2qS9X1R5L9N2EpwtpzXaGPOvipgerA3GMh/xfD52Y+vf
         7pcbUcVGYEOfe8RjEXY51Sfg5b+0QBOg1bADOyEIL4cHIrCQbQdmwIB9H+O5AA8lfssg
         PRuQ==
X-Gm-Message-State: AFq9FYJwe2LC/5m8qH6leBOXkmxGHesvsCw5RrP3XL9zQOhD0pMEjo/0
	mCrni801LfnHELT7SWMFL8gQLZlm7+WgJEiTs4/v/4xNJ+oyJ2MOfwo9UoGWEU02v+jk5L0Csk4
	Mu9wzFEVhthZJ0V92fkIX6ItUvLixaL4GBobaeOPfKPDQi+VJ+u4X3BK5X/JyGhZzqF37OLDHrX
	lvMSfl5wfVgwMzX6Hhop5GP7shAIDYQFjxxgM5Lokna4t06bvEa8J19NmYvK5aJgnP19TJsrAv6
	jYdb38wBHFST+vkdkmlDxg/MYM=
X-Gm-Gg: AYBFou19s+lALm3DeHtX++Y52WvUuE54T3pT/y2Uz9ApaD2qYTJvvTLK5D4nQ5L6ujw
	KqUZ2KZDLYu92eQ+PLKC9w3Z2RocQCSwUHcZdDBYXq/6r+lnEGA8a/HRKFl2jEWO025nsvMAUn4
	/o5TL4Hgh1kKL+ZnSYXOIGa47BrvYYfcyaewrwIwRM9Gnld1lk3pv75BeF+0xsSCPpGEXc34BdS
	cj3hWuUOfx4ZsAecKnprgWG7ingqRGVilEj+Hu4QIF3b97ccBfqFfYnMiOnFAe9ccqa3pWgTpVI
	W3mp63OKnKBsSjybgJcU68jeT2MU/RKndI8U/Kv3PIe4eMIflAhPjxVXwS14Ed0gwxwLsT63y1r
	JOe2DM40sVyUAJG3llPGijEBV9VvwI9e8Mo3NryHoWUnevNZTHPJAevLnEKXwsCC5ydP7kkl4H2
	kH6Bv+xrVShsI4k/tD+R5ATLZhSbAj5RzZZt9H+U/E
X-Received: by 2002:a17:90b:2b4f:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3adead4819emr6236043a91.26.1793039825437;
        Mon, 26 Oct 2026 11:37:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784dfasm245063a91.3.2026.10.26.11.37.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:37:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so16127973eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039824; x=1793644624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=Mm0hduLgOvGQ5TVv2Qemd4U96rQbIRzolGqo/DCHQ6mwg4QJm8/2b1lnNJB9kOMfOF
         HmZsouqPtGhLD7ciatUvvrIvHMzeXcLdPXr8v626WOq2QXfESYOeNblo/SjuEx8VZD5O
         riB5F6oAaw6ra8pqdXFUkpQ3C77GODZKDSveg=
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300562eec.25.1793039371758;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300511eec.25.1793039370933;
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
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
Subject: [PATCH v2 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 11:28:54 -0700
Message-ID: <20261026182856.3168686-5-florian.fainelli@broadcom.com>
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

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0

