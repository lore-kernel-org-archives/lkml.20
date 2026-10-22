Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646836;
	b=KMMthwt2wZWIlEserwObLgWh6te8s7GP6fodMAMFS7b9qjE70zcbWM/Jy4f0y0dX7HNy
	 bnr0GquQ5z4ySpTF3t5JNYCrqpzvQi5yaJx1U2um3FcnkrgcGqDV7l+/xMob70HIRHLWM
	 L82eeZyAwY+Hu0Dzb3es0kdwjvWowdT94NZ2+aAk3UZxJVzSbpi3YGop2YyWcDB3Lztbf
	 6ALvbZhZCnQoxXH71lPtSLFQRaO76lC3rOHM1CI0x1cIXXR7mCSdmL9uMi4AN9KimKE+H
	 1q98mu7QXLigI/28v/IRHknvjU9px4CpMG/YevMS35ZMWBrKjBCNh/j/Tz7vcyorm8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646836;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=;
	b=f+jdlI4IyV3jdOykGYuXupQsA/94Dz1RLOPni5/Zz8ovmeOXw1Cvu3zg9BevnAj/kZtY
	 YALfZ3hXQIm4DaF4U99ifYeXeKzu/e4T7CndLWIyN+eEZvILXg8L5btftyANvv/OOckjg
	 PTWhitWPTkeT/Uj1m3ott96wM9hhEZXXWgJDyG6emiPyZtOt+H6S7bTxVROkHufhNe4Ru
	 ORS40bAwCDyQUj07CjYYGYacBka9J8MQkCCKEOfXcrHiXHYtgfNORJgAmj8EXyk63yJ76
	 2igcV21wjeOBteYYjXiLzWBFBfOlXsDmMA83WnROZ/fl/sSbkYo5Z/X3GQObXWFs4Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfbUa9Xo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96F606A326;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfbUa9Xo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646835;
	b=yJ8b92t2dfVcwJyVZYfscArjakB7TKDQR8Oms7Jc/XrqTWGT2q+phN3gi9Ww3QfQxy2Q
	 UHRy57BEwVfagTD9ZWkyOZS+MFuupfzY2ogzTCRbQaF3nQE+SU1e2QSfhdsXmXh1oRdLf
	 mLMZ11Sst1v9MDsX3WxlQ6x/JV38fWUNQQdsdgl2ltTqhE4AQiLQg3k/VkYftbha4Cyq9
	 mw9UDjOAJb/ObQ2LH2S5gfbjqbErh+FrZKVsmIOelLM5Q95eU9PnwQQd9ZLnv1OH+Fb+R
	 sJpIO45FvF2wuJdAOj8WF8N86kXuQZXSHFoGPH2WqqL63ZG0uHAphEiCJcn8w5RdUgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=;
	b=AE3SIy/PF6QMkpzAKcmLFqWUvm3jxFbnmah3NP2kODcQawcXEv7dkU5sQMOWOhniEGLe
	 qSb7QixUQv4HzN9rVIc82ILfVyp76td11/uwVxP20vbSJENA6AAVg5ZlpzJexR5YTHwpJ
	 4A5/XrcyJO5lfZ6jytqg3rL1SAkKoZikCxw2G3dap/Tp7dJ+IXH47ksFFMBGdWiGUVysx
	 GkEqyAn7WVQFrZ9cbVhAPsGevNBeTMP7QmlV/i3N0Atx+35zFOa5SP0y8MNmkqGv5/BIz
	 6y+maqg1/Gl5Uy03Kna3bFFlcDyJthOniM+ZlikCz2Csr+LCJUKZxN3bhaAobQ3zxGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EA221F000C7;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646835;
	bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cfbUa9XofeTo+VwlJ4XB8bpSIPwvL2leJd9F0/uZnVoiviXcXfEQ2cicpRDFEG1Uu
	 0FhCBrj+YGH4rgfhys69Klv4MqczNCqCNF6Gtjg+0OKf+363NlYwV35d0i+2iS8AkB
	 aGrIPjJO1CXSSSAHybETqkd+P54jC9459FPPsHB4AWnb2dE3PqIW34+8U/xBKNyGiP
	 PahyvNYNIFFnT3DMQleOS9udszwgjAq8XRm8nXr5IFHFiHwFvJXZsmmMSoT+31Guvy
	 KIb7o1yv8HdX2MSCs+gSELK1MS2amQr8wYzEiqQ7imM1LiPu05ycUzSMXGP1TTFPwb
	 BM1mRIFzs4iOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 68E49434F5;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:04 +0800
Subject: [PATCH v12 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
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
Message-Id: <20261022-b4-s4-vdec-upstream-v12-6-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=804;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=jy4Yg5jIEfBQ0Of5AkFH35FisWSScmDdCtmBHrd0ZtU=;
 b=81ZMAudXKWP8qrspL3pkVJzXzHWRZJkWPiFWlDTaliyXy0KBjUetjzb3Kyyv1xyyO4v60UgD4
 IJX1+TL+9nmCw9snE3/d4O1myRk+lVEfZK+z/x6xWY6n+Xqa3CTy1V8
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
Content-Transfer-Encoding: 7bit

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig to support stateless video decoder on Amlogic
SoCs. The driver is used by Amlogic S4 platform, such as S805X2
board.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..f00c8a418a46 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -929,6 +929,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.42.0


