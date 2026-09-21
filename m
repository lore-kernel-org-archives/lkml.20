Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8A274B4A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957224; cv=none; b=HWWdajgpp3nTqinBLcLt75ZM1gq+BN5q+7fCm+xDeeSX+u4qZ6a095V8rdTw7ubnmLVnfgXert3cTe/CKD39F4p4Qjnssr0gzvPcUd5u/gls42BqOfsLdPaoUj1+6lELUJgYkpvNH3kE7ymJUAhffNssTYMTbDvaGFvWDoavmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957224; c=relaxed/simple;
	bh=vUf7QAanQ5dKq7z/fJvehLlpKSca00cy1tgrEizeFrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L88/Dn4D4vA1+lbKliIXcI2LcHIuNMFmVVPoiCvTrAa/qZ0hFhRWm9OquAToeEiPmCJVW8VqAJnR5L3bapW+V6Wmg4seZPe92CH9l5UlDIt88J1RDz/iY3n+MnW7IORXHjgWMBd05McIuZIZFMVbXxNrGVz7z8e32poC3KfPiJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0skpZ1p; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0skpZ1p"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso2000473a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957222; x=1790562022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTEAVZypIz1LkNdblYydsxE0PH83Gg7fz01btoAhDQ8=;
        b=I0skpZ1pJIiIOg5VKbG985MPt0AA6F0R5zFL3/qkDidr2Zbc/6z+2i3syYoSGooqP7
         p+39zbfeUDa9iz0i0ew0Kk1XR2hBMrrTgtRy1A7mKbnADQ4ByThct2Yhkp0bNMBm9D7w
         HcBiuSN/5qmdlnfE+f+mVmvUV0OzPqmi1yi8dv2TNaPdZGDdRnROfIPwRh6DCXGnehBy
         9BqoCEL6cJSOP2k7RKEVzcnyuwvIf+DA9XN8HcNbgd04RvHUcYmp3Z0GnDxMYg6Nzpcy
         3oeMrdHjMwncV8fwHlq9H05w00MkYxHt6NYP1uteM0ihvL11Mpv4FJDsRmCcc8ZQjIb/
         xCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957222; x=1790562022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTEAVZypIz1LkNdblYydsxE0PH83Gg7fz01btoAhDQ8=;
        b=biSCuvP3HzEtZ83uSEFWQa24QywmWgJWWxNjLsrVrZ9vK+DfUti3k4W+nWnsBwmu4L
         DEoo9xLqF3OWNFy70ZFe68ulOjL8yOwdd1EuWSxO2koZSpjrgxzB+pSVoRGaKfZost26
         r6Mq1zXl+NMqb/wIK2KcxRgxXZs4kmC6+GcxjG7hovOecOq5UXSJbceUqzPYuq/wvcaP
         OuWr+nlHI21aDpNjxlyl5IL54TmNJ8P9/lfPhJMMaj7pLpj8/hA7m4ftcw3zPd+3Oy7E
         jxIC9nRmnC5ETS1tUWFu9/Ipq5K7rZnPuOpU6MIvNpJzFeLvhiDt3rjgZJP76PJFeGSU
         xLDg==
X-Forwarded-Encrypted: i=1; AKwUvBzILR5KoJaYm8R22Le+Rx1FCtvF7gSmoFkVR5WwjPwiLn47vjOK32A33L6bLgFt6mkFRZipGSP+uhcBcNk=@vger.kernel.org
X-Gm-Message-State: AFuF++llC2Gb+ck3r7moVBC0VAnczH6NB21sZq2fJEw7ckLa5/4pfiaW
	dtlJ0NdgftRg7SYGsrQ893SbDoa6xauBd4wH5m7NlA6Pqk54LF01dHgjMyqy8+0g
X-Gm-Gg: AYBFou2NCJbwwbeX/hQ1wuFo6y1woxebkCTY/LeW6Ka3lhX0dtWaMIUkFhdEfHwdcv5
	mIX3quQYvpwyujIzOWvnclqi5BK6qTThjOYVemd8aW3U//fMXJ8L43LUeWnoXdyBCgbZKuzZHGW
	PQGYxLWWpczIjMb7TSSMJGKGYatDctMhfsZIJGiK44U+iEL2dAXIVVfEzYOzWtGDIg/gerxjoFl
	xiM+ZgjOCRbYd1I+VpFi3ZupasR4iZ8S4TA+rW0671r/xO+K53dD0n/DNUpvLwqhoGtbTisH6Ti
	gNYZWEgKEJ+Oh9zy4V6qui4JKS7PV/1XSBTEMOWnF1WNCXP3Bixij4oqq70KzlZzk9BIAgb2Vg7
	Aw6NJDK7tWmIiYiOvJzCkEr/C0RzhtMOpbMTZy65ZnG1moY4vWV6KGp4Y3jAouWXxHEAdaL/Txf
	EL+BYbSQ+5dyZsUh/L1fzLvY6cEQNYHIGV83hiFIanOHhZctT/6jiWa1yKvMMNZzly/gXPyhhtc
	M0mw/+nSEZns9mTMjASi9fq/JzGWJdaS7H0wRAPn4a0DF2PWrhMZYg163lnQwspsSN3z8XzQ5jZ
	wREwg/LBSA==
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr14530866a91.6.1789957222045;
        Sun, 20 Sep 2026 19:20:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c5b3932sm11294882a91.13.2026.09.20.19.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:20:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Hui Peng <benquike@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] char: hpet: prevent hard-IRQ divide-by-zero in hpet_interrupt() via HPET_IRQFREQ
