Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668492;
	b=xD9ewXCr4s/hx40d9Gy5mvwLs7azbwQv1LYOGCtsGqPJ45canTiaxNYC5OLnqZghPvJG
	 Lp7hGL2ZkFw9diqOqgwmF6nItnLtLdnCNGzZZezdC299zGzVu95bfdKXHAJKyyOTydLbR
	 DH1boy4lxpB+q4soOoCwbrSWhrjLe2iB4F/iVfhA9mm9nRxvxCAb0uwhGeLKWmYuXsKmZ
	 ZIB/8wzdf2MSQwEXdkzbVkIjpNqI7FlzO3eHMSHmgZQcIRhHJLmhu3TgmY41KTxGPlOkX
	 00KdqULbavvfKbVhFQO/gZVLZtB1aeRGQst7pFIslX6JyIonFvYyavOwQbA+wYy4NWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668492;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bGBbvEyNXQ9kpI+I2OBxN/fHwF8Lik0cSsDj+zUuuBA=;
	b=4k4dJDNLBAlZkaZN/bTrxfTmnV7lJecAOOYhAWqU8KJ1MZ17cVdoC5OuJ2uPXRHUy7U7
	 3M4rPiyjb6dBifho8wnDHcV9tegliilC5aY8ideaMQlJfOn+XCzLtqjS/pN+Z15dHHkys
	 pXrInRuahHPPAgapiDgWoVFgjSjiXiZuk/129jGlMbrmpxPbsiT27whscxxgUP5fyQECA
	 I7wdNLMt/ilteMx9UyPGd7QLtZnnghNPESepD99XG97eiVbEw0orDRl1bWN/rzYIGAlhS
	 K+pMAZKi0QdEskQOLu790PixdKlVhVf70/+Rrx2ni7ldMZfxBuFjoFwMBfDvc51T/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9666606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9666606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3027076eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668491; x=1794273291;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGBbvEyNXQ9kpI+I2OBxN/fHwF8Lik0cSsDj+zUuuBA=;
        b=EjwzsubgpnHkcfyGpbmprn5vETTTfDJZTqfyC6BRcOTkNozA9LgAGy/kPpBt7X9O2T
         e2ySDbwSXJeO887AKWUFgMzFlQiZfhex75Tha1l1B6SdBMoOcrzUSU6T3lyveqfv6fAK
         n7pcOk53OJcOFQwmfb5SkkKc3PBEFUqfwNlervwo0C2Ow7oGDqeYbmjsO+V+aEyEslYI
         OPODPVD7ccJZfSt4tJswIcTGcRTHfclMvw87Bu6IrfqNloF6o1cTF4Xock+NIU/Yxk51
         vMp1YEvVi7OEmCm3Kcvuj2ybxCCDOl02BwPZdiGdSn50JBjyCBFXqyhzhxHIACFEBRfX
         YCAA==
X-Forwarded-Encrypted: i=1; AKwUvBywBekk9Mp+avcLxIr1NVl9IR6DOqTgOP+q1J6Rs/vgwPl8mIpink6HLmJCjgS40gN8wSTZsgOB0ihPtF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ECAfmL3oqJ6cKlEk1pgQQdYyo2dxhQx1S2vARYicOUKcaoBU
	OYfYF6tPLki1tisLPHna/JQ1KvFCO2YqmweroAll3QDVUthXSHPAkaHoqcYZnw==
