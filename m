Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32714D6C27
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488426; cv=none; b=O5TM64pq5tCXj4VTH9GP+UqtiS3FG1JZSzsQPptK6tiICAWWG9hIbR7I/8xRbmWJlZU3piUn5g3dTP61qmfQ7rgUTcGgySkEjdTKHBgcv1iXlPdAoc5T5f6NOS8pM6TcCN1WbnJaQ1bmwJgxGxW2tHDQ+8T6FLSEuvLcLdLRJ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488426; c=relaxed/simple;
	bh=JAOMxI61QC8KPKmV82fMgcEzMe1b7vaB9yj/4Lg5yhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+l+k47lne8Pe8/+z1OdiY3tANx4+RoRsBS9mfT+0H2/77EvuDjzNRq8ol0dwOxaUlj96J/d3wwX3TQRMJnYR0RG9rQM9WeHb21wWsCR7RtdK84K9Hqmz5abGJCwf8h66nE2AbmvZwxPDWynnTBrmIH4vUAvmdSLyamtZfZPrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1Ba1GLg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1Ba1GLg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so58799685e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488420; x=1792093220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=P1Ba1GLgTDRNMSdoAxRlDdOy6+mzuwKV5EhN0DzYSHvtDYgW3DAQD2CBd6UBhc9MZk
         QnzeeftQTaAJ0x1WUtZ8ia9/oyBaqFAK2OxpV4sJxJov+t6+li2Asg/cAyeaIs9U5rpx
         NCcJ0Cg1vDIeJo04nCLtJt7c3bpiiEcfL2Z3/G47SnUl9FNP5OfwJK41i7ynOqzzIyyl
         5F/XkB2Hq4JRg02aet9LimRIYe8pFyQvHRpzNO4CSfxb2s4Uwy3+cfNvUQVqmo6bRFfy
         9jZIe1ddsjTanN/FKu8WXbYd5k/dyFDbXhDO0rEPLek/qBGwXm81KWHWjUV4GyfanWi6
         leww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488420; x=1792093220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=QaWSX3kYmpuQ3GMkHHs9lQJPj4n5DZ6usT3wtuRMJxKVBjMWtdvj5STeszd9do7lhA
         oDKCALcyzp+7f8QikKPi1YAZxJz+LvFF3yqilwGNG1msSLA9ckcs5ur9llfTRYNAgzc+
         TS/4eVhlc4ybYaf743m1fcHVO9j7UTW+5lZfr1SGlPDrr4Gy/I5xg8VSpPPsuLsZSlRS
         vBImkUxk96UFIOjXlGEAVDIkc5zt2nFRGI6S3FIZdKyQVJbtlnebPuYRykpVoeW0WSdo
         bJgmythXNjKULVQ9mAPkhMIm8ri2XWUCBj6EqJeg5OjXfOQEroQvjtKx/tMlrmTygCj0
         FbtA==
X-Forwarded-Encrypted: i=1; AKwUvBwgfQZB4zpehqKZk57Svw8jDeqTPJh6lrE84cH+8lGUhppaeclhiGjWYOhEj1MHUwyGiRdjA/IKBC/OiXY=@vger.kernel.org
X-Gm-Message-State: AFuF++n6sfydRVNtlzCtpQc17COIUn0NILV4AuWgjjilpdiS2uDclxw8
	DfxE2uiOMF3ykysQrg2pJYYxoY3FDHtz8fwnhm23LEUAbgCulAZ4JUOU
X-Gm-Gg: AYBFou0q58hYUkxkdTJ3vHRT2PoAAfObLI8YqE1Ujkueo10zWnwaa75zGKDb8YMhp9U
	XgQEIAedXYOUXdmtlvzdcYQfxrNrMzTA1XxNSxnw1LirXOSGsBTxrkiNQ5weSXq4rrfY6JMiiMY
	QZWkXtr4Y4OhiSrwkdd8MX70ubdHYSyXP9FaVrwViWMOS3HQux5IBrKjb1ZmaOocrr5FhtcjogF
	H4AfsJFNUH0+ixoP9bw1dbpO4p00/EgrPkidgpPU9/A9ouizF3YsxvxZhWDryfS5AqthubENCgy
	Y1uazPh/10cg9+d4SzGrzLu0GaS+Syt+PSLQFs705jfHH6OfKqfVV1aukzP7kBO3yCEHhmRwAHY
	VxcKUSt8GFB0/OwAjpTfwKQQopQAbCUVihGj6IlunbuURsCv91qZmcMVKkAnmAIehCf3EJoo0U9
	w/Vnt6283DeqeX7sSE7zYqp29EeLh994VtFg3UomV1GEvny5LtexMWaMGXiEQ0pjhYuUj8wUZB0
	favldjwYJ4O8IxmEEADuz1HUwFIPaGxEfcle6UmYvUZtjS0FMEJGVfg2j//ARjLewiPlW8r2oZH
	LeXunfCVurIztevpGP7ISbPVdVs9sJWxsg==
X-Received: by 2002:a05:600c:609a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18031130emr114964675e9.12.1791488419663;
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Thu,  8 Oct 2026 21:37:43 +0200
Message-ID: <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Put fsl,imx6ulz before the fsl,imx6ull fallback in the new Variscite
   entries. Leave the existing EVK and BSH compatible order unchanged.

v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ca6778b8777f..d75a08cc11cf 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -945,6 +945,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3

