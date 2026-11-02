Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632641;
	b=h5bziHVjWFgstYekfE5lkT1HzJCjbor7hteCdBpfmN+IJIifOOk8I9k2XD4E/KQx2N+p
	 mq+Ez1wFx4ifcaVYubaENpct4o/j8fcQ+z6vufDL6efaMgy95T5EdYGmaLHZbV555mxM1
	 243VObpYaYuB2wQwnUN/Ni9DofIUUzaUPGAL+nYfI4DLAB83PkDJXqPQN1Rrp/4vXvRbB
	 6oQ++AtBck2zyl1cqobakImpPe5jigGlcUpvU63tfYg5CUq7lP7udDHLuRyYTSX/UHZfS
	 DDo7h1g286FQ2CYfdIGibbL94Vuf4qzIuz1vLomdvA3pmHUssODYBMwJItWGGjqMgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632641;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NXy2CW5XiDiGZYIkkpFQwJqDgocBPiBCli9azwEvgrc=;
	b=GctWGC6N6A6Y5ZvdKnzYZG7RtjyJ6tek6ZfOCUrylf0Mm15Oosve/4k2bSj+eEO23X0v
	 ibisLkonSnut0Br5BsQ82/rsFySxtFvkg4yCI7wK4lt8PNt5V/QLzeyJSA3BJVQ3eYLFc
	 331tSLCMnjewaS6uPDgrrIoPA2o8XMoHBtgxBxeKd0sm0wPzfRNuKK047kJi3KZofSw7y
	 SJ2GaFJH0to5TDeAhLIb4oLq49YHXyFCMpm1O2LTrQ5ZqWcuZjEv+1VuwyRmrX6GTCJ98
	 UL88AMR+4NtuOSrDW/HUhlsB3J47chRtS5WxSXHGaG4zmZtN1t2Sb61FMW7VPqQprGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ADF606F3CA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07ADF606F3CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so3702264c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632638; x=1794237438;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXy2CW5XiDiGZYIkkpFQwJqDgocBPiBCli9azwEvgrc=;
        b=zR6xqXM1K+W8IFmap412w9S1Y2niye+vFHpOibZIqKf21DNLo9/RUs1r3znkAve/sQ
         WKo548U2iZulMvTqc27+11pOJMY+jFY2Iz5jObbguqCD1dn8HxFtVgZgcj1Q1RZyTAa1
         9AxnwQkTJexy0BL1PPUQjGYUxxHbGxwQm70OPQV+8hOHlsA4oWAN9aToGTqiBBdFY4fL
         jbbxChYgDJMbv0aOo3gIJSt7GQAG3DTVhronoyEdMthGIr8WxTAPxzOvLj/cBez/sf1s
         0xIeF6yIKbksyg8/eZ3QwXooyYFRv9HdaxswJFYEY7HPD9Y6AKOv8Pp5Y2iwMCvS2fE0
         bCmg==
X-Forwarded-Encrypted: i=1; AKwUvByYxwAobfcR1IRPuakJ7a7MduC0bzkFb8JkSAPRs/Q+f3TlrysFy6izsFkx95xC9o3Le6MbXhhHSprFWnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAVcdj9HLpvh68K+KvgHKBvW6JveuY0Bj2xguyFxKOw+Ble4Pu
	jEZfi6aSGN0g4JlfIKpN2JHpSqw5WOfL/vWsin155QdDJ2/mtyslgjGQN0Ud0w==
X-Gm-Gg: AYBFou0S8g3MakwCOYJG8gFifTC6GqoxwkStk32G1M0LUqaBW/fioyplygBFnkG2Vtb
	iCa0BvLyQdbf/XGnkklkTIZzyOkiCQYUIQNlUDk2DHCVW/ovAYPxVOC8/meS7DD5Dt/G1qmIQl3
	o/oW9JVNrhYgxZXS9oJLKlmxrIaw5OQ6ER0MaoyPwDopxAA1OYY1zCFn16U+gNXm+3s5AcsqPOG
	MDHoX+pOZXGonrs0VZfwll91E5437Z6Z4IJNyv2FbBmKgJJE6rV9AQw1XqDjpkxGi+ItL5dKuEW
	hdEAQyEYrY9CnsJdKT0mL6ioMXzouGUXKplU2nwI8mULBuXHyAiBIBNghAmhNK5qc3yTNSxc3nu
	V2PSTOQXcS2FvK9VQHN8D6Sh8za3ojUl9qVapXEBNwKhxE9Nf5jSTxb/CnYwxvslFtxthL9p2QE
	sH0oVDVUgceT0GrugMhNB68iAIjrbBqqnMSwtRdHx73g9Z98qAsn38+6cWegjFs9wlSLX1b4XsH
	rCgs6D+miQnWaguKScQq+5fvFyqpaiQgs/StKtBRNbEhG9uR53S9tDjRdA1i1D0BjriDpMKP/u5
	8MggqAnnQei9ixnMv8I8aCE/vbbJvL06J6H0FFecFZS1B/uoOSwAIaIZTqwhbrTo0nrsikhHeOe
	L6dVlsJWrvsdTJe6NuJbRWKlOPNkrtwpmgzcn
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id a92af1059eb24-1ac5c64cb0emr16398734c88.26.1793632637764;
        Mon, 02 Nov 2026 07:17:17 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm31588877c88.3.2026.11.02.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:17:16 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject: [PATCH v2] speakup: Serialize synth clearing against locked readers
