Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544457;
	b=JOwCqvU6cLB5PIRzG9SffDU2rSWWBtu0a8V/S3Gp9MGCq0v77Y4wpI958iX4ptaMtaJY
	 X0nYcXuu6w81uZ/RMvh0gkEfBtcHZ5Tz8sOvKKFtNiDctvCBvNaN9lxkG8IUwL5ECpIxN
	 Zvu6ODktkzRZtNv6xBo8bbnteq5beFJEbzvIHVmW+xVObgc3ifMdBy42cwI8nnDDzBFg+
	 +sXwCKbInPmNfxbtWuX84nyIZpyrHW9HM3s0TyURwiiI4h0LyseUHJmvlrP7xk++5MaIO
	 WNRrnJdCgmLyytn4m4PdNMKC/kxtojdsJxjeORS8wT77K9WcCQKIdHlQ5/PkCd3vC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W+i1rIyr3V8Nl/4loAFxXnAn2+GLk4upZOLm6BNXOEw=;
	b=WvGXEMmp1vJTwW+VuN6OmG6uXlSd+9e8HbRgxKjLi8la3jQuaadMmDHMair+IJQrOPZR
	 PkaYgMGK/M8kmf4E6wo0Nt3IbkTpkP+jZgCZc1NX7wCfGPBRB1vn+rFXPD4C/FpTzmN9q
	 RTwhTCEMbBfhb7usuPl01oJYlu9mt0+KuRqFb3O0GupNF0368VJzs09ozgRL/L0HpeXfw
	 zeRMDCiqGGEED6ujypBrhE6i9ZwRrIq1mQTjPRpBB0GK3Z4Un1P9O2FBDYmWxcIyq5/0F
	 uxxmxhull2w7CDAlFrgDDboCKa9FHxz+yWghRTA8CYNQjhH/puzpwgsSqUpmPnN1NjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OazWZGtb;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D594B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OazWZGtb
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3663e04e9a8so189266eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544456; x=1793149256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+i1rIyr3V8Nl/4loAFxXnAn2+GLk4upZOLm6BNXOEw=;
        b=OazWZGtbA71CeU2cmOt/W7CI0AtqVl/3TwcSWlanzHPWQhHRGyuuhPnqK7FIfLdb3K
         +ud+7qM7n8MkFkH+v74zPE0OdsmuORcgFPgE/0ofnAMrR6hKDm8KobcQIQIUR/j9tG35
         ZdlY77VKCthsX5ALher2p9rHGUbt+duu89XEFMNg70pYPaOkjY3YaPoVR2J6Y/yv8KDR
         GuMm5U9PiwOE3DuJ2rAIkDTY0TauGg5C/eU4/HkA+1qxMJyn2Ae7FeAocOkbbbYYl2OY
         QyPoDsqR1bYWLaIKnceOnLCDiDUICS2DkRvV2v3Z2lBwFxDCZZdHzke43h8geKojYaAm
         n5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544456; x=1793149256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+i1rIyr3V8Nl/4loAFxXnAn2+GLk4upZOLm6BNXOEw=;
        b=GjMUmNlH2aHwqv4qoazPFQE4gTzobJ8ab3pCKbO3ZuTrVcCIJGjSY18XpArKf7bFeO
         djM3He/OdhkoQC3WwhgVGXg99ApxTcA52HzQWIDuTRjvZToimu21y5Be8Z9yqg98xVa6
         QqND/RLm8wC5G5TByVKUAjxRlDnaR9o2zW5QyupmK2bEsU+8Gk9Zvj0+e06Z8j3QP6WH
         jsFFHqfAFFcPIvRcOfGgZtcRU696bRHhaA1qeWfvoe7o4e2OHrPvtywOy8VoW/0e12lN
         VfCVfvZDEAmvi+2vlJy2avnqqMiNlVp6pDvWvFTRDABtjoW27csR/mhVF4qzJz88j4QA
         N1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgPQcbwKGwl3guP+0q/+ZJSW7wXTmuOsdc087csVP9t4B2al3nD6TOWvCnpbmcpRNAVG+/jtJzW6E8YhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/thrD0fBCyWhXUgg4VpviT4hVDCr6RS+M8j9SmLdH3XJD1TvI
	YX/YqU9NZZChQJzcB9jKGs1QM+ZdgHjrZuSIHstK+N0kQZL0PL9/Up9J
