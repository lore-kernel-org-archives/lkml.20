Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939452;
	b=qBTKP5MFsn5v1IE05Gunp4AoxJDSyPlEJ1sRq7uBkXv+gWafJT1/ogjTWgvML7xjxVoK
	 X/nk4wjL8ooxYXEj1D74K6Qip08hVIIOA4CKIUEeJ5T48ckJMLMq/dcSoDzWaQMpxGFS3
	 0I/nOC8V8AaXj580sNJZv98e6Yx3mUHgP0yAOnAgWiSsB+yXwstZ1SNOjswcayhLrH6O6
	 KB3B+lmsBtEIf0Q3LA1vHXD0/rH2X5QXocndgMYz17qeaaG8ctbzsgXiE9Sx/te7D5cH8
	 iQTt47hh5TD/OIzdwlZLk2imzFSvufW8rkuSBm8BJK2lx6hcPbR3SNTmE5OdAqd3kAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zCfYxQAheTWR5Y9HsIisj2LG7OC+BVkrgHxX7TuYPA0=;
	b=21gmD56Chr11GyL7jRa3v++ykLQ5N18bNWZQ4z4Q/exy1uMxaeGgjsCDOgzB02UHBD61
	 IXuyLiAgkg0Yt4igHNGmiF6gcBzr0jaIagMHkY8NHfWgzdCS+PWYRibEMwylnhFu9xpgq
	 0O+KelOmXcamgdLT/KCfA7RhrjjR7gtRchRl9/mGQXXja/I5QLM7I/ZE8CObMJjopyNZ/
	 CY4FSQpIOmAMrJNvw91wj7PPqyrO5NYoR4R9I4DFEcTtCihBFy8hCy10M/d66dadkmfya
	 zDTNgLMEwRsDAd3x3aD8UHdl7k4tbWEyCyKoXPF4ccTbofyYlBIEmrbiVUjln26PScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcDsm+VA;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31185606D816
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31185606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcDsm+VA
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso262672d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939448; x=1794544248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCfYxQAheTWR5Y9HsIisj2LG7OC+BVkrgHxX7TuYPA0=;
        b=vcDsm+VAacda4WMMIBvGmabG64SoZalKQ1ot9HyFp/FRSjTijhu1U6U+0GuDnL7Rjz
         qmEeCzdKWs+zmOir4jCtzPQOTFabNUFTSfv2GlROSW5Z1ARynIJopsd0PzLOjPA7CGlK
         dptD3Gu+dOVpMaouYydiptvIJjgeub+yw1cXbvbDGW85iL0v0ci7/2h8os84JR7pLInO
         CDuv/bkH7s4aXz6LRzPonmj3ca3EHygtadh3V7DH+9tcy96QUqEj5opFFkf/KdMFZPz9
         BHGkF87gg1QWsUUhAwvzDUXxGbN9QUzKbDKkafm9IULopk2Oey3Db/7sU0bgzizf1PTo
         p36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939448; x=1794544248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCfYxQAheTWR5Y9HsIisj2LG7OC+BVkrgHxX7TuYPA0=;
        b=jmUohRMU0cAlQmpiRsuhEGW2VzhZtnXVNAA7ER+mfFIviqrnYajZbsE/p4l1zCidKG
         kXOq5bEXtRZpnQBJLVezIqUIQWF05f7eIt+MD8LTZvUJxn5NBmEY9z67bayQtZ3Wopvm
         9GDtxg4hfgGu9a5qvfY8ovBenq4m+cuprek+Ss4iorsKkNXw+6bWM2h3NLh1YOpFdS3L
         u2HE1RFFCn1mXdPgi1CpJuhecNef6MWc44x0RPYfTf/gIoWDXp4Sup9hjNl6/1e8u913
         Fx8Hoa9zC1+N4ocyLpfjD98EubVa010Tu+tS1kNH0k1n86A7L6inIBPFZFV8A+ev3Ahm
         7dgQ==
X-Forwarded-Encrypted: i=1; AL+hErFFxY4d1/QkESNJuNqQg2zuc8TgNSyI7WI0bevgF/BpiXFes00V5n7i427o/2ch1kUtZAMAVP1iB0ZqN7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yb3pxB/GxoujMNgjOWsdVerb140ncb2FXNadck182L+N/uTpQ
	RKGoZYYJPMA7TqohpAD69U8+3wjbDay8Pk3UdiCHBBi3LSw18suOT2nV