Date: Mon, 02 Nov 2026 23:17:11 +0800
Message-ID: <179363263139.43100.8043437977710970575@kylinos.cn>
In-Reply-To: <atUgm3nwEQrJibxn@end>
References: <20261014071713.321914-1-xiehongyu1@kylinos.cn>
 <20261014071713.321914-5-xiehongyu1@kylinos.cn> <atUgm3nwEQrJibxn@end>
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

speakup_key() validates the global synth pointer before taking
speakup_info.spinlock, but do_spkup() and its handlers run inside
that lock and dereference synth: speech_kill() calls
synth->is_alive(), and the flush path reaches synth_start()
reading synth->alive.  synth_release() clears synth under
spk_mutex, which does not serialize against the key path, so a
speakup key pressed while the synth is being removed can pass the
unlocked check and oops on the stale pointer:

    CPU0 (speakup key)             CPU1 (rmmod -> synth_release)
    ------------------             ----------------------------
    speakup_key():
      if (!synth)                  mutex_lock(&spk_mutex)
        return 0  /* passes */     synth_release():
    spin_lock(&speakup_info.         synth->alive =3D 0   (spinlock)
        spinlock)                   ... drain in-flight catch_up() ...
                                    synth->release(synth)
    do_spkup():
      speech_kill():
        synth->is_alive()
        /* dereferences a synth whose release() has
           already torn down its I/O */

Closing this window needs both sides of the race:

- Recheck synth at do_spkup() entry, inside the lock, so the whole
  handler table runs only while a synth is still registered.
  speakup_con_write() and speakup_con_update() used to gate on synth
  before their trylock; they now recheck it after acquiring the lock
  instead, so these readers no longer validate outside the critical
  section that dereferences.

- Clear synth under speakup_info.spinlock in synth_release() and
  in the do_synth_init() probe-failure path, so a clear can never
  land between a locked reader's check and its dereference.

With the check and the clear under the same lock they are
mutually exclusive for these paths, instead of merely close
together:

    CPU0 (speakup key)             CPU1 (rmmod -> synth_release)
    ------------------             ----------------------------
    spin_lock(&speakup_info.       ... drain in-flight catch_up() ...
        spinlock)                  spin_lock(&speakup_info.spinlock)
    do_spkup():                    synth =3D NULL
      if (!synth)                  spin_unlock(...)
        return  /* in-lock recheck */
      speech_kill():
        synth->is_alive()  /* cannot interleave with a clear */

The console notifier paths had the same window between the
pre-trylock check and the in-lock use:

    CPU0 (vt notifier)             CPU1 (rmmod -> synth_release)
    ------------------             ----------------------------
    speakup_con_write():
      if (!synth)                  (the clear lands between
        return  /* pre-trylock */    the pre-trylock check
    spin_trylock(&speakup_info.      and the in-lock use)
        spinlock)
    ... uses synth ...  /* stale */

and now recheck synth after the trylock, in the lock, exactly
like do_spkup().

The remaining locked readers had the same window between an
unlocked check and the in-lock dereference, and gain the same
recheck:

- do_handle_shift() and do_handle_spec() used to gate on synth
  before taking speakup_info.spinlock and dereference it via
  synth_printf() inside the lock.
- speakup_key()'s special-handler dispatch dereferences synth
  inside the lock speakup_key() holds (handle_goto(),
  edit_bits(), the help handler).
- synth_direct_store() used to validate synth before the lock
  while its synth_write() call runs inside it.
- the /dev/synth and /dev/synthu write paths used to validate
  synth once before their copy_from_user() loop while every round
  calls synth_write() (or synth_buffer_add() plus
  synth_start()) inside the lock.

