Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D74BFE61;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=pkOM5DyNViMCd2zJZrtn5mJs8UUmR3cPU25g0Np4br2gdbTFmUuNt1hfEJAJZIkAdeJGlq23kPs3KfQPuunDMLtGKbQ0XIi4l7uhUS9IyMP5Y4cZ5ucI1GDHCGgmE/TstR1S4o1G3B+g/DqGXA6LfGv9NkcAtb6aS1TN84SujIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=YqdWcJwtyS3r/Yw9V015tKcD6fJ16mBb6icZQYhusTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXuKTEgxu0d7BEeg2OOrxuvrxJ7q4FMDQWaWmx56rOe1rnLewFvsQRzD5hIOzrI0E1Lg30Puyt6HyPWui8KJQh9PCWHyU2MWGmGAP91Z2hgQUwxoeO8cro2Exhjb5eefd+xBW4gxoHQzUkLdMWdR9/li3ifEDTbeSGFmuDsMRPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G34zXpEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G34zXpEL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 056A6C2BD00;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=YqdWcJwtyS3r/Yw9V015tKcD6fJ16mBb6icZQYhusTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G34zXpELhqh0GhbtXT5fFUB6gBIySLUYO4w5ZP9TxA5AtSTVWssK6xKYNEAfP2x43
	 l1XbVEJ6VZt5zaukE3IJaF/bt+6jaNvlDszj/UH3BCM1dLt9ZTPhOpcxghRMoTobDs
	 cduiJQ6wFAlU+XFamRl/bAI7smxtBnoQLiFVDHmnVBp0S2ztlEZgfyHnKSa9vAsOJz
	 2Wuhwt3ksiZ7x1TbBBg6irlC/ciPJ9dH8DXicXrJBGP9XzqnwqjIRQfXsFFW5Yyhfz
	 OjOjJ41Dl5xAOqXTLFD34wWXRrPRJELeH034CSXhXq9WwuAIT/SWfBoFMg1avOakxx
	 bi3WO1I20qVKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79DDC88E72;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:23 +0800
Subject: [PATCH 08/21] media: i2c: it6625: make the audio sampling-rate
 table static const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-8-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1207;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=qGU/O647aZTfqdglQzVk6HPtKDWbKwtWWhBds51Ufxk=;
 b=TfBXu2AxpWb2bsLyWlvInSsVxazGkyNi7inH3WJ6fG0FNMq3IVSihhPEA4UOiuLk/PDqKom8S
 cd1DTk9Pm5MAACPnNt3OPgoHDeJhQaVk/4vAW9vTbGw5p4VvIrqTrnw
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

s_fsid_map in get_audio_sampling_rate() is a fixed lookup table
rebuilt on the stack on every call; make it static const so it's
emitted once as read-only data instead. While touching this
declaration, move it ahead of the plain int locals per reverse
fir-tree ordering.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 62fabf6169fc24364e484cf573b0fc1af174afbb..9b1d9edca8f383f4f55918bda259a1b053d7f41b 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -583,9 +583,7 @@ static inline bool audio_present(struct it6625 *it6625)
 
 static int get_audio_sampling_rate(struct it6625 *it6625)
 {
-	int fs_id;
-	int i, freq = 0;
-	const struct fs_id_map {
+	static const struct fs_id_map {
 		u8 fs_id;
 		u32 freq;
 	} s_fsid_map[] = {
@@ -610,6 +608,8 @@ static int get_audio_sampling_rate(struct it6625 *it6625)
 		{ AUD1411K, 1411200 },
 		{ AUD1536K, 1536000 },
 	};
+	int fs_id;
+	int i, freq = 0;
 
 	if (no_signal(it6625) || !audio_present(it6625))
 		return 0;

-- 
2.34.1


