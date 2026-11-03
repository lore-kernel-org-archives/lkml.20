Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738262;
	b=Wca6HlAkwpkgt0OeMPlFsePBYwX4xI4mLoc8TQJ1FQIjppuXqW3ozm3BfXRYP+hbdzP9
	 U3Vl3+Z6QYnW1LRvTKNwC7g8p46747AWFE8d39ocPwZJZFxhx/TcKNjGS/M2BCMSd5IFC
	 nZwyX415+vbzJ/MbaSAhKyUnh/vMdlhO2CeEFZ79PEhP6BH4Jfl/dlCnzJSj+qRCinCKF
	 Qi9TrdwDYW3hMVxgH/rjhws6SbCRN669w5635pI0vJ9ImEbeXrNsVWpWAojUJwDQASggc
	 Y3CWY+VJrEz75Vbrm/GnyU55JVMDB6WbkkRhzNyv2mB2IFMdghrXiL9rYY8B5FsHHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
	b=ZkCPNHasCh8zkDVUS0gM5UfaR68UYtQ9K1ERGGtltxOrZSGcLuNsF5/WyvKpD8yTvIYJ
	 36pkGFxc91ckkv6MQ33qatvMD0AADRExpibG772XCdUKr9z3DNN0XYcMSyu5ehsUnbJAz
	 ec6Zsa8Nrh0zaKNbd98JoMZd83O8rS4/7yGT4DdfeEqV7Yc8Zb3mneGTHN2DN4Mv00pb1
	 q9bsdMM25lPKHkfKw8OxLAotdFZz0CngOwxs7jjbSLFdTB2YZLf1rVbjVDarqsEFFv0dC
	 6SRIu0LmApm8+Ht/r72qUqV/V8rgCkvpYiZ7U3CpwrJRRy9a0rs8Ozp3s0mMRA8HGJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGcRxCyy;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89E606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E89E606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGcRxCyy
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0d126f631so38737b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738261; x=1794343061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=QGcRxCyyZavan20f5rvxAWpjP5dMO+edega1ZNvy0t3r2u7NIHu4hCiIjT8Iem2wal
         DrDLn1GPE9cxjl1ACYPPWmDIVAnJ/Kwn5FoXkh3Sivz9cIKfrVEGKPOoO+h8chJxBaxD
         dwm4zF9hNBNw1beGJ+46KGxTB8oXtXr7dOsFQL4tkkZMlrrHpWBglnJJwYVD7Hzwa6ia
         BOISDIbw0tP3NloioPoXBFLgvSieDVKzKlmVHdtZ5rgtR2ZWZnJ5hYcuRQJ0rUz7sbyF
         cOitetx4j0n4K1ZDoxoplXZDCC2B334+8zo+zSh2oRaPYDCf2ovOYeIMT8fwjLPRWjw8
         7o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738261; x=1794343061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=mg2XbnkB1AcSJzifONvMiQlMA+79YxOdPB/rqxt/6A1ogcB60y09bJEV0ed5/2nP2r
         HKpcLFKNuGJMiKLxvMW/5rK6Xpv/EKjK7t2WaWdC7zxTSJN1Kjy6GBOFu3k8lForx50w
         lupBGx2tN0uSpq6nR6tCjzmZGZRhHSj4jnIslMD2e6U0K80jHp8zRscBqpOUMGByIAfQ
         DXlmHLvnZXDI2Bx9Y3V0SRO+31UIMR3RevEV1ZmcxdXOWc8IPeNX7ToHtBZaIsH7iMie
         tSc0MrU9t3SpfcGU1ibkPm8B2dG5tEljCsgjOtCK56d6D/F/uDeSgxDjxGnpq9p7ox4P
         2vnw==
X-Forwarded-Encrypted: i=1; AKwUvBywaLUsfSER1gGQHZpzfBqhXATn3V9fmk8yj85llVUn62IVpj/AjdM+vqbgwuqD9oeYgyldNqr2JPwjq5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bWMnoBXwqEaFrqFgrzbnglpSNKLJ0aMDDE/tO3LNW8BZEFD6F
	Aok64cQx5gQQMKe0cgveYJ32VRZz/h1VUTBzKz3oF0u6kaVdTfvjI3e4
