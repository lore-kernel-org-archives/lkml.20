Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A08396D1A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449505; cv=none; b=LaaPky8YtFyYcCoWX23oTQpJefCWOM16JYHjLKR2AulRnah2lrTxGXfHlJ6bmlZW+XDchYCmP63oBA+hfvwGMk/PkCDfcxTpqmojpBFI+kKDZYBR75UsScs6wbno4JkcJIwqZ8cBqCLd2KHxMA7l7+V2zuNDZomDVTCORVsPYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449505; c=relaxed/simple;
	bh=5efpR+DiNzg66dM4qSO5vb38UBEV8l7bHBV08xctCYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/Pwtgpucol8uqvrZFb+ne8A6xpTrA8KZjMEE594GAr53A5k2te6y7QAgDE4qzruCM1vwLjLjPME4qpPQfk299UNYzRK1jeOuuPNsRQXggPQ36MbiRsi+IDC015h+h7/cSS+cM+ZFHW4uRO5KZXvw5cPnH5JSGLm+CJu1qqNGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppTOzT/S; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppTOzT/S"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so1064396f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449498; x=1791054298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVcPhX9Ogu0tKMjXQYOW4Gg0BvTVbjbny677ydMNzu8=;
        b=ppTOzT/SbhgIMj4VXPebUsrORQsmQZMDWyP4RZTg7OcGwuCqf8pkipZGYDUf2BTHh8
         GRp18nmx+KJghkSArdeYW2TiCjzjyYvy0ZB/aL7TzuAhr2MBq53HryAXyKFUP26niUML
         vtmnJprVb7CI2Z+9sZVPXA1rE2u4AVnaXvLpI/fmPZHyAfwd2Ig+idsdczw/2kaZiVGT
         cvmE6aUV/1TUrqYoPL1sr4CvRwA8abg6+jV1Ef2sPBHDwU78a+YAtWXBvMHboRTaEVCW
         /3o6oSmIw6axJs0pDQzXEShz6waR/txrIj9NOi7/WaODtaphk1oX4AIj5eal1vFbkuPJ
         UH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449498; x=1791054298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVcPhX9Ogu0tKMjXQYOW4Gg0BvTVbjbny677ydMNzu8=;
        b=Uf/4k7u1pg4dzO8S8661kIah9gXFazx6PCQpEet2Yj8ajA4FcAocrIzRplaDe29nAg
         B5Ifno6vh07qlgtkhYpVeLDk7DCiR5hq5P1neetl8vlWBVGakUk1mimAC9ux09/fx9OW
         ZoK7KsB9545jPnhm6OzORUEtlzrULMXJ2bLGxNYYc9hTA/vPjbD+jVpDGk4wy69+J9EW
         VqwlgayAz8ToVzosjdYRsd7qxCFDNp9beY9AOlThRbBZZWyfqhoVRdDH6OMccEplhEut
         00ZO6n1zvXcoyqQes+MKjBPHWSp7mTNV8DHReIv1Q6NYzxP3aVYq2XRcdBiM5OYh+O/U
         hx5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDPSWKnt1IfFFcV8DtSQ9FFkbPtV3nNP0hgDZOt+z8yPLJ0xeAYAoEU9cIRyAtOxhuSaZbZYoaEkNGTCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW8i2JTZwpaivCwUR6696Naf369onTaVDzTOF++ILEA3JbDzfs
	TJbqAVF1liMjrkBjHGpvOmj4DrTBsoay02vqIH6vrga+XHiwhjLMFLsU
