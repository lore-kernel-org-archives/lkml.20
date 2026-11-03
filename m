Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738264;
	b=PL7vNqTvgBh/at2AWEDpY3p9OIDVjbgQeuaJDKabNiy+8FEg2Ps/fViQcaXTjKccl2il
	 yf7tV/W5mTckk0ra9s4vu44uLaTTPeE/qQmOD4FkP+7tNpRdzgQlPcDUS2BDAxMDobKbl
	 k8cHn3tiPAmtzLtH243z3SQ3Pq3pY7JfYuK4uaKdGVkCsbEqD15l/bJixwyIOvIHUx75A
	 xQOHWY7EznHYnOdi6xNI3AANNK890JjVgI/PTd8iL/anvPA5kjPxplMMKM+//owiVe1Jy
	 6t6e8UJkmsBFIi96TCjz4j45BQQoLOHue/LmzuYKyhIrOi8U1eXadBmTmK2yboIOfBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
	b=oWOfdU6B9nTB3Wkzcmy1ZMSy8KlHXGMUSC6XvqKa10cMvw/9UKfMkv9JbOLayZIhAe5o
	 tRiENyOsNqkZFFnr/Kr3ILKtWFQ5oCrK3ThCQNy1WewOhHrl1nt8OMtW+R6EdKImVC0HA
	 GuCozdMf0y4xhERqrmcvPAYaHJ8Bkr21DX0S3xphJnFnLJxFL0ojXQMVE1yX4g1eckUz4
	 c5l84+aWRSLQpd5nwmbRhPgm7pC+Xz8FcmYFV0dD+Iuqfdo0MSvcM60KS5pyOe5zGAVPh
	 VZYDxcNk6dBN67jHn6d9g7YVy1fVJbtHbDp3/L8apyCiyZpmEJQqmYRyiayBLipo5JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoj7xcDo;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE9606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFE9606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoj7xcDo
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67999045530so72690d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738262; x=1794343062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=qoj7xcDoVGs+ZdC3++ZqYU4+l7V3xK/w98SopOz6krhVhmGa9+f/nuFXj0mld3Bxd0
         GoifG0tIXHQq3CNj2luySPbPfbtBEkgaVAU7ER7rhLIbzmQ/grJCYSLNW4Sqf6GqgeJm
         GH82O0TH6mgKfd09VO/9VDCJItAxDLSeWM51pxR37UMUYf4hUimrTiBzW36wFR5ouK7Y
         Zjzi6l69PDpvRSw26Fkg3J4d2jqLhsuYyK/9eGjsAdiH1ss5vokMAngJMUQsgacnwZ74
         7495G6X0GrHt7gAb2OU9+AGsQIO6rcGAmRkOlXsUt5E1YUm/12nonJjYNwf3zPMfkghU
         TBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738262; x=1794343062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=ViSpPa5z8MSUY9tklzqmpgwOckSoG0rS4K552crNKp+g2wPirDzu3On9osLrPaLF50
         3l64KfgvZl1leVWBqgdj+EA/HRKYItpRO+6gk+1dfTlquXGM/hicbvdG4DG448PnAgT9
         JfSmFpU4c9jAkLVUWc3ss+/Xki683Xm3NFALttViMpApNxpiw4raWd/VqUTZWW+eGQtC
         r2XMuh7jPo47HImSKdTHSyfpgN2G0FVsk3j5ETwjKPVXchmDFGZQwf4WlG1ErATvZog8
         meLFY4EQMxOjXb4cZJZF0jXCgbnsuMLFEmejFCCsOMDf/6GrQKH/8LQcte9KhjpkwbM7
         YJnw==
X-Forwarded-Encrypted: i=1; AKwUvBzoavIkfYhbdxmFnm4IDhIypT6Ic8cnYWkCIEmplrSTLr5STyvH9/jQgV8+tdCTJE4dxFLUCSPpAhnFpkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yYIVGr0WTzuv5c0yD4Wk2NlLzew1Q7cN2XaaBsyyC5q8Lrucv
	kOvStjN7qlKvJvsfnobkadjE9gHsB+ifezq+LDLb9QKfuXOjdAkV5bGq
X-Gm-Gg: AYBFou3khBV/2hR7siV6wEiR2yavrYUpVCMjBZEZI/Xym8vZl14cBjuGqRRwvty1onR
	qxfM80ADRA44nj2LUTCu4yzH3A3RgWJJtOnvgudOhaIMdC8LtGAdqt/MLlDtCCE02cudqD98QWP
	XIxzA9HNXZOuZNuyF7e3mLBP6QjRudkXnuhz2j+XmWqtipi9Y+OfupPhjGNAk8FnBBZrS0ut7iL
	jZzoxyIEzLtXpN1btbXgumy7EMJEE7Dv9KdIgXBBhB/VqT3GIHr9FhnFylJtH4+QgGavp3XnRRQ
	mnHOhjqP1w86Wi6d1ZOrDtc+E1sXyKLT/IAPEe8oM5r2ccU9z3bC+lOLQYH/S5SVzUPBUZG4ICs
	WKBCVuBoi6Hbc+4V0o8doliw3bppDcH1YY4UcM/q6tSu9qWQsZ3/Wnm9tq7eUo5W8mzYApppPfO
	tsRSBDFoskr4LGi/8rU+P0otG2EupXkDo0tRMYoHtty8qgQn2Z9rLmH6MwByeXQDWVaX3fQyxXd
	wB/EEQFuwR5Wie38r+g3kJ8+gUhI7NECPmyr8jZjVLcBnI8uTVfFfN/9nSG+U1FuU8eVBbcm06v
	8Nqv/KG+seJ8PSgosRMNP4qy+Fc3cbRF1x0Ug4GERf5kmdp9XSlND88xKA912JgZ9btojK15CBD
	AhnZtKpveXw==
X-Received: by 2002:a05:690e:144e:b0:677:d9d8:d927 with SMTP id 956f58d0204a3-67ba4f9c349mr11752027d50.74.1793738262448;
        Tue, 03 Nov 2026 12:37:42 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee202bc4sm153422d50.4.2026.11.03.12.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:41 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:36 -0500
Subject: [PATCH v5 03/11] alpha/perf: clear PERF_HES_UPTODATE when an event
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
Message-Id: <20261103-alpha-profileme-v5-3-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wZUlbKAGrvoUbANrdNAR0BiYRrf0cYY8VBhZDQukJto=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufF5rNflmjeZq13KZiJz2MnFz+YfL6669GD+315Rn
 cxXFf1XOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaat5MY/jvNaj25pc
 Eg1VXqZfy+aeaCc69t3yXduEz2ed2ar0XWe/4zMjTzeCrWm04473+s5yX3oq55RjU1dmtyarebH
 9R12WR4jRsA
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

