Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674926;
	b=pZCdwbf+b7nhsyQyDnQADRc87KlxujEVnd8nGxAOMfDhmJlqJcgVHTdx1MsbpEh/6Vy8
	 +uDswCW6nSCAZqBTHGMuQA2RUTwCFvzuxN6nBQDDaaptwaKbSXwI1GIGaCdBqgATUykuF
	 rCa9K4XVD+Tvf4XLqBWbJnWgvz/kn7H3TD/v3oBDBn4U0eOi9VzDNKyXrnbVptSE180bv
	 ghaimbApSsct2Lxh8XqY+uj+jMYgAt4Akln+gnqlE7RJIXiXYm/1xWfSySnAqidkck37m
	 x4k1mO2L6wLuXMY60M9JnHM4HZH+3VkLD8epkOZoGnvTNm07MRsc5hzMhGk4mi+rAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
	b=dSyZ+4c6xl9Naj75mzlyi+3mFb08O3g6UNZ3EXdv8UGosN4wkBJGn0pA5iddYxr70TQb
	 GcO4BO6ZZWUu7bvN2nfIB9zEGtdhLzQN4JXA/20ExPA2TC27E7nWxx/E1V2ZvbKQk4WSf
	 7EIUCacWqL5xoQL56LYZ8abNa0ByEGNcn69iY3lkBzVKMIPSRZQaCskTvHPdea8wGjGVJ
	 KeLslWKXJd9DAFkB3v7qMReGklWNgcD7F6PYl1F55dy0b29gITqkWV8GSxACdXhC1UIZ/
	 Lp5DICKftH58c4H6piueaXgEyTd7iPEhtkOpNqni70JIbGESmJQd6VpUt+Yan12R6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLpUGb3w;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FE606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90FE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLpUGb3w
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0dba37a7fso32960127b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674925; x=1794279725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=eLpUGb3wHXq8jxNH7vL6gAs00FArBPuaRRkm5Sr48oa0dd9zv1ziVP/slzkuD1xTYe
         yzS0l2ThjCIcy9ixhRQdSYXyCdw0Nwg3IZs8PDd2saGimBMkA7D5Tdy/FTehIGK3QwOq
         H2utf5BCXKNR3eo4TG5QDmUGQm/ihRBFLp5DtC9Ua7LbLeYNZxLl//qULqjZ/w8BbfUi
         wK1lVk5UYVTbGEM2w9lZCal19mcOyKUKvBj6jhjCrUweHfmx6iQN5oCMMHSFFBhmOT3E
         9q003PTeYOpI+V4ILAzgH0kCJDHccmYFzOKfZhLhS6e9DjfNeg70Gmn+BjM+vU1LfCHH
         6O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674925; x=1794279725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=EkD/gy24dEDkEbe5uCUEylQJduvxxNKwO/IE5zQuaVq2RC1WSABn3YvxpMOaBScpOf
         4YfkNPpesjCfZmlR/6vI49JXuvkJ/xqjsCn4xlLtB32mML8KrrQStFJ696iAkWbNVF+7
         kHapSIwoyGH0bQ+JW9qNful0/HZrE4uqQM009jbYJMuPkKrytJ5c2tGDOEDu3/C1pKpR
         990gbDSHcnDttquZKVS2JnFPI2c1fnOvYoE/mZzoNXEHQiw5FLi9bM97FtoycMWDHKx8
         7NUbZlvXguJIe7kPS6xR8+eP4Z5iidgox+8foRULeYBCuKVVzO0MpL5Gx0TdOmWX5Hq5
         +Y+w==
X-Forwarded-Encrypted: i=1; AKwUvBxbXYzZfM/f2aGxL6R64A60z+gvjpq4wVkbua5vmlDMe2SePASxc0hd732c+blv1Fz3NNiGBC8kSTsbt2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9InQGXQV8oTXpdhACzGFeHr6glNiSj5pMpF2Z8kzUGkTbWXXPZ
	7ajZJENABOF5vLhRUmW2MOHN+sz0zUzBEPgb6W3caPgmzqXtTopwLy/v
