Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789492;
	b=evxaJa7Zym9rij9nGSAFivB6UXdyzAUOosWgo/cr/eKvB9zBgR/dBIdhlQA1NH2OGjI8
	 HIHDy2//yRLb7PV308RQ+klxU8hfPmqbsxCfWbr/sAfofpsxJmWsvK6+fpnIE+1GyZsgv
	 7sz58vlNypyA4lvYuNIDrultN4svmqNvjAz41zl4oa5H7J2Ut5O3rsG/oKG7Ugqq8LIY9
	 a5Nz2WIFE3JK1EWIQAHyLaL37SkVcksU+nStxKLNKop1Lg8BJFmj/pUntSLUAisj8zEW5
	 Da5y2c3EZlbHVofCfufL8FGwGM10oltzjmNKM3TJ4NUKXvsGY+YNvaQ4/HN69HdJaMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+E4Nf1Fot6LD9XND0ibhLLdff6atl27lHvMkzff/x1g=;
	b=TDfBeiYZnYgNpxt8l47uecHwzGirgWOSlTFZyEir4siPzM4O52ce87XGXFkd+mI+skhk
	 ODx0fYojCTGo4RsuLCBp3zROnmkqJgE4GdDZXKvgkvKRLmmJQLner9CkAcNWusBSXc4Ef
	 NpvB8JG2CEjwizn4pRsAGnaYqcFmXdvqvv00KyIjiWux4ArEk2S5pf35zsmCNFLaV4H3V
	 ILFoeiW58+c2QRKxcqKlBr+rQJqoPSDd2tBLuotnWMOYQG/hR2r/mbRVa74o7wk3N8onx
	 zazt5ESVQ2cdY0xyHkTh3ima/DIcpNppqkJ9nJWtAFxzqFIGxSuhnq/2QND7zlKqFlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1jJmSP1;
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2442606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2442606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1jJmSP1
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a217e6274cso1991685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789490; x=1794394290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+E4Nf1Fot6LD9XND0ibhLLdff6atl27lHvMkzff/x1g=;
        b=V1jJmSP1maGDQs0jFp/9pHMnGfOSY7vXYXp3JDGuTEpXb8rnc9ka6ueKu0vfB4HEJN
         BjNNiBbm69nOW3HNmcDDPvCy8Fpc9tl9Y1pT/EJ+TnEWhIra2qD1DuO3XwSYlQCm55yF
         BQBkeD33IJQw71y/qpFlic07Js1vDb2VgeP4rrMVzVVnojRge6CNOkhHQ0Croygd0G97
         uSjbY6+6mELPCtf72+dRACrGwRrUGXCCtvXNW6ubCwQ5xo7f8lynuDiMD7D7PGRrX3jz
         K9O8TmM9k9PCoPSDwvGBmm8v2iHXB97q/WcH9IIpgUsmZCAhHInMq07vjo2ww+cJuYAB
         twOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789490; x=1794394290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E4Nf1Fot6LD9XND0ibhLLdff6atl27lHvMkzff/x1g=;
        b=xBDF1UG6wvefKzpMSc2hqerViAOPhPEjThX3H4jKvXNa1t4hKtncNBX1IzWztBlNu8
         RLabu6Y9hD/tqFCK/y/DIw8VrRp9zqo3QQmVI1pfBmfvnxA+PWe+WkFhDRXNOifaheQI
         S0Df5PWpvSOm5Zw5j8E+hc2BrbFRzwBI2a/MrGXRkQYsxgVN9Dply3gFs3nph8dERvHW
         bTzp1dS8ioUBmC4XpoSBI1dofq73tYYkCCxputlMl/GKpRbI8hv8E7Tqh9qBTCWggfMN
         lIMGSFuXPALL++G6YyuYEr/CKsWD4JU7ivWl8ZcOwU97ZDjI7VKS+MoycZlid4ukSadw
         xfxw==
