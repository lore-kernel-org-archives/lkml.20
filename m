Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364497;
	b=wRJmWBWCn7tP0hRHt79aYA+8KjKTyvdC8uJq5pgAchwSdDJR9ZXO4bXGhfvZGTyhWqQE
	 ZMvsRffbpqg7QTxbF52b5mlgHLLTgEg+ItvaAmBMBHhB0uXyOPswbU7yk5iUHM2yXvuXV
	 JRiqt2ApOQr47B7Aq7Ici7fWqDaQ7/r49tNaQdJLtlh/qijE7hmDaUFoIvaA00uI+i/t1
	 hZyIIYKVFzrJupIytkwd3bbE+YPvX7pdzgPcrxpbodIQJ3Ad1dy89FI0n/ZxZRYumWgLk
	 YWmjtl59tD5zyU82RY3OOs1ZAA7JNyySBakRQaTIeCkJJMKNVzI0DrcBVNXsRrBKifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B8o0/xRruqTpJ2DVKaRWgCrVHgM1t4I71F6HF7YNPeI=;
	b=cSXwgI/z2EsrivHq9Za49XoI4f1CxwDKaQXlIsso8GK5zdmkuMk5/MhpHk3xDFtl41wd
	 7R6KNydQKLjStpAexJfUqVnofDRfQpvahY5MzvyWOHKR5PO3Fr3fY1uGfDaUTV5u1GFIR
	 qNjG+wCQlGv7+uGYaRgfTQZsEqxlCBfC56RcCBPSPl9PKOAwrhT1JCRpLvr5e3BQnqZFO
	 wHO+7eYW3OP7x+lQdGM3dTu/XO6wsbmI3BjS1A4zqov3/Ct996o+PytDBOLtFn4E3Z7WV
	 FYFSHA8RfMEjXC+7hD4JfT7IBMBIDjnLKyGP0dbo9Y5Aw8JQHOGByRNzQnlFzeB6xSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUZUAZ4u;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA81606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA81606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUZUAZ4u
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2156575c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364496; x=1794969296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8o0/xRruqTpJ2DVKaRWgCrVHgM1t4I71F6HF7YNPeI=;
        b=cUZUAZ4uxAQeNHm2vtPSqICmW+HCo9NyN1u+RqdUvUF5b2fHxEIBUcimMdCbsUZt4+
         F6nwsDB1Cr8vOU5SRx7OTxgjfQF8p5S6I7NoHLf2B4TEbeVDIdX2jUCOtsm7GWNVC6KQ
         LWP3j6mqSGMR237lyAXlRzUyJOHFyIy+w2vRmR+sPQJJpDFwn6q7nHASVV2hR/uwrf4K
         kzg30wG6EULzaLsWdljYgkN5z/gFSPrADGKfnAgBfO2WTxkt9uX5PoqN5kCeG6fIXR9/
         apq+kSY4w9fRvlN7hozuQ1/U54evyygV6k8xOzZchUYGXId8WSJUcWvYZKOmfnRh+Sex
         uq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364496; x=1794969296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8o0/xRruqTpJ2DVKaRWgCrVHgM1t4I71F6HF7YNPeI=;
        b=s05SRgkJaNmeL5t4Qjbpa8BMGDUkCa6PAVZ1kopt4mAN7FL6obemFaVj9P4Xs+8Ogl
         lGxpNbqCKkJ8bX0rJUvTCrDRKIStXLBAzCPMu+1WsH2nvurLcL+u0euxGrJ5M+6UQMaw
         i7LqSskseeNYJ/JwhWCbiD/f6uIx7SfXNAXGnhayMIQ7eRhVrE6HfkLCgY30MCYHneqe
         HcsbALiAhuoKLSIyzB4823bN346OoKXgGRQK6HGaMVx47zZV5PZirJXyE0f/DKAO7it2
         P1P2mqp+oKoWZem+qF80g9FMq+c/BTJiCkDpM5zbw4eM1GSCCa3rrwkQPurXiLKvp6u5
         oZZA==
