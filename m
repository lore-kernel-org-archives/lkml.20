Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976119;
	b=2BCxfNPiYnbjKLRG8GYJ/DrGqPp2Wiz1VN4sLXXfPpFAgMxws5R0KKdb6QYEkkZFudhW
	 Bb3wMuTkvb+zCh2i23eBXj+3L4Q+Vrs7nEM9fqyvkghZ9QWYRK3QKPYvPBybPVZqszbtZ
	 y3ZpfoxgdiKx5Y4374XbQaYmTLGSPqgfxoKH5fEQkYurIQdW8DbAcVLLawgnV8wRQ4QHZ
	 MHbHSZLC/pob+TOhninGwvF8UM9ZuWRxdSgzQbLC+wht3xZeDtYeCgCmNSVLy1sY3QOht
	 7S9WASBNuebFYmj8MZ6D+NKxwgx+dC1at+TgyzAiK3ldj7/tEA9RFZnJwCZqZ95Bi8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pfAFlSgA91miRWzGWpJoeyOAgw/GIASjJR8SxmP+O0E=;
	b=ET6CoP0oOePWRBWK720fAWMm9xccx8ym7GHm7YEuXaXgfMLBsNke81MvdwAXBr8Qb4oT
	 MVpjXoj8IfwSQp+5TzGXzy1EU0R1OWhLUJtBXrJkU2rVyHBzodInusCQH8k38/464HZKK
	 EGVqsmP55hhw+fdW1mMKRFy7X+O6yPakn/FOVByRMklabQ5ztV6jPVYe6wOJwQREBjWvX
	 TNpj2HZG6gJ0/a6ImP9HBpAhP88dFhEAafCto69hL18zFnz7O5A4Ln2ZHrK8AuJIZCnzD
	 D/kJKcyXPZE/eLz7syAe8HlYJ7ZM4hcupJW54rTU2F6KBcBe8BLgxKBfyjvJUK4kLSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmofO9K6;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA54606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmofO9K6
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so629541c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976118; x=1793580918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfAFlSgA91miRWzGWpJoeyOAgw/GIASjJR8SxmP+O0E=;
        b=lmofO9K64jKmuTRGwSqj8uJ1YMQw6KpXo9PqxoJLBO0VxVI2EsPWN1mmFJZKTEGG3k
         3SCcU5yQAFA/CaOrGNdGW1+gy6OmQd5//UL76yD2t9QRBMEmKk8qhuWeKDz04P2vX1sd
         p1Vi6Gp1Z/TBNJtKFPNY2SHCu8dDe3vZyD3s0TMvWE+UYjWbgARNlTV6hn9M1z95+T6R
         EHqEDrZy+s42Gb6PGotMEdked9KgDEkB9qvnrxovbazB+YH4au5w5rGPrSPCP3553k66
         g4vmwes/GWsIRk4AMK0zmi5dthalcXq1JdmvSYmG0Ax7n93U9xP3lD+rBQKl7pt/Y0Vn
         K0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976118; x=1793580918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfAFlSgA91miRWzGWpJoeyOAgw/GIASjJR8SxmP+O0E=;
        b=fNaC5iKxAiqKzG1ghfczCuaEvtMNPmDjQfOEG3t/60xjWP9bRpjPR+izxqN/+2pbjM
         LjsmSU2RfqYBsOx0BKOJshE1dvP2A8wPcxqehDsBCYGCl4mZOkfkVa4C4gn0NT1b+a1b
         s5Fhj+TA9n0OOajZqW2s84k3nzxhe8B+u2w/eNovJjCZR2wldLIrOE0mYg2GHf1+uSc8
         BnSrp94rEQkmew8GdIoTcaJk1yMnxkhE7mxu9PFAS0ypXjPHkxXKpNAKfKcAj2vSbitJ
         KSXnM6CVnWev/piEtKKaU+R/CzRle4FKXdzP9oDXCEJeHumZB8bUpPqhps+lQtReTxya
         rX9A==
X-Gm-Message-State: AFq9FYIaQokcqZ8ZRlek5nFajIGv9mA6BWarx11mqxyTGCPYZSO1Dx0Q
	b54laB0vJdHeB1sLB3illoAmi5lbrtv2+4OBGlUJvmPe4MUAi2K3X32d