X-Gm-Gg: AYBFou1la8e3msCa/IAgvKyGr9pPwofZslzvGqJpUTD/Mp1aE75zcbj+EBBGBzs+yh1
	jSPyp256+eU+U4mRG3jQ3fbB97HbS8I+7XWtGoTJ8Prkk3V1vFh4Wdbc0UUNMV5HIpH4Wmc/enT
	/WcuKvbjKjDx/7f6E8adKW42b56igVQku7fcI2r+RLx2MS1vTSu1mJiBn5dtJCd6VdAJ1Wy288y
	sDI13EpZXaS74drFBBG5Z6MJW21qCzfk9ruNbr0A/edSZB8tD4rQCSFjYwJd7+bW5UvUdQ2Baxx
	pu9DaQoYITrlhe6B/uiOaCgcbihpr/9LDvp2pa1cqp315DPL7qOioQ/HzvP0fYGRAMT2os4owhj
	N0Ia7pyFdpmpSc7Rc9lMuQWKe2HGtduEeUT5mxB0DtBu/yY5ei/vJPsAnQNOv1Nfj8kQSOcdaXp
	OWMI9fwF1x9obYTc0FthXBkJmVYWzzDo+r9POVBUa4Ji58wzPmYKi1hhE+U+pqWn3zWrN+YCm8+
	1MZDj5D2Cclmcxnbwi/SIAbI9EZ2dQOtGMWDNV5DnHjhKYo3hcHk/GJRWZ7FQzgr2TcOy3cw8q4
	oOiZZl4hXHK5NL/wNJnM26ZIgZTyWCM1kZXrWSypT/diaTPVZk5r7KybC1XTjQrIBHkPTVfR9nL
	tmQ6x6GT7Qw==
X-Received: by 2002:a05:690c:39b:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b2b6597d22mr113291007b3.6.1793738260652;
        Tue, 03 Nov 2026 12:37:40 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30998fd95sm4601797b3.30.2026.11.03.12.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:35 -0500
Subject: [PATCH v5 02/11] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261103-alpha-profileme-v5-2-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=nsB8jInGhmdIwF4AteMUmNQCWwgxX1qv6DhmPNtskC4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufF5L/Q8LuHmx7eydXv/0fKX2qYbjnsVcGmLHfANr
 FY9rvip4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK6x3M/wvypuQv/Wg4
 Ef5p9yfV7uc0/XUSlE/GOXDevfvn1fevmOWTIy9DCzHZ++slxRee1H+/s1nXP1o4ymaEz7+WTWp
 DV7WBztuQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 2d9383425357..70840c05d39b 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -212,6 +212,44 @@ static int ev67_raw_event_valid(u64 config)
 };
 
 
+PMU_FORMAT_ATTR(event, "config:0-7");
+
+static struct attribute *ev67_format_attrs[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_format_group = {
+	.name = "format",
+	.attrs = ev67_format_attrs,
+};
+
+/* Values must match enum ev67_pmc_event_type. */
+PMU_EVENT_ATTR_STRING(cycles, ev67_event_cycles, "event=0x01");
+PMU_EVENT_ATTR_STRING(instructions, ev67_event_instructions, "event=0x02");
+PMU_EVENT_ATTR_STRING(bcache-misses, ev67_event_bcache_misses, "event=0x03");
+PMU_EVENT_ATTR_STRING(mbox-replay, ev67_event_mbox_replay, "event=0x04");
+
+static struct attribute *ev67_event_attrs[] = {
+	&ev67_event_cycles.attr.attr,
+	&ev67_event_instructions.attr.attr,
+	&ev67_event_bcache_misses.attr.attr,
+	&ev67_event_mbox_replay.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_events_group = {
+	.name = "events",
+	.attrs = ev67_event_attrs,
+};
+
+static const struct attribute_group *ev67_attr_groups[] = {
+	&ev67_format_group,
+	&ev67_events_group,
+	NULL,
+};
+
+
 static const struct alpha_pmu_t ev67_pmu = {
 	.event_map = ev67_perfmon_event_map,
 	.max_events = ARRAY_SIZE(ev67_perfmon_event_map),
@@ -761,6 +799,7 @@ static struct pmu pmu = {
 	.start		= alpha_pmu_start,
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
+	.attr_groups	= ev67_attr_groups,
 	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 

-- 
2.55.0

