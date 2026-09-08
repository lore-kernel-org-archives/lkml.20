Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C857EDB2;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883030; cv=none; b=XpppHsYQGzkbpk1PUF/6L5hxnSbKFHElSRkO+9aalQ7T2dJjSIWk/tpJpoG0J9ru0WPBjGVwCkkzz3rx0C8+gM8QjDxM8scDUSK23CJw4xc0Ps1mux1hN4zBLp1PNkbBoyI6IfX4K+YxQpzJNQnH0jfRNXxZRVlqruYO2+lFfpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883030; c=relaxed/simple;
	bh=HXOiia6kvh0ZrH9ueHxWeVpGai2uVznQFbdZS265ors=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXm8afURH4mHsWRusvfR9ueBaMSBs6xbh0zPv2ICV1CDVsksdcRR//gw1cJuw5q47olEjMnBrv1tmkp2rgmW+fJQ4XZMDeQOptNHMmTNeA/9nldhULA0ggwWR8CTe2jdNE4hoxP+DeSPyniEhfxtcA7bE+4jpSWzMLo6zU2/5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfvqOMUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfvqOMUa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 208BFC2BCFF;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788883030;
	bh=HXOiia6kvh0ZrH9ueHxWeVpGai2uVznQFbdZS265ors=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MfvqOMUa0vxNba/kWJF+0neqKolT+WtaZSN8jzrZQ5x/LxmKLL7lX3u6s2jvHriUf
	 vWqTRR4297wGa1eCz3xaJbEN0FyfSaDtGBIuy+/GN00toz4Rrzu2CDkz7xtuC1EUk2
	 yAmLw2scpvwkGRiskTxjtGMUlGfFvYaA/bzNeP2O6z3KOBQPOwHM3474grNoCsN97H
	 XW/L/Qrj52I11x/s3/97KjJUGavHfpw45M2/I4dalSVuSolzvAiexxDunHcjnqEY/R
	 xhOAFBdgPh00WVhE+RM3g0tKdSmNVJNZJekeXv1ckLTIUREP9Z9a26hUoauQNy2kCx
	 HHTMa3CRhhwmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A4DC79FAA;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Tue, 08 Sep 2026 17:56:59 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: panel: novatek,nt36523: add
 the Mi Pad 5 Pro 5G panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-sm8250-xiaomi-enuma-v3-1-0198c3bf954a@dawidwrobel.com>
References: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
In-Reply-To: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=K3PgfeiNwX67+Qu2eA93ZAIdcx9wFeJuCrMiBI+GtWU=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWQtMAhJbrioyc8vGXo064W/+xkz69LOY+7vGGbOD9nDm
 NntOoG9o5SFQYyLQVZMkUUvLWiPVfDL7+9e/A6HmcPKBDKEgYtTACYyYyUjwwJr3qNdmQeFGpn3
 6eV4ykQfEJ+b6fLs6le92hbeJQXi/xh+s4ilbeAsLGuRElnwgtWgTe1tlnWmP7/pF4m07SbKE+M
 5AQ==
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The Xiaomi Mi Pad 5 Pro 5G (enuma) ships the same CSOT panel as the Mi
Pad 5 Pro (elish), so it falls back to the elish compatible. Give it a
device-specific one in front, so a later difference does not need a
device tree change.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index b9300a1f2646..2f3f34d08f29 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -22,6 +22,10 @@ properties:
               - xiaomi,elish-boe-nt36523
               - xiaomi,elish-csot-nt36523
           - const: novatek,nt36523
+      - items:
+          - const: xiaomi,enuma-csot-nt36523
+          - const: xiaomi,elish-csot-nt36523
+          - const: novatek,nt36523
       - items:
           - enum:
               - lenovo,j606f-boe-nt36523w

-- 
2.55.0


