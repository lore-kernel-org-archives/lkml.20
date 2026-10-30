Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336343;
	b=MJpSlMFnjXsjdhEv1CUmOYJbt1w1eW5oaiOYk1OK36vz6eiaTR+RPwQhB2wgSbRekcP/
	 QyxDXiqZQQzoWEoVSy18S4Q9JbqDa88KvVhX3RXZqBgA6QuINP2AIEMznn1olO0yz5XOW
	 VdrqwBDSor/dT72OWMZth9BRPvjETXKvRwIMxqK/4kZpHrJD0RFzX/MgAk3e+LX0RHX98
	 PH6bYClYLytPArbxRQ2B7aaxVDlhOTlInQhvFqFodAdAs6eM/qY2pY1Pzanxo0b10vWS+
	 9heepFPZHutzvvrVOQIzW1E3m62MSAVJKlUzQsKcs9fcbHK9xC8LKc7CDdfJkoRYlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UNGSjv4o0HBU90AGH4xcc6Zl05pH//0mf5MeXFB8Jaw=;
	b=AHGkT1sQjIkflvXU5vJgclFahq0rNzSf65IeWRW6iYkqReoX902RHLO5YZJkUhPFRBXu
	 cmAvdnqwC8zgzWby6tne2mEPgjUpeIjbClQPJW9CIQLre6/nPxk0rN+jsXVQxEVL87g01
	 b6lUYZQKXdrQwFTQr8WiYLqJm8POp99yp9sT0GpLy+XEIdQBnxdZdXOlW5X+VobYNBnEn
	 BBE7I+ZIIqv/VSV6L+0Jw0kDV7rVkEhokZNKfTmkKNHRQeN0jG1irsW0uPUZc5RWEshk1
	 kbxFdE40DuufUBplfLqIgrSxFQNtW9kPYjxOc8wFoNib1iC9/MSHLlefuUkwgBaycdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrAOp1qP;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrAOp1qP
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59524so251017c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336342; x=1793941142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNGSjv4o0HBU90AGH4xcc6Zl05pH//0mf5MeXFB8Jaw=;
        b=xrAOp1qPKlvoxGyQvxvlheyc6cfA4GHBcmhtRsZJFPhdacmU6ByarJ7Slxy/FTx4ml
         5rYXuUJWqoR7naE4UE94dZhfp5ue5fRa3MsZX9OqYvneQiXaAX74t5mVzON2v2awvGQ6
         wZbJA2ggXi/OHEiUpMldCt5bRaMvAlKUzkGB0W/7Z3QJLnbv3so3IPDizv3SpKBLSMBa
         XUxMi95iqvRNC7owPZngx7LprYHUJb0N0mM0m8WI0VWt5dyPOAZC+SzL5RnQMLiDTRD6
         ovJEdbCMSVKzOlY47EILQF/oBnDeFKlPfwEvhffHysK4Ij/DOBupcNfVLbbLpodGiWo0
         i9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336342; x=1793941142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNGSjv4o0HBU90AGH4xcc6Zl05pH//0mf5MeXFB8Jaw=;
        b=VYZqJXMSceliJpwgdIWk2ESxxZG3Wa6xXPHCQJP4V9N5slXGn9Rk4VRARJRnwlPYyh
         YJh/Ve132EbIRPGPkaQY7B1VWGuX5jCdg7HQGwUj24IuOMjE32dSGjzJMgAStcQh2S7e
         sp0R6Ty0SYHUrzMmEAm+KWtMUJy59NnbGxcS6uDziiY/NVxQid876BBja/GbgjBeMcPS
         cw3/7pMGfRa2VrQ9XIb26MBTzOaZjnFxvmQMgyN1qtsLxzNpPCv/JTkeP3LbcqQoU4MM
         MjOnlx7+hkgiGxmuPBpAdLe4O4wDsI+JK+9V0a25RhGMRrwIYQHXqWoUuWP8iENwjecw
         pPVg==
