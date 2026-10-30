Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333047;
	b=tlEod5KetvryvhhXOcY7QgV1gXuiuYi3JcTUgFFGykeCYBu1sz+07t7Xa8EdXqJsawV+
	 7dibQkS7If71ozfxdb9l4hnHNy+PxlNhXQ4jbSFbPUCwUP2qQFq7BJSGV3KxNb6oDQIKM
	 dwE/o7ezr0ifEX/NVcixWdwhAsHzR8Lnh/tzJnnjhPT8vk5A+xPbOiVE5Tjmvp79SVMwX
	 C6iB+s6pADhcZoxh69PirluS+nTJ4floEzAl0TB8YMw5/ypWTsrGxs4gzsWQQ/DFQWTOR
	 BrLJ5i+WAtz/7R6NZMlgapPA2i61O5ZfbOumCh2XF85Vdq9E9qsVq3+L4VhL4IjsHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
	b=LGkQUdksF60tvbzEs0nbv/sBha81iSGGCKelyMVbbe9msW6j6VuzRBykyZXPHcjqA/S5
	 /XuaG2Oh5eofK1xnpdCqWSYnSI6GT0JGoCgW6cevD2dneenRG0WgjkxfCBgQwrojdiejK
	 B2w8Z6f/d3ThxYsb8woiPX6eL7ooEBU38L02eRxZm822Q9E8NzaRo78sTbcY8KC1ODabj
	 yeBaxfYhhvcMjWr1HtVwdpaLImcHkBDg3hoZcNrg9MS5KYJ9g8rPrKuq3HSYPGWcM6dZh
	 mJy2/XXzKPz7X+UxFt0kyWfA8MW6K0Zz3YVljbqkLxiy17qlTM3Qr03KXAwtGgFtXIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9Q+e2bd;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB3606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DB3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9Q+e2bd
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798eb0d13fso221887d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333046; x=1793937846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=z9Q+e2bdVF1oOGa/Lj/sMU5hnxveiPBPIaoeBiGBdpaFr8uyw5G5Hwbvt7ZfTjcaN8
         niaGrbZIseIox+EkrmhSRwv6Zq1stHhm/jZ1bbyxNikypnXFPpHbgMmJfx5GI8zTbN6D
         lYI9b1x0Kn3tuVEnHJ4VkkCjHmYdVThbYSVkzv1l4nZ/K6d0L8PBVJs4+5fC9jpGgR9+
         gHh35jtiYtl9Qer459PljTiOa2YP2JMEVkq8Rx9mXZAWCFWi1fuqzD0NRwhAqkjoc8ed
         VzzUjQzt+45z++8ev6SMWQzjonir7EnEk/EG9igOGBSjUcLgiu6Wk2gIRnyzX103nZtY
         RvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333046; x=1793937846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=OjqlY4ZOQdTw+lDFlBSpRyJRTfcwtONyRYJl/Xplz1oeSxjhSkhSGeI3Ggc3QnnHIg
         THel5KVXdrAaj4z5InE7hE7lEjJTzOYUJOsZY6Q+aeyROflG4e8KshcRy8E5Ei3ah+4Q
         oQ/xlCBoJDPy8xGyoH4pEgvJr3ZnVR4nDJr9ob5QBXyrKPocVlXIyYLjHIcKSXc5IC1Z
         nivwPaQdxUhssMWBjQ3ib5emf/OPGQLmvtq6twybUjt7hgcnoJlJHbckZVKH+tH5f636
         XTmeAT3+GncSwRyYLVBmF80kqhDxxB8kHldOTxOz9OqKwBIB7z0ox31NS4rTYnjwekmu
         GNrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM1tUEL75t+GWhzlQTNauFXATms1KCC5aHoymAUFO90DA6gEqSG1yWm77oBcfA8Kx5fUyeZbkysmfnC5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5M21ufh4PDlvyVwd7CihktxeVKpAzH3RUYn5Sv7YOLfXIGhWh
	DRT2Rm2KVo0UfOYTEdwRFAqgdZot6YAyOaIgpEeotAjMM+3gkvIfAEo+
X-Gm-Gg: AYBFou1U1SN/UPRhte6zP4agpNXYeeplL+xB59FArIftKsZSe/lofivylVXu41205C+
	iUHJr89B6We7ubLWZYl/dYO+zPrk4ZwuDhIpHExdfNFDoYzbfqSmqG0Ak8GDt6yvuR0+L7F0gid
	wiPQct+YTje73ed5qO4zpBGpThBoTeIyPU27lphVS+XjS/MVzTrkpmZICrU6R1eQ9gZ8DDze3E1
	sBmmNLqaq+U1HGfPivrPYRDpqEG33Fu+cEObyd2UczitqAIbKvQ+Iad4VlG4GpoEm3g85MGRGAk
	tN+g0Nc1tNAxP+98u9PfYdBzpC0XwkcM2xKt0NPVdc9cS/DudpNkvjO0XcXFHmEpa7cZkSu7GEx
	pwAl183O6iNbwW4e92H2Pzub4jWAV4J0BTETwESv/2QawtqAyH+G5UIZX4K/NJktly9U0MDiO2W
	zJwGPp+gZIf/DfzBR5JJGB/RdSmgOEzn3plLTERJbNQocwPVOHnMtwGfvWncR/takjrNHk8Lsc1
	LDMv2c6X0YEZUZeB+eyEQxdSrfZYZlkgPq1Qlwg4IyEYkwd9p9mKyTX5AatSBtKXgV3m4sgkpMS
	eApXPpOlQOtCtgQWSAQ1gTbNayKy1rVFH7sOjf8O4nX2L2JV8TU2h7bOkhqCOm/oOB8z7dUFyNC
	gd8LJ3WmQQw==
X-Received: by 2002:a05:690e:4553:20b0:679:b69a:99c4 with SMTP id 956f58d0204a3-67ba4c90a51mr451158d50.9.1793333045725;
        Thu, 29 Oct 2026 21:04:05 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba74e8dacsm320747d50.10.2026.10.29.21.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:05 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:00 -0400
Subject: [PATCH v2 2/5] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=aXohGVuQ+3QGlwkw4lcu5MBGEFw0RN4GyCwS/v4JVPY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOtbz9hurFbKEjH1qaqb4AoJEd8s3+nXBVetnPcs3
 6kmcN2qjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmAw8jw7Q1x6Kz9k
 092Jq4v19XvP+pDVMG6yLp6n8JXxhjNjBx1jL8ZmvZtPG9/YEpsazTtPVcQzROlcSztt1cnVcw/
 UCC+oTvnAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Signed-off-by: Matt Turner <mattst88@gmail.com>
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

