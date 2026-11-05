Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879150;
	b=jfeN5vx0+i6Ri4M5YX8u756/1RkMBhZFua/bCiK5CmDwbH4cQzR3+tW1mr9WO5Sd/kHE
	 M5lYZmqWg98iOsE/ljZMksScytdBRtCpqwFBEH8H/uWMsNfkt3vVfyjWP6usSfKqG+dUX
	 wT6Dkv9vNHGWlO6YNRVdlqQqzmzeRtrRL+DbokF6GZXuIBb6b9mrDEIMXU5GwVgsceJVH
	 LSeWzR0ZbEw3mSYrPtue/9P8xeBTEGJ90cLXgesBlK/NhAF8POKLjRZI89ph2EROEE7/8
	 bjNNJU6/vud6RLWK5tahKNK+/aCTHQKX0lWanG36oNJmCCmBxT5O6vHKkJSnVOmPMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
	b=sayq8MlIpFZtyuhgn/Uz70T8I0btOYCprREEDPYM6HETGpL4pxRrHJURm603eZSA2vmU
	 qpdM0JdHM1Sp4Q9EESN0p6O8RkzhIOQg5xlKNipHuWOQy4zpoUFGWIQq5Jb1mAQv3S4/8
	 z78SvR+6/HURIgIEmGu6Z38nezTFQtSb6Kr1jDThnCWtJA0y1nUXfwpee9+T8wS9RDuRV
	 wrX1hCP5NRq109+dH27xQ7WDnXlpV+sF4GZwtNxGjcyX4Vo2H3USbzo098FZHvpnVaoTo
	 EwmNbAQJXybgjfsWtZr9cJUE5kmNG/RTPBDShNTFSW5lQpCVR+YWvAD3i7TAY8bCF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ex9MeRvg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F2606AB2A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50F2606AB2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ex9MeRvg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3243725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879148; x=1794483948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=ex9MeRvgxf8OthR+ykcSraFjQf2M1WOA86U2Fyr8z/S/bLhwMNSebNL2K8bhaHn9Go
         BjkkSM0e5+zsm2UFf+xBByJOR9siue/+yqCJH9aelxgYEznoKWP3rg8CflugEMzk5h96
         8i2GSpmycaB1kcqQXKQMAfD2XYU2eStmfOp7L+Jgr2fhiG0vioIcGaUH9ZP6rePGZB9U
         OgEaUR2KuIuTq4Fl8Q0AgcdeE5DXUVGmadz8eGW/ndq6JY9iViPlXbDI+Igyd0KugMXO
         YogmN7vDE4ufq2kBuv1aFznTMoLBD/g4bIPKm20fNOZWS58AMkDLrnPIUIiV+WPshWtA
         +4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879148; x=1794483948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=M9pNi8XtSlHDSg9Lam2VwgnlkGD5/9G4htE8VhjMXXTddyN2lpTJ54hv4UdD3vFFOq
         C3mICuJ8H208EHkFdvdUt2N1TWjXQcEDsOSxJJbtI50L+ZgaOq39XzIGKdM7ES42YEsq
         NbKNhG1FhFj6wTFkN2Ru7czsypxLYyCca7TQMz0J6xZPcR7w1sayCZLYkw74hF/kGdvH
         eN43DEJoiXiYVct6lLwXylh0W6iN5MKNWYbXIN84w1jGh1Bv443fBnkIStxx+kudLkMy
         AzkTn9ZP8wf/XjBudCsqr8Eb3DE5Ak55do51iMNpcltqWAnSaTDWz5OZTuiPglUZ4ekb
         a1tQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1NnSBjY/6KhV8AEZfJUjscB0snIPRc354+LPQoBCsK+3nSfvjlWx/oCSM4PK/3TuCztF0f6y1OVWB7Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q7LL/0jAOq5ipCUm4jZnQzUPnZTi0zYFy3Bs4epPBPnPMvkay
	vJEAaa2KMCrMYHy4z8BGBeZUoISirWwVFCC8dppSG3oVyGsulN3X8uGZFE528P892cM=
X-Gm-Gg: AYBFou2saOrp6dlraXbWzQ3nUsNKrypOqQrqepCDvQF+eolexokECxMoalSOy8Fdsq8
	Ty1pXCkCSuY6Oy188TMLSAjQygRSm/VujVws3lyoh4s+GmRF5hUZFVp8AN2StyTwQtV5wEFzNBp
	Pxg5Ep+jG54MPHC2xqxXCn5Lo23ffA5tYh+frqW7j0KXJgyIdU5/ymvhZciBOq7mqByBC6yiRQs
	73vq6eMeaOIx1j/D/Fp5igQWAxxAhl9dOYRtv+IGlf3Ymd1GzNOG5YekD/6BpOdxHV14U2N4ieX
	p007jLKC8UlQE4/Ct5Ix9mVymmo+/JNxAjsazlSKSSsjxtgY3J7rOi6G4ZuMNkjAs95cW9Q+FS+
	9Cu2VnaIRV2hbKgYuvxE9k8lznos+rbOBa4GKkQMqCMjoBPvoGrZAAULK5GQ52YG2hIm6H+KrHV
	ULvRy9psdtN/PZM9uJrI1XBK6+1S5zPNeIOGpR2T90mCmUoCwsdlyzcMe5V73pPxCZe+p5ViYqr
	lXLH4i9K4ZY8qpIhgcMwByEmGY9RQKlIwrIhPMv29Gov8mlYQeZOtcCEvGZZ9W/tSJqTcHMUeey
	MmwuKpnjbNZXxNroW8R1losouWPIPdY7
X-Received: by 2002:a05:600c:e556:20b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b55e07fb14mr25741525e9.17.1793879148405;
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:07 +0000
Subject: [PATCH v4 19/19] perf test: cs-etm: Increase snapshot size
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-19-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

AUX maps require at least two pages, so for machines with 64K pages,
128K is the minimum.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index 236c4160e480..404317c2b96f 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -48,7 +48,7 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,128K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
 		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
@@ -60,7 +60,7 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,128K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
 	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}

-- 
2.43.0

