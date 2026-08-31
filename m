Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61EF346AF1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178646; cv=none; b=LSl2OQ1w82HQ535cRveHWu+t3UqED15+qwDlQ7VGqsVsH7dAoI1kt7Gm9v5/G3sMzySnEbTpoWsgJZhmwzbhWa82RL6a4IjWUnafJbIxlQQjMRy6N55QWvbjGziqOuS+HQPSCYf4/zX/b62q9uo1btmbca7vk+zHF1XY9JIJav0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178646; c=relaxed/simple;
	bh=Vy2kFGWf40LZZu/OrRKxOp27EqZPY3iYxkaZKLnSAbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vo5vzXP7HmWJ+N6LYcuzNM304Y2P4qsFXFBeehAplLT/zoFi06pjCOKb9IOTnDYKl46Obq1aFXxrtv78cW9Ilc7FJ5b45eeIFSPh5gxXLJdUx8kZ0j8Nb+UBWlWwBklIdjpY18uvBXMLQkNLOh1wXAqLQbn09JumDrAxIgSyIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=nRhH9NSc; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="nRhH9NSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788178633; x=1788437833;
	bh=sNcmNScEhpmF/4cOJIi/n2ntDi0iE/3WYicZo1sq86I=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nRhH9NSc92ZYMUwzdJNS5VpDM8f8YpR8oa4GmCzGRWDW3M53HIwPaWgzg5O/w4mbs
	 pPs/VpP1+zDMILYBIe47Xe7fNJLS3EVsxcvWZ8lB1Nb8PAa1fvwvlSj944WR9f3dEp
	 XDDCQbvTU3b+1dGdemaw3M/WSbYUGtTTMfZb2QZ6HmlsRZu55R8GVAgJLf88m0iE0r
	 a66Z6h4XuPD/pOUsNnhPCn+C2MUpV4JMJCYp5jGGJyvic0Z7MBr9lG4qrc8Dkg3ZuL
	 YrICFcF6xBnEfWDozI1n+CRwK7y/zGfXTasdiSPlkjDU+DP0sKOI8PG0n5W81tQe10
	 UhJVBNyVEjsKw==
X-Pm-Submission-Id: 4hYSfb5Snjz1DDXQ
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 31 Aug 2026 14:17:04 +0200
Subject: [PATCH v7 1/8] dt-bindings: iio: accel: mma8452: Add
 drive-open-drain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mma8452-open-drain-v7-1-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
In-Reply-To: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178627; l=1037;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Vy2kFGWf40LZZu/OrRKxOp27EqZPY3iYxkaZKLnSAbQ=;
 b=DXHc+uKi/yR1s1twavDUxo/8lj9+VPiwA3+4dLZjlUP9Z1lYujYeKbhylHRdrZAOny3Ci3s8v
 CsRceiBujocD64k4C7BMudxVUzJ7zl4AUfT8mhSZDCGuOPTZdX6lhWi
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

