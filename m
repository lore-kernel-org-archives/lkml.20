Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403595;
	b=4gMQ3yE2Wf6AWrACMig9llPmSBwGwQklLBLSbZIIUU/Lc/8cBVHS7LbZn/yDaVISgtXZ
	 u7h0NXE3niZx+V8pVAgcNCMoKsiSnAMoCQBQowVPdDvq4vL9Fpq1MgfqjuLXtjoaUwgwK
	 1MoCFYxiszmImQnmpJxFA7Qv9g087dMDExjoZL/mkn7lac02f8Hp/ITJAbXLJN2iaC5mf
	 RyJc/jyegt1GX8hM4/uYxfvetMTFlxtJlh6UDKizrK12AApICE3cwJSSiDdl7Uf8FLdAl
	 IxJ0z2DxiHxpdXGYsy3eqRDg0GxeMLy7+SKPRDJu4AM2zkt+BZZzR+EazTwq1AtR2YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ghtp+PE6LdUGDreRnJGGRi2XX8O7cwFG1jCnP2ts9Ws=;
	b=lbHU6xpvgL5U+3TLx6pWQQ5qdyLXY14SJOW5hcSkO+Wb7VxMsiAMROkmm9zagJVYTYWJ
	 Hagln5AbtEHZoUPVo684n3EkXATbyBPU8OgoOBP9V0WcAySEKp32bpLL4G6CGIUmJetfE
	 eu0FkAuDpoLEu0MIRkJzduVFyRzVJf4oq3abFA56n4WvNU7XdQpduqG1DVVTRH7N/8DZ3
	 hmPjXE6C+q7v26ljEdhARUkQEQLb+6ngg4qtQCAIciHpm2kS1dzJBQ4B+d0fz86HN0O6e
	 v/TItyzmOUbPAs2StYDzLBjBwO5tJh6S9VPLAP8k/i3MLnkOY4clmXCFBvzeXfFH1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X65SPKsB;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588D606A8A0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8588D606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X65SPKsB
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so4949210c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403595; x=1795008395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghtp+PE6LdUGDreRnJGGRi2XX8O7cwFG1jCnP2ts9Ws=;
        b=X65SPKsBc6V/vkmkmUwzOgjwbhZ/Q2KndzScC4GzhEob6d2GbrKOZEFRZuoSEj60Np
         u6h5PqxC8gcFqo1HmTy1j9MZNYTDF7sFYeljC4hJofrUx0r9Fb0ieXabp6kYCJ4XW7yH
         XHpzBlkoQE1NkgJwnWXrRMUt0kERN0EFgnnMWHDCgiXw0CmIbiSnLGeva+4ZZ5vgHo7+
         YjO3nloPiMqyj6rWJbqQqGG8raBTJrftTZcY1eiU3+Wrm9janE+OkbhjVRQGhjNUkh86
         RuYlYewmsy5TkYbGhvCR8S2SsCNU4HWwivd/5AbusmzB9eTQ0esNsV5nIGKqqMqLRTW3
         UcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403595; x=1795008395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghtp+PE6LdUGDreRnJGGRi2XX8O7cwFG1jCnP2ts9Ws=;
        b=aHkp6BrfjpPUolEy3vZdudZS7gJjThgTh0NxjJlaVA/mn7ThulYDLgPKX9MQptaf7y
         jKU2xO2nL2FpxBkBQ/49UdVPnjEd7DU3E3/0fytx2bxbxMMZ3SO2O6SQL+UE7SOssfZL
         uiFQPwblSNAPLYw9vqcGTlqtBQWlVW8xHzUafi6UhqPhm+eTIU3FnyLwBnDBraJJvotj
         02cKFK+kddkuKPPfjmKrEXDRt+0kW7wpiBroQTyq7jNTiUMLzMesvZqVbKUA2PQDmN7l
         GQ5HwD9rDiB4vJNlvNGune8ZBRZ0BFmzKwhKUtGa924tJgK6jvoBvF+nmNURhicsChye
         Mcug==
X-Forwarded-Encrypted: i=1; AL+hErFggmceAXnQr1VPrjYif5hVku/K38uLOGDn5NYhElQg5zuaI4PNnayQYe2PNjYCCNhezVd/UWSMUV2hhbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cxIlEX5HfBlPjP2FAquKqEmK4lWyfa7Kghe99HLNpMmMpgbAC
	MUXC/cyZIVF5vryfBjW3pV6Ej57HSpIJNzpQ/P0uQz0KxhZUw5mG5aSp
X-Gm-Gg: AYBFou3vXnVEBXd85rwVm9F+Rk1b67TXStGgu7YceWhUQ9WjBF+08l+ryM3b57qT4xV
	rROECKW8A6y829mFoMQjK3JNM6qI96zJa/x1dDJZ1fA/4RPo/BAQEn8I5HfmxGt6NXUUv5vtHVe
	4X9hl2NAkAzuEka++tZ8Ec04xqL39S6bAlEWPI8vddtIcn9wFsXOo/x6NOEfLxClbQ6S0MrSGa8
	gEawaiiUErXghhvQ2d4hIChIsEux9vDYO9ALjgpEe9eYZ5MFARFCacHs0c2QFNPUACMqNQFwQdB
	dqbGJ+uY4EXF17lYm5V1vsvjr70bNMJ+IFDPpptTFrA8H5njZckaWko+kGvINyctnrvNEro6vP+
	C7DOEAwdhg4JhIkw+gndDMaHdm28mu5C9TEAVzC4ebi197cFaFJ5nY6TtyAYmYAAzi8Ysfn4LRP
	G/bGpYhfmd+1S8ZK+uNIL+3bCW2B/l1/C1iHOWAoBYN5C5xwtC4+BgYR9qYqIGs2a9Y/s8C6Q6U
	WAXF5+elwd9WFcKlNnsQ6NzYEEl3fe5WrTkTeXrgCSKAjePHpRADdpyaZBNn7KkZyEgwOjxQdxh
	r9Cz+1zY3K6W9fSdVhpr2xpX8K5SenDma858jtReMQ==
X-Received: by 2002:a05:7022:107:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b3c024be7cmr3097668c88.3.1794403594435;
        Wed, 11 Nov 2026 05:26:34 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33053502c88.10.2026.11.11.05.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:26:33 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v5 2/3] perf jevents: Make the model argument optional
Date: Wed, 11 Nov 2026 13:26:21 +0000
Message-ID: <20261111132622.2349165-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111132622.2349165-1-takano32@gmail.com>
References: <20261111041045.2031464-1-takano32@gmail.com>
 <20261111132622.2349165-1-takano32@gmail.com>
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
v5: patch 3 says which keys a table may carry and checks the tree
    against that list, replacing the near-miss report that v4 had.
    The list is 51 names, 47 of which jevents.py reads; an architecture
    that is not there or is named as a path is an error (status 2)
    instead of a silent pass, and an object written without the list
    brackets is reported.  The name of a metricgroup is not treated as
    a key.  jsonschema is not used because perf's build would then
    require it, and the list holds the same names a schema would.
    The target is check-jevents, next to check-headers, and takes
    JEVENTS_CHECK_ARCH; a shell test covers a reported key, a clean
    tree and a missing architecture.

 tools/perf/pmu-events/jevents.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 61f778dcc1e5..f4dca47eb49b 100755
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

