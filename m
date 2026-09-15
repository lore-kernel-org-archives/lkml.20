Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548647F2EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469013; cv=none; b=TpCDoMCVgIp7O8SzkwWknq9U9qVPGVSv3iDhbP4yCJZd80Tk4EJcrBEai1pqE9bMNyDq0u5khRvMQD4BWf2hnyP15xSheEN8PKr1Z/aRhvM9H2SGNFm8HCoyfsngXaSe45+bdSualKvBJlMMtXoiMGwaH0I6J5VLzNxYcCPahHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469013; c=relaxed/simple;
	bh=OT1ITsHPctK+L8lx0K+iSmC/XdR3PBM/mhi/vcMFiXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmbOBXpU33huM0cqNBXfo4m5r0ZNLbWlhOlkkvsa3eeToEF/RhPeLxgfAztSDnBLioxhvwXmpjm4dLzwzzbGs+RaFwMEjNbgYzF2yO+1F55NdulfMdSWGvyuJdunSSOgvS9tTxPFGEodvpVBsnFUlNt/WZ7LzX+1w/RRgq1Tjic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsHWKY0p; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsHWKY0p"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so1155345e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=PsHWKY0pZ2AwN0dOvcRrD3uDDyBCeGAP914c77810svfJgGWe07HBFgV4Bb7sIKb82
         OKBNaV/1FJN95cevCTZxdQSLy2pernV24fYj8xjAQ7IiYvTTDtNW7BFX2nVnAwWDQR/r
         BVqYm5oTlR801jxkhYfRE7X0l4u1imqU6yWM0azMLWneK0ge7le2GBisLcRmsbZaCmKn
         C0fVfUbfFC375K7vFwAdp3+apYS3JKzhzuVY9NMifcFkTPCXHlt4ug3ysuovb/3XTT55
         VBIA5NhuF5DrrSUg8nUsz64+qlOohThqr85mGYlRM0bV/BI/SQhzt6ZT7Q9+/UO+ZGqO
         QJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=KQjZ67pkkFMcWIKZo1fyNriWu/p4OGZzmgLQmAdwi+O0ZWhbmEE4bpKGUYGoyNFbUu
         ZF7PVtQt+zSmUtvkyjtmpN5d/DN5MVenYk2G1KYDKgwZikCSWdOGOhhg/Dho2ctI0y6c
         hIq8PtM3bXutpr1Tgp7gQUKwYCVa9/ib6P2GkS9LXccx0WoMyDzCUlsSla/hh4vNS/LZ
         slxkpnyKVajkCb+ZvHz1AP3H7TC3AitQU5PXonf1IKvImTk/tLLJ+4dIkW+kkgfA6YCG
         aFMJKQ/Oj1p/yst4bkW2SCUIWTq89KrrhIfS1C/V7uFw+FqVKt2wb5zkqPG89zzpv46+
         wqAg==
X-Forwarded-Encrypted: i=1; AKwUvBwh4xbdL9NVSrw7KT0Z4+9h5SIKU/1IVRJkto5q/elf4wPK4Kb1mF+v2WNFYLNZXkwf2T+3vEmKFfMdgag=@vger.kernel.org
X-Gm-Message-State: AFuF++nLKU5FXiTvG2Rd/5U0AiwK0VNwL87qhWy+5Y48KaJVCiSFkIbU
	Y1nZolSAyFjb8jQxkAhBPNH8CLR1x49t7H5lrbqH1tm9OdQXEjSQoRSl
X-Gm-Gg: AYBFou045OoJffLXuS12tskcgRDBfu66/nr0khPLOA8A/kl51XTqGBd/NSr8mVpkO/A
	tLM5tBKOkGlfycmEO4QMKTc5EnBSm9EwOHVQ2y5Jua0ewm9R1l89GlIYRojQ1OhVXF3wL3ZFqMc
	Z9hPrRJfOzFJkn0YeMT4Rab8yON3+0IcLo6NRkW4auDQw0vjiZuMdkHIz6AOF+tEne5HUCO+As8
	zX0EAfX6C4jeno08MaCWC/emLqmqUe8Bcpl5fQplXam1b0Nq1+pABkUeMaTR0WeOJePj0ZCjHRB
	t5RaJJqE9RfOG4bZFKoWIDuRtCWQHtimcVAFY6vqUcJ/LprzYX152QuYPpZZsaalDDTQQ6BEC1F
	oGtsSVNViKTN9okRWgXXKtsSNLXdUclUeOUdzVrhu42ueiJ6hr2IVpaaqdWE645MbRzqrjbNZip
	91L23mvtBQCrqeryo8tKwtqcbDoPJfhLdmCPUBZUrdUW1lO466bb2tu+oVITwvCLjH5Vr5o/enT
	ONfwLofDtr4OgHGkUjIZ8xgmIg1nw7/nZxnvvwYFKy6n1sDP4ctBqm/EaJCxR084sOZ
X-Received: by 2002:a05:600c:4743:b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49e82257f4bmr8382775e9.18.1789469009197;
        Tue, 15 Sep 2026 03:43:29 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:46 +0200
Subject: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=963;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=OT1ITsHPctK+L8lx0K+iSmC/XdR3PBM/mhi/vcMFiXs=;
 b=xHW4ID866vtDzWpfHwdm1uVBYofPXy1A+IXn6A13CkcRw1xUF5qIJUH44laHofEaIxFhmo/Ls
 upqPyAcWXRQCvLqafGXxKHmCv/ihMy2SrzCuxJoYmPH/nvS2amffFBs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Document the syscon compatible for the General Register Files of the
RK3576 MIPI CSI-2 DPHYs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..e94c83d7c138 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-csidphy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf

-- 
2.43.0