X-Gm-Gg: AYBFou1graBsmInpOcxAhI9gcTdpkAl3YFZU3xpfYeJB2N15HSmUnyNWmsE2LtOvQwa
	nlCwKAEo40eLJ+5jgAO9KrFCee/yh8tu0FIAiBH5h6v4HqS0PpS24OCqoeX3VcfJxP3GpBVM/Kp
	tX1rMganx4fl+uldA+wLgGrSqPl3xxmil3jfBU09D6rgBMuz7rcdp652JlmWdHvw8cus9fNuvUF
	1/ljdpkFCLDVoGbHUbCFF1UP8CAl3PBWvwdPq1qJNSZiqjE0kFS5AX6sc8C6JqSTw7VApLTt4PV
	MvRe6hPqQuqfnf5vuHJ65aSBJitYSK/c1l/A5DnbNeb2rNy5voLHcFnsZe9cWZ4wEs7aDLJpVm5
	pMlTx1GsjpHg5Wxz9JHVBF8fP2c8Ya0p0K25iMb5vnrbRpOoTmpWDMQGFNnJukSKi+6SKjal3qz
	9HpR9p8zUmVshu8Zh36xZmoDik1t9MnVY41EGfvNqYmMD6CG6bhnRQJ/U2WOZcvsXhGzDlV7m8/
	RyDgUzRbatTVvZQCPIEEHDHFwNDP7JdF0VyY/d3jPDLaTZ80zce5t/pWrueGteLlwybHWAgKH3G
	lVaiwv8R6ITj6vljSJmWvVptk23VFYmY8NoWNEmFKII3xK7uB9Y=
X-Received: by 2002:a5d:5f81:0:b0:486:fcfd:45d4 with SMTP id ffacd0b85a97d-4887da07064mr11018629f8f.17.1790449498535;
        Sat, 26 Sep 2026 12:04:58 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:58 -0700 (PDT)
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
Subject: [PATCH 8/8] perf bench futex: Fix wording in futex bench messages
Date: Sat, 26 Sep 2026 20:04:07 +0100
Message-ID: <20260926190407.1106421-9-michalpl2003@gmail.com>
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

When the kernel is using a different number of hash buckets than
requested with -b, the message printed is ungrammatical, and it ends
with a stale errno even though nothing failed:

  Requested number of hash buckets does not currently used.
  Requested: 3 in usage: 64
  perf: prctl(PR_FUTEX_HASH): No such file or directory

Fix the wording and use errx(), so that no errno text is printed:

  Requested number of buckets differs from the number in use.
  Requested: 3, in use: 64
  perf: prctl(PR_FUTEX_HASH)

Also fix "Wokeup" in the 'futex wake' output, which should be "Woke up".

Fixes: 60035a3981a7 ("tools/perf: Allow to select the number of hash buckets")
Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-wake.c | 4 ++--
 tools/perf/bench/futex.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
index 7674622639ca..2cbf31e121d5 100644
--- a/tools/perf/bench/futex-wake.c
+++ b/tools/perf/bench/futex-wake.c
@@ -89,7 +89,7 @@ static void print_summary(void)
 	double waketime_stddev = stddev_stats(&waketime_stats);
 	unsigned int wakeup_avg = avg_stats(&wakeup_stats);
 
-	printf("Wokeup %d of %d threads in %.4f ms (+-%.2f%%)\n",
+	printf("Woke up %d of %d threads in %.4f ms (+-%.2f%%)\n",
 	       wakeup_avg,
 	       params.nthreads,
 	       waketime_avg / USEC_PER_MSEC,
@@ -223,7 +223,7 @@ int bench_futex_wake(int argc, const char **argv)
 		update_stats(&waketime_stats, runtime_us);
 
 		if (!params.silent) {
-			printf("[Run %d]: Wokeup %d of %d threads in %.4f ms\n",
+			printf("[Run %d]: Woke up %d of %d threads in %.4f ms\n",
 			       j + 1, nwoken, params.nthreads,
 			       runtime_us / (double)USEC_PER_MSEC);
 		}
diff --git a/tools/perf/bench/futex.c b/tools/perf/bench/futex.c
index 5757d47f8f7c..be0cbc03682c 100644
--- a/tools/perf/bench/futex.c
+++ b/tools/perf/bench/futex.c
@@ -43,9 +43,9 @@ void futex_print_nbuckets(struct bench_futex_parameters *params)
 				printf("Can't query number of buckets: %m\n");
 				err(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
 			}
-			printf("Requested number of hash buckets does not currently used.\n");
-			printf("Requested: %d in usage: %d\n", params->nbuckets, ret);
-			err(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
+			printf("Requested number of buckets differs from the number in use.\n");
+			printf("Requested: %d, in use: %d\n", params->nbuckets, ret);
+			errx(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
 		}
 		if (params->nbuckets == 0)
 			ret = asprintf(&futex_hash_mode, "Futex hashing: global hash");
-- 
2.43.0