X-Gm-Gg: AYBFou1Kw/jdZCKbi9oiDfer39awWxaIFhmBmPMqwVMslZrAdB8hd9sMmYZHcYJ/7PL
	p7adwomuxQliQVqunDrxyUuzRhP6Jggx6NTx0vbUWkzhWCuXZpj2Zb+KSWcHyPUFzSSTWnNrnJt
	06JymVGWU26yNlXqrC2WIXoaPYSEYa4Ssw2RLzTpG+uMocESfUOnnqB9V9ePgCS9QFuwrZrfsCh
	G5WOewBudy+e7hsai2yqfTZ0YQShlRltFaKW3V/lG63QrAPX0zL7oNe7V08ApNNr8CCcm+EMI4D
	WWHi7ZqksQ76jyOpz3QK4vIXO5JlGpdMLjH4q33HPpMnrRndqqWMiNdOScxKH2fjE8SvCmot+c1
	DqKkGbBmIR4TpJoTMgKaXjz6rEdxoimF4TLfj4rW+VW1ylxVskiBACV4b+NQU0oi5bBIaapcGzO
	o1+i3huPZVQ+k0ulBdpGg0wckQ9CW86QQVNnpdy0BQxophFTWRtJDohkbtH5NtHzUSlHE+ILC2n
	YwfMovbwdbilAXQdyujV1cUhgENzKsjoSdubds1p+ixm4CXCtJVRqy5wszx0GGT83OXPOaYi2FX
	4VqP6zs=
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id a92af1059eb24-1992a250624mr8188868c88.1.1792976117748;
        Sun, 25 Oct 2026 17:55:17 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm20570732c88.7.2026.10.25.17.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:55:17 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	oleg@redhat.com,
	tglx@kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] tsacct: keep task begin times stable across suspend
Date: Mon, 26 Oct 2026 00:55:06 +0000
Message-ID: <20261026005506.2253-1-dennylin0707@gmail.com>
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

bacct_add_tsk() derives ac_btime and ac_btime64 by subtracting a
CLOCK_MONOTONIC elapsed duration from CLOCK_REALTIME. MONOTONIC stops
during suspend while REALTIME continues, so querying an existing task
after resume moves its reported begin time forward by the time spent
suspended.

Calculate the begin time from the wall-clock boot timestamp and the
task's CLOCK_BOOTTIME start timestamp instead. This accounts for suspend
and adds the nanoseconds before truncating to seconds. Keep ac_etime and
ac_tgetime on CLOCK_MONOTONIC and retain the existing rebasing when the
wall clock is adjusted.

Fixes: f3cef7a99469 ("[PATCH] csa: basic accounting over taskstats")
Reported-by: Oleg Nesterov <oleg@redhat.com>
Link: https://lore.kernel.org/r/20130611200600.GA15168@redhat.com
Suggested-by: Thomas Gleixner <tglx@kernel.org>
Link: https://lore.kernel.org/r/alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/tsacct.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 5c153106e642..89f118227c65 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -24,7 +24,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	const struct cred *tcred;
 	u64 utime, stime, utimescaled, stimescaled;
 	u64 now_ns, delta;
-	time64_t btime;
+	struct timespec64 btime;
 
 	BUILD_BUG_ON(TS_COMM_LEN < TASK_COMM_LEN);
 
@@ -39,9 +39,10 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	do_div(delta, NSEC_PER_USEC);
 	stats->ac_etime = delta;
 	/* Convert to seconds for btime (note y2106 limit) */
-	btime = ktime_get_real_seconds() - div_u64(delta, USEC_PER_SEC);
-	stats->ac_btime = clamp_t(time64_t, btime, 0, U32_MAX);
-	stats->ac_btime64 = btime;
+	getboottime64(&btime);
+	btime = timespec64_add(btime, ns_to_timespec64(tsk->start_boottime));
+	stats->ac_btime = clamp_t(time64_t, btime.tv_sec, 0, U32_MAX);
+	stats->ac_btime64 = btime.tv_sec;
 
 	if (tsk->flags & PF_EXITING)
 		stats->ac_exitcode = tsk->exit_code;
-- 
2.43.0

