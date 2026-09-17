Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7FA502D74;
	Thu, 17 Sep 2026 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662658; cv=pass; b=NHTSv0M+Ey32rArDJaKDvdqwLYYT5IvxO2lIxCdShRORH/Y/hTx3Ogv5XFFpdeLMGyEMklDfEK0mMHTql4E0J7iQwI5sk6qfiKTV3jUSmGx6exqOuU7hVMd1B5XaACKgVnLyBGiSGuiXAkNgVmUuvzfuena3r5eR3HJZHxneOeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662658; c=relaxed/simple;
	bh=pEQJDEyK5ZXrjrb+X9BB9F713/vM5aPBy8q32GbkO4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwPbFLrQoQnY9vv9P+tAhbKLmFzFSNQrjuXx8F752HrNIgaDMT5BfuO126bGT08glgneQA5xl7ilWwqY+Pu+7ljq7ujPeCc4E97Gc8X85NAm5X7Gorm0nJFwIhPCTLPEYxInjBpNPjlhdXyNtDijJGGthUcQVUfN6zIJPxYMQaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=hTMVBiAP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="hTMVBiAP"
ARC-Seal: i=1; a=rsa-sha256; t=1789662632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ErJ8a8mhjQvtarZDTS4q8ITqXlZy58gsRHpItVZAF5r3ga7joaaOf8R7SA41c0wD0udz5RapYnPX4Z/Kb6PCcid4YM/+uc1XWRzNMm3l+C/fOghQ4cD3LtNL52s+j9z1uq0tc6avOAgYLJ/ve2N+oTUO4aBHEJDp4zlgVySvPbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662632; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pv6k+zlw4+R8nkU6Dt3kgb0k1h6sjbSfWJNx9AAm1HM=; 
	b=RR7fQbc8Hcfcm4llfY3U2CchHYgwNYERV1ewpn/L2rKEX13UCEnrclQXMeLajUfLa3ctGbXBAmctS5b7oCDzG3J9arIotDWs7GhBabTE37TP+XLsa6By7UP9YmqoF4OdA2iQnbf0cpyyWD4BPqjarZUphRUknVwAm9OIqygiL1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662632;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pv6k+zlw4+R8nkU6Dt3kgb0k1h6sjbSfWJNx9AAm1HM=;
	b=hTMVBiAPSphc+957NRuglIyvTcEeWpwtVrswDkveVyJlBF4vMmb7MgkugtnNSNw0
	1Xcx9YNjqpWn641Reu05HC9ciA7JkSOTfUYpyzEsjurqcLgitLdOwYcO59M0E2o9649
	LGZFzG8T/jxGAWzwpdGBe84H322q0flVGuA1QJjI=
Received: by smtp.zohomail.com with SMTPS id 1789662631336603.6672015201747;
	Thu, 17 Sep 2026 09:30:31 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:33 +0800
Subject: [PATCH v3 1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-1-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=pEQJDEyK5ZXrjrb+X9BB9F713/vM5aPBy8q32GbkO4E=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiDYd4OR//E/rV6znT07D7YIqdnOPvbt0bHZJzclkJ
 WXlBXolHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEykuYnhn1Hv8UqGjBTebV86
 /nccW3ZQ6dDPI/8Equ+dKNr4/7PYlGeMDI+/aJ04ZuxSJHPmcMoST+NGl8z+gOzmhYenSLg+P/i
 zkB8A
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT MTIMER, which provides per-hart
timer interrupts in Machine mode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f6..082378b04d72 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mtimer
       - items:
           - enum:
               - sophgo,sg2042-aclint-mtimer

-- 
2.55.0

