Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C89558219
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084248; cv=none; b=Y2Evo9HnXAf0ynSpzQzJCc2S4HjHDaAecBhtlGgK23hDXw2jPDUf8wZhvEsn+ShgPFUPeDbgrdxs1oFHfiR4cwNA8B5ImJnOD9R6PDlC9kPtpiX/DUUyD1WCXR5lZ5Xyx4ZdZlQLAX7aGaKXv650SI//ws+spHyxl5PHxEBN5ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084248; c=relaxed/simple;
	bh=r1yI/mURwoNWGMBHDYJILOCmCkI/6succr0pQly7zis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZtiWaiRc03p/bO3u/4Sykgd9IeUoR8Vv9phpnExLPOItp5aMBucA1hb7VT76Rw0hUky8NYfFhGa/hqnISSibQGdJvsEieY8U+/VedUmjfVM+D/ck+HndYy4y6rvBQtyu09R3FwwBAvg6XZ04JTkBqFogyu51vQk3Xlw30DN+/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9HeuiZc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9HeuiZc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e5d0ee1951so35490925ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084236; x=1792689036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQT+z+T0ARFblj0EQD0i/HGCdN/QsHuiDrE8b/C/HtQ=;
        b=o9HeuiZcZRB6aGgRDXxTzKbZXrR7ArRTEF7+an0ZNN8NQbFpmxCGD//aVkV8CtbqzO
         TaQAJnEalm6rC1FDc6tK3V5XLy5nQXXG21M3kXMnXQacQ9ntw7JZ+ZkU+FPwHV3p6qBH
         rgaXBow/E8I0hlplR5L/kqpHmLqOc4nP08KD4pqaTuDzJk7//+rQVvyTW+c2aD1PxPtp
         UYH9pGylhIlJ3RlouTEDzn6spcV/0WnscGCPDIXh5m2/QysklxzFyHV2T44fgITlzNu8
         C+J9esl3Y3ybNHgcj5hTRCOTVebF8+dA9gm2vM9r5jmv1BBzy3H++RpZjJSrXOjnf9Sp
         T/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084236; x=1792689036;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQT+z+T0ARFblj0EQD0i/HGCdN/QsHuiDrE8b/C/HtQ=;
        b=YKsgFXMElYwL0ye7b5TpyISyk4L7eUqiwYcn4RHuf1rFmBPKhnamIRQiSQM39ZOzlM
         aroa1yd5udLa0QO3fKrYB9BybPOmhjptTeatuNPkdyfBqYnvYmvopM70nlcb6PzhRXgz
         VC/0vUArADXQ9vJcOIjUe8hDMgmQvkPemnVyRg/vcD9BU5BFmvY92PYVrH8637U/8/Ib
         GvSiyDBpF8pVpgWkilVIh/bmQXLofjFEdlXYF4OO1cg771AvEnzuMEoW4TEZV1KDPNat
         2v8HDKY8cuBFFoPK5P4rSD1oeQ7p+SOHNUTtTp5FeuCl7PWiwc3JkQZ1Z4Ui6XvHD2TR
         Az/g==
X-Forwarded-Encrypted: i=1; AKwUvBx5jkjDkQu2x0fb5bWn8baVKaY5+vIX5I82c66RA3PdkS98LU7/zUcwiFadXB48TDJztcu0bl3LFQVVuEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6wbSSPMA+hu0M14brxu6hpk6nsLbw7n9LEosY3HBaiAmxge++
	+9BO64+5Sk2+Mjoc/2bb8Zy0yPCdFKFZyUR/WvgRgVFN8VaFqwALzBX2
X-Gm-Gg: AYBFou12kKQBcSFPZYC3tpBQTaozkHd4W5JMZUO4JjzckDE4CKWxUTBCkBAw5ZLIoIZ
	A8OZn8YxrCN49QPG+EUjE5cAe1qk3dPNL5z31He3uehfLIa9aosykElghgYGf3zO4bMRyndoW8e
	CV8m60YiRyTGRI7R5FeBTI6mxACoWjxmQHoKuoQ+tnmorteMLxrpoqzdI93IJ6TxujXOovJB5Mt
	Qqh2lCiLQv5nGjWPSBoja6zNYveLJIIgH+7eyvW2pOe84RctfQ1JaSm/enocFEXGaM890CGcGiO
	+hOXjMzgJC3HWzNGcpgVAYdusVksCD4qMq1VQdJh+gsR/Z9POls5AQV2VPDa/7mr0SQVcokIRHN
	NBU87ySR/ZdONL/BPopdeQxr77kKfdb9P2OjLu0Ef8XetdzlEHHGiIcKUCdZhxkScHhjIJECuCC
	C0r0OGnFeKaqIrh1BzAmzDgSYtuEbhZqh0H5nObXFWReiprgc1pYI8+0OBB8NulBB4HA==
