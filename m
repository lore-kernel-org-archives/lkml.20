Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604960;
	b=K0EZukNs/A4SzjJ6bGS+iHPb9yA0DEAu2JCIf8qCZoS2vhTnLaHHZJsex0VhBhvzRxWs
	 OhsaEuMJktwxwELmKteDHH5VPlAGFsCDV/M5OjB+Em5/7tcHJq9l58NLKSCzl8DioyHxm
	 YiActoEQWBlDX9fmEtk78RUp0XE/IwKzcKF/c3TlztJSel3H7uv7MDxHYLK7R1YYKrzlD
	 tN+Qn9jH07e4R5uO26IAZgPmf5vqri65AUqL0oU1gxGxAAsABvJ49MI19O6Ibp8JKUYZI
	 xxBFrqn/WVs9bsbJgOlT4mS5Qsafi11fhjVwfR+2YVyzXQWyMmDc+E8/vCOPcqZvZ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tgeRDsuy5w8yKpx9FEg0UTJK5z2DUghOSJu6TemiYLc=;
	b=FgKTc3zO45WZuJ9h9ke5vziSX6wPrVUUJgpLB6Laun/BhefJOB3C/BNr2xPs6rMeCLj9
	 JNYgosWZIMKDZDsxFpi0F0O7Cmug0mXhP9H+i1/rsj3UwsJmGpTwSqcLfmPlYjoMaeqas
	 jNfO7V+LwXgF5RC74bltRkJknSk0hciQhSh7grbRCkx4QgA7Ax5+kCh4t2iT3E8M4vt2l
	 Fc9O5fEW3DPuvOWb4dM2as8+VX+s+KpeG8Qgp9O9GwBtD3e9UdKtGh5R0w79UkwcNwp9h
	 4BaE09AmebhnvlceMmVzpOnBbel+XJ9hxAVVbBgJrQUjRbC+LvYd7fHlNgp3gK6FtRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=eL9FLDwT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467660A2616
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7467660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=eL9FLDwT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso10915545e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793604958; x=1794209758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgeRDsuy5w8yKpx9FEg0UTJK5z2DUghOSJu6TemiYLc=;
        b=eL9FLDwTm7RgAydFwUlBt59URClfd6IDs4z2aAAMigqvsWcEIpNe+qPq3JHzUJHva1
         Oq4s1W810lhJ4XEp1rUF8hFiGGf2ccPPdPJVbRV2A7iusf+caTcUk3uF05h0nIbKDTBE
         peT/BYm859Xro6EcNUKbcpw0jG9ZhtvJG60PUDwQduxemZjTD34WeShHbR1bIYBDOJQ6
         3S4qHJUG1ARNhCFQJSpEV6jZGlzeQ3qOf2V6ecBKDnTcnvmzUCRocO7nPgk3jtzniRP9
         YbYi+gCm929GO0KJ8PPehmhB/o/cOzGKRd3j/ud5PEVE+qFhUlE3f18icD6ZFi8Hh5/5
         9bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604958; x=1794209758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgeRDsuy5w8yKpx9FEg0UTJK5z2DUghOSJu6TemiYLc=;
        b=LyU5TIsBfvSMhFjFATz0cli66F8WXJ4YuuZ20m2NDdg9d/dUK+qr5yiVRz7qa2XW0i
         49cYXdKEnAgMVa+dMszkK/zHRlxzdhBufFf76z3KltX/ZqGawGA2Oeb1a35AEWpfXSXr
         9Vmc/6GbsdkIWq8MeFrG7Ale9h2KF1ZML+DUw3wSsSRUhmwRLDaI0Cm06jLR6QJZEDER
         LgZ9wlp3m50FvgVAFMzam/Oq70lXJyW4zUTPh55J+Y+kq5E1RW+FJec86HmaIZ5OZ4AA
         omLXRVu5mVEA+c2aPPjpx26AwsjVrLTx+yfhMPin3wtabsm+LICI7WBsIPHni0y0dTZT
         6CcQ==
