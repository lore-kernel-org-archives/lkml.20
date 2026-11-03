Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739957;
	b=B3OtHJbi6ZFG9mQUrTVVCacQhtRiREBOTLf/Wdm5+aYUFd09Yo8HP+tDFeT052AIwyHc
	 uSGEIfwW6b4NP1u9an7byUXjsanjPlfjOB2WlcU2I9c/NExVc5Mrxmthyp7C9mWkAtyRk
	 LuAoyytKcqsQrBFICh5Q2L/sZfGdokX5i4L40+Wmze8dzAkAFsIQj0fTSl348K7JUu8Ug
	 da0nk3EZVkJD7fWHa9dydMa3lbhO9nHLNxJd0IOhDPqRQyEcz0usfK1O4JXPxpafpaKJJ
	 9N351GCvFQyBiRDBn+wiriST1k8SczzphNFF0Zemy2OMedAjQkXoolPAaejqVidJxYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
	b=uywB5BeE9bvUuo4AobiWopCf2BFnYDN/5bpRqC7CKZ/UGv0bh0uQ5qNjUdCj63kRo+1a
	 pfpOXFWXlEYWLDIanFFuOAp/HvSaymeR0+MOcwjRn2G0Omm97eqDQ1OUOnX8KHiakrsnC
	 mEoxF6d0om45TdWqH0eC1E+RUTp8R+XIWAnAV2R/qUZys6HJexJIkFvKRU2QNQFkeNOvZ
	 fvWkycvBCYrqNJ+0pmQ76nraXDLVjSoD21Y0Uo20dfPkFEtA1JSAuLSAcp6eeJEqULTWi
	 xi1P23Rh9ynJd5ABnf8QRCP/KBYDXkU7yautkjRmpbXHk5hP1pFiiA/FSoelHQ5NLXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqpcUbkp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98253606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98253606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqpcUbkp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afbd2c386so14285f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739955; x=1794344755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=hqpcUbkpAbc76tLYMwSubgMXF8WGebDUQp9v+SdNEyl9bx6bjhb6ZGziJ38ALV0gfj
         x2/0t9dh4kCwKszoNt4CMjwAXuHDzmb9923xIpKDa+Jb8Xn6/PGfYmHwn0/07q/yE1Ar
         0iSnKpBtpxA0ftV6+W+cJJyxSddXbPNtdFeDQyjwVpPFi7mKmqHIezk6Ujm/Ah+2+ACG
         LSqnc3P8Z/VpKlYrbXki5YY90EFkKgNbcIJQOD+4LUsxu7ShXa/1p/PRnKAzPYhwUT8z
         /EnqEm+KF2ty8z6j9DRfJfOiPUHPR8x6kq7lRimB0fOrQajAW7dbyLnje5i9JEf9axIG
         G6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739955; x=1794344755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=SpFxt1EfCQZX1UfqdMS0TFkqxLGjOVHL8LHFLVP6f9eEBgSuigB6Dbz/VoqcTQJ3C9
         s658X94dsrYm4RrZIQuMXZtnHTEwEVkkazHQuql1oGfFpnxtxw7Z4Etet64V4PgEnIEr
         j36pEKabYZdLAZ9nlcIqPDVcXRuNcny031D0y/jpX+GD+sGoVeXdCHv73gktbOL3E55C
         iPpNQNENbAPlr/GlrFvy1fVeSCAqcgR6sNe/8URhm6RapEb7ezkfFmKwsNNTV0t06b6p
         p4T80XNn+uod47xIqMwGlUT1IrIKXS/9RxDoTuBQHeiMJl+d5yqiEV9vIde8o3qVmh+g
         NoMA==
X-Forwarded-Encrypted: i=1; AKwUvBzTgTlbeRm3j6jG54rharZGBIdi6ZNkE4o+99/3fau3SziCA1pcgSNFR1ThcJ+QphbovFxI+1FTnK9k3/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BPFR4wchXQ3ZCtE2EvW8O8m3xlPPTPPERHskjkG3iw6Q3m/EE
	D3Te/SH1sitE+fdgo57MieYSYkp/2Bf4vmoH+9dm3dODwB3OdtzvOuVr
X-Gm-Gg: AYBFou1Kl8ZZO9nFk6CwE6E91Z1py8Fk8jybKBPTPzPqGZZlMnc663WcPDjxq2O3dug
	A+x71VkmqJhztgd8D/UkRiy0Wf6EwIfBaDLXfhAFJtbSiKaFPqToaUdzd8bfPBNLuoL3ZzlKrpF
	qWCkWfX0RWe88P7HVSnLiRG87KxF9cF72LENTSIKoYZdtMR3XyTkKX2yT6KfOEXt6YgSgRDRO1R
	IkEdx42C6Ri9hnAUHE7jqAaIk2pcn8aqzjJ1XWoRqN2gY0/O7vnLaxTIZ0wU9ft6dLtJPtVauCX
	Zr+9HDafczPxSOJuBwlM9HgoDxBkrgCQlndC470ycJQp21i0wDy6iXjKL96nK6xWB/pP3bW9s9L
	qQtGAkFZCQ/EDnrkIFD0AlkKZiq7jr5x7Z6BddFBFhNmmcC3iGAQ7+Uc5CSmjVRjQSTDlvGECkk
	pzXx9kcxyocTNrbYNJ2JfsiRPN4AlggXfTSDNboD7gZ5vhVmBWZjCQQMXQEpZtO2cF1+3tzjbzF
	CzEYY3I7sx21tRfiJOuXVlSatxPtjtIgQjXLzgUTV5BmEighN2eqpvPqSVwJY6RIL29UuH6Nwgi
	hJgaEcj6V+O5l0uB+sprwFHJYGlk2es0JEvTKzMYk3L6OCxStfAJhczOUSMn+LKCMszt76L1lCi
	4uW1E2pAaLDzCa2HRwPOfNgfw5gKOXpjv8m+AdO24WuAL1nxFWr2OGRc=
X-Received: by 2002:a05:6000:29d6:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-48e6e2c2f66mr20419511f8f.6.1793739954927;
        Tue, 03 Nov 2026 13:05:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Tue,  3 Nov 2026 22:05:40 +0100
Message-ID: <20261103210542.15965-1-ansuelsmth@gmail.com>
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to account for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v3:
- Fix typo for account
Changes v2:
- Add ACK tag

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0

