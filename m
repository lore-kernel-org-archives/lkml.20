Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297357;
	b=RKM8doSub4Fui2c8bhVihBBlElLXqDAv2MOZ9gowRWuLUPQXKD39JCFK+ESf2gwnONpk
	 MIIughu1i3od/0YG7Oyyk1pw6fQH14kxXbGsTfC6vdGBTTZPfFqAwGnnNKzYEPC1OXzMz
	 /9roWSUSkdh0vL4SM9TSNNdu8kgHWzmuXeegJ3jygTRRh1pHkhipuBIHkPYc/BMjcJnPS
	 lODNVLFmw/WokORjE/ExYe5ATZ9LFaeSMLndr02wvLgbIrQGdcflifez1Gncou8L5Fw8U
	 dp6na/UFy1dceIkU3bhwZIe7jYomSb51lq6w1un2FMLv3pWsoX0HF9gyj+FcFB3lzoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BnNlY/us+vZG0qDZkwIWerdVJgfRG++NHY0uK525X08=;
	b=rlBe21BvUEET+SnIpUXyKZ7+SAib9JmFJVqx5TJnr32cumjhvbhmC26QYYx5FyeOuZ5I
	 CGIgzo35toIE4gCHcknomgRLZ9/SCIwA/ppInfNXRANbqLi0IESjOeLciniDG7RIlLcaW
	 ieWqvW48cZBr+fKZMH4pzIkVyh0bWJY4d6qkgNUCqD9SRNbvsJSGKrYmC7SePndeKnUaJ
	 QwfnJQQh+o+1VBhBvHIcMlduzgHSAalcE0bbyQumsEL85NUlVSLSeCJHW3eLXwXxuEtp8
	 osDLwK3Ev3Qr7Lmzf85ypq73hN6AEYPKmvowY2Z2sUbgqBtZencb9uAJF8EogSz/NOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pF6zik9H;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D72606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pF6zik9H
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so14135931fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297355; x=1794902155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnNlY/us+vZG0qDZkwIWerdVJgfRG++NHY0uK525X08=;
        b=pF6zik9HqBlnUxyUVNjaDYPeJJIaueDqrerGbI1ZJDvDiePLXsIlsxwVF4Mdu+w9Fa
         2Zfk0ByvlBzDBww56nSiYryLeVawKmGXACnac/KLGAWDq9w/nRCLpWLWYuN11rxmiJwu
         7WF9n7Ek1Sggu/UJtVZslhmOzRiYZHExgW8toGjDegiXJEfMN7Tij9XCqc4RYZtcaxv5
         Ib31OQB993JrhVIvj9uxVOEyty1sh5n0Cd5UuzrpzFkRg+MYsV/FxWcRyyzR1yHf0Qfd
         u108Mk80rcnC5yNkMBXmdVvsgMXwzHFKYXXxBvqq2rQzHENKBozwVbr/bPZdprjbN3N7
         CRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297355; x=1794902155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnNlY/us+vZG0qDZkwIWerdVJgfRG++NHY0uK525X08=;
        b=xaj4cbSuxQdfmJdlDPkiQaim4imtPF8X8U0CY+HkasMaHvXsh1SIGWJaVFowNZmVSG
         NmPz07jnsRklC46scbWdZybTZqKRrMGt9wQw1gSRhkO/m1Y29TB/tLaJUBGCocoS8OSx
         MWE6yjQFQ/tpx1ZrmWzu/BDWiNpxNiqc/fzzS8KlYaiM0UFax1e11H78nwWOhHWEzovU
         ziJ+sLdva/MaUuO5TVOjOZsTKxRrxn9Jy1kXzRTowBZf/Q3yEL0WCZHtnOxXF5J80gBr
         kKV5IzcaQoL4vmJxpFahynC8J3UvS+U11oX7J/jzZ6H46Z/ghnBdA55nq8zBNrFfuMNT
         68ug==
X-Forwarded-Encrypted: i=1; AL+hErEyNXdOeuc2/ZJnbjxkdUZBiqWjUbyxBFW95ahv67qd7Obj4I2ChirUYVhBN6SKEem545jCWw2LeAdOwbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84kMJmqC7+w273i5jEae0tzkNkVFuHL8RBhuyqWlbtKHd4Qzsm
	99C1et7/bx75HRsChforLUzRObgMbeJNjVzjIkv4mH16vGr9htoJG8Wm
