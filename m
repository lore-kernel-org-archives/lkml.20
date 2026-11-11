Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368622;
	b=1M0QK5k54ZuLao7kpn0aAYNTKU6zq+Z46qkEdINByqlBjUhoN3/t3P+MEqGWQ8b/dvPl
	 jbG+MEQ0Yb6eu8TdQQ2nDREaY06b/PgJuCdm/AUuXGUOgSE1pqCikWPPAhLHtraJ/gQ7m
	 uqjCx55jhC4MREundVPiMEYnsLYbo2HFRHkIt+2hOTyXuUxaje5FhM7S7/ADV9mk7HQ4h
	 3jODaiws5kG0Kz9IsDbV5FjRD/UdJ31OYlAjcJgR7vSVj5LmC+96mJlsNnQ20kkAai3ox
	 MfpzMdhQovXm+/Cr8hY1lHVZPqnNqj9YbPnzVSgts7vCPIGpnRIkicHj32z62iLjDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ytpDuZk2ib/CPtHPIxmj3si9kiqbXk0AIF6ceCx7Zug=;
	b=wck5DBtoIRGFSmJwu2Bc5HcqQAztS4iJPsipRNxFvfP4g2EF7pwXxhJ1aje8iQM+jvnB
	 gX0uhVLUMyebKTfbz3P3wkngatOYUbClOBSnXX3BmjlfMQ4CiCXbIhgcRDXLS7jwDxjhX
	 7SOV8/UqkfLKD6UcbALJP3hrIjTqfhMeZBVxtBRPTLn7XvHDuWEPU9kJREoQbLVq1lkso
	 wtrWFeVdFmPX00Zw1GX+SXL9Ag/nWxvdJ7NvKZIPYjBnsgHa4laeXd5WGOA0YGuS8zUzZ
	 A9eAdU721bWfkXiUlO0U8pwzHjkyTDU2dLI7ycCLo4Agy2xT4jnm/a2Oh7LYqFUfNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe9L6Cdq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4560A2607
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD4560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe9L6Cdq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so4736882eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368621; x=1794973421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytpDuZk2ib/CPtHPIxmj3si9kiqbXk0AIF6ceCx7Zug=;
        b=xe9L6CdqqMzAu0SyjHpJnPVLf8VdU8tTl3l8LnaMLvniC9vPZEUyUrLLQUmTa+wZCQ
         wm9EzGCZq9f/bipVJ1bb4HkkSuc3qjew4mtkmyOMg4jqzCGHz/3vyW5EPkKLsfO2sQVW
         OkF5cl9k1Q8dzqjTl97TvtyuwlnQ6hM4gw5hPi/Z7BH+i840ZWap8qc45m2+oZl+IY7z
         vN3CW3pddT7yM4slXOdAku8eXUbi9HnmYNQee8whEx5ySd+KgTi04v39KkjqyMe9XRs4
         mc7/+aueBEStZe628/v8wvxYIX6L7SWoWOLXPrqX6y99PdhZKtmqNmZykmUKgLQ+89Pv
         oSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368621; x=1794973421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytpDuZk2ib/CPtHPIxmj3si9kiqbXk0AIF6ceCx7Zug=;
        b=Q7cYZa97b6+VbkaocGZXzd1jCrmm29YxNW0sKphPriqRSn9eW1Wue40c1ZxajLOlnM
         ObrrpT6xjyy5SceppZBOFf+P8+WBs3c5ckNzRUZn8dhy8hqOQkhaUl+FHYUX9JtVp2zc
         ZgHma6lSh5Dep+AtmPt4FVh1u3vJ0yFfOy9QgRssCAY+hENQcDPZsx7yu9GH2atd2dVx
         xUi4DlzPbTa1Bl8BzBZXLOwqkl9inJksHiS8S9BKLlxT8eI2QerNQKuG1Ivg5gxhBb2F
         t58ncFFBk27mMKhFFo1JpHXLQ7CIcKgthZPuBdbeZuqQn0UBr46z+VusSChSaLdFkjVp
         lU9A==
X-Forwarded-Encrypted: i=1; AL+hErGCUrUXIQNJZiJCV8EWhp3lC9RpTgBUNlX4BcUsXVPT2lsmEolE8PndPIpiaUtcjiXfwFDiZle9KugOLiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X2FVa9qV4dX+v1wapui+pR6lWsupjkuvHJdzvQx1/p9vMOn40
	D8WsO6SuEGt8H+knNYidr7KgAlKRvPMe94l4GxXB4M+lub0gHSNWEOnH
X-Gm-Gg: AYBFou0ZfopSoaGw0KGKQ59/zBBgXjG2rt4nW+RE/4jz+p46tpdpXw7Sol9p+9j4jXu
	apBlwVizbOL0jT7CfLhzIJ2AHGV4Y5d962RhT3taYFrDf6c/bJDdS1DBd/i3zlA7k9M2ogpya/a
	Mc/JSeuzszt0O8jRmnEtIGT5svzYN1tNhsHRMSFAXfkng7R/09Y06CwQjX02LcXD4xOLhkgPSOo
	kUmhr7hR5wtcDdx2hu6jlNKq5rdOMiEwAvIhz+H+4fIq7PuJu79/MpG4qkbWDLX1WnwouT/fp2H
	TJ85DehBTbRLuuYWmfId9dg10XQkGENtr+1l8k7qyqPpFYcWr9LWDqk8fuzajD3hNEHLIOkFUTZ
	3BOVGTOuxw3ZPlqO6pUCusank5vCV3uK7sewGbGRO9ClabXUZGqs4hhBxuC+SjYDJ1m9l7HTYrz
	BkcDr4lc0BcYdclLVkOJnVb/KC3wGDggwrh72gxMxJ6dVGgiA14FZdcUx5vbaN5Ip0bJULJskcm
	wsVuwLsMdRyBo4e6Ht5mmj54W+31lYeh76W8qiE04qzqjLwzfAlta6KT1Tv4QHZYX0w2hxkqCR3
	c417+AiFIsixQB/UXktzVvl12xQbr+Y6O/IWCX5uQw==
X-Received: by 2002:a05:693c:808b:b0:35d:d671:933a with SMTP id 5a478bee46e88-3768607a308mr1671315eec.15.1794368620691;
        Tue, 10 Nov 2026 19:43:40 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm13498026eec.19.2026.11.10.19.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:43:40 -0800 (PST)
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
Subject: [PATCH v3 2/3] perf jevents: Make the model argument optional
Date: Wed, 11 Nov 2026 03:43:31 +0000
Message-ID: <20261111034333.2019831-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111034333.2019831-1-takano32@gmail.com>
References: <20261111023448.1970467-1-takano32@gmail.com>
 <20261111034333.2019831-1-takano32@gmail.com>
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
v3: the pass that reads metricgroups.json, and the string table built
    from it, now run before the output files are opened.  Sashiko asked
    whether a failure there still truncates them: with this ordering
    nothing that parses a table runs after the open, and a table that
    does not parse leaves a named output file as it was.

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

