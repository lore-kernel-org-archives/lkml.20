Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97563C0A0C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600302; cv=none; b=Q1EHAgWTtntA3iu5V505k+wPiiGfLtAyjU/DmKppJQ93x16K+ThqsSHLio2c+28kPENp5pqnZPq4rew5jsQuHg9W2dP2MojMlnOoY6N5AVr5TyRXk7lbfJfWO4g2sx4Ttz0AojpEK0i4ZOJSFHb6C/CewM69spesbOwreYAiDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600302; c=relaxed/simple;
	bh=opqUuNwVVNIW8ea5IRUlxjD9JrJo4Pr8hTFI+t6s9dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kze58W7n6AxbBaJZXqns9pUz9KWtsVHEM/Wn2NTyvxLAeTS51/yqiKlsGF2TKYqiteQ3X74DB0PxytwaN2bMwRcI/nL5f0Y2BAcNm4YsXVg915eTvi/VS87nav9erQkEpUQvunEVuvNSZhBNfqyYfxyAUKT7XkpzaR9wRkBOVcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+B376hH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+B376hH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso22431635e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790600299; x=1791205099; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zy50wRanV9QRFX1Uc3aTqTuUchKwnDsmrwu1WF2sxfk=;
        b=l+B376hHwwBOuzuJGr1LwFcxII5632cv61CNicMrHjP6WoZhlwEJamA+AUfQ1Zuijp
         M8U9+rdQpXonjwF5S2AjH6cmMmtQd4oV5NsK+W1xu5hVDURY4aDMmVY6wKU0qFney2p4
         MtIcbkGvHGuAKmG8MasAEUQbHlbiWd0tbyDLn6HEzB/GOkW23uU25eWhNJd9uvAy86uJ
         23FmHaE/ISTBXW/UCd7qxHEWeihV9+MpW5MMYLPKFem7JGweXiteqc2FfXFlxk8TouaM
         AM7sQchq5MYvlmoNIbJuoHuwVT8FGbJY5mnOfbTVJtF+FFuwEBFDGO0YdSyRpLDfnYlg
         H1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600299; x=1791205099;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zy50wRanV9QRFX1Uc3aTqTuUchKwnDsmrwu1WF2sxfk=;
        b=oEZoU1y2GZTSKmrxZXF8UPeoU7tS4qr/Vm6WH9g//XqZGxqFsQPzSy4uh8my4eZ69+
         s0aAfoQTpUXZoBdZDoodWAjPQurMVANkMhTdAkyjyMZ2YCcWK2vmM24Hj0dmpcbURvWw
         2GT9Qkvn4bXHBxoKHRMk4S7HrKGBQn8yEsMpsssQL/RPMmvDSCslJNwE8Bh4gqbDSguo
         eZOwu3CIxR10K9CKIrFKn16keDcD2R14IAIBKdPbq01Gx90598CjO6EIICR1YrFVimcM
         YRWZPvhQ1AA5AV59HDy8GbjqllSY7BSjwpp/U+tplM+pWEFH3IkBzSPFBQUMOX/r9gfk
         RCAA==
X-Forwarded-Encrypted: i=1; AKwUvBxYUqH1XE4O4hjnQdZsHuWY6xR7NggmeaCpFOQ3YV7wx5dOSv/SGQjVvmfm9CZ6dU87SKPyI7jOOeJajeI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7gftK4rxOsOCqjayMnDaiveExAKi5TpBcfIH0mCf4AHUSjfYl
	DlG5aFSltW+7+Q0NAwdeDcklksiYCtUNv1fEUYZLAE2QOPQEmQg4JjMUUlOWD85CqreaPj/TGgK
	XH2GM99A=
X-Gm-Gg: AYBFou2spKCwXHNNrdgu5y7YTcAB8+jd2GSel8FXPR+xQB6Ha1DRphXWKosg+VRsFez
	+5nNUZ1JVCag+mEhXXR81y7HRsXJrqAZdeNCqnoP6oKcdFAURoXyyosMYVQA1fsRXAYiR15BG9H
	+3T63lqlVKeGrIoAPFN91T8LtWiEcmOXoJH/A1zyVA745DayJKbrZxsfM/yNdyCj5fjEkozsqWP
	BELrPGV9psldiKkO677OcqEIdAtI+Ev7+sdfFYcywiyR0bKxalH2yYvbXjt0zvpC0so3DqKNgnQ
	WsSWDXB5qklKiTB7/5QfvqIqqsdZtF0iMHp0NRMbFghFx/REl9N31TKwlFqt+lvMiCq1NpsqfXi
	+TYaxH3onGvuRDVNAyMk92s5eQfaOz1Hl6KSVT0PCaJyAZprq5RgJ21OcB3ZhQlWIrejQLQf2RT
	KO2IW8A9V0Q2XzK+jYQ7JAp32aUfug4lAIencLzD7h3TxHG3jZvfLoxzLC4PsfCVDw1TdBOwNXU
	Q==
X-Received: by 2002:a05:600c:8718:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49fe7bba7e7mr210571935e9.25.1790600298839;
        Mon, 28 Sep 2026 05:58:18 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fe71csm189530045e9.2.2026.09.28.05.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:58:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 28 Sep 2026 13:58:09 +0100
Subject: [PATCH] perf python: Fix arm-cs-trace-disasm type error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-james-perf-mypy-cs-disasm-v1-1-1bda909475ce@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGBkumoC/yXMQQrCMBBG4auUWTsQA5bqVcTFJPmrU0gNGRVL6
 d2NuvwW761kqAqjU7dSxUtN73PDftdRvMl8BWtqJu98745+4EkyjAvqyHkpC0fjpCaWGekgwYX
 eySDU+lIx6vv3Pl/+tmeYEB/fIW3bBwa3ATd9AAAA
X-Change-ID: 20260928-james-perf-mypy-cs-disasm-ed5ab0b60a8a
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The perf sample dso_bid getter returns a string or None, matching its
Optional[str] annotation. Attempting to decode it as bytes causes mypy
to report union-attr errors, even though this was behind a conditional
that checked for bytes type.

Use the string directly, retaining the fallback for an unknown build ID.

This fixes the following build error:

  python/arm-cs-trace-disasm.py:266: error: Item "None" of "str | None" has no attribute "decode"  [union-attr]

Fixes: 279b402e5143 ("perf python: Port arm-cs-trace-disasm to perf module")
Assisted-by: Codex:GPT-6-Astra
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index cf126ac79c18..1812ccaf4b20 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -263,9 +263,7 @@ class TraceDisasm:
 
         dso = getattr(sample, 'dso_long_name', None) or sample.dso or '[unknown]'
         symbol = sample.symbol or '[unknown]'
-        dso_bid = (sample.dso_bid.decode('utf-8')
-                   if isinstance(sample.dso_bid, bytes)
-                   else str(sample.dso_bid or '[unknown]'))
+        dso_bid = sample.dso_bid or '[unknown]'
         dso_start = sample.map_start
         dso_end = sample.map_end
         map_pgoff = sample.map_pgoff or 0

---
base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
change-id: 20260928-james-perf-mypy-cs-disasm-ed5ab0b60a8a

Best regards,
--  
James Clark <james.clark@linaro.org>

