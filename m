Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A53D522C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881772; cv=none; b=NHCAfmlvVyXMH9d15rIuWM1yBQJ5xSKvRoSncQMn4wwl4ipfE0ar2R2U2unqm3/Z+OblPNAPWvz2q/C0k6LPQCcxv5ntjOzKI7zRjGA4QbsC+eeaYtUgJcnxhfK6AYvE38QM1aE2MbBW7a6gxWOD8ztWEV404DgMe8qTV+tpDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881772; c=relaxed/simple;
	bh=9CG5+TIVVVhdILbf2bNJOX9PamwB0I16qey/intpr9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iltIESIUVvP6KEosWfgM1doufQ8vCqA74KUhpP0QgSHG2aEAZDXnjgG0PWByVc2u3eLyGlVCCc62NdFkrFY2cjL2kBxaiSbsTCk5qF/eaxgEM47waNVpvafX/7uk4iCPI5GJj+lmrJ1u1TTDIf1nyPsRWhWOgn+g10ZfX0yJ874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AP62tCHt; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AP62tCHt"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc51591102fso2917872a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881766; x=1790486566; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXQ1t7M/ttKG1gpCPiapMoUFSHKPI4WUjvFCcDFwkq8=;
        b=AP62tCHtnjtA6UHI4IlrFLk/Yl2DlLvy+pu82ToZsghqc8N0Af4EwnbMeuEVdOSGgm
         rXolxgWEHW/EpSYdB86Ai3cpF1vcMsPC7sme+Up9QI1xtS8OmVQsnjwPD9s27cMBUfVz
         RxV4KZZ2UqGzqpg6uUdLVVfEEES8cTap7YGcBEIsH3TDP3H558F88Q1Ozwug9LKrVOUA
         bTDSfpbdfOQFKw0SzDR4l2TKtlnn/0I0GfP5Lo1yc0Kl+cGTWt+acY0/X0EIncmh3EwJ
         9nv5Qa9bcK15Fjr3+UDGO5Q5L5eA/C9DCB6TVMc6qgd3jDAa0rUq5ChioawMfM11JEDp
         UAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881766; x=1790486566;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXQ1t7M/ttKG1gpCPiapMoUFSHKPI4WUjvFCcDFwkq8=;
        b=wk+U6kclqVNV2tvWvAE9CadixUGNZy0wp7aq5wnfUqNfTYrwa/y5EsqMT6D8D9+ZQH
         GU1dsLc7y/g3kyJAhI+iXqpkqxENe4PvLB4R717/YLMNGPZBwYIbzBgImGCbyPLr3kVY
         WLDY6PltjgdXBR5+sRMKDMZJ7d37VSOeP542chtAJJ0CrZ5dIwfNChynAR6vzEEm/jib
         soD2q3FN6I5icnY+wbStha6gdNSY2nC61qPGpejr2UtaNwhDbSpK7jIzcjlOLsWLVeCp
         PDd4lbvTbK/sSWQFdAUAHw+vlnQQFcRkAjtfY43/V6mmQKZSyRHixBlFTYJQlAF6FJxA
         E4jA==
X-Forwarded-Encrypted: i=1; AKwUvBxVZ1lc9Mpm6EnQKBtUl7o5h9UFgotlVAGifKGbuM0n+2+PTErbcwZKiJ3IxHogsdwPeX5LLWE6prc0OJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kzKMvNTsbs9G4lnFHjH6CFgzMeKSSCmjxKvM289LpNi+1CDtj0
	gez9AgKwNIFQOY1LpoVcgSCoQpN5bcdPj9DSYVNLb/AhY28dGlXMPyUXIrwHTzxEgDdFpEXtgXC
	NrKHzOWFEtg==
X-Received: from dlbts22-n2.prod.google.com ([2002:a05:7022:b056:20b0:144:d025:68b5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c49:b0:39e:6c69:34d0
 with SMTP id 98e67ed59e1d1-39e6c6936c2mr5559096a91.52.1789881766481; Sat, 19
 Sep 2026 22:22:46 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:20:57 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <962060eb0320dfe958df4c20d23ab6c075f48498.1789880842.git.irogers@google.com>
Subject: [PATCH v1 05/49] perf python: Clean up pylint warnings in tracepoint.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
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
2.55.0.1082.g2b9226bbc0-goog

