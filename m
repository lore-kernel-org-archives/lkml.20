Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641790;
	b=HkYSnMLDoAQGbAUimLj68h0gP5tEru7Y51aBss9CFR5/9jmELJiVqCUIcZAjbTtI5HGX
	 t03IwiXmfu+39upP/S4fPKg5+TA3ZMauI8GgTWhGqTWL9mLEWL8InpZP75QzCpLQ3PJXI
	 oxtP/T9BURIq+jAX8kyCkrq7IKx4J2v+GH02saXhv1CSSgCwtIAjh5kAwVKJMXDWqJbR8
	 C5I6HMeTNCM/5HbwKq+/xVU5D6x+d/x1TgCTklWLzGO8zNVMqe7moqUdbpsm7G13jABPI
	 KL4ISBET7sAh8uKrQYcPUTkB9MjM9O5qMgvIS6cR9wHgtybGmTOXcjHy9yVjcv0ZT2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641790;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=;
	b=zOd6ay1bo/78ksEa/7HlDX88QoVzgUeOGxaqZkL0bTeU7Y5k0e1DkDZihSF7G1PSw/wC
	 NsZ2lIdwsOUL4HVyaZLg3XfxJKXD1OkmkVMtH+U12aANUYLIQUFf4k1D+UgInR001MN25
	 RzJNUEujd0k28ye/ahgJFgeiytqla1MUyKUUaidiwm1hvziQQwfL5oWadYjdkMXW+8Uab
	 /uJe3p53theP9qB/kRz+Dk6TprTnrCnlttqQPdbO8NZhp20tQq+nmWvTaySHGBQDLsH3Q
	 RzHvYJ3QJNqovjcNHYj8dSNU0l1Ej+ZKWMPR/Igd37x5B37Yec8AgNvJHllmEX4PEig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzbIT5ys;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3F606A337;
	Mon,  2 Nov 2026 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzbIT5ys
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793641789;
	b=hMUR1VswI5nhONCsranH5chc0kJdZ9R2CsDHp7W6K6mPBfQBX8wDCeg2K/GP9lHgKAsU
	 w+A/29sHdEK4CK81UDqbhgIUG3KRFtaUotfR/pm+F3rdEnQdpDPk5qMAsMzISuVpsNhdJ
	 CKRlimKofCg8b8zaH65HVre9YbDors7CX8OLooivPr0StdY4WQGZDXzgLq+Aj8utPSTdy
	 uo5KNe46weTaONC5d6p5jvprA0aHuxuRpff2IwezKc7LWQkwpt9TkyEKJMOtffrHDn0li
	 tld/vnRrXLKxE2rqQ0aMJ9fpdXMeaIkzi5qvFrmw+ZQ2q0Ve5Y8TIyr6sFRekAQAJoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793641789;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=;
	b=pJTcmTt3vaqUbLtuNKDbhbM0GIFDflU0TRmPoy0k9uMNVaDZZe42nXZlAudbBPozi7cW
	 /FIrDZnY5X6PBNUA1zCK6NqxO6rJR9z7tcwsBzkuQyQJ7SFH7nH53l9rM3lbDsCxmcovN
	 ESEQcFDL+99/iDJJ2Kt9+rb4iB2j2aGzcyJjVYR4cNMALRIiFfiHtwQzEky0WosG2BgRS
	 nsQAO/7hr7uw9pO/694xIIoX5FYelReG4KINp3Q16PMKZp/tBqDi47XNlDhGWKkKvbVmU
	 uVaQKcWEPKAmZyE6S6FGMbNN4ZhZ3OwtIfeSjRPaea63Dmkiw09KObz/tUaiWcL2QAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28A7E1F00A16;
	Mon,  2 Nov 2026 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641789;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UzbIT5ysOqmaEQwiAabE+RhW7d+yCygIKKGG1+eAcV/83aNtla8e/yZOYlp/EgZNq
	 3jHuGsmjluldyUKZAWORUN7Narw/Fk4M20ihXjkDcKW2cygEZYElBxlWcVvTdYVpQH
	 Y1/h6iLnmHx1yA3WIpyVBQkOJAnwiUAt5mUFZEcZ6y6/gVbyFyUr2pI40dJ+lj02Qm
	 TkFydwIa9etko6aWPxGBkCvwpYKkBidRMqexsPkfYO+v/dja+Q6G35QTJZefGFvg2J
	 78QTAniDMkBZvqO07xMxJEDBLFm9tREDruvBxrlGj4QYoxQCzAe/hzuQS7xGGErNuT
	 B8wLo+OL58ABA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ADB24465BF;
	Mon,  2 Nov 2026 17:49:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 02 Nov 2026 17:49:46 +0000
Subject: [PATCH] media: rkisp1: Depend on PM
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
Message-Id: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
X-B4-Tracking: v=1; b=H4sIADnN6GoC/x3MQQqEMAxA0atI1gZMHIV6FXGh06hBrKWBQZDe3
 TLLt/j/AZOkYjBUDyT5qekVCqiu4LvPYRNUXwzccE/UMKZDLRJ6iRK84RUwnsjkvPtw65auh5L
 GJKve/+045fwCB8GFrmYAAAA=
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=jIOYNEwnZtImPbbvWDWM3rNp8UHpADnjrlqR/x0YeIY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkvzlorGesuDT/htuP9vsfeTXcsb6veX16Rckbs93YWB
 etfZReVOkpZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBEIgoYGbruLmbNPF9mf728
 P7yRt8fjsK7pVedP5ca8/84EL5q76gLD/7qbqwve3p9/vZPr5dtJ2csqc0zvHO+qi8zZlHX2SLy
 hDTMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

rkisp1_runtime_resume() enables the clocks and lets the interrupt
handlers run. Without CONFIG_PM it is never called, so rkisp1_probe()
reads RKISP1_CIF_VI_ID with the clocks disabled and every interrupt
handler returns IRQ_NONE.

ARCH_ROCKCHIP and arm64 ARCH_MXC select PM, and no arm32 i.MX has this
ISP, so only COMPILE_TEST builds lose the driver. rkcif already depends
on PM.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Split out of the rkvdec CONFIG_PM discussion, as Nicolas asked [1].
Without PM, olddefconfig on arm64 COMPILE_TEST now drops the driver;
with PM it builds as before (W=1).

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com
---
 drivers/media/platform/rockchip/rkisp1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index f53eb1f3f3e7..c825fbacee96 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_ROCKCHIP_ISP1
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV && OF
 	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG

---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261102-rkisp1-depends-on-pm-219d94239b56

Best regards,
-- 
Igor Velkov <iav@iav.lv>


