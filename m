Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325381;
	b=a9KrWB6Lxt8wIjJUNW7OEPKFRY+SR8DYXrc+R0AdbX8PQoRssxAnmzWXmQ7hjsXmPM6q
	 rgbWAZWoJGOpLIfXAw9uFPOhsRY4PP2WdrehmJSmi5zhzfSPdbQnkOhqCBd8EP+zWEMBl
	 QyJoi2zRPEHSz8Ze6kH746DOBvNUxWvVprMHuDG8+t99VpHEDBh1xXTUHuBBUd+ngIiVS
	 /z90mjdWgJLRfNRAbwE6rUha2g43ujxPwoVfBZPrEXQK03uBgP5t9e3OVpcpKl9I9kEK9
	 LXGEzkvnIH7EoR65HWYrcJrq5a9KCrL6vnhCYU8hHcq5n18G3LmXWDWjxpGiC3egm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
	b=rsuDaJaE2LgzHJXBtEChsTMHLJJbr56GEy8ZEUYyYmPY9Yi+9jv90GGmfn+oDY7mFcEK
	 cOleREtNYeixYKQ0nbI20VrlJXyEBfjzbf48PgU7KVzsw15wBYwR0bZy+iupbXDQtILDI
	 iq9QWHUFvGQPKJoNnWeMnV2rKAOezxAbWdq65glsd9UVhSgO3da/da4+IiXSFHdDf14NI
	 59ymUy+wD/wlYigA2yIh2BSW90/X/iwT/fBlCpbR/ALh10fIM8uYBEkxz6Qxc5/RAZPuM
	 IrlQusjRVLxSgzmejYiYVJP5gYoMllEBwCW3eAB8lJKJYhqyyZpka5fXdNYTXzWx1Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juPNybO9;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EC606D762
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881EC606D762
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juPNybO9
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3aced9804e8so18801771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325380; x=1794930180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
        b=juPNybO9ob3cWcrZLpGvPTYrhVk12lb5syJQk4janFfUd2bd2ELKI82pjVPIWTcz0B
         PvncSwO8k5BJg9+a1rWN+agfrvu7xWYAgGv06+hhQuwu7cOKId5DsTYN3pQ3mH9BdOrg
         8YD6u91iV+RBapoG4c1sk63alTFIJUMGy+W7cnEVyc/MbixacMqy/HiOM1TxHvwzyFTr
         KNMoEmLyCCJYaR6LfSS542oid00zkMjstykGx8JNKFmTjlJA2Gz+rnnVyTP34OlVNy6U
         EdF3edsZ4t618mW0x09KicJsr0Pdh81Ed2BuV3olYmf+dJIFb8/4+yeGLrC/GoF3DIxC
         Azug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325380; x=1794930180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
        b=lnePzB3sTCjk5++FCvV3f7zP5r8hT6/AGLMJm7mBCMB2MT9l6jP9to2t89KMFm74kR
         1TVcu/+9TkZsLy/c8/CcgVkzI5UobxtPYiT1MkvRnhuVCZfN6g5mNbraJwaUMgcYORQ8
         yfVJt3jxGyJF6jgRV2qyPIeqlmbe2+yPfz4/q2p/IsWC7u3Tx/QcJdPx3HWml6jTT4s5
         D9ZPbZfEAyZQTD/hNFantjiQNnHDIt6b9YPk8xYddLzkPxI3JoZK7HMGnXsixmY6b3KN
         eTHSMiN3Epvawu5yJrVfjWxZsYAkaCerVoqJzVBvXcouLHdTI6iacf5SxwU2J+LHmy7t
         RnBw==
X-Forwarded-Encrypted: i=1; AL+hErGRl2YpmH9DP0hJRZghbeWemi3+2D1QBV4UtCX9NOdEypW8C2e0RbPXwT00IBYg4lE2z27s2MONd29QJ98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5TZmt6ch+MbLQ7C9AZVwsymUaLzGimYphvA8fX2duhHWxmGEd
	5FLJrjPWS0kQeT30dTe5Cz0qkeZFufhJVFDGEcR30fHvNbFNV+1/pZH4
X-Gm-Gg: AYBFou2wpSzEFMbcEGRmZ1nSbJefmXyhpCaEuJATsPgH4kzPYQjnNLBCNDuHsp87tfV
	VD8/qqMMCpWEW5zZZTg3CLmLlT8Fb4gDTan5fgNJ845VyqhUgRjp2Ei67j8V6NkLzz1vS7iJndB
	ATQnvvNUPKosegEZsCVcHMUr7uMz7kSGYbV+kVJLJj7zPJvelMuYEGkMtWA6HC4QUyf4M7fdy79
	UEAAt/p4LnhFVYEkrGYtQW4iz6bTil3v2HCQgsKtxCyrv46ObjbO1lkbmjCIjfo1XxWmTwSj1QC
	LkWXRVX3NfSNw7DFd079E8E5DLYpHntIDIhrdb5EZLffbVcNlgwFBfeliuAFud7P2O9Dsx9M7tk
	pU24X7GGb7Eh4nWvRpvH1u3en7Lt6g9JcldYCJ8Iz0X70a6KAjN49W6pxYOmNLlmx3mDhVaVYCf
	CDx77AES3i0+cZ3R0fBtVgkciMIlkeNDOI0sdbPRY7UbaoKT6LjNCJ9Bad0SJuxvPaLr9qc4g7E
	mpecUwqNzpFD8uq9/EQVrD5/hG4A9Z0+TqGg7LzLLiH9exuUzEbQmK43jgTuwig5K5UjgGPIx+G
	ZY4RkEtysCHvDemy+4erCeZW42/zgUuTpUVXBbVsWmEKobBprD/3fYQZy/4rugzNlqTGZhY3Y+g
	1vPI3VJmj0yP+rYUYnmLdhYycIDmgHAl8mL5q/w==
X-Received: by 2002:a05:651c:1608:b0:3a6:10d4:61c4 with SMTP id 38308e7fff4ca-3ae0964783cmr6048041fa.28.1794325379385;
        Tue, 10 Nov 2026 07:42:59 -0800 (PST)
Received: from yantra.. (nekmmqt3kfwnocz4ivv-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:453b:19fe:80e1:2b9b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923d583sm5751481fa.21.2026.11.10.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:42:59 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: pressure: infineon,dps310: Add interrupts
Date: Tue, 10 Nov 2026 17:42:53 +0200
Message-ID: <20261110154254.39092-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110154254.39092-1-zoone.rupert@gmail.com>
References: <20261110154254.39092-1-zoone.rupert@gmail.com>
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

DPS310 signals new results and a full FIFO on its SDO pin. In I2C mode
the same pin sets the address LSB, and interrupt polarity must be the
opposite of how SDO is strapped.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 .../bindings/iio/pressure/infineon,dps310.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 416117dfd927..cded6e0af147 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -23,6 +23,12 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description:
+      New result or full FIFO, on SDO pin. SDO also selects I2C address, so
+      interrupt is active high at 0x76 (SDO low) and active low at 0x77.
+
   "#io-channel-cells":
     const: 0
 
@@ -42,6 +48,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -49,6 +57,8 @@ examples:
         dps: pressure-sensor@76 {
             compatible = "infineon,dps310";
             reg = <0x76>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
             #io-channel-cells = <0>;
             vdd-supply = <&vref1>;
             vddio-supply = <&vref2>;
-- 
2.43.0