X-Forwarded-Encrypted: i=1; AKwUvBynxFA+3DenDsn5JWJmrOeGzLc65M/7duLj3MLWJx6gPu6FmGOSV8iADA/6bXBTHWrJC5kTbco4zSmFHw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYISRjXikcvX2/06ubJWJBWnn7nzIYFz346Jx1btvwcyKfe0TinF
	xlHRP35PPEt6oUlI3RxFonrDsGa1B6jKHy0KYPZ1gDp/VcxQiHShOKOuUtnSL1Ijb9I=
X-Gm-Gg: AYBFou0fS5gB+HK8AA7qs1f0VYZibcWS6PX2WlznPcxzwSQsoKv6Y42idKGiOXkj3R1
	ed5GUnLORZgIOBtDdS2cEU9bHST1hJjbYXCLhFIYto6mmLGCcH3IDQ/DzvhtBWSBPETtbY1EGhK
	z8gh4hMyC7ZCuHjpxcsjvEAoBV+eugT8LXjXNPpa79PsuwWLwk+HtkaQmuBc/OLj/Nd2GwHtahS
	4mwnkrDuCT+1jTTT6IvgMQqISji/DKJiVMMW89t5niZRYvRcCrrwX7QYF4P6UXPqbKy5xwkSPr1
	/0ZG84J1LFxbVSD7kEm9gK6+Pj4l4mzSjBBvWsPVtQmhJFU8nCGMLPmqGoNgBwaVjhIV93Bh5Ao
	hEL0kPNcf6L9dg8uhLYxntnWjQy8hQEJW+dGYfiTQFA+QY9SFhRtey27E2TrXTUc8NaJitFwao/
	aDwfIFsX/DqmDCJ3NaBevzVWuj3+GCgIrLK/WFcfXy+pnv3yccBMd7qXxSrkaKytIbU8FrxDg9I
	xzFTmdKIb1PmXK49f4wn40FUdEoG53i0+04A6lhNZkLOyGROrvN9eYxuPfQI4TlG2YKLX95rqE+
	wFI97VznQAiCPmuj8xzlk7pwO5E48UdTbRcD//h8hPXYsS6XmuXKZd87Fc4qAQ==
X-Received: by 2002:a05:600c:c08c:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4ac12193b17mr168784715e9.0.1793604957868;
        Sun, 01 Nov 2026 23:35:57 -0800 (PST)
Received: from jwang-ThinkPad-T14-Gen-6.fritz.box ([2001:9e8:1447:4f00:35ef:c1f0:6ffd:177c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm17676058f8f.56.2026.11.01.23.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:35:56 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH v3] md: clear MD_CLOSING when array_state_store() bails on interrupted lock
Date: Mon,  2 Nov 2026 08:35:55 +0100
Message-ID: <20261102073555.53941-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <eded31de-2e92-4a3b-9384-03dbebc5e9e7@fygo.io>
References: <eded31de-2e92-4a3b-9384-03dbebc5e9e7@fygo.io>
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

From: Jack Wang <jinpu.wang@cloud.ionos.com>

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
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
v3: (Kuai) clear MD_CLOSING directly at the mddev_lock() failure and
    return, drop the out_clear_closing label; reword the commit message.
    Keep the set_closing guard: the set call is skipped when the array
    is not rdwr or mddev->pers is NULL, so this write may not own the
    flag. Rebased on v7.4-rc1.
v2: guard the clear with set_closing.

 drivers/md/md.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..f14a31387990 100644
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
@@ -4792,8 +4798,9 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 	}
 	mddev_unlock(mddev);
 
-	if (st == readonly || st == read_auto || st == inactive ||
-	    (err && st == clear))
+	if (set_closing &&
+	    (st == readonly || st == read_auto || st == inactive ||
+	     (err && st == clear)))
 		clear_bit(MD_CLOSING, &mddev->flags);
 
 	return err ?: len;
-- 
2.43.0

