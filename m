Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474937;
	b=dZuM/51mct0p1GSqNyKjA3oLm5s6oxEpFxUaXQ4/qQ6uNJVZaoyMyaE2K1NsJyJAl2es
	 dHZ4IXQ0j/1F6WnlMRQ3Xw7iVBEjxd6YSRsQyagKJwX5J9yEYr9Xx0YLC/kHYbKN2NA3j
	 +VOdz1WgQyJLhn80+7dDHQRhGcc0Z2R4fSlQY+WNS/tCZMRPI7KtjCg2gdfLh4eEOW9l1
	 XFafuB5qfcl/B+eOEXpZw667BwFuagBMz8gQlKlSwUwNpmCh7nVMeemwpaUs41qsj2/vr
	 GamvsYKCXGR2PjqHqiJF7vJAb44P7DR/FHKa+12umou1cQlf9FMpzmwAs8W2tx7ly0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yusICm5FqFDhqKagzUFQzYsZYok+0ZTBuA+SIPwr+Q8=;
	b=mzfVNzoZYLXh6/RkIxlnJdIR6PA9MWdpBlSvcAQMGyOfHdudaiEhqTKTGuzyc4G2IBCs
	 q8rdVWmAnWHcEEOjp5I86VWvnV4LgoBx5YnN0TJUSFcQQ1vEjaf/08QudH3ObiyDuSGaI
	 X9oy4qHP0ojIl6MQNCTO+JOpJXgmSAx9FZIVw6qYZfi4nQ++YNMKIwm27FIDmRUTxPgwY
	 NnWHB2UAkOWU4ArgaCe1lb4YnVyynVUDShN6jFuQzNi0OPEYhHfTdzCFkBf3Imfqo4QQq
	 fRHWpucBbL5C5oiHB+euvc45fFpAm5xbNyWs6fVjstKDIqf2uQ6X0ctTUfGP/sqHM0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=SoVQ1BO0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19764606A887
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19764606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=SoVQ1BO0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a610c7e61cso1116015e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794474934; x=1795079734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yusICm5FqFDhqKagzUFQzYsZYok+0ZTBuA+SIPwr+Q8=;
        b=SoVQ1BO0VAZw4kc4pJVbOYxZKECJAqy7nj67e0EvhxlR7T5lJaoypjMfjhVpyC2fMz
         oX125kayJQ8ipijpQTzBw5Y8NzSJeBbWVp41GFLNZDV95A/h4WKbKaVuK0etStV1JUuz
         QdFtg4qJ+wxbS0Z2vw+glxpCo+Kw1VqFEyBQ2p5lUEh4ZKkCEzJ78ILoZ0qipaU0jiS+
         B7GfEoxpOw/NrxJVmguaeqWdNWDQPLsJ5WXxg1ijeca5HbY0P2P49j6zGVFgDFhH3K6v
         g+WvaOY8CwGRw4T0QO4shn7HmjAJKelf8DP4vC7tK0+0gIWLN8bs+RjwpBSzalZP8d+o
         c8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474934; x=1795079734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yusICm5FqFDhqKagzUFQzYsZYok+0ZTBuA+SIPwr+Q8=;
        b=OsFNcrdOwHVc0Z35Nvoo6xjfpdzqVv83RaittIQnWGGshUueyk3t1uxI7T2qcySMM9
         HNe9p3xLhhQ5svE+Hya1JzS1f4X4jMVre159ae89jPptTEGC6kOtbslmGr/NjQ5/5H2X
         jJlpv+Gf2xL5kr51hWqIuvdG3/7Pam/cwpPPWGasK5hAVaahunKLkloCMoiHclnuBKhS
         RAjUnF1NnyFjZLifRu0VwJBeAnIUO+jE2SO+ybhzShG3MAK4liFOrny2QkpV47lAu2we
         nKxjj1DRL6cYdPDf0VB9OBMjdvjnMFqXIuGBuzErWnRj2leDJZxR4Hzj+7agJxQ+zVWl
         GQuQ==
X-Forwarded-Encrypted: i=1; AL+hErHjOQTjDhmrxvm+yVfXgqoWNCUdwx8Bg4m1pjrI2eUsPbtlwch+TXaJYq+qg+7+c3ydtBMr9DXM819ThTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cRKFiKcqHEDL5LpfMN00us4JspeS2pouBrmEG8U8rs1sT8VSF
	cg4QU/MSN7Wa/gghgrk21q7uKRLDOia9VkukCJ05CwVuZWHlxA/g7YPqEYJGu1CZ/qC5y8VbMjb
	zc4GBADo=
