Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630674399F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187175; cv=none; b=FGX+8G0A6BJSo/GXsB5cu3+xl6UYw/9gCojUYlx3k1SkosFwwg7pYmTK7svaGmJ2dG8DVsshnO2IoAwPu83EnouTSilSYsP283pE01R2CYoDGFLw439pt1zNa0qIWEGBfljEyCYrP8jysd2CoW0JuubjG5TuEcxCd+W7W0d/GvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187175; c=relaxed/simple;
	bh=rxBJstrb/NElUcnWB1Y6YOMGe83U5urlvFGslsanN1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TW1gPpnhA9868Xa5/aQWlrnearQL25QIiGeXPkRowqsxoeVkwkEcPvnBLpVDIleSqH/GZ7GvhcxOwPrkEn43zloLqGFd2SaBCGnerKf+KgJZcafXI2Kc2vu6OHbQPJG6ymK/yPXt6aaB/NKhOo83sLd8mwocmcVD7RFK2DWhU/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SXCZABeH; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXCZABeH"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso2405846c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187171; x=1790791971; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMi36kHqQF9krCG/BtzCWQUXvhHN3LxF/0Bt3Ev47fM=;
        b=SXCZABeH9pTBqw8+szxD23vr0DaJHv4jtyzB4o/IwN5DfK386kjd3214Ax3Zec2sq9
         OMEiKQTRW8IM3lp6v5RT3iu/rkR68dQkAyTvBgCo+TWs8ESWL25Dl61We4DHH3k10TNw
         GCzRkOdpMFwiI1yY1i6gxGKbS/HRTBp+aMqDFsmpyTkZYTc0i/okMltj8jJyKKxRSVuo
         LO21lHDVFZnXdp74rQUI40F8RiC3e0MUvNH11j2Dp7LR3dWobgAA6x6QYv6dNozKJhOv
         Ohy91RnYipH73dEkSAFAZfTQPkP7caf4tGLetYrxcVxH/Pe2FiK4h9HfmBWK1QCifnsh
         28CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187171; x=1790791971;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMi36kHqQF9krCG/BtzCWQUXvhHN3LxF/0Bt3Ev47fM=;
        b=btKghuMao1KsEpJzudHXZksmgU59OSCx3dhQEZ31y1i+OrrbEGmqOvpDNXZS+4S+ku
         IeCNRdL2orxHZxfM12dHxTZyXrJOxknySDFiT+c9VXs7A3eubH7FN+eOWnI7T+F1ypS1
         1EWn0kYx1e1OT9EFbiX9zxcHXB5xhccMk4vArW+22uYUttH7sngDM4naHEL90s3WqP7U
         StfmD3NIE+11bYASxs81UbPZRUINSU5MWM3fZEXH4dVOIcaDGgL+YY/zGqWU56bIPocz
         1j3FD9w5fbrxqavStefcOBSrMx5puSxt7DfVMwhEvR5/c6J7Jr15+frARLaPsllPROCr
         3qBg==
X-Forwarded-Encrypted: i=1; AKwUvBzBHXTwpJoqELgHTtcciuPhgYysAZjg0DjtJi6sHrZ69B4qdFyDK+PtMcGjcF2lmQ86IK+jlTMCPHCm080=@vger.kernel.org
X-Gm-Message-State: AFuF++mwvt6OlIlTQJ4fQpBWPKlkEcjHFxfS5umKg381KUp8w2/dOcPg
	+8hoeW/YjYIrdNK792rA3T59p/9bxGO+pZxbqp1ab8vlpRHexjs6F8ffFND5pezlJOpMpfOO7AX
	RYCiJlRr/8w==
X-Received: from dlaf24.prod.google.com ([2002:a05:701b:2418:b0:144:cdb9:29be])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1109:b0:144:eaa7:2765
 with SMTP id a92af1059eb24-144f90cac6dmr3462950c88.18.1790187170920; Wed, 23
 Sep 2026 11:12:50 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:28 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-6-irogers@google.com>
Subject: [PATCH v3 05/49] perf python: Clean up pylint warnings in tracepoint.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in tracepoint.py so that it passes pylint
without warning suppression comments:
- Catch ImportError instead of bare 'except:' (W0702: bare-except) when
  importing setproctitle.
- Remove unnecessary trailing semicolon (W0301: unnecessary-semicolon)
  after evlist.enable().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/tracepoint.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index 15b0c8268996..9d49a25b3b1e 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -9,7 +9,7 @@ def change_proctitle():
     try:
         import setproctitle
         setproctitle.setproctitle("tracepoint.py")
-    except:
+    except ImportError:
         print("Install the setproctitle python package to help with top and friends")
 
 def main():
@@ -29,7 +29,7 @@ def main():
 
     evlist.open()
     evlist.mmap()
-    evlist.enable();
+    evlist.enable()
 
     while True:
         evlist.poll(timeout = -1)
-- 
2.56.0.rc1.310.g51773c2048-goog