X-Forwarded-Encrypted: i=1; AKwUvBzDXSuzjHtRZMvNOTAOoQS0jqSO0cvTAGGXI+9GvhKCuWc7YKT80xbido5TjNzS/J1c4+gBf3+NVxDdB6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoc8fssE4diTRyp6quXiKfOa1AiMrj1Q4oCmD+02nQF7vnyCLm
	bqhp1oq13yToG10SfNSlugga7Axq/F7zwA5SLhAsE9sJk0aQt9QYFkX3
X-Gm-Gg: AYBFou0p8A69pLnJ8APAZZmWIlT5GzWMQOY/lzCEOvZqK2Xfu8iKogE7RQlCe0Jnv/+
	N3F32xJcOKk6AVGQ8w5SCx5OYHK27mJkqCuzOBXIO4DijaC8Dp5f6+zyulJAvwfaHU+pL8PItx8
	nGpZ6inJEdsEnAkXfToRg1RAiVjAk1USdEbwzQJ8SMeAaUeSpmYgOYWjM6UQepxo4USunJxaNKL
	JMeslsPQ/+t3piQpiYgIp+ohwhbtfe/Ij3ourG/zXCiRn80y3ondV6gNDJPkvIFN5sLtIXyJ49Y
	/RwK8SLYJHMaiz+wVnvNDXxCcj0hPVfWoVvcXf3+1BRN635u809q2hbNjY8eCeskXI03VB2VfGc
	ZYsLMteIxQpFPAAVpxXAUpNjuxKRvHzTgrnqqi40wLhLhqguED9YF9xjdl48/KAMF9GQof1I9i3
	2L3Mm1K9Semvv+rUh8K48u5SQLEP0Q9IPrs9S/yDfgBhR/RU4bZ4GLVj5EflzTKQQVJD5OSdScb
	RwRj1nh3sPW+QNKmpcl35mjaqU/sy7YO889o6Zoj7gKGsnpPZbahyc3Hnp0hV+pdCgrCfkvCIAM
	rcxnaIxnd0VGoSZdCwbYbFz/GBjEXpzrGxks2eimi8oCVQ==
X-Received: by 2002:a05:701b:4646:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-1ac5eea3b63mr1661179c88.26.1793336342381;
        Thu, 29 Oct 2026 21:59:02 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm3433152c88.8.2026.10.29.21.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:59:02 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v4 1/2] tty: sysrq: don't expose a partially written reset_seq
Date: Fri, 30 Oct 2026 12:58:53 +0800
Message-ID: <20261030045854.153556-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030045854.153556-1-zhanxusheng1024@gmail.com>
References: <20261030045854.153556-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

reset_seq is a module_param_array, so param_array() builds it up one
element at a time: it resets the element count, then for each element
calls sysrq_reset_seq_param_set(), which stores the key and bumps
sysrq_reset_seq_version, and afterwards increments the count.  Every
intermediate step is a self-consistent sequence carrying a fresh version,
and sysrq_handle_keypress() reparses as soon as the version moves, so
writing 56,29,111 publishes a one-key sequence and then a two-key one
before the intended three-key one.

A key event that lands on the one-key state gives the device a one-key
sequence, and because the parse runs before set_bit(code, key_down) the
count is still 0 and reset_canceled is false.  The same event then reaches
sysrq_detect_reset_sequence(), where ++reset_seq_cnt matches reset_seq_len
and sysrq_handle_reset_request() runs; sysrq_reset_downtime_ms defaults to
0, so sysrq_do_reset() calls orderly_reboot() straight away.  Writing the
parameter needs root and the key has to be the first one of the new
sequence, but an administrator who presses that key while reconfiguring
the sequence reboots the machine.

Today this needs a device that has not parsed a sequence yet, because
reset_seq_len only ever grows.  The next patch resets it on every reparse,
which without this one would expose every device.

Parse the whole parameter in one callback and replace the sequence under
a seqlock.  The reader copies it out under raw_seqcount_try_begin(), as
it runs from the input event path with interrupts disabled, and keeps
its current sequence if a writer got in the way.  It is a seqlock rather
than a bare seqcount because writers were not serialised either:
sysrq_of_get_keyreset_config() stores the sequence from the kernel.sysrq
sysctl without the module parameter lock.

Behaviour changes:
 - A key of 0 is rejected instead of silently ending the sequence there.
 - A write that fails partway keeps the previous sequence.
 - An element longer than seven characters, such as a zero-padded hex
   value, is rejected.

