Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650982;
	b=d6292RxwyEbUM5Mqa5JSBz2to24NjxU9lnwd/z8bGdXVT+Fe0LmIxrTqsqIxyNZ4i0ho
	 F5x2Zbfz57Zc90y2p2FSUpvdKTWgu/5q3i/gExFb1rHeH8MORz6QDzRsrCgBgSfApbDFC
	 Qony7ol8B5AiyYyYNaQQFvlNDgHd/hJLGffSs/P/frWksqcmagMYcQyhYHhAbknIjTsft
	 Z9Eohv1XItDB8i4p6CiQylJ6fIZpirE0jh+k1sSw7MvrVTycpNt1/6NPeIQujFbEmzmMh
	 BmhlY57yIXJD1EwlUgWJjQ6l6E/ZD2Yt5tsBbjRAwitHQ9IId2e+d1izs+BddKuXBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=2kKJVl9DVcidPFu4iOOYmwpElNttoyoiGTDFs+dVMJo=;
	b=vImuQbhvSqzRrTjyMtbY+WJl67YFwapq+krQSMBD52IZfu7/M0/O1xt+gPGW68km0DaT
	 /V3pvnwSqWGSQiU3hbzddLSMGSfcxzAjES0ic+SYdj02HQR+6ZjBASJSRI7KpdYh6iKYo
	 2Acb6FGCy8QkwqLRKSNmDZgGMUY3NYU/zlPgA3JkCFbqGAVOIAqphxkMoVc53Mk6QKX9R
	 OW4h0bMc5rDxCl4INidssHVSjiMhHAGw4cfaLT/I2uknMZBRAuLgC2KHzjPOIR+MTAQEP
	 RlaaR1UTR4MOQGNOXEqrdGAp06mP4VkqNeT/c4XP+PlBp6zIzc02xbaIUZfirRGxHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b="QpH/Wm8D";
	arc=none smtp.remote-ip=185.125.25.14
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34908606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34908606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=QpH/Wm8D
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRw27QJz11;
	Mon,  2 Nov 2026 21:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650972;
	bh=2kKJVl9DVcidPFu4iOOYmwpElNttoyoiGTDFs+dVMJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QpH/Wm8D/EzZWot2xhnR9ipw9EqwqnRAzXbXg+Nn8g84mWiBKj6thjltCtODKxn+u
	 HNi79ONsELnm6i1dk8bClBoaR3OMStdIcNjIAqe4adrh/PKWvUlVryOmPp+tXUbbkt
	 xGaxrbHD5IBf/fGFlAmc7T8QRDg0SsGU8XrjL12sGvuicYcUCfVUfoxkMUwCKKO3G/
	 oWYW0qu0KGRD5U+Mxs22k+pqLslNFPAYzQetpsT//t7caESYECc+hmkZa6CyWPCzka
	 xXrt1fRgiUtOdAbhtI2REqhusLDFTbSEmPgJ/eHAGiLR+RZVOFG5LMStvbyYwbF2iH
	 hYD9tfUY2dLmg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRv25g0zrH3;
	Mon,  2 Nov 2026 21:22:51 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:22:42 +0100
Subject: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Add Y10 format to the v4l2_format_info table.

Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 11ab684024c54..8d5020e3d5e2a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -333,6 +333,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y10,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Tiled YUV formats */

-- 
2.56.0

