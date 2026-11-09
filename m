Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215807;
	b=AVbf9lT3KPJ2NlrbAU2e9939pgDA7rh4k7zVaimMFOk5KhUP64PRCEZ0/PpDVkZllRDf
	 Re/yAvun+pT2tU0J2u0w6VyMNBsVNccSi8EdVgN0XTW2BdrExZNO9G8clkp65ENp6kssw
	 yP7yO03jtiyZGFgVU6wY01zoUIZD7VNbbrWqoxBPNdvkuFdDDnEQzo8zKlEGKOe08IAUt
	 mDG33fXNLhIR6vbihQshOa4Brz8/n9j8ay0gd0moMItdoN6VJhH6wmIMVARXVeyl4NXcK
	 cAZQwVeQrdYQyG48cFJP/un44PdnVyhQJpeVsYhXpQZ3+Cxl5Ofh/SrixnVm2hB8x5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
	b=nQLoauQrIiGCZumhrBr7ZLNcJM21aGAqQebrHILdL0Pv8GhUKsyjqnSUYxQpY51lL2a7
	 WE8Wa/vkWvugfBNu/GXlYyOod+oefjebpeqYn5M0sMcFktGdDqsJ4Pg5GQ6Kz6y3IN6gB
	 0apY1TywazHDoM2NRl2H5kKc48d4P7BM3VVITuJ+liKzB6KinK+wsZ8aTuPqRR6Ue04yf
	 irMlpvdmzNZf62hRS5MZa1M0vGPNIxOs6k9jUkZgOhGSAHerY79aiNNyPvKK2sApnengY
	 zk6RmBQQRINmYqLTcLVXx5taeH7Ahn440kDOGadpkzpUKhkedSLMT+ErMjHaTswyL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlLjh34f;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF060A6F59
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09BF060A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlLjh34f
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so1123254c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215806; x=1794820606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
        b=mlLjh34fWJrUQyEM0QJmTVBhUuD6/MixZtoC4K422wie0uhVjBgC7cFSJIhg0EEW7v
         Sg91/qMumkPqqy85RyvTY+NVBLzB3L2hephR+u2b9TpvUSD2MaEX/LZ5f3DwHp83hFdN
         BjluUvZwYl77/TT+iPCH8jRS7cAz3AMuZscmUWE39i3//XWmoUbRWyVYoPW6YDikf8t/
         349fvuHYw19W++3018hUZm2tENmljkwSZVt9FFewfA2Rlvbu7ewhROR6Qu+gMHB7EnAl
         25cdb8o1HmOWLKQ58KbDjaecDL4kgWdX7r7jVFHki8IGVrzT8bdr1qsrU457ZGmEWHk6
         0I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215806; x=1794820606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
        b=cb4PDfS9hNKc+exI2ULVQTi/mnjOB6fyO4t98r+EuNlFYxrLE/gKhrqxaKj9edOiXy
         2fNOGJpdgHKFYaXUuf5pNyaKdMD6aMLDXQ2Gkd154UlloxQsi1geG07xjmE3s9K9QEC+
         kiS0ln4zZJY5G3k9HAlOUyH8rvpWA0rd8LhDdzq1y+V8vMLN+Wo3YeoWuzhRme3UlS8i
         NAsVz2qmess+o7r6YmDez4h+8UaoqpbOQtYmwvGeGCo4toA9xBoVEVAkLSKkjJQoki7n
         QypqOqRzziG5Mgisd7brgu4XzlL6Km+bprkp2jaGKg3Vp6qAutj+Q/gxuMwSd8RBf8am
         4/bw==
X-Forwarded-Encrypted: i=1; AL+hErEEcsoBaKfoVzHFUIk8jChM8U8EsjXHHtdrmVoWtVgHiuPxC3w2SPOTVjM7PoAK8xwPV4Wp8U1BPiGmVa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KuoBo37sJJGybruTauKJ9t7AAOeX0OFnrC4aqT9eUWbTgKQxQ
	RqaSzS0AYenQbGsdvQBvayh0K3vQWGc6A8WvNiIQFiPu4dVzBGF7/dHt
X-Gm-Gg: AYBFou2CRiJa+PCMiQXjDKALKbefMxK3W55mO2XCKeg3toQZ0dURHEB+7tg7q1fwqpc
	pHEpucapfqLzq9DMzHvCJxG6IwxBn820eW8VdBAatW1g56rdOrskAxpcK9EMBGJJ9+scAvt4jDp
	9xUEoBYYZXWyVeYYSQ2BYn2iCA8X50SHwxJB57LFSu2SqC/ujYUTy1C7I2OuVQhr8Y0rWTK6iDC
	KAUPLsB9AIw04cHALGzi5Yjjxw3oUnDBKSQM95wVH3QKrGaFZxxNV2BDJmSyOgLld9Dd/Z7EFT5
	L9Dw1zBZIJLm5ve95z6qHLDxxA9HMTlT5CPQSPUNeTP/ndEW6NV7hmIrllSAzNFVsiIaGf6ZH/c
	7uOSTNjlKI2M7/fYSxDMqhE5iaSsQ5TBg6112S9r1jn/Bj8utI0LD/PrXoK1McXX5tS8Hjl3Ebz
	aIidIrjh5jUUx/y5LQ5WQg7Zoxwu1dONPpnbBTr1qQso6ptjPUsee/RCcx/x9xP86d4xS8pr045
	shHioVDQVFzjjU7Pyod8FNHfZ7UBAo38YGi6WoCwDkyCCkPYMh3CPBnEUOPzkDbuUGe/XHxpP64
	yPvqfzhTQ+7sIrm5almJHN7ezHONcipgMn0JyaLvJHMy4Zy/8g==
X-Received: by 2002:a05:7022:e02:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b39feec174mr7917195c88.26.1794215805760;
        Mon, 09 Nov 2026 01:16:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm10675160c88.15.2026.11.09.01.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:16:45 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] phy: rcar-gen3-usb2: cancel OTG work on unbind to avoid use-after-free
Date: Mon,  9 Nov 2026 18:16:33 +0900
Message-ID: <20261109091633.1430331-1-hj351016@gmail.com>
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

Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
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

