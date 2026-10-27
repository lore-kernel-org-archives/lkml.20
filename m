Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793132988;
	b=AzeR17ePZtLVv1wO096RSAJQ0ewWn1PKX7lfSVPZ7nw/LA8sRIJ7Obkhm3hQS+a22CZ+
	 dTaW9WdIM2A+PcZK9m6FkjAVyyuUYTFzTW7yT9a5kjye0AxfYZSdgSg94Gik0oRUVVATA
	 +yhfSpGZvC9s953U/X7jq27/molV5nDbKf7+mp1PkCpQC++9lLIk+OJidePG/26/886LM
	 BHyGceOXhJ8d/SKGV+gK1Ccvxtiax8gncIBf/Lbzd9YDuABrkvXl7xM0sbWgekSmChYtk
	 TiTHj21zoMkdGayEugVoYpbdWYo/MSWfSuSkxMXmLvd7wv68OrCMH9uTLJSWr7opxrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8oojwC4mibHluiptbodzWdpbf9DVD5AEQTgnZSOxIkY=;
	b=4GePuN8s2pf5ywQ8TGBtgsaVILcjiOIvWp46efWsDlXAZoV3yiCjm4eQO5DMhiuw8BTK
	 iYMO6xMdjq+9xr5seEhZqBYrcgYonxVhJA1E3HnsDiF1aPjj/Few31SktzsHNsKVnmq8s
	 9OYpw1PCG/JLchmYm9/L5GXHt1nmALOELeZDRjVX93C54TuCqtFm9+3fQU1oeMT4Q9HmN
	 K2rugqw8w+qajYvUoFY2ULuwiSDq2OAwU7exMD7orABgNf1h4Q/MWj0adF2WNaV3SXdIY
	 /QZB+LpxsEMRz165q1NRpnzm3/I0wrkL7p9P5kRi7vBe9+nCGBPyccq6Vq37ob0eGbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8TrWfCQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190E606A904;
	Tue, 27 Oct 2026 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8TrWfCQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793132987;
	b=QrK04iyuPJO1aBmos1lgh8g/66NVYcSgstdXgGntntEmMIWW/Zq8IjFa6BmkRdAG8uiQ
	 oke2JDPwRzSuatBXs5q+qrIh9elu2ThV4iPcTXzG6ZsBNvY/3z/AWAHd7qNdXsmm3a2hS
	 CC1Cq6vyGQ7U84oKkr7QVvZW5dklB9YtiMC4hwKyDbanYXLMh3uqo7LFHnkF4bEwv87XD
	 MSuiHxhrZp/cAR/+eNvmp+jJHbPG45HFpOau7QCmEI5H/6H24hrFshHGxKqu3SH/ueYym
	 gMw5OSpXzKWHleKhe36FgOWe2bBw8NCX0kn3oKMS7Y+T2nyrhf7Cm+tHwJoS3F8SG2w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8oojwC4mibHluiptbodzWdpbf9DVD5AEQTgnZSOxIkY=;
	b=JS6L20xe78YvcheqR4YCOixb54gXHRDZlus5S+nDuJNoxan7XisWO2eBjktyH09dBJpL
	 qi9Y/V5LosGKHF8jnoI6C0WEqsLsXxKEmxwXGXZgdaYFZ0wH49mkUqKOfFLbwZOmL+MEi
	 l9UB1x/7ja0VIEys4bciLjZo8Qgqtev9ZuaAFjCZ3U4tCQVkL/QoWC2GvH6YcWGW3ilk7
	 Ymbu6BLmFrKu+/xTlGwl9QRvZvVmAzcEhQkEOfFHkLwkc6Ja5SouTf9NXu7uxOqGAdcHq
	 WPTDMTKJBUcdtT9obPfOfPkJkOOK+J1qPurdQaePgbveokM9xl0Lh0olBKmZNkViB2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A71BE1F01828;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793132987;
	bh=8oojwC4mibHluiptbodzWdpbf9DVD5AEQTgnZSOxIkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C8TrWfCQxXAD7hi5ChWZN3HYr+1hqB7L6Zrz07eh9dIZPKQDHXbAwh7glesdGQXq8
	 +oiDNgWaaYRkT09HBH1MOwU5LM3YmuUzkRad8LYRDkQ0hqymyf4Q3RfbO0enG4wD8Q
	 R3cgSfMOC39wB1yU8O6dYY+gzMh3Xpcx7UnJ+4al1NDcREcH2DGBBJ3ens6gfls6vD
	 OHOx699ahQPuB82Rff3eqAtR160STGD/sO1fYl3WCReFyBXc4b15XVwKwIGpr5+q0o
	 B1D8xeCEm8EKMbKiHjOQL5bNpWJtPyLwtBml6s5sRJGv7jTsQuskX32lJSsbwM6NA0
	 oY69yAMg6SQ0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17D3D45211;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