X-Gm-Gg: AYBFou0CF3V0VPIvC0OB7LFjYxU6ddhhkcf89HaGETJg3iaHZoD/n27Meh4x0bKOVI+
	tESGll7Xah2khH18FMLKxnyOK/2NxbmMxgSrQTxOi9ZSJuEcIsnd7X6uwMxiIWzZiJrlPVvukMi
	xnqEqjweXHm6a6aKqTbu1GoQich49NTL6LQM2oQbTFudOVuGHHVIzoNGOAtABx92rfmxOXVkWPT
	t6sGawwzPWmfPXrgI0wN/pFLSO7XqrZaVT4+2jLpTKpFaBb13oxVr9iInQfa4SF3rVGVkPVD054
	spbOirIrRvvxvxS1epvs0t+JfJNSvFf5OH/A6vcRpHUiT3GVOr99BIehJIoMVUomyKbFFrjL5j2
	Fr7KcpxbS8zDHSBNhftKfChjC0bjq3zKscuzeVKnsyCywwbWL6JRTrBy0CRToA8JQOKpobuWzHx
	ODCaCk2WTZdXz8oylb47RqkuYeCIy5enDIp9d2cGXeEceN/lu0tZPY34AfLS2tnwVCL/yncwyVE
	5jlGDgaf3W8pPLVDWt5Q3kfHNz3Bpf818f7VtTyF8F+Mgo3BxoDy9G031DnZ44zZhtEQzh+O3Wf
	tGyvzpC1R0PSKQWASmUK4syn9Y4yOSp+ZaFY01DxoXNgRoLvU/unydEk9OETWSu1e3R9LhG4G2D
	D2XgYbMxnKm9tw+RbAEnlbawQmoc=
X-Received: by 2002:a05:6512:39c3:b0:5bb:7b64:340d with SMTP id 2adb3069b0e04-5c156ead9dfmr509262e87.28.1794297354505;
        Mon, 09 Nov 2026 23:55:54 -0800 (PST)
Received: from localhost.localdomain ([92.36.11.150])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ced5basm249834e87.41.2026.11.09.23.55.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 23:55:54 -0800 (PST)
From: Artem Novikov <novart962@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] tty: n_gsm: serialize mux configuration
Date: Tue, 10 Nov 2026 10:55:38 +0300
Message-ID: <20261110075538.51452-1-novart962@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Artem Novikov <naa@amicon.ru>

Concurrent GSMIOC_SETCONF calls can both decide to restart the same mux.
gsm_cleanup_mux() releases gsm->mutex before gsm_config() calls
gsm_activate_mux(), so cleanup and activation from different calls can
overlap. The activation paths can register the same gsmtty minors, and
registration rollback can race with another registration or cleanup.
GSMIOC_SETCONF_EXT can restart the mux through the same paths.

A 5.10.246-syzkaller report shows a NULL dereference in the unregister
path:

 KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
 RIP: 0010:cdev_del+0x22/0x90 fs/char_dev.c:596
 Call Trace:
  tty_unregister_device drivers/tty/tty_io.c:3290 [inline]
  tty_unregister_device+0x117/0x1c0 drivers/tty/tty_io.c:3285
  gsm_register_devices drivers/tty/n_gsm.c:496 [inline]
  gsm_activate_mux drivers/tty/n_gsm.c:2286 [inline]
  gsm_config drivers/tty/n_gsm.c:2517 [inline]
  gsmld_ioctl+0x9b2/0xff0 drivers/tty/n_gsm.c:2829
  tty_ioctl+0x86a/0x16d0 drivers/tty/tty_io.c:2757
  vfs_ioctl fs/ioctl.c:48 [inline]
  __do_sys_ioctl fs/ioctl.c:753 [inline]
  __se_sys_ioctl fs/ioctl.c:739 [inline]
  __x64_sys_ioctl+0x19a/0x210 fs/ioctl.c:739
  do_syscall_64+0x33/0x40 arch/x86/entry/common.c:46
  entry_SYSCALL_64_after_hwframe+0x67/0xd1

Current tty_unregister_device() checks for a NULL cdev. The overlapping
registration and cleanup operations in n_gsm remain unsynchronized.

