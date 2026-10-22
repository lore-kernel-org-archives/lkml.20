Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685549;
	b=hh2SURKWRWCFDQdBfklCW0LZ6gs3ENJd0zg2X6gTqb7LvMishsI13ZX8XkbRpMoxKal6
	 92XTmsoPbniPC0ujj7dxquV6uuZUfDu580eUd625fpItBvrQcHcSFUQaqnlgI5BM/uHnG
	 qAfqZo8+Ip9AoLRrfUQBZqGWvspkOrNHjYJf5gXTqbq7ZM2KUbhZrwdjMgu55lwWnRSJ5
	 rAyKRMhnLFm1wcU8aBJRKvX+fCgdUyptoXsKtLigRbTEiSYipbsNIqZzqwwm6RsHvMCKO
	 nXpM8MSvxe64eh3Izaoe2xNdc1g1IqaHmUbkYy4FMfYTR2sPS9Ya4JDMgsZUpu6clVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnNIQlLfFFXVSafdO2yY3lRoSSpElbFyVxAcoG+LjMw=;
	b=VTnnBSKiZdCKb8mnvjGKBquIG82gmTwt4ok8fQ5d7NTDiOQnY6MzRY0o9Z0AYHo083Ab
	 pePNS35QOhakKtfwRFMyiV0uNQbbW42HChMLPa9YocUmJ5fzIDjq3ZA7FbOolsETuegkL
	 3em0u/vsTTjOoKuebPHnzMObrQFv49TvuZdEPAMSlxCKA8ezGVxD4m7H8qCEc2U8eip+6
	 urfopeRCC9F4G99YHKALJBez2qB3QMG+ZRemjmBvLudGzH8Vfy/lKsofQNmHrNFOyx8a7
	 c60DQnxaFffQzeXyEan6K26dZd/bwNlosRHAOH1Nk3QyL6d0gqywRZVekurBA2vJX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCKBEtT6;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCKBEtT6
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35de2661992so1923485eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685547; x=1793290347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnNIQlLfFFXVSafdO2yY3lRoSSpElbFyVxAcoG+LjMw=;
        b=oCKBEtT6800fDWa2ooupzqhUmcXVvL5rCvNsdodFhyn5Z9FS3KWPKWbJSqG4oNS+sY
         MVkpIIN1wlzNaVssy2s7pPenO9BGXlkgpxo9jJ/MYIZ+LKlhJQM59O7T7Gq9F4Dj+CRj
         YGduUGZhcIqEN+5gYEE/qP7JTW8X8J7nB5q0j4/l8dC7M4/ZaJsYW00YGQl5wFK73yKV
         gP217Vu9ljH4EAcS5fFEiG1lu/qcQ/YAFMaaPdqjXjSGKnMgqnJDYf9o916+MjRKf6+p
         ALFeUjEPxXK1fbcfN6vud12azKpRWm3Gi+tTOoRvf8S313S3Wjn61O90ehVHKCM4QwX0
         PWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685547; x=1793290347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnNIQlLfFFXVSafdO2yY3lRoSSpElbFyVxAcoG+LjMw=;
        b=wEZVML/HF4380x/T7FCeXMrwioC88IpGG/Sa9U30pGhWtBGgCVPqFkiTzNG2zgWQtO
         aHmvAWD1+9B0OR28oJ4N+JtC+rdeKIOkKHO+V+M79FIVQxi+ZKvm8JPc23PPIe2BrKGY
         jyBS4yj8DKBgtFSjqjM+U2zwocfUSDZqwkTirHWL68nI5NvvCweALNmQxa+WcJQWaW4B
         fDyKlAJumugn81MqLJtDROc9VfnCiGJqqDd5c268/MfPCBY6k0RGuEjg8MVNVrckjvUp
         pxqpIbVRJT9rmysBSpViFPBq7aJIkWBSPlL8sUn7XZhMqe8VoYlauGWOEaiQ6SZhaIIE
         3BFA==
