Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729E4457BC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832145; cv=none; b=lkRmyU06Emyex5mc+7RtceUzsN2J2vhrC+K15HDZOvKEmzkJV1umfTV6ALDIY+vu6RvqNBRy5nd3BRNrBl7DJSBc1A4EYm4oIqK1XvzDZ/DN8PC3RPkV2Y713Z7WS9ZE5VNS+KZqxs6ENim3Nezo59GD9QG2a2mJ7CwANcV07Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832145; c=relaxed/simple;
	bh=jbkWxXQHrVMLMxBZ+dP2Rs/rmyCOkzm7VYJsPlAsWks=;
	h=Message-Id:Content-Type:To:Subject:Mime-Version:From:Cc:Date; b=lrjAUq++z9nGYBhVISnPFgH+dOmTOP0ijIUJBHgLsQCNET4rTbj+7Z4yPbAKrfpe60ralEuln658hfSR/iTKPmeQIldp1/bbSOGufnJ/WT+8Rp/8gWdvsQp+mKp2lomq6sOcvNLAzl2m4ITB0cRBEB1vKGS4UO3LgIoljruvel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=zkM0RHiU; arc=none smtp.client-ip=71.18.227.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="zkM0RHiU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787832135; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HYI4526PYKexYfh8uePtoxBT5q11xKZ7dZyYzPC/mxU=;
 b=zkM0RHiUKAIHO2B6qvlHCAwdrvtgcdNTX7Wh4OJyYfGUxU24IQ23km763sEhTDffYonycP
 vFmpo3ueIaDfYpVIReqeFmQz9I1+BnEYFnkkXEX+KlWHLM9rIKQMqGc1KkQuiS+XltZz7F
 p9kXjGWR66BLYu/xIMzsx1NYR+dlaRyNoGGJ4tzQPwZTbTpIV9L+BAnF6utZYXHCzFyESN
 1YVRUA22OW1xcn2v3/VQTrcdbrubCAXUZZQX+KjkEnLES7nuCxdNsKID4Mr+b9mXYpq06U
 8WuPtywb4XGKdszaRfakiHqVvHYizMpgwkLtA6399CUk8p34uTMEFrucu9x71g==
X-Lms-Return-Path: <lba+26a902745+2f3288+vger.kernel.org+me@cherr.cc>
Message-Id: <20260827-go7007-i2c-buf-bound-v1-1-4555cc3d0464@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-Change-Id: 20260827-go7007-i2c-buf-bound-d4fbe42a4a79
Received: from [192.168.9.107] ([111.42.148.29]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 20:02:12 +0800
To: "Hans Verkuil" <hverkuil@kernel.org>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Greg Kroah-Hartman" <gregkh@suse.de>
Subject: [PATCH] media: go7007: bound EZ-USB I2C transfers to the usb_buf size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Shengzhuo Wei" <me@cherr.cc>
X-B4-Tracking: v=1; b=H4sIADsnkGoC/yXMTQ7CIBBA4as0s3YSOiGlehXjgp+hThfQgBiTp ncX6/JbvLdD5SJc4TbsUPgtVXLqGC8D+KdNC6OEbiBFk5rJ4JKNUgaFPLoW0eWWAgYdHWuy2po r9HQrHOVzbu+Pv2tzK/vX7wXH8QXT0grmeAAAAA==
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Shengzhuo Wei" <me@cherr.cc>
Date: Thu, 27 Aug 2026 20:02:04 +0800
X-Mailer: b4 0.16.0

go7007_usb_i2c_master_xfer() copies msgs[i].len bytes into go->usb_buf,
a 16-byte buffer embedded in struct go7007, without any length check.
The adapter declares no transfer limits, so an SMBus block transfer
issued through /dev/i2c-N can write up to 34 bytes into it and corrupt
the struct fields that follow the buffer.

Bound the transfer size with i2c_adapter_quirks so the I2C core
rejects oversized messages before they reach the driver.

Fixes: 7955f03d18d1 ("[media] go7007: move out of staging into drivers/media/usb.")
Cc: stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
The EZ-USB I2C adapter in the go7007 driver copies message payloads
into the 16-byte usb_buf embedded in the go7007 device struct without
any length limit, so an SMBus block transfer through /dev/i2c-N can
write past the buffer and corrupt the struct fields that follow it.
Bound the transfer size through i2c_adapter_quirks.
---
 drivers/media/usb/go7007/go7007-usb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index c0cb92fa6ab9..867548d655b3 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1029,10 +1029,16 @@ static const struct i2c_algorithm go7007_usb_algo = {
 	.functionality	= go7007_usb_functionality,
 };
 
+static const struct i2c_adapter_quirks go7007_usb_quirks = {
+	.max_write_len	= 12,
+	.max_read_len	= 15,
+};
+
 static struct i2c_adapter go7007_usb_adap_templ = {
 	.owner			= THIS_MODULE,
 	.name			= "WIS GO7007SB EZ-USB",
 	.algo			= &go7007_usb_algo,
+	.quirks			= &go7007_usb_quirks,
 };
 
 /********************* USB add/remove functions *********************/

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260827-go7007-i2c-buf-bound-d4fbe42a4a79

Best regards,
--  
Shengzhuo Wei <me@cherr.cc>
