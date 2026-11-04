Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818173;
	b=34lnXeaHVHUhVKgjsc5D2IHXUtQSSe8rfLUsPm3rQr0xt2NwL7iSsRyZRxjA7QGGL0b+
	 rTKfTQzc6WplKJ7Y7Er/PBl3H1unvenoa6xPpTJwJ0OCbi2kT5BAtnSJuhAbUUOeePh/L
	 VMDWQe6cCyIDrAksb/3HgvlgfYOiBAVvSMCqud1c4iZTp6XD6w+8kvL9lsi2YvxF8iX7m
	 fFc/Wi0zHzbMv54s9urTkitQcaorLB5Rfk+/lqkQvEj4umSW/QPeRzy5lqL2KG+kJtl7w
	 oTd8baWvFFaXLUVu+sClyU843VXxIoTfNXkSP8ESF1arladvJXIjCbj4WekJl5t1aSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
	b=oeI8i7KWAxjKnF9+0aApNsKaqvvByn2yJ+vaRqMX9LZ6TEkWAEdWmNUFBjCNFCUEtt0l
	 QI8To7gVsZ/GGmZWSb6dpz9euc8KkWbXxcUjZr/s/p4pjZdiF5ghZDT6XxMRJqRsqqqak
	 Rm9dCYJ5CGKN2FEF9M/6HpXFMYhhq2t/NVM1VFlKUfKFSl9vOJgH8daXoLztXrJOmVCKt
	 rh87EXbc8sjDoVdL00nvfGqnO9pZ1W+35bqSpq7AZCCJ4IjeVvU4Nbg3RxW0Pc2CFwgFa
	 6vE9NP/BmlLjl7kdvhkBMDqD6dDX20PwWeQKizdjwYm9oustM4rUSvBceYKggcpOtqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nse9iesL;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A76608362C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A76608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nse9iesL
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d63f60bcso15297887b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818172; x=1794422972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
        b=nse9iesLNcVnO666FJ0bxh8JLaR/ys5aAbkHom8NtlJn6dsf4IpAS01l3fzN8K+eX8
         sIw88vVZs6o4YGVUQe37AeOEXsjJFQj8Yt3KYqGv0pzE4o0TEHKLlHPMiAt7+WSY98hh
         Buo5kucR2J4eKjt1iN650FP7F03g68r/hsQ2kBWyddXOds4gITB8qIfwGjsjuETedZXP
         vofMBzf/3BjBZooJAwju+KzKxGzAazBL5mzY2wQSnTGPdOixF9FWIWFUMvu9nUWbXEE5
         jv2F6NQO+cIcLIH7SOd2JBzcDrv8slh0yU3QD61ddVSsiCzNVtF10GbPh8VQ0aGgTwaY
         wkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818172; x=1794422972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yRFzoSASbTaPFKGmXJ3DuxTiEoC5V7x+OkyMhZfPEw=;
        b=oc45dRelpU/U+Fu446q4+SDspA9DjPcQg5e+Owh3Jq1lZK9wD6sS2jx16W7VxPwHDo
         UT1ruDx7re5WUWvwwujRd5XHedbVKsqjyOb1VPzGWMj8snLMRjiG14uJHilweNLmm0o7
         xEzAHkB4Hat+g0exLNVQSc5ZMo7o1x2V7V1cG4baN+flQwSlnCn6UvECukiSM2RXBfdv
         TvQQ/urjkgGAkvpbSg8sg8+OE1zQ/3D7JeGgbrlh+PGRsFyuUxx17k589P/CQSkw3dNb
         0RNg7U79GLblq+ifpMibtnTNBcys+NfpAiC+HUBnjejffz3XvOHKkcI6Wrlmt2FakM7F
         n7fg==
X-Forwarded-Encrypted: i=1; AKwUvBx6BtbG5Pz4zfLdcXjj5xkAcmEsh5wDXKJfBRXcEklNqzrHrDQajRDwien/4WEW+KRhUoyZY9Nr/EbrgI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bijXLgBrl4fmkkbu8wsUkX1zk7ojAPw1O+DenlDEdge5LtcxJ
	x2ZBkvgI3mr9lHbugeyC6wd4raFx5InZzaRCaLJxkJ/OquqKgWmRR+JL5RoO4Q==
X-Gm-Gg: AYBFou3QKgH2KvpNIRqwJa7w8VAWx6bUJYxg6jqz1ZbpccFpANvsk2bT0Qwxc5f6Gvt
	NzxWWjp94biAQY/30loM5MCWiZsJii5anWGC7SEOX4Vh+7EPqCADial477lofhlLbAzFtSKgABh
	4X2v4LswzBKsJY5cR0ODKng5L9NrhbHz6Dkf0fO1V/a2uNoDPOb7AhKBT2q0SUfLlCNG0vzYC7l
	Svue8RuPfemvI/5XODduLn9t3+gxwIBcOXeMsp1PqljgCaKVV91Zx5Kz6TcJgWOvoydFNfNwO+B
	4BxKRN9HQlzDKcT4raLliIVhD53kpI9ZBySZArHk73n4vCQ0+x+C3nrXf4EBB6bJJoAp/9GmRyt
	NOgmlg7AJYGzdXnGF6kGZGtRTWpG4Cuu3Hhc2F347myYOqf4FW9/kAG1Wti6/nW+6EEZFxC2gqF
	g+c5TuXzSu2hDFDmh43PoFVyT+N0ONVhDNdmW5I9aHQSDC+bz59f0/iKEXLE+NzLHU/tL6Y65Uo
	WOzExOBVI3rPZU5fOZt1q6LHAskl0ZZIGQQiUDqS3dDPjGZbFz/pfeyBvSLem1+YUXW914cwDuh
	pjthOyhDV5xT7NxyPynJyLwP+cSzu6MaqfgiZQEUMIEo1a/IRKtLlxXaUnSqxFBzoRa588Szluw
	5luj76cLmo9o=
