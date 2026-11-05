Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918069;
	b=VcfFhYVzK8ppuivJYKO/E1NRU9JjdL2745+eKP6Y2hEnjHJ7bB6MaRhLppFxHLMTo5a6
	 RB+0ZgL9CmS08hCdb37Bgcvr5VHPyQiLAgwPXcIbbMhxLuTd/Rjma3/mJtRTCauA8H2Rv
	 5wavndvKxdXgMQkJpjTWwzcX/3qxXYxMMD9NodEYJwPXwBwzS7VTeRu27vkdve1kt+R/2
	 EFxkTlK9GW8W7rcjVtKeDVUtP4wX3nTlf4BKC/YVPNqvj8xyRxJd0eaiuEHV4MLanuAHd
	 226Z5+uulXnQZum6/7/ImFvHDDMbp3JFSFPhvGipAqEsFd1nRJxq8saUKlg0oL0gMrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918069;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zcO9O8E0NGU4bvQ2IoLhA+PlZIDfLzWogU+GeL3djPg=;
	b=CzFEvIysXq3QAhMrdhaEFa10WUpEYZcCwCMXICue15X56vlEKk+CdgdFSdDLzpsYSBwX
	 cCuBEJO1Pv1EZOiBPhpwsxVVwMMFlv7+D+qjdUyyAemeY2Xff6Z3AeEny5DDbgsnViNAK
	 ao4VDqL2r0MDSI1CoE9ILIQ/buApvzK6EW9yDeADMHiwmin7ZydVRUf6IAx9A3+hvZ7U5
	 DmgVP2EzekLy/+JIVPe8pmC4HVOwf0aYmvagEfy7NWedA4MWf7RiHhY6OVG3rNSbRkzuT
	 lDiyg1QDHg37BHs56tkkHZNYj1O3pKNB4tdqUHoGJ5oh97U2Q01RKjXy1dwC4Ghe7yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kdl/Z5Ps";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFA606A32F;
	Thu,  5 Nov 2026 22:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kdl/Z5Ps
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87AA1F0089F;
	Thu,  5 Nov 2026 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918069;
	bh=zcO9O8E0NGU4bvQ2IoLhA+PlZIDfLzWogU+GeL3djPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kdl/Z5PsdCRjYOzE6v+/aQNYl6rtkcBEKwoyCtbyVAf1xPMHEzlbn0xyc/1OWATKb
	 eaT0A9FEHBeyBEJ9hFx/xIbAmcDMz25nZenJ6DvpkGn55SPBIDOi78IlUsTwefIKBC
	 dSY7fgHD6LsiC996k5jOPP+Y8JgklXmj056IWZBAKjid9f+2tKpwZxSbiChTF03eMu
	 QJLN4dmIO2YjGC2y62V2WO0wEqCp50wr1G3L/+M2fV4AMoZp5H4BGn6ztINwPPxFRW
	 N4N+DhpKSrCQgBHrYmuBuQ7gNfj6JLQnCWYJqTSWv3O7/f9zfT7MbZLx0/X+H/W0kO
	 Pl+7XbIHGCLuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:14 -0600
Subject: [PATCH 1/7] dt-bindings: arm: vexpress-sysreg: Add "mcc" child
 node
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-1-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The "arm,vexpress,config-bus" is accessed via the "arm,vexpress-sysreg"
registers, so it is appropriate for it to be located there rather than
in a "simple-bus" as current DTS files have. Under the "simple-bus" is
not appropriate given there is no MMIO space.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml b/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
index be6e3b542569..5b34fe20b313 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
@@ -36,6 +36,14 @@ properties:
     deprecated: true
     const: 2
 
+  mcc:
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: arm,vexpress,config-bus
+
 additionalProperties: false
 
 patternProperties:

-- 
2.53.0

