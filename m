Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728210;
	b=1YFmiilCKsDNM7SbZD17SGumDmBjCHUgUzgjRQQdtv6STn6cKAeZuDofni6JW8dadleZ
	 xcJTdsmViVWiksp/qdD9RSrhkArVLFYZ/2bzLVsxdcM/fCetsJUeWNWlno3CTpScdDJIb
	 9eopzz9F7uoNd7/W59ZPAE6TVlwqky0KarE0LjgMgLKP0g4l8Dhai9shMAbGyrxAGNJzI
	 hZw/Sf5P4SBNKI+DU0tw0VRQUHJcwmMFENKNjfxduAfAnWtyCFIAJ3CJ94/t/ZZ2xYmjr
	 ZofqzHkHQ4iU0t+yXTVALKUSgfr3mtwys2qdCwJb8ToC1Y4bWwhmm2XxzbX2H3azb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0MG0LKR+DyuPHFZFM+jKhDfCxJsybbx/dPcvcFtE/d0=;
	b=Tq4IO0FAxcYNBpqEJuQOPV8Hroti2Y0pb7v+nRMuuNODe/YHFzTL0yQgM1gAyqvOSKtC
	 8hav6+fHZFW6zLzViwO6UWItUC6LCV81llc35h1URhqxrMUdFrAEdRLAxbDiEigRXxpqz
	 BTaU8f5PmaXQaWethdLwAuu1ZXHb9NZE2XYHYFt+cnIDE1cb7lz+CAD8gH+vJYDo7R3Mb
	 z3jPnUEYTP/LD5m5ygcPK9168FufZ82aRyaX/c0vVSg4DLPNnFlC0MBn/DzIM0j7Qvi3M
	 L5SHs/O2c4IxwDYgBAsKBzauyuZ6delK3A6jR4aRNWANsgNdqevAi9cJiDtZ7FO9xGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tplWrcys;
	arc=none smtp.remote-ip=74.125.225.74
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF9606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBF9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tplWrcys
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48dee584cffso1693410f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728208; x=1794333008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MG0LKR+DyuPHFZFM+jKhDfCxJsybbx/dPcvcFtE/d0=;
        b=tplWrcysBesG6oyNR9c5hv3gBsfuS+faDT/VxWH+mdfdTzcEwi0/4NFAKJtK9K5Q8P
         prjT9cqJ+gUGpfsHxmz5rDo8N6BJXX2CNFl7oHRvyHbAHYXETHFRk3nQqNbcIg1H4hvH
         vLjxvSTx5EyIOc4PhbfxMfXbxLCIR6uiz7JAgLX5w4WG4HL7USzW4+XngrAHpHId8YgZ
         E731CEqDRinP4Z7RNt5tUwF/1SUhPoeWekPUgcqA4iQsRnNDKZ0sD627HGb2CN0q2qQQ
         ZUUQ24NPkgkXuv0NNAdvEpkE8P3xtMAvvYZQoqpa7zOUCwD93UT1MUCK2RofD4FMekj/
         gzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728208; x=1794333008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MG0LKR+DyuPHFZFM+jKhDfCxJsybbx/dPcvcFtE/d0=;
        b=hKzrKaXuKETwWiEl90/u/ckk0P1Np+MxDHOxw2HJ674ZZc00qhdvZQZVNtRBD9Xcjb
         Fy//c+a12872VBry9dmapvJ+ftJ/C2OxqWy3aWQux1rLY9xavc768kUaJRNrOhQQdUcn
         dIGJlBkMaxsGVj0J2qIzwtzwv6NaOZMGKtVSvpk9x5SX/TEzYtweySAwi3aO87TeGAEY
         tcqLIHkJapagdHnsFMd1G7zDGES/LUrm9qmbDK6GcrUEEAkDwtw/Vyv8pbe8CS8kmjuS
         xywUO7pDnSiom4TNy3EMA0Z45huOaA9nlVSvyGxs20pATPWtVv+H8y5TjiFKrXrT45Bb
         vG9Q==
X-Gm-Message-State: APuU4Z8C6sDW6SdAqpy9MTZGel2AZo6ar8HIicu2syLhLLdKyXp9eAML
	Wtf5nhH4hEHzexpJH+dO2GDAS5MpbEs8VS7HOvbZ6aqgwnkiqlFGYBZP
X-Gm-Gg: AYBFou1lgTzD8tWp9z+5w7QiJ9iwH6OKA0Kujwk1No7FMJqOXjpFp+3vzsTcZzN1lUn
	3wxO9PuHIz6Z3dSi9uyrzYzpzB3f8ABlbYMz3OPIMPxP/2E/OoQDgia8zSA5sFrIQuRQUz5e8ud
	kEHx70VB1SuHuZuN0xAP+xBuDYQmfJcso8IR328JlaDzTcGC5EnUMRS7LLbHv4RieFSggNhz5du
	lT6nPHn9kdYNEy5tpP4gdMvsC0LIYU/xH1EWQl60mde/elNFpqGP1ovq1CpIhkWGFQK6V4rn/Os
	3VuW7RSOagzzQTgAYzbIdIgnz9Onh0wsIoyJBUb7Y1JQHkAoMw05R92cgK4UtUTWElDNH5/kd6T
	5TDlrQfV16R660Ox8Q2TV2gwfyLiw8McFJ+QAEBmuNsQsP3mxLYmLW0kVr1v4tTtsE0pTkhYXF0
	aKBoe7PIqys7OCdH6HRsHeDD42hcLqw29jqnpn/5VwPl5WXGCTW6czubla8J9yNRjyVKZof/d84
	lUFQXJcWaCdFDF1lYqzwQEshElMT48cMVvcoD6hMu2MVPgKeuEIR2K05Cz376ABT7xWI5kB8cA6
	17MvSWWUzcQ38PZsjMz2Yd6VUL0=
X-Received: by 2002:a05:6000:2884:b0:48e:6eb1:3d02 with SMTP id ffacd0b85a97d-48e6eb13d20mr28975777f8f.0.1793728207969;
        Tue, 03 Nov 2026 09:50:07 -0800 (PST)
Received: from 3mk ([50.60.229.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm10439873f8f.54.2026.11.03.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:50:07 -0800 (PST)
From: S0CloseYetS0Far <foroncewillbeproud@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: linux-kernel@vger.kernel.org,
	syzbot+acd959f649966559199c@syzkaller.appspotmail.com,
	abu mohammed saleh <foroncewillbeproud@gmail.com>
Subject: [PATCH] comedi: give each device's mutex its own lockdep class
Date: Tue,  3 Nov 2026 20:49:27 +0300
Message-ID: <20261103174927.185498-1-foroncewillbeproud@gmail.com>
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

From: abu mohammed saleh <foroncewillbeproud@gmail.com>

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
---
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