X-Forwarded-Encrypted: i=1; AL+hErGn0ADh9EkzpGEBaboaATTzwTVVHkmFJNCx7ZtUCMaZg/tUy5zI21QwiNajvHZOuL0OTr0prZeZpWrgJOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V69VLS45DqeZtaqLlyTU9KHFdTLCfq2+7yOYQcIBf5mkbfpxN
	LMuEjFiKEi/HeDnSkj5MoAN+Kg5RTRhnES9E07/EB8P4w9iy8rdUVHV/
X-Gm-Gg: AYBFou3hym4kmvB3FJ5XoMqbthUw2O4xK3WZDvC5RTbflV/L6A5KDfTnKA9zj+XDT08
	TrWK8EWUyzPgfrEafW2agkLvH57kB8G4ihN6d5Ig6Rk38Xcq9114FzV3tEkhvjU7nu3lc8dlqO6
	xOiZZC9dvORyBBaCk9CZjGdvgzPbmOZWkMf//44l67TY46kqGKTGAWulQlRERlFH85v9b0xBuXS
	niLo0HWs+AR450BDXpsYJJF6EkvbphvHTjvn3aKxMHEOX2cQuVM3Ul2vZyVjLVACiz0kABBql2N
	ArQy2N1Y+3D09L4beOeJUivt/giQewjb88ZIkLDlEmSIBSZcu8zoz8PvftFtFl3uO+wkYXmXFbq
	CCtaE5+37essHrl+ENKVXZV+blaHTSpyU56+KYpleUkRumQX69d2zRzk9UosWZfLHvgS163vJPJ
	gdcLtYb2ruWaSeWNz8OGMYNXz4lsXSOotDfl+QDYwD+MiU1/gj25pQa0yv9yByy0Ait+VaDCFpp
	qlxLZ7mUOr5niYWhgHRWv4+4fYKiwJT/fvOXH3rfWeAF0456zzLbRVynsTvOKziLWSH4gvbWLKT
	8dekOR/nsePiAuDmrvF+0A==
X-Received: by 2002:a05:7023:d0d:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1b3c0310062mr1073203c88.17.1794364495954;
        Tue, 10 Nov 2026 18:34:55 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm11752369c88.4.2026.11.10.18.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:34:55 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/3] perf jevents: Make the model argument optional
Date: Wed, 11 Nov 2026 02:34:47 +0000
Message-ID: <20261111023448.1970467-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111023448.1970467-1-takano32@gmail.com>
References: <20261110222250.1864777-1-takano32@gmail.com>
 <20261111023448.1970467-1-takano32@gmail.com>
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

The model argument carries a default of "all", but a positional argument
with a default and no nargs is still required: "jevents.py x86 <dir>" exits
with "the following arguments are required: model", and so does any caller
that only wants the tables for an architecture.

Make it nargs='?' so the default is reachable and an omitted model means
"all".  Builds pass it explicitly, so the generated tables do not change.

Fixes: 5a09b1fd1b1f ("perf jevents: Add model list option")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 86060a228b75..844fa82887bb 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1486,10 +1486,10 @@ def main() -> None:
 
   ap = argparse.ArgumentParser()
   ap.add_argument('arch', help='Architecture name like x86')
-  ap.add_argument('model', help='''Select a model such as skylake to
-reduce the code size.  Normally set to "all". For architectures like
-ARM64 with an implementor/model, the model must include the implementor
-such as "arm/cortex-a34".''',
+  ap.add_argument('model', nargs='?', help='''Select a model such as skylake to
+reduce the code size.  Normally set to "all", and that is what an omitted
+model means. For architectures like ARM64 with an implementor/model, the
+model must include the implementor such as "arm/cortex-a34".''',
                   default='all')
   ap.add_argument(
       'starting_dir',
-- 
2.53.0

