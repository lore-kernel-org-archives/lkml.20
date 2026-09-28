Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0349B449
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637584; cv=none; b=r6//hm7+YXTpm6nmQ4AZPMSrP/PxwVj6w3M/q8r0z4UoAr7N89oEfo3a9tN4THiCflQincnOotw4jAJGVTYJgX1XNVcHXKGUMLfEQ9MaKrdsC9YWkXAr9qoQoM/5gLda46+0mF8QxOwmNLO4tVJnN49wcHaP1TybKB8WHBYJ34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637584; c=relaxed/simple;
	bh=2xYNsERr512t8YcP5rQXVu/seYpQuw0f4hBvDUPrnZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKBILkKcgDE8JR+6sbKyeibKydPC5UImCSYlp7536SZ6odOON0nSp5CzD5F6j0V5+ud1HG23Jc3CjUVllkhViI0Dynhn9D72SBqk3FsmlL2+58E/UIqYPpPb+ViTG3ikMvxHKoIBSGm/F0CoEFTvFZnlx35vlxev9WKsdmjJEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVHVAs77; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=opRtXHpx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVHVAs77";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="opRtXHpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
	b=bVHVAs77qzx0DXToAZrv2IKYo8lXv57FjTQB5I4JElc9RDsweB1vCAxx8ZbduTSjPEx8ig
	TxM6wUnYH2BjbwX8ajkcDk24WIwSlIanawIbMc3+6nJWw0X+XiWZ5pWmeN/jce1q5FWZVE
	FlYjXQAyZb4oOZlTNtAOFaX1YtnGlHA=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-vtC47b3dM1-hXosV2DPZgQ-1; Mon, 28 Sep 2026 19:19:40 -0400
X-MC-Unique: vtC47b3dM1-hXosV2DPZgQ-1
X-Mimecast-MFC-AGG-ID: vtC47b3dM1-hXosV2DPZgQ_1790637579
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66e5862a158so3248728d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637579; x=1791242379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
        b=opRtXHpxeI1RulzCbWrrkJg8c+gZxy+8p3mLgr5VJUYhBWXU58Sc2jx1DX0gB+Kzux
         EQsrwRgOTvPjpaBuOnHOq0DhuIg7oqV2vToLGVHxQO5Fp+I+PHntv02wVCg71BzgI9ct
         bfVY10P9cXdtsjT/On1dTZlulgOMiVpJ5sCNBuSJqwu4Oed8VHvl6DgA+4dOeT88h42v
         AdgLvjTPBL2fIed/NlJz0sPJfg0LRWGhvdYtgVtnqLnF6R2Qw6dWQ1wG46GA5+RAKh3p
         VHo/vLVeY8O+RZiE9ldVcbwZXoTJXRAb8OAD2AQSfUAjZobE44P1wwYarBC36FC9I6wJ
         3AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637579; x=1791242379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
        b=HsL18+8PykbZ5tvHRKuo5npnVS1m83e/9HfRy6IXYcceV3+wo1e5dCUzy1H8o9CpqN
         K7bZnf7TNE+3eGJ6USWDdq/xwyITnIh1BDjARPKGmv/30Lb7sMMV0hB6EYXPTlr/1fM+
         O/4mbghERtPVvcVo1Ws7mqPR3zH+IvBW/UbbKivzwtD70iHyL3BplW5/GJVOZeZ6QFYt
         nlpzPrh4Z7msSdBV+Dizw4j2eUrbJjDys46y9Ll0qTPuzO3RJbDGonLXAOlIhwRo4FDq
         Kkz3GQFJjJs7kDAeA4Hv0C3+o5qC6QqQSKV4318nCtmHglOlgGy67znd+45kc30xw0j5
         FRUw==
X-Forwarded-Encrypted: i=1; AKwUvBwb3ln5EFKvnUWPiVBokQAK/QmVFbNv7XFiDRdcO2Z53Dg87N7oZrc+vyDwuO1y/2NJAMEsB+WN9TVmuic=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5OuvRQQpMaI+crKUZUv0hz3XJKyuAdKmDGzBSgRRSVW4x1tN9
	0IBUW3oKAzscrbM3e6pZxNLzsbWyBAwyHXyn+/NMID1dISGbdcQhNXZrNzP6mLqf+LedLprGL3C
	LWgNzAcbP0UlPLS5fi66cQSHLDzI76eQia1veCiw/UQlxSUSESJDJD2UlMnwyIFp/vA==
X-Gm-Gg: AYBFou1jKoArh+7Q0X3xQUO6kFNeXInwApkrgC3i7e29NBYKa3yazXow79DF8PUic2N
	fsR9qfB8VtVUbYOxxp33TsZCeXkF8tt+szngIqKH3GYAF4Z+AfCHJyzjR78FntnoOR78wi6c8Zj
	fnjhPa1NY6VjNkGAvCKxhlX1YRNKzL6muthWQQbLhACLldwuGLXUDcBxeVfQj8OA4bBG0IyTcx3
	XAy07o1Vz8Y4k+iswJijWxrJorOFMq2tgNZ4CavLCt14OjWyY4N/LddkyYgmXECkcminM2URnqy
	zJiuWDhQUj0sqPc7mMGMFWbIIqEFBdG1iq/9XV7mLML0ENtZqhdTog==
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783189d50.50.1790637579465;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783181d50.50.1790637579018;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 3/4] riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
Date: Mon, 28 Sep 2026 19:18:06 -0400
Message-ID: <20260928231807.1757995-4-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

K3 CoM260 Dev Kit uses PCIe for three M.2 slots:

- M.2 M-key 2280: PCIe 3.0 x4 (pcie0_rc)
- M.2 M-key 2230: PCIe 3.0 x1+1 (pcie3_rc)
- M.2 E-key 2230: PCIe 3.0 x1 (pcie4_rc)

The M.2 M-key 2230 slot is connected to two PCIe lanes, with lane 0
on combo phy 4 and lane 1 on combo phy 3. The K3 combo phy cannot be
configured to use these as one PCIe 3.0 x2 device; treat this slot as x1
only instead.

The E-key slot has an RTL8852BE WiFi+BT NIC installed from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 45 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 33 ++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a4dfa25c837fe..01e286cb05797 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -39,6 +39,14 @@ reg_vbus_5v: regulator-usb3-vbus-5v {
 		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &combophy {
@@ -61,6 +69,43 @@ eeprom@50 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_1_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie3_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 4 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_1_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &usb2_host {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 1b19979f150ce..36f7780860f50 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -800,6 +800,17 @@ pcie0-0-pins {
 		};
 	};
 
+	pcie0_1_cfg: pcie0-1-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie2_0_cfg: pcie2-0-cfg {
 		pcie2-0-pins {
 			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
@@ -810,6 +821,17 @@ pcie2-0-pins {
 		};
 	};
 
+	pcie3_0_cfg: pcie3-0-cfg {
+		pcie3-0-pins {
+			pinmux = <K3_PADCONF(3, 4)>,	/* pcie3 perst */
+				 <K3_PADCONF(5, 4)>;	/* pcie3 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie4_0_cfg: pcie4-0-cfg {
 		pcie4-0-pins {
 			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
@@ -821,4 +843,15 @@ pcie4-0-pins {
 			power-source = <1800>;
 		};
 	};
+
+	pcie4_1_cfg: pcie4-1-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
 };
-- 
2.55.0

