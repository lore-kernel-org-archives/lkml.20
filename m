Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845787;
	b=ZRHWSLE16Np8krier6nNHpclCrYcp9KmH3I9n3coGm6AroKdKpmiaxyj4t2aH8TlzQCX
	 aH6ts2X7YsvXO9TVamUz/Ea9wuPGJHARcQBSKOXv7VCitDwVuDYvnU9la7dL8BUV/ZUaO
	 rsuqaroanzwaKuKmXPvL4vdJppgxv7jtXCHMto9aoNlUfmg1EaYTQgmT4XRrS1FLbLaPp
	 pPGyo1MDsHo3NUDF7xrJtzUVkNMJspJB+3rVd0zcF/fSm537xpB/PPM2KN3wyAh9Sqt5M
	 pi4FIUIymnESBQWfkDiDySGhgGgMB1VLpZHgqCNDrdyu4OdZzVpbDyfZTTfRx3LAjYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5YtDDGJxyuTLxuAdCwsqnBgJ1LDLM9O0z36Fv2crXno=;
	b=C431fEc0hYsuNltJdbE8QJ1LVnzOmCojgqW6ZTCuLpOwb0B4Dh6kNhJlVIiY4AX47RH2
	 pFi8gpDxcQE+hPbRy/mkthVWTk6Q7wAdpqqV3r9w3ijTjhwZNyMigUJyhH77U/xJLjp+E
	 7910o2zioReaEAEoFDf3oyJejDZ5jOzoOmQXPmSad6ckToXjnqc8P80oS2kXu6JdLzbwv
	 iKP2RJTHL1tJ1baIe9PwJqtm2uev811T3am/xG7BMiKAKedrFL6YJLQcfzP0gU95ItWVt
	 qT9ziSNXBMSshXLFJ+rHpIbEQNz+zBn2zKzmEMZiyZg4o65kc4c7AVG8Bfm3tgsZKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDJhFsg3;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009B606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C009B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDJhFsg3
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so4993419c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845786; x=1795450586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5YtDDGJxyuTLxuAdCwsqnBgJ1LDLM9O0z36Fv2crXno=;
        b=sDJhFsg3Ow51HVVTfk5kxCeoiIRdfetLN+yxv14AMJXb8YB2PPyS7zhlqIjni+DBmB
         YemN0DETseFHw/mOGtKtaRzMIsybSmpW4TUEjkKYj9gbYbYfngIyHfDiTpLWNxzHo3LV
         F91pa4Tfj6KQHqOjJqwUBbeAn5wFAHIyrpQLD/j4PmPhWHjqb2q1vlBNG/C9IVjv2Owy
         Hmm9GETHCHwqtRQGOlNQ37IHs9jEVMqV9xu+TZdARXWZT7TK2LkbdUaVBpTJ50jmTvVt
         iViidLjTs+j0I8aEo/FDJflLBDYiPBKvuNpj1jVmf/+Mf+UB2TGO+E9gm0BG+tuTOI5h
         SOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845786; x=1795450586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5YtDDGJxyuTLxuAdCwsqnBgJ1LDLM9O0z36Fv2crXno=;
        b=LsnUumn/3d5zzQP6n5j4eX3cU+I9iMhB77zRDQ11jEpuFClovhRcD7X/N1urhyl8T5
         rVPsyhJkItpzCwoI0WbpzpDt5Ate+GGSJhBvojIaho9tRH/96za0fANu3TRnXl3dR9Ub
         esySqiKOYzmsxnt0OZ/uQvPT+iS+2qP0b8xPMteaRTr/YTJmssu2AuxFRxYZalZ9IOFX
         vGAuWU7cnpcSGzOsOjnbCb5zhfENFrKLc45v781Uqf3X7fTkn4zJNlFZ1+WCAPoPAhdn
         CPWksSGjX7AbVSmK2ya96Q+avNOkH1Ev6Jt7vr2OHtMUQt4/+TT9xXz37gLeZB+J7QFr
         w2WA==
