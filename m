Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675113;
	b=KxD1RE9sFH/IiBL599+PUqKEDHWiEt3hZs6DpuDlbZEdAQVrbEL/hs1z9rMMip9DnG/Q
	 hMXx34uh1ftrpbpHyKyC3vsKRFx1QaZ97hk9Zjcqha5cNMnoopwXg0RreQfZng6Ml/TfE
	 5SzeG6qHbRpAEwjdFNTEEjGgDhUSb1u2Cgj+APa8psj/5gbzetUyfB1fnczNvemTG7IxL
	 Lg1TGcTU+IiUv7dJn37ghEHI8CjdWX8vjhDgeIQUVo2XQ0ffW6YNIYvzHiIuhDpvVRsSY
	 1gBD0gTTJkurOo0qlL6k7Vix4Q1q+M2ozW4z1P0VyjjF70Ipvja5ZBgo6cHsaQg/CEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675113;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Cc36vDznkQE93uH5c2QEsjHVeJeMc+EFcKrC1w4cfXA=;
	b=sGZEPpv6xioaqrATXVwaTFft6ffiSPDeD27ybWYbGDNGOPX/XZ0OCcib6DuwnnsvbIIw
	 xRHkXggaHyoFhd3h2UjytJy4vJbgx2MuQa2iG5AbwR8zHAPWOSE0bWfsqqr8S+kISdqho
	 co6JOLUhX5wQGqJVhAo5oX7Z4JYTQ5M2RZaf4ZOAuINgg3UY45VdtjvWR2V5vzmPfi/tT
	 3LxzLoYvzr9F80/+1ndKqLgWeJLv69gcgaQei0rrggpSDkcCJVdkW5NWMVxSs01tNXl1f
	 dVMdH9uJXE/pehSpz0tPMWalmgV7teuKW8645hTZiEDiuDfkzvAwTQKAqK29JWsbrjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CssYbuWV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8488606A333;
	Tue,  3 Nov 2026 03:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CssYbuWV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675112;
	b=YDGidXlnoShSvl/xQyJbMoK5zUXofC1LIl/NTaXG8DXsboJuhkMP3afo2l5FdZCb2WE2
	 PudySKanAWa0YmtVLJp2lsjeYK8XGoFRiO7vZjJ6K4moqFChfZQovvUkuD9CZGhDwWNQe
	 TOlj5YqCvyhU3BM0T5FWGvpyPlxKr6BNirEy0HCB1th6+AacXMxvFMGEXlF62g0MJusk7
	 ayu+C4VOyX0Fo6Dq/EyK8P/tLzVh5HFW34m3tD4hXcxf67vWiq8WebSs+SNuQsuDvO/ww
	 Q394MqeO2OoXpra4iUxgHzBCahQkVMeBrGxuj8lfpp4Pd6Y3HVzzy9+nf87qru4+CCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675112;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Cc36vDznkQE93uH5c2QEsjHVeJeMc+EFcKrC1w4cfXA=;
	b=apCpdFI8zQkd00JIQi9Cj4EvBzniJWHoYX7/m/xvwYJY86tL8dxdAVrVBoc0RpfOniyO
	 XyJWJvac0bgJDBv06JYFf7swa6YTpPuthPRQyo1EL4VXmjrJ+tgw+MQpi+RLKFWSDe7Eu
	 HEoasxfPGAb6nuDXA80gkrWct70Cc6k5uxEqXu9yOQecrULgYkMesIxtnszQ5gq1aETOt
	 J/K35OjhfXmJqKYtulfZbrpc2lpR01ws73ccPqSFDHLlYSGvAet2ETDoCEPOhES8QlksF
	 ObVgqGTbghAUX1Kwq0tPF6wLKzkSGeZBYY3fBHpIuPY1ZsFyX2uSkk+uOKFgiEVWfNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E3241F00A16;
	Tue,  3 Nov 2026 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675112;
	bh=Cc36vDznkQE93uH5c2QEsjHVeJeMc+EFcKrC1w4cfXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CssYbuWVKXurdxsLGYONIWvqT+qP/jkwUmsFISsydL3S8UqrpK0eJIpl2/2VMNCAN
	 3leqVwBJ2oiG1/27Cqpm5NfsKAcS2IgPeASiTIsKWzuxLsBD2RsB5+X+CFrLQiD/+x
	 F/EPmHY1HqyOedl9ip0It5uaCCym5fRtSeJigdFa/6ZsuyGL6yoUevjnbZmVvylN1I
	 q/vWHU0wHCQ5kWX/3p7PzbdAUxh+c06+pMOjkLkdo9d3+LcPexdYe8dh/XD1+R5i5j
	 isELFQMJKjylSI4cDPu0k2+j87AE4VGqpa+TTIbGz1fDK271QjMZnDwsZWiUb9ZDcz
	 FQ8izfPaRfFew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA0DC4677C;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 03 Nov 2026 11:05:08 +0800
Subject: [PATCH v2 5/5] media: i2c: it6625: lower the minimum pixel clock
 to 25 MHz
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
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-5-127b879da6d3@ite.com.tw>
References: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
In-Reply-To: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=1934;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=LZ+01dAE5B+ehttmwPegWfW9eW+Lb7d1dAXHvLm5fuE=;
 b=63CfZnhcww7zjaxEPbL+R5JhzqZWoK6olMDG+FZBwr1E63OWqTbvVrwUHAZtSxazpekbJ4QFi
 sSdctpogeudCS+Vuj6y6/RX70xgFZTCE3x5rsigM2NdoIovbSaPOjph
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

The 27 MHz minimum pixel clock rejected 640x480p59.94 and 640x480p60
(25.175 and 25.2 MHz), the lowest CEA-861 format, both in
QUERY_DV_TIMINGS and in S_DV_TIMINGS. A 27 MHz format whose measured
pixel clock comes out slightly below nominal can be rejected as well.

Use 25 MHz as the minimum. This admits the 640x480 formats but still
keeps out the 13.5 MHz 480i/576i presets.

Change both timings caps. The minimum doesn't depend on the CSI-2 PHY
configuration; the three-trio C-PHY cap only raises the maximum.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 75bcb8304c02c7c0c5feeb02af6c93378fcfa5d7..561e5b5f75d887da01755fa292d6c04e4fb22c16 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -342,7 +342,7 @@ static const struct v4l2_dv_timings_cap it6625_timings_cap = {
 	/* keep this initialization for compatibility with GCC < 4.4.6 */
 	.reserved = { 0 },
 
-	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
+	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 25000000, 300000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			     V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
 			     V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |
@@ -357,7 +357,7 @@ static const struct v4l2_dv_timings_cap it6626_cphy_3trio_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.reserved = { 0 },
 
-	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 594000000,
+	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 25000000, 594000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			     V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
 			     V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |

-- 
2.34.1