X-Gm-Gg: AYBFou2LFyxpKt1ULHDjDewu8Y6zacGiQKfP2sgXSLikUUIa0X2/fxTU//ZiLV5/iMP
	U9tbPAm1l2TxtscqyQt1CX4khAZvmvN/nC6NnN46v45Y8FEkqY9DY9wFii8SOVG7FgRyDjfp2/t
	l2mJz2m6VmZVghE11RYxZ6YmYR0rkAaOonHXVENEVX7OY2KjNucFNXTDwgUjGtu32xv0NA7yTLu
	h8Y4++1Yd6OUrXCQXz6vDY+5NBWzVDIDfLPGgVRFmJcf+fdGlwRY1OLJUt5hfKpgFpf0MuyE5dU
	svfudGFO8YWvTXBSjVzPbkwLDtwmGjRDxgUmrwjwluV6VeZKt7IWxdFFu8jXXVjP7/5o9FX3F8t
	klVqASN2RIEnd3KNYG/xoBxDpeU+GyNh0BNB30nTNrKlFPPGVCe0OMbNu+hZAYjcTDRyrLLtrz9
	mHyt6g3Enofa0sXlXBsidYgvnzQnuhbXBsh7EB2VDXxqDmTzYGmt2aak6fIZnFWuney0Ovs4qtF
	zNYRzbf+33kE9yrynI9jcGO34L0t1Q9AXYABisCozPj9CEzJ9cqrZj0VOs/JQmTZxU0l6qFLILK
	L+fNGI3jjDRV5HrabJpmTGpw66gH9vkCBYCjv+uJO7F2YIG2ZMV8jJyAdbAgtSGw/nAZSWIua8Q
	jGgUMWloE61pl+qWzMcmCmeXhIDPQOE38N9cX
X-Received: by 2002:a05:693c:6382:20b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-36a423f5d7amr18122565eec.31.1793668490612;
        Mon, 02 Nov 2026 17:14:50 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm51988583eec.1.2026.11.02.17.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:14:49 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject: [PATCH v3 2/4] speakup: Do not hold spk_mutex across catch_up()
Date: Tue, 03 Nov 2026 09:14:45 +0800
Message-ID: <179366848581.70545.6758144332656658334@kylinos.cn>
In-Reply-To: <179366847311.70545.1738521378158835923@kylinos.cn>
References: <179366847311.70545.1738521378158835923@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

speakup_thread() holds spk_mutex while calling synth->catch_up().
Apart from the indefinite retry loops fixed by the previous patch, a
synth that digests its buffer slowly keeps the mutex held for the
whole drain, so loading, unloading or switching any synth module
blocks until all pending speech has been output, which may take
arbitrarily long.

Take spk_mutex off the catch_up() call path and keep the synth alive
for the duration of the call instead:

- speakup_thread() raises a catch-up count and releases spk_mutex
  before calling catch_up(), re-taking it afterwards.

- synth_release() first clears synth->alive (which makes catch_up()
  return) and wakes the thread out of its sleep, then waits for the
  catch-up count to drop to zero before releasing the synth
  resources (sysfs attributes, variables, tty).  The synth buffer is
  cleared there as well, so a switch discards the text still pending
  for the old synth instead of waiting for it to be output.  As
  synth_remove() only returns after the drain, a synth module cannot
  be unloaded while catch_up() still runs, so the synth structure
  and its tty stay valid for the whole call without any module
  reference counting:

    CPU0 (speakup_thread)          CPU1 (synth_release)
    -------------------            -------------------
    atomic_inc(&synth_catch_up_count)
    mutex_unlock(&spk_mutex)
    synth->catch_up(synth)         spin_lock(&speakup_info.spinlock)
      /* reads synth->alive,       synth->alive =3D 0
         synth->io_ops, the tty */ spin_unlock(...)
                                   wake the thread out of its sleep
      /* returns once ->alive      wait_event(!synth_catch_up_count)
         is 0 (loop exit of the    /* resources torn down only
            previous patch) */        after the count hits zero */
    atomic_dec_and_test(...)
      wake_up(&synth_catch_up_waitq)
                                   synth->release(synth)

The SPEECH_KILL key handler can revive the synth at any time: the
is_alive callbacks set synth->alive back to 1, so a revival landing
after synth_release() cleared it keeps the loop running and the
drain blocks forever.  Mark the synth with ->releasing under
speakup_info.spinlock while it is being released, and have
spk_synth_is_alive_restart() and spk_synth_is_alive_nop() skip the
revival then, so the drain always terminates.