X-Received: by 2002:a05:690c:6609:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b2b6769adamr130667497b3.49.1793818171822;
        Wed, 04 Nov 2026 10:49:31 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309959603sm24730847b3.24.2026.11.04.10.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:31 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:20 -0500
Subject: [PATCH v6 13/13] alpha/perf: honor exclude_user and exclude_kernel
 for ProfileMe events
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5F+ywxZShd6lL0yYM9T6SyVwg0AsZTHmRlFxszcsIno=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16kK3Kr3yL7459zDS9EGPMxcznddNwi8+9B/8NNU8
 /PxDducOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa79sY/oqeSAzVZv
 sy91e3jtKBC14HZ9reUzP58djGJrZI2+X5Lx2Gf4b1q9lfxO7wcL/w+MXTcGVO2ZA95Z5T53d9e
 2tc29hdwQ0A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The PMU sets PERF_PMU_CAP_NO_EXCLUDE, as the counters count in every
mode. perf record then fails for unprivileged users: at the default
perf_event_paranoid of 2, the tool sets exclude_kernel for them.

A ProfileMe sample says which mode the profiled instruction ran in, so
the excluded samples can be dropped, as AMD IBS does with swfilt. Do
that for ProfileMe events, counting PALmode as kernel, and ignore
exclude_hv, as there is no hypervisor. A sample that falls back to the
interrupted PC is dropped if either its PC or the profiled instruction
is in an excluded mode. Aggregate events cannot tell, so event_init
now rejects their exclude bits itself, along with exclude_idle,
exclude_guest and exclude_host for all events.

The event count, and what PCTR1 counted during a window, still include
the excluded modes, as they do for IBS.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 47 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 7e34eac0ea47..c75d204076fa 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -832,6 +832,18 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	/*
+	 * The counters count in every mode, but ProfileMe samples say which
+	 * mode the profiled instruction ran in, so those that are excluded can
+	 * be dropped. PALmode counts as kernel, and exclude_hv is ignored, as
+	 * there is no hypervisor.
+	 */
+	if (attr->exclude_idle || attr->exclude_guest || attr->exclude_host)
+		return -EINVAL;
+	if (!profileme &&
+	    (attr->exclude_user || attr->exclude_kernel || attr->exclude_hv))
+		return -EINVAL;
+
 	if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
 		return -EINVAL;
 	if (attr->config1 && !profileme)
@@ -983,7 +995,6 @@ static struct pmu pmu = {
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
 	.attr_groups	= ev67_attr_groups,
-	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 
@@ -1140,6 +1151,24 @@ static u64 alpha_profileme_status(unsigned long i_stat,
 	return status;
 }
 
+/*
+ * Whether exclude_user or exclude_kernel rules out a sample of the profiled
+ * instruction at pmpc, reported at pc. A PALmode PMPC counts as kernel. The
+ * two differ only when the sample falls back to the interrupted PC, and
+ * such a sample is then dropped if either mode is excluded.
+ */
+static bool alpha_profileme_excluded(struct perf_event *event,
+				     unsigned long pmpc, unsigned long pc)
+{
+	bool pm_user = !(pmpc & EV67_PMPC_PAL) &&
+		       (pmpc & EV67_PMPC_PC_MASK) < TASK_SIZE;
+	bool user = pc < TASK_SIZE;
+
+	if (event->attr.exclude_user && (pm_user || user))
+		return true;
+	return event->attr.exclude_kernel && !(pm_user && user);
+}
+
 /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
 static u64 alpha_profileme_mem_op(unsigned long pc)
 {
@@ -1250,14 +1279,6 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		local64_add(ovr, &hwc->period_left);
 	}
 
-	/* A dropped sample still counts, for throttling and frequency mode. */
-	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
-	    hwc->config) {
-		if (alpha_perf_event_set_period(event, hwc, 0))
-			perf_event_account_interrupt(event);
-		return;
-	}
-
 	/*
 	 * Attribute the sample to the profiled instruction rather than to
 	 * wherever the interrupt landed. perf takes the sample's mode,
@@ -1303,6 +1324,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		memset(pm_regs, 0, sizeof(*pm_regs));
 	}
 
+	/* A dropped sample still counts, for throttling and frequency mode. */
+	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
+	    hwc->config || alpha_profileme_excluded(event, pmpc, pc)) {
+		if (alpha_perf_event_set_period(event, hwc, 0))
+			perf_event_account_interrupt(event);
+		return;
+	}
+
 	perf_sample_data_init(&data, 0, hwc->last_period);
 	if (pc_only)
 		alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_USER |

-- 
2.55.0

