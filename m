Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223906;
	b=K4ym0r/5o/bbxnbxKF/C4jB/XUYY64nQHSayzeEpJAqvhqaETk7+mFnyz4AW+0EyzY6+
	 pgjd/+a76jgOttfVkv2P1ndRKtYsv70yGSkwi4p7vljxGUMxzWb8VenFGaTPGLpKsf3ch
	 ylumNdQ3xopX+SXL83LPv4DMK0n/towhMLcvAxDcxw/yE5XTBpTv7+S9eXmVGVSbdQiDq
	 VcF7vXAxbmtXRwz9x32JiFebR0W2eYRFOxCUF3EF+OJcQ9MDUNWbDzL0TVgpYehqRqdNJ
	 HKL+BSrsS6tUffg+GJUm0z+sKFOaCZQ1nS17lr+qCzoi+dlz2RK1ZXArNUIcb+tWXAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
	b=s9l8iGkpn7zhAS3WTsfJHEgRG6wwnpYqE4t1En0EeXwKfoAQg0IjiXVzP7n8TSl3PJFI
	 PSNEuvGRCJoPsqnHJS/iVQB6EaAV6nPXw+yHEHt4eEKa+8byJttXTiDj/CvSWScBKzVJ4
	 EGBIX4ZLlsv0BNuPyh35jbxoNiiZZYl5Zin2XMSbVudMNKYEwn/Ksi/DpGZAd6vJSpHTa
	 i4Gq7161YkBFs/d4f9CxjXPFJ9/95+SIJvkk5kMU0RGjmPRhabX43gVtGaFt7nTXgagFF
	 xu4uQiGiOQwd9iE3Ll7HoYLZ4HiIUjXpYkhXqkiJA2Gkb/cujhe5yOexZj1Mua7WmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZMAYU6u;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9E606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE9E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZMAYU6u
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1404013c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223905; x=1794828705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
        b=NZMAYU6uFUwUQfR10zJ0gom2mrhC6KEARAAK7SbAgFMuz/8sRumMHfJipcQcoCs50j
         T+UzH9+2TDisbsCBJmw34cQed6RgOKg+bC4wCQWqLtEqh8NyWlTdjsEUt+9koU4n2SjF
         Z04h+MoOz4M5KC7DqpRGQ+8iHhjfcLlzxXgYOADMBXZsZ1QYv5txSUfTlubDUprim10p
         1o48vHi3PjMcVDLLk3lR4Nt6PfO/8UlWZ1FSY/Uofrw8wqeJ4O8Xv/CmEZtM0snmuloD
         26nK8OnuAElYYeUYfhhg0aQIVhVWNU4FyvDiDWLVJJ8Milif2k2s+otQlmFd507wBMcD
         uacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223905; x=1794828705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
        b=mc/6XikVKnYSvpuUUFp1Hr9lc52cF5WIVd0+sjpfUAkm32iE5muajC+v4OD9K5fioF
         jM3me+ir7VR9Bi7mZYTPRE7na5e/0ikBHrhvvTDATOOdIQ8GdUOwEb5/GXaXz3nD5TDp
         SlQos8B4lmmCHXanOXGA6z7ce893AzEAVmQ6eu1s+qZBfLnU2hF60Bn5d+8oiNeRitdX
         IdY2PvBKWkuN3EwYjvU6g3tOBF+TONIE4FbfrDJDON+4r6dsGH5fG/1GIF2fZQYGE2Ln
         peHk86uUlgr655gptatcbuaNe9g4fV28vzCDFUF2KEBR9oWad8RKHr1cDM8KyYtYgMus
         EQNQ==
X-Forwarded-Encrypted: i=1; AL+hErEa8wA8bITr8TcIUAG4EHfE/BOpZM/89J97t7OO3oG/pQ0g7kC1Yi15KJGK/QX6iD8lZNm3JGxRWyaUFvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEkCWZojwRbex+3vJJpPbXKNshERU5fXULSRUmAos1/C8CCDj
	ws48wwQ2b1ljc+/W+LJQ7lu1Ndi/GI0XpofcyAT3jJYZYNrwBkzR84t5
