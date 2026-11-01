Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561291;
	b=QFZSqOtVOOCryQOi68AVtwyg1Ek/7BLe40e+i0k19RzmSZOS6Spcp4ait2ywKUQRwwes
	 +U9H8X628td2GYn4elXyMKJHSr0TqWPqSuNutSAbt8TluIp180rAnlaTse9zKK7nYnrMr
	 h0hj/3h0zZMkISnsFNcIyXeXmRHcx3lydX5IIAESL9WrtPY0c0p4hGyd2ytBxcQh2UF7n
	 /IcLGJGqrCIZmrYmZ2MGjYSgfwMWhGSRXjebYoZmUuKRy0/5sE2v+N70g7yeao1fau6Yg
	 uD7oSLKL01LTTGqUijUNZJUW+Y60blvwOEbHhdlJ1AJy25SRlQA05E2eXUi4iljWYmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
	b=rFiWk24vxunBOmA81mp77UMiQUPupmrcEx0wS08/HSWqkI5CaVA+yNk//wuE42GhnWW1
	 VO52nEGHSwdzoNvpXVgj1UuBYcUub83dPnlXU83aU7llwXTG2Cs+rtZuHE8WJTleWbzqm
	 Uz/zu5h5ARwqpm02uCOtjO5n9AhvmusNgFlGoJ7yH33h8xpg00btbHxAYkJx2OsMANnZF
	 5iQouNh4T5baeIjC93iDpfp+f8T9kGJxEW4+RAmnpgGfmOzRCpGoGk0GZn56af4rqCdNc
	 U5BdxBQwGRT38m3+n/Ytd8OiJcdxqViXtMWEpEUJ7fOLRn2ZHgfRT/EvJ6c4gsF9IOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iu5NFwRt;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E29E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iu5NFwRt
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ac8a2ac52bso25328527b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561290; x=1794166090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=iu5NFwRtmJYrFvn9JNU/9uakhYFdVOgLX3iENODjW3PRn7MxLmuhkjz4RSgPlaQknN
         Hnf7aGqHK3Ae5vmg7/yO2zpjArV09GY3Wm3mnuhMqsPgydPRs0NolFhRo4sfZ/b3iRsH
         PHAWt3Qj8oAiIpyE3bzbMAT9ettQL4YyqU7RsUI8p2DlROgS8MOxdSGMW74AK/yZFJQ6
         xjIw+LspWHK6Y9lhOTlvgz77Y/8V7xEDZEJlCRXOHYoGH0JgAl+rQPf0rSqRV81UkDbh
         4zZw5rkOwSwbxp1MfePfrdBXKx601wAdn9nflCrdT06raeBHcOJyyBlJxLOoL/WmrRJE
         oAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561290; x=1794166090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=VNfEOCMSrnKAXRTe9Ibc8U2ymSK2hs9eLJjOMLCizyyxuQRqlh63RgzFTY6VGwL3L4
         DpCf/1o9CRRe4o8piMc0SYwtPwQw8MF0ySmhFZhSiTl2KdwwroND+6ENhvqP+/oRpnzq
         OvdzVqdElyOJgkpnpTilr1NIUgTiLgl0S1bHRm1JMk9g8P6C++ape/DS0DRwc6qjMRdx
         BLa4lgVHFTBfS6GPJbCad748wB3ylxQmsMiV4z0dRnCSGvBSG6d7VHcwbuIa6NXFO0Jc
         3b7CXJCR8N9mXjRHHRSzVq35qcFRVThklMppenZ0xQi9P4Vllz+DkuA2HxVs1hZf7MXZ
         86Ig==
X-Forwarded-Encrypted: i=1; AKwUvByVPZqHPKgR3DbgGT2FlIxs1W+gToPJqUvoxHxRRiUrWCCGdamrIrquscR6lDzOBNfNj6hsgxdmskhkk3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dv0ZLzE/A4OMh9MkN5sGbgai7LCGUaV+JaGFjRCg9KF+EogFr
	6qqAUZm5RiHlKyCqTBBYLKlYwqNDgpaUkPwDxGfHTRm6DQG4DRsqEVpZ
X-Gm-Gg: AYBFou0TPQ9kEorizUdK3AUz58Hn4K9z0n/JAeOjfoz6zUoGOoSmrJfAi6GxObAUgJo
	qgzBqu9DnW5xiHk1x5HUYVci7EbpqJYznoYiORUW/BpOcie1lbDW7e3KxcYkA01yWB13/h83Hic
	u0s5PXHa/0C7nIKzpzqoN5ncGdATlNQYmsg6k9aHjgwn2H45AeYqgN0359aK77hc8preXQiR/zk
	AhOFnkHEd/4s6ZCYEOfLFpmUgOwLr8u0aQ20Ypmed2nF9dH7eZTGc/0ss+/+MVPh5aFakBDe1ou
	UmFGlFxR9xan9Xpmr08OWi3V0SL5K1BUOrNuwxpx29/BjdRvTs6xvHQLPZDbAvq4iC7ifcPS2Af
	lcQIdWFjT89ckojIbTBS0oSJQaRk+bxvYUpRnK/YJjGq79UUQQutyVQUeeaoKzFgWt9dxmugt5n
	nTn+lNOCMTb1oDrfOwvOO0TrzWmxs62T7J0UqVfe0ZsE6ienY9BEJcWyDoF6FBzTjY9QCdMwweJ
	vB6tG9LBF0RFSfkS14rLwiKloofiDUeAX2cI/HhdG5FghRM1++XyvJvLR/rjgmAio9xbiSp21tK
	IraBmQNrSYzdq96PVHNIPuMGAMKg5P5gQVdeL7ff8PmTv4KooarJG+omXTPDvIMQ4HqF/ThQ5Yc
	C+1wJ+H/m0A==
X-Received: by 2002:a05:690c:c4e3:b0:8b0:cdf4:94ae with SMTP id 00721157ae682-8b2b65ade50mr58685557b3.3.1793561290282;
        Sun, 01 Nov 2026 11:28:10 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b719d2d5sm39894247b3.40.2026.11.01.11.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:28:09 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 01 Nov 2026 14:28:05 -0500
Subject: [PATCH v3 2/7] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261101-alpha-profileme-v3-2-92d511b5a044@gmail.com>
References: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
In-Reply-To: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>, 
 Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=nsB8jInGhmdIwF4AteMUmNQCWwgxX1qv6DhmPNtskC4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeTzp6dmHz8k+MMTLrM16lTFlSqpJt2qJUWqzh+rNpb
 sB6Lpv7HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNN1jtGhncnG2dvu8
 LC+/31roxt6pf/BS7d7Fwwf/GdHbW7Vrk8S/3E8D9t6QTuY5HLdU6c5erhW7php+W9v1+rvwkUN
 Pd52Ncer+EDAA==
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

