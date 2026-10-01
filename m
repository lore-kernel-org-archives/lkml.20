Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4173C0600
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869701; cv=none; b=qEqy1mNjb7a2/l1SnY9SU8HdK0HSeiX7TVrEHQ5AQb+5fe29lln7u0Dg0y7g3LEhq+sWbrWkNbY+OGuJrJ4ETOpIKs1ZcGnlWahYL8zvkb4CFXx1a+XtgfNWw3CIlZLk6WziWv0MSIeTnsQYwKNWThY/GRiWj4L25jkFwEGZMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869701; c=relaxed/simple;
	bh=59iH1F5Vy/056HDKnHHLy/flOtWGquaR/K7OywQ7VtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uIuUMTKTB5IB0vnz5IbjelLuq9oRauy8X07xnTiOR/g0Vr666L7Gr+6YARbtMvBnyx1wRU90eVWV0RY41m6MZvyge1y2Xa/6gtoLTVTCuJ6cXvzgbPYxxCdB5sAy/wEBuVXLXsPJYavkKWn3Jae5co79X1fKwnZ9hvGN+W5XWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4lxFpE/; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4lxFpE/"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so1926287f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790869698; x=1791474498; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WL1Ngs5P1NZipTs1d2xbqdAnfg1+txQ9m6WSod45AOs=;
        b=Q4lxFpE/aEjp0ou0LTuBSx8M6eO+92MIhgT70HFT8t5eXa0ioIn+JpMANFr6relxLg
         6eyWYTrTCgzlDEnF5DEgn1BI525mCkAEa1uXptD69OeleFY9wzOTWgZqCiByPWSubju1
         RVdbT7aDhkKmHZo+NuapfZoB4CCQsyzcI1n/nsSTG1WbioeuDNNgg2TgNPj1xlmsnPBo
         X7CgT5T0s2FmMa0jhwUsE0g8ym2bNkeetxzAH+jZGIDxr8p4SfL8jdHAtxxrCt7mH+2B
         1DNOwCwxYAtkKH06CIRRMRv0cCzBBRffqJT77vcTPYP6lKJh1gVEVjhvR4HZJ7oYE/T9
         Wk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869698; x=1791474498;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WL1Ngs5P1NZipTs1d2xbqdAnfg1+txQ9m6WSod45AOs=;
        b=ecStfMYL7/aFf0lIykKNaf+ixbnPSyVfRONWzsqMEeYvIPzJSnZoO/uw2+tZDW1w5r
         ACKO+yLrttu4cRFzTs/COogR6fThMMbXZXIraU3kQf2n6XVTJlIaOkr+WlIUuuQrUr+r
         RB/xDADs4Str3peGjztECVlZJmp+tEdUarApEm6XGkjTfuNCuNVgosR8ZM/BA2D4Xep7
         MDZTOfoWXK24J4sP3i4VgSRuMxz/VEgpOrR8YOZ9t3HfZG/+w0EB868ARRXyaHTCuCpN
         VdtUAMXWIG0l18Qb88CBi1yJxisBmlELxtLqhyfc/lJujxsDgUXqZhQW9Wpt8Lr3aQE2
         iw8A==
X-Forwarded-Encrypted: i=1; AKwUvByX8PCWO/uMD7CjwwCg0tFeGfair3KZ9Jhmg6sOT92op4nPa8Z9XAvvr0uGcYnTehZTnVUJn2vG+1rNf9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIxFe8Bkuohe1bBPWTmfmJ4yA2lAcd23ZfGadcDZEoijQCHBd7
	I510KvJ+iXQ/dzhMsnNh7rxls588iR545IGTfll9b96o6XKa24Um19Iq+5Srni8Qb/V1uRM6B0Q
	NgTnStz0=
X-Gm-Gg: AYBFou2CZFAhf3iue8QNr0oZsGGoZeOxdo4XVrp9bE8VuqnTj4mZ9ThaoPLopCD6t0p
	RrfCqQawryxjBv6MtNEvIGzP+IM1iWRaR/FMMsXZsreS9GepUjUWz21/m8Nguwvx6ZmoVCpU8fB
	Ik5ZlNKlfd31yJy0JL9Zr4tfOJEaNOQSDvNlROtnkKwuU/Z69dnXSOe9u7ue/XKR9PpSeMyQmX2
	pAgqqkRJhJxFZ0qSQgI/44jvID7xcQqtblSOl5wk3IMjyuPE97/zZvr56r/k1fhvhnWCl+XJvvU
	Z7qhfSZW3Q9fZoftzo/lIGkuK3CwguaMxGjn4jJT7AFO81v5H+O2XQd2s4EoYbySMwGcq3OZVWd
	spcnmr5dnGY+eJFYiLNxsKcfRHBA/Zkfim/ChD20mnN3kgQLLmDD3P7ZJqwvi/LGOjmtkc40yEp
	LRUWfSMNtNqX0EMkB1Dd5A06CHlziKGaJzylOT2qTMF1H24z2f3UDN6PPcvnzIlVvm+5Y+aWw5Z
	Q==
