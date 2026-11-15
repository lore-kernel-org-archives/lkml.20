Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703167;
	b=5HR3VLCUdZgZRmo8WyieJh2EJtK+7Oz3DdUviaf1Qqy0sEKFylkFE6xl1CsPCG/Pey+o
	 OqqQ7crGdGsgxiKn+3JdluLw+T/7pSy39G3CGjqD8Oq58XKXCx+e/hVZJneNABALA5y1S
	 CegewKymRDbl8t3pktaxrlRnjeSuoNbN6EaXznF9LCDMlpORB/l6blGUTA5vZyW3Ch+fk
	 ZQd7S8OlZT+ICqEffqRU8AvMczDYf+VpwxNOqeo3qLFLdr4Vts47zs9cDJiVvX7wP6cp0
	 RgyJeymNu1AG7BiwoNbTr47I95fTWAQUWxr49QrBHy2r5LQOCzIcHbtlzKC78EdB9xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=In7taLgVFQA5m5lyqlspkXmcysL0qzWGD5dgQ5EARs8=;
	b=dNOjJssvXlMSXiGsZLma2/sfz/3WMPawQubop/Pji/Dcekd7r99KzsQomxDTGGafEOUs
	 0hJyoDrb+VNwWJC+1ARAqjiScb51UOhJ92JHB6HWlhrSgFYtflcE3JeQOlCODUU1StmLW
	 tgAtf8n+lvjxCrSzMpCqis0pYHkX4iW8wYEqArVZRD3pF65jlseKrQqO3DHkiTpmMNstr
	 i4606ydn8l9KsIw0ZRkf+JUwqiDhNYBrx4iCA3SdJek27aFCZdB34a1gxS6/y3wgPuoq5
	 2cO2O+pd1usjekTfaRfgIWPEZXJaIG0Je47zLvmhDLVCA3M2PELiA/i7NkhE0LnBtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wY4VLEuA;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72638606A88F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72638606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wY4VLEuA
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso121195d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703166; x=1795307966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=In7taLgVFQA5m5lyqlspkXmcysL0qzWGD5dgQ5EARs8=;
        b=wY4VLEuAA/KIJHVw2y14bVt/1IvnsO/2lsrfS8dK4/JtUzG3xMEW6snsr/3mCLEXD7
         /mJQynQBbXcOLNoWe8G4R7cHwLNgJ+XEkbok9KTiv7iB0AswS6KrWpmRRgN1R0kts5sM
         hkw65/63Aayu0Ktdr9sZk3nB7aNJRQ7ua3qC0jQBuvUgKUgNycGdIdUZVDo/qDV1t1/o
         iq2gM5zcEyGIov259kJSpHRB0K+hDEoSS6KbQT/khsZiv4SwtbyIPbo4iIWiQWJBL8bY
         cBB5gsSykgmAICevP72uRUoeEwN4wGdJ329zOmhH2UsGLFpIkFAV1RNmq1bRVYDtOdWK
         R/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703166; x=1795307966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=In7taLgVFQA5m5lyqlspkXmcysL0qzWGD5dgQ5EARs8=;
        b=wvJVfMEtb1mY3YHNoEwDG9/iXL/jjiKRrTC/K5sRNXLT69lXtblZJi1ri2S6gY+c7v
         6G5kGa/ZiieeRGN+Ik5/3JpMfCgoFrf5hCmBnh37aOl/zRoZKJ82nmxtZvI6SMfVlgEf
         BZZy4cXhhlmgKARb0E+fx7EXr6rq4RruV2CdF2ChQ9QDLkYQOrUXoMuGEreNc9rbh556
         T+IEr1cmYlY+5klMKHjR9b7/54lHNkQQ7A2kUFqXZanR7bnDWAmqqt0wmiNSKHCdnsoa
         JT9332fRezdAhxcfjF4fQX+Fs4QVeTbJqpPig/VvxCJjegYvVkq67J9Nw2wi5kg0RVha
         oiyw==