X-Gm-Gg: AYBFou02Mk1V937EEt/UeGh3C0bGUA5fMXt3xTnM+oCmLRJ9CIYSmBWbyOem9AEXY5Y
	o/s053myyMgP9fyL/R5rKZHHz2At7MwyVqZbpCu0WMQ9DDpbvC7hFkd2WfTewzViiSod56dgpP9
	qf9XFpyrNHdNaWSmiFEyo3Zc/TUnce+TkkFT3k9VXbRpvaGD4K5W2SYYT8mGVNRcGNoWkm6f/TM
	oqgXDrQ5ByVMnhaefywZswwyUX43S52zLfm+OU+hRvE+eSoLJs1rXDJvv46eIUJPCbXVypdF0/h
	m/3SvfJCfAz0/I346X0sAJ/qPkuiR61dSZ/rVBpZVju3kJ00qrdrrbAp1IgAAysOEzp1paxZrlG
	zMpcje7BsK2TffgAJiznh3RWE5eT7kpaUWJ0PrZluZwM3ICKscnEQUHC+R48Cki2MOevjV9a7kN
	OvI7Z43aSQyxhBAlEX96Dn8YgH1Q4xpIsTf+P5EAyhpx7Lk7/b3SoPnPaIsQw1jJH2f2rYlZdQq
	k2w/wFvnaxlPR3D3/YVRlnBPAuAFI3ZOxdjiQ0w9XpJxXDhlrOabC3sZ5zrhaFZD48A8FPcn/Cv
	gqei/PA=
X-Received: by 2002:a05:693c:42c3:b0:35f:2349:a574 with SMTP id 5a478bee46e88-367508e2009mr1139401eec.40.1792544455625;
        Tue, 20 Oct 2026 18:00:55 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm1977890eec.21.2026.10.20.18.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:00:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: bsingharora@gmail.com,
	yang.yang29@zte.com.cn
Cc: akpm@linux-foundation.org,
	wang.yaxin@zte.com.cn,
	wang.yong12@zte.com.cn,
	xu.xin@linux.dev,
	jiang.kun2@zte.com.cn,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] delayacct: Preserve delay extrema when aggregating taskstats
Date: Wed, 21 Oct 2026 01:00:22 +0000
Message-ID: <20261021010022.85881-1-dennylin0707@gmail.com>
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

delayacct_add_tsk() adds each task's statistics to the accumulated TGID
statistics, but overwrites the delay maxima, minima and peak timestamps.
Consequently, the last task determines these fields, and a task with no
recorded delay can erase an earlier task's peak despite a nonzero total.

Keep the largest maximum and its associated timestamp, and combine the
minima with min_not_zero() since zero denotes an unrecorded delay. Apply
this to CPU delay and the seven delay types handled by UPDATE_DELAY().
Single-task queries still start with zeroed statistics and retain the
task's values.

Fixes: 658eb5ab916d ("delayacct: add delay max to record delay peak")
Fixes: f65c64f311ee ("delayacct: add delay min to record delay peak")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/delayacct.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index 479e860aff70..ea1424524654 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -12,14 +12,18 @@
 #include <linux/taskstats.h>
 #include <linux/sysctl.h>
 #include <linux/delayacct.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 
 #define UPDATE_DELAY(type) \
 do { \
-	d->type##_delay_max = tsk->delays->type##_delay_max; \
-	d->type##_delay_min = tsk->delays->type##_delay_min; \
-	d->type##_delay_max_ts.tv_sec = tsk->delays->type##_delay_max_ts.tv_sec; \
-	d->type##_delay_max_ts.tv_nsec = tsk->delays->type##_delay_max_ts.tv_nsec; \
+	if (tsk->delays->type##_delay_max > d->type##_delay_max) { \
+		d->type##_delay_max = tsk->delays->type##_delay_max; \
+		d->type##_delay_max_ts.tv_sec = tsk->delays->type##_delay_max_ts.tv_sec; \
+		d->type##_delay_max_ts.tv_nsec = tsk->delays->type##_delay_max_ts.tv_nsec; \
+	} \
+	d->type##_delay_min = min_not_zero(d->type##_delay_min, \
+					 tsk->delays->type##_delay_min); \
 	tmp = d->type##_delay_total + tsk->delays->type##_delay; \
 	d->type##_delay_total = (tmp < d->type##_delay_total) ? 0 : tmp; \
 	d->type##_count += tsk->delays->type##_count; \
@@ -174,10 +178,13 @@ int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
 
 	d->cpu_count += t1;
 
-	d->cpu_delay_max = tsk->sched_info.max_run_delay;
-	d->cpu_delay_min = tsk->sched_info.min_run_delay;
-	d->cpu_delay_max_ts.tv_sec = tsk->sched_info.max_run_delay_ts.tv_sec;
-	d->cpu_delay_max_ts.tv_nsec = tsk->sched_info.max_run_delay_ts.tv_nsec;
+	if (tsk->sched_info.max_run_delay > d->cpu_delay_max) {
+		d->cpu_delay_max = tsk->sched_info.max_run_delay;
+		d->cpu_delay_max_ts.tv_sec = tsk->sched_info.max_run_delay_ts.tv_sec;
+		d->cpu_delay_max_ts.tv_nsec = tsk->sched_info.max_run_delay_ts.tv_nsec;
+	}
+	d->cpu_delay_min = min_not_zero(d->cpu_delay_min,
+					tsk->sched_info.min_run_delay);
 	tmp = (s64)d->cpu_delay_total + t2;
 	d->cpu_delay_total = (tmp < (s64)d->cpu_delay_total) ? 0 : tmp;
 	tmp = (s64)d->cpu_run_virtual_total + t3;
-- 
2.43.0