X-Forwarded-Encrypted: i=1; AL+hErFEZ5iQMajtoGedZPpsXtZenBcDrRdPCVX3poBp3uCpJxNWlGH9PKKkGchRYuDYTOOuPBSayUwDpBafEjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FNMbROqDjAhiQn4G9IcqWKJn8+w+OnNpe/dsIlfj/Q6HZLPI8
	G8X8CLCi+BRgiRfoFRPqmuhBjqHGOAZoWaQJJpCD90XlNF/ULdV0OOlMw+I4rg==
X-Gm-Gg: AYBFou2GEcSr//fn8AZmwraDIaF3u8OP78rtWCccitCibjIa11gdSm5/NWxB0oOlyS8
	XtnCjeCeTe5YGh4Tel0neoMweJh+mZEFXqvYWvVoIoSj/kiXJT8xJHYbtkzZmO8as/e8Ufvacig
	Vx1G5+RReCX9O0qa6SKqvHMg/AZQZLzqIt/nzQkMSdqd2ZXGlrZKw+WQj+3+DKUNMj/qB+wdHU9
	cIxoWo6JOsKeyiS9V22XEOiPEJXiZeLKfgizzhOzIhP2mK1wutJ771QYw+y9WzRF9DeJ93c7srR
	M/660Cy7jjYbrezDY1ES7pW6AiSyaI+7dBCNyC8vmnITHhZLsf/t/C57ZxvsSe5PgwhGBJ6rWP/
	NfPdRiOYn2iZyKMrsCZP5R5m+oyAebqjtlG8EVS3AVKGWJw2A3BMEkKHbQIEBvlcVsMkE5WJnUu
	GqlNcJTzwpsXNd7ystb6HysmF9cu8J0cAMG1YajP5pMPJio+GHcPKVL+d46/ertlv1MAle3otQD
	Xpd1hzoVMeRNK4E+L8W5JT9mbgecgAhRSAAGZfsR9ONrb2C3FBGk6z9ULEDVxZE+H6zLZIk1gjQ
	/D8Qgs9adu/iiE0F48nwtZ+dI8plbh+SDnce7Kykwjk0QiqPfa5v
X-Received: by 2002:a05:7022:f4e:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b5030ee522mr8876627c88.36.1794845785575;
        Mon, 16 Nov 2026 08:16:25 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm46478476c88.9.2026.11.16.08.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:16:23 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: Dmitry Monakhov <dmonakhov@openvz.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fault-inject: fix wrong unit of verbose_ratelimit_interval_ms
Date: Tue, 17 Nov 2026 01:16:12 +0900
Message-ID: <20261116161613.3663822-1-ekffu200098@gmail.com>
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

The interval of ratelimit_state is in jiffies. But
verbose_ratelimit_interval_ms is read and written without converting
the interval, so the value is in milliseconds only if HZ is 1000.

If HZ is 250, writing 1000 sets the interval to 4 seconds.

So use jiffies_to_msecs() and msecs_to_jiffies() when reading and
writing. Also clamp values which are too large for the interval.

Fixes: 6adc4a22f20b ("fault-inject: add ratelimit option")
Fixes: 4668c7a2940d ("fault-inject: allow configuration via configfs")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 lib/fault-inject.c | 58 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index 599bd06fe453..537a5bc89da1 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -199,6 +199,8 @@ bool should_fail(struct fault_attr *attr, ssize_t size)
 }
 EXPORT_SYMBOL_GPL(should_fail);
 
+#define FAULT_RATELIMIT_INTERVAL_MAX_MS	(INT_MAX / DIV_ROUND_UP(HZ, MSEC_PER_SEC))
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 
 static int debugfs_ul_set(void *data, u64 val)
@@ -221,6 +223,29 @@ static void debugfs_create_ul(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, value, &fops_ul);
 }
 