X-Gm-Gg: AYBFou0eMldt/ffW0yNxcHF17D/lcUxmh4GJCRu1Fhp7B6ZrWz6BOu+E0uKwDDEOBL4
	l7mf0liehNqEIXKc31M7IfxvA2Y/E689q8OelHCNTlNBzjf08jY/unkLdRTMAo8tX2rcpHcq10g
	tEZSdVI2ZqmCjGPyqi4kCu9NTnyym0xxUAYs6hECqvsJrVq7GzuS3P/Ixmy5oFhYzhybTvmDc6J
	f6ymTfu88lbz7sZSJo8OKEx2/OIezKHZTDQf37WpTH6/Dh9pwzxqhivrQ6BGX0BwZFtmFtkNTw5
	FxiONE5fF7Uf3q8EAdh52ncxik9mkqjSgpnnga6Vl4P4PT+5BC5Xrp4glgI+tG6KEJPpMWQqTc9
	mxcD76KQ0EG6A4wwc6vyeEzNCf0cvjBVNtFkk+ONQiuv3Cf9w06kYs1ttWdpR9oVq7WVw6DBxrJ
	W1yKJV6aX4pKTKyvChzA6BIarXGVMkwDD5sgOyw/PZT/NACmzHxscK+WEveOTvDyGBwWNxhECrR
	JVDSuHm9U6xHrsg8v2n8ZzZot1KlBDs1CC+6ddSi6CfN2h27NtXQLRiyiOrlmymQYm6ND6NZvBJ
	GyEeimNhW9cCEm2/DNH15QqdTDlZ87SemGaecOLFW4mMs1R2yeJIsNEjwYn4YOM4VdoDe/97wE5
	bjuPLraf/Hw==
X-Received: by 2002:a05:690c:f8b:b0:8b1:8d69:1b20 with SMTP id 00721157ae682-8b2b65b31a0mr75897497b3.8.1793674924743;
        Mon, 02 Nov 2026 19:02:04 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714cb1csm64619807b3.18.2026.11.02.19.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:03 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:58 -0500
Subject: [PATCH v4 3/7] alpha/perf: clear PERF_HES_UPTODATE when an event
 starts counting
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
Message-Id: <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=bEa6cnf/NHGbPsC7PL/IhVePDwjtE880lWDMA14mV8w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3WWGyUo7tsxyabVSaWdT90Tzg1T45PbovYtcm/L
 L7ihFpxx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwjuZyRYesSi4krsp
 s1n682DhcPf/HLL/nh87oMyzNcFU+aHrB5n2RkWKXTK77y1NHAA+oJvv48PnMfbqxxTJqid+P6T
 sOG7/z7WQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
then programs and enables the counter, but nothing clears the flag until
the first alpha_pmu_start(). In that window alpha_pmu_stop() with
PERF_EF_UPDATE skips the count update, because the flag claims the count
is current. Since the next reload rewrites the counter, everything
counted since the event was added is lost.

perf_adjust_freq_unthr_events() does this on the first tick
after an event in frequency mode is scheduled in, which is the default
for perf record, and it then sees no count to adjust the period with.

Clear the flag where the event starts counting. alpha_pmu_add() cannot
do it, since the event is not programmed until the PMU is enabled, and
stopping it before then must not read the counter.

Fixes: a4eaf7f14675 ("perf: Rework the PMU methods")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 70840c05d39b..ecec78c355cd 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -456,8 +456,11 @@ static void maybe_change_configuration(struct cpu_hw_events *cpuc)
 			cpuc->current_idx[j] = idx;
 		}
 
-		if (!(hwc->state & PERF_HES_STOPPED))
+		if (!(hwc->state & PERF_HES_STOPPED)) {
+			/* The counter is live, so hwc->prev_count will go stale. */
+			hwc->state &= ~PERF_HES_UPTODATE;
 			cpuc->idx_mask |= (1<<cpuc->current_idx[j]);
+		}
 	}
 	cpuc->config = cpuc->event[0]->hw.config_base;
 }

-- 
2.55.0

