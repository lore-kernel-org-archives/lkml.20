Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D14189DE;
	Thu,  3 Sep 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437428; cv=none; b=qxF2Lt/OCXvVPzw1+Xbe4xSYzEmSFzIeqJRmP+Qn/3VuT36Jkq4S1u/t7d6hcFQ6DEJmem+XM2yXe9Jtz2F+qP45sApDycxh3nfLcGFov1TKMfuPpPrwZsNV2wk4Vqk8oEtNh0Dh0zsiUyfYCBIf/Zuu46wxCZFS3k7EV3Q5vqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437428; c=relaxed/simple;
	bh=DZTpN/Kyhf4bRkFzUAQGO14hUtawOjNVMmq4AUheIMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChWNpCow77usTzTu4myxT9WgOdIo5/KBe6P10DXxKubNzTmuNB+6z62TogH9b8MxCp89xE3EXQ9YJbDUTXKT3O70b6n7w5ZpaQpX7/4fEK6u0qmFcdNqGwHk+zhgseTCJqGnvaDzRfYrCmJHpyMKi0YAoBfU41/5/qXwo4PtENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gtBKyLFP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gtBKyLFP"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B61DF26D7;
	Thu,  3 Sep 2026 14:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437330;
	bh=DZTpN/Kyhf4bRkFzUAQGO14hUtawOjNVMmq4AUheIMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gtBKyLFPHlGCYwkRafUb3up9btSAP4wM6Lt8d1P7qlHZuOKsU7vArxvwgxO3KjzMa
	 j0yhXGsugiXuent58IH8kjgd0EyWt+RuO7wqmk9ScRFDE4l3DZi7sfQBP2TTzSBa2u
	 6FHqvLXNErKDG/shqBRJk9bB5pn+2D61yDddBt54=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 03 Sep 2026 15:09:53 +0300
Subject: [PATCH 03/10] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-tidss-pre-beagley-v1-3-93928baa8b12@ideasonboard.com>
References: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
In-Reply-To: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DZTpN/Kyhf4bRkFzUAQGO14hUtawOjNVMmq4AUheIMo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqmWOnmJTYMj0YgBALTZI/eS9kKNKF/Lk2QJVe4
 THoGDNqDGeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCapljpwAKCRD6PaqMvJYe
 9a/uD/0U0fOvjSmcdjugqX7cCrroNsuwn1IIfFzxQLKkNJ/LezBqxszDHYa/DJVi140JF9AiDtH
 WTC8AKy8SCfFGEtE+iZpIzYyF45Miq0//NjoAabvcj3OQRGBtauXZL+c/JjKotMdk93nDRK9EGB
 EOlbN1v4Lo7b0HP/72SV7yitlJKsQSOSGUZNEMWAXeSOPd+wN+8ln04mNVuRMgwRyBWiKuYKGam
 Fj8EX2MVtPn6y8jjKCrTpD9JxBbYDrv+kTVgfp7hHTcYRZ3ymqoBOUMVeqi1LlU2EOkaG3427qz
 HlpgZb8GBSKI9ryawL/HwisP40Oa8sTKmt9cbpNN0t61qfnWBU6tU6KTLygbXn8RY2DfgexQMw2
 kFdZUMxOMKoBVOaQdbh4wCnS4SJx3vw8MDE8qSNlOxKvPAe0kCA1lpSYWaChhNroyBnUEPxjKrm
 aGdJko0au3au0E5K7ZjFvIBEozpxnKUlA3xIG2NHUAYgVKsqoJpIyUUGeyZ0FxR23SDWp3BT0vo
 OSw+/KrNq9qmI9/GSewHfucs8jp3AAMWFb8r+KBUo6Daw0++kmn3sm1VtBoOxI3Ski8/ZGfWpc8
 seM84NuMNB4DRA8xpnfqq/iVKVX3SSxdcaz3+HrEfKysgPIqTjvY5oGvVkXhAT2t2yOjY0SQhA8
 vS0XMIbjsul8PZw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On some SoCs the OLDI blocks belong to the same power-domain as the main
DSS block, but on some more recent SoCs the OLDI blocks have a
controllable power-domain.

Add the power-domain to the DT binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
index 8203ec5e5bb3..5dbf1f76dd3f 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -29,6 +29,9 @@ properties:
   clock-names:
     const: serial
 
+  power-domains:
+    maxItems: 1
+
   ti,companion-oldi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.43.0