X-Forwarded-Encrypted: i=1; AKwUvBzgzTrPW8q6mwgLROZ6JGgIcoB5bDUYFBdM3po8ft2dfscXZ30yaIov5uLA6BywgQqtqX8OOaqmvpSTk44=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OBX4H0Ofvxk6eRwvUxzu2zfzqbiw+b4wf8MEsoe0u+YzXCqYy
	ckSxNkjCCXNXkf/852V50stvLfk/ytsWlZwNgVUPZfmtyj331nP27CaM
X-Gm-Gg: AYBFou34pBAkkRgRa2FmdYdNDpyJ/aB0MDiQw0Colybqalgl8/fJHpv8EZPASd0RwzA
	Qljk9Kx6FQswxwkdJL8kzR4zm+r5EN1jvmOpMXVWtK8OvwznCMPJCYEGvY5ZWJqxSbcKHf+zG1c
	qFmPoHNCRFrKuXgdrMvGb2JtdM+BeAtjDK8WBE9PJTqregsEvw+LaLzpnCxU8c4SYzDetH70GbJ
	SAsOAjuS7ysZM2tDiY3cxNCgEJonPxnUgIqmnM5kwpIDDwyKpBra31lnQ8DW1c0AGJa7VYFAAsK
	olH/yU18i0oEKCUWgcRwsMz1w2lQHsFt6nhBmFO5Enn/v4dX1EprMA1gBHGLpmh1vIIZvp8wN8J
	e/daG99cfbS9vBPbxS449EdXSH9kb629uVJ9+9hHnX0RLX3n0URVYUMJkrBEDPzQMVwXoDC1GIi
	ixIxT8lXoJ7ArcQS152jVvwB59ChY6LbiHbBnNJcKVYEyJWTeaJyamf7fO03CIC2MYcMA1fQ7oK
	OzokdFbpsO5XhZIZH+aVJi4Jogeuxvh4SQfXnu3lKNDWOdMMJ+NNwF69aeXdDFcmBr4dWSrKsfI
	bzuTAEAszBQKEBUsdG35/diFe9Q=
X-Received: by 2002:a05:600c:8b06:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ac17b2c907mr346699515e9.25.1793789489826;
        Wed, 04 Nov 2026 02:51:29 -0800 (PST)
