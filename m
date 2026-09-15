Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243649DBBE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473410; cv=none; b=NLDaVdC8wFmI4Rem6B38iK5bcy3IQpsfgRKZ3gGeE9GJaELVJBqlDOPHkGc0ZaTz1NeI0LA/0dYpPM1+ty1nWfaSbse6ZZvb6AIPPDEVCoOwrTOYVgjVDxUwljW1u4Z04QA3GDhkpHv3wIt8vws0plLKhP8bQxrvWVn+fcRH2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473410; c=relaxed/simple;
	bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BzpoAXMYvc2utoYkPmtXLSnU0aWn+FZzJpjUq1e4udqp2oP3NtM5km6Ap4XyalG1VCLVrJywhCVHTTSZnhR/M0eSNkHz6XEDMKA+w/k0NYhkVwVlOaYrzZJ4wEtwSAcbDf/7L3ArVG6mDVm0/sd1f8sVzIpxn2cBOn+/2RgJ9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbNUilRB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbNUilRB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so2340835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473406; x=1790078206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=qbNUilRBfx2vJPP8G20CKAJ7eBDm63tFaKm3cDhBIt0RfCZL2vRSH2nsF6E8Cia2D0
         kO7KbJOdhpGIZEcgAI1RoxzlABD7aV3/UeI6Uek4jgm00TpRJUPiliYzyeOQpgZinRaT
         4u4d6QpBsSc3SdrEuKGUBfdeg7lyBrOqoONXxog/EwNmb7Yb8I2awK4pHFGvUmqrqEYs
         S2dIyd3UAcxAjILTsLnY6vXiyQKnNUBXPcR8fyn0bKDONkv8py4toI1sKuXT6eBxCkkX
         GvszUpx8RSUqpuOBN/tQWgpVbTH81QMsH8BTr8Ym1rWZzT/nIQjt49XcNebQOnAFuAC8
         t0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473406; x=1790078206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=Z8Qdckb0wJq+00f0aitvoCReQxhb1/XH5wGOAiX/MXdd43B2njUktwJF9xN8/SoAQA
         ZW/S32XjNSCYxzWqXlIHf/9T4tTXF8D/Zg5gCYUAfGdkRgadPP6bM+ACc5W5bMINsKyp
         VNryLvCwnQtwU5zHEuhseMCi6W2v9/xZMuPWuiaCvduOj3OJZD6bm/vZu3JC3K7E5Hy8
         bcNWtbyTboX1Nj0gw9B4UbG7YiR5Y56cYm2xaYU80hnrQ/dXAD2qTg2+KgSfd+O5MiqT
         3832LP+a4GTbKVFxvTQngDw40Bfb8ucCaO40ebwHbIvHCLMQZXb2BVA6RgtsjSqmQY24
         ++Wg==
X-Forwarded-Encrypted: i=1; AKwUvBx6kvUs5iZwq+Fnq+wpllSnCgd4zxfVRbW9pNTDXeK/4G7CkWGHyASh4NDv3/0FJ6uGqf3RxCYNNlEVVfk=@vger.kernel.org
X-Gm-Message-State: AFuF++nZo/BDOpRBVCEbO/ubbt5/frjv+0jK65RE4FDoo3BO7yaN4F9H
	pJqkOeKdV0eY69SRVMlS+DQpEEKoBbri9vyGu5xJiC80k+Ss/F8a8oBl
X-Gm-Gg: AYBFou08Xn77Ka8EzyYbb82Oor2Hnl5lJfVXvGQ1rcR6d3Lw29+Y1sPWmwOuG5CvK8c
	DvHuVnupTU7S8y9LZA6Bf7VQ1V3uh2g/ZwLzltemhTN9ytA97lvTno/30r4DA73oN0n36RRvUAY
	KY+9vheKyavsTo/nZfw5oKD7QkRBoAlDmwXENBrgLqncx5/kV3k6CnxqcCcOQTmR6eXaRlw8lBV
	P/2gnKfr+kDy75hEyyxkTcGm0WV+DoCbOxP7R1DX4qY7vsymBn/5xxCbN4T+f6Hug3MghpuUuWc
	6OVTpMdke8FhXp7fZmT2UZVH5HmXRhhW337OH/jnuB/v0+Us0SKLXp4wS1mMTCdo5sdm1rq3MB3
	pL+TZnXuCdqG5D+o9WOgYquGc7J/AZW45eCwUpPyX5eHjTDvRBBscJJ3wg0EHnEicC3vNB1RqWx
	7JroYOfmZ5/rSkO588shBRAtTBlr806QYrSIHhBOqRmD7+ovP5rlGJEGiy+48oCUaFSDTpioXd5
	kB2b2shV4PD0YZIjP/bHNhOgNTlO9TEWWAjK9L/DvYEKNlzuG0UH7syPf45hrBkAHE=
X-Received: by 2002:a05:600c:4e51:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49e822a63ffmr11750555e9.29.1789473405919;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:40 +0200
Subject: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-1-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=1108;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
 b=U/+xcpmDD44TQLOMhpTWGOwHvugHp+qVjCLKGJpJc12iRo2mVKucsEvPRwhvI7BINPCfkaRtm
 ERXc22c4d6aC02BGFdZ1GwYSFiZhhii8gTNoE53pdNPf+ra6wSiiQVc
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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

