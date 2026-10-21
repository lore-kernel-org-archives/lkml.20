Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549226;
	b=MR/Wbn6KK0cGqgYQwHKCITP1gTgVtpRMZaSLQOETzcK+F07XSBmhEd9atI5uqu5+HP+h
	 hrbsL4ozvCW8I7FlAF+nDiU/MXjLCQZ+CHPve5wXJoRypiYgDg48tOMnPxvOanIu07nCz
	 BoBJOj1I0VjtK+d+zYDG+dX2jDn1153ZXh7/ZuRXW8VjOpKOnxdFsgFBlDuX4svbKi8d8
	 JrSC7y4mc2zy+Cs3TyBQdt3q2g3W2S9imZ/eQDluBAAeeFsE13QrnNP2+/0HPPDkBQHso
	 E8GhxyNBztDpALdDI2KqR9quh26frtpMI7JMZ5pFg9BQBhVup2pHMzwU86m2m6z5v3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yos1+3QwUjrDuAOazo5OswZ8Efjv4lBkArOWfigb8n8=;
	b=rlafi0rgRmB52iX2zkZ+JoKmu07QqidPZ15wZCiyhC/iaqUGghVJdYloS0owRX05s+ic
	 QzZ4ijjlxH9+rN1oJwkwpv8hWBwBQBEIh7sDNG24D64mk381McfX/mgBzBrO0NyjQk24a
	 zDtXQmAEpqk0p29YI4CaFhjRKRbybpoZ6ZCOYhCxzQMksgHtcZ8tm0ZWcoS+bLh7MGT1X
	 F8JN++Oas1VU4pONxr5bNytiO+mUMDzjFHHyqk1RGz2XzFroOaoRNkdsPXUGEZ7OE2iLR
	 Oj/GQVEaKorPQA2R5pWIFiqq/ccujCrq93593ARBlYluvrVgfNANQlUFHEwThKm0BXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtGhLxtH;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92EA606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92EA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtGhLxtH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab98332238so167202a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792549225; x=1793154025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yos1+3QwUjrDuAOazo5OswZ8Efjv4lBkArOWfigb8n8=;
        b=mtGhLxtHMUFPemGwSfIV1NL33M11RBxtFzcOHulj34SabBPdQXFIALEwlXrhDDBP8u
         SmWPgpNEZvGL2uAl6a9uximQp88MOK+j7A6fgv/JTIlKjeqWOx6anRdd6W+gJmKXzjuw
         Mo8ZiDgqmL8mnRwim9BkDtjYYqHZGIfpQFdyvLzpltu7NTI9ZspJYEfDo4qHmUsV0Xz9
         YFpEAPLXHs/smb6KgefJ+d1RqZsbjE5FgqPmvQYZZy8sd7FoG9JIw5vr0mg+CQ794E5K
         1uDci0Z7HcQ1JCKajfyvtQFLA+LoqqE64VfRe3WBh38z8U88pwWvSrZoOnPoyW7vKE/o
         hmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549225; x=1793154025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yos1+3QwUjrDuAOazo5OswZ8Efjv4lBkArOWfigb8n8=;
        b=x6ZhewIYP9Re1Yz98Kp92+BI6XMODlIfS3zkQpKEd2kz22b7w0Um45vAU5CtQe1Kel
         ALie29EImxaQN0I+LorFb6h0hAQq0Z4l8TfyDqVU3muibxiGi7NR/Cq2mFmxAI4gGiSc
         EP3Mg1ydukj0FPQh9WPE9l0UYdT/De+0KEsUM2J/4QlowyQnXwoZaH0MrVG9jgi3AJ8Z
         sgAnbtUQVMKgLc7wuBDcYJlRpCpIbb8hpc1/xs7I0vzw+Qmt0kbnoQPbQVWBWEshMvQZ
         mCCDWnhJdyILC/+Rpqb/vUpGoyceFwh7UJACufA5O4psGf/EhTVNabFunR7ll6OwzNzf
         5GvA==
