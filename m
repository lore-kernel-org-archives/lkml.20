Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FEF282F14
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993519; cv=none; b=NRZykIhasdEJGWzhFP5VCDYcfh4sgDeWVq8quV8zV3xHdYY9puL1ApNICDKfT4yYsPKnhHKhJw6mAN0inQDYQoceBmjT21gN1B6ZGpe7D8bLzP3B75oD5zD0+uVme3VGWhM2of2YhvZ8HKcDRnry9kDavFlGbuNePOxmwpLC+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993519; c=relaxed/simple;
	bh=5ba+AIFlGWceY3fXdaiAzze9Fa+HRQbU3Qoi67Cxed8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiKdGUPIPFt01zCQ1A9KIeBcIAZKYxGZ1SYZXOU1PGpLZh5kMGj29TjtDatA7Tx+3wnj17nyh6cC6EV3Ceeh18gQwBhIzin6uBrszP+3MCGTW+3kX9RxKkWnsUf2+iLhNpQLMFRCAEIvAm8BRBHzDewEAZU2C0shDqdsrYsBsyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i02COPYn; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i02COPYn"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so226897c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790993517; x=1791598317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L190hWySRAxyQE87dH/KusnmVEu7556vLx/BbFXjBgc=;
        b=i02COPYnYsErH1fIEF/4efcCkIvyfYznmL5BzXiXmbutcMgrYIGvo1et1r99EaTimD
         hdUX/NBopTrs48o+GvnG0HWMrz55HKVMxb2bT7GSCAIdAxPWI030nseEVt11QqW/poTJ
         1ukN5zmNJT3mQysKwuV1A1D5yR72ZSnqiSqqBYAXVx09ENuHPsHdAPcWH6Qo7Axhb1TO
         o+l1OvlHSYo4geKbm/4/b07ZVKMLpeJkU9II55iudAHyE5VcjHH37HcDXpA9Ui/SOe47
         xnU/8ozrRu2N33XJLrVW4lvISUUGR8/YItjehS9sgSdnnBpNlKfG/g3f1kfzeoTinCFj
         Mxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790993517; x=1791598317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L190hWySRAxyQE87dH/KusnmVEu7556vLx/BbFXjBgc=;
        b=ugKk0bBu7GkToA4ioicDOqDguJ7jQ0xrYzIRPFIP1CPKtQwMLmXokWfS2jGq16q5bt
         J4Te7gCAwfzpP9AZyyhsHg2wWvg8vA+x5aSaJp9rr+GX6UpCs59XjWyNO5wwokLpDI6g
         7GuXGVJ+MO24eTAMsZYInu4vyzndUyMkEZh/Q67q7ZX0bkKSxyhn6ywK2FYjRPu2o3rM
         nOFtZSUK0HirOuWBnbgfCpbPrS4qfaYwjNSyBT2D+URIBsF1GZeWRFFkNQstujDUeZzW
         qEEUKoKQDab44ZRXuekFpEeCTUIb/todgTQHX/gAIpOJf0C/Butpiyg77nGtjDMtWXiH
         keWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH+nLM+eadcYEcdxZi/o+c1XIgaINK1VaCKiBqAdgmyRpm0b5mgiZCxyaBcXNxuyPkSwhzxdpiwEoJ8YE=@vger.kernel.org
X-Gm-Message-State: AFuF++lxh/jVzGjzX6GetiZ+2jOSQ2sOdfTdXTMZHjXocsnfm5SgirJR
	HAqa/dZJpiOxgotmwzIL1B4tmBBUQpGSj0Q0OVeS1uSXQNwbiey980EB60doAw==
X-Gm-Gg: AYBFou3gDMMB0MZo8IoyTEXiM943B/UrQYKhz6BtJF6fpJoNRor7LgRgUB3MCVBy8R7
	5Wo1VL3zbUOOL6PHLMdqRNEUjAy0HXRZGkJ5Nz+8B8oN/o9Xfk6vsdXOY482g1/hQ7VcM4JkVMH
	dC+Ge9SO3TJ/FnkzddIB5thpq6DEU3Yzpqd8IZumE01HSdbr5J+Z8BnNnZ3b3G/xQknHsUgTzZA
	gV+0OcmLoXHc+DLIRKz3+bwuAIdMj5eqq+UDL9rkEQOftczDYaFtWfSW9BI0wnoxVYg7ELo3pev
	IQs9NsocBIk2nNlRC/C5U2Yqy+ARctsWTOw7hLvAKJLetd/p+BrNxLBiAe9aRxrCMM3Rn/NaMTr
	zO+PhUUhfBrUbwNbhHssLuWf4oE3sQvyOp2rWM49yryq0PYmxqFPxT9BxZL1k7ZskBUjLjPLBae
	ICga71otPc+r4XTkJbcjR0ytVeZxoLOJfXC+i/SA2CslenVFavZdii97AN5dncn1zvzqxwxGGGb
	zw8f4tbDeccAwEEZHdgXPYgU9ewgZk8xSQwZ6yBf6fr1qp6kEALxZtFT4NIBc1Y6ysSqBnvQw==
X-Received: by 2002:a05:701b:2505:b0:143:6080:668f with SMTP id a92af1059eb24-14f5b9fb5c5mr5271144c88.7.1790993517103;
        Fri, 02 Oct 2026 19:11:57 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:a40e:1ae:8931:c183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc87346bsm2316287c88.8.2026.10.02.19.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:11:55 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: toke@toke.dk,
	jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Subject: [PATCH] wifi: ath9k: stop WMI event tasklet from rescheduling itself on probe failure
Date: Sat,  3 Oct 2026 07:41:47 +0530
Message-ID: <20261003021147.7461-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the init guards were consolidated, ath9k_wmi_event_tasklet()
reschedules itself until priv->initialized is set. If
ath9k_init_device() fails, initialized is never set, so the tasklet
keeps rescheduling itself while the probe error path calls
ath9k_destroy_wmi() and frees struct wmi. tasklet_action_common() then
touches the freed tasklet, causing a slab-use-after-free.

Make the tasklet drop its queued events and stop rescheduling once
wmi->stopped is set, and call tasklet_kill() before freeing wmi in
ath9k_destroy_wmi(). The probe error path already sets stopped and
kills the RX URBs first, so the tasklet cannot be re-armed afterwards.

Fixes: 1af8dc9ca726 ("wifi: ath9k: Clean up device initialisation guards")
Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/net/wireless/ath/ath9k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 4a08babb6d9d..f8b174b0f209 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -122,6 +122,10 @@ void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
 
 void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
 {
+	struct wmi *wmi = priv->wmi;
+
+	tasklet_kill(&wmi->wmi_event_tasklet);
+	skb_queue_purge(&wmi->wmi_event_queue);
 	kfree(priv->wmi);
 }
 
@@ -148,6 +152,10 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 
 	/* Check if ath9k_init_device() completed. */
 	if (!smp_load_acquire(&priv->initialized)) {
+		if (READ_ONCE(wmi->stopped)) {
+			skb_queue_purge(&wmi->wmi_event_queue);
+			return;
+		}
 		tasklet_schedule(t);
 		return;
 	}
-- 
2.43.0