X-Gm-Gg: AYBFou22HX4OgLoCwauvvyDJtU4/sVyY2sx6MBFk8bD4HYORUSg+dLeX6qYA8YBuQEA
	afCXRKfeM+44ZpbetSMZZ5ZQqJ29qrJu2eQdF30SdWJXTKkMg+PyA5Iw+FRb4+4p1gVJWwQwu4m
	vUqdDICB/UMvpKJPZIcTDazMFuy9kcnsoHk0Yt8HRxMcV1I/UqSSWnTKDc4aUUBd2Y6vj+KgL/j
	TuFpWSyC3IpNqOhrsEJbqMEzi087PR2tO1cFv2VEt/HYmV+1KaIPIGkkROvTuV1uD63mG9rGkLQ
	gANdigy4s9Wvz4ePGfHtTljXyoKl0xnrEzw90QldKWbPYKqDySZQz3rZM3PX+MW0lJLcmHr1czp
	O8gg2NHwFVcCYE1zJfnsqYriJyLiW0Dnnr/kz2+uYbrUFGrfj98/gc+t1HV/PlML5YlEla1XepV
	YXfEEdsEehQQMBL3pCwdKQE8nznIC7HRTNqm2bH6DvatggD24XwHIVy9ILWsIbwjMKh2GhPVYX7
	H6QZ/nYPO98eOjQb40mH0giuotw91L7zP2hjS4C10pCC3GFqpeExs2xN4ugjGOXDtoc6X7a3uVW
	zkMvXCvz66Mkx4nB5VU8Q2Z6hQXomKFSrMOC8ypcYPtiatoGV2eC/c8d924628HblEPcVXlOwu/
	3HIQBv+hHq/yW5dsXxSAxuu2K30Y=
X-Received: by 2002:a05:600c:4189:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ba0935d28amr54148265e9.2.1794474934375;
        Thu, 12 Nov 2026 01:15:34 -0800 (PST)
Received: from jwang-ThinkPad-T14-Gen-6.fkb.profitbricks.net ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm58129935e9.12.2026.11.12.01.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:15:34 -0800 (PST)
From: Jack Wang <jinpu.wang@cloud.ionos.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] md: don't leak MD_CLOSING when array_state write is interrupted
Date: Thu, 12 Nov 2026 10:15:33 +0100
Message-ID: <20261112091533.145342-1-jinpu.wang@cloud.ionos.com>
X-Mailer: git-send-email 2.43.0
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

Writing "clear", "readonly", "inactive" or "read_auto" to array_state
calls mddev_set_closing_and_sync_blockdev(), which sets MD_CLOSING to
keep the array from being reopened while it is torn down. The flag is
only cleared again at the tail of array_state_store() (for readonly /
read_auto / inactive, or the failed-clear case).

Between setting the flag and reaching that tail there is an early return:

	err = mddev_lock(mddev);
	if (err)
		return err;

mddev_lock() is mutex_lock_interruptible() on reconfig_mutex. If the
writing task catches a signal while blocked there, it returns -EINTR and
MD_CLOSING is left set on a still-running array. do_md_stop() /
md_set_readonly() never ran, so the array keeps working internally, but
every subsequent md_open() now returns -ENODEV for all callers - the
device shows up in /proc/mdstat and sysfs is fully populated, yet cannot
be opened, and cannot be recovered without a reboot (all clear paths
either need the device open or re-enter test_and_set_bit(MD_CLOSING) and
bail with -EBUSY before the clear).

The window is easy to hit on a busy host: reconfig_mutex is held for long
stretches by a running resync/recovery, widening the interruptible wait,
and a userspace helper writing to array_state and then being killed or
timed out is enough to leak the flag.

Clear the flag directly in the interrupted-lock exit. Guard the clear
with a set_closing flag that records whether this write actually set
MD_CLOSING: the set call is skipped when the array is not running
read-write (or mddev->pers is NULL), and in that case this write must
not clear a MD_CLOSING it never set. This also tightens the pre-existing
tail clear, which had the same unconditional behaviour.

Fixes: 99b902ac1725 ("md: sync blockdev before stopping raid or setting readonly")
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
v4: (Kuai) drop the Assisted-by tag, checkpatch does not accept it.
    Keep the set_closing guard at the tail clear but still skip it after a
    successful clear: md_clean() keeps MD_CLOSING set (except for legacy
    async del_gendisk with hold_active), so clearing it here would let the
    stopped array be reopened.
v3: (Kuai) clear MD_CLOSING directly at the mddev_lock() failure and
    return, drop the out_clear_closing label; reword the commit message.
    Keep the set_closing guard: the set call is skipped when the array
    is not rdwr or mddev->pers is NULL, so this write may not own the
    flag. Rebased on v7.4-rc1.
v2: guard the clear with set_closing.

 drivers/md/md.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..fb9c4d12c4c5 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -4671,6 +4671,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 {
 	int err = 0;
 	enum array_state st = match_word(buf, array_states);
+	bool set_closing = false;
 
 	/* No lock dependent actions */
 	switch (st) {
@@ -4691,6 +4692,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 		err = mddev_set_closing_and_sync_blockdev(mddev, 0);
 		if (err)
 			return err;
+		set_closing = true;
 		break;
 	default:
 		break;
@@ -4718,8 +4720,12 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 		return err ?: len;
 	}
 	err = mddev_lock(mddev);
-	if (err)
+	if (err) {
+		/* Interrupted before any teardown ran, don't leak MD_CLOSING */
+		if (set_closing)
+			clear_bit(MD_CLOSING, &mddev->flags);
 		return err;
+	}
 
 	switch (st) {
 	case inactive:
@@ -4792,8 +4798,8 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 	}
 	mddev_unlock(mddev);
 
-	if (st == readonly || st == read_auto || st == inactive ||
-	    (err && st == clear))
+	/* A successful clear must keep MD_CLOSING set, see md_clean() */
+	if (set_closing && (st != clear || err))
 		clear_bit(MD_CLOSING, &mddev->flags);
 
 	return err ?: len;
-- 
2.43.0