X-Received: by 2002:a05:6000:4556:b0:48a:fdde:523e with SMTP id ffacd0b85a97d-48b126bdbd1mr52828f8f.8.1790869697968;
        Thu, 01 Oct 2026 08:48:17 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm6214047f8f.23.2026.10.01.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:48:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 01 Oct 2026 16:48:10 +0100
Subject: [PATCH] perf python: Track linked libraries as extension
 dependencies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-james-perf-stale-python-build-v1-1-dd3b14644606@linaro.org>
X-B4-Tracking: v=1; b=H4sIALmAvmoC/yXMwQrCMAwA0F8ZORtoKkzwV8RDu6YuY3al6YYy9
 u9WPb7L20G5CCtcux0Kb6KypAY6dTCMLj0YJTSDNbYnYwgn92TFzCWiVjcz5ncdl4R+lTlg6D1
 dgrPRngnakQtHef3+2/1vXf3EQ/2mcBwfShAv3oEAAAA=
X-Change-ID: 20261001-james-perf-stale-python-build-d6b17da2f231
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Since the Python extension switched to linking perf libraries, setup.py
only lists util/python.c as a source. The libraries are supplied through
LDFLAGS, which setuptools does not consider when deciding whether the
extension needs to be rebuilt.

When a library changes, make invokes setup.py, but setuptools can skip
the build and the recipe copies the stale cached extension back into
python/. This leaves perf and its Python module running different
versions of the same code.

Pass the linked library paths to setup.py and declare them as Extension
dependencies so that library changes trigger a rebuild. Include
EXTRA_PERFLIBS in the shared library list so that both make and
setuptools track those inputs as well, preserving the existing linker
order.

Fixes: 9dabf4003423 ("perf python: Switch module to linking libraries from building source")
Assisted-by: Codex:GPT-6-Astra
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Makefile.perf | 5 +++--
 tools/perf/util/setup.py | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 7ceefc1da774..dbf7cceaa005 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -526,8 +526,8 @@ endif
 EXTLIBS := $(call filter-out,$(EXCLUDE_EXTLIBS),$(EXTLIBS))
 LIBS = -Wl,--whole-archive $(PERFLIBS) $(EXTRA_PERFLIBS) -Wl,--no-whole-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
 
-PERFLIBS_PY := $(call filter-out,$(LIBPERF_BENCH) $(LIBPERF_TEST),$(PERFLIBS))
-LIBS_PY = -Wl,--whole-archive $(PERFLIBS_PY) $(EXTRA_PERFLIBS) -Wl,--no-whole-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
+PERFLIBS_PY := $(call filter-out,$(LIBPERF_BENCH) $(LIBPERF_TEST),$(PERFLIBS)) $(EXTRA_PERFLIBS)
+LIBS_PY = -Wl,--whole-archive $(PERFLIBS_PY) -Wl,--no-whole-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
 
 export INSTALL SHELL_PATH
 
@@ -559,6 +559,7 @@ $(shell [ -d '$(OUTPUT)python' ] || mkdir -p '$(OUTPUT)python')
 $(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): util/python.c util/setup.py python/perf.pyi $(PERFLIBS_PY)
 	$(QUIET_GEN)LDSHARED="$(CC) -pthread -shared" \
         CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS) $(LIBS_PY)' \
+	  PYTHON_EXT_DEPS='$(PERFLIBS_PY)' \
 	  $(PYTHON_WORD) util/setup.py \
 	  $(python_setup_quiet) build_ext; \
 	cp $(PYTHON_EXTBUILD_LIB)perf*.so $(OUTPUT)python/; \
diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
index 8380980ade4c..3b6a59f66944 100644
--- a/tools/perf/util/setup.py
+++ b/tools/perf/util/setup.py
@@ -173,6 +173,7 @@ def main() -> None:
     perf = Extension(
         'perf',
         sources=[os.path.join(src_perf, 'util/python.c')],
+        depends=shlex.split(os.getenv('PYTHON_EXT_DEPS', '')),
         include_dirs=['util/include'],
         extra_compile_args=cflags,
     )

---
base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
change-id: 20261001-james-perf-stale-python-build-d6b17da2f231

Best regards,
--  
James Clark <james.clark@linaro.org>

