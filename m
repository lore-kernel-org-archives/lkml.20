Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758201;
	b=qkCRH6FXrUro3j7zmQKtNfleZY20M2qVcNF7mgEu754cRd/X5ZiECCuGz0J8Ts3YVe/D
	 oqwnhodjAKgTLHx5giLV+yobkEwOILTD7hyp43xCHbwIkZlVxem4ji3anOGiB93apKaAs
	 pkx5kQs1o2DUl6enIToOT9H0H1KVnf1U91285kQjcDr9T8/rTSU7w9GcXEXIhMaQJp8BG
	 rqLkNNF7nar0+bG4E9S0JU7kaPDw84A/bzxlmABWjNiS3wEC37kAK6BhLC281rx0pDO87
	 q0SnJ5A37RXFSlz8L7zI69LwcRYMOpEh/H8MKTNSwQTDRZdYv12F76uBDBr9zvcNYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ql2eFqOIiZNH3dzGy6slwHXmGt1mtOeOvkrBwzZy92Q=;
	b=xllFqbT/vz2akuBO/Zrb5HZIYcprcPZs3vq65SdTAKnQsSj3Zgc6OvYBsjzXsp+0hwBD
	 XaawMtC0ytbfbZR1vPQMVPS7MMAhJjOHKmC/L/s/edd/qLV0oNCt5/9s2B7XK229yPOmb
	 64pK8KwIvfEOBUjYXtw10gDEirLlkFFTCCKfgb17hIba08u0uMkx2qdrjSsDvBzsDCW9z
	 RuOl1GU19RNgR4IgMVHntUUklJjgrxCT6xOGeNBKpA4qxEAMVArSa8TXaMOhxrTajY47I
	 j8yUWtv7vafWqW/ZMw/V8rcRbPsgwZc9ieXAsrTEklj/VMMpay2SvrIE4Ps/ki3Aa+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3jShEe+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7227606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7227606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3jShEe+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so342559eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758200; x=1794363000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ql2eFqOIiZNH3dzGy6slwHXmGt1mtOeOvkrBwzZy92Q=;
        b=D3jShEe+x1sKeZMs+tYAe8MUHWP0OaHuSAQ5akWh9C1AbKleWZYpX6PmSe70qOb0k9
         rlXt/VZJDpNSmczyHdBqthiVtNEN4Lbu/dEj8CZRWsX0PJdLl3r+sDXGo4ih6G6+my+S
         jQMTSrnv6heTdqejJUUE0bDRZBgjsUefypCiYiO6uolyH8RVfC2G25WPAI5Zz2OGH3MC
         sfFhJCNH9M6eJQUQJRZq6SFHwh7G4FL0X7wYlZmxwuJSI4ywYm9w3dGUtg6N5b2cOz5b
         uP6SFMcFtlz5igMgRfM3uyAAUvvbzUhyRv4YuHfgbyZL3y4BcAumjtD/MTyR4wD6rg4E
         1rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758200; x=1794363000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql2eFqOIiZNH3dzGy6slwHXmGt1mtOeOvkrBwzZy92Q=;
        b=2ddCcgOTfT2hPWOBVrrlFfoq4K6gFpzsQgyCLxv94TUkfC3HwtUYXV/q4o8vRzww7t
         12HJiLGYIBR6J2oaEGAslJAwjn9EvT9OfDB2CzKfT4aL6/FB5MSxLAEbDpwQqRI9XeQ3
         PITz/X8lzvRsxafWsdn+zQ+9BAOH/3xQm1MWoc8pZJAUQaz/cEGMeiA8Nd55Yw+Ia+zC
         SIDWAb+7FkBUQOdYtdj+rdQ5mD7R85gK6ZEXZFKW7WADHDlqPGO2qV7QeUvarcscdhup
         vMd60+YsY9OOgy5H8eLdgP5gkYhbiHEWkN1gE1OrlLrmqaBIgtin1b7aAAToi3JhS2e6
         trng==
