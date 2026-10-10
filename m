Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8F4A9D5A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637246; cv=none; b=XHKqNryseyfUI+QjBxKniMp6XtYAiAkOy/SvLEhVya700yIXE3yp2v39W7FeaCRLQoIOayPWZ9UV6O36Za2kvAsw7B/KtqZcogQ7eWKQlzmllNkPrPSIaAFUIJaAMldNP3JccOIrMlqgvRE7GUJapoGu0xloakEcY0X3P2hsyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637246; c=relaxed/simple;
	bh=l0IL040uUXd6HnZJzpcP07Y63JwiJBJhiCQQdbR6inU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KffN8MhuPzLac/7CRQHviYBnM2TjPY1PHNg2XHnN1yIblyOtWps3ebpqvyJK4kfkfkBRTsL6Rhh6CNw3qPSJhzqu2r1d2jrscXb+9+L+lyPK2rFhRALwf/8vb5LfRR+IhUBbF5HiIEgMnYSnNn4BhL3CbQdQFuRF4Nbx3/NJVis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSunAND7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSunAND7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso323495f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=iSunAND7RtYtirz8xNVyyXiyIPZic1mOCOKV8tbLfDUCKv+b+xKUWgTNWPGx+0Efx/
         rpQ4A+iitRW3sKuAKquifKUUOEAuKoHdmwqmI4G8A4cbMau33PTbV3b7mkbPg3hYj9Gd
         qMiLpr8nr7+kB+7UYZq/P+EUZ1wqp6yzyCe5xWhOQdeuDrEuThpJ6J/MfjjO7IC2MK/b
         AeH5saSYkFxhGtNoL/bIuRltw+GpVLB2J9A0F2k6vLBIUtkgb3qf7axHVVUqEfenr30r
         JaJHrIx1PS2ebv+1gkVnIn6v6xr0GemKk015yToBX8o2x9lrZYkKTC8Si05nuvCat7Px
         I73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=jpTttNC36lwUWkQH6okyRB/3YelcX9+V2Dzm3DVuRUXT/8lrjoqxgSJ+m/DA5FvmYJ
         TYaXUyFigPJxCFEKPxnEV7ytwzc284nP1xKjXFH6DWgP3VUruHoVDqUtwx9bMcbksYBH
         cVcCclOuLfc01/+WF0tTeD7cF4BzcmuP8hZyJkEQN7hXAPz23XKnUCrntzFwKnuqdP3g
         dkEpul1i9C8OlsWVgjRLZ0o2IryoIL9qY0QNUM/Zq8Qaq9UGRd4xGSyMT+4Re8BurN8u
         eNZarSrPyt7SlveCo0QyLugcl0aHp5pH+q4YV4mrwYTotvbmCH2RaDKmyl1dhXNY4+dt
         4gBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3YQ8mDGL+aiEGgP2+0Wf4TJY8gPicfU5Z4ZKnhXklT30tJrv1OdJzz0rcEUTxyU4YbYmrC82xNCal7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOZrfp3F25A4kqHbGMu2tXTB94FFHmX+QzyzZ0O998lwRZmH8c
	87aNCpihyb6+pdgnWpwpheto71poAw6N4CYEHETop8qUzSN5Zkt9QtyI
X-Gm-Gg: AYBFou0dtd7jlpDqv4J3uCpv+DHc/Kc6VyRgrIEBGonF+4I4I+jTf9T9j5Po32mOM5q
	etgRQH+H1uAZZOu4o1zBtWHw0egL2cDJ7zmOjivYbIM2CiBBjnOD4leigavZWKmYBz4oK9dp2Ub
	k6TPLhVxs9VB0i+Sr3WgL1Vw0O6seee94WTr6OOb+nA9Tl34NCkCC2k5SgLp5jICIK8/dIbOGDp
	ZXVSV9rh71QnV4CVFT4D+d3Stv88cNog8AYNyasNHA4DPZ47uCBxy8eIt/H1B8wd4lLDCZdKWbd
	29J/ebvPYEhhbHsEZSO6055ftsJZk7cYl1r5w48DWjKvp393jwzRMsI3uS7eDTLbjO+lA3Y0TtJ
	WKryVCdW2ztaODjued5LbS3PsxVuQVuNGemPLes2OYbYJEO2uXmGnTv8jS8I7RTXV9SX3ixOpp9
	d/3HMBqlgdp6G9eu2zAa0716VgzCltQVW4SkTLb/lnL3ZdBX3q3VzIu+Z1fFFIdQ2o5I+fs4Z9o
	flrhJNqQ4UT/hph4ibKo/KXc1wF885ZkrlAAmgY2PgOHXnIbPyCoL8gjWDGe9f61+EYrvzDX7JM
	/PM/p+1Nc+hSwq6b/Jn7/wob/RE+g9Xnj3sYmQK4J1XRo81gcvhLBM+YVcAZ/g==
X-Received: by 2002:a05:600c:8117:b0:4a1:6d21:93c1 with SMTP id 5b1f17b1804b1-4a18e4b1613mr85591995e9.16.1791637239431;
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 10/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Sat, 10 Oct 2026 13:59:48 +0100
Message-ID: <20261010130024.177503-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0