+static int debugfs_ratelimit_interval_set(void *data, u64 val)
+{
+	val = min_t(u64, val, FAULT_RATELIMIT_INTERVAL_MAX_MS);
+	*(int *)data = msecs_to_jiffies(val);
+
+	return 0;
+}
+
+static int debugfs_ratelimit_interval_get(void *data, u64 *val)
+{
+	*val = jiffies_to_msecs(*(int *)data);
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_ratelimit_interval, debugfs_ratelimit_interval_get,
+			debugfs_ratelimit_interval_set, "%llu\n");
+
+static void debugfs_create_ratelimit_interval(const char *name, umode_t mode,
+					      struct dentry *parent, int *value)
+{
+	debugfs_create_file(name, mode, parent, value, &fops_ratelimit_interval);
+}
+
 #ifdef CONFIG_FAULT_INJECTION_STACKTRACE_FILTER
 
 static int debugfs_stacktrace_depth_set(void *data, u64 val)
@@ -260,8 +285,8 @@ struct dentry *fault_create_debugfs_attr(const char *name,
 	debugfs_create_atomic_t("times", mode, dir, &attr->times);
 	debugfs_create_atomic_t("space", mode, dir, &attr->space);
 	debugfs_create_ul("verbose", mode, dir, &attr->verbose);
-	debugfs_create_u32("verbose_ratelimit_interval_ms", mode, dir,
-			   &attr->ratelimit_state.interval);
+	debugfs_create_ratelimit_interval("verbose_ratelimit_interval_ms", mode,
+					  dir, &attr->ratelimit_state.interval);
 	debugfs_create_u32("verbose_ratelimit_burst", mode, dir,
 			   &attr->ratelimit_state.burst);
 	debugfs_create_bool("task-filter", mode, dir, &attr->task_filter);
@@ -394,12 +419,37 @@ FAULT_CONFIGFS_ATTR(interval, ulong);
 FAULT_CONFIGFS_ATTR(times, atomic_t);
 FAULT_CONFIGFS_ATTR(space, atomic_t);
 FAULT_CONFIGFS_ATTR(verbose, ulong);
-FAULT_CONFIGFS_ATTR_NAMED(ratelimit_interval, "verbose_ratelimit_interval_ms",
-		ratelimit_state.interval, uint);
 FAULT_CONFIGFS_ATTR_NAMED(ratelimit_burst, "verbose_ratelimit_burst",
 		ratelimit_state.burst, uint);
 FAULT_CONFIGFS_ATTR_NAMED(task_filter, "task-filter", task_filter, bool);
 
+static ssize_t fault_ratelimit_interval_show(struct config_item *item, char *page)
+{
+	struct fault_config *config = to_fault_config(item);
+	unsigned int msecs = jiffies_to_msecs(config->attr.ratelimit_state.interval);
+
+	return fault_uint_attr_show(msecs, page);
+}
+
+static ssize_t fault_ratelimit_interval_store(struct config_item *item, const char *page,
+		size_t count)
+{
+	struct fault_config *config = to_fault_config(item);
+	unsigned int msecs;
+	int result;
+
+	result = kstrtouint(page, 0, &msecs);
+	if (result < 0)
+		return result;
+
+	msecs = min_t(unsigned int, msecs, FAULT_RATELIMIT_INTERVAL_MAX_MS);
+	config->attr.ratelimit_state.interval = msecs_to_jiffies(msecs);
+
+	return count;
+}
+
+CONFIGFS_ATTR_NAMED(fault_, ratelimit_interval, "verbose_ratelimit_interval_ms");
+
 #ifdef CONFIG_FAULT_INJECTION_STACKTRACE_FILTER
 
 static ssize_t fault_stacktrace_depth_show(struct config_item *item, char *page)

base-commit: dae384286c2852ba130604ccbd1bf5d9f732bd78
-- 
2.53.0

