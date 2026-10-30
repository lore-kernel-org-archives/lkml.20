Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342981;
	b=wKeK6iI2iOD4pZhJ17Y+H7gIeLt5Z8kln4B6DqPonbvhTVzKa5UzHO3hiv0AODUHa284
	 OP+XRbk245uBFVAidwA4tOvp+cZblBvINtjWHkkNe1ezlae7uTe3lsgiwyfdRy/Qxm7Ix
	 XovP69rFkpOB+97wZHYhtRmNecTNfWbsQC9LQ4pK8RMOOMa03WX928Q14McR4nfOAPTs4
	 btItNmXBj9PKeTOk0TmLyHAJIPPwfa3IL18MM0RLB9rRQm897RIIXjIge4rsHqaz0nWwn
	 sMfgfOyZsHpg8MHC1177ahR80UHhBhMZPmsUEdneIO7zfGfJ1b5qSucjbtmpTlRlLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342981;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=9sahrKizZzwz9gGVNC8YVWNEiDeaCi+DVsOpzdhg+so=;
	b=pgw6rtb1fyI8tEzMnbrRyh1Raajl0puhuppBACc20fUxTa9vw5wJ/aHE/TGtZoavkCmC
	 fKkvof8aky/bE1MlGh85luN+ZjI/8GoK9p2DQaE6l/NnA3aEjVZRhfJrEjZIFtfkNVVmL
	 Afo65wIuRb4a4QDQqqc5pbhNg8qEuVbZGptDqtDllEyAtMAAtFRVvZY06l8+FGK5kZJj3
	 uVG3s066tNSb8zvx8VwiDeTi4lnwmLXIBtsmu5zZdWNtBcwU6xi37RpVj4bibUj8HoP0T
	 snZsvUWv3q35zkpAuQQCWhbDb4nC/jzD/XJfLrk5+H1gYVs1OUEb5roP5Lk/1Nkl+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=b86PGyyn;
	arc=none smtp.remote-ip=154.81.10.144
Received: from mail-m10144.netease.com (mail-m10144.netease.com [154.81.10.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B439606A31E;
	Fri, 30 Oct 2026 06:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B439606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=b86PGyyn
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796915;
	Fri, 30 Oct 2026 14:49:27 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 1/6] dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
Date: Fri, 30 Oct 2026 14:49:00 +0800
Message-Id: <20261030064905.2248999-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa18b920f4503a8kunme14bef99793df
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUJOSlYdSBhOGU9OQ0
	pJHxpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=b86PGyynkEQltAc3JvkAN9NzXPO4oqeWRkwkQlEFkLjBGbQU3sjxYcHiRUDcLYpZvXjEG3k3A7zJwdhtfstX0mVHWtA/G9lxFSIGZdLqKpzF2OOAKjpnKbC819RBjkqw0YOoxC+le2BUMiZEF4U67vhzl717t/9U2JDJGwixu2A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9sahrKizZzwz9gGVNC8YVWNEiDeaCi+DVsOpzdhg+so=;
	h=date:mime-version:subject:message-id:from;

Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
resets, but unlike them it does not use GRF registers, so make the
"rockchip,grf" property conditional on the SoC.

Also document the avdd-0v9 and avdd-1v8 supplies, which are needed by
the RK3568 eDP controller.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Restrict the avdd-0v9 and avdd-1v8 supplies to the RK3568 compatible.
---
 .../rockchip/rockchip,analogix-dp.yaml        | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 39dafe75a680..05b582a864f4 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3568-edp
       - rockchip,rk3576-edp
       - rockchip,rk3588-edp
 
@@ -47,6 +48,16 @@ properties:
       - const: dp
       - const: apb
 
+  avdd-0v9-supply:
+    description:
+      A 0.9V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
+  avdd-1v8-supply:
+    description:
+      A 1.8V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -61,11 +72,25 @@ required:
   - clock-names
   - resets
   - reset-names
-  - rockchip,grf
 
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-edp
+    then:
+      properties:
+        rockchip,grf: false
+    else:
+      properties:
+        avdd-0v9-supply: false
+        avdd-1v8-supply: false
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -100,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-edp
               - rockchip,rk3576-edp
               - rockchip,rk3588-edp
     then:
-- 
2.34.1