Received: from 3mk ([50.60.229.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b437864e3fsm43419005e9.0.2026.11.04.02.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:51:29 -0800 (PST)
From: abu mohammed saleh <foroncewillbeproud@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-kernel@vger.kernel.org,
	syzbot+acd959f649966559199c@syzkaller.appspotmail.com,
	abu mohammed saleh <foroncewillbeproud@gmail.com>
Subject: [PATCH RESEND] comedi: give each device's mutex its own lockdep class
Date: Wed,  4 Nov 2026 13:50:16 +0300
Message-ID: <20261104105016.8232-1-foroncewillbeproud@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The "comedi_bond" driver forwards digital I/O instructions to other
COMEDI devices via "kcomedilib".  When an INSN_BITS instruction is sent
to a bonded device, comedi_unlocked_ioctl() holds the bonded device's
mutex while comedi_do_insn() acquires the mutex of the underlying
device.  All COMEDI device mutexes are initialized in
comedi_device_init() and so share a single lockdep class, so lockdep
reports this as recursive locking:

  WARNING: possible recursive locking detected
  repro/77 is trying to acquire lock:
  ffff9d0b41f39cf0 (&dev->mutex#3){+.+.}-{4:4}, at: comedi_do_insn+0x22/0xf0
  but task is already holding lock:
  ffff9d0b41f398f0 (&dev->mutex#3){+.+.}-{4:4}, at: comedi_unlocked_ioctl+0x5f/0x1060

The two locks belong to different devices.  Since commits d1b3b9c70e11
("comedi: kcomedilib: Add loop checking variants of open and close")
and 2402f958cf3b ("comedi: comedi_bond: Check for loops when bonding
devices"), comedi_open_from() refuses to open a device if that would
form a loop of devices opening each other, so this nesting cannot
deadlock.

Register a dynamic lockdep key for each COMEDI device and use it as the
class of the device's mutex, unregistering it when the device is freed.
This silences the false positive while keeping lockdep's ordering checks
between different devices, which a mutex_lock_nested() annotation in
comedi_do_insn() would not.  It also handles chains of bonded devices,
which a single nesting subclass could not.  There are at most
COMEDI_NUM_BOARD_MINORS devices, so the number of classes is small.

The problem was found by syzbot, which can trigger it as root by
configuring a "comedi_test" device and a "comedi_bond" device bonding it
on legacy minors, then issuing INSN_BITS on the bonded device.

Tested on v7.4-rc1 (x86_64 KVM guest, defconfig + kvm_guest.config +
CONFIG_PROVE_LOCKING, gcc 15.2) with syzbot's C reproducer, booted with
comedi.comedi_num_legacy_minors=4: unpatched, lockdep reports the splat
above on every boot; patched, no lockdep reports in three runs.  Also
built with CONFIG_LOCKDEP disabled and with W=1 without new warnings.
Not tested with real COMEDI hardware.

This patch was written with the help of an AI coding assistant (Claude
Opus 5.5, Anthropic), which analyzed the syzbot report, wrote the change
and ran the tests above under the submitter's direction.

Reported-by: syzbot+acd959f649966559199c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=acd959f649966559199c
Fixes: 69e2387f3bfd ("staging: comedi: kcomedilib: protect against device detachment")
Signed-off-by: abu mohammed saleh <foroncewillbeproud@gmail.com>
Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
---

Notes:
    Resend with Ian's Reviewed-by and Greg Kroah-Hartman on Cc, as requested. No code changes.

 drivers/comedi/comedi_fops.c     | 7 +++++++
 include/linux/comedi/comedidev.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index 05d14839c..a488044d9 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -108,6 +108,12 @@ static void comedi_device_init(struct comedi_device *dev)
 	kref_init(&dev->refcount);
 	spin_lock_init(&dev->spinlock);
 	mutex_init(&dev->mutex);
+	/*
+	 * Give each device's mutex its own lockdep class, as one device's
+	 * mutex may be held while acquiring another's via kcomedilib.
+	 */
+	lockdep_register_key(&dev->mutex_key);
+	lockdep_set_class(&dev->mutex, &dev->mutex_key);
 	init_rwsem(&dev->attach_lock);
 	dev->minor = -1;
 }
@@ -118,6 +124,7 @@ static void comedi_dev_kref_release(struct kref *kref)
 		container_of(kref, struct comedi_device, refcount);
 
 	mutex_destroy(&dev->mutex);
+	lockdep_unregister_key(&dev->mutex_key);
 	put_device(dev->class_dev);
 	kfree(dev);
 }
diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
index 577a08f37..f6d732427 100644
--- a/include/linux/comedi/comedidev.h
+++ b/include/linux/comedi/comedidev.h
@@ -489,6 +489,10 @@ struct comedi_driver {
  *	its regions requested.
  * @spinlock: Generic spin-lock for use by the low-level driver.
  * @mutex: Generic mutex for use by the COMEDI core module.
+ * @mutex_key: Lockdep class key for @mutex.  Each COMEDI device has its own
+ *	class because a device's @mutex may be held while the @mutex of another
+ *	COMEDI device is acquired via "kcomedilib" (e.g. by the "comedi_bond"
+ *	driver).  "kcomedilib" refuses to form loops of such devices.
  * @attach_lock: &struct rw_semaphore used to guard against the COMEDI device
  *	being detached while an operation is in progress.  The down_write()
  *	operation is only allowed while @mutex is held and is used when
@@ -553,6 +557,7 @@ struct comedi_device {
 	unsigned int ioenabled:1;
 	spinlock_t spinlock;	/* generic spin-lock for low-level driver */
 	struct mutex mutex;	/* generic mutex for COMEDI core */
+	struct lock_class_key mutex_key;
 	struct rw_semaphore attach_lock;
 	struct kref refcount;
 
-- 
2.53.0

