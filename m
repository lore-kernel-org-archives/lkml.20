Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A741836C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241202; cv=none; b=L5SBW4bEjFtQxJ/ZKHn06QV3+mOhwgaNEA+cY3x4gi0sYQEEiFL9d2PfwXhtmPgQEBXs/0Qxi5cUQU6ASiPRIt/qXjRNQ3dP/pemMvwsw7HLbx3OTK3EtgUGa35ydBCG7okMKsdK6hEv0BhWXqe8VkYz5CF4QkZr2Hrr+oSDfP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241202; c=relaxed/simple;
	bh=d+nEjmG2ObASuyRn2vUldl+THGz0eNdKRFlZDvVF09g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frtPcORrMPmv+MX0QB3RJR4iMWgVsEewCyLiCgTAxg6TjdAQOoPpYHjPzeD5vz+HPv7UIpQiaTrHa6sGp6hey56akaYIUvVLv04Hi2XGGv/jY54uP5hCDEZnZ8mue/ToZQorWR8aQGxZR9jOM7gGZxexTN6T9gu1Yi/OQlBKg5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZDiY/H8; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZDiY/H8"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso173768a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241200; x=1791846000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KYnx5M9SIckzrzxm/OntzsZgVfGL+NHQqwQMkKwNaA=;
        b=rZDiY/H8v5NVyTHyElQOxdJN9DfGBY2q88x629TkAn3nnNP6XG+iYYJlgM0W4yrBEk
         on0mpHMHoYvT65e+pKu7Is8aJEZ4mATN2oVV66XHW95QjriCXKYo2GWgFx0ava2h6XeL
         UW6z4M9I2v6VsQv5AVsksCy5DukRCLQqBqIpdVYH4zorAGuHKdwShamkB/GU8Wjx+l60
         SA3w/gkgsqfUSdPjBbTv2A2GIxDxv0GzB6Hy+eymSxDH69dVAvsseb1b+AC3eYFRrLJk
         Cr+VvOD7R2cyAS4lfRoxVn6sgG2K2CJQrRddTckSMHZr5HP6/gfBtaqGx18eCTIs26G5
         ID6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241200; x=1791846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KYnx5M9SIckzrzxm/OntzsZgVfGL+NHQqwQMkKwNaA=;
        b=br4uPizqvbsfrNyuefGdrFX7GQtWy1pFxAIR6t6kCMuX3V6J1QKl0DXl2ESfdauaB1
         51rqiBK9bakFmSOggroPBTlAr0PZCiyOZvhtpdtlMwgjo6HhbuxZEFvjVFAZLsGMtreK
         8ktNE5+NThA1TGd+nIqxXtZu4wVowMyYUWY+EXAaWCxZPTIklNhHBzclgHoMNmdnCPFp
         yooj1PgFNT8/uPfC9d8WAlg5Y/nTjg7OWDny+/FwCuoew2yvMJStmjcyeMChDNeNYSYw
         8b3gZB+ZbAb6zS1bmAjiL/4NGgXMeA0nHGkjSzvcaNeMu7rVkhFVYMOKfiHvkb94BG+L
         XB0A==
X-Forwarded-Encrypted: i=1; AKwUvBw2AvFsQI/iPIKPSQ/X7aXY3UpnLKp0AeaeeZgZb+Ezjs464X1ZNgwOU6t+2OtcjZ7CpvjPwLa4ndJIK+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kHpnJ94aRpt3cBCWedgNsI+5AHTIeoJW7QrYUI7Hk4ZViTB6ne
	5p3H1mad3PTAiY1w3/UQxikH7LtpH5pOICix640pYOwfIgJXtPGBAiMp
X-Gm-Gg: AYBFou3u7Z69hbsQR1gaCk4MrKv4vLmLVg9jEBK0xvFECQ/bM0K28yVA8V2quQI/+CR
	an02fdMA8CDU+ypZ1F114VAHSkCp/9PAMU2d+mm1FLnM3umzuIu1r+0pAsVHPTJ2tQCgiw3DSee
	T7fllsK5swKdsCZfobJGchMesWktEl3ddoHKd5xsf+hxOqZY7z/sbvOn5f2Xgd96cYoibjN+YNC
	KZ33XZNXBAlm6otu2mbPD6V95GxNsRFJ9nNPQINQKa1eg+C20z7lxdrR0sdr1ZePSgeV4LXanPq
	VF/fkOz34wD3FOth9z5fmiXu8qyRieZ92BP8u/vGAlg+QIcNihP0lmQGDk0plox0huOOCGj5mN7
	MREBOoruhMRDoxnF12KEE5O18bfrYtxH9KWAfcYPpsACu3JR9O+u1MHEnc7eu30NlmFxl7QXl3n
	fTp35PqgsmPX/yhOHCYEsAv+yF6wL2GmN70lKTIYHfL8bn86kaXgCFw3lcbACZX2Phwtzt
X-Received: by 2002:a05:6a00:4fc6:b0:886:9078:546 with SMTP id d2e1a72fcca58-88af4b4804emr12417342b3a.26.1791241200320;
        Mon, 05 Oct 2026 16:00:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm4183327b3a.15.2026.10.05.15.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:59:59 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 06:59:43 +0800
Message-ID: <20261005225944.1171574-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005225944.1171574-1-coiaprant@gmail.com>
References: <20261005225944.1171574-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..2f72b83bdd6a9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,14 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +113,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

