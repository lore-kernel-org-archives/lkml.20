Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1C47207C;
	Mon, 28 Sep 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583991; cv=none; b=Je3mwK6cGVC2ybWfdrArFVidJn/8i7D5M7teslNufYeZ/i9U6AB4ih39WEGzlyG48orlKp1EQzHR7yi7O7jpgacWyB3g/ZfS4A1VdyGLEI2eK507uar7+ap3KAQnjE+vkI9L+0s5ob0xXcEyJ4+EiVKtL2WmdXRiQFJ5TXBq1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583991; c=relaxed/simple;
	bh=Vy2kFGWf40LZZu/OrRKxOp27EqZPY3iYxkaZKLnSAbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEMIRB8hqZAInOGGw2+4e60AI4bXGvXw9HFfAqcxniSZBGyz76DUFBie+PDrHc9Y3hx8fG05KkgXl+ovlou+N5E77oH0JyZV5d/LkaopLsbpk/X9aO950FMENpI6mv/1HUBk/Xg8imHO9KcZDVNmHoMdGNhOloYJ2dyIwtx1qxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=jTJ73O6N; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="jTJ73O6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1790583987; x=1790843187;
	bh=sNcmNScEhpmF/4cOJIi/n2ntDi0iE/3WYicZo1sq86I=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jTJ73O6NQHocJTaFr6Wk4f5K1+ojTAxeetq0mr4QhhhXAEKo6sisRoWFVW5gu790I
	 xLk5ztT0O53zjLoOo6fMMrOO2KgxTPmWDXEBaFpvrSThptoKKDh8Rsz3jzElgUHm9P
	 oR+SbtN/MFj8HLWwFDpZkC/hgpTWjj6pLzPsV1c1qlE6PzRUFjW8nTYdgTf/51NieE
	 uxMcVZPrAqQvddXPlc/b/3sWDf4BmtcPsNN4rJu6niICvukUXlqwCor5rm0T50GLDs
	 QSbx4+laDurERWy3HOwTID5hg1qwh6TM542SKmfj4fiyv67wVA6WWcB8l+iMH8cEll
	 3zkTSZpGOzf9Q==
X-Pm-Submission-Id: 4htZCP0cRZz2ScPR
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 28 Sep 2026 10:26:17 +0200
Subject: [PATCH v10 01/10] dt-bindings: iio: accel: mma8452: Add
 drive-open-drain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mma8452-open-drain-v10-1-b906fb408386@geanix.com>
References: <20260928-mma8452-open-drain-v10-0-b906fb408386@geanix.com>
In-Reply-To: <20260928-mma8452-open-drain-v10-0-b906fb408386@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>, 
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790583982; l=1037;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Vy2kFGWf40LZZu/OrRKxOp27EqZPY3iYxkaZKLnSAbQ=;
 b=WOfKVFoIdlbzzGQpUNMuIJ5fYJO+3j19yW1XNke+sMwb3ToCBUU3PxKdoufRDZCZjdHRDS9sS
 h7pVSL6tq6MDHuILZ3ryOiZaQn1qfMhrp8dIoSaSdy8FM3fr6Q2AG6A
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Add new boolean to configure selected interrupt pin to open drain instead
of the default push-pull mode.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
index b0dd2b4e116a..20701aa725d0 100644
--- a/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
@@ -39,6 +39,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  drive-open-drain:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: the interrupt line will be configured as open drain, which is
+      useful if several sensors share the same interrupt line. (This binding is
+      taken from pinctrl.)
+
   vdd-supply: true
   vddio-supply: true
 

-- 
2.55.0

