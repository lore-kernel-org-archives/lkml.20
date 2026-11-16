Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828834;
	b=qoot7BAAfiOjD/mwQ2oSriFMLLtCAQ+R/9fnb7+Kjrk8pESzN9oOzBO0ctbwvcwIxz+G
	 qQPtd0o2J2qL+RkJ5O0P6si0lLoSrdBlluKeLkBORQJCo6+dEEW+S3DMuMrq5FoxYChDF
	 btjT02K+chpiQibAKMv1diXHQ6bfRvxY0g2Pt1zQFnqPfPizuNqyYZvYZjoRmT5wat4iS
	 rxNELsqriaSAFV4CSZZ6Cv86RrBvltAYE5glULDd5CZsff8vtVcIQ5Uh/OISbljuOWolZ
	 IA4kjAJw+NJQGDs8dBgFKicH9FuaoyLO83xbkNK9z+2Bq6Vs/Y/0d/NB9RWW8dQ5l3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
	b=syqan31xTR9b5X5hge0MZkATngYTGNJiQoURr73YoHOvZeRqzJdsukmebnxNqUmnd+DV
	 8Cgmqy3NvRGUWfh+VrKbqeGstSdjVNNq3UWX2DwGr4XLUWRXA4cSjDE9zjxyHBPGB8s0d
	 g0ItK6SFgqxwnMPPwtuDnPfLzoPCDxxlNHYu1FXgkvOCr0zwgcGLuRJ2p9QJPfxYaBmAO
	 TX2tF5n0+fQQzIc3VD+gfrvZUZ4BLb3UOxzBWcdaeagi1RrJYn46EJHmlt8VElafv9xRX
	 FWzlBFPyb2UFI/zMVOEe2lvshnpvEmFALsJvSgkQ5/lUyHeZSjf05IS7f2AsvGJp2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bznbirs1;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC0606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DC0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bznbirs1
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso5014637a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828832; x=1795433632; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
        b=bznbirs1W7KeLTcdGuIpmYZRxwnkpH5f/RlkezPsx5Zs2Dhfp3ec/lefIvLuX18cvt
         NoHo1RgNL6dtz3aB/iO9bwSZ2pifRfzNuYCA+txJ7XIF9qmTspFwlHcl0aGGHRSepq1B
         /TOeVLLVz41daiNJlAwZjifgbnod0SJgbT/IroLzExz8JT51sPXXN94sua4KXnRgJIyQ
         CekQtxYPcK8+dRCrhd6uWNrtdVljKk6Xv6ungX6K/1e3VgZnTRko7umi4kFW/5Yt8hQt
         rag4Ksak60RTN/ZX2aveiMw34rvA8uNIIEUFMLcrTryqj47WTpdbCXdDm0aNgjJupPYX
         Hfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828832; x=1795433632;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
        b=hbuh++JivL6huy9m5tcUAGdJNYr7UgEAj07dEtnhtGVKJBj8MDLa0RLv+PxgXJDtF4
         d0CaZ+NR4xm0Upwy54HY+Ntury3f6lzCFVdEAicuBh1XH/TGee4mMg30exnq7EOx0QqZ
         EePf9hVJTJabqlArPBizHxrZKBHEhlyS+nYLfXpvVtQl2uRRlDXgLSSchtvqXVMCM000
         S6RJZBwo1nMV2Nu5mwZF8hHMgOUrBoeiVFI7bBAUvc7c/Tx96WKVdepr+02GSE4rYlmE
         jKYAUl+/Li4SyXDkAXQnhauN6AwyTzibdOTIj/PCeAOVXpCmO8xMAWGp9hcclLcQ4Glz
         6gtQ==
X-Gm-Message-State: APuU4Z9yg/8qJ/FbD6ZxNuTuKz/NnyTGplL5Pm/hKftKLuyhYuZrC0Wb
	wNWYBGOUNac7qGiZfAOUH/GzYhbdObVOw5UnXJx4cKNEbJnyhlGhQbdQDNuL23tML0k=
X-Gm-Gg: AYBFou3zJaFhur4PfWKQV2w9s3Ph8lh82Ocrwd1mnMgrmv95k+Y5vyr6GEcppzpoHQc
	DIvn+3b7Lv9yOPjibxVgds5Fn8LgLmf++ct1WGw/WPYbi6ZIRi56BBYP1QqflwcFFH1gXxQRXCF
	QQaqdgNLgv0o93j/sS5Db1WdRmwlHTtgKBqhrEOS3D/0W1PZJL/QOvqNLcCDLglt3l/lh8EJHXd
	f9DrBlMkPoEpYhI7u4LNB6n+KSPs4Thh0EfCuONtB9LsySClS6JZZ+cHknBnXEMY5bJVJZVbal6
	vNeoAeUk/kHKyAzPxvgo1QKto0Y1HEIQGnuJGQbJICRHE1YXGUYqM+b4KnjjY53rUYHrV0bAxe/
	U69Z7bLawC0k56x7lsWYBWsytZaZ7Ac73W/0q2shNH4O2WTGymyUUjgrRG+lDNcH60avRYe63WZ
	j7vM2Tnw0OfAAB1qBC3Pfpc5UEGCJdJVlkl3QYrYbRFA4uUjDr4xxHncv3a+W0QSH3Di/Gr87fQ
	0ZOVv5S7/ZErm0pNhvFVUQOarycSP2/HtcT+1ExOouUbN70mGfjAf/GCNc4Z/rwRwUcs50AAEAM
	EHGcN9tdp1oLxEu9DG/1y1cb67oQGI7tqf/RSiPpdlNX7WvP
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id 4fb4d7f45d1cf-6b7c0953c22mr5985412a12.14.1794828831465;
        Mon, 16 Nov 2026 03:33:51 -0800 (PST)
