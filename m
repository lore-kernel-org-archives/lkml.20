Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35904B0492;
	Wed,  9 Sep 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949657; cv=none; b=AAQftRZJ3B0aXzOgZfHLeue+Avpu4xgyzVOh3j0RrhAS1tSUeLgU4baWMHqo0Z0sUn3JiaNgavlDCKR3CsjJ3LKmaTzQO3kcn+bqAmA0/N+mf279SGus6gNT/L4x8NOMoekEK6kXHbhT3oOqdJKdwfEH3o1+7zstPH3oHFN25jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949657; c=relaxed/simple;
	bh=ZYi3ds7um4jbfI8F97PWxe2n/cHfW8BQaw1H/6YJCyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwZWGxvn9p2g4ywOk7wGt1jfWMDbRvt2ZbAS6sINaV6EZn3eSHBFt0RcMp8t3HXxnC9DYtvNlNGMIxh9mCOb8nSy9uxiYULtaVROThDrFtNjgZ2ocP/PPJrz/bV6BM3d88Lj9S270fNcdu3okssqW3QxpTRzC4qathGWGYoo/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=pMbm41eL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sOP2yPBC; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="pMbm41eL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sOP2yPBC"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 978311D00089;
	Wed,  9 Sep 2026 06:27:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 09 Sep 2026 06:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949653;
	 x=1789036053; bh=WRAfoNJnV/FXYtma8sgiRLfOSsyrmnj+IEspkpPkyMM=; b=
	pMbm41eLkONXLNUxB34upW8UVx14wrFEQ3CZH4hXjIupZnYJjremvJikqeE3xm+s
	VdlOWXlb3uJ8T/twf5DMmZrZ0mwcn9ljlu0bz2PMyru7sI4NWb9NWuGqKXQCy1e/
	wn26zIPHFoV5QG5QKs0DS0yxstXRuY2jyNe0gXlycOX8vYoKf9YucM3L4KFYrL5W
	ERQKcSZE9khe/1POjwaaHF0CqjD9XHSBqzr8GkuznPt59ytBzVwtKCWbSV/8NpeZ
	uLtHDeXxgMHGQuP0eWTRe303SzdZAbkzrUct9xJ4AvjFUIpSj6a7MnPvl9NYKLZ2
	mbL2oa5oscHL9bGmglWThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949653; x=
	1789036053; bh=WRAfoNJnV/FXYtma8sgiRLfOSsyrmnj+IEspkpPkyMM=; b=s
	OP2yPBCREi4ZWPurvsr0kaUB1u0I+dLTziXP8WvTrUjkOajYBCf3O8PrhT6Glob9
	7kmUXkdNcQFUO3dlF92bbf/G5GwRCBDjObwIqJ4HjZQCgiucLJsks/DWh4kab1nC
	5Wq/iy4GGZnfrGYqWqWUpmbMN4rMug/PHNW6dhGAiyX5eWPrG6FaEC2gsa0bKmwg
	FPXQzNl9zOYN3YmjGBLGlwA/qykSHuoZvXX4vKr+Czeo0cxNvCG1RFXuGiZQ0H5w
	FaEeMxFXp6shFGbqiJQIOCjiFHS55di0nAiaC6KIuwF50IbNuuz87GIWQTcXFEd2
	891db3HqWlIRHkemkaTEA==
X-ME-Sender: <xms:lTShan3CmrG4F3dDzQnmHPuLCJLllwytRC_9FpXowKdS9QhWwralhA>
    <xme:lTShauQtTx2w9drIiYd72z9TC6lNCYgicNYkj9pjTwlIKJswJeeYpLKjquZKcA35u
    g71h1L0MgP14FAfEsaJjrdiiUpKJGcWWfAtpvLaaA_DfKwv5cttu6tH>
X-ME-Received: <xmr:lTShajcknC1_z3070YwZJU9hjsANX2Nu7FpEAZ61AFVfUEPWAQUmCNPbkl0-nDbMBDAYdQ6c_yPn1kjohEUAoBToAiFj_s4DXTPw8Q>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjpI
    UCKcJmItRe2NjpHiMUv5a523SN99uxtg6qT/HovKVcWqwmkUptyUKroXMczHil9kEVFS7e
    vFr19Sr1TuA2YJIXEnSgmwErnChntS5z/NVxu35/TVgENcjRuGhTEVOEYpeVcZ9hCQwmWI
    QRmcrix2sUa5YbBB8KJaWyvn87t2XOEpAiY7Drs1iy+Sahe0KV/YBK96MoqDHwv8ZEvbeB
    OD7hp9a2oyyM2sEtqowfYqCdWyXwLXhX/v+e1xQIIlkyqM4PvG67RUEKsUH1dvNppiOrxq
    3/IBOpd7iBnaux568QDkApEehM/fMttjjsHxJTnqzBsyokpxNr16RVRDyM3Q
X-ME-Proxy: <xmx:lTShandbMSsRfa5t6cJGP-kTwc82VzzdyjND5dD92mEjE7FOVLE8Jg>
    <xmx:lTShal0fMzejKH_3JwN2Kd7Cmb_8qrfsTmYHWLhUjYIngl53rzcxsQ>
    <xmx:lTShan-7kvUtMo3ECYjBDUyDGnpS2T9kZHAQbnMaOOaZzaYzz3hT8w>
    <xmx:lTShai4KzS4jJMykE4KM84Wnk5r68GHAjSZnUasyzqH-TFi44vaenA>
    <xmx:lTShal3e2ApTr8kRnDUC3i08HpRmn7dhzwJZKuvQ5hNTF41JoMo60p4v>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:32 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:07 +0200
Subject: [PATCH 11/13] arm64: dts: apple: t6032-j575d: Remove unused
 "framebuffer0" label
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-11-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=ZYi3ds7um4jbfI8F97PWxe2n/cHfW8BQaw1H/6YJCyY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJlX3Dk43y3gQc2uur2HV/ZLf/7UTr0wy6tjk8iNf9
 Yrt0UNnO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEwkeDHDP83yqmZZw2lCfY0y
 iYGyq5v+npibK/D5a0tf/r6yqvzpaxj+GRh0hWRHfRNcnTffUHpVKX/xqtqHfNN3TV1fVGw30YW
 PHwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes "[unused-labels] label 'framebuffer0' defined but never
&-referenced" dt-style-check strict mode warning.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6032-j575d.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 1c4a0fc9bd6f..e83fdb5d8c86 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -26,7 +26,7 @@ chosen {
 
 		stdout-path = "serial0";
 
-		framebuffer0: framebuffer@0 {
+		framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */

-- 
2.55.0