The wake_up_process(speakup_task) sites (spk_do_flush(),
do_synth_init(), synth_release()) get the same treatment: the
keyboard notifier is registered before the kthread is created, so a
key press in that window would pass NULL (or the kthread_create()
error) to wake_up_process().  They now take the task pointer under
rcu_read_lock() with READ_ONCE() and skip IS_ERR_OR_NULL() values;
the exit path unregisters the notifiers first, and
atomic_notifier_chain_unregister() synchronizes with the RCU
readers, so by the time speakup_task is cleared no wakeup site is
still running.

After this change spk_mutex no longer serializes synth registration,
unregistration and switching against speech output.

This depends on the previous patch: the catch-up drain introduced
here assumes that catch_up() eventually returns once synth->alive
has been cleared, including in the local catch_up() copies of the
serial synth drivers.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/spk_priv.h  |  3 ++
 drivers/accessibility/speakup/spk_types.h |  1 +
 drivers/accessibility/speakup/synth.c     | 59 +++++++++++++++++++++--
 drivers/accessibility/speakup/thread.c    | 11 ++++-
 4 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/accessibility/speakup/spk_priv.h b/drivers/accessibility=
/speakup/spk_priv.h
index 9da57ead17cb..967862cd0440 100644
--- a/drivers/accessibility/speakup/spk_priv.h
+++ b/drivers/accessibility/speakup/spk_priv.h
@@ -75,6 +75,9 @@ struct spk_synth *synth_current(void);
=20
 extern struct speakup_info_t speakup_info;
=20
+extern atomic_t synth_catch_up_count;
+extern wait_queue_head_t synth_catch_up_waitq;
+
 extern struct var_t synth_time_vars[];
=20
 extern struct spk_io_ops spk_serial_io_ops;
