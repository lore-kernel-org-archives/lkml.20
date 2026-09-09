Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE056B841
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968456; cv=none; b=dicO1J/fDoyM9ivOWow/BQMNbgD7ngO1S4duScsSbxKVb+dFzzjhVYVabOjORXwSRrqKaz6LBAzpO4Xok50TQ7lh3do+WW07wW2p/3j/U+NeqMze1jSkqfgrEKpLFrleohZtGH2coCTjMOJuRwVK7dPGh4mKxUDV8F2TDOqGohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968456; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAQNK6Btkf4ZzdMyGAclvUtFjWRe90n7hQrCWPqALG/+q1dbyaYv1AnQRbLIQVCQhTZ0GAH9OngubCU9pYWKfcPcwr30T4jj5MfVM0QNweV7xmcDYfec1FwMJwTSiX679L4toFu/Tl3Vb1DkECE6F2lM21lqWix1m5842/5QwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a++l9u1u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a++l9u1u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482dd6ee390so6647811f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968453; x=1789573253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=a++l9u1u0UrA2UvsE2v3E0oTOsbk+dDKaHv1u8aM9qEiQ1yx3AYp4XjhM7XJcESAHP
         mW0k9VvF2VVWpxA5bGqZzEcNU4SllEi8KRAqQRZ+VBmIonPH95UZFm4hdYs0DC+DV5T1
         tK5/OBWOIAIGE5/MXh0Kpkc97Z3UdKtemiK8d9H0kt2ksf0R8yMkBnxa7tsO6zbb+ca0
         pECFVSmKkdkkT29FGVSa98pnwBzhXEHQ2T86VaAkRroL/sYAuZGBuq8yBxXlC8AKWzQE
         8ViMOIIWXBcyM9G/gyCynwzbqGRXIOxhRUa3gUTFq/SjhurPg9tHhdadMe7zzB1E6Vrl
         m29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968453; x=1789573253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=W+gtQWiGJwUAGuHASS4Xj5RXBcpx2vy8GNZxtu1BFadAbWudSwikuvfVqYtrF52SLg
         LReBJdNtt/K15wLMp28j9pUxLP57Qc8zq4oTyGgJ0i6s8cfMjsT3Ixphx1HlcVN0Y0Rw
         pJyfvvuhSnAFVEkFc+FmISm97+BmTZ5ymBHLwoGZQL4RVLT6L8Zf5neUlpxh6fkNwMLu
         oq6vJyhXyQ3vO+KQlHbRaUcdsPoTV4EjJtttro+Kx9TjPQA8LzbZuogCA1ni46p6OwBH
         rf/Bh2AznZkuHzdKYpNWTl0h5FrUSIAN8mqCgh/3XJow8LHrWDgK7Oja1lsHUAAbl9p+
         rS0g==
X-Forwarded-Encrypted: i=1; AKwUvByFgcHsmezX1T9aWl9NYkK1zUXKSrhXZuSTqvM2uXL13pLC800QFVkhjgle+qOafV98IxVTyPbdXmZ4H7o=@vger.kernel.org
X-Gm-Message-State: AFuF++li95SYGmPnprN3JZ0hfptOZpXKeVUQf7q0tOlIx4zl6l1iq75s
	6ej35DTRP2iz/YSgrOY5/IRqFpmpMx3UTVLMYMCEFm1yK+Blrypb0cun
X-Gm-Gg: AYBFou1GA7pWP+KlL9P9eeBtIlWK9g5pKA6YIfGoJ9KCU1+vO+QYXpbmXeKRO1JPgIN
	f9Yvre+eCGv8fQlACg65rSK+3zjYOGd8e3jSYDCMIJUfX3C6NWM4ubDnXajolddA/5WSCaBO+bf
	l5wa4OTaJkEcFe5gngj7tQ44P/DLDTNch2UUff1ilVYVz8D+++PRnBXsGHCPpYPpkbP4dFhHoGT
	HuMJxX9rEtEA1aoe3ANRrXhxHb4M8i/5NxxEycmN6a4Oy3ymWa9GeBZr3/YsLhEv7dsWsU8uXlK
	3FPijzsuYL+9IzmVFYeg6rJ+OUqxPlzdfq2t6q7l50heQUZ/U2De/M9N74tQ7N4wqg+t0KwJfzL
	mWHW4Ad1y92wreD2MAPz+/l86+/XTq8a+LGXE1qCXPTPLJLKcaP3KiwT6GiGU40PdfTGYxhUOHP
	2A0VwOX/P026qmauIre9VDha1oS5JxdiC15ByiA6t8VCF8obCH2XBmS6FPAvouLZ5YJp/XxUzwx
	kDcEVtF1kCauB8OF0pIEL/t/g==
X-Received: by 2002:a5d:588d:0:b0:485:8c16:a338 with SMTP id ffacd0b85a97d-4858c16a615mr33895800f8f.45.1788968453181;
        Wed, 09 Sep 2026 08:40:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Wed,  9 Sep 2026 08:39:42 -0700
Message-ID: <20260909153943.1048-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

