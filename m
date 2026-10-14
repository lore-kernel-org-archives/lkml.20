Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD947FAED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962511; cv=none; b=MLPwymqDTGiRy2898f5aC/5hgyIWgvGhY2mkDcpN7jddskRuadcpSopNuCZlvKW9bKLUR6W9Shd7NUnzxgJIgC9r/tCRVy4PWxupXFU6PCXjCbftP/PXVPGUvmvLyT1di4DVLL2YT0fOUqUQfAQP7KyKmxELhJUOmdo3wPC7u/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962511; c=relaxed/simple;
	bh=mGsR+N+rXma5LNT83qO0fovYprAfG7yat+2Y+XvyBsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQfnnP21kZXZMLqT4196MDijPBKNNie/RaSwfvY0zFlMRPOamylA/bZ8nuStWspSyX5PdSDfT7U9ZTapjzvO8eBFPyK26o9GX3UDQrZXIapNnh0BTgRVm+n6HDG9s8U0ItlMldoa+DsUPqNNe3NIPsBR86pzmVtqRXxX4Blla4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so84695a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962509; x=1792567309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dL+Y3xB3PwIDv6lrVN7yeqg/VO+vYvrCP4fsm2K6Eg=;
        b=Q/p7LdST/LErf7ls25sW5NRI7q7Ye24+11A+2raf3+aO0nocJzsX9BnuRNE9Z59r9t
         JmhezMe7nR2GoqaWAp/XSsXXL/H4LepH564OuZubXUXVNxI+J+K3e/6ubG+kW7pXcEyu
         obwdLIvnPPM2d7tiYbDhojP2bxsLiQBmLgkaVHdy+on2RCBZNDvuAt7Cm/UbC+lIUTfQ
         Htiwm+9r8R/MRL5Tk3O76wwh/Be9jqe7dGqJT93UyD0ArpCBiEAHoAa1C2MMxT/gCN1F
         FKA73IYX8MDtUeqVJuvZbM3Z2NfjGuc6z9mQPO30ZhuZQIbn9RtVxIvbkcUtIfJ5ZiND
         FKvA==
X-Forwarded-Encrypted: i=1; AKwUvByY3XAYplhFZXkrUL6J9c7fcCEInJqddmgH/Gvc9MFf+1P91AfPXJ4+LzhaRQk561xuf1khnO0xSzrpeZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnwSwNanfonuaIK2nrcsevwPU+kFPIpUXHCiB/AkaDtD1RrOxh
	F010XvCx96Jrcfb/uvz8U3p4ePtdjhW4BjMANxWR5BOBV5OX5N+aEJHg
X-Gm-Gg: AYBFou1ZOw1HnQE2WFqczjF3VDu3HditknViqv+9EotjNB5h4ImD4YlxLkaIk/NO5hi
	R0bEJU0hZYISMq+RoLRmtdjYorZLSp64lcC3nUDrRYmySeBtkEhz6dej9IsvIMWbwe1K4ADbvQt
	ELl8x6DCEQiFrKQNkfNDac7CYUpcP213YDfMLMUn8j4HpRW7AdWlavV7NC0kBAlwfhs40IU17Cv
	fxbOHXin1JyeQmirXCH06JgBL3+w0p/Sh+bzMeqxcndKE6f1hjj/BOteMd5y3dS8WEwpqJyfP/+
	nYuh4ALgJBbeUHYnk4PjLuIC68QTnj3JCRJksxL/rGSR4F/PQgJMzCuSQgZjhS/dxlqMyiDrKIK
	ucp04neWRCDQCCtcPl+WODy+aumqoIBPnLiBkWZottvsQTi75qHX7Z5VeUP75lE17smDQhmA5+B
	tEOTjXOx1iCbA3CRLPlphafF91MeyJ9UdpoO8T4reSlv33nnllkmcA2BdOPYLhIHxbmjwHJKhBF
	U1mq0pU9MOiy0A=
X-Received: by 2002:a17:90b:1844:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ab3a955af4mr12801874a91.18.1791962509081;
        Wed, 14 Oct 2026 00:21:49 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac604b2f7csm2997758a91.10.2026.10.14.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:21:48 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	chris@the-brannons.com,
	kirk@reisers.ca,
	w.d.hubbs@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 1/4] speakup: Stop catch_up when the synth is not alive
Date: Wed, 14 Oct 2026 15:17:10 +0800
Message-Id: <20261014071713.321914-2-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014071713.321914-1-xiehongyu1@kylinos.cn>
References: <20261014071713.321914-1-xiehongyu1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the synth output cannot make progress, the catch-up loop in
_spk_do_catch_up() (and in its local copies in the serial synth
drivers) can spin forever: nothing tells it that the synth is dead.
This happens

- when the tty write keeps returning 0 (no room) because nothing
  consumes the data, e.g. a serial port with no device attached that
  keeps flow control asserted, or
