Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67D23EC687
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539205; cv=none; b=R2NlJebOYScyJRI9jQLIga0XrrRP/ZL+1kOpPQPSXHt/XITXMiaC8vIi74A/1zInEduZ/p/lVe+I4JbaLlDTICdxgwwltYUgp78cuNH6BKMW5sq+v7xZXlKmbjchknTr7wRcZBnDk4n2bCYNhhh60uu4cPyC112k+GDm/TIkj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539205; c=relaxed/simple;
	bh=BzLrWrhofRN6OPfyQk81Dwa6JQsFLbb5DwXqPENoCWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=GqRPK2TxtCBbzEBe3w8EDWgRc8iNVprOGEfO1tCiw4JTw+zJslGU27MmKpF8Yyd7mjC2gRdumgg4BBMUsbmB976g1p11yvocNOVVtkyq8MyYoHOiDjuE2ATdVdFciOF85ORl+Ya2cyuTt199DUNN37r8JJk/jhifX6JFmeR/Rgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S6X9gAap; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S6X9gAap"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so9347267a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539203; x=1790144003; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC+4bBJmOMaCFD9dsEEm3t/QrUZlzEYn1326Syti9Po=;
        b=S6X9gAapJSzXaUO+arbY6BSkcJysOnofMt4+X31HkL1ZCtOMd8Ahy38BoKX5LM9Uzq
         BtW4pohJGZLAatiWBP0ITc88nF46WpLRjsVbKu5bQZJ+CqoMfZ+P3o+QuIhcxf8dE3WF
         Am5MGWKpMqY4HMmDOQ5IrGevxiE9LdlAQ8ykaTdcXDXrV9G2OScCZVPdC5doT5Iqmhpw
         CLXZbab+NF3PZoVqcvkmAw49sjvSKbbD6CnLPSAaH2KrW171XlQpfeRdN6Fc0lUo30Aq
         5RpjgNZvxBan+T38ZD3taS77p6EqL8w1L+QD/dT5irhovPAI+SLrmK/ZdjnS2qv6W4Xo
         fnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539203; x=1790144003;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC+4bBJmOMaCFD9dsEEm3t/QrUZlzEYn1326Syti9Po=;
        b=FWrz9O6EQ7jxwLgLGYz96SrSAMrx8rERz7f/tLraCH1pps0xhuJaWL6CSSLkUTbGFS
         jgBq9wuHztESID+M6uxRaWtHFoZhSbNshXUGiGKMmLFkXtEtMGfM7XAgvi23yW4p8nrb
         DfPUw4aT8/r8/SriN2k+CowO/L3TNzqUarv2xsEGGxb7HaushfjwACfm4Wv7muE/v7gW
         gZDdKQT1byEhwO/62x1dS1NsuFypdE6ZW9UCPpOe5JEusVGyqhvDYxLALO/CaaC4UAKD
         hQJpKk+x/f2yYCYvgTeFLVUQw/QTnOXYvryebS0Q2mgmrNdijWDLiBw8diT2kz4l0vEN
         UKOg==
X-Forwarded-Encrypted: i=1; AKwUvBw6sgkWYjePk+pwMg71rjwNkZgIUCcBO3Q6cZowu1p7KPZJkdmDrGeXz1NJ81OwSf4rFozz3xLDefqahW8=@vger.kernel.org
X-Gm-Message-State: AFuF++lM8aqJG/O/86MEScisUHFEqU7dNMBjVXj3IR7gOqquT66V6uDR
	OIODun1Zqq6QFhrTJAjVj4/kLYKoBP067w0kGG0+SemUV2LOXwvLDawnQToTxwpcrm7Xe06ZwGl
	DWJrEiQ4rSg==
X-Received: from dlbvg14.prod.google.com ([2002:a05:7022:7f0e:b0:143:7cf0:d45a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2744:b0:39d:efa9:cd20
 with SMTP id 98e67ed59e1d1-39e1e28501bmr3351234a91.7.1789539202967; Tue, 15
 Sep 2026 23:13:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:15 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-7-irogers@google.com>
Subject: [PATCH 6/9] perf build: Use the given CC rather than clang in clang builds
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang block is entered when CC_NO_CLANG has determined that CC is
clang, but it then ignores CC and hard codes $(CLANG), which defaults to
plain "clang". Building with a versioned compiler silently switches
compiler:

  $ make CC=clang-19		# actually builds with "clang"

Worse, the target triple is probed with $(CLANG) too, so on a machine
that only has versioned binaries installed the probe produces nothing
and the build stops:

  $ make CC=clang-19
  *** Specify CROSS_COMPILE or add CLANG_TARGET_FLAGS for x86_64

Use $(CC) in both places. Within the block CC is known to be clang, and
for "make LLVM=1" CC is already $(CLANG), so nothing changes there.

$(CLANG) is left as it is for BPF skeletons, as bpf_skel.mak builds
those with "$(CLANG) --target=bpf" whatever CC happens to be.

Fixes: 4772e66cb45e ("perf build: Support build with clang")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/Makefile.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 31e4cbe192b9..dca62e155fb5 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -38,7 +38,7 @@ ifeq ($(CC_NO_CLANG), 0)
 
   # Default to host architecture if ARCH is not explicitly given.
   ifeq ($(ARCH), $(HOSTARCH))
-    CLANG_TARGET_FLAGS := $(shell $(CLANG) -print-target-triple)
+    CLANG_TARGET_FLAGS := $(shell $(CC) -print-target-triple)
   else
     CLANG_TARGET_FLAGS := $(CLANG_TARGET_FLAGS_$(ARCH))
   endif
@@ -53,7 +53,7 @@ ifeq ($(CC_NO_CLANG), 0)
     CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
   endif # CROSS_COMPILE
 
-  CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as
+  CC := $(CC) $(CLANG_FLAGS) -fintegrated-as
 
   # CC being clang says nothing about CXX: "make LLVM=1" overrides both, but
   # "make CC=clang" leaves CXX as g++. Probe CXX the way Makefile.include
-- 
2.55.0.1032.g73a4cd73de-goog

