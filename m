Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20482D592D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526993; cv=none; b=Re/kyEgIkOzXsR7mmwis9nXJII332CRF7JnujBBO2cO0360IYzCugbsM1qNcppLkpGvhoTSZ7RC/qN1nqduSDtYu2UZ/I8i0E1Ba+aDVPAc6wk9TgmNBkEcUIhGz0vArg04xq1Hkf/2NfSbvey1zv0DJpAjfkUCyTtJusa0omj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526993; c=relaxed/simple;
	bh=T14eyBixmKbaeuBlk24NEJ0rHXVuda4fQO8mz2rqDDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9Uzfn9LPiUMo2taQVfOcO8bOPktQyyZKPH7EYomQ0PB8dNna29eaJVz4aMO9PnAYZAw0DbtPBH81vwFMqhNk1uuNYqD8yZl/UH/Cm3NyRhQdvQZAmtwfcxA0qlBHdJ4HWTRjDgk8sisaL5RGmCFrHVwO/SvcQbyn67hnxJX4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uLSM5qOU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uLSM5qOU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD4F84E4150A;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 796906057F;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B80511C7AF0B;
	Fri,  4 Sep 2026 15:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yGBXxJGrq9CpNREKuNgAMIWh4atD8OtcoEN+4Ih6cA=;
	b=uLSM5qOU/rSSfmjC4EZZrgeGTOKUf2TrMmwr89x8O/arV/ia7lxHbRzKi8bBVndXsyuXp+
	Qmf6gEiQ8YgYKZwf1rQ+KQXvw6+QmWg4N35Mv/6RwyrZ8e3MnKqAv4lLAktKmeLGrzz3pK
	Ho7fAjPuhehvTrgvfNMFEzSFjow/UdXAWqDq7jWGnVYXAKpDJzClUqMLfhNqvg2Dp7hHGd
	nftsnzCJWD+BgjhijTX6GHXVKKJvtQH9rg73H7nqxAzeBnvq5ZAEWfY1MK6vFF964+uAsZ
	x+uCnihHZZqVBnjyViFV58gXnvDWUlhZsmFEy7mbs1cT7ZjyltZ/grGg9Lp0CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The NuMaker board is a carrier board on which the MA35D1 SoM may be
connected. It has a lot of available peripherals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
index fb190db61525..972f71a7449c 100644
--- a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
+++ b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
@@ -18,7 +18,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-
+      - description: NuMaker carrier board with an MA35D1 SoM
+        items:
+          - const: nuvoton,ma35d1-numaker
+          - const: nuvoton,ma35d1-som
+          - const: nuvoton,ma35d1
       - description: MA35D1 based boards
         items:
           - enum:

-- 
2.54.0

