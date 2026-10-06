Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AC457E5F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291838; cv=none; b=Ozmcrr9/Y1uDsEnZ70Ze1OI+x5XI2KSCiIJ5gooe8NghrnZ5AjNUQfl/TdMaCqQprORHMTh7xpVRm9fNgkAjoLEQpPvPSUZoMLb+m8Iybo1b0m7wDwRKbCDTLp5qbsaUrL8s7ovMEu1mwiH7q5FO6DliQPzA3Oyo1pp4EgrKDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291838; c=relaxed/simple;
	bh=cZGv+RM43LYyL+G7mjZkb/QEwBbuRwqq9oCkCIPu7/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enHsdZg2o6qxP3WJQUMbA7qtFiokFSDu3jQ/VbwidDdou60yXwq6yFv6WXFSaFkihJviQGQNKjQfcZ3RFCdMlW+z1vq7kniv4lq4ndXV9yH/606r4NseMeYoq/IDGUjBgtZ/ojh5YiL0YHD+9sGoW0GJ47VLKTtYoOHxZuD/8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5YOPfLi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5YOPfLi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so6228425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791291835; x=1791896635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tKEuAkF3xbmMsA7ckHZOCsBm88L2R1/w48DUv6kTy4=;
        b=o5YOPfLiPhHAHzTWXIwNFkwcJaDC+tdNbGR6uVOFwO8813FWoniVVPAGj96l/Zt06E
         8ws5m5Izznp/cNxK5tKFetBOkv5avzWGTyK7NiWDa1jR0CGsgMAyrzXM3r98a3mqVgDs
         62bvpaCICqElGNJG1wkEUIiK5ANHQ4Z6QzJpCl4Z2u2zEUDEtgN+c76RcmARjy4JYvH9
         Fb8Wj19lma3doPtYmuUV9r1VThaEH4tMfpiG6V1Vak/H+gV5t7+UmQfbBN33u6fHWY/U
         iE5/csbK9YajDreQnAMpYd45K+weSMf/J4i6rpSc6euWIZ5ZYW/BdnA5DWkYSENg6+yv
         e06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291835; x=1791896635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tKEuAkF3xbmMsA7ckHZOCsBm88L2R1/w48DUv6kTy4=;
        b=Tuz/QCbWONT0k0oIZwvWQ/G8TWjrAGzgKxvBMi/EJefvhJH39AFCnZPZCvKp7DarWD
         d5rWXIpQRpnZH1OXXTzxxTG1Y/OJbINdwwaRwkvXPSMBJk4v0WrY8S/79jhlCuJdNK80
         6wp0LzdS5lP/OhYoG8JDGnJnQe+viThk0qbdGVUf1SLotgyo4NuQMnK3srDF53UMOE41
         X55X6Eo7CdT1GfnLMAXkZwhb9q1wdbtrVloIBW5W+Ums2rdDoD/XVeUoQiKrKaBacu7i
         MVcjpYUbWGgnVJUxEKAI6KM744l40AtFF1IYCsYUzmyFwb+nO2b9UfU0DKrALzy/dBHI
         fKGw==
X-Forwarded-Encrypted: i=1; AKwUvBzTeYEDB7u2+JZMakRiNMjHkDnLToCuchs+zCUgIMg2iITU+Xo1ufztHlUf+PuY/XGCfN3AtTSD9IoRNio=@vger.kernel.org
X-Gm-Message-State: AFuF++k8xxNOq+ja4ZhpoocQgPvFDPyNahP0iTcB4TIXUYF+5N4hnZkk
	+Ek5XTQEaKX3762uN1B7Wwg5TaoUcnmuWaP6sfPrzUuz4J2IQc2BMkUqUGXWWWeihPU=
X-Gm-Gg: AYBFou0UScRREW7WYJiX8jQjAle0oPzp9P7zpcaBTDEkN8Jq4HhxcXuB4j7ErWHAiR8
	kI6WBe1j0n/ZNSlN7QZGVCXH9iWnlY1HCnJO9XNG2H4CQwdfak6+hAbLi4Uj0R/jloYqaJgf6jq
	1BmYTs6NKSI7T1FlFv3FKK4lBeuL+F7WGcYWJQ6Ncilog4XomS12FJNId7yBBKNdUt7Eq0Xb6Kk
	WMNIelQ6bZYiKekZn1B8/sOJpFUdgzjtYbLz/mDIn86vChnn8CS1hOk/PC73/HvsGoRcYZTXYMN
	CFhEYJbwQk2oBLSoY4mNtwtpgJ/q1r54lelBF+yYKU7tknwqhQLUHKqz9H4jHmYfid7jrQ1CnJt
	Dt1cEJ5HUgNHcCMWfBEz93MUU/GXuxeX8YduJ8j9fCwgpmZaBcrl6t2+Wh/YYTMDmx272WmjxNv
	/oTxnDula+FrQxmdtCVDWzYUbNRTS1BHAkfg2so8O1utqgRuyJooG2RFBhI+kJ2d62gb/G6g==
X-Received: by 2002:a05:600c:6309:b0:4a1:7703:e537 with SMTP id 5b1f17b1804b1-4a17b5359fcmr23211325e9.10.1791291835000;
        Tue, 06 Oct 2026 06:03:55 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm78638295e9.9.2026.10.06.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:03:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 14:03:32 +0100
Subject: [PATCH 2/2] perf treport: Fix profile builder type narrowing in
 progress callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-james-perf-timechart-mypy-v1-2-e2c7edf4dd31@linaro.org>
References: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
In-Reply-To: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alice Rogers <alice.mei.rogers@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Mypy does not retain the narrowing of an optional local variable inside
the nested progress callback, causing the perf build to fail with:

  python/treport.py:649: error: Item "None" of "ProfileBuilder | None" has no attribute "cancelled" [union-attr]

Check the loading builder before assigning it to profile so the captured
variable is inferred as ProfileBuilder rather than
Optional[ProfileBuilder]. Keep the existing assertion and background
loading behavior.

Fixes: b379b70b7b7b ("perf treport: Show the profile while it loads")
Assisted-by: Codex:GPT-6.1-Sol
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/treport.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/python/treport.py b/tools/perf/python/treport.py
index e02121475370..fb583786b17a 100755
--- a/tools/perf/python/treport.py
+++ b/tools/perf/python/treport.py
@@ -638,8 +638,9 @@ class ReportApp(App):
     @work(thread=True, exclusive=True)
     def load_profile(self) -> None:
         """Build the profile in a thread so the UI stays responsive."""
-        profile = self.loading
-        assert profile is not None
+        loading = self.loading
+        assert loading is not None
+        profile = loading
 
         def progress() -> None:
             try:

-- 
2.43.0

