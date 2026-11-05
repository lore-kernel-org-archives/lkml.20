Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879127;
	b=f7lGXWFqMxXYHtSAOLHHZXphN+/KdNQzgfQvHBUWYUo3de6K3Jm+CXJM1lzB+wCyqpMg
	 uJMH2OBFh3swfPZ21x4BxQrLTzPrh3bMzTCJGD8Hg3TSrnX7CFTvu9wPLC+5XL6rUImLU
	 vlCyvzUrgWHVJM2J10rm8RmmlfWfVrWEj9E5C+DIyhNLtKx4d0KsnhTxI4U10+Xst1+JN
	 tHB+OtFeMQfnD5LEAkl8QKrHojvEMD7OM14/N5L21FxWoEK7+E7R/9ZpIjztclpzdyhXB
	 Yxb33eZkW4aUP23agb8lKLRjpBkVv0QNcXnUfI8QYuzuivp82wUaZ4BEZHDiB5j3mNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=;
	b=AN9Udy5+eX8R8RwY7niM3xe7EaT+189b/0lf2lgvApORmabQKSm3oKJAhgh1+F+1dHrx
	 oz7w+URVMX+o9TdeHN6SE9thIAl1LWX20y/pZVKr8SZ+qWPCZqjHYpvObnuLuYck5cNdg
	 2vDihIWWyFteQhhPRnEs4BxI7wxIxkZ6aawzmc2rEl7sVX1z4DUdFmAcYUC0/mG0lE6HL
	 aL0D9A0z5yj1W4r65HjnmaY7ZnCqI/gVLs5nGM5LIQ8a7MoFKUqpk83aJKQyUkTMPhxWM
	 f5To8MkCdcsZLyC7Nkuh7WfJhrtbC/SmorQvYX0+A+JchEszXlw08e0FCuh5mxBfFrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A8uSXyPA;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391760A2631
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8391760A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A8uSXyPA
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13102565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879126; x=1794483926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=;
        b=A8uSXyPAqFoOTkLLV+iI905Xedk7CkwIA29YdbCgbnIpu7fyhua/i0khkxpQfAVqBD
         auNk4Rko/WVIpHwhOqDla5H4kos0bfgch3DJhSBU9gnjAx1sYF6wwNbees9GDy0+K6Hc
         R7y9gVnfGQxt/ruSLGKhkAPxwDgMYmhRYEwO1iHt91v7aYe19bBfbbF55VzLWEl5mANs
         9xmgd4sv+DQ526W26cvYz4cRiaX7QxR7st3sj0WBc+tQcu81P+tWUaHga0DLsFuTe6nU
         6JxLtzCusP7X9f9GFjry652VhA4umdX30UnlJGGfXFz6CGK1LmN5Y3tli98fc3AqToLm
         eFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879126; x=1794483926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=;
        b=zXIEmSs/9/0Nba5HdiOw+4w0EOWpf8jSFWc3ch0MpIO+oLXPsJbY2/Bpn5fkkHWn5w
         dPQNkOHpdCCs1OrrxNUkuL5MiGc4CEWzoe7miJ/9SbOq0edGP84dy7BLaBwXHgg10Ddd
         vZqiPAD+91SGWyRuFYPz7+E1iZBJWleXko7Jna/iJD6yws9NL/s9OoDEUkiWPFsEMTwp
         7U44Zhl4h7XLSQIx8uHftPeCKjvUDUXBCoGW1+lo+69nkAz/QPylYoQcfUAp3+2QvUBs
         TK/yNTN7ZcxF/1iSTRjtnPnI9zeTIlkh/X+lrNTMX6/ULrX5BSbrQww2u/SIpzNw3e0q
         dZaw==
X-Forwarded-Encrypted: i=1; AKwUvBxbfDgj88cogzvihqkwkm7f/s1ewIvdKZgOc5UhGYJAKvp2U8xqZAlClu299F7BTADflC0YNIbcA1Qwdqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z96qKM4MLNJnAIZzUjpM9sg533H38MNqCUmyJl5nYjNcYPrdNnq
	+1PwIVIwaee9ZcXziPXCOXPPwOJZj3IfGrh2WLDW54LLSKeaJ9hLMcJG2gZRMr8IRso=
X-Gm-Gg: AYBFou38twMFjpddkGKtk/eRYjhFjvFQX85VxadL4rkdGu18KdEvSDTH+z0zgqpODiq
	gV+6/Lu0Vj573kSaFfcinCzzVzleuKQIxILUAcxT9TU/uEfDC3RPMrT1arbSp6nTgFu4e4DZWEQ
	PQwyAuAmP41yY3y/b71yTzsp9mFvgEgOzsvwtW4auk+PnAxMSUs6h2A202l3XLN0rFWtiktGqD7
	qhU1DBw9gdFVpwoB4K09CfpR/jy0oKXzwlhLlkCfFDAetz+vIm0JQBCw9CXphagAdPIkSkiRsFB
	XvVYWeMSv8YZqYGkd50s5aH9B8DZNp6kJCw/ELGvGLmBaDn7yLanMVYzdbkfay3CKakyrg4rAZJ
	l8YVwo+VY5GqyViiLg85PnF+5YxRtRqVUphLX1QEsUTkHnI4Pi5+D7On3EGR97Xf+IvC8y7Klr/
	gBtjcBWhqUahxxRWi3tRInalrNLhN/WLhKfqW+Cad7L/7HpSnae1kaU9qlKeMIa7uzjk+5a1uyX
	8xENYjqTKj6q2Xzv0lSasLQVyT1gfvnzFJddxg48wJqYGXAe9Nqxe4vrYGC1vZ+qX9uBNp5O54R
	1XEIPN9wU7iT36i3FKiKInOU2mqBdB6O
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr417649255e9.30.1793879125831;
        Thu, 05 Nov 2026 03:45:25 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:53 +0000
Subject: [PATCH v4 05/19] perf test: cs-etm: Increase window size in
 disassembly test
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-5-7759e0ce2449@linaro.org>
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

When we increase the default timestamp interval in a later commit, less
trace will be recorded. At the moment the amount of trace overflows the
64K buffer, so the exit snapshot trace is what happened at the end of
the process rather than the beginning. With the new default interval,
the entire execution will be contained in one buffer and the first few
samples are always various instruction and data faults. These go to the
kernel so don't result in ranges that can be disassembled.

Increase the window to 6 samples to ensure something with a branch can
be disassembled even with the fault samples.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index d298b18154b2..236c4160e480 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -50,7 +50,7 @@ if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
-		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -62,7 +62,7 @@ fi
 echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
-	-d --stop-sample=2 2> /dev/null > ${file}
+	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.43.0

