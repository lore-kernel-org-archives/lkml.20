Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291291;
	b=HKJC+ZtmwXTXVTAS8nJyDxQNg+e/aN89iefcnAU8heYmuwLkGLXMWs/4gzYf2htli/91
	 A58ROV/Njofd4c/jJdzMXHqvv1uBHvxfv4YADZ8Y2p2/Gm8e7ZjsXHinTtq4oZ4K7vWMI
	 exG/N4JqUuFTWR0bLuJM+n0RdSf7yRA1lS8pTLyvGwhk/RxIh0aeugVvbwC5eqw7h90St
	 jcE7v8royO6U3p4puAqgdIgZM2gVApnZiOiRTgeH9HR7V37RB+/+Wgm6/PTwzoLlWY8lH
	 0jG41QBV9DW/yWajp9bM8tu/1+bWv4QR2OMtXicPBDbwhf3nuQ5D5NVVn3XPM/z2kDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
	b=MCMjvbBHkGldt4x2hMx48fsTTrUwGFWPNCL+QLbf0eW8tQsXuDk5Zg6WBsL890GuGpW1
	 VfK41keWO+aUy1Ex1uMmHVfRTZnrJzpyTH/L21zzfmaa4ca7ZMimGlQwHOw4Jq9j7lG9+
	 UsbP7gneh116blfhVKSuAIVLPVZp0QGmv4MzxwpMmHm5amIyOuJmc1jj9V2hx8uUYlw6X
	 Le9hdPYFI2dU3wWdfdb0vFb8XkgrBVnV3BU0cnxkDaebZy+aHdjEYIhcf2yNgFeyaBadF
	 5LF3ZTVMpodJvYQabMwHsgB54kipjj+1m9PHmI59vlkTU5cFSRaFQs2wkH2de7ZF0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isSQbOfq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D679606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D679606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isSQbOfq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3370701eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291290; x=1794896090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=isSQbOfqTxl1DwnsUJ+JjkxthLG5m0k7fzPiJNwbL9w2w8jCYiPHRuwr5UUIvH63um
         S9g8aIEdoqu+4Ul6yIixkQbkV2tmVY/eNIa/jZSyvXYi0uh0NoBaDfMyL7YjdeNRcAPn
         QCAqauGvYZgG7YkeigNcBuQodD2FZgrWaTBFBkDwaSZEsJarmci3RGBuTK2n9dGjCkSl
         w9TBzi9Np0yLbF4Ii/tM6DPZKaqR17dSI15ymuGJylzQpYmlk/Agy+y+dxm6ybZrjfYt
         HcHu97z83M8HgSr4YztwBnlKg5igUiCiOq+DL9a7dHSEV5O9XOgX36V+u6mUGpcgONKv
         5f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291290; x=1794896090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=bnncckf+QqKodgqqqT/s19SP8whr44XY0TIWF6gZOuJTHHwMDHVUa3M2tk+o87tepv
         WZgi60vgleHW1pHvohhaQ8HW+sWR58RtQrLk1BEvJOLpfE7apTThKWDm13zDPXn7C1/v
         s5bg//DE8F/IpAewh2WBOwjHzmlkVMeelE+R1SLMGy4cGODGIcCYLLLH+uMn5KKBhKd4
         O54clOXPlqrJUNjh/G4XyBsIzRYDX1+8oDPPvQAVw8lnj7m2UQkC4l00er+EMNZv/qmJ
         /Ea8R3R4zhdkni7bnDB7Z7j18yMTjXUP749SqbKorjqIQqQP9WVixwsHfHqB8Uyo8zwD
         gcbg==
X-Forwarded-Encrypted: i=1; AL+hErGtQ2mDSfyXQczBUAdWonjRbTblSkUGcWWVFUDQiEcoBkOdB67sJH+35TJ5LGUF8GO4KnI3LB0xOY70PBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z821ktY7ii0B7QLqKjcvE++7Rj3I+oHJciFg4Ad0hUz1FDGoBqo
	YflEgc9uEprfy+dM8J+LixK96X9dsdBA0e8kayF97jnP0DO4qSB+tMa+
