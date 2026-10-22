Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646835;
	b=mLF+40rzaQX4yYblA/LphAd6foPxpDV0o4CnPr/pL49qQpMIPwUR0M39hJImCGQlZV97
	 idNQLHBXQHeIYFgIULRF8H3A6E6B0njcBLt2OWKDkfVPTaRQB/GG71xlgbSoBVSiT1Uzz
	 V8dCeAvFGQSWihxd7o3sg+coxG9m/LCsNIgWUfcELpqbFdEMXeTxRLYPj3z4KfmbVeHU+
	 Pka68RenKms1RzXrMY9L9R0tLqt8o5uRdCMZEarqT6LgZPWILOt/fJCIzgLbbmaWgp1dF
	 pQS3fgniLkFMyTf76V3TqyMpf2UG9M58UHrnn0VzpRZV8eerSRB5gCn0hsioOmFyBCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646835;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=;
	b=FBo3CGFroQ8bFbJ8o1Mku3xb+RpJaSn5JVrJWhBxFBxfjUegcWf9xv6l8TqI59BEOzWw
	 0Tzsmcd+gMyag7zhsOH9es6DSp8vxJk1C+SU9BHBWvOMqfzILlBcndkJ8UEKP2mZkeZ29
	 Cg27zz7BIWopd0qNCJyIJxGPydtuuwcJof/2e/GsRtVx8t4zL7G1wbTYwk9enpXsISmuf
	 nrefvQZ+pjHrijrYry1h9vQdRJaUpf75PbpP7MAKbW9rS3iQKw5TGXHgb/W+OJNIKpJu4
	 SEXTk0qDZYTtLX5NvEiuTccDFdvdN+4n6PwDC3YhXyneOcl27Qa7ayLF6iHRfOOg2yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n51pWjjK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78BA606A319;
	Thu, 22 Oct 2026 05:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n51pWjjK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646834;
	b=ymq1EzUq0X7rQkIuKjcRG1ZIhM7zGktD65QRcLmiZOa8p6uR3qgpsEohyU8U0Rm0ABhK
	 D2SrRQfCAFNZFeC3kM/qFqzCEoVJyLEK9ccU/IBe10KMcrBULp0gBhYSRQe40rm+pfTDu
	 qU4YyZwKEsnG4KXfTn1FjIHZEKbFsgLU7op4yNmoG88t6NEri5DG3PF766YLZz7ob+WEb
	 k7mesMS2mpp2d3YT0Qlsw1sdzP0RoDwOeP8sR24owoz+992Gwr1ZkREUGDCArQwYGDpSX
	 1FlcTzZGXRAbhvRh+WFihT43Bf9muVJ1tQELUmh8UyhaHAcoC+PcmrK4w/zfbKJKXOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646834;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=;
	b=QXJibFfJpboUdfxFdj0/fBXm2shiSRzkrCX0Hz3INaLc02Pigwm12YK9UmtpTwdNGS7t
	 XpMPV0pgtj+XsaY4uoWMe7cxWrMsuqXvGP5AwJ4hfUvqNaqdmcSMWzOcX7oKXGqRQmYIT
	 IsPLQb9SFXfeMvksJRCBNr6b3mpQNf2P2PQ+TgIS+G/1g5YiNCOAR7zjXWKJ6TgaA6Pe5
	 8ABp5+L75QYVwBCySldcqqITODGG9Ey5hhADwijmnK0MwPrV3DVu9mcfWo1jsL7YSKJsq
	 0HvdyQJ3QFDzNQWY8FQmpfv92+JjgMtNzVw47//BntPOQXZHbhOI1aN9XsoXTuyAALQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB3BB1F000C4;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646834;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n51pWjjK7n3iA1u2YBScMSudXl2Acfmei/E3qd1k4RJ4t1CE7w7W8K1Pvab4dfJxg
	 iI79BCk9RlGKpfWkd9DEvlbXYNstuvUBhC09J3+5KD3IrOiqIcqTIpWOn8Vi1729aw
	 z/bFJXQmsFsRlFymA+sz51w63BfeQ8J1rwcGqwR18T8BrJP7ym0mSYPjMGXEZB3/Ts
	 ggVuCRlViUVN3+cPLCqhUNaZ0bjJXFxQOHmCnOiwDRfOj3MWBLlAjG1/SQQNEa+LHV
	 ysg563bzZjq+o95invY8c20Q/ZwQKLNKQCyEx9Yjb2fMngZnPd89gHSLhSG0hzwVKi
	 XisY47NvjxWPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 417A04349A;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:26:59 +0800
Subject: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
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
Message-Id: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=jzgUszAuPQxlADtMxlXBVzmt73Um2B0VB0t/v2Ql/XWYmaugmAbh0CBi/5x+OaoH+alwOziwb
 4GZjXe/RwItDc3A6vjRRm4Xdt//iEsBfv20O2XsS8cnyZgIitdMBMFf
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
Content-Transfer-Encoding: 7bit

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0


