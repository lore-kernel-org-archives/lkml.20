Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572599;
	b=38eYTi3Nc/trtFzzPSOKQERh3CSJWKjJX/szB8KUGN4xxuiXsTP3Fq7KwYdZ84je6pVh
	 P/7aAQxxO3/cR2RUaV8ZsVfv8tKHAJ6pWSx0X2uyQ+CN5dtdqFLOCxhPfXLsGOpnGSUrl
	 9p6p49KDYuGC5e4y7wSMCMwSwGiqnVYEsnt7DSNhVVJzWu9R7pYD1Ok7O80Y2+3No6WEj
	 2TnHxQvJqydu6KTod/4AloanBV3b/A+TRtU+qHByhVj0OnOvvLLoGFPbR9EnwSWddkLYC
	 KV2/K+VqKUB5yy7QF5QmxFIEBBHgipqVq2vCCPZUFjR1CX48pzAGDmqj71dmRBP6Fqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=zlDmTV1GyS6XuBCY2hY++G3SnplVZgYyAQRPIUWV5B0=;
	b=lj5konuXNLZ5sVE7UWiU4en5f8lqpXmaA5KOZO7Kcc9Tv5PW4XuYTG6qKKWz+DSLq+pf
	 UwOhvbc0MvDzRWgQd6YLBxUl6j7j3phu4VpsCAO+0GiBScTj2LAPBewjmEP4cXhgIHttg
	 2uRf2Bo9uCXFOk0KvgJQVux9uMKwY0TgY5MGWu/Wil49U+rOqNNTYEQsKyvhs+Jx5Ls3d
	 abEV4wMj7/WDzyt4eIglYGuHmpn6Es0eG1F6i0XP1QeFw9Wti8khxgeCah/JBe7OxrFFF
	 gGCJt7/bBObS1ZJTcZU0iAmAWl/zSykw27CxwHArrCf9RQncXju17LMT7Lmn9nd/RMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1KrE5AB;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA4606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABA4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1KrE5AB
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso236511666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572597; x=1795177397; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlDmTV1GyS6XuBCY2hY++G3SnplVZgYyAQRPIUWV5B0=;
        b=S1KrE5ABtnYaepR+FK1FFhl7eOTHfgezF48bLy8QKtPcPYFsnBGVD9wlPzV+sqnRSv
         5IYADCj4BGpeYO+rPwgkIeydufu4K1Xu54deyrBcHabL1YY/VNvnWsyN2VIzq6/aOvNN
         kN9RcCmiHIZQiyMTPxpvuK2ATRx9uCGD26ENwlQ5u1CdVuzIlG320xsurSG+Ou/XbXxk
         KAf4jjO0CEcP9TPYIBXHQ/Bw299p0qBCgcunkhanpFQarVArKI29EoZuAg8H17N1M1YZ
         Bbw0S477+HJNz0UKYFllU1SUkf0p+XL8MCx7QUg/5JJ9bJ7NsQWXrI2Da+hNxjJkXVVN
         d2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572597; x=1795177397;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlDmTV1GyS6XuBCY2hY++G3SnplVZgYyAQRPIUWV5B0=;
        b=z5hVCHj80XoRiPNw8SBxxn14kHdnqXz1pin3Faq7Dc09zsn9C7sU9nPEaWjgWPTQGM
         HI4LHNHuaADJdA0ka5IJaXe5qE8O3akF6AXOKquY5Cm3AY1GWtwKKp6MUVd/auK15U7q
         HmpxDoPArgDG/HbFGDo5fe4plOZ5KWHXshlaTCafQJtFqpdJiiN5roN8D4awaDt6RKZ/
         i4ZqKP9FxkjGlMqw1SUmFQYQRF7Mg4EdYV0+Z+9Fjbal6zpwrQnJgzKqIBWYWdmhw42o
         Elbq97Nbf4nmKGgb4ApDuHkH4ffqYFgeRUBpalXb0DcvE8KGpAy/rlayE+nPwsyU0MuA
         6D7w==
X-Gm-Message-State: APuU4Z99Kj9xmtWatsElkWOuzldquu5PUPn2Sqce3muum8Al9y3f8Md8
	HssIpElzmw1bq6SHb99esaDqiAxzS0a6fPzw57IPtB2IcyfvYaqTGQd/
X-Gm-Gg: AYBFou1BZIBBCLgMs5GKSPnXlY6ysatC03nWUSmv36qCnItf64Akjm+WSRw1t3ImPWP
	gc6U8oxBRv7Pq9RsACn0edUyrnT9834WAf2TJO5ZT5G0155jjx6vKGst+mOC5hCxfH9sDoRKh1z
	iZYumnymKWNq37iVQ/kYLYWHk0hGrPVWEAbB8wAPZdTuDM3X8Qnbq9AY0mnB8b8dDmdl24cmcy7
	GvJ4ncdwiLANhzABgptx/CAHI70Y4aMi+t9KxjXCE8YYO1wTvjVdeJCTqrg0IaQaUAl/YBOtFQu
	1vm2rp4lMCwhuc+asT6elDid7YY5mHmok/k00vCkf7TZtDvXPqhmEflgPMxOSjm/52FkYLL7wsL
	MTF1ZMnvycnuHl4U7TMAdwLmTDXGsSVPfughGeOpsZFAS3OYQhBDPGAGiv1sB8vo9MhFCUnfb19
	W5wYpcs+YMT9q5BrLyuVOQdn/ZpTt14blRcNLIDDMBUuHrpMLywkwBxODHbL+cO4uUWQrw6GLWq
	4SmjOSDEGFQ9M5OKpMpwhwZTAqKjNfy90HVUEBikkOJ27G9y8hiPRYhm80Z+6Fcob9yshQ4fs+1
	AGyXlvEhtQcPGxtYT4ro3/q80tO46X0BnJILSM9f7vxRQgIg2qEqlYT7IOwA6Kp67F8HaA==
X-Received: by 2002:a17:907:3f8d:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c50963bba0cmr238279566b.20.1794572596311;
        Fri, 13 Nov 2026 04:23:16 -0800 (PST)
Received: from localhost ([188.146.170.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b780d6sm85244266b.67.2026.11.13.04.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:23:15 -0800 (PST)
Date: Fri, 13 Nov 2026 13:23:14 +0100
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: linux-media@vger.kernel.org, mchehab@kernel.org, mkrufky@linuxtv.org, 
	mkrufky@kernellabs.com
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	stable@vger.kernel.org, media-ci@linuxtv.org, patchwork@media-ci.org
Subject: [PATCH v2] media: mxl111sf: initialize state->d and fe_lock in probe
Message-ID: <ng3o2if45f7ooswkxqvgh2rmq6vwptmtpfcuwty5wfsmngs2ld@urxpogq5omhe>
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

Fixes: 4c66c9205c07 ("[media] dvb-usb: add ATSC support for the Hauppauge WinTV-Aero-M")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:gemini-3.8-flash syzbot <syzbot@kernel.org>
Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
Link: https://syzkaller.appspot.com/ai_job?id=c5284b5c-3f14-4e95-a4b7-6ee38f0d2e1f
Signed-off-by: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>

---
Changes since v1 (10 Nov [PATCH]):
- Add stable Cc to the commit trailers and mail recipients.
- Add the syzbot mailbox to Assisted-by after Media CI could not
  parse the original value as an email address.
- Rewrap the commit description. The code diff is unchanged.

The earlier RFC v3 carried the same code diff.

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
