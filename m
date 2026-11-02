Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621750;
	b=VOqz9x2fx0G9OCxsDPFS/1pMrbUqnVzGZ/V1PZtlW5aNag+bHetjmZtnTsQw3ONsPjqA
	 od0SzVkvGTfKd081FEWPwMXXV1FKlTrO5dVlDmJQxYnZi5Hj776PpqW4s2CIpXL4wzfVX
	 Jk+cHj4F+JRF6e0uWsMN5osvq9pMza3if/cmjdag2snU/e2FZ37EPfvyfsBvssbuVvmJI
	 f+NR6YnN3sBLGpQT6gfdAGTQTLnV7myOZtYhrf65vrtuPoFCqLXuH5vKRrsyvrkdKTc/h
	 CfEhpapzSDBooR7zs1J1msYr9bYIOOSIAHUfS7m4TgYlRpjV0HLZLaw3tIfZVpz4zMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
	b=Pay5J8t5R3SG7PqjTtEy2fn0/+gBc1WC4uHdOw1ZtIF70GiYrGF24i1kywYIJa6SX68w
	 eH+BPraz7+WWMmfCTaTfy1akcbstvH4uVs+4IqVAZENm7GEgut8jfqkC8kMZU5wL57OKL
	 CAA4aT6iZeIH3AfaSN06/3J7HHC5HmsIb68wZAbbGbHUmZIYIIZuUGdwV04Vm+9Er2zpa
	 280l/ZbUrgdZexvG/Q7NK74oOAMSdilOdUJD8iqSWfsDZKd5Sq4HttTCp5wkt2Fxr9VWE
	 LTeAnJThJinyIlalKUNYR2ye6w42aAUlpJloZDf7KMqoKN7t1IvZVwhecQp2vYdKEyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jAyjX8Rj;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6920C60A3811
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6920C60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jAyjX8Rj
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18446695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621749; x=1794226549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=jAyjX8RjikbSFOz5r/4iZSr/XrWjeb8swvY9HDzvFD1DH8Kntoq8ZhuLVTIVkUl2MB
         FWoArT1ZtuATqoAEhlSo7JGby6VeNVxrowZrXhz5PMqHnriraQRM7poLHdwu4wKNeHzz
         cUbEdWg+qVQsum2j+4tW8aTNKNxosI1P0+Y/Jlz0Fb+gVTIEZ93CscZ5tHnujXeux3yq
         i8RZJrj0piV5/3CWkQHFo+lxJ65Rh8TtRlCnA8ftaZDtrHYNtoytBuoGuF8Akc5Y9pQx
         J40nLhmsQ1QpO+GYecxtag2hBmA7JWsH588DsFKM3WJX7PfxI/jumvJWdfGJ3tqjvXje
         DhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621749; x=1794226549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=u0T6Ci2jifplNokI1lgb9TvRBWv3PKBTP2+nkFp25PjkZTJlXnwy2ugke0aErYDwb4
         rupkncGZboz5+0pQnFZuV5TEuR/Z/TtY1CmMI7O51XS8Im7tEodda40LuWwI3MW5z2BB
         6QTzKGSszKY3buYmj6Dl8CHb6iAScSkMyF1Yhfk5vw/r2qTVqr84HwhXfY/iI6tm69HQ
         uZOkuhEn6fye59CX9eQU9moYxD9I6A2UywufDkFu1f8IEe5M36WFJ4xcebYw9rQgJRCJ
         vxbBNlO3BMNwa6I87TccfPoQxsmtDJpJ5ku2aQLpzLJzPo7iPGO3ohYK2iRJymEVCuus
         dKhA==
X-Forwarded-Encrypted: i=1; AKwUvBywgn/2qLZ7HS2Q/RIjVQPOZuf90/b5N9BHcmR0oLEyn1g/0eUUePOK47yQUeIfQdhpDb6qqLgcEaJFCPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw0VtMMibAPJt3nYrSkqjy8pyulGFA+x8vUfgna8xvq3wduHA5
	Rr11yBAHiGO73Ta4CMsXmR4u21+myfDM7mS3U1sEXT1zskVln+a3S0TOs7+jYYpHOhE=
X-Gm-Gg: AYBFou3Qb6OpPW2bOC5mF1oaKpz+amEf/aG7mCfN65148Ef7uIpJUV9Jfz+gxhQ+NZQ
	pkAHhpeiZIcRoT6/mCK2GZtwiMTi4NKDaPzmcldlgZZEKFm/JHrguI50U0QCXR0dhBi4oISiBM6
	YOt6d2wEeqneH0TCvF0VYdLecH9nk+tE0MxgpkyBkT8teCk22Zaohzkp9iQF8gXkQimhWt5B5q9
	ZHBYSUHim57UrST+jCo6MTRWsMgqE1/03znS31S+S4GSr0RXzQhK2PBDbO5wNqUs/tchxIg1dn1
	JzeL0j3DB22S0o8DZOSZuKAS9S35Efekg3iKAb70mxQgqZ70/+Dd/T8thnHZo/sVyu5h2vbtC6c
	Rf3IXCCTgHs5oa/TQ34Op6KEZVwnPe6oYtypAzrG82aYXdX/mMsmpLuvzq3f/L1oBakaYzj3nrz
	n3Iyc4ComSXCHXtkffW8V09bnsFJvF+EWod1XeDP1PvTkCDIHCX+LkFLpWY7mpAU0tAYrltAu3W
	Sh7SWiTy7hwED8jjIXm5+67UatZyaO6yrecmrjg0EeNN3lBW5AYqV4Euc5O5//LMAov8LLtuZz9
	3C2HtVhD5t74JDWr0EwpSik8KjmSXe/v
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4ac16acfbd0mr207623275e9.7.1793621748831;
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:19 +0000
Subject: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

