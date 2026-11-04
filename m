Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826542;
	b=QZONhOLjaci7vKeH2obbZQ0xAIJHcnkz56YupugRW+Lf7qNM32qtVsD/PX/QS8RrfudL
	 gNJeRZmOQIHQH/rd7la4n0LJtgCILkqBqdwBgprbt+dPTMsioyDxvdyjxSsg0NGt48F6z
	 q3ptK2hPOZpi4DAwdL4PhV/SCetSoq1BhrPzZ/7Q0dNo8ZPCDVrg+TrKAenA/gR/mVLJG
	 J+SpS1PrO6f7UgWj8aQdubwEESD0xTQVAN1H2ezet0LYgpFzusRGrabFaU42bYPDKSIDI
	 VnmO13oXulxdsVMLptLZWW73OAdBodPUVBk6g7PjdrNJeQJS7ERAtl51HKPNCyYiemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
	b=bsnrQjnYcmnZLUCQa3HarscNlw7aFngxTgBHsMNTak58eIJZod6IZve1/kgp4ml2spWa
	 Oj7sXc6jmIKwmLc5Q5Ft6UUX5uySyLsBe2uucp/7xz9+ukhovTXREwJ8+2YEHEUpmfVvy
	 tRggR8WMOKll5COLCW8AA4E9o7Du7dCqfSGceCSZd9NFYU2UwpaZwY8/yXTjktA40xldd
	 VwqeLadqtgeUaQTebbPgVxIL3Oh2CtN11p2K1IYuobf7haQc/EWU1VBp686Y3cVNPtSv0
	 nxiiNpZMcWRtURRO7rbvj8JZzKYM1FI1KVUl4EbbjM1fYr31hpY9jCRurKiZ4LFqVKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPN1gvko;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2451607E725
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2451607E725
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPN1gvko
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so9531885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826540; x=1794431340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
        b=BPN1gvko6GfLQrNWXzFw85BLDKdxLt0yjJ41u3wB5mR5jACBa+/7D6SRxEModQ2grs
         BcWDDFnHzx469RGOfSk1f5F9VieTbJCA2rMTDw5TDsuirul0VEfo4xI2KViHy9lsDr55
         UM/mt65se7j5ld6tdYW6B7hmBQOpZAbKm67fXmgtIqIJ70jMVvMR6mMpfCUTr1PLXvaG
         QJkWN0+rLUVbWOC19DWk61+MadS/Vxx3ImXwljaFLnQ8Xk9Vcxx8oYa09WyR8kTELJbP
         60xjM88t+E7r2Ceuu4ODsC9pntz3mfF1ndTqrkDM487cve1arzYdDvbG5x5ulvWVGCEL
         eikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826540; x=1794431340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
        b=hCyz61aElQXk3U7W/o/MjKFvMDoH4zyvIU35HMpSLl+oVTd81vdELLROgAbp4q0Nfq
         HEoZf4b4Xmrnb1zL4/WG4bNhDq5/qZsW3KgMEtotyH5yaH8A8V29AQ5mYSYby/H4bFds
         t7+rG5YMlXULMTv714e5HBRIrweHfsOINr1B44RRWncVoXayn8J5V89HaBdUQjswhK86
         OTCdPjWOFI+dotNj9mZZN1P5hKZA9xzMjSkikb9Rz9b55GkyqIaD0hsUnQ3VCBpTApFv
         PBnh/MtcOac3U/IzWiGflIrXXe9/HAf4O6bpnUhAMp36Imoad2/eWvMaU7971IS7iocD
         NkxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuoaKKZuKK80KRyqlYDxJfY8bhQky0join3G2fxMp4RZofha1GwR+DD977doMGZpaZMr1uOy4nXKr+l1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aByIgC4X7XM+BfwhTFubHlnAwKQLg6dnUQFNAyD9+tBXM3jtI
	hUvG3zYraFsot5+3j7Y7BktQys8s4vvSrg03hraRxvua6mbw/TG7UF92
X-Gm-Gg: AYBFou2FBtz+TsVwZd8GEvUw6h/aJJ7TZgZs6J7QqeBw2nqeGLFg0n3fqBsrRhc/IxL
	jJsHQ771UeuMjbUQVVtVCFH78ar1m/R/xnOnhuGSmHrQoRrT0qs06lDRtKYE+i11YFGKIkUS3lK
	VbPzjkeMMzOX6AS27sYG1u5P510COZ5omIy2sMBHXOKn8w7p4FrCGII+MAMZLj2WLfdJcQCVQgg
	CtdDsYQGDxWhnipIXnloxEggM7IV+/0unRwl+8MERrIKXXK6U9x9u5FNQoFGmgPsAd9j/ClFoep
	pY4Pe6mSTIoqr3kXRJQpq9OjMWqjenvzTYojjNotxpnVdF+UjtnZMfAJ5Lm7ogHbNO4Ut7TPYe9
	v4ynipMlSz04/nVw5G1XBnklsww4WiHJz79czBYZpZYCY39AIBzt8Dqwqvzxv9+4JfNzPb1jWSw
	QwrgmQGkiLdYAYyI8Hqu/L3r5VZhEKdS6eI8K1RbH+K1v9i1RRYb7o+ngQDlCZ0gAJjGI2yQDU9
	KmJt0157y+Ns84oYEljhXf9uJY9jG17d/nLlrN53g0O12xjrb4Ou+PV1mjAft6V2q8QAJmCMDts
	jGFgnpOdwuVah2qyk8k5OUOuORpBKtxJdMLoAikVp0YpM4niismu2g==
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4ac17ffaf95mr390439375e9.18.1793826540343;
        Wed, 04 Nov 2026 13:09:00 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm78187495e9.0.2026.11.04.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:00 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:50 +0100
Subject: [PATCH v2 04/27] selftests/landlock: Zero-initialize the buffer in
 inconsistent_attr
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-4-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This buffer is passed to landlock_create_ruleset() a bit further down,
expecting an ENOMSG error.  This is only guaranteed when the buffer is
zero-initialized.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index 89c0d96607de..0bf8632b725f 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -25,7 +25,7 @@
 TEST(inconsistent_attr)
 {
 	const long page_size = sysconf(_SC_PAGESIZE);
-	char *const buf = malloc(page_size + 1);
+	char *const buf = calloc(1, page_size + 1);
 	struct landlock_ruleset_attr *const ruleset_attr = (void *)buf;
 
 	ASSERT_NE(NULL, buf);

-- 
2.56.0

