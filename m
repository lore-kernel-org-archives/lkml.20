Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2651DDEF;
	Thu, 17 Sep 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662676; cv=pass; b=fhpT9Hb2yNbcQ0F1QfUtBJ1qK/clmcmVkS9ABBQbuS0QVe4DJz+K/GVzsyCcfX8DbHLx3dSpveo9ES8eS4BNcZYYIZLflyr8jMtK20YiGBxHy4vLWPi4HKo6ZHPfg2Vl5edp8YYxev8DPgeu4GYMELhhgrB2sxcm2CS6yRb0Xvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662676; c=relaxed/simple;
	bh=WhEgGQPZ9uGp/f98geVzjbwgaYdy7D6h/qq48gieQ5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRBDMPKbkn//ge19z4lbYIUXqQd3FrlJe2lc5TZw7QPO74YNM9cce4nKzGlPVXRWC47qVGZOuLoLNQ2Mqq/VKDrLzKhWQ8JidMk0GPctkQyHzVQ1sOUSJxDM7FByL9nJ7qo+WhhC+MI7QINMsKfeZtDfDZceXS9tD5AIxVhNWFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=LcwK3gGV; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="LcwK3gGV"
ARC-Seal: i=1; a=rsa-sha256; t=1789662642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jjbW6nPbZ0TL/JId0Pl4SXJ3wP1mZOy++MaTc2dTJg5WNNxLVy1iFb/QuIFEyxGqPlNHvUNLYhLrbjiEAqRExcpi0d1GvudneiPSPOQwtLcn1RwNlGA/8WBTwOPd2OKlzMKk2RfqgZfnHbVtKjSDhUM20p1AMuWGClmCW8oPXgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662642; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qx0cf1g+Dt53W7gHztcUTGsB3qoLvk5+RjOcFaDkDog=; 
	b=V31YYko0JVr2qFZKPJGxnrXkP1eJ4g+Slzs7DRqd/4KXREiwScrPxZFU4lBP2NJ9Iz5MY5NMX0kLfsLm2VawD+ncYtzjekfOaVLcQavZa8z/QmmggTFkZh8ss8uLbHsX1MjaRzmNMNRciJ7tGWoFdFmWsk3diTxDZpNpQxC8DI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662642;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qx0cf1g+Dt53W7gHztcUTGsB3qoLvk5+RjOcFaDkDog=;
	b=LcwK3gGVMvOvgfrCCiGwkgotTTA5iTzqiwxdov1uw4nk5N1ZdMhw0P1lzPektthl
	3WeStpOXakDPq4zUjgoJfKBLd7kPpbFV+8ON4MMDmYavjr5PetUD6hD7dMmJUBakJOf
	h1WArec+qG11n/2pkiiequ82oU+bkqmRRX3GRjKo=
Received: by smtp.zohomail.com with SMTPS id 1789662641274673.8989013615341;
	Thu, 17 Sep 2026 09:30:41 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:34 +0800
Subject: [PATCH v3 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-2-cf4fd4050e14@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=WhEgGQPZ9uGp/f98geVzjbwgaYdy7D6h/qq48gieQ5o=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiLaKnnCrl+vhMnTdIKRaP++/IluWMIuN+SpTu8rvH
 Kwsl/06SlkYxLgYZMUUWbj8xf9Z6/B8OyLQeh9mDisTyBAGLk4BmEhpECPD5Etv/mdFLI6d/WDC
 ss7QbWfW+rb+TJut8fJ0Rb/l+/T6GQz/g9r0WjaUfcw3YS2puCUd8fXMBy6jhC3ebB03Zc7URun
 xAQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT MSWI, which provides per-hart
software interrupts for inter-processor communication in Machine mode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e..d17f5613612c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mswi
       - items:
           - enum:
               - sophgo,sg2042-aclint-mswi

-- 
2.55.0

