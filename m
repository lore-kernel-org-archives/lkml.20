Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336346;
	b=rdNLBI4Oz/bZNcxip95685cIIuGAINQn8GzL3RdJ+JEOjp5q3k9A1W50Ykae+45dm/D3
	 FGbeB70p/mavW0yHC/4wYJmIPc/M8YqGFVYoibV+wClxhmHzE4ZhL5prqBkY0j8lQeQ1i
	 au67aqVqbOUY6bqKnX97hVKaCeTFDbl/IGjU69dbrP/SU3sTmjdyiCBi59WaPxmP+hPlE
	 TRNtKYnddyKeQYaJq04fZoV7PtYGS0NsABeQBPZlIKCNG10Cts3RFDohMwjnI/6WEM4Lq
	 UzqIaQQ+sE+i4d84N9P/XLVdVS/SSsdqDzjQDCoy1Jh5BqHSxkHTwx0o+s1VZ545E4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZG6bOylgszrN/sJI6CN0hf+3k0g0lKx6/Z4LrJV7mls=;
	b=MIAv1k+lSnAo9ijEMQUxrG4LJNpMDDH6vAD3xE3r2umRpUKww+xjt+7BvMl7RFp6Czeu
	 fvjSiXRaC7iH47tE+nIDKq5LkkilydK56E+rJ9PJhiDkJ6ovCuHt2emaU/0U/nD6a6o5y
	 h2yk9TK1yjuKzfihTCNEQZk2ISrDksKLm+kCbDGa45xhCmpO+aTSeLpa1gCpVcRMbUbff
	 DkBMo8WhmfwKHhR7+p3rj8bDFmqELOLpCecMi58K/CIblMDd9HGnIFd+qA+1oLuu9rYoy
	 pmYTs6cDD2HisQ5FifqGF0YakMEm4uJPrabHJKPDPKUMdAMQoI4cvFAeUG4uiEk9aTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INJciFkO;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D4606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682D4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INJciFkO
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14fc585291cso217777c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336345; x=1793941145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG6bOylgszrN/sJI6CN0hf+3k0g0lKx6/Z4LrJV7mls=;
        b=INJciFkO5H4hqxAW1C8mpRHp4hDDtq7RkjC5vXmOhsNlIuw+a0RMGZM9XGyipAUsTW
         ATnG2Dk1f2JsvFd8IP6t2cJCX/VhUr4nCzvtzk3wWcbY0Q+J4frKLqZ3+8iu/G0WmRKP
         1gcbVTuarCESI+T4zZc7MYR2T+0w7j5hKiOct8mP1/1iQ2O0hWsxt8oSm3RBIqkWq/bZ
         LdSDAT0VOOA7KVckxMp97EGXiLoJimw7j2zFqbjkLBXHq1qTGPVLLZLQlIg4zL8ktsi3
         oD/m8exNW230TXd+83r6hGVK7UnSI47YxcgrucWrvX+MfhDvemFic6ll9P7et6/nQtNM
         gHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336345; x=1793941145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZG6bOylgszrN/sJI6CN0hf+3k0g0lKx6/Z4LrJV7mls=;
        b=e0esKN1WPwpTXKRHdpCrIV4yaHlFHZqmpdD6cXk730xvpns0kJm4gOrGps6bpVs/xX
         /1fS4TXT5i84awixL5LUA2TzRkbtbGJeoq5BZPST0cH3gvVDuSdeg7w4rCnynJQJ38By
         0h+af/NEtUGPTZ72fj/xRT5o/5z2S8/C7ItHb8sSGF5BC/a54ssWJ73EyIULFNLncV7z
         fecW1v/X6UBJrY/slU63VyvrDY6NM8fiqGYUinRron1haNzkSFJVzwZjt7W2nhiHuYYa
         /fzoZOy2jua2MJUi7mMwQmh3jmlDVIGibYKubXHCyb3t6gyE6GKXf8bY8DxZC/WR+/hH
         Cx/w==
X-Forwarded-Encrypted: i=1; AKwUvByipA6mTBwSERx3ClknWSNLxc0yloei2oZ/Xn16dMuuTYx2wqDWtsFQdT7Jw2nLRxT/IosaHh5dQ4Cdsrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkMOUVWrWQ/5C5b6pvyk7J+rSGUpQr4aVZ1t2P/r2okNdbsh+F
	4g6n+j/RTk8T2Ydg1tLpLFG/D2bUURdPJsE3tq5N4d+VZTI32Pcm8II/
