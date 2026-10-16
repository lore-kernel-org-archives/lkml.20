Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5A36C0C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121263; cv=none; b=XFihYjOZF7tyMOrcOtZWIjzSWEcGbunDEsGQU5TisVnCZ2hyGCTMtEDkkGrVOzaplUHoz9DpmoEQL73dvby0zdZZdqBjHBe3qVcMfNrtpFMT4uloGQzIL3n73v+mCkDY346e/mpy8PrPLJBvLrNYLW63cphytDS6YAekuLlN4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121263; c=relaxed/simple;
	bh=+7Xk2sw3Wtz36aZj8CThZvU+Fd3CpGSJQ58bpbKZg1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbPL2mGGBIdhPogFbJz1/MA6iQqMbxZGl/XqOO4Z0Dmn3HFUcJkBHU4uZwXI5bN29VP+La6a8p8XYoW2VBYMpBL/mQaqV/0pkDqCrctWUlREwM8uS3ygmM3VTfUYFYrQH9+Rc9CJkxQxmip0X7roVjBqYA35dIGQ2Bw388c8kXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcFjEjvm; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcFjEjvm"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so14299316eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121260; x=1792726060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YZBaOUFYzuTeMdOIpOPEVgHo9o2UPoUqPPnpI8qbJg=;
        b=bcFjEjvmTlR3vgr7JYTLAPQy6Csds9L/ke+l8on1BeaVNh5B+znN4NS6J5TkmAsHZl
         b3fJnxXgbk7HCbUE24oeh10d6HNSTslU316C2qxvv9wVKtWzsRxGflXjFOWpjT6Ek1E3
         l18ud/2sb2XnQkK5FMdb7kukfpa3gTIbqsTOUdzRfeI5S7X0SSPaS6o7mzbEuRdmOgkp
         id1Og+UEmWzmoGEfZ9tO2Z3TdCb9eg7JaQ1rA2Kj8aTH73qB99rlkAkJNZfcCxgELGE1
         EQTivvT029+paOjYahtKzoghOZ28CXjC7RjosqoztSOPiYGNMTjoTue/Z6k9lAw9Vj2h
         gx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121260; x=1792726060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YZBaOUFYzuTeMdOIpOPEVgHo9o2UPoUqPPnpI8qbJg=;
        b=ikpgYxRg+ufhuKh/1kayZOHyApKO3hN85Gjlz8ZiCJ3RTQ28v3LRBJI0wFYrvvagH5
         kDMcPuYTw2wTFZiNZeXbXcV94v2klomMJrSuKw//ejCVTei+aP53dISYySxoSc9o9Spm
         BYYMBpJQbn6CTHGrL8a2gZafvLGpdRnnXSje+qmG/15nzYU/A7hUUVrwAU1y0eN+r6ln
         pMFmszudg2SFWPvj61cDp6LwdjFKuNdKaFee/vrX8dch2LsmIhCtWGPPZ9EAGgoGCHp9
         3WgXB1BTW00tCf6D3JNywDpF3C8C+AbgCIHuyDtmsXdEFRi2viWe/LC5WsykHgzn1F15
         ElkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzshIqq9knDWTxd39Hp1QB/Zk63ZKIQZ4e1Zrf7VaGW3+2zrnSCHgqFeRk/4lPhTzu2iXNr4fOt9TQzyag=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDnZNUwwd7uFYkrWOm7i6vpBRND+EwlIrmtTmFfrTmD589C7Vx
	J9ZSFMaRDxiEwBsxgIMTS8+oO/pVF+xuTnwIWN9NG0nt2p6X3RnmLtxY
X-Gm-Gg: AYBFou0RtzMVKjsLs9nOy7Rjb9O5DCfygfXcauiMNhmmCe5eAOcmKsrtZ4BF2DVUSpO
	K1/ays4tl0HruFByo95JTtavFbL+7Mjq4ZVNUVuAktwu6UpahYIbtfmLzdVuSis7qqeCcg4yJIs
	/IWVm0dHRB97i3u8knlKqyTwunpurB2TkdX32SY9/inAZW/4yOoNmmTH8/uk4y4uaN3CM+Y5fGd
	qghVDL5SetSZp/mw2azfgX+aMvuS9M7q8714O3zVbuqeVeGHiSwDmVH/MVTjoPV7P7EOcfgAwkP
	jkQVdC+4yoqY1HgztX6Ib03LUHPqcHVD5zRFndY+oyfOb6Mfvh/vVwMwATbd6yinpklCu/JQcTv
	52V0rkUnEHCX9MUmfg8og9HczHVWncuIv0nt56hOGiHSpZqeA4cZMpK2/WZl75kQAufC5qhBIn8
	RIGhM+UzADtVBjQlLvU09grFWDjVP0VUQEItvElVlbIfQeMJUNqsA7MNDXXc1q+9U2KlCUH1jJt
	l97I75CiV8=
X-Received: by 2002:a05:7300:828a:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3537dedaa87mr26823702eec.4.1792121260463;
        Thu, 15 Oct 2026 20:27:40 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm2617092eec.20.2026.10.15.20.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:27:39 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] Input: sysrq - reset the per-device key state when reparsing reset_seq
Date: Fri, 16 Oct 2026 11:27:32 +0800
Message-ID: <20261016032732.2328852-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysrq_parse_reset_sequence() rebuilds a device's view of the reset
sequence, but only clears reset_seq_cnt.  reset_keybit is only ever
__set_bit() and reset_seq_len is only ever incremented, and nothing else
in the file clears either.  The struct sysrq_state holding them is
allocated once per input device in sysrq_connect() and lives until the
device goes away, so both accumulate across calls.

The function is called from sysrq_filter() whenever
sysrq_reset_seq_version has moved on, which happens when the reset_seq
module parameter is written.  It is mode 0644, so this is reachable at
runtime:

  # echo 56,29,111 > /sys/module/sysrq/parameters/reset_seq
  # echo 59,60     > /sys/module/sysrq/parameters/reset_seq

After the second write reset_seq_len is 5 rather than 2, and
reset_keybit has five keys set rather than two.  The trigger in
sysrq_detect_reset_sequence() is

	if (++state->reset_seq_cnt == state->reset_seq_len &&
	    !state->reset_canceled)

and reset_seq_cnt cannot exceed the number of keys actually in the
sequence, so holding the whole new sequence no longer resets the machine.
The stale bits also make keys that were dropped from the sequence still
test positive, so pressing one takes the increment path instead of
cancelling, and releasing one decrements reset_seq_cnt, which can take it
negative.

The boot path is not affected: both the command line and
sysrq_of_get_keyreset_config() leave sysrq_reset_seq_version at its
initial 1, so a freshly kzalloc'd state parses exactly once with both
fields already zero.

Clear them along with reset_seq_cnt.

Note the error direction is towards not resetting, as reset_seq_len only
grows, so this costs an emergency reset on systems that reconfigure the
sequence rather than causing an unwanted one.

Fixes: 154b7a489a5b ("Input: sysrq - allow specifying alternate reset sequence")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/tty/sysrq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index c2e4b31b699aa..d28a4726b07fc 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -689,6 +689,8 @@ static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 	int i;
 	unsigned short key;
 
+	bitmap_zero(state->reset_keybit, KEY_CNT);
+	state->reset_seq_len = 0;
 	state->reset_seq_cnt = 0;
 
 	for (i = 0; i < sysrq_reset_seq_len; i++) {

base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0