diff --git a/drivers/accessibility/speakup/spk_types.h b/drivers/accessibilit=
y/speakup/spk_types.h
index a5762330e249..efb931db1850 100644
--- a/drivers/accessibility/speakup/spk_types.h
+++ b/drivers/accessibility/speakup/spk_types.h
@@ -200,6 +200,7 @@ struct spk_synth {
 	unsigned char (*get_index)(struct spk_synth *synth);
 	struct synth_indexing indexing;
 	int alive;
+	bool releasing;	/* set while synth_release() drains this synth */
 	struct attribute_group attributes;
=20
 	void *dev;
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 6a49ff475c16..40870949b3c6 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -24,6 +24,14 @@ char spk_pitch_buff[32] =3D "";
 static int module_status;
 bool spk_quiet_boot;
=20
+/*
+ * Number of catch_up() calls currently in flight, and waitqueue used by
+ * synth_release() to wait for them to finish before tearing down the
+ * synth resources they may still be using.
+ */
+atomic_t synth_catch_up_count =3D ATOMIC_INIT(0);
+DECLARE_WAIT_QUEUE_HEAD(synth_catch_up_waitq);
+
 struct speakup_info_t speakup_info =3D {
 	/*
 	 * This spinlock is used to protect the entire speakup machinery, and
@@ -154,6 +162,8 @@ EXPORT_SYMBOL_GPL(spk_synth_get_index);
=20
 int spk_synth_is_alive_nop(struct spk_synth *synth)
 {
+	if (synth->releasing)
+		return 0;
 	synth->alive =3D 1;
 	return 1;
 }
@@ -163,6 +173,18 @@ int spk_synth_is_alive_restart(struct spk_synth *synth)
 {
 	if (synth->alive)
 		return 1;
+	/*
+	 * The callers run under speakup_info.spinlock (speakup_key()
+	 * holds it across do_spkup()), which is also the lock
+	 * synth_release() takes to clear ->alive, so checking
+	 * ->releasing here cannot race it: a synth being released is
+	 * not revived, or an in-flight catch_up() draining to a stuck
+	 * synth would never see ->alive cleared and synth_release()
+	 * would block forever on the catch-up count while holding
+	 * spk_mutex.
+	 */
+	if (synth->releasing)
+		return 0;
 	if (synth->io_ops->wait_for_xmitr(synth) > 0) {
 		/* restart */
 		synth->alive =3D 1;
@@ -197,6 +219,8 @@ void synth_start(void)
=20
 void spk_do_flush(void)
 {
+	struct task_struct *task;
+
 	if (!synth)
 		return;
=20
@@ -209,7 +233,11 @@ void spk_do_flush(void)
 		}
 	}
 	wake_up_interruptible_all(&speakup_event);
-	wake_up_process(speakup_task);
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
 }
=20
 void synth_write(const char *_buf, size_t count)
@@ -476,13 +504,18 @@ int synth_init(char *synth_name)
 /* called by: synth_add() */
 static int do_synth_init(struct spk_synth *in_synth)
 {
+	struct task_struct *task;
 	struct var_t *var;
+	unsigned long flags;
=20
 	synth_release();
 	if (in_synth->checkval !=3D SYNTH_CHECK)
 		return -EINVAL;
 	synth =3D in_synth;
 	synth->alive =3D 0;
+	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	synth->releasing =3D false;
+	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 	pr_warn("synth probe\n");
 	if (synth->probe(synth) < 0) {
 		pr_warn("%s: device probe failed\n", in_synth->name);
@@ -510,13 +543,17 @@ static int do_synth_init(struct spk_synth *in_synth)
 		return -ENOMEM;
 	synth_flags =3D synth->flags;
 	wake_up_interruptible_all(&speakup_event);
-	if (speakup_task)
-		wake_up_process(speakup_task);
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
 	return 0;
 }
=20
 void synth_release(void)
 {
+	struct task_struct *task;
 	struct var_t *var;
 	unsigned long flags;
=20
@@ -525,8 +562,24 @@ void synth_release(void)
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	pr_info("releasing synth %s\n", synth->name);
 	synth->alive =3D 0;
+	synth->releasing =3D true;
 	timer_delete(&thread_timer);
+	synth_buffer_clear();
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+	/*
+	 * catch_up() may still be running without spk_mutex held (it gets
+	 * taken off the mutex by speakup_thread()).  Wake it out of its
+	 * sleep and wait until it is done before releasing the resources
+	 * (sysfs, variables, tty) it may be accessing.  speakup_task can
+	 * be an ERR_PTR here, when speakup_init() failed after the
+	 * command-line synth_init().
+	 */
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
+	wait_event(synth_catch_up_waitq, !atomic_read(&synth_catch_up_count));
 	if (synth->attributes.name)
 		sysfs_remove_group(speakup_kobj, &synth->attributes);
 	for (var =3D synth->vars; var->var_id !=3D MAXVARS; var++)
diff --git a/drivers/accessibility/speakup/thread.c b/drivers/accessibility/s=
peakup/thread.c
index 2fc75e60fbac..5279e112248b 100644
--- a/drivers/accessibility/speakup/thread.c
+++ b/drivers/accessibility/speakup/thread.c
@@ -50,9 +50,18 @@ int speakup_thread(void *data)
 		if (synth && synth->catch_up && synth->alive) {
 			/*
 			 * It is up to the callee to take the lock, so that it
-			 * can sleep whenever it likes
+			 * can sleep whenever it likes.  It may indeed sleep for
+			 * a long while, e.g. while draining to a slow synth, so
+			 * run it without spk_mutex: synth_release() waits for
+			 * the catch-up count to drop before freeing the synth,
+			 * hence the synth stays alive for the whole call.
 			 */
+			atomic_inc(&synth_catch_up_count);
+			mutex_unlock(&spk_mutex);
 			synth->catch_up(synth);
+			if (atomic_dec_and_test(&synth_catch_up_count))
+				wake_up(&synth_catch_up_waitq);
+			mutex_lock(&spk_mutex);
 		}
=20
 		speakup_start_ttys();
--=20
2.32.0

