Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793433222;
	b=gIXEYRHQ/YDTdDT/GCfpx3p8+dpf6DUmTrqQK+iLv5VJdAZT/eIbC7XhfZuFvLipKoMz
	 DII3PyCo5XFS1LRQMGXtdhveKPnaTJoelOR6HMBJ1XA62FkGwRy2/L14Ls3HiF0p7JVR6
	 84RkcTC+gmvwaApXFX2osTZTBzyh4inobGBCpD+07l+iBz5/q1cq3DIrj7Ke0cLGn9WxE
	 KTjuAo9JNud7iRg9Xpv/IZEnd5k6Wvh1cC0Efp0bjIl/yWjpX4K0rN0IKsDAzM9COPxKF
	 ofhj24eqa4B8j48sctjNSXHvUstD6EWmNALZiBlqDx3MHpjIoboBgTwBiT+1f0j4W9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LzwTx5Bulr/nrBki91Vm3EDodkn3zFz3xSqfuqJXLrU=;
	b=YAt4RAlzB2oNNJarZMhNDd9PaI0Np/mG1VcnfTuTAqXu62JbALgCjdhG9NAisiRarwLR
	 BeRdUI3RhQ3Hd4G7HLu9upTEVXuEK5YYxdjGtBwdKbjKqpKQUEFCLt4s13dJhQNbb8eOj
	 8QsHwbBxRHKQ3SZLt8njt4HRs/V2jC+EFeLACn3Hy/2x+WCJ0roupc8dFlm2iesjVMZHH
	 X+JOajFSVWXJDnr9QyrtivJ4ujpfcTIKethl4s1t0/89p08F3Up/Vgl3l+IZCa/L+kxgQ
	 EWeEnSV/FB8RUkN5mP98eVQ2aCPW9oq83Rh+e9DHk24AsmP7yANGgl+XUMpad1BYDUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VeMs6e/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203F606A320;
	Sat, 31 Oct 2026 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VeMs6e/P
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793433222;
	b=RCFalrWZzwC8OQuIxmI4JtFZQxPImSEmY7vkU/d0KWfeN4m/J63z4+YeuGOAK59SiJAU
	 iVD2NhEua+y9I9035iVhhun3vV0VaHDiXNBFqQbC3niiu633iW/BQanlCuwdukkhg5RxK
	 7ZyGtx2c7qsMe6PZvU9jf3jrFdTA6XepNYhShAo1rxUaCJ7YtxSmOEStk2Tenp3WNKLMG
	 1aEj/WoFPcq/4MRdSXotKT0dG+HI36AYpFwhiGsh9jsUwRgdCGqlnKD0kB78QcGEsDEpy
	 OIMvFluOlgr2f8in4lQnEE+6ilRxG44FB8xOevQUba0mjITPpNHX6mfI62CSPKduY1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793433222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LzwTx5Bulr/nrBki91Vm3EDodkn3zFz3xSqfuqJXLrU=;
	b=dRld0+7Xbg28KbinyQhIRRvyBlFn1y9K+XKjmzw+WjZiHnb4TXRtevg3dohT3dZcenm9
	 upDICcNS+pNF0zri8VzUb4N/2rQD6SlHkiHb++BIB5kF5fHZv5ypIEuEnk2f3myMUQB0T
	 qCwPlCR3dCAFzPhuPEbdgqUdjtOwmpt7Ss1XUUXFN77boidPddtnZ7jdUWAQZpn86CaQJ
	 mkQQXU7ATcAaSX13I9TpIs8uWkdvicEmsL+/sdDc5ihT0s9EMklXOzTP9V6IV+gD95Cn3
	 qSHJapTukuCQ9TevCdng/R8k9y2hqNGjAQFb9iW+hC9l+b289W2/KzXedwBGDv7pQOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B90111F00A18;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433222;
	bh=LzwTx5Bulr/nrBki91Vm3EDodkn3zFz3xSqfuqJXLrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VeMs6e/Pbh4598UkiGsBEy/vv6U1DmP2vua3uuUhpUpMvE3Or25rKFB8SZImRZRU8
	 9fOSXhEQUw2mVJndAhSTYTELjgFVdLEMN9RT8TE5dQ7wHbPpjvVPfam3WL7MHBw4vN
	 24+Pev+VeCpDd/oiwOaUyJ7IJfzrYDQkcIyWd1lv+P3PFldpPRTi/KnQQEC1PlLqX8
	 /iRhB6PWJZ+NtnSAoagypIs8pNhU5kNIQJtX2OztYfwNgczlSEb2FGyUvE2VRp66c6
	 4KIMkljnujtXiUJtS7Y0/XJe1zSQ/YDdPH3hw0AAy/t6JvqhslTaChiiKOke8JG3uu
	 hXw3TiLTg1eHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4983444B45;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Sat, 31 Oct 2026 13:23:38 +0530
Subject: [PATCH 2/5] dt-bindings: display/msm: dpu: Document SM7250
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261031-dpu-sm7250-v1-2-159f403ec405@brar.si>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
In-Reply-To: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793433218; l=1025;
 i=patches@brar.si; h=from:subject:message-id;
 bh=jNRne+T5TGHiLh6XT+g5uA/MzROZisRFWcFsqwWvKA0=;
 b=5E0KLCkUdM8e1q0zy2UQ/f4e+Hc9+wMor03N7R/MTw5Q9SZSdw4ZzoiuCm3RodBRENCisgfJS
 Xg+F+rESVFTCGUKHJpxElU8h4Sz+JaARysiUo1qVhM7YEZ8NYbWOb2B
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 DPU node has the same register regions (mdp, vbif) and the
same four clocks (iface, bus, core, vsync) as the SM8150 and SM8250
ones, so add its compatible to the existing qcom,sm8150-dpu.yaml
instead of creating a new schema. qcom,sm7150-dpu.yaml is not a fit, it
describes six clocks including rot and lut.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
index a88d22f30a60..d779d3008c1f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sm7250-dpu
       - qcom,sm8150-dpu
       - qcom,sm8250-dpu
 

-- 
2.56.0