X-Gm-Gg: AYBFou0Tx2YZYzAuAjOiLq1ulEYA1zJgNoUqg3mlId6T3suUQ1t+4G97q3KXBYty6Y5
	boQzfcZD9PYg85aBUMYu7r4qQjHf/PL0JMkdr/ESmckGJ5/cvNk+vMgDGuO/buOr+afdmyquqsD
	rDXUbeahpTPkITxsN88uUpm1rEO+42P6F4nNXrowXz1bvm6yJSfGnOErJcaowz9ahcYqB3ojGBi
	ngc7JXodXZFeHStRle0YAfGybnLWJbKP/m4v4qgBlf6EWOYV4pnJHpaAwuqYM4kxjqRn7tEJDNG
	eE9nzEQtzp3KcGcFFV2nA9VF9jaUS8kFRtJCm06SO9CTZdROj0pTgQ8g7JEjCgFLqaKDGUuKLmq
	cV2O1LNJzl47xE1G4ELixI5333gUzVQfmunzeRPbK5QE195djvsGBVxAIzIotfhBVk/B6maezio
	oJMM9B+PoplPT1TUlLDHAEhRxZlLIP26Ya96Ob2VaGkr5sBU8oJpGOuUbXbsBBhHIQ3PzdnIVZh
	125z5J6czPq/OlyGLr+KaB6Y+7tkbnfze9zQ1aOGJoefQH62koHoxVSk+TKznmCIaRi8iMOVzn5
	JBPARAoSUAzQrOn7D9TM5qviWm4Yh5T9dQSnVSEjOqCl5I4oFuJazHfjvu4yhdedkCx8Gg==
X-Received: by 2002:a05:701b:2401:b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b39feececfmr6126165c88.26.1794223905110;
        Mon, 09 Nov 2026 03:31:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm17762322c88.20.2026.11.09.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:31:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] phy: rcar-gen3-usb2: cancel OTG work on unbind to avoid use-after-free
Date: Mon,  9 Nov 2026 20:31:21 +0900
Message-ID: <20261109113121.1534929-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

The OTG role/VBUS interrupt (rcar_gen3_phy_usb2_irq) and the role sysfs
attribute schedule channel->work (rcar_gen3_phy_usb2_work), whose handler
dereferences the channel (ch->extcon). The channel is devm-allocated, so
it is freed at unbind, but nothing cancels channel->work:
rcar_gen3_phy_usb2_remove() only drops the role sysfs file. A work
scheduled just before unbind can run after the channel has been freed, a
use-after-free.

Cancel the work via devm, registered before the interrupt is requested so
that on unbind devm frees the interrupt first (no new work can be
scheduled) and then runs the cancel action before the channel is freed.

Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2 (thanks to the Sashiko AI review):
 - correct the Fixes: tag to c14f8a4032ef, which introduced channel->work
   and rcar_gen3_phy_usb2_work(), rather than 2b38543c8db1 which only added
   synchronous extcon handling
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751..35e519a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1171,6 +1171,13 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+static void rcar_gen3_phy_usb2_cancel_work(void *data)
+{
+	struct rcar_gen3_chan *channel = data;
+
+	cancel_work_sync(&channel->work);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1277,6 +1284,17 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return irq;
 	} else if (irq > 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
+		/*
+		 * Registered before the IRQ so that, on unbind, devm frees the
+		 * IRQ first (no more work can be scheduled) and then cancels any
+		 * work still pending before the channel is freed.
+		 */
+		ret = devm_add_action_or_reset(dev,
+					       rcar_gen3_phy_usb2_cancel_work,
+					       channel);
+		if (ret < 0)
+			return ret;
+
 		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
 		if (ret < 0)
-- 
2.43.0

