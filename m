Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDC2F28EA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703541; cv=none; b=M1S1KgvKDE0XDeCQGwbnSauMaBf7ba1m0s85SVR42+2FbQCu68lfUwsQ19/llnjUPQo59b9iJquP7ivDfCLU0CjthcpBRmh4e1LffqYTygReuKUEtwjXLN89m8HRPlgZDe4pdBL/7vf9y4OQm8VPrs/TVNaAoq+L7M3sGLkEhQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703541; c=relaxed/simple;
	bh=ABON75AhDambrtUbtXG4HfgRDu1+eqepUVf/JMe9ynk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z/ripGzDVrfH2u+5Xf6DCg2XrSH5865KUFK/HgHZqStBOpUDBRTNSfyGs1bZ7dRJ2ThWbSQ6q2znDMkCxhGBrlpins/MPFyli6cBbVnPcscOIjhW4JSQ7Yt9TGlyHFe1cecG9tShFy2FAT70xQ8u6dFAOpcgOVUUGWzTD+3dhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5oB5Jhp; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5oB5Jhp"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-861feb6d61bso24751157b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703539; x=1789308339; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s/46oElF1tYdsElPkXygjprwzV3BhzjlPyWFudUQDWs=;
        b=Z5oB5JhpfosqQBpje3GMVC07B5e6fDHF3V5fsrXv8hhrY+mdcMyr8YYJGWKcDMEvIK
         hSd+cZnVyIloYHqf+JbLalW+6rmEAJJq7+Lftjo1nECaAkFYkyPTczQ3vs2nauNQeDF8
         ik8T4UbO/tuRhg/qaR6mWtk12wCxOuCgeSL/5c9jH7ec6xdgT5KD3lmKBH9aZK2ZxdEd
         32bQoMQLOOvH0WhPew+ggP7Km/QGRyHneRIOTSHybCS/FoChCiK9Mb63AET2/K6nE0cL
         MS0hnvCtn9BNZ/3gc/zvjw53N01L6jjHllfMOhCiA8TA1n4k+sZeei8YfqiGK0UAQn4w
         LSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703539; x=1789308339;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s/46oElF1tYdsElPkXygjprwzV3BhzjlPyWFudUQDWs=;
        b=aBN+GdJ6SRVZAT7tdqztV67RrJi5AOUueF1R3EIwxMqSdNwucPNxRhvjhey5tcFh3O
         o1d0cpR5a1uIODbpCTx7LAE322+5yeY21RUzVnHOXCfOWv6ew9p817BoV6iCYuwncoaL
         ezm+S7ghty68JoPopu5CgW8dImPj3gUCedbq/m1S892C7I2Bjg5Y0GisOt9w9BO0K2yu
         g91EZkJat3tkG9O/tr7QmKStmMb/5M9C+nBv5/RXmt69H7PaUg7KtN5+0jSXTjIylman
         feECUpfehocdo+LhSm5IsKYUzhaXojHVVYyK6GUIXTpZepJygpBvgYxXaGF0nBuSOmHg
         6wPQ==
X-Gm-Message-State: AFuF++mZP4CX1BInAVOeP/V5luKS35YffI+T7pUUlBtKzhBkrYaRo23t
	Cp6IJVRYg1uBxKZ2uz1grDTUllIpF7Tf1fPRLDLsj9AeHZXaxC8l4w0A