X-Received: by 2002:a17:902:ce0d:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2e957148c0bmr30370155ad.55.1792084236177;
        Thu, 15 Oct 2026 10:10:36 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm20682055ad.27.2026.10.15.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:10:35 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	zzzccc427@gmail.com,
	phucduc.bui@gmail.com,
	cassiogabrielcontato@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	yilinzhang@moonshot.ai,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH] ALSA: pcm: Keep linked drain wait entries safe across unlink
Date: Fri, 16 Oct 2026 01:10:29 +0800
Message-Id: <pm-alsa-pcm-drain-wait-lifetime-20261014-v1-face1209fbc882aabda2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_pcm_drain() queues an on-stack wait entry on a linked playback
peer's runtime->sleep. After sleeping, it calls finish_wait() only if
that runtime is still found in the caller's group, since the peer may
otherwise have been freed.

Unlink wakes the group members before removing them, but the generic
autoremove_wake_function() removes an entry only when the wake succeeds.
If a signal or timeout has already made the drainer runnable, the entry
can remain queued after unlink. With unlink performed before DROP at
final close, the following ordering is possible:

  Drainer on A                       Final close of linked B
  ------------                       -----------------------
  Queue stack wait on B->sleep
  Signal wakes A: TASK_RUNNING
                                     snd_pcm_unlink(B)
                                       Wake returns 0; wait stays queued
                                       Remove B from the group
  Cannot find B; skip finish_wait()
  Return due to the pending signal
                                     snd_pcm_drop(B)
                                       Wake traverses the stale wait

Use a drain-specific wake function that removes the entry under the
waitqueue lock even when the task is already runnable. Preserve the
ordinary wake result. This lets unlink detach the stack entry before
changing membership, while keeping the runtime check around finish_wait()
so drain does not access a freed peer.

Also hold the existing group lock from selecting the peer through
reading its runtime fields and queuing the wait. Releasing it before
registration lets unlink perform its wake before the entry is queued,
and can let the peer runtime be freed before it is accessed. Release
the group lock after registration and on the no-peer exit path.

Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c379068b54ca3bc254605dbe2fc2a27bead5f0e..e53fc8316a96f66f35f7f7db97a7de131804d2c0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2177,6 +2177,16 @@ static const struct action_ops snd_pcm_action_drain_init = {
 	.post_action = snd_pcm_post_drain_init
 };
 
+static int snd_pcm_drain_wake_function(wait_queue_entry_t *wait,
+				       unsigned int mode, int flags, void *key)
+{
+	int ret = default_wake_function(wait, mode, flags, key);
+
+	/* Unlink must remove the entry even if a signal already woke the task. */
+	list_del_init_careful(&wait->entry);
+	return ret;
+}
+
 /*
  * Drain the stream(s).
  * When the substream is linked, sync until the draining of all playback streams
@@ -2191,7 +2201,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime;
 	struct snd_pcm_substream *s;
 	struct snd_pcm_group *group;
-	wait_queue_entry_t wait;
+	DEFINE_WAIT_FUNC(wait, snd_pcm_drain_wake_function);
 	int result = 0;
 	int nonblock = 0;
 
@@ -2246,20 +2256,20 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 				break;
 			}
 		}
-		snd_pcm_group_unref(group, substream);
-		if (!to_check)
+		if (!to_check) {
+			snd_pcm_group_unref(group, substream);
 			break; /* all drained */
+		}
 		/*
-		 * Cache the runtime fields needed after unlock.
-		 * A concurrent close() on the linked stream may free
-		 * its runtime via snd_pcm_detach_substream() once we
-		 * release the stream lock below.
+		 * Keep the group locked until the wait is queued so unlink cannot
+		 * wake the queue and free the peer runtime before we get there.
+		 * Cache the fields needed after releasing the locks.
 		 */
 		drain_no_period_wakeup = to_check->no_period_wakeup;
 		drain_rate = to_check->rate;
 		drain_bufsz = to_check->buffer_size;
-		init_wait_entry(&wait, 0);
 		prepare_to_wait(&to_check->sleep, &wait, TASK_INTERRUPTIBLE);
+		snd_pcm_group_unref(group, substream);
 		snd_pcm_stream_unlock_irq(substream);
 		if (drain_no_period_wakeup)
 			tout = MAX_SCHEDULE_TIMEOUT;