Fixes: 154b7a489a5b ("Input: sysrq - allow specifying alternate reset sequence")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/tty/sysrq.c | 133 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 99 insertions(+), 34 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b496..f9d63b45f859 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -39,6 +39,7 @@
 #include <linux/writeback.h>
 #include <linux/swap.h>
 #include <linux/spinlock.h>
+#include <linux/seqlock.h>
 #include <linux/vt_kern.h>
 #include <linux/workqueue.h>
 #include <linux/hrtimer.h>
@@ -675,39 +676,68 @@ struct sysrq_state {
 	unsigned long reset_keybit[BITS_TO_LONGS(KEY_CNT)];
 	int reset_seq_len;
 	int reset_seq_cnt;
-	int reset_seq_version;
+	unsigned int reset_seq_version;
 	struct timer_list keyreset_timer;
 };
 
 #define SYSRQ_KEY_RESET_MAX	20 /* Should be plenty */
 static unsigned short sysrq_reset_seq[SYSRQ_KEY_RESET_MAX];
 static unsigned int sysrq_reset_seq_len;
-static unsigned int sysrq_reset_seq_version = 1;
+static DEFINE_SEQLOCK(sysrq_reset_seq_lock);
+
+/*
+ * Replace the sequence in one go.  The seqlock serialises writers against
+ * each other and lets sysrq_parse_reset_sequence() tell a complete
+ * sequence from one that is being replaced.
+ */
+static void sysrq_publish_reset_seq(const unsigned short *keys,
+				    unsigned int len)
+{
+	write_seqlock(&sysrq_reset_seq_lock);
+	memcpy(sysrq_reset_seq, keys, len * sizeof(*keys));
+	sysrq_reset_seq_len = len;
+	write_sequnlock(&sysrq_reset_seq_lock);
+}
 
 static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 {
-	int i;
-	unsigned short key;
+	unsigned short keys[SYSRQ_KEY_RESET_MAX];
+	unsigned int seq, len, i;
 
-	state->reset_seq_cnt = 0;
+	/*
+	 * This runs from the input event path with interrupts disabled, so
+	 * it must not wait for a writer.  If one is active, or finishes
+	 * while the copy is being made, keep the sequence the device
+	 * already has and try again on the next key event.
+	 */
+	if (!raw_seqcount_try_begin(&sysrq_reset_seq_lock.seqcount, seq))
+		return;
 
-	for (i = 0; i < sysrq_reset_seq_len; i++) {
-		key = sysrq_reset_seq[i];
+	if (state->reset_seq_version == seq)
+		return;
 
-		if (key == KEY_RESERVED || key > KEY_MAX)
-			break;
+	len = sysrq_reset_seq_len;
+	if (len > SYSRQ_KEY_RESET_MAX)
+		return;
+	memcpy(keys, sysrq_reset_seq, len * sizeof(keys[0]));
 
-		__set_bit(key, state->reset_keybit);
+	if (read_seqcount_retry(&sysrq_reset_seq_lock.seqcount, seq))
+		return;
+
+	state->reset_seq_cnt = 0;
+
+	for (i = 0; i < len; i++) {
+		__set_bit(keys[i], state->reset_keybit);
 		state->reset_seq_len++;
 
-		if (test_bit(key, state->key_down))
+		if (test_bit(keys[i], state->key_down))
 			state->reset_seq_cnt++;
 	}
 
 	/* Disable reset until old keys are not released */
 	state->reset_canceled = state->reset_seq_cnt != 0;
 
-	state->reset_seq_version = sysrq_reset_seq_version;
+	state->reset_seq_version = seq;
 }
 
 static void sysrq_do_reset(struct timer_list *t)
@@ -768,6 +798,8 @@ static void sysrq_detect_reset_sequence(struct sysrq_state *state,
 #ifdef CONFIG_OF
 static void sysrq_of_get_keyreset_config(void)
 {
+	unsigned short keys[SYSRQ_KEY_RESET_MAX];
+	unsigned int len = 0;
 	u32 key;
 	struct device_node *np;
 
@@ -777,17 +809,16 @@ static void sysrq_of_get_keyreset_config(void)
 		return;
 	}
 
-	/* Reset in case a __weak definition was present */
-	sysrq_reset_seq_len = 0;
-
 	of_property_for_each_u32(np, "keyset", key) {
 		if (key == KEY_RESERVED || key > KEY_MAX ||
-		    sysrq_reset_seq_len == SYSRQ_KEY_RESET_MAX)
+		    len == SYSRQ_KEY_RESET_MAX)
 			break;
 
-		sysrq_reset_seq[sysrq_reset_seq_len++] = (unsigned short)key;
+		keys[len++] = (unsigned short)key;
 	}
 
+	sysrq_publish_reset_seq(keys, len);
+
 	/* Get reset timeout if any. */
 	of_property_read_u32(np, "timeout-ms", &sysrq_reset_downtime_ms);
 
@@ -903,8 +934,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		/*
 		 * See if reset sequence has changed since the last time.
 		 */
-		if (sysrq->reset_seq_version != sysrq_reset_seq_version)
-			sysrq_parse_reset_sequence(sysrq);
+		sysrq_parse_reset_sequence(sysrq);
 
 		/*
 		 * If we are not suppressing key presses keep track of
@@ -1055,36 +1085,71 @@ static inline void sysrq_unregister_handler(void)
 static int sysrq_reset_seq_param_set(const char *buffer,
 				     const struct kernel_param *kp)
 {
-	unsigned long val;
-	int error;
+	unsigned short keys[SYSRQ_KEY_RESET_MAX];
+	unsigned int len = 0;
+	const char *pos = buffer;
+
+	for (;;) {
+		const char *end = strchrnul(pos, ',');
+		size_t n = end - pos;
+		char token[8];
+		u16 key;
 
-	error = kstrtoul(buffer, 0, &val);
-	if (error < 0)
-		return error;
+		if (len == SYSRQ_KEY_RESET_MAX || !n || n >= sizeof(token))
+			return -EINVAL;
 
-	if (val > KEY_MAX)
-		return -EINVAL;
+		memcpy(token, pos, n);
+		token[n] = '\0';
 
-	*((unsigned short *)kp->arg) = val;
-	sysrq_reset_seq_version++;
+		if (kstrtou16(token, 0, &key) || key == KEY_RESERVED ||
+		    key > KEY_MAX)
+			return -EINVAL;
+
+		keys[len++] = key;
+
+		if (!*end)
+			break;
+		pos = end + 1;
+	}
+
+	sysrq_publish_reset_seq(keys, len);
 
 	return 0;
 }
 
+static int sysrq_reset_seq_param_get(char *buffer,
+				     const struct kernel_param *kp)
+{
+	unsigned short keys[SYSRQ_KEY_RESET_MAX];
+	unsigned int seq, len, i;
+	int off = 0;
+
+	do {
+		seq = read_seqbegin(&sysrq_reset_seq_lock);
+		len = sysrq_reset_seq_len;
+		memcpy(keys, sysrq_reset_seq, len * sizeof(keys[0]));
+	} while (read_seqretry(&sysrq_reset_seq_lock, seq));
+
+	if (!len)
+		return 0;
+
+	for (i = 0; i < len; i++)
+		off += scnprintf(buffer + off, PAGE_SIZE - off, "%s%hu",
+				 i ? "," : "", keys[i]);
+
+	return off + scnprintf(buffer + off, PAGE_SIZE - off, "\n");
+}
+
 static const struct kernel_param_ops param_ops_sysrq_reset_seq = {
-	.get	= param_get_ushort,
+	.get	= sysrq_reset_seq_param_get,
 	.set	= sysrq_reset_seq_param_set,
 };
 
-#define param_check_sysrq_reset_seq(name, p)	\
-	__param_check(name, p, unsigned short)
-
 /*
  * not really modular, but the easiest way to keep compat with existing
  * bootargs behaviour is to continue using module_param here.
  */
-module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
-			 &sysrq_reset_seq_len, 0644);
+module_param_cb(reset_seq, &param_ops_sysrq_reset_seq, NULL, 0644);
 
 module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
 
-- 
2.43.0

