Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686567;
	b=sqS9AbUKGHs1Z5jGUsQ+QRDgQ+DAGiIei3VF4uIQgx9WXyGz1BQBvGr7RujCB+SD1Yuf
	 A20ZYjtuT0SKTj6iumM1IIIMlzlgHMI6mbXCdGgNcYq3STOZ51yyQVWGe+jUryzLVw5Io
	 DeJ50zpgzjFNBU/wou33qBDMNl4y+pGdq13zt6DPLltBvz7NWWXJ5gHieFqsNZHdSxmop
	 Y8Byxzww/YKkgtZIrwlmqy+xibyHgBP1vMCBl+4x4iwg6ud7d2uvFWypzmoJ0uqehE05t
	 5ZiTUvFccTagp25LVje3Vnm9wOArONlufcxFKjvy+Q6mC1InzeeYxXxkoGbRB1JHlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZqUBB7PtSXKumcEYR4tzRgEekrPzVWK1PQaLCTI55E4=;
	b=wMXJ4AckbC6H6ySEJ9/bjmSWil5UGzn1Mpmnt907IS7PDIItJyH8AoCKmrvJzIA4KZNB
	 EYIMsjIMnaT6aYTQ0YEsak0QjaqjF/vCcHpYYeZc9q0h6K3b8ZEA2cNBgpwqsCHIHO0/T
	 kQLk/pcklPvNoFMSw5pHg88kupXQf8d54987MSNammbEePi5BFl26e/mUjjiEGPsAWZdR
	 bZSduef2Hg0P0o9gqZNBTtVkXiNRcikuHJsTHII5+WByxXBIOHbL/BetBMFNcfY+ak0RL
	 XA2+Z4ZsfG99cpwyD/JRIUPonjMgCCw++IUbrbsIWo1jRxVon/Qvtjl/GGKuoo6MmLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mt3u5A7q;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C24606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mt3u5A7q
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3971339f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686566; x=1794291366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqUBB7PtSXKumcEYR4tzRgEekrPzVWK1PQaLCTI55E4=;
        b=mt3u5A7q2n6Lz0rX+xpoR6nrNWLRpmZjcm+IxMmCFEIL9W+I93gV7pXcsRNBWlFuyv
         b/0G10Wtjf1PROs8GpnjK/5YDP72QakyvPwOAQOlWSNEOfEZjjO1xx2gmEAm0tXDama3
         9zSvaxXxp2OPVM1XD5g/i7Rdpsu72X/tpma+Fg2Tze9in2uHm0ifWg8prPTpljPy0oKI
         /omTZ6zlBkauyq3SBtZBR4OKxUjqMXlrjcyJGYWMHhxx5IGX9ki6LKXtZW+keOKRfBmB
         D0rywTUlm6VBp5m6vM6Q6PyNflws5icUZAYT2/dpwNJ5f+z9iMwOnmK+mkXO1qUtvWnn
         EgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686566; x=1794291366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqUBB7PtSXKumcEYR4tzRgEekrPzVWK1PQaLCTI55E4=;
        b=F2anhL3ItqRwLxiOBCVSCAz5gH2sCSGIH7uv9vE45R8+0xEi70Vn9N/i7Uas05ya9m
         zlJw4BOD/eSiOtxZUh3zU3ZnhtjJj5yuHSE+yvw9pfva3MEMJAI0ZFi1LueiYFOIP/Pp
         PPoG5BfJ0Gz89Y9GI2Mkbj0PE5h6ZMCDHuHT9QDSJwc/QVT0wSYBgTDqY7HbPpqdckx1
         r2xsHq/SQDDCO9SBVmyNZqQtfDZtTcbsOtL1J92Dtdxa4LhD+UZRGMn+phcrwTZPPXHf
         OftVwQCHyscz4m54SGbgy+ib511zZqRd8ESgOJNmVFkfkmnc8epOf/8AlgRDUubSpYOe
         X2fA==
X-Forwarded-Encrypted: i=1; AKwUvBz7YprWxYEGGjNoZZj0dudETc3osOjmvJ7MW8umaBEijq7E8/qKT5XhsI/uRx/Zc3sXFZZ0zdZkWN7Xkps=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rGxxFVunayWnYZZ4DAz18sIaVNzulUPTaM2ZAV72WaivadlsB
	ejQzZ8Xtw3QrgRYdaS6yivJHwIx6Uuu43mMmQcE1CLG9dHHjKMZRTVv2
X-Gm-Gg: AYBFou3q9MzQE9X7dPPAzVmjd+QNRW7bNfjGY9cSyJ6O2UhSlJ49s8t47UfaMleJwhN
	HmDHELCx0iShmajRgJ251XIQZCvk9aMSZ0NK3tnZ5IYR4jeqfqFU03EI3sfmzaUeUpJb7ViODtw
	p6hIrcnIZbyrC6p0oJqSI6B36rq4b+YPD0hN5o7+hAa71dkJYfU2op+XIWtjAQ5KkuHdxDj3qvs
	YRgOmpx+/hcwdMjJ4sb/8/5FqW+ZJd09E2WQcq3hbz9dYfY1IsS/YKtD8oNXo/QzlIFHEIoYiJi
	hTbpwUEb4vgptFBdZFtCgA9wG483fiqTaRPJA0xbW006gDKXos8y2Ei7QkQ5bEwNT9B0tWBXQz3
	y9uGmnCAU+RsQWWMUfGCoQv9ks5e2a8p5rFaAgI30e+1unfUIjoWk6TvoTMZfGtVwR1LBm4KEHt
	++5dNTxIclFLK0PqCU5m2UQ0bwWETf36VnboTK3R76otbLvhySAQmDzhY1WGzme4dBXUmFVnl4C
	64TsnqlC+xdHFunRmzx8cw/1Fc6hEWpajevi1S/dTHh6Hrxw0V4TsX8Tv79pB6rZ0QG10Wc+uuW
	3hN8/gRPia7FcGEe9GCtHYh4YeAowslZ
X-Received: by 2002:a5d:64a7:0:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-48e6e50191cmr20614162f8f.42.1793686565592;
        Mon, 02 Nov 2026 22:16:05 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4745:6c00:243c:3b07:905:b6b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm23853708f8f.30.2026.11.02.22.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:05 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is disabled
Date: Tue,  3 Nov 2026 08:15:57 +0200
Message-ID: <20261103061557.1235129-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

With nohz=off, tick_nohz_idle_stop_tick() can return without
incrementing idle_calls. sugov_hold_freq() then treats an unchanged
counter as continuous CPU activity and can prevent frequency reductions
even after the CPU has been idle.

Skip the busy-CPU hold heuristic when NOHZ is disabled.

Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of busy CPUs prematurely")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/sched/cpufreq_schedutil.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 14405a614991..111582876954 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
 	if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
 		return false;
 
+	if (!tick_nohz_enabled)
+		return false;
+
 	/*
 	 * Maintain the frequency if the CPU has not been idle recently, as
 	 * reduction is likely to be premature.

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

