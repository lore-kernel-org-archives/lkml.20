Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123403B47F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481999; cv=none; b=oLtD6NyHR8w0t7g9ednmYMEz9ZDVblrsUEdjHP+pzvugOfiYbMCsPE6YBQDcVkrrbqTRKT4O4mSwbtBCpLbUqWPbFO0/8SzuSl9YRpYuzTfQenoHxBlazOa2xd4tox1gyGc5+Jy4ugLDk2NxANDyx56nwZtCB2gbCmDPxs690ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481999; c=relaxed/simple;
	bh=dmywluuTLhknLCsh6fks3p6crR7xS3s26oNpw013obU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1mhuoIRm37W4iboqyhgsq2vEryVcgcSzdTBTkDhjV5/9uybEpNvAPaE9bkIF8SSRY/1LsCOGzYE9H5jc3Z0utJTg5yNsVu1tgosgXxLohUfC1WtjvQbcliCe8Dkf1RlCSsL3k2qXQrQBZDo9n/Lz/lc780w461E8qPI0932YqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB/4umTh; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB/4umTh"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so892890a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481997; x=1792086797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=TB/4umThxUL1sslai4KgNU0eIEplZvJlSwypcvxzMfes9ORt/dXEt4NzTovyTvIEgp
         jmKoOzNrbp93u1fb7WLCCHjsnL0iEHHpGX5i6suc5uptYgw2Igu3jXwjwkwc2rexFFkg
         0aoEM8zKj1RUCRLggoD7n0O5gFd/RUEAS6h28QnSfMUvRn1XGvCa6FhoL6Xqdqt3gZL9
         0Rj0XQkpyCcoxStEXn8KGonxKFTas6djbGFIgpHRhEYaKEJVEzy5kB2Vce+7mVXontZY
         B6kg0GdNT91u74RC11qJAl0vIm+ojmdwTo7/NkREc4KWjjAUaAXXqiOH7D0GaDi3dMMh
         hkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481997; x=1792086797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=Kc0JJeytCVdzAJSRI5twAlFGaScNt1oXl46WUvzPkdKhdhN2FjiKFk7gsRwUdrYs+2
         gH92WxaohqFD9hjzwzbLpGvg+N1doUGHk9e+YplmUSFgoZMdnyVNUa86d6mWzmUpc4T+
         SUdiYEy0VEC2zOgFA7U68LH09TghLnzmLVAmtVyYF2ZijBiO/Q+Qqts30c5nv/I12+HH
         ukW7jmkpRp5q5Tj0E6DKKSRr8GP750gykuTN2dloZSEPaZ/0yPgzUFbkVcR+phrIgw3J
         EUOJ1UqQD9aiew12s2R4Gbm28jp0GfjJdeYYhkyXRBVdvKTLaa203vS8T5dZhKnbdhSp
         yllg==
X-Forwarded-Encrypted: i=1; AKwUvBxTp/J719Y7rc6xtTiZCTZpUXJ3dIb2nCK/702qp++EJUJIquC7uOWl7vZySJt489h3v/QQQuB681zQ99o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6OGg352DCnoVmus4zY+BiZmlhRQCWr970eQ+0zGhx8Rkw2juR
	jqSk5+CMZ9QfxvOaxx4yGJ0+lUHTt+056xCr9DP7F4PDpblnl9SdK21p
X-Gm-Gg: AYBFou0ZhwIONRDAmb6UJUUPE4HNWZKM3dlNOcg92bp9gGzI34jzXhhFIE08+t9bRud
	Kr5TSZy27lIY1QwgHUmDbKqV/fntruDQ9krkdgHwQwE8fNgsV0v0B3+cLiXFge1YjHef8Lmj6O3
	LBrYeCdi1qqo6rUFuM9UmvDZL1PeKB5i0kM7Kmf9PkjKnMQ1tkiu9jWZ/0XUqSHSf+tgOC31XoQ
	gjTM1Lknw6EJ9cpQ1fJ4KcC8RddM6hRVrqHsdz9mW1ELYlljhqbyBJgPKVlZz5Rubb47S9LZsKd
	MbYKHtXLq5iDAEPfjB2iO9OAyDOdkC4296aKNJenvKLmda/e36oRDaCB5cae4m85pJ+wiJYZrop
	XEYfTSUD8Q2XRM84FgLO7CPcy3UyfKEVb6ZcMx3UYxY4BBXfX2NKIrqWKDc1rqhrPXck53QU2+U
	gxPfyGDNBcNThRSCEZAoNR/60kiO2rVDwDuDQMf5v1NFHLzGiNKVvd2Bh0XFWRlwxkuPN1
X-Received: by 2002:a17:90a:749:b0:3a8:cb54:e132 with SMTP id 98e67ed59e1d1-3a8cb54e659mr2236926a91.49.1791481997269;
        Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Fri,  9 Oct 2026 01:51:58 +0800
Message-ID: <20261008175225.3375274-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..c434450fd07ff 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,27 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+    then:
+      required:
+        - phy-mode
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