X-Gm-Gg: AYBFou38T4/v2djlWa3oLskWuRtoPWkpjXEnQcQnMjHMk1i9A9g0hRbxBJsmoHGN4yl
	h8pSM52O3Z+wl27L7RtcCaOCJ2tTg/wVLlyIBxU1tHpXq8oldc9xBfDef62tLVw2sQ18UhJP5rf
	3jwtzkEjV4BfaD+n9XnlALqGL1uK4oCGXFZwl0j3nqrWrOEGmowh9GcNDV9CTxlvAyzCTApvIcM
	qTSQkfhgPZAyD+eQBa4PJmgDf2Xoj8MAUO5Crj9V6S+qwxFUN6M0TVS2Td8x2RoaPYA+WdsLUbZ
	2IQIsEds+dV/0NUwjx9QiNczrROPhLrTRDDgMbzVQe/3oQGQxdls553p633sfJlxLCu1HELKQPi
	zMn+7tyYlALjfbFjLaHtwrE3CU5WFeIsbCJWYxmyEIvnWa6JoC3CZH4tsZw8y6yNptX79WNOXKf
	C5hlLlnKEu185JIfHoHxMuJOIfAztKYa2hd0dSb0XrdhHkwA4uwKAlV8M6xmBfpqyXYV56HWZK4
	D6QSh0b3a1d/rswbINS0XzUJjAdC6snY2TZVWpPk6u98w5czohmHZlROx8kPwNBy0gRR2WD10uA
	3wE7nInz6r8QaJEd/9i+v0vnYhxMeOrw8rO7lwuKAYqbI5t/TpbboMuQeE/oGbDHrmkAegOF4Hh
	najHiiE8aM+/qepmpAvAPgv52P5X80rk=
X-Received: by 2002:a53:de46:0:b0:679:a420:a07e with SMTP id 956f58d0204a3-67c145bfd86mr457741d50.112.1793939448142;
        Thu, 05 Nov 2026 20:30:48 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13540451sm1159685d50.10.2026.11.05.20.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:47 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:29 -0500
Subject: [PATCH v7 10/14] alpha/perf: report the ProfileMe window count as
 the sample weight
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
Message-Id: <20261105-alpha-profileme-v7-10-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=6ziHAOsxKu6KcQK97NLAB0loeeqz38ewKY3TZVSjLAE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht+1VttirDrTe62vdW50ku4qlbqOV3tcS4+dZ7ujk
 LpkJvPcjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnGqorhD8+LpYViUg
 92Lt6i+Pi09ak/D9M7lULzfD31pxi2PBJ868PwV6TyWaPkovTfptlyNfLJ305F3e/88IDjviC7R
 ab35ChefgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

What PCTR1 counted during the ProfileMe window, the inum retire delay for
cycles:p or the window length for instructions:p, is only available in
the PERF_SAMPLE_RAW data.

Report it in var1_dw of the sample weight, which the weight and
local_weight sort keys read. It is 20 bits, so it fits. As Alpha is
little-endian, this is also the right value for plain PERF_SAMPLE_WEIGHT,
which is what perf record -W asks for. Samples that fall back to the
interrupted PC get no weight, as it belongs to a different instruction.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index b5f7112e822e..529186ea8873 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -1079,7 +1079,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
-	bool pc_only = false;
+	bool pc_only = false, exact = true;
 	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
 	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
@@ -1126,6 +1126,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	pc = pmpc & EV67_PMPC_PC_MASK;
 	if (pmpc & EV67_PMPC_PAL) {
 		pc = regs->pc;
+		exact = false;
 	} else if (pc < TASK_SIZE && !user_mode(regs)) {
 		if (is_user_task(current)) {
 			pc_only = true;
@@ -1134,6 +1135,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 			pm_regs->ps = ALPHA_PS_USER;
 		} else {
 			pc = regs->pc;
+			exact = false;
 		}
 	} else if (pc >= TASK_SIZE && user_mode(regs)) {
 		pm_regs = this_cpu_ptr(&alpha_profileme_regs);
@@ -1167,6 +1169,15 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	};
 	perf_sample_save_raw_data(&data, event, &raw);
 
+	/* The count belongs to the profiled instruction, not the interrupted PC. */
+	if (exact && (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE)) {
+		/* perf_sample_data_init() does not clear it. */
+		data.weight.full = 0;
+		data.weight.var1_dw = (pctr_ctl >> EV67_PCTR_1_COUNT_SHIFT) &
+				      EV67_PCTR_1_COUNT_MASK;
+		data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
+	}
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

