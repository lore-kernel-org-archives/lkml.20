Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908878;
	b=ho3iUnPNItjoJOAiVHr3CBQ26jrNFwQOyFDmuRIEyxRg+xdDLDYrK5UL6cWfK3CYfFQG
	 l3YP8TYgFPMDqOfcD3qi13aLDTD4c6ZwAcekVySZ6HngFQcn1HwKZ4dwUxaABHr6Qqmhu
	 aeEYn+0xMaeHeCM5+7KDFLNHFzRHabFkcu1BBHNes5P0FvE4LlRf246jqdPWgau/8zFA0
	 Ji9YiUhPIdTtLUF1HsGLAVEeJ9hxZxunfd5OiN4QWPUb1U/01rbudu02nK/YznvJm3zII
	 EkW9tR9K4cDD7xmbEcVK/UnVVvPx+UdvwM1jjHlcZh3ql4LLjbSj3pFWgGfHgd/vHDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908878;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ND1nXXwHjHsAPgbdDGk/AXb83MyDC2euV41/T0fjsPI=;
	b=2AoUCCe/yRh7dN839OpsVXuAFKy4HJ/eDT9wrV7qPcinShvgsLZOysa3tkfudm5E0IRB
	 4VWFgdeydXpTTF0O324dJamDAeWCNCii6MqFeZL9swQMZ4DmodMDhP6R10NQdpc0wepHo
	 ol5/Xyc5bjkLU9iUIyrhgpQyKlKxlsXO1ITS/1T5reWJodYAbiDt3w2qvmj2JJ4Gyj52c
	 qY62BunikqWiisVN+P2sfaIlXJ3QkDiow/b1XJ7cHAGISafbwoDqRWAp7NC/XVQJALznr
	 2kAYaHSNMSdLdJOxBvU0OGuu6OjnVu+9Xxb29dG1d8o5BPtRX23jThInutLIPKRcLJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P5HLfqjZ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044E606A8A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E044E606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P5HLfqjZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE5A24E414C3;
	Tue, 17 Nov 2026 09:47:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 842585FC81;
	Tue, 17 Nov 2026 09:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A55B911BC112B;
	Tue, 17 Nov 2026 10:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ND1nXXwHjHsAPgbdDGk/AXb83MyDC2euV41/T0fjsPI=;
	b=P5HLfqjZpWJJozoVBi99pHxutBDJaWHPd97XLhf06+PUQIUJR3U52CYF460iqyqSWbWzCk
	nDJeXt6oYI8XWRaHaG0beewZ9lp/ltoXO+kskB02zAkoae44ZUZGYc6W76VFhVrZwdqobz
	g2LCipPDRvRJh2qZRZvUxKGAwFHPCpRrT2gYV0FK1EqvXAvFcpDRUCOMXsUcHbUQ2x9M0a
	MKFcDG9u7miBfj4yqG3N5RnNCLIBywSWSedRe3ghJ1DSs9V+J8Iuues32scobaKANIFXsa
	fzra0d5LNVtxPeTG4EpaULArSmv8rfpX4/R7akPU2pGLyPf8fm7ECvGXv3obIg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:43 +0100
Subject: [PATCH v6 03/10] i2c: cgbc: Use real I2C bus names
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
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-3-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The adapter names described the expected purpose of the buses ("General
Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
rather than their actual names on the Board Controller.

Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
the naming used by Congatec.

Cc: stable@vger.kernel.org
Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index dfdb9ffc6447..baf02bfe090c 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -358,7 +358,7 @@ static struct i2c_algo_cgbc_data cgbc_i2c_algo_data[] = {
 static const struct i2c_adapter cgbc_i2c_adapter[] = {
 	{
 		.owner		= THIS_MODULE,
-		.name		= "Congatec General Purpose I2C adapter",
+		.name		= "cgbc-i2c0",
 		.class		= I2C_CLASS_DEPRECATED,
 		.algo		= &cgbc_i2c_algorithm,
 		.algo_data	= &cgbc_i2c_algo_data[0],
@@ -366,7 +366,7 @@ static const struct i2c_adapter cgbc_i2c_adapter[] = {
 	},
 	{
 		.owner		= THIS_MODULE,
-		.name		= "Congatec Power Management I2C adapter",
+		.name		= "cgbc-ddc0",
 		.class		= I2C_CLASS_DEPRECATED,
 		.algo		= &cgbc_i2c_algorithm,
 		.algo_data	= &cgbc_i2c_algo_data[1],

-- 
2.53.0

