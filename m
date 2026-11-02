Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585744;
	b=1dFAftJaptUN7bVLbJtoTe9HQzVNJMFyRx8RZKA/Dz/Cyrbuo4HzWw/34WJCgywoEdhZ
	 lYttKwr9mUn7w9czW6L1WTfdWliP1tifU3OXlwlSCXofGI20W7wF6GRwDej7W3Z8Xl5hO
	 aAnCImpOj9Xu9y7p3MssE5M2nm7Nd78EfRxFn/M4/W+sDvrf21PaRWAjVafS9UgZGStYs
	 eMdtUlcZEGgEURrNIq5FRxjVjDWM6Zz+Zbt2AgDW5Mn7DPnvINURuYssXr0iyRRQ3Q3h1
	 IopNHt+OwP+BCb70UrGczFPNHa7IY1GOxN772mwmEJGGIn5WQ3Da/fkxIewTiG7QULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+LK0QI4gFfw9MYtV4sz2wBVH1i+L0o+/XYItsFSJWE=;
	b=GwcQz5UV9gv5YEojpZmNxRaCCqhhBAxsVJpdxjCgINF/OcLX+TEFSVWGmOm1IFyXu2/1
	 q3JD7l/cz3TyZ1d6JchqHsEBD0yL2exfb+6XJz5MXFQzfQRG8VjwbeqXMhUBU2fgUc3Wr
	 C87mtL+qH4JhHEBt1zThwWifnR5+ziHrpRfFqRokZ3VoNnkOZy0c8TPsBBFA9bBu0X8hF
	 N1N6KtR+CTFC3KvdD/PSxrDO1cIm63OJ9013hth2W9nvP2nxWzTC1zzdvi6kR0lRY0MaG
	 uCH9lBl1mj6UCinS9uxVvnZLodzLPR8iCEUJC7/K139T2Km0sdLnqkQMyCfdYpOm6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9GKQPVG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA604606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA604606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9GKQPVG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1954862a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585743; x=1794190543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+LK0QI4gFfw9MYtV4sz2wBVH1i+L0o+/XYItsFSJWE=;
        b=G9GKQPVGY9ptJ1cBlqq08JT580ydx6PQoUkcV70jqjGu2LgUCZfqsIwxr6xPgFWodu
         ER28o7fKmVnnl/R4CEVexzByyzpT62HKaxnYK1Kzvio6X3eP9cKkLmlRT6NWS7S/B+Rn
         cDICCpTdzC9ajfn57wgHKYJPD236rahLtetVOrK6bd9KhJ/Ut0LYGFztFwk03mQdgPAS
         1QBsMRoS8PGU7NoArsXnADNdeiD4kmvY0CTMAPA7sGLXXsGe8LF+jKXZhB6G1CyRFBUU
         +6Tq9CQhhqlz4z0Fb08I1JHAsdJ1Nc3Gf6jDChj24oDp+NiJGNxkvTfmKoVyK1MzctGX
         Pk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585743; x=1794190543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+LK0QI4gFfw9MYtV4sz2wBVH1i+L0o+/XYItsFSJWE=;
        b=h7rjYvlpMva4m/AZowZXC6Gc4xpYwIhp8AauWeNpnnNzjhTBxJxx4YxtXmMrLF76lb
         FqaHd32qjmOdt0PM/2w9taDIaam2NsmhMJucmVLVSmzlw8QmajOs1z2Jm6OQB7ZOoGdG
         0ZWvvyHsGZuKeYwJxCL0z9tCD4ECTfa+e6HtdkxMQsVLMFFRXib6uPamK2jK9ZZgn4EV
         pHSxy6wVpLwMX1O1bJiGCvo5zvqKm88APndjJ2QjJD6KjIAarFx0CfOoAt1cYwSqz1zj
         m/eDu7eqMQpr6WGC1VpRlJqb2TRd1wFpHRriagGdYlz3eevqXFjuVjjKtwJVEP7c1ZR4
         oY5A==
X-Forwarded-Encrypted: i=1; AKwUvBxTGWTW1cEJ0FLmm4xv1v9SRUuxWWtE8H4gpTVfKJToLyBqsrTTad3hXIZnfD3n2PVrkQ4lhXKQm27eIsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1hn1GKfuq0aw154+XP8++pr6vqL7dkSzdXx7jCJm4L16p1y9N
	POxRFzmeU9g7muC+R3mUuv01TMIj043V9Ui+ERxkv57uLyN41Dz7VlKa
X-Gm-Gg: AYBFou0SBYGu2kj4Yk3dLrKNN6ttcSzeEnREh341gDLS13GVi5e9Wly2X7yIhoVJmUA
	nQqWngN7cu455igR3uIp9fIRLYN4lakWdeKhPneDdnWeehcAcOCv5L4H1j1HjIFk0HcHH23pqmf
	fUMJwqdNdM9JllTNWgVeOuaLl8Dq2pWwnGaj0Yn+tP8XHRm1GgJgsa4E4uC+HPdswgBkYxgrpS1
	fIDghuJQNsL3w1i9XQWBr81DtSPZknVoIBlkYeKLzVycNjaHQ7aM440vzprNV4EXlhM2Tndt/Yq
	DgfElmd0oHddvt6yCAP9SaBXHYzwTbl85dW9gyglcj2a3sWtHPpOZBeXhZ7HgC1dKV8QQissSfm
	IWNqEDZB8BzhLjVzY1slqImBrLWGAj+S27RGn9syUWcRtS9NsynOXLVhDflyv6k344WkPpAfiBQ
	CbcVxZWlpO/ypyvAweBYRtNlDeHV/kJXJxJE0mzED3UDEAwAQFlv9W+aU9whg1clq08q485oK1Y
	DEVXXUUhtc+NsmGbNIfmoQ5G3HOKfbNft0COxBHR4/g6kSxHvUKyB5/2V3dbz6dIjb80ox+Oy/B
	vYveLzwtgD0CnOrQ5NiZHdm6bb1+gAkqW/pr93r6Z2TgMw==
X-Received: by 2002:a17:90b:5868:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3ae8984b11bmr7451603a91.48.1793585743050;
        Sun, 01 Nov 2026 18:15:43 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm11721288a91.6.2026.11.01.18.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:15:42 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: qyousef@layalina.io,
	tim.c.chen@linux.intel.com,
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
Subject: [PATCH] sched/cache: Don't use fits_capacity() to compare thread and CPU counts
Date: Mon,  2 Nov 2026 10:15:36 +0800
Message-ID: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
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

invalid_llc_nr() uses fits_capacity() to compare a thread count with a
CPU count, only for its 20% margin.  Qais's series changes
fits_capacity() to take a CPU number as its second argument, and this
call would then pass the CPU count as a CPU number without a warning.

Give the check its own helper.  x * 5 < y * 4 is the same comparison as
x * 1280 < y * 1024, so there is no functional change.

Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
This keeps the 20% margin.  Qais would rather not add hardcoded
margins, and llc_aggr_tolerance already scales the LLC size here, so
the margin could go, but that changes when a process stops being
aggregated.  Tim, Chen Yu, would you drop it?

 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..dfd6528d18ee 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 	return false;
 }
 
+/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPUs? */
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

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