X-Gm-Gg: AYBFou0lbc6VFz1t5jyPLQ3i0r7a30rMEfahwnYb2niz5y7Z3Xy8R67EC+ICwJaKi7s
	MWn8W1safIhiPH0N7fKGTTZknCtiMJIkSegMkgh3tTwby5o0r6w/45R16Er9VytHp+BXWcVnaty
	dLULg9otatlWlQhkuneUBqiRdbZmCqx7tpuzDhxmXkq/SdA5Py+yAcF7MtGZMdzkOwvIqZaYhGe
	/R2PtbNhltTMmOFjjEdQouFZ/P1F4asCO84wKb8LDoyiRonPTTe8lArcppftbwWWs0+IhuuMiS3
	NZjbdsMCQ5l1eEs1kiXFZiCZhNPpjEzM/06P0ejSDGC/YTtB2UVOmOpUAQFYtfLWThD8FdZUbHH
	mbhImpkqvXMOjmnwjZmCUSF9Dv61tT3ik6awT1PPauZJGatSM+68thTyzRvvMZlMY3/0RJl94OG
	riczC5xlh2y4+cq+l2mjty/BdKEEcGmTwIOjWPBAYlwKJM/Cwqg133WftUYkx+SwInmQ2AacsjM
	lvWY478BcU7vQkSyMh4uGXs5oLi39G5b+D0zp+P/y4F2gH5GRXpm5+tLFVtsuJSgjmIHN5Fkzzh
	tvqdS13mYuiYEcQr2nMD8XIkJxfPd7Og
X-Received: by 2002:a05:693c:6007:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-3751c6350e1mr2197912eec.2.1794291289618;
        Mon, 09 Nov 2026 22:14:49 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:48 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C transfers for power-off and restart
Date: Tue, 10 Nov 2026 11:44:27 +0530
Message-ID: <20261110061429.2036-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
to access the PMIC. However, these handlers run in an atomic notifier
context (specifically within an rcu_read_lock() critical section), while
the I2C-backed regmap uses a sleepable mutex.

This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
context switch in the RCU read-side critical section during shutdown on the
Banana Pi BPI-F3:

[  563.803475] WARNING: suspicious RCU usage
[  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
[  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
...
[  563.841445] locks held by shutdown/1: 2, last CPU#0:
[  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
[  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2

Replace the regmap operations with atomic I2C transfers to avoid sleeping
in an atomic context. Preserve unrelated register bits through
read-modify-write operations and check for atomic I2C support before
registering the handlers.

Obtain the I2C client from the parent device and verify that the adapter
supports atomic transfers before registering the handlers.

Tested on the Banana Pi BPI-F3 (SpacemiT K1).

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/power/reset/spacemit-p1-reboot.c | 86 ++++++++++++++++++++----
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
index c0454b547718..8fcb3eadddf3 100644
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/reboot.h>
 
 /* Power Control Register 2 */
@@ -13,13 +14,68 @@
 #define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
 #define PWR_CTRL2_RST		BIT(1)	/* Reset request */
 
+static int spacemit_p1_read_atomic(struct i2c_client *client,
+				   u8 reg, u8 *val)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = 1,
+			.buf = &reg,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = 1,
+			.buf = val,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_write_atomic(struct i2c_client *client,
+				    u8 reg, u8 val)
+{
+	u8 buf[] = { reg, val };
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = sizeof(buf),
+		.buf = buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+
+	return ret == 1 ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_update_bits_atomic(struct i2c_client *client,
+					  u8 reg, u8 mask)
+{
+	u8 val;
+	int ret;
+
+	ret = spacemit_p1_read_atomic(client, reg, &val);
+	if (ret)
+		return ret;
+
+	return spacemit_p1_write_atomic(client, reg, val | mask);
+}
+
 static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_SHUTDOWN);
 	if (ret) {
 		dev_err(data->dev, "shutdown failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -30,11 +86,12 @@ static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 
 static int spacemit_p1_restart_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_RST);
 	if (ret) {
 		dev_err(data->dev, "restart failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -46,21 +103,26 @@ static int spacemit_p1_restart_handler(struct sys_off_data *data)
 static int spacemit_p1_reboot_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
+	struct i2c_client *client;
 	int ret;
 
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to find parent I2C client\n");
+
+	if (!client->adapter->algo->xfer_atomic)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "Atomic I2C transfers not supported\n");
 
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
+	ret = devm_register_power_off_handler(dev, spacemit_p1_pwroff_handler,
+					      client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register power off handler\n");
 
 	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
+					    client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register restart handler\n");
-- 
2.56.0