With these rechecks the check and the clear are mutually
exclusive for every reader that dereferences synth inside
speakup_info.spinlock, and the unlocked synth checks that used
to gate these paths are dropped: they only duplicate the in-lock
recheck, with a window a clear can still slip through.  An empty
write to /dev/synth or /dev/synthu with no synth loaded now
returns 0 instead of -ENODEV, which is harmless.

The speakup thread keeps its existing fence: synth_release()
drains the catch-up count before clearing.

Two sites of this shape remain, preexisting.  The cursor_done()
timer callback dereferences synth inside the lock with no synth
check at all, and closing it needs the cursor_timer lifetime
handled against synth teardown, which is beyond this series.
The serial read buffer handler (synth_readbuf_handler()) also
dereferences synth inside the lock with no synth check.  It
cannot run in this tree: the only registration chain goes
through spk_serial_synth_probe(), which has no callers, and
any registration from outside the tree is still serialized by
the free_irq() in the serial synth release path, which runs
before the in-lock clear.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Suggested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
Changes in v2: per Samuel's review, drop the now-duplicate unlocked
synth checks on all the paths this patch rechecks inside
speakup_info.spinlock:

- speakup_file_write() and speakup_file_writeu() in devsynth.c
- synth_direct_store() in kobjects.c
- do_handle_shift() and do_handle_spec(), which now only test
  up_flag and spk_killed before taking the lock
- speakup_con_write() and speakup_con_update(), which now only test
  their other preconditions before the trylock
- speakup_key(), whose pre-lock entry check is gone; the in-lock
  recheck returns the same 0 via the existing "goto out"

The only behavior difference I could find from dropping them is that
an empty write to /dev/synth or /dev/synthu with no synth loaded now
returns 0 instead of -ENODEV, which should be harmless.

Also exercised the in-lock recheck at runtime: with the whole series
applied in a QEMU boot test, a write through a stale /dev/synth fd
kept open across the synth removal returns -ENODEV.

 drivers/accessibility/speakup/devsynth.c | 13 ++++++----
 drivers/accessibility/speakup/kobjects.c |  8 +++---
 drivers/accessibility/speakup/main.c     | 31 ++++++++++++++++++------
 drivers/accessibility/speakup/synth.c    |  4 +++
 4 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/accessibility/speakup/devsynth.c b/drivers/accessibility=
