Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939427;
	b=5A0p4zU05NnZcNrz8328go9IiwwD9ncVXcwYIV29gftqnL0b6JJnXIh9Wy2dOLAnw6S6
	 oxelm4u6DnAloPby0V23oPOpOy8AYOKaSLBAmnwxoxfNIElUYQOkFT8aJnhztE8P1OQLb
	 0JyMwgEYr0rB8w7eXvfU9DW6E75A3hLP5I+XbY+Iigyin2J/OuLbobCNpFuOkynGdeHPv
	 TFK5XhPDKAjKYkFR3IWLdw2qGUKFlKiWp9L4mPJJWUYTZ9whakkHOnReJ5raxvT0Pa8Ry
	 B1/3DxLGhqJaNj1iRrcmTnhBPg6FRyN9hp+S51va9RJEmqywjO7ytrQIz9wmT8oFx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
	b=xhteRsmfnibXDEpPe6w8Ul06ry/N5GiXxFRgVsEaIkk8+K0wLod50WbDGC5cMnfVv/Kd
	 TCNIjOByW3pmytciFCvZJ8NW7ffBCxIQdllrCet0tTE2DhC0HCrUyCEHSRYSGb49Lg7u6
	 jRhL09iQkBcCdI4VqwESrtd+nENG5VG9/Pd3UsA9DcHXgaLYHwx3B9p7JdXBYT3vrcAkG
	 F+cGiRdraEbVt+7gl4BcLd1hruDi4J9AIjNfETQXkY9wiRhj7O6cbFpdGfvdrqIpZxfsS
	 j3DupxZfsJA4QWe674sxLOPcKx5GytyflBloWdzS4h8YevcNQaPBlXxJPMbGJKbgLnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z7/EZw5A";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24693606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24693606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7/EZw5A
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b32bbd39d5so937417b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939426; x=1794544226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
        b=z7/EZw5AeVSjyj2cUbL9QD/44z13s26wWkZjAYPzcHCBGltU0DnS9GYSkbSv74D+M4
         LmGMcEzxGU8EVmBKoTuXNdX9WfmvG5arn6lhES2REFtnoUzgFMzvM4mAOd0dKRjt+tOi
         FA9Qb3O3Y8/fQRgCSvqjsNRNr6YTAgiL5tyKnfva5W+igW8Op4V9ljRR6Zbg00Be6ir/
         VLw3z+08clxBY+ShwiFkM4W6/0Ljlehevjp/0agWuWtEl0w09dlpniRBRvmVpmPpe+WP
         GQaTwOX7nBwBauUz7dNKxvDkp9o1tSD0nNm6xlV6IfSCtNoh0oVVx74rlXK69merKSxf
         to9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939426; x=1794544226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
        b=gDAV6jg/AILi0gmRnIYc6VnAq/bQnW1JXtkSTJaN2NPPNprMBQk7sJXtGa2pYFDa38
         eNqF5UvK9kKSi5OdYO2AmLaCTA/3BRwpKQfKyVcTCHfn2G2qKjN5sj36oBiiYld+rc06
         NvQOTaOVFuethw59oCRf8ncN1YVt7FuRiYIa/6vbV3juHfDeWN2E6YvwawLQaXnX+kjN
         hBrNk06aqH3YaN6JYqXG4MKkGCPit+vlXtgPgSAXcFsaJWMV9Zyd7lImgHtnv3i5p+yV
         QXKTQfib0YtVJuvFa418xgsb8MLlJFs4QRWZWv4YScI02G00m2HmYBTr/3Fyiawq12Ab
         9uAw==
X-Forwarded-Encrypted: i=1; AL+hErEyyLCi3PTEp9jJoI+AaS7LnRVHVl2FK4hdlQGmCFIepTFImpzslg+AFFPuG27jLQ7WS/JmutVbomMj4ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zIMTJncN6FkMDbgc5DU63OEhYYGqHiJpC63FM0hozX7MpmkjU
	/T3YnvRO5EIBi+CA+jTQEsFuLezImDeSBCp+nr+qfkNOutoeA4iDeGEz
