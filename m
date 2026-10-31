Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793433222;
	b=Re3o3TtkWKKelbpkGiYZBxmPZpiwO8/+LW708q/uUJy94o2dn/vxNmdqo4fW48v5t7/L
	 6JPuWBrQqG6NZ5FUTCaVqHKqv7HZTL9DF7H4OF5m0AZ4ZDF2qVZFoMGZrlWluTQ3vjRtA
	 RAterE84AucDAk2q44msFigY1Exasxew1Q3OOrIzgOLcwRS01KlXD5Zpnenmcw7cJ8IFS
	 EQAuH3kE6w8tsqld9VsHXjJEseiqVrx4x99HOUEhyZoIcG7Xgra4lteRD5mAjzwZY2wOJ
	 mxhNEGx/hX67KbV97hUnMOwnox3G5Zfz6ntE1VtAPJ6r9wC5xnuphfWSVNzOgk97ZUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RC377F6Q8z5zRhi6tzzOZ9WrBx+Hhd5evmJ+C0Qr7vI=;
	b=hwcSI/Q8WMGbXt4HJBjxzCkST4A1WPo2Cuom/j6Wz1PGLSJtQGPj7SIqYjM0CGgeWTh8
	 j3DUHDXM3K62J2lHFiVy7Hzc/Zv/BWRshRQ20JLe0KD1SHMUmDWlJz2W8z/3rr/tDoDIt
	 nC4/5A6WG5v8PNEkFdGINopmBoZMKhRrwzQt7clVQUIEDTkqzqKkHprKr/OydKWt+cQWW
	 kjVhuCHymxssWRFPOwdMxECbDeHwnS3r3zdkaaIK4eR1dNa6ba5NF7YLE4r6BrUXEt+fM
	 Q+ov6Do8aFR16HL73/h04L3L3NKmuavM6SM41hoIqacuNiAVvn8GRxVex1pRhoWLhlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U88o+8Wf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E454606A31C;
	Sat, 31 Oct 2026 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U88o+8Wf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793433222;
	b=IcrQ8KVv8gQKi1KRFi2mDXk3jOEGXVnoYRVsvbo8bT9hBMEVnom7TGYMVwkaMbi0sc6J
	 hDQWgFlM/5YjRTl68RfAXR20OokRby7E2+4DePkIcNCgEwAzlfxPrn78YynwEk6RXVhdR
	 /BJ3bSi/uJrf1DB+bI6WEWXlPsiyWHYEoxzKrKvmzjeS3ZVUd0kqdHUVpzDOgHCwdLoJu
	 QTA//hOWidhNNuI4S3B/LHP14j1PfkQcj+u/nCljni+1OvdbeNbUn4IHQ1BahCG2bgh5+
	 6A0xVez23O6+JYu8vk4igXpInJmldFFCZRhSU7ecSojfjvdYbSyxm6OYQPdN1LpsqRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793433222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RC377F6Q8z5zRhi6tzzOZ9WrBx+Hhd5evmJ+C0Qr7vI=;
	b=u3vKBM47H1oxpljeWh9xb5YvIvV/nRxQo65Fd1AW079fOv75OKDhotniG7ohqhbUp4xS
	 0gyEomJ3h99t5yg304qpsckVIl9vZBJZxb7QzFu/hgNh1ICTJtYN5yFm1JobSttvNFJsK
	 OzLcR9NXjDUWfWP8wUc9TyJP8BHCEFrZvJnjNFkRYPdYfUBOu8JuTBkB9vb+B3Ep4Q71J
	 lvmyItXfpYRCZ0DP72XwqUr2yayoO0fQaY/gPZZFdBsMYoSvRwxOiDza3A3mTnzwLR6pz
	 QsMrnHvwvBZ1nMb4rJtSYLELmHbX/+HxbHoo86ol/dpFp2GzNRiYHGXJdtyhkmgJK7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACC5F1F00919;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433222;
	bh=RC377F6Q8z5zRhi6tzzOZ9WrBx+Hhd5evmJ+C0Qr7vI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U88o+8WfcJSUR8xIU/27yVby3tojBBaCKbeem1oOLL0oAvgspvNC05cnflw7vo9DX
	 00H1/0i+ZJcN/olknGaDqTzc2OErBxkDrg7vp380mL19HlrVNpFMXZUvokbT8BHEgk
	 33r0ELpXyXF8qmi5SWim16G2Fuv5+4jr8focV/yD0sH/eqMtqNp7H5Qwgsp0nwSm7n
	 HwTiGwXHeBu12CAYmrY+5eG400eAEXE0WXg4fwwGZxAR/IDgcJ0BGTHxMXcdyhsCL1
	 kFS/cgxodeDT+xTR8HIiR7gzTci5teWASbdSruXeYQyboj9YAavTNsGRIropTaJbiS
	 8sAboKkmKTvzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E4B0442F6;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Sat, 31 Oct 2026 13:23:37 +0530
Subject: [PATCH 1/5] dt-bindings: display/msm: dsi-controller-main: Add
 SM7250
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
Message-Id: <20261031-dpu-sm7250-v1-1-159f403ec405@brar.si>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793433218; l=1468;
 i=patches@brar.si; h=from:subject:message-id;
 bh=6SbwGceVC9vKT2xEXfQ+/gx3XJ8s8yaQo74zaxUPzEQ=;
 b=/h9U/cBBx9rgDAzT27cbyYXjoOawQS9Ki4BjMGT4urFWhbTcumBQcszg8SAF3kcmwJndRzW5F
 d+bdSOpPyqrAxBTF33jnMvdAnkf8Hqv6+t1oRc8h/jgHhQSNKrxEWfK
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 DSI controller is the same 6.x hardware as the SM8250 one,
with the same six clocks, so add its compatible next to its SM7150 and
SM8250 siblings in both the compatible list and the six-clock if/then
block. No driver change is needed, the controller is matched through the
generic qcom,mdss-dsi-ctrl fallback.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..d447d7cc1a1e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sm6350-dsi-ctrl
               - qcom,sm6375-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -358,6 +359,7 @@ allOf:
               - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl

-- 
2.56.0


