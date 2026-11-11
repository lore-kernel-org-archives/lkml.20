Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370254;
	b=1eBlQdbPJeC7yb3aOn4t3+SpHfqC0EyTz3uhSo5Ov3O/S625qC7y8r4VaRbMoaDwcre0
	 a6Qf99Z7uRwhOZ3wbsNMpw13Ov8jLc21KBnp52IL982arxXo+fdH1SxfWDUW0r7Ol+Ec7
	 GKpsRNt/I15/ELirNWT9waaw9ta7ITip3Hg2nlJtlcX29ELqH3nHpp30YSDcRGIe9gMgp
	 rJ15YNv6aESjFKbtWvgj9z13+2C3c1fq8sjFSkxHeQesbvIEDBEbMmT6JBFCOvEPhffyD
	 JNezd5sV1PJY19ieuZ9jjOZb+BS+hYbZfYIH4Hjqitb1XDulzgJoZCRykPElvYPve8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zoL2/7JQxDTvuJVaxISLhB6m4cChWTGyX92zpA8Fl4I=;
	b=OzchVhij3+IkF+URWpvVA2Z+3zGNSWw1FOimc+CSmmT7czvOsEcVvYns7rtGayK52NKH
	 Dt80cszy9C338Hz2kXq0yv0u8960E8FkQPDZ7aFdgDx05Qcqb1vmv2jx6tuh2+1aRJBXj
	 aGuABHsrdXE1DiqKtr2Aga7mnRAOUpJwyGlLaGGlF2z/rg14XX08S2G2J5BJCQyl3POFU
	 TdITFA3EDXKkpS2rW8VpXHV04J9rNshN2GeqOKkNZZcvspFGF7ktWQv2GB5VUySv4YMcd
	 MoXQ5osrLc26YmKiIaoIci5J9YPGQa8uQ3THyc6Xr5TFqrt8v7lU9CGx5UxoyEr+cFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bi/ey2zW";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935660A260D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D935660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bi/ey2zW
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2316896c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370253; x=1794975053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoL2/7JQxDTvuJVaxISLhB6m4cChWTGyX92zpA8Fl4I=;
        b=Bi/ey2zW7C/L5ukzt09f8eL2gNGClkVSCKGwwQpcTOP8mxsBI5MKJBzTl2/RT1qCp/
         SghG/hBIE5vp4TqSgVbPe8RIBDa2RDBplLFageBqB4rINR9I+HiqX3p5Orf0N0SzAISR
         UYK/s0QCi4YWsCxbaKm9D0e81vFYIQFpSlnAGiQWLMbYQn0Ofow3l/dygShiWBH5bXJH
         CYj1zKGQAmlMQKreXZrb0hu/ddK0gLcplUvOw3Dprq7+eQkKc6VZnPBJWYQMFtaDp01n
         odYXdgkjEoGkWOnZpJX1JGcCbYIICuVrz8MA57wsW2Op7grfdXaxAgMFcfxR1OcOe3E7
         4cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370253; x=1794975053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zoL2/7JQxDTvuJVaxISLhB6m4cChWTGyX92zpA8Fl4I=;
        b=seYai9embsEevszdAIGaaMSixuIEvfOhvsX1WbWI+T9m17HS9qBtQphZa7MQ00kK9+
         ljrTdFnvanoq3m8mReMqxaKjIFnyjbQoeqDyA4ngtWBxAyCrIDJWy+Orr+PrOQEe9tvN
         WKg5jcKoVE+T2GLnnjFibaQ6XPfQIs6j2ZpFAOpiha+YPtzVq620T0ydFBCZsOuGzJFU
         pDftuZieq15yeHZr8kdHdcKLNwn2oe+vtvpr+cCK1P1svaKHu/oM3Ip9DExSxpOajb+J
         acOshDJ1s8ODV0iRyn5/tyb+5irx6KUFDeT/TDHY0j2l5toyfeSbYX2xqhe7sYOsu7Hb
         o5+g==
X-Forwarded-Encrypted: i=1; AL+hErGJYK0p/qxbkmv6L20usZBAymadwpxcI7bjBSFYS8YUm+qtgNPzWim1blqZtMF4YWGuECKUJNbzUuS99TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/xmr6ZwwnDpN1A3ZLco2sO3QjCfYqmwOIe0cT793J1ZOqMmsi
	4Mae9mE51CnkfY2IzsdRpPZAKfn6j/FMEgT8AMTauZMf0CcJ2rs+0qEY
X-Gm-Gg: AYBFou0fWMXSiX3sMlJqd2qlf4LX2cs86s5z7+Tv0IvrvAimdQ6R98DRpOCnVAVT+Nn
	Ga/IueeHKXJ1O4frb/C0IG9K1KG+bIv8ZRQSyO6NSvsrsBqEARgax5yyZrbYRYMLtXKSZuUNcXS
	GJTQ3kx+nQOQ5277AZL65y5CGkgEl73nRj0hcZ2OC/gCqEBRNMhOxQYzuoNwSRZbWKTo8U5QOkw
	FZIS1+b+W++iUdZ5vTInlOo9t5g4JomIU/0kh3K+IT0mGBAU/B+o/1+rZVEEE+vdWqw9Dzth9go
	3qX/DP8I84vaLzULN0TLx18ITqUy66T3lO6pgOEiSlK7csgeU3zhyFEEqTmTZWlz8Q217Z8014h
	RNX7qF3qXWaPoE9WuXikNlGOwnsiVc11KEV20imEoqqgTBYRFg2Do+U+sCxtkPZPNP0+vTjND8B
	FoyHFEjrMGjyTGpXRWvvdp6tHlZBYxEdFC/VmcuLDQsEAGzwmrOQW2WXyTVo9zefSnFjAHwhZbt
	tzV7rT43++2yQOcbxYq/IfTEVfORcA7lNb3DMl9DWV61P84pwMl/9ldjORL2XQ+M2Q/Y80ch53T
	EJcTgMz54onGS/PFvN/k
X-Received: by 2002:a05:7022:f519:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b3c03387damr1031195c88.5.1794370252750;
        Tue, 10 Nov 2026 20:10:52 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11451201c88.2.2026.11.10.20.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:10:52 -0800 (PST)
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
Subject: [PATCH v4 2/3] perf jevents: Make the model argument optional
Date: Wed, 11 Nov 2026 04:10:43 +0000
Message-ID: <20261111041045.2031464-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111041045.2031464-1-takano32@gmail.com>
References: <20261111034333.2019831-1-takano32@gmail.com>
 <20261111041045.2031464-1-takano32@gmail.com>
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
v4: the check's try/except moves into a function, so the name it binds
    is not a module global that makes every local `e` trip pylint's
    redefined-outer-name in the pylint-pmu-events target.  An empty
    table list is an error only for a build that named an architecture:
    --check still reports the failures it collected, and arch=none
    writes the empty tables it wrote before.  Both raised by Sashiko.
v3: metricgroups.json and the string table are read before the output
    files are opened, so a table that does not parse leaves them alone.

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

