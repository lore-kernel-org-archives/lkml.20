Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818157;
	b=oyJ0ZdspmwToUlcdizgeDYwkec5N5lrx/WzPZc1+p365L+6I1vf7OfUPi0OhjMlCCQGz
	 AY346HQWQcXgxpDaUxhni80/Yb9nOO0UeF0idaB7+AktzOFuzmJ6neZxQhQUTxieLWGFs
	 tjS8KkggeBv+bPLIP+g1C906yBEqUMkE8JP4vwn7FQ6txk8kSUfuq+JHm7L8KN55/mDQy
	 AHDLLqc8GUCPajyLOsQQ5ZdsUqLL6GmVqUquaxIIWlh3I0I/medSthaCupBnlaTct64/d
	 5wkTWk4fSKCGbYxztW5luNEUdo0rzsVqoCfGmqnwwLEnpQ4tG+Qz3IJnqZKnGFxkeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
	b=Ix5OXgmSvh/HCCTRLoiKlo5SbPSn138MxyddcN3hrquYnKnA+nazDM3fHxZ5V1W33TW3
	 ViFCymcyUeJMiem1wlO6r2NVqQZ5Bh9LhL1ElAEurkdCHoNZ3W5zekuroVxa4eKskB8xD
	 1hWtuaGuObJuxWEAVXEkn6HpFroD87sqAgohqU9KtTgs3S9L2t6z0pCFQ1aRoKkHnEDMg
	 CMpiVHOfGepgWXGhCb64xJHuIvHTd63QzitrERx9ouJFn8HCfVbobKzscHwRAV9WwKyuI
	 e6CMHqA85TusBDf18NcpfAzfxkQZMokLoRBIOalRR553YKW53b92yERiUNGaM6OmhxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oedZ7HaY;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3E606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF3E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oedZ7HaY
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b309147589so11286287b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818156; x=1794422956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=oedZ7HaY0yKhCqbH78FFEJ5a8z+oN3kaY0BpcEyEVA3Jh4UhTYIiibsrYyA/5cv4YI
         +wjV6lkJZYz6PVlyFv9vljdcPNgpkOmP4TL4Yg9LY7gwflGOAfvatB5uIA0z73ivH2q4
         dZ66HRjgcAEZP21eqTEFSe1hcTen2dA1SBvQ7iETF3QtPr5M/nep2V13a+sj+qHHisMd
         saUkiaNDCg1UL3+ZhH4I2zOdZyo4yMH0JdTE0hhfCbbHVMrdFcL3HhSR+W71wjLzFyYf
         MWaaH+5SSOEBBI+XwOMcqOG3qczQaA0WabJofULkBUtigOB6QyTxVQoCoC1Vk5mQSLYo
         QFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818156; x=1794422956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=j6csQsnRYNIGOUHNft6WCcy2I+a2GV+pHqhKdS5waQmZyL/DVR6xjPZiKOSjVQpnb3
         ms86yKd4FxUXNPNqORPGNd3mi57poYK2QwltHJcf8wPeaKEZNTW1ZBvh0qCqnuGJO1CL
         DvVcsq217DzQCL0CM9V7OPPg8KnsZmEGIoYulKNnu6pnCFxxUdRlUqmdg1lrlajYbKG6
         qzU6LNAV0rZvKHz1O44/FqMNsdinn6wDlDnX0E+pESyBcmjl4S6N4I/Wn/rH3OwDuBgt
         UxOFzJtjoUWasxUC7ASv4AB0QH1qvo5H3BMUikAfqT+MQ3idKPTVIkyqHKlixDQK1XUc
         l5tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvjK6WfoYQSfPHhOYLCPSMPhGI0xDBpMX/2nrFfMDa2EIu7KaSMJ+FtkGnylW3aaxBPwh1v2JQbTubsCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V8pEABKoafTsvPn9fX9MGYdDmxMlCxbvjSX336t6o2+dPPKr5
	xNeTSXHa/v6434hjgInIFt7A5PVb/Tfn7zl0aoVDYRScqDfGF2ZTl51tJ8MDXA==
X-Gm-Gg: AYBFou3qQXiv9mQ8WMRoseUuHzaamBG/Qb3Q77m6yl/wxDGZTimpVoLpjq3FJYq1MDB
	9ikg2L3wnN0fd6LZ7VSEEpBMQ/03bREIUj+G7kB7VtTJ7WG1waxk+qtodIGymCIna4Qb0ajWuEb
	zzLnxN2itMwN3pKh5KB3zMbPUCjTgjRPJWTtj5C3VTvIPMYb5UhhZXjc+zcE1P2VI2SVeDS8A7/
	AfTUQxdDuXW4B+ovkmL7o/ig6s0mSpNv9k6UBfMmWTkTZ+pMAHdgqTZfWpjBr3mFdzBc1BZXEbs
	AuBIgvuV5MxmtgsBCUs/ewRJvpAgrwiit8gG2mDpRSHlK1s/2WF/s1QqHq//YRKVcJ8FpCyPtg2
	rEYaDYzeDKHz/Q8uqXZpNGubBGhmKzEZ1mL0GYyAkUXRHiH+aUupCHMDJY5tF0h4pZoMkvLA+N7
	sLt/GZuk/6nqH0oXdn1fAyovTTdy0/LdbThB+/TSjz3bdNqUZiARTCuMQTIHW7HaLSXHGxEmaNo
	OHt4PnKGdhkqqFWIjsADdN3JybwUJ98cFTNloE4ktq+WTdr0sp4Xe5UoSYWalP9TOnPihsaqFny
	QQa6OARM7AP0YdyV1FqSUMjZpoDMJQ3QYU+w6QLiNGuOHWbXd8oaHU5Rp2YS3j0FkXT2pQsg/HR
	kYJjgni1+vUQ=
X-Received: by 2002:a05:690c:698a:b0:8b3:1c7c:1b51 with SMTP id 00721157ae682-8b31c7c1d7bmr10775137b3.46.1793818156014;
        Wed, 04 Nov 2026 10:49:16 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099920b3sm24300167b3.31.2026.11.04.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:15 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:10 -0500
Subject: [PATCH v6 03/13] alpha/perf: clear PERF_HES_UPTODATE when an event
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
Message-Id: <20261104-alpha-profileme-v6-3-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wZUlbKAGrvoUbANrdNAR0BiYRrf0cYY8VBhZDQukJto=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16k0q2z11DlnPeHFKiah9dc8mz5v/7Mwq68oUOoZ3
 8aLTs/qOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaZYcZ/uc5fpdz/F
 pm9P1qWtPEj8cqb+5YJOBQaCfLuYxd/t3dZWIMf2U+SUtrsqRc3bj3eu7i27Nr2/qsrMz3fEzq2
 pZ93OluKCMA
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
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
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