X-Forwarded-Encrypted: i=1; AKwUvBy1/vHPuqqFzUHqTO7WF9cru65JRwYFEaRhFsLJdq8CVIqsVqprSCE7Az95Y8+goGK72aFVHGAZusclOLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWfrbfKleCmvh1tNFWu67ALcIM/8SJ5FKpdSRqHhG7u9RXiHam
	b5sVTnTc2Y0tXqgMokB7bMVWsubGISNP1SqnlkQPWCHbovybM/ismG++
X-Gm-Gg: AYBFou1l06gl6BVA3kcJP99rgzYKn8c9r0MivfuLgix+AI2boDYhxKy6Fx6wUNoy+he
	3pGp9DfczLDKkedHA+3nfiJbt2A5LjGUjh2u03rXf/Z+SsrMi+Flvb+OsMkqL39MDEHMk/c6hK6
	vncZ0g8MZ59ze4gHMCjszyB3+MnXxOZovUXi2NMh0CHTWo3DL6IPm9PElj1KiC0IFqWDdpI/Wga
	ZPqFqVdWfkPsSTDyO/Jbf/irGhc0BJNviG3VfuudIxLhFY8vaeTD6/dLhB2u9YmNnkkds9Ngbg6
	P6foEy7u4T9rtmDVErYTTFlWPn+lIBsmUaeITD3NhKcXqKxOuYwPYwz1qYrFumWPP9vLsJZCl6/
	tZuj4s++HodacfH+9wHDP1ubbh1lZXyLpbhisx65Tb/ULRiQ6YOjP+BN+ZRkgk61lnuAwQYUkHb
	7eYcm5jHbaRUE6YLVVhIw7I44QqRBhTghCIjpfDNvi9DK6XM06c/MmLQg6bYfv3MHZAq4OaP2Lj
	vAdZyrSBVjqqG+TU17kNo47bmwPTGLHxuCn8/1v9xKly71hwBK32BwOv28cbOI5NzIG26RF0D6H
	aKtzjkI=
X-Received: by 2002:a05:7301:6196:20b0:35b:85fe:5b6e with SMTP id 5a478bee46e88-3674d5495demr7543076eec.22.1792685547207;
        Thu, 22 Oct 2026 09:12:27 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm19774929eec.25.2026.10.22.09.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:12:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: bsingharora@gmail.com,
	yang.yang29@zte.com.cn
Cc: akpm@linux-foundation.org,
	brads@mainlining.org,
	wang.yaxin@zte.com.cn,
	wang.yong12@zte.com.cn,
	xu.xin@linux.dev,
	jiang.kun2@zte.com.cn,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] delayacct: Preserve delay extrema when aggregating taskstats
Date: Thu, 22 Oct 2026 16:06:48 +0000
Message-ID: <20261022160648.37411-1-dennylin0707@gmail.com>
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

For example, a four-thread process has a worker writing copy-on-write
pages and a last-created thread with no WPCOPY events. With the group
stopped, getdelays -d -t 49 reports the following before and after the
fix (WPCOPY excerpt, spacing compacted and timestamp column omitted):

Before:
  WPCOPY count delay total delay average  delay max  delay min
          4103     5163661       0.001ms 0.000000ms 0.000000ms

After:
  WPCOPY count delay total delay average  delay max  delay min
          4101     4680983       0.001ms 0.049292ms 0.000208ms

The timings vary between runs. Before the fix, the zero extrema disagree
with the individual worker's nonzero values. After the fix, the group
extrema match the largest maximum and smallest nonzero minimum across
the individual threads.

Keep the largest maximum and its associated timestamp, and combine the
minima with min_not_zero() since zero denotes an unrecorded delay. Apply
this to CPU delay and the seven delay types handled by UPDATE_DELAY().
Single-task queries still start with zeroed statistics and retain the
task's values.

Fixes: 658eb5ab916d ("delayacct: add delay max to record delay peak")
Fixes: f65c64f311ee ("delayacct: add delay min to record delay peak")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Add a getdelays -d -t before/after example to the commit message, as
  requested by Andrew Morton.
- Add Bradley Morgan's Reviewed-by.
- No code changes.

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