Received: from localhost ([188.146.172.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm4334432a12.24.2026.11.16.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:33:51 -0800 (PST)
Date: Mon, 16 Nov 2026 12:33:47 +0100
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: linux-media@vger.kernel.org, mchehab@kernel.org, mkrufky@linuxtv.org
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	stable@vger.kernel.org, media-ci@linuxtv.org, patchwork@media-ci.org
Subject: [PATCH v3] media: mxl111sf: initialize state->d and fe_lock in probe
Message-ID: <xbzvgut6eavjeo3q5cpysxdirlvgatcr7qjkyadz4eolcchfeo@rjhvhba7lvdh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

During device initialization in dvb_usbv2_probe(), the dvb-usb-v2 core
allocates the dvb_usb_device structure and its private state (struct
mxl111sf_state) via kzalloc(), then invokes dvb_usbv2_init(). Within
dvb_usbv2_init(), dvb_usbv2_i2c_init() registers the I2C adapter with
i2c_add_adapter(), which immediately exposes the I2C adapter to
userspace via the /dev/i2c-X character device.

However, state->d was only assigned later during frontend attachment
inside dvb_usbv2_adapter_frontend_init() via
d->props->frontend_attach(). If userspace performs an I2C transaction
before frontend_attach() completes, mxl111sf_i2c_xfer() delegates to
mxl111sf_ctrl_msg(), which reads state->d and passes it to
dvb_usbv2_generic_write() or dvb_usbv2_generic_rw(). Since state->d is
still NULL, dereferencing &d->usb_mutex inside dvb_usbv2_generic_write()
triggers a null-pointer dereference crash. Although the crash report was
captured in compat mode with PTI, the failure is illustrated by the
following x64/NOPTI trace:

Oops: general protection fault, probably for non-canonical address
0xdffffc0000000018: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x00000000000000c0-0x00000000000000c7]
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x149/0x1550 kernel/locking/mutex.c:821
Call Trace:
 <TASK>
 dvb_usbv2_generic_write+0x26/0x60
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c:77
 mxl111sf_ctrl_msg+0x160/0x2f0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:73
 mxl111sf_write_reg+0xa9/0x1b0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
 mxl111sf_i2c_start drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:130
 [inline]
 mxl111sf_i2c_sw_xfer_msg drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:-1
 [inline]
 mxl111sf_i2c_xfer+0x463/0x5060
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:813
 __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2350
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Additionally, state->fe_lock was initialized in mxl111sf_init() (called
via d->props->init()), which runs after frontend attachment, leaving the
mutex uninitialized during frontend registration. Although the reported
I2C fault does not demonstrate a frontend lock race, fe_lock should also
be initialized before frontend registration.

Fix this by setting state->d = dev and initializing state->fe_lock in
mxl111sf_probe(), which runs before dvb_usbv2_init() registers the I2C
adapter or attaches frontends. Furthermore, remove the redundant
mutex_init(&state->fe_lock) from mxl111sf_init() and the redundant
assignments of state->d in the frontend attach functions.

The fix originated in the linked syzbot AI patch job, which used
Gemini:gemini-3.8-flash.

Fixes: 4c66c9205c07 ("[media] dvb-usb: add ATSC support for the Hauppauge WinTV-Aero-M")
Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
Link: https://syzkaller.appspot.com/ai_job?id=c5284b5c-3f14-4e95-a4b7-6ee38f0d2e1f
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>

---
Changes since v2:
- Drop the non-standard Assisted-by trailer. Upstream commit
  1e035297ffdadf2184c3c773b8c098e372324aaf
  removed the Assisted-by guidance and checkpatch exception.
- Disclose the syzbot AI origin and model in the commit description.
- Put the stable Cc after Link in the commit trailers.
- The code diff is unchanged.

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 6404eb74d..fc4010b6e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -431,8 +431,6 @@ static int mxl111sf_lgdt3305_frontend_attach(struct dvb_usb_adapter *adap, u8 fe
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -502,8 +500,6 @@ static int mxl111sf_lg2160_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -587,8 +583,6 @@ static int mxl111sf_lg2161_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -674,8 +668,6 @@ static int mxl111sf_lg2161_ep6_frontend_attach(struct dvb_usb_adapter *adap, u8
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -749,8 +741,6 @@ static int mxl111sf_attach_demod(struct dvb_usb_adapter *adap, u8 fe_id)
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 1 : 2;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -935,8 +925,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
 
-	mutex_init(&state->fe_lock);
-
 	if (state->chip_rev > MXL111SF_V6)
 		mxl111sf_config_pin_mux_modes(state, PIN_MUX_TS_SPI_IN_MODE_1);
 
@@ -1068,7 +1056,9 @@ static int mxl111sf_probe(struct dvb_usb_device *dev)
 {
 	struct mxl111sf_state *state = d_to_priv(dev);
 
+	state->d = dev;
 	mutex_init(&state->msg_lock);
+	mutex_init(&state->fe_lock);
 	return 0;
 }
 


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