X-Forwarded-Encrypted: i=1; AKwUvBw+aLJKTycDsJPm5PO84HRAR6QSL0o1ayo4IjoEyoojo76MQFIX4Exg3iVQ7mhjLYNTOhklSxBlCps2Wxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+STtPTBnUVKQbepmKZTKY0CpNcGBvB5xBp5yv+gjmtgLKanMpe
	I4YT2JfIUI2o0LMBSDP8PXBV32Rtxkdj1U5fs008Hfb+YjQzaZBEu71yLv3ki4BR
X-Gm-Gg: AYBFou3QKShUbti1Bjvfvy8q3RnJSRFop5dKOSYE/+6gl62zFIj045w+AXzkI/FW3Jl
	0q0XQCyxzZ9qpA9syB/apJB+vBcjNa3GWawZkmJGw/uUy4CJSjLxsD3XXN+eiQOO1+bFuumMa8v
	uIERYojl982iddn0fCO1LIwMs4Xv9xhkt5l3iFWPYEFz7oT8sUF9N8cFtp8mCEymZGMVsUw2Cj2
	o+ke8aaLQjipFj9gcPY10oDxDSGTUGYO+3YjkRgb07llD4k8aWb3gJWC5ChOnxAcb2/LqHFnpN4
	o4FQj5POdL2yO73WIqDWiSzwvB8si5yXYspXt3pBl1grSg+Tu5rdAwBO5OF0CXLv1X9GXg1gfXs
	/zyjwmntGl00bcBNPK1b8hstDXs9eNYX/2bORvp4i30esFDh10rKy4LP2lfij17wWIN/ofQSqrT
	Rq56NNKJY36DY+oCjCRBJq+XsMUJaP3GRB+pNsLXJeL9WautWh4XEVPVPTcYABvxl0KOWuqcrRp
	tCERzdJslcXojB9Fdg43dWFnkb3p20c507cAsH10tJhE7rD1hxhZFg0T8dDKdEZdqevAOMJNmWp
	iU8UUsTFpp1kcbIX+l5a9VrF5kaBY66ZxHsTtbjvQgMEYA==
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr20397272c88.38.1793758199771;
        Tue, 03 Nov 2026 18:09:59 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm3560432c88.21.2026.11.03.18.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:09:59 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: tim.c.chen@linux.intel.com,
	qyousef@layalina.io,
	yu.c.chen@intel.com,
	vincent.guittot@linaro.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2] sched/cache: Don't use fits_capacity() to compare thread and CPU counts
Date: Wed,  4 Nov 2026 10:09:54 +0800
Message-ID: <20261104020954.2388172-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

invalid_llc_nr() checks that a process's running threads stay below 80%
of the LLC's cores, scaled by llc_aggr_tolerance, with fits_capacity().
fits_capacity() is meant for capacity values; here it only supplies the
20% margin.

Give the check its own helper. x * 5 < y * 4 is the same comparison as
x * 1280 < y * 1024, so there is no functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Qais Yousef <qyousef@layalina.io>
---
Qais's series changes fits_capacity() to take a CPU number as its
second argument [1]; this call would then pass the CPU count as a CPU
number without a warning.

v2: reword the comment (Tim); move the reason above out of the
    changelog; add the Reviewed-by tags.
v1: https://lore.kernel.org/all/20261102021536.1026143-1-zhanxusheng1024@gmail.com/

[1] https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/

 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..a7467fe425e6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 	return false;
 }
 
+/* Number of running threads below 80% of LLC's cores for default setting */
+static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
+{
+	return nr_threads * 5 < (u64)nr_cpus * 4;
+}
+
 static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
 			   int cpu)
 {
@@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
 	if (scale == INT_MAX)
 		return false;
 
-	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
-			(scale * per_cpu(sd_llc_size, cpu)));
+	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
+			    scale * per_cpu(sd_llc_size, cpu));
 }
 
 /*
-- 
2.43.0

