Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC63A0B2E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449505; cv=none; b=XuNSNDyodnvGTBCzgExFuxVM8FeJSDU11QyIvbHiRJ7cGQL2314Wse6cOfMy1SFfW6Igoki5gFVPIp2ez6n66keTXEJAi7P3/AyXfYjOmJ162dMQ/Til8QdeZL46OMU6nl1qa3GMcqSs2gDK7nGUZSVn5vIQ1jvmKJZjJZvgRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449505; c=relaxed/simple;
	bh=zlbW//0hdhYGgpt+5jn9RZCUwPsUfySvDtED+EIbmY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRRYFRaOhBl7FHlDMQqfxncnhHSy/KGMSvy8WXmYFi8DHLQMB7Wuj3l2E+7lBRj0IOD3nLjy97j5WYQB3GhaRTKK0XTy6YGSZiGIwYirFVspmNFrWC+QztBu8odMslWaM330E+LZbwUZBI4T8PdEqOmG+BQCaaque/zgblMMvcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzc0CB1A; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzc0CB1A"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso432182f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449497; x=1791054297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKRL8yuzKjUECxvVmxvJc06I62mK9jEC8gKnB5LQ/tc=;
        b=fzc0CB1AOSdun2ve+B53urvoK8Bq0ri7NKKo/KVfM9+A46zBxrvtCmsIyFj44V0dHS
         ftY7X3p+1eZ8xI8jqzmI1c3Bf7LGhFobSgYtVVB/kzuuIBEeQGUvRtHcwXEfZtlvZQnz
         AUOuhka4075QFurd0B0bxbWkvt4+KyyQFfyA4vIUBYmWO5fjz+11nLRWwQ/m/WUoaBMM
         j2JcPPRZuth6iy2/jy2N7WlDXzY3NsaIIcrkqr7B3oAs6k5RJgOznJqUqy96igU8etNU
         B0lUeDHwWOvrQU7mtzPIq3CU6vDmff0HjtWGi8xRRj4CnLGZ0j3btAgcJhcyyDJ+7O12
         7gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449497; x=1791054297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKRL8yuzKjUECxvVmxvJc06I62mK9jEC8gKnB5LQ/tc=;
        b=wnc9KzFzgZ+5WmOb5XuTAeujDnEAAzDVhmDgUArnk97ZJ1ysSsRhmuqxCs59NPiXq8
         uRgsCFy82CqdL+4uelenkY1BQXQ76KlmvX8K0sSnM7hJykdEP5YquNRfEPWnRYWv2DTR
         NfDkFA9r2NzgHOPeNpsPYKi5nL9YrEk2Eox3U9KgFVaqNDLn3Tf+pYyLG+klQnfbXH5j
         dwP/vHegA6nfGbXM/VIjZrIECafIYMtqks4x8ijz4PDg8lCePOscx+MgVTo/BA2l/+Ua
         bVuhKtTshcRGKF6doDgUgnnUfwSyLqHmpmU+rGAycdeuj7htmWjo9Is3kskQ5Rg7zjQv
         6baQ==
X-Forwarded-Encrypted: i=1; AKwUvByojkQ14LuH9IsBijpkpOmBrmVgiDzcr3hfwVMYgx6+nvOiey/U7xVp8SJSaH4LmNKm7b7qm9t3+LMmik4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF3z7zh+1GDb1ie2oHGHKnhDBFb7iENrKKdr6YiResXYVP4Fz6
	JmVFYPYvHp3hWuFH7UoL5Dy3SABCH3lNUWGC8vYtALpVMA4NR7UylrV2
X-Gm-Gg: AYBFou0L7VmePm4BG0h965+TP4n52qi/IdRyZM48sTSRkhBRWIO0pCogD9+Pn4NdztK
	HspxFZzkh7CvjSS70RlwVQ1aPBcX1KHO31IYTU3m0El3SL8UEjtDzNI8OggU9Ow6zVDwG0eINjV
	4fQee8wOXEuUpMggzhKh99GQoDaQbhkbGYYg4LP8t6ZGLQMuSLXLJwv0smjwZINyw3HbYVlsNZ7
	iqtlg1o/kUBCTnx8FwN7WWJMsT7pNI7wF+vlS4TQyhl2soaNavEJChTIYZ0+8XMNLX2RjLHTef8
	xVEILewKm0xhm/1CReovcWP13suNktKG/VKRjU3pizySXlLdKRdhG5xtIovlUQ70k9ebED8bbvp
	zCimTNX9jtSn3yAebMEc2AzV98T+nLF6FcDkd5YZrehGI0IW6GH7+NnemCdjM7cW4lVWypB8gwI
	45iZfzlMt9nB3vkFswRWzWRw8bdWLVVEPX/Av+6wjYLf3Kwgcee+r5dOPJDbI0dDZjdw2qsLSXD
	RnlWtej+IKbvlwrqv/kJw6AWkzLluyrSZqvmscFAv2UzNjlGlpjwHnbDRN2DbgRGuqqj5pXlTKe
	QuvKt68ruEXIj6dKVly7/LYK/d9MjR0pMIQmjoWwI581npmpZvc=
X-Received: by 2002:a05:6000:4024:b0:488:8904:913a with SMTP id ffacd0b85a97d-48889049589mr4517899f8f.8.1790449497523;
        Sat, 26 Sep 2026 12:04:57 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:57 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 7/8] perf bench futex: Clean up two nits in futex hash
Date: Sat, 26 Sep 2026 20:04:06 +0100
Message-ID: <20260926190407.1106421-8-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926190407.1106421-1-michalpl2003@gmail.com>
References: <20260926190407.1106421-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The worker's check for an unexpected futex_wait() result tests
'errno != EAGAIN || errno != EWOULDBLOCK', which only works because the
two are equal, so use '&&' instead.

The CPU map is reference counted, so release it with perf_cpu_map__put()
instead of free().

Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-hash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
index e18d98664d27..6f4af1a52d1b 100644
--- a/tools/perf/bench/futex-hash.c
+++ b/tools/perf/bench/futex-hash.c
@@ -95,7 +95,7 @@ static void *workerfn(void *arg)
 			 */
 			ret = futex_wait(&w->futex[i], 1234, NULL, futex_flag);
 			if (!params.silent &&
-			    (!ret || errno != EAGAIN || errno != EWOULDBLOCK))
+			    (!ret || (errno != EAGAIN && errno != EWOULDBLOCK)))
 				warn("Non-expected futex return call");
 		}
 	}  while (!done);
@@ -256,7 +256,7 @@ int bench_futex_hash(int argc, const char **argv)
 	print_summary();
 
 	free(worker);
-	free(cpu);
+	perf_cpu_map__put(cpu);
 	return ret;
 errmem:
 	err(EXIT_FAILURE, "calloc");
-- 
2.43.0