From: Marco Ziliani via B4 Relay <devnull+rylos78.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 21:29:45 +0100
Subject: [PATCH 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
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
Message-Id: <20261027-ov5693-fixes-v1-1-3c8ab1ae104d@gmail.com>
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>, 
 linux-kernel@vger.kernel.org, Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793132984; l=2580;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=vr4kUaykaNDDTvI/XPwM7e2iqb7XHZfVu3/G5P8saTI=;
 b=KEbjbj4KD+HU3Jj/r8hT87ZGcaPSoRdLqR0IID7Onp7iL1z1AJquILfFx5czVp/hu8n+pe0zz
 ZW+D/64usIrBl4yOySMrymilFd9USnYeQ+VhAUdM6CDlJuZacGEKZUh
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=
X-Endpoint-Received: by B4 Relay for rylos78@gmail.com/20261027 with
 auth_id=1333
X-Original-From: Marco Ziliani <rylos78@gmail.com>
Reply-To: rylos78@gmail.com
Content-Transfer-Encoding: 7bit

From: Marco Ziliani <rylos78@gmail.com>

The mode registers (readout window, binning and subsampling) are only
written from the runtime PM resume handler, and ov5693_set_fmt() merely
stores the requested mode. If the sensor stays powered between two
streams, the new mode never reaches the chip: the sensor keeps
streaming the previous mode while the CSI-2 receiver expects the newly
negotiated format.

This happens whenever the format is changed while the sensor is still
powered. On a Surface Pro 7+ (IPU6), with the sensor held powered
between two streams, OUTPUT_SIZE_X read back over I2C showed the sensor
stuck in the mode it was powered up in, and 0 of 16 streams that asked
for a different mode produced a frame. With this change, 32 of 32
streams completed and the register followed the requested mode. A
Surface Pro 9 (IPU6) gave the same result: without the change
OUTPUT_SIZE stayed at 2592x1944 in all 32 streams of 16 such switches,
with it the register matched the requested size in all 32. On a
Surface Pro 5 (IPU3), switching between 2592x1944 and a 1920x1080 crop
the same way, OUTPUT_SIZE_X stayed at 2592 and none of the 16 streams
in the new size produced a frame; with this change, 32 of 32 streams
gave 10 of 10 frames at the requested size.

Program the mode on every stream start, before the controls, so that
the mode registers don't clobber them. This matches what commit
4e1446ac169a ("media: i2c: ov8865: Program the sensor on stream start")
does for the ov8865.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..579aa55b7 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1000,6 +1000,19 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 
 		mutex_lock(&ov5693->lock);
+
+		/*
+		 * The mode registers are otherwise only written on runtime PM
+		 * resume, so a format change on a sensor that stays powered
+		 * would never reach the chip. Program the mode first, then the
+		 * controls, so the mode registers don't clobber them.
+		 */
+		ret = ov5693_mode_configure(ov5693);
+		if (ret) {
+			mutex_unlock(&ov5693->lock);
+			goto err_power_down;
+		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
 		if (ret) {
 			mutex_unlock(&ov5693->lock);

-- 
2.56.0