X-Gm-Gg: AYBFou2rM/L9pnxKZraN+Q3HhrmpHSmMm13X5Mm48JAj11J8AFHtiRNdky9QuDL6nyt
	dalOD4fkbC/FJs2EreiCBlUwivYab2pZSCaz4CoCpdoQLNqBq5MQMjXYZ1ck67SBsP26VQNsRPF
	RrjM8K7Xr5pZnoeuW0wXAbGYyoI3+07hp9vNu1H05KluqahCsnxRIavN6R1lyYO86iUhDVDzoR6
	ybKR93FTLvnNudMo331YXpsPtK+wWkuwAbl73PzBMQ3wNNTf1QL2RtpUNXA3RQsXNBvZN1g4Vmm
	ODdgO74tFH/UZr5ooX06RY+wdu32l0rGEvqJKw0uGfBkJZL0m1viLSUHft2zw0Pi6O2CID4+Td9
	KZfdCfJT7n968lFzBbW1WVp6diZXQrEng+0n7u5swlBx64axHQu6rQerUbHMrWXsnngs428PHzW
	w+dwxug0FKFoo58LB7YXfM4uF3cMQNI+/qqnDYGPp9gVXNbmh39KAbwwXF7yDC4w==
X-Received: by 2002:a05:690c:f02:b0:7e8:a091:6c4b with SMTP id 00721157ae682-8712a70a29emr74400167b3.24.1788703538809;
        Sun, 06 Sep 2026 07:05:38 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a0b6179sm55278027b3.23.2026.09.06.07.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:05:28 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] perf tools: port UI from GTK2 to GTK4
Date: Sun, 06 Sep 2026 10:05:26 -0400
Message-Id: <20260906-perf-gtk2-v1-0-7564bf8523a9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMz3YLUojTd9JJsI11TU9PkRAOTpCQzUyMloPqCotS0zAqwWdGxtbU
 AUqqe8FsAAAA=
X-Change-ID: 20260906-perf-gtk2-555ca04bb652
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ABON75AhDambrtUbtXG4HfgRDu1+eqepUVf/JMe9ynk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmFqsfd9ytsH+2pN+7d/86n9XxGzX01O7KuReu9uD4X
 W1/TlnXjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmhBgjQ2O/epmQ7u
 lt6w7Enf8gaO5v3h0/IWbV/O9Ttuzb4thScYSRoe9/84Y1sxPe6l91zNq9595CrjmHtfg/HtQ11
 JzXOLvsMBsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GTK2 is long dead upstream and increasingly hard to keep building on
current distros. This series ports perf's GTK-based report browser to
GTK4 and fixes it up so it's actually loadable at runtime after the
port.

Patch 1 does the mechanical port (build system, widget API changes).
Patch 2 fixes a runtime issue found after the port that prevented the
browser from loading.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (2):
      tools: port perf ui from GTK 2 to GTK 4
      perf tools: make the GTK4 report browser actually loadable at runtime

 tools/build/Makefile.feature                       |  5 ++-
 tools/build/feature/Makefile                       | 12 ++---
 .../{test-gtk2-infobar.c => test-gtk4-infobar.c}   |  4 +-
 tools/build/feature/{test-gtk2.c => test-gtk4.c}   |  4 +-
 tools/perf/Documentation/perf-report.txt           |  2 +-
 tools/perf/Makefile                                |  2 +-
 tools/perf/Makefile.config                         | 27 ++++++-----
 tools/perf/Makefile.perf                           |  6 +--
 tools/perf/builtin-annotate.c                      |  8 ++--
 tools/perf/builtin-report.c                        |  8 ++--
 tools/perf/scripts/install-build-deps.sh           |  4 +-
 tools/perf/tests/make                              |  4 +-
 tools/perf/ui/gtk/annotate.c                       | 28 +++++-------
 tools/perf/ui/gtk/browser.c                        | 52 +++++++++++++++++-----
 tools/perf/ui/gtk/gtk.h                            |  2 +
 tools/perf/ui/gtk/hists.c                          | 32 +++++--------
 tools/perf/ui/gtk/progress.c                       | 28 +++++++-----
 tools/perf/ui/gtk/setup.c                          |  4 +-
 tools/perf/ui/gtk/util.c                           | 22 ++++++++-
 tools/perf/ui/setup.c                              |  2 +-
 tools/perf/util/annotate.c                         | 11 +++++
 tools/perf/util/annotate.h                         | 12 +----
 22 files changed, 166 insertions(+), 113 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260906-perf-gtk2-555ca04bb652

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

