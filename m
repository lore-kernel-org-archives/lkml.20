Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD15190462;
	Fri, 16 Oct 2026 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124357; cv=none; b=UTa520ocZCk2/MXtksw0iZ4fgeundGf5TOfxnJN/9L3qBaN9id+usA/JeBTMX8AdXCJu332dipssd8oPaLl36ZBMM+LmXgL/8p15bQ/81zOytTiOXjQkGiLmH8Df3NFTSerBYFsUT9Z69IZ0G3l8RJwH0xz8xmrVuGaL5hGsCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124357; c=relaxed/simple;
	bh=PC5BrwmvKNaZleWn/1Vr1yOtS3cJHKZ1xVrJYdiiG2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2vwiO7A7acjKOHHZJZkdyj3NaxuvcUFwqBRB1f5AjTCiXpZahSgsfEovpNWQLSMwm4y56cv+E0+w1qlqxPOGv2lwH/4BwM1iSiW/gnyTxuf4gdl9ut8nP3NKfYK7XSvwrHpYKUgR/6+KHDw59CM5rYPER9e2fCpugu7jMVPY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn; spf=none smtp.mailfrom=stu.shzu.edu.cn; dkim=fail (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b=Z5kugXTu reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b="Z5kugXTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=K3Akf3G/3u
	8zEPgbWZuKxqlKNU3hSMuCPNtj7j8swgM=; b=Z5kugXTuK0DCXsTFphgc8nDdsP
	frLbkx1W3zh4P4LE5/MPs//6+Vjq31JAmPVYeaSgKhOkuRwmrpLK91hlQPRV/MiN
	UDLRPjYS50vnh6pLTiHSYMJG6Rn3KBANFS0270oNFXoy6DD8vpyx0GkcGNze03rW
	wog89Z5ewtYaYOPO8=
Received: from localhost.localdomain (unknown [2409:8a50:9417:df90:2d38:f26c:c355:d0a2])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkBWmwC4pdFqMzyoAA--.9558S2;
	Fri, 16 Oct 2026 12:19:05 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [RFC PATCH] media: imon: stop receivers before shared input teardown
Date: Fri, 16 Oct 2026 12:18:48 +0800
Message-ID: <20261016041848.1081-1-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkBWmwC4pdFqMzyoAA--.9558S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurykXF18AF4xZFW3XFy5Arb_yoW5ArW8pF
	WrWFW3tFWDtr1rCFWDuF4UXFW5Wrs3GFW3u3Z8W3yjg3Z8WFySyayvyrya9a1Uur48AFyj
	yrZxXws5u3Wku3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK6Ix8MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8Jb
	IYCTnIWIevJa73UjIFyTuYvjxU9XyZDUUUU
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUICWrQ7rxwqgAAs0

Both receive callbacks access the shared RC and panel input devices.
Interface-0 disconnect unregisters the RC device before stopping RX0,
while RX1 can still access the shared objects.

An archived KASAN report records a write in the interface-1 receive
callback after imon_disconnect() freed the RC allocation. The selected
frames include rc_g_keycode_from_table(), imon_incoming_packet() and
usb_rx_callback_intf1().

Stop RX0 and synchronously poison RX1 before unregistering either shared
input device. Keep RX1 poisoned so that a surviving interface cannot
resubmit receive transfers after shared input teardown.

Signed-off-by: Wang Xiong <20221010117@stu.shzu.edu.cn>
---

Notes (mail-human-signoff-20261016):
    This RFC addresses receive-callback ordering during input teardown. If
    interface 0 is unbound while interface 1 remains bound, a later
    interface-1 resume can return -EPERM while RX1 remains poisoned.
    Independent unbind, suspend/resume and rebind behavior needs review.
    These runtime paths have not been tested.
    
    Selected fault frames from the archived report (excerpts):
      BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
      rc_g_keycode_from_table
      imon_incoming_packet
      usb_rx_callback_intf1
    
    The precise runtime repair of the archived crash has not been verified.
    No introducing commit is attributed by a Fixes tag in this RFC.
    
    Build-tested with GCC 14.2.0 and binutils 2.44 on x86_64, against
    base 03e2778d1f11de9260543f969e9e888a1c2bf830 (Linux 7.1.2).
    The baseline and candidate bzImage/modules builds passed. The
    candidate driver was enabled as a module in a minimal configuration.
    The original crash configuration and runtime repair were not tested.
    
    Related interface-ownership series, for review context:
    https://lore.kernel.org/r/c922986ec1b360b47165a591b3a539abf3b8792e.1789460680.git.sean@mess.org
    Please advise whether that series covers this receive/teardown
    ordering or should be preferred over this RFC.

 drivers/media/rc/imon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 9bb27ba8240f831ff5de42b0df50642b283108f9..e27cec2c103fa919e01656f0ce200bd372c3b96c 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2536,8 +2536,10 @@ static void imon_disconnect(struct usb_interface *interface)
 
 	if (ifnum == 0) {
 		ictx->dev_present_intf0 = false;
-		rc_unregister_device(ictx->rdev);
 		usb_kill_urb(ictx->rx_urb_intf0);
+		/* Both interfaces use the RC device and panel input device. */
+		usb_poison_urb(ictx->rx_urb_intf1);
+		rc_unregister_device(ictx->rdev);
 		input_unregister_device(ictx->idev);
 		rc_free_device(ictx->rdev);
 		if (ictx->display_supported) {

base-commit: 03e2778d1f11de9260543f969e9e888a1c2bf830
-- 
2.47.3

