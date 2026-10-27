Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112012;
	b=pZgDQjMbD2hEGKAVw4cvOUCY5VGVcW4A1JyqJpkBrZmTxLXptA6uKn2jMmCG7+F1j3Jr
	 6vWxLkza2zmp4ijd2ckeOW0CB5E+9GvD3zn2MGXYQ9VOEw1kcJrxk2jcje07H2ise+AfX
	 yhpIdfX4kAOsMzCu/v7/sxtYrKAtiyyIqZ23H/29aYEAG23UyCPzjxF4KHoHE5Lvi5+IW
	 n6H1TByZDBRxfVACQMyrOKJdqq/025bT1fjJbM6ZLV9EQU9G5yC90mow6m93oa+t/li/I
	 BLQvANc+DqbTBNNAImX+QYXwaQBuoEAcoXtmOqNUOth3Tr3MJsztEtUUxBIOCUcAaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
	b=mIsIzFSKpc2kavjSYN8sHDpeim4Ta98KZZjJJGUqB6Ff/wH2GwrKeecGaU4JyabkgBA4
	 TSTxBEGNzGhnrYkifQKsznn2Yb39hkzryynMGdaEeAge7wClRD1oCtA0SDC67pneHTZN8
	 dqSAXdsVkdBDubE+k575Vx/rUQd4N1x9wTkho5pTwS2i1abytaNlcYYbbxV+xQl7up97S
	 w9VfaGRYdvjJhCoruDfzIXx6h5NLMdu1SMJ2mSqQ/JauYtotA7+fccxcs5HcG5P15hSZ6
	 OqJgtuXKrg4u0sC5UppciG3kECGD+usGTruBYfwJSdwJibcWpc5Poh1FOT623JOrX+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQfYoMZM;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDF2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQfYoMZM
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3822578f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112010; x=1793716810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=uQfYoMZMNn1b1mHbh6BEdHCCn8DL5Aam6pau5FsCwoApvaqSWc6sLxG21oIz17BYzI
         L0k2l7bv0VS+ZIGumi42bUm84ELP45TwdrWN3CGoU7IbX4XU9LVeg9ofwkfWCjDWWz1s
         JNOzuoyKHh1F8uyfb3dhlzvQbJV/xEVomKgYc8DNOYZ3/WHWf95BJw1t7uF1D4XGgMWQ
         sETGkTXXDsBUpc/3S+2vBdIWiMGUQKNj3B4bxzUjSfYAlbPnX6qrzBXFbEx42cfzsofz
         Mi4j8QfggNhHyZhBbRiycvz1LOO+Hw7lrmym7Hv1C6DVZP7HCAQ9Ue1bh5z0yKowys24
         SB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112010; x=1793716810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=kdR9w1i5rw/cj1a64gDPLPHS2ufPz1z5+2VcSK4JcSHbC9kCTGHW/pavJ1FXyYUA9i
         AMFQABtk2h44pHD1qX8J9rZw9E5x6T/6uDXAlhXko9EuZbvCoRN3y9hlugwXydyj+FGx
         I5ACM+IZeJU100vt81esTqYI0HRnzNhxwMJry7ngVAN+dBMrgy5K4xzGV4hjr+j5Qwv8
         UvD/SIG+kxAXsUK98ehA6/wqxSHB0FH3OMY7z8z4at9U0mr05dTFmNzri9icXQtX0Lm3
         H2ThpolkMPkRsWewRntGqQHpjBaB4BTTBZk+eDYcJiAplGTHcS2CJbc3w0CfoJIMiY2s
         8sDg==
X-Forwarded-Encrypted: i=1; AKwUvBy4RsvdzH32pxyeOaokWCQH6RsAmGLHjW9ro15l8QVlmeWJPk07wzuh/C8lDZiI2Yz44+YiP/SKhhJfyII=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIwechPvxAR38i6dkBRQFyotWjDQwQ1YCV7INvPTM1we7aO5J5
	XIVNlIA0fixa5GIolmY2hdycGqgVZFYEB9p7L8MHFYarGTKLEogE0r1m
X-Gm-Gg: AYBFou3Uquc/0rS2w+s6qWukrMgbtVegimU16bpYilTHkyH23IdJumU49ygoIQGIBW3
	X044sUTqUOT1QdBptqefEuiTlIga++6M8YgdNHqCQfxscazWmjGSVDUycrEiwHgfzxG38IEC9rw
	8KW10/tKY96NL6eGMdjHSneFiPadwQ60NcVwIqxKT0T7plPtt6Ht9tgYMGC2HZHWSWd6eh5t+fh
	SmW+/UHa20+BRwKC5RDVft4SFDOpUv/ktSHXWEVF+w3NU2YhSDqkVwIw10fxFEHixeqeb2lPRm5
	23iMRqejf4Rea3RKq6fYHUHYSk+AvLHrptQNlRjXzgdoyd4hY7O3NoIOUnHmgf49HUJz+xLpSK7
	LQ8BTKgFm1cENlLh3n0j0J7Ryr8jBwrrlBoLWLM0VZNwGTJXjCAnxlO+QSoCG/XFqUokHG06/NV
	URmqDvrUH/XJfdIP1ntFw6LdIGtUcXZB7MqSWUfuXmujWrSj9jflamnMfarAD4aaW0wkiuH7tRB
	V146HGLuhgOB7drb9JOEbnQQ5PkFkKGHf3zXQJbYooegWn6eMTOtb9kraA9ypDxQYSPEPDo5a2t
	gp//fvSQdUY8Abs1RX9c6fgpv0UhNIf6u7xGwmVPOGzqoV2xahe/WiuzoYOd
X-Received: by 2002:a05:6000:24c6:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e3ebb0fcdmr20256092f8f.40.1793112010059;
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Tue, 27 Oct 2026 15:40:00 +0100
Message-ID: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Also add compatible to restrict clock-names for source and hclk
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..704d59360bcb 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -182,6 +183,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7581-mmc
             - mediatek,mt2701-mmc
             - mediatek,mt6779-mmc
             - mediatek,mt6795-mmc
@@ -238,6 +240,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0