X-Forwarded-Encrypted: i=1; AKwUvBwioOakDbtxl9fo7c1sHg46jF0CPfHelwnsAxESWdgQl0P+xf8a0Ofsa9ydNlt2rwGIXRlaoBZi1z/3ycQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsHS9AfYFOG38jBDZRLEnT8vvEpuTuEPzCSPQvqyVbN8iazq1+
	pPa8cGWzcLrFSyJZgqu8/ZlwLHGQJVLyLg8TvWVPVIlXxAcA8+GZS2rA
X-Gm-Gg: AYBFou20+x/rSuQX3swi8t686r59WX6SYUK8AeyoU7Eaj432CRDI7dKXrKzm+5WSJMT
	1rUMj5ZRhrSgtyWujIYDVFkqTmOAvkxR/kHIRmSLcFLmFZOt0YpVo+wwso7aXfpeg4UjIoDMvIc
	jvcZp0nJz65+JuZ77EUnWBdEy/xDXw6C6uayGhL6wUXkDpUH4l949t371oO3N2J32k1HmpQtkph
	CBFCwKQagmyrMXZDW/wfcDteLkZsGvP7QNZVRo3b5rC4nGLaFpJTveRIgAO6IPm+Hk0z9rrzSpQ
	+GZ51vp6YkI+oMDyh6OT2N+1lvutEfCKHWBxW1+3A8v4lTiBbBOaU1vMnGxBoCovhSU7D1kqBVj
	kRexJodf3xdnESRXB81uSVuUUfMn4q6kMnzBB9th9DQH/G+7VvTmGnel/849vrGbZwVDOfkxLJ7
	bFdtHlgMD6H44bexYcwpgjrCLx4bmbfW3a/Gc5S20CJG/mbexjRQmDcL9DGFI3UN9ojnbsVebdY
	sIYYciylnsHr2symsRWWatHTFcLyCQ2tbd/a1b15sMck6FwPR0/KaabvAeh21adSxVdKqKm
X-Received: by 2002:a17:90b:39ac:b0:3ad:85fd:711c with SMTP id 98e67ed59e1d1-3ad86ce82a7mr635334a91.28.1792549225142;
        Tue, 20 Oct 2026 19:20:25 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802917c3sm1979077a91.7.2026.10.20.19.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:20:24 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] tty: sysrq: reset the per-device key state when reparsing reset_seq
Date: Wed, 21 Oct 2026 10:20:07 +0800
Message-ID: <20261021022007.1717207-3-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022007.1717207-1-zhanxusheng1024@gmail.com>
References: <20261021022007.1717207-1-zhanxusheng1024@gmail.com>
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
union of the old and the new sequence.  Holding just 59 and 60 counts two
of five and does nothing, while releasing a stale key drives
reset_seq_cnt below zero.

Clear both along with reset_seq_cnt.  Also delete keyreset_timer: with
sysrq_downtime_ms set, holding a full sequence arms it, and it is only
deleted on a press outside the sequence or a release inside it.  Dropping
the old keys from reset_keybit removes both of those cancellations, so an
already armed reset would survive into orderly_reboot().

Fixes: 154b7a489a5b ("Input: sysrq - allow specifying alternate reset sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/tty/sysrq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 4fd5b3ace9c40..bb202fc1ccf0b 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -691,6 +691,15 @@ static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 	int i;
 	unsigned short key;
 
+	/*
+	 * An armed reset belongs to the sequence being replaced: once the
+	 * old keys are gone from reset_keybit their release no longer
+	 * cancels it.
+	 */
+	timer_delete(&state->keyreset_timer);
+
+	bitmap_zero(state->reset_keybit, KEY_CNT);
+	state->reset_seq_len = 0;
 	state->reset_seq_cnt = 0;
 
 	for (i = 0; i < len; i++) {
-- 
2.43.0