X-Forwarded-Encrypted: i=1; AL+hErEkTXsrU1cHusJkQHpWyqmoeXIef0II63qiwHJ3C8OVE9rraNw3d81Jdkn2suuKDUj3Q4HlBsoiRhboAlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FhStVBeZkCfxLCuXQPxntoXrPLSsnB+gF9pQDqyy9NLLKYttp
	KABRo3f8xFvb8jH2L9cruUNnH6NAldAMltI/BrmIDzOnerYP2aL/PSKx
X-Gm-Gg: AYBFou21oGuiMttQWb7PWEIz0i6Ul12XAB+6Hif0lrvs2bTvJGaGeZ153jOywgmHL5n
	UcQHMfR3I8qq4wxOlWnXgzX5Yq0OaFeOD1uT1w7SbIKAUss/giHOf7E1w34NmM9q5eG4pAAPY7W
	s+pkXO9GLp3NF8ya92noFX4xHQhvUFn76AJy5sD3VmRmq+tFGoZ29KOYqq2nBaaWVjVdqZCK50l
	qkFeHTb/Xa/vN/XwQ75Y3fs3HZRu1EkwCRlg1X2E0A2VNfqicyB1HkG9KUSH18lt9pkmFAhKClm
	YfiUnbkhtepKPG0ciYOf4xHfTD+1sY8npWqFztQBTe8tVbNUAL18DFTKnAPo3gZeB3Y4OVRgAaq
	KUWk3K/oNKDMDZtjDJC7KTGuTcSzQjL4Ie45rTBKE9SY7UIBxcVdxL/jzvqg/xoqqqU7ss91EL6
	YTz4XlYBcTSxPCYVbC5wDwWUnSO6dsV25wEXM413C0lQgiWb0C+SmDLQ1MQkBT7fXX7qq1XGCSQ
	NTQROC6lmsYgqNlqOBuArG+b+59UjYso5X/bmiYFtelCUnqpvsOlgvfWEHxSTlCDniffSMqx2F+
	OaE3Fn1FC4maJxetWCQsD8OYHEm7TjjPo8pB7Fr/J3Avh1Bf+xZkmHji
X-Received: by 2002:a05:690e:4894:20b0:676:a43e:ea5d with SMTP id 956f58d0204a3-67d89716d43mr2084844d50.94.1794703165433;
        Sat, 14 Nov 2026 16:39:25 -0800 (PST)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm189602d50.19.2026.11.14.16.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:39:25 -0800 (PST)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: adrian.hunter@intel.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH 2/4] perf python: Add clockid attribute to session
Date: Sun, 15 Nov 2026 00:39:14 +0000
Message-ID: <20261115003916.1873857-3-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115003916.1873857-1-lalitmaganti@gmail.com>
References: <20261115003916.1873857-1-lalitmaganti@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With perf record -k/--clockid, sample times come from the given clock
instead of the perf clock, and the clock is saved in the perf.data
header. perf.session doesn't expose it, so a script can't tell which
clock its timestamps are in.

Add a "clockid" attribute with the clockid_t from the header, or None
if the default perf clock was used.

Assisted-by: LLM
Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 5b68d70c5216..71bc7719ac5c 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -500,6 +500,7 @@ class session:
         ...
     e_machine: int
     is_64_bit: bool
+    clockid: Optional[int]
     def process_events(self) -> None:
         """Process all events in the session."""
         ...
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 3ba3ce0e651c..274c66c28c1c 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -5330,6 +5330,14 @@ static PyObject *pyrf_session__getattro(struct pyrf_session *psession, PyObject
 			return PyBool_FromLong(sizeof(void *) == 8);
 		}
 	}
+	if (!strcmp(name_str, "clockid")) {
+		/* The clockid_t of perf record -k, None for the perf clock. */
+		struct perf_env *env = perf_session__env(psession->session);
+
+		if (!env->clock.enabled)
+			Py_RETURN_NONE;
+		return PyLong_FromLong(env->clock.clockid);
+	}
 	return PyObject_GenericGetAttr((PyObject *) psession, attr_name);
 }
 
-- 
2.56.0