X-Gm-Gg: AYBFou1FFYF/XJPYXxrenvqtDV4OS0Q08gfqhzPlzDrqkFLj9Ogx6s5nRfRUYYYR6M8
	lIqBBO30AOF3i76UbGL3+gkelt8QBStISMJ1bLApGX6CljAjg5cmBPutS/KI2+JlKbRODza/C30
	+Kwnhdr9q/tVzzrNjW/+VKf1aui5MMENYXHVc9rL4toUa4NEWEDHbtad6iUWErM2/Nz36eVbCd4
	N0V1C/fzdMP1At/3MpNR9ovq4Dv2Cv3QYuG1jcsGqQKuPK15PGl8RCJ1NDFW8UZI0yYgrzHIrNQ
	lF0S4OiU0FbXSwkvClPFV9aSpSCFSdYsYl6Qsnm9RUhWmi4KgaFaYlR00HZtT0dBxbnFye4cv5S
	ihK9Mg8AYX/q1pGpmHdlhyGl/lkYFQ/F/zfMhphcSwFf5zq+R0c6QK1MMMHli9WLw0j3IovvHHY
	ZC7RR0LDPyK33bOTZcX2mvCqUSkPsUTGDU+43gKy2+QQPLQ24OVsDP/iNkgzMzTGqJrHFduCmKq
	jKARwCB8F1hI8gAzYHHmxAM9r0io1FubSXny+05tgvOOIC/t5uflPiKNPhEsgmiigikar+3MNxn
	5uNXWwELY8EtJQ+r62x5viadYM5oJ78N0bNtV3UjbFiXgw==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr1974923c88.45.1793336345453;
        Thu, 29 Oct 2026 21:59:05 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm3433152c88.8.2026.10.29.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:59:04 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v4 2/2] tty: sysrq: reset the per-device key state when reparsing reset_seq
Date: Fri, 30 Oct 2026 12:58:54 +0800
Message-ID: <20261030045854.153556-3-zhanxusheng1024@gmail.com>
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

sysrq_parse_reset_sequence() clears reset_seq_cnt, but reset_keybit is
only ever __set_bit() and reset_seq_len only ever incremented.  struct
sysrq_state is allocated once per input device in sysrq_connect() and
lives until the device goes away, so both accumulate every time the
sequence is reparsed, which happens whenever the mode 0644 reset_seq
parameter is written.

After writing 56,29,111 and then 59,60 a device keeps all five keys in
reset_keybit with reset_seq_len 5, so the effective combination is the
union of the old and the new sequence: holding just 59 and 60 counts two
of five and does nothing.  Releasing one of the three stale keys takes the
key-release path, because the key still tests positive in reset_keybit, so
reset_seq_cnt is decremented for a key that was never counted and goes
negative.  From there ++reset_seq_cnt has to climb back through zero
before it can match reset_seq_len, so the emergency reset cannot be
triggered until reset_seq is written again or the device reconnects.

Rebuild both from the sequence that was just read.  Also delete
keyreset_timer: with sysrq_downtime_ms set, holding a full sequence arms
it, and it is only deleted on a press outside the sequence or a release
inside it.  Dropping the old keys from reset_keybit removes both of those
cancellations, so an already armed reset would otherwise survive into
orderly_reboot().

This depends on the previous patch.  Clearing reset_seq_len turns what
used to be a stale superset of the old and the new keys into a real
truncation, so without the sequence being published in one step the
single-keypress reboot described there would reach every device rather
than only those that have never parsed a sequence.

Fixes: 154b7a489a5b ("Input: sysrq - allow specifying alternate reset sequence")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/tty/sysrq.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f9d63b45f859..00cea2f315c3 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -724,11 +724,18 @@ static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 	if (read_seqcount_retry(&sysrq_reset_seq_lock.seqcount, seq))
 		return;
 
+	/*
+	 * An armed reset belongs to the sequence being replaced: once the old
+	 * keys are gone from reset_keybit their release no longer cancels it.
+	 */
+	timer_delete(&state->keyreset_timer);
+
+	bitmap_zero(state->reset_keybit, KEY_CNT);
+	state->reset_seq_len = len;
 	state->reset_seq_cnt = 0;
 
 	for (i = 0; i < len; i++) {
 		__set_bit(keys[i], state->reset_keybit);
-		state->reset_seq_len++;
 
 		if (test_bit(keys[i], state->key_down))
 			state->reset_seq_cnt++;
-- 
2.43.0

