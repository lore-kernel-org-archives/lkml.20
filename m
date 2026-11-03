Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689478;
	b=cgCoYlzSDhyLWMS1pHyUZAgLClJN4nfRRJutZKkKwN9d/fgFrQ95Aiw1fa+AUXrxqfD9
	 xNeMRm5Dn14ef3Bpgk4Rw/8Z+3C5uRbswIEFRvIRxO7D997IiWvSLCUTHULZZGR2pu+cc
	 2gW9OIafdhbG35FwdemQ/rN1l+nzKna3fBFzNhn0xqREewZkz49FltUWTzDj/d1gUOzwO
	 vxvhgJjrxEGGijMwNjoZi9gHRAUJYGUu6Jyw7DSlspilN+o3VXgoq8iPTOQg5BeCHMydX
	 PbQmqZ5zP705wC3IZylMcgUxTnoAdo7gyGsW1LnssEQOjBKugxLJ91HZtZ2QcB2uXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689478;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E5tuT9Kurl9L71bzCsfNQUYEv6lqs/5h+LNYeamGL+M=;
	b=Yl3HK1JlFiL5/rfGB1wFwTQbSw9DV9GAmbX5Dl72IKt6OwB3KmgJGwXKDh5AQmiOUakg
	 5wckCbLGWcGoMEhs6MFRhBWUROKLBZmkAhmYlVdyVLVyafi6F0TUQQscJz15dyrnojQHa
	 kYE9UnlADQ/xcpCIwN7ScEzJhoO1aRQfeVMpOs6CY9L8TNeimq+gE3Nzc9VzYP+2pxKMd
	 OrTa2+1cz4dxjOELfOE6BMTOWdYR0XAZSiYQAi9EP/skpDNT7lYpL2TxC9Opct3LQM9Bb
	 xxusrWlbs8snYuD/QmXeG/sHs41snE7XvHyY8ZCLt3jwtVhgdOE+jSkJ8SSpJ7LFPGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MncNOXk0;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E37606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E37606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MncNOXk0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MncNOXk0DhwKsBUjWB8WF9k153DQ97eUzDxm3wZ2c1UEsom6u11vAvdWzaTrapMYggCGk6qsj+R+k
	 5uEtriBCTPTNc3n1q2jeSZ3mHkg28m4AxsenntwyRmc/9tzYA2jL7yVz4k/TT4pIpOWK1PL30e+NM6
	 ggipr90SeJaIsDO0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46ae9877fd25-306fc;
	Tue, 03 Nov 2026 15:04:32 +0800 (CST)
X-RM-TRANSID:2ee46ae9877fd25-306fc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae9877f7ef-9b3b5;
	Tue, 03 Nov 2026 15:04:32 +0800 (CST)
X-RM-TRANSID:2eea6ae9877f7ef-9b3b5
From: bajing@cmss.chinamobile.com
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org,
	bajing <bajing@cmss.chinamobile.com>
Subject: [PATCH] sched/cputime: Fix a spelling mistake in comments
Date: Tue,  3 Nov 2026 15:04:29 +0800
Message-ID: <20261103070429.5666-1-bajing@cmss.chinamobile.com>
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

From: bajing <bajing@cmss.chinamobile.com>

A comment block in kernel/sched/cputime.c misspells the word
"subtract" in two places. Fix the spelling.

Comment-only change with no functional effect.

Signed-off-by: bajing <bajing@cmss.chinamobile.com>
---
 kernel/sched/cputime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 17f3cbd5d403..146d75c66ad6 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -435,8 +435,8 @@ static void kcpustat_idle_stop(struct kernel_cpustat *kc, u64 now)
 	steal = steal_account_process_time(delta);
 
 	/*
-	 * Record the idle time after substracting the steal time from
-	 * previous update sequence. Don't substract the steal time from
+	 * Record the idle time after subtracting the steal time from
+	 * previous update sequence. Don't subtract the steal time from
 	 * the current update sequence to avoid readers moving backward.
 	 */
 	write_seqcount_begin(&kc->idle_sleeptime_seq);
-- 
2.43.0