Date: Mon, 21 Sep 2026 02:20:19 +0000
Message-ID: <20260921022019.865442-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919203515.2581203-1-benquike@gmail.com>
References: <20260919203515.2581203-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hpet_ioctl_common(), HPET_IRQFREQ computes the timer period as:

  devp->hd_ireqfreq = hpet_time_div(hpetp, arg);

where hpet_time_div() returns div64_ul(hpetp->hp_tick_freq + (arg >> 1),
arg). Whenever arg > 2 * hpetp->hp_tick_freq, integer division truncates
to 0 and stores devp->hd_ireqfreq = 0.

Although hpet_ioctl_ieon() (HPET_IE_ON) checks if (!devp->hd_ireqfreq)
before enabling the timer interrupt, HPET_IRQFREQ neither rejects
updates while HPET_IE is already active nor checks whether
hpet_time_div(hpetp, arg) evaluates to 0. As a result, arming the timer
with a valid frequency (for example, HPET_IRQFREQ with 1000 Hz followed
by HPET_IE_ON) and then calling HPET_IRQFREQ with a large frequency (such
as 0xffffffffUL) overwrites devp->hd_ireqfreq with 0 while the timer
interrupt is active. When the next interrupt fires, hpet_interrupt()
reads t = devp->hd_ireqfreq (0) and computes base = mc % t, crashing the
kernel in hard-IRQ context:

  Oops: divide error: 0000 [#1] SMP KASAN PTI
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0
  RIP: 0010:hpet_interrupt+0x20f/0x360
  Call Trace:
   <IRQ>
   __handle_irq_event_percpu+0x102/0x400
   handle_irq_event+0xa6/0x1c0
   handle_level_irq+0x205/0x5e0
   __common_interrupt+0x60/0x130
   common_interrupt+0x7a/0x90
   </IRQ>
  Kernel panic - not syncing: Fatal exception in interrupt

Reject HPET_IRQFREQ with -EBUSY when HPET_IE is set in devp->hd_flags,
and return -EINVAL when hpet_time_div(hpetp, arg) evaluates to 0.

Tested in QEMU (-global hpet.hpet-intcap=0x0c24 with noapic) by opening
/dev/hpet and calling ioctl(fd, HPET_IRQFREQ, 1000), ioctl(fd,
HPET_IE_ON, 0), and ioctl(fd, HPET_IRQFREQ, 0xffffffffUL): on the unfixed
kernel this immediately triggers the divide error panic in
hpet_interrupt(), whereas on the fixed kernel HPET_IRQFREQ returns -EBUSY
while HPET_IE is enabled and -EINVAL when hpet_time_div(hpetp, arg) is 0.

Fixes: ba3f213f8a31 ("[PATCH] HPET: make frequency calculations 32 bit safe")
Fixes: 273ef9509b79 ("drivers/char/hpet.c: fix periodic-emulation for delayed interrupts")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org and include the QEMU test procedure and
  oops trace in the commit description per Greg Kroah-Hartman.
- Add Fixes: 273ef9509b79 ("drivers/char/hpet.c: fix periodic-emulation
  for delayed interrupts") for the mc % t division in hpet_interrupt().

 drivers/char/hpet.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 285c6037417a..ada95872e148 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -625,13 +625,18 @@ hpet_ioctl_common(struct hpet_dev *devp, unsigned int cmd, unsigned long arg,
 		devp->hd_flags &= ~HPET_PERIODIC;
 		break;
 	case HPET_IRQFREQ:
+		if (devp->hd_flags & HPET_IE) {
+			err = -EBUSY;
+			break;
+		}
+
 		if ((arg > hpet_max_freq) &&
 		    !capable(CAP_SYS_RESOURCE)) {
 			err = -EACCES;
 			break;
 		}
 
-		if (!arg) {
+		if (!arg || !hpet_time_div(hpetp, arg)) {
 			err = -EINVAL;
 			break;
 		}
-- 
2.49.0
