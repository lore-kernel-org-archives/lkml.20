Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794114236;
	b=HYTZF3PK0SWNPcfPJ3OSjkwV4UrsMiQDIfrJ61bDU0+a11Va3OfmLqaTMUVHbXBXIbkU
	 6DJwQbmoPlchPJvpvfWIXWJfaA+3PMZfUypgtzGiUCNpDuZI1FwnqOBwv28asj412zL5E
	 ETNbqyIpJaKfXeraKT3jykEdvYU6JP8Vf0TOsKSAhrAyYuE2TwkSerNfNJzb79PDxDfhm
	 hgVqxxeVrlG8mVcibop4JYYCSi6dhn21rq/tY/zy8emZHz60qR/HR2FGZFAv/msSWf0/N
	 eMatSErW8GrPxzFxTG8qvCL8xicMxa8/O0uNM/eOcqGL8GPCaLjT79yXjcdoPoai+lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114236;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y9ev3s3YMPZdFE4SZFvlvU0BpodHB4LshDf/j3oeyMM=;
	b=yJoD1uaPu2EdaTf4/j26YmyjrdNRSVBPoJezR2pSlFz3r6koeBDzoRFDBNq2icE49zyJ
	 wdezHG6f8CJwqz8tETdPayF20DuP/GwJbe/CX4eW1/efm4NkEdZIGf9kl2P2BOT4xSrQg
	 M91C1li5zN7IppgEixLceTmyhBW9qGxoPKgPN/6ZVJfVLLO/I0ItmBmYB834QbVQgpTLM
	 oi+vzMrHh6unUS2pwPHpjr6JGrO5so5eCt3deVbnB2zgmSKPc0bY5B2l9zzJgv2Kt8KNY
	 uh5gjO/h/Gm97pQn+f5NKa81iQjqAzwn5EgDglgHf3+6/uxRSQXS8dRGChiw+kk8f6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJo21YPp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D804606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJo21YPp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794114235;
	b=QrVbyChXm49LyDVp2LOeYaJvpuKb2i97JRwCN1kjEaw0fSZHsNgD7IxJlh0SlosLC0Dn
	 zQOrgo/EFvFw0Mzu6XvkAxSFY6GIA9YLN6++6DjFSSh6QoPkbmDX21PHkjvtFZax/WvsW
	 hHRlKJnC2jvRqpbnb7cNE7sOJBmxoQsLV74ntRjEgNdFI7vgJmsxHa+zw5gSD86Gtswvs
	 MR46NAOx3vFvbyxOOGZU7c7Qv/QGTlNUmdxV+IUiwhGEEcxPunlxL3leonf0EExRegdz7
	 VjWkkZgvy5fe/Oxb1K4ZGeG682Nbey7Ce16te3V0+LgxqgDIw9vyFqDPvCX+RDAIzQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794114235;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y9ev3s3YMPZdFE4SZFvlvU0BpodHB4LshDf/j3oeyMM=;
	b=Wi+QI7qhXH4duxoJsqTebgWCQU22fgFsjQK5gwtA4WQGqNoceLMzwatB3C0EOYhtIOLu
	 CDtqscBQ5CwSWyuFCbOxcccuJhrSpjrO4BTLswXnIM2+cNOUT+8fW6ptv4Hs6TH5GPVEq
	 NsCZLUx5zZ0TYJyLu8QF4YskPXzTNDwONOjAzn93t8AJE50tZbMYf5NiDzOj/ZQh8lQWI
	 HI7uGdRTzrF7Co7PjCG0rn1WDP8RErkKlDy20PNlZgPBwDcoy5O6V9mZZlucRCfEZK+aK
	 qih88d8XMWdVP8wHYs/a5p3g7dHrE1pbAX1reZYpQbqwvhdayv0IU0RSaPUhE2MvSGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 560041F008A4;
	Sun,  8 Nov 2026 05:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114235;
	bh=y9ev3s3YMPZdFE4SZFvlvU0BpodHB4LshDf/j3oeyMM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XJo21YPpCmN6lEtLgW73Wx3BugSvpshfV8kM/B1bd96cGtQOYDl4su9Tfx0515Md3
	 fHtjp7Lt4kppAlQ8nKCit+CCyvw/oT6GVlQ3WYh9LGjliQhIxLcfrR6mB4UlwPkL9h
	 KPCrwmQjJNWWPA6ZDvMbgxTc86xgVRTlLllJCqhLWcGLz4E8+FwpMAU1CajAOLDP5J
	 9i/ZqpPlFOpHLogXB/14uT3KCC6w8zfBGFFTwISiSIe92ZjZMgxwj402T7oczxBiig
	 cZT6epOLhC7N7Z6eZe+H2r1aHzhDY1SehWhzYNxMTaYeFbyaz5h281m+cDV4ciPajf
	 aSesRQHPTTc6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ABAC747DF7;
	Sun,  8 Nov 2026 05:03:54 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:03:55 -0800
Subject: [PATCH] media: ipu6: declare firmware files with MODULE_FIRMWARE
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
Message-Id: <20261107-batch1-s1-ipu6-fw-v1-1-1d5323aff7b2@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1gZMhYpeZXBRa6pxodL4B+Ld7
 cwsv8V7NyhHYYUmuyHyISrLnEB5Bn5088AofTKYwliiosLObX4kVEJZd4vhxN6aEJx1pa8JUrd
 GDnL9np/2b927if32HcHzvKX6zLd1AAAA
X-Change-ID: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91
To: sakari.ailus@linux.intel.com
Cc: linux-kernel@vger.kernel.org, DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=JVZ6MoRJlfn70hECkm/g+rCgcAl0la+JGGIypLxaXEs=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkfmHalaE08JBftXu23M8ZizcKvLd8c1BuVZ8/+oyxg/
 jQ780VORykLgxgHg6yYIouYDM/7+vs6cdZWc07AzGFlAhnCwMUpABNRjmdkWFtTN7Fpl4fVoqs9
 BnueNfzemzmBe7+ikHeHxMycSe++OjD8Yrat0Pj8/KLAvTrVX3GHStKSX2nLX5HKD1J9ZBb1+uB
 2FgA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

The driver requests one of eight firmware blobs at runtime depending on
the detected SoC (IPU6, IPU6SE, IPU6EP, IPU6EPADLN, IPU6EPMTL, IPU7,
IPU7P5 or IPU8), selected through isp->cpd_fw_name, but never declares
them.  As a result modinfo shows no firmware: lines and initramfs
generators cannot pick up the dependency automatically.

Add MODULE_FIRMWARE() for every blob the driver can request.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/apqB28RBDZV4BlDZ@kekkonen.localdomain/
Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index cdf812c02960..ec2a9c2bf587 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -1028,3 +1028,11 @@ MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 PCI driver");
+MODULE_FIRMWARE(IPU6SE_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EP_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPMTL_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPADLN_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7P5_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU8_FIRMWARE_NAME);

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