Serialize the complete configuration transaction with a per-mux mutex.
Use the same mutex for GSMIOC_SETCONF_EXT, which can also restart the mux,
and for the corresponding configuration snapshots. Keep userspace copies
outside the critical sections. Use a separate mutex because
gsm_cleanup_mux() already acquires gsm->mutex.

Leave receive, transmit, timer and workqueue callbacks outside the new
lock so that control-channel shutdown can still make progress. Concurrent
configuration requests for one mux now wait for its reconfiguration to
finish; independent muxes retain separate locks.

Fixes: 01aecd917114 ("tty: n_gsm: fix tty registration before control channel open")
Cc: stable@vger.kernel.org
Signed-off-by: Artem Novikov <naa@amicon.ru>
---
 drivers/tty/n_gsm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index e55779ff0af2bb6328cf5f0ec70497107f1462e8..26e34e79b034a19e1b5dc1f4a87d56a74e884d56 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -273,6 +273,7 @@ struct gsm_mux {
 	struct tty_struct *tty;		/* The tty our ldisc is bound to */
 	spinlock_t lock;
 	struct mutex mutex;
+	struct mutex config_mutex;	/* Serializes mux configuration ioctls */
 	unsigned int num;
 	struct kref ref;
 
@@ -3219,6 +3220,7 @@ static void gsm_free_mux(struct gsm_mux *gsm)
 			break;
 		}
 	}
+	mutex_destroy(&gsm->config_mutex);
 	mutex_destroy(&gsm->mutex);
 	kfree(gsm->txframe);
 	kfree(gsm->buf);
@@ -3290,6 +3292,7 @@ static struct gsm_mux *gsm_alloc_mux(void)
 	}
 	spin_lock_init(&gsm->lock);
 	mutex_init(&gsm->mutex);
+	mutex_init(&gsm->config_mutex);
 	kref_init(&gsm->ref);
 	INIT_LIST_HEAD(&gsm->tx_ctrl_list);
 	INIT_LIST_HEAD(&gsm->tx_data_list);
@@ -3328,6 +3331,7 @@ static struct gsm_mux *gsm_alloc_mux(void)
 	}
 	spin_unlock(&gsm_mux_lock);
 	if (i == MAX_MUX) {
+		mutex_destroy(&gsm->config_mutex);
 		mutex_destroy(&gsm->mutex);
 		kfree(gsm->txframe);
 		kfree(gsm->buf);
@@ -3341,6 +3345,8 @@ static struct gsm_mux *gsm_alloc_mux(void)
 static void gsm_copy_config_values(struct gsm_mux *gsm,
 				   struct gsm_config *c)
 {
+	guard(mutex)(&gsm->config_mutex);
+
 	memset(c, 0, sizeof(*c));
 	c->adaption = gsm->adaption;
 	c->encapsulation = gsm->encoding;
@@ -3384,6 +3390,10 @@ static int gsm_config(struct gsm_mux *gsm, struct gsm_config *c)
 		return -EINVAL;
 	if (c->i == 0 || c->i > 2)	/* UIH and UI only */
 		return -EINVAL;
+
+	/* gsm_cleanup_mux() takes gsm->mutex, so use a separate lock. */
+	guard(mutex)(&gsm->config_mutex);
+
 	/*
 	 * See what is needed for reconfiguration
 	 */
@@ -3451,6 +3461,8 @@ static int gsm_config(struct gsm_mux *gsm, struct gsm_config *c)
 static void gsm_copy_config_ext_values(struct gsm_mux *gsm,
 				       struct gsm_config_ext *ce)
 {
+	guard(mutex)(&gsm->config_mutex);
+
 	memset(ce, 0, sizeof(*ce));
 	ce->wait_config = gsm->wait_config ? 1 : 0;
 	ce->keep_alive = gsm->keep_alive;
@@ -3471,6 +3483,8 @@ static int gsm_config_ext(struct gsm_mux *gsm, struct gsm_config_ext *ce)
 	if (ce->flags & ~GSM_FL_RESTART)
 		return -EINVAL;
 
+	guard(mutex)(&gsm->config_mutex);
+
 	/* Requires care */
 	if (ce->flags & GSM_FL_RESTART)
 		need_restart = true;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