- when an I/O error deactivates the synth: synth_out() then keeps
  returning 0 and the loop never notices that synth->alive became 0.

While speakup_thread() holds spk_mutex across the whole loop, any
synth_add(), synth_remove() or synth_init() then blocks forever,
which gets reported as a hung task on module unload:

 INFO: task modprobe:2999919 blocked for more than 120 seconds.
  mutex_lock+0x54/0x68
  synth_remove+0x28/0xb8 [speakup]
 INFO: task modprobe:2999919 is blocked on a mutex likely owned
  by task speakup:
  schedule_timeout+...
  _spk_do_catch_up+...
  speakup_thread+...

Check synth->alive in the loops as well, so that catch_up() stops as
soon as the synth is dead.  synth_release() writes it under
speakup_info.spinlock, while the I/O error paths write it without the
lock; that is fine, since the loops only need to eventually observe
the change.

On its own this fixes the I/O error case, where the synth is already
deactivated when the loop retries.  In the no-room case nothing
clears synth->alive, and speakup_thread() still holds spk_mutex
across the loop, so nothing can get in to deactivate the synth; the
follow-up patch completes the fix by clearing synth->alive from
synth_release() and by dropping spk_mutex from the catch_up() call.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/speakup_acntpc.c | 4 ++++
 drivers/accessibility/speakup/speakup_apollo.c | 4 ++++
 drivers/accessibility/speakup/speakup_decext.c | 4 ++++
 drivers/accessibility/speakup/speakup_decpc.c  | 4 ++++
 drivers/accessibility/speakup/speakup_dectlk.c | 4 ++++
 drivers/accessibility/speakup/speakup_dtlk.c   | 4 ++++
 drivers/accessibility/speakup/speakup_keypc.c  | 4 ++++
 drivers/accessibility/speakup/synth.c          | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/drivers/accessibility/speakup/speakup_acntpc.c b/drivers/accessibility/speakup/speakup_acntpc.c
index a27e6bbf05da3..fe19ba3f00053 100644
--- a/drivers/accessibility/speakup/speakup_acntpc.c
+++ b/drivers/accessibility/speakup/speakup_acntpc.c
@@ -192,6 +192,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max = jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_apollo.c b/drivers/accessibility/speakup/speakup_apollo.c
index d2fbb3f572219..b62696e050fc0 100644
--- a/drivers/accessibility/speakup/speakup_apollo.c
+++ b/drivers/accessibility/speakup/speakup_apollo.c
@@ -157,6 +157,10 @@ static void do_catch_up(struct spk_synth *synth)
 
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		jiffy_delta_val = jiffy_delta->u.n.value;
 		full_time_val = full_time->u.n.value;
 		delay_time_val = delay_time->u.n.value;
diff --git a/drivers/accessibility/speakup/speakup_decext.c b/drivers/accessibility/speakup/speakup_decext.c
index 271bcf279bf9b..e6be5a99670bd 100644
--- a/drivers/accessibility/speakup/speakup_decext.c
+++ b/drivers/accessibility/speakup/speakup_decext.c
@@ -171,6 +171,10 @@ static void do_catch_up(struct spk_synth *synth)
 
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_decpc.c b/drivers/accessibility/speakup/speakup_decpc.c
index 1bf36d1e54773..cfafd94759639 100644
--- a/drivers/accessibility/speakup/speakup_decpc.c
+++ b/drivers/accessibility/speakup/speakup_decpc.c
@@ -391,6 +391,10 @@ static void do_catch_up(struct spk_synth *synth)
 
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dectlk.c b/drivers/accessibility/speakup/speakup_dectlk.c
index 56334405d865c..d9247c53d3275 100644
--- a/drivers/accessibility/speakup/speakup_dectlk.c
+++ b/drivers/accessibility/speakup/speakup_dectlk.c
@@ -246,6 +246,10 @@ static void do_catch_up(struct spk_synth *synth)
 		spin_unlock_irqrestore(&flush_lock, flags);
 
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dtlk.c b/drivers/accessibility/speakup/speakup_dtlk.c
index fa826568937bf..73cd39e781b86 100644
--- a/drivers/accessibility/speakup/speakup_dtlk.c
+++ b/drivers/accessibility/speakup/speakup_dtlk.c
@@ -206,6 +206,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max = jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_keypc.c b/drivers/accessibility/speakup/speakup_keypc.c
index 9356f63795603..e229009107f75 100644
--- a/drivers/accessibility/speakup/speakup_keypc.c
+++ b/drivers/accessibility/speakup/speakup_keypc.c
@@ -193,6 +193,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max = jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/speakup/synth.c
index 11cba1fd8715d..6a49ff475c16a 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -75,6 +75,10 @@ static void _spk_do_catch_up(struct spk_synth *synth, int unicode)
 	jiff_max = jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing = 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
-- 
2.25.1