/speakup/devsynth.c
index e3d909bd0480..5a32d3bbf7b8 100644
--- a/drivers/accessibility/speakup/devsynth.c
+++ b/drivers/accessibility/speakup/devsynth.c
@@ -20,8 +20,6 @@ static ssize_t speakup_file_write(struct file *fp, const ch=
ar __user *buffer,
 	unsigned long flags;
 	u_char buf[256];
=20
-	if (!synth)
-		return -ENODEV;
 	while (count > 0) {
 		bytes =3D min(count, sizeof(buf));
 		if (copy_from_user(buf, ptr, bytes))
@@ -29,6 +27,10 @@ static ssize_t speakup_file_write(struct file *fp, const c=
har __user *buffer,
 		count -=3D bytes;
 		ptr +=3D bytes;
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			return -ENODEV;
+		}
 		synth_write(buf, bytes);
 		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 	}
@@ -47,9 +49,6 @@ static ssize_t speakup_file_writeu(struct file *fp, const c=
har __user *buffer,
 	u16 ubuf[256];
 	size_t in, out;
=20
-	if (!synth)
-		return -ENODEV;
-
 	want =3D 1;
 	while (count >=3D want) {
 		/* Copy some UTF-8 piece from userland */
@@ -84,6 +83,10 @@ static ssize_t speakup_file_writeu(struct file *fp, const =
char __user *buffer,
 		/* And speak this up */
 		if (out) {
 			spin_lock_irqsave(&speakup_info.spinlock, flags);
+			if (!synth) {
+				spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+				return -ENODEV;
+			}
 			for (in =3D 0; in < out; in++)
 				synth_buffer_add(ubuf[in]);
 			synth_start();
diff --git a/drivers/accessibility/speakup/kobjects.c b/drivers/accessibility=
/speakup/kobjects.c
index e1860f8d9d42..45a8e9fbd8de 100644
--- a/drivers/accessibility/speakup/kobjects.c
+++ b/drivers/accessibility/speakup/kobjects.c
@@ -416,9 +416,6 @@ static ssize_t synth_direct_store(struct kobject *kobj,
 	char *unescaped;
 	unsigned long flags;
=20
-	if (!synth)
-		return -EPERM;
-
 	unescaped =3D kstrdup(buf, GFP_KERNEL);
 	if (!unescaped)
 		return -ENOMEM;
@@ -426,6 +423,11 @@ static ssize_t synth_direct_store(struct kobject *kobj,
 	string_unescape_any_inplace(unescaped);
=20
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	if (!synth) {
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+		kfree(unescaped);
+		return -EPERM;
+	}
 	synth_write(unescaped, strlen(unescaped));
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
=20
diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/spe=
akup/main.c
index e9b7c2761f6f..60be4d4df363 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -1166,9 +1166,13 @@ static void do_handle_shift(struct vc_data *vc, u_char=
 value, char up_flag)
 {
 	unsigned long flags;
=20
-	if (!synth || up_flag || spk_killed)
+	if (up_flag || spk_killed)
 		return;
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	if (!synth) {
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+		return;
+	}
 	if (cursor_track =3D=3D read_all_mode) {
 		switch (value) {
 		case KVAL(K_SHIFT):
@@ -1763,11 +1767,15 @@ static void speakup_con_write(struct vc_data *vc, u16=
 *str, int len)
 {
 	unsigned long flags;
=20
-	if ((vc->vc_num !=3D fg_console) || spk_shut_up || !synth)
+	if ((vc->vc_num !=3D fg_console) || spk_shut_up)
 		return;
 	if (!spin_trylock_irqsave(&speakup_info.spinlock, flags))
 		/* Speakup output, discard */
 		return;
+	if (!synth) {
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+		return;
+	}
 	if (spk_bell_pos && spk_keydown && (vc->state.x =3D=3D spk_bell_pos - 1))
 		bleep(3);
 	if ((is_cursor) || (cursor_track =3D=3D read_all_mode)) {
@@ -1792,11 +1800,15 @@ static void speakup_con_update(struct vc_data *vc)
 {
 	unsigned long flags;
=20
-	if (!speakup_console[vc->vc_num] || spk_parked || !synth)
+	if (!speakup_console[vc->vc_num] || spk_parked)
 		return;
 	if (!spin_trylock_irqsave(&speakup_info.spinlock, flags))
 		/* Speakup output, discard */
 		return;
+	if (!synth) {
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+		return;
+	}
 	speakup_date(vc);
 	if (vc->vc_mode =3D=3D KD_GRAPHICS && !spk_paused && spk_str_pause[0]) {
 		synth_printf("%s", spk_str_pause);
@@ -1811,9 +1823,13 @@ static void do_handle_spec(struct vc_data *vc, u_char =
value, char up_flag)
 	int on_off =3D 2;
 	char *label;
=20
-	if (!synth || up_flag || spk_killed)
+	if (up_flag || spk_killed)
 		return;
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	if (!synth) {
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+		return;
+	}
 	spk_shut_up &=3D 0xfe;
 	if (spk_no_intr)
 		spk_do_flush();
@@ -2087,6 +2103,8 @@ static spkup_hand spkup_handler[] =3D {
=20
 static void do_spkup(struct vc_data *vc, u_char value)
 {
+	if (!synth)
+		return;
 	if (spk_killed && value !=3D SPEECH_KILL)
 		return;
 	spk_keydown =3D 0;
@@ -2115,10 +2133,9 @@ speakup_key(struct vc_data *vc, int shift_state, int k=
eycode, u16 keysym,
 	u_char shift_info, offset;
 	int ret =3D 0;
=20
-	if (!synth)
-		return 0;
-
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	if (!synth)
+		goto out;
 	tty =3D vc->port.tty;
 	if (type >=3D 0xf0)
 		type -=3D 0xf0;
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 1af80eb116af..aef482f8b14e 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -519,7 +519,9 @@ static int do_synth_init(struct spk_synth *in_synth)
 	pr_warn("synth probe\n");
 	if (synth->probe(synth) < 0) {
 		pr_warn("%s: device probe failed\n", in_synth->name);
+		spin_lock_irqsave(&speakup_info.spinlock, flags);
 		synth =3D NULL;
+		spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 		return -ENODEV;
 	}
 	synth_time_vars[0].u.n.value =3D
@@ -585,7 +587,9 @@ void synth_release(void)
 	for (var =3D synth->vars; var->var_id !=3D MAXVARS; var++)
 		speakup_unregister_var(var->var_id);
 	synth->release(synth);
+	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	synth =3D NULL;
+	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 }
=20
 /* called by: all_driver_init() */
--=20
2.32.0