X-Gm-Gg: AYBFou3PHQC+L+h2KFlH08clWO8PvAp7G2OHU4sju2p9yZBaREqpmxKe7BCDvbFKiZL
	d3Ax/71gGl7kYSqUeOXLdCPObf8gEtEisplAjOgLYFzVpThB95ZZVQjXaowC2baCZz5zzO5/BNT
	jrcCcBSW0oYiK6HB+CfmkVhqeDYE8aAT/qFFQXBQrbL97zOCLHYM9gTRIoxpDViAHOyevfcIh/o
	b46GTCdGp+unThb9eEHzOJZcbWI9H6nNeen2PlV5NvHcaVBi4dVxBHuZdiBTKO9cdhXXEcnwWUK
	NrTNF+Jo24hpGI9Ug11ZkF5sZPRCOy+o5YaMUA1jGFrpcENNqqCZdPJgu5gGS6LCrYsVueINnAn
	plko5/riPwEY8Ll58OKQGohPolMuh0U62uJSmvZoip4wYTKsZ+K9aCYNNqILweTkzFmHPNqB8Mi
	Hc1kePiEiFzxSFozm2GMji3FHJgancRQR6YA34X9SWed2e1Z6SwDhd9baa5akJD3ni/NVKKXay3
	9nERG/ZES3bJFECPgo0Vyu4BQlJW+T8IYkiSbQPYE8KFKvWk6nx5OwdbJWgnBFPULi0xZOXkKhd
	cAQmRYX2tbSyRkYK0KP1l8ZTdHmvicshNyMZ/KzKqFer2a3aw4MVXrLKxeLTq3lNWHI+Idsc4I/
	f0LDqQGfno5FZAoEGoKN1rt7vFRka3sk=
X-Received: by 2002:a05:690c:24c:b0:8b0:eb6d:d887 with SMTP id 00721157ae682-8b341aca2f3mr7043577b3.56.1793939426105;
        Thu, 05 Nov 2026 20:30:26 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8880d2sm11071467b3.42.2026.11.05.20.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:24 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:20 -0500
Subject: [PATCH v7 01/14] alpha/perf: do not update an event that has no
 counter in alpha_pmu_del()
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
Message-Id: <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wxDmak7Q7QkYBMgHY3pFYg+88iHC+WUm5Tmzae9wpsE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht8Jm32lm3vV6tfmAj6b/q5+sqv+hVDBvdl/PzdPW
 K/zxXR6WcdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBc43eIkeHnunnM95
 Msnhrc/PNt4YNb9hZWpRdEExk+qp9xllD7XGjNyHDKuTn+SAVL5bFcDrnvHZpFR49GfrCxcN60M
 beSfZGZOBcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() puts a new event on the list with current_idx set to
PMC_NO_INDEX, and alpha_pmu_enable() assigns the counter later, through
maybe_change_configuration(). Alpha has no group transaction callbacks,
so the core schedules a group with the PMU disabled for the whole
group. When a sibling does not fit, for example because the counters
are multiplexed between groups, group_sched_in() rolls back the events
it already added by calling alpha_pmu_del() on them, before the PMU is
enabled again.

alpha_pmu_del() then passes idx == -1 to alpha_perf_event_update(),
which indexes pmc_count_shift[], pmc_count_mask[] and pmc_max_period[]
at -1, and it clears bit -1 of idx_mask, an undefined shift. On the
EV67 PMU the entries before each array happen to make the computed
delta zero, so the event's count survives, but only by luck of the
struct layout.

The event was never on a counter, so there is no count to absorb and no
counter to turn off. Only remove it from the list.

Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 and later CPUs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..f77abeeb25b8 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -506,11 +506,17 @@ static void alpha_pmu_del(struct perf_event *event, int flags)
 					cpuc->current_idx[j];
 			}
 
-			/* Absorb the final count and turn off the event. */
-			alpha_perf_event_update(event, hwc, idx, 0);
-			perf_event_update_userpage(event);
+			/*
+			 * Absorb the final count and turn off the event,
+			 * unless a failed group schedule rolled it back
+			 * before it was given a counter.
+			 */
+			if (idx != PMC_NO_INDEX) {
+				alpha_perf_event_update(event, hwc, idx, 0);
+				perf_event_update_userpage(event);
 
-			cpuc->idx_mask &= ~(1UL<<idx);
+				cpuc->idx_mask &= ~(1UL<<idx);
+			}
 			cpuc->n_events--;
 			break;
 		}

-- 
2.55.0

