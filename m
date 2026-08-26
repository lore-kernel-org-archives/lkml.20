Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644D3F58D9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747801; cv=none; b=fLFSioHksrv5ZrcApUjWKkMGxcYrQ7tFi6yQZMFBVw4ETNaruQLJD0ivjGQUe0kAn+kGphUuPEYtdudSPqsu+4zrjnv+1aRNSXF0XPgKErQ32DcQzXwQuzGwJJi0Uth+vBPy0f3vqmphIHltQbFr3a83Pno4afRB1EtP6XTPEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747801; c=relaxed/simple;
	bh=39cuXfdfai3x2o9ivWHSxZIa8pSWnI/ihkiawNHpzqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+AEyMcQE3++CbwJ9ZrkoZG36FRlsDWfXCi99BJOqsacxBTOoWuAYbiEjLi8Md3zq/kt+lFFp85H0JA+c73U0E4YMp159RuHAA8+kwljy5PtXKibDjJqrkV0gJpTV3WTKnO8HN2mp9Jsvcg/0zIQjWOQWCUujWBfsEK8/njxfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNIGqhYs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNIGqhYs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49978908b35so5785675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747798; x=1788352598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h15otk3ApxPlz7+e1yUXssJQT/RaXRzBb1z7TnhPPnQ=;
        b=kNIGqhYs558eFfh1nfV74NKICxXOk/tKroBIaoKh34uhHg5CBZg5P+3ZfGRq0zp3wV
         2vQlhOlXTdXy6yNuL0iK1ZvENoBUkEx+pKprDsDz7sfgrc758Rw0It+jhU26NkCXgryY
         GKBqCZWZvL+KT1Uo8AchGODEMateflliqCK9sdwGsip/RKBICBcJ93CVvTD8qL2HzKxP
         abOTkAY9TIlqLM/5q6NU90FZ6ZmkRCs8gR+qxXNeZLKBfWVxAqJ6Yg/lxf8dBPNaZDCi
         A5s6AW60AZd9bqSMVLn0PqlmWqZbBtYPXaBwentl1VI++zdKbL5vYeryEt1XA4b6Md/D
         +Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747798; x=1788352598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h15otk3ApxPlz7+e1yUXssJQT/RaXRzBb1z7TnhPPnQ=;
        b=iee0irEogOJlTRMIhiUd6NMSAJJUyOwOdSnN1+2bn635XAAERXf66CDr156AzhEvXA
         Vw4L+jxZxvlzIxFlZa5fjQnjx2UeAP9VN6d+dybyiE2gElV3lohXgS53XDM7o4q2UTDB
         OhLg/bHcWpUyXn2EpBzs9cCtGnrd75WdxN2lHcCYXzWbZCdOfvgpPPcuW+Ez/FIxykSr
         9gXgqCQTdy9pDJmiGmcq2RWOhBSLfy0B4/4kkfwKLG3TPQN/33lfsbujenAhmDYXxt+o
         rLBg688h84AU2HJjdCM4RmEIkrBCwX28Fw4iRs4ygjxSwHNiEVMBTRePnfcCAM6kPe7d
         XP7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8HUwbbfb+GVG5a5vmuh4bS6eryu7jNs1gldtPj3wyh1UfWz6md1PyKifL+wGgtdA0/ki8e+Ozf3bxia0=@vger.kernel.org
X-Gm-Message-State: AFuF++mB0/gFJCPHVStoxB8IlzbILBbORg/39VnMDlyijSYiydNdiLcr
	mvOTbJAWNrr+UuTqdvsV5pXBLzrNkZojcL44CKR9sxF+9YY/tnPsNZU/5QjUnw==
X-Gm-Gg: AR+sD13DSb5sdLKn82/jqLiEmnxL07YGAqDHbDf52wAcFv9l0WGnMLZxhxWiKJF5HFr
	u3WzIX1eqtKhOUuZg7rV0K/l1DQzIW1YlR63CS+r/Ht26m7RDlOD1TAQDMBYdQ8Po1hfbEQl6in
	KvehZ0/l2VdAocf971BTgcGNDwHA5W2w+UiLUR0++bELSa2dn/liRfwSxGWXK6dUtJ+umc4sLAI
	VmOWvTm7nzWb5EB2iW/l6UaMyjPdXnUIPXXuLW8OthMULCiVSyBQrK6QNoGofxjlckEJO5b0xkZ
	VboHcLfLd01cqS7ETDtBJHYwH4+BrLUkVndfByVLC2x1GzhGJH1eV1KbFoD4zKYmOn+BYeDZqCm
	/l0G+WGkYjJlFj6daWWREsxdHADIpd5HGY0w0jjr2ta9JUJWlZLUOjC/vTEkSyfTb4LezRwnbp3
	BJGnTkM9rDZ4TmTxAXpOn8smrigIZt4UcM/0/GubdiZiXN0VJX3qVJIt0ihWiYLBMHELD2GeGBr
	WtPrVH4cHtof3jzBAZ7ycl3sBcEgpMtva+lh30m6+mG+uE=
X-Received: by 2002:a05:600c:4f55:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-499dc720beamr60889245e9.11.1787747797933;
        Wed, 26 Aug 2026 05:36:37 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:37 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Wed, 26 Aug 2026 14:33:49 +0200
Subject: [PATCH 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
In-Reply-To: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=995;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=39cuXfdfai3x2o9ivWHSxZIa8pSWnI/ihkiawNHpzqs=;
 b=iZynIZGdWCEmQV/WG7vShRwpR0bcPUXqeWta922VAcZxqHnUei8WHxNkN9GrcPAI7U/Trm/yZ
 JmiSpCp/597Cqv+EyunJrWOvfHd4hoLMDMSZ8zHBmKoYZX5tAfF6CDQ
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 8bfad0fca3b7..1898f3787a98 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
+              - rockchip,rk3576-mipi-csi2
               - rockchip,rk3588-mipi-csi2
           - const: rockchip,rk3568-mipi-csi2
 

-- 
2.43.0

