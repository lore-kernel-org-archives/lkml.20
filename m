Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826582;
	b=wb1yLI6JMCQisBokxfk6afUR2Q3X8NRm9FTinsq10jBJSk+QLnp949uKiwZIGkWBYE5o
	 kaj8kPe4eNQD149AonSaaDs6kabml5d0Thztx/hfio9jwfazflecAtEVEmnpO9RzSO14Z
	 twOGgSMLjVSgsY7Mp+CNQNV5FAQRPXNS5+qpiHgVfY0UtWerYb6VORQiJFRUYqTOYK/of
	 zizeXBVvW0fNUJs4xw/BcITWra6O4NXT3Gn+3s21CNEcTUACPSQtrmGdKIMOFzysuobey
	 yTMoTTVvOYH7IBgzqDPTDtpPUoVjKTp/pWE2ws5C3QN56C4LBxYWufrnGbmU9lP7Q+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
	b=Aq7r8sRPiaMAcp44sVLlCLtrY8921U/Zb+zckixrKZNgngvdFOncJMvoquSRcdD/0roh
	 7jAR4kuR708mBxwnJM7wh4LwWea0GmqA/adrbVGVr2i3cZGkMz8K6v7U6GIR+jZZc2gTY
	 4Zy/3H9Eb5UuMvcG6XmWPg95+zD836LjoyRwo9gXn8QenX3NvzOpyv0l6/kXfrIZ9Lhuz
	 4yJSeSziLwMYe9xZQlJclI0Vl8IGEqvwMsZ/wG5TLCxMlNuFNiY6lEAA3jfK0b5Y07/jB
	 dSxJwmtcizik1LBzgwPsocIV4r2baRTSZAHoR0Tx/Z21cwDzfme8e7pqpuY3DmuqGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLfxyyNn;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3263607F2B7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3263607F2B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLfxyyNn
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso815312f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826580; x=1794431380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
        b=MLfxyyNnEZcm5BNvBQl93qnqyelGby9KG1DmschMbVmDIbOW54mBF0Dkyzgm7I3hLG
         gOeX+pS5P1Iv9wi3WpVNIjLe0xoOtkzydwj59wN2x255Ea8oVvyJSmkGqNsEmVH4cfpw
         aMdQYaplGYqM/tHOEkiRPHKF2zCJPv9ex0HBmc6Y5LCioAEYXXzkN77/o1/EN1JUa2mE
         OjLbY4dlqZiv/f/6CENHFs8d3nXO9C9N2DKIebXsTOMIibxvHv8JmbUmAV4RS7X2s8JP
         LHT6qJG58btj+Pa+EVsCsDFQRsKkAwIBCSChwZOAsX9FYfRQ58RktUM1PM/KofiigjbC
         3gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826580; x=1794431380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
        b=BiQYm3USbswf9wtL5sV6mQf2WnQDV0PJWLpAKrDsakcf7RbL3ViO0qakWAzaigg4DW
         GsBd1E+suGHquptifKUq+GUMVg8lDR6j6WNhBBsUYcZP6whAmCwILQ1rf8yWY6Zp2SZM
         DNKkrazKqCmjpoKtgNmFwFyE6BebAhFf/r6GQ55GyIV97R44T0QAJj7vefVvNRkPeTvj
         KZf1HoX+XeOuonuH9fVy9SCr8TRe+hPY44gEm/+WqVgS4SMDY0pMIPHgaaVvhLwr+1xr
         szAwHOZhq5DNjW+qI6DsgMXQmQzB7SZqWlv6CgVgJANmF2mXyDU1/n8KSC9KmdMrnZuC
         jxKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9oaduJ2mB2KeNevOWKkmeqLBP38zjvwZqWNEGnVpvQDl13UiKhKX5ZNgnwxjq6E4emaz68Y/lyt4P2do=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+ThhMcpXb7/KcndcDb5j/8972Th3feQUbPp1ag1a4LNiQk1y1
	AeJdgv+dOPjrIRNY+kDXbO+9u6MTs8tnuDke7idqJUGA+K+Z/5BFaFae+78Mvht2
X-Gm-Gg: AYBFou3afw/B4PpeMWp5BNDiS5RIyN5csZg5ZhqN6GIAcwpqg6cI7IRvK56AcLjd+xJ
	999Zk5Kv0h7Mg6zXQfXzuoZa47cd8J2nSRS1o3psy+FJLdm2uv/00rVF/nJW7kd7uKbyEJ6PFMy
	uD+I9Kk/fnVb5ah34s+grE3Q4SMV5TC6WjK0g4wKTqvxzkOQGrzYcQpfD5ZLALnsokgBBHaj1a8
	DFgaopRB9VnPDZ/jcO0GzyEkPYfmvh6WNJf/JDRhzjCex5ai+8Y+5OKEZkZCE9AVadSoP9uhVZq
	63ZNz9dTQiqxQUDFJB0VLUe6i2S4ab4kkZgOOuZPuhqf+hSn5dLl1WS1uKkIcQmkGPQCNP1T1l9
	myRa81KkeB8m11ze+hjZfTZJSiGdvcVZmhWwv3AkOwF7F92MsVpq1T1RBi+HbnsGVWJfQbPDo73
	zYWBK4Zald+PoUE9F+wkVrOtd0E0+KumF7kNtAd5Th4Csyc7MZzo+mtBWYNTwXY6qFIeUPHcasG
	IAkxmuWtfrzS2yTIOec/15m5UNdahnA9G8ANlrA744JGG6nB+TH5sI4b4zQNVQA/I+m0AUuw5U7
	OfByHPlB4uVXOA/fP1sks1Qa3ZA434XRQBoUUtKC6y11NVtZ1iHE6z0=
X-Received: by 2002:a5d:59ca:0:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-48fbcf02289mr9041398f8f.13.1793826580198;
        Wed, 04 Nov 2026 13:09:40 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm5568567f8f.52.2026.11.04.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:40 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:06 +0100
Subject: [PATCH v2 20/27] selftests/landlock: Fix the snprintf() error
 check in matches_log_fs_extra()
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
Message-Id: <20261104-selftests-refactor-v2-20-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

By storing the snprintf result in a size_t, the chunk_len < 0 check
could never be true.  Store it in an int instead, matching the return
type of snprintf().

Fixes: 316d06b01130 ("selftests/landlock: Add audit tests for filesystem")
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 10a386a573dd..1e94a3171e02 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7449,7 +7449,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 				     (extra ? strlen(extra) : 0) + 1;
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
-	size_t chunk_len;
+	int chunk_len;
 	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,

-- 
2.56.0

