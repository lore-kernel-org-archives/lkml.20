Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BE58E2A1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986518; cv=none; b=VdZlhJRDMDcgVEyBRUs2P2Ftp14AubcO6CX3IFVpfsdAKJD1XUsgYZtPSajOX1/zanBohCIXdBUa4T9aNtTZsrHcQY19O2HwsQ4uZsLyZdL3RJnTAB1M1x6HTAd+YX1vRyc6wLER2HsGEe3j8CEJ/HgIyGnTsPdIT1ky3mFK+Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986518; c=relaxed/simple;
	bh=UazTLn1sjONjtmv60Mq0FYLpiFHDEwxJ8VEH/grelsU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQ0LXauYf0UGsDzXriz/WTqn4cre+Xtw3uPl4wB5+9PqdO6UqvrxXpD1cTH6eci2JvBz8K5qt9M/fbay3sYPobvBvwmBCvESyNcxYsZ9fa283ldidhHVXK5ywssd2KHqmdLLcjOszFsqe8aM4R9CdhymEjoU8q7VDAXEKR0Z2N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0lkhs/N; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0lkhs/N"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so10433417a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788986502; x=1789591302; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5UiIrZVim8JrDSGaiMZ7MLhojmA+tfXQ54nhpZHC8I=;
        b=i0lkhs/NEkopuqdoCDRjyvFfZfMA+1W+2BkaojTcOCoDSJzL4oCcG9xg2YUI1Br0Gf
         gq4H+hFoaRVR2DdGv2t6JuqcNAzEgxvC8K9zYQIS0kd8sgTlAQEfVOHnAIoSFB/7oPIo
         oft7uLULOOt6xnwACpOQwfTE3tHWnUogKaC1LuMpetjXchOTIqk7TDEx+xLdgLpdc3Nd
         DBHkQwx2yNHjByPoJV0Z7lAv9nfRgBABkRq9Lir0N7kggdgQp+B624Tw8IUaYXMlBnnH
         Uxwiv4rncmkS9gcD5lNLoPeKig+gQ3kNbqkel5BRApQAr74ghxY5yWNRaaAvdf69MSOw
         aK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986502; x=1789591302;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5UiIrZVim8JrDSGaiMZ7MLhojmA+tfXQ54nhpZHC8I=;
        b=F1dFISrxuDdz0udybrj3VbMVYBHXGzIE2FSiQYnyey6bEWwF5wfQY7mb/nmJ7pwZ7L
         HhiSgnvANsIizW35EX537dp05Aem/0QaZxpEeCHurG4qqAzo+HXOwnCOvY/1GNo72dZs
         aUcgLmKFiyv2yplLIuI3RsCeHzxiVLVDESuUFVk/uLJ4VaAXuONail4ez82r7G1eSBqh
         igvlhSARd/TyZ7lOrz1nOT7IRvl/EgJS5j6HtPPUdKdBuhButKMxl9J0EuQuW6Jrd1N3
         rMG/JZQPEmsFo7vTNNgEnIvL874hX5JAaEhsifJ16JUzQtgG5VpdC+LVTcuezK+sAQLe
         8JQw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Z9WB+7bv28MxYU2kpIBzt8XiZk2cdQQQPQOOOWJSZue3Wt8UXYb1F5WLKG2RGFTSJTXRjLnvj3SEmIw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbumbqLUMX+KTNsV05KEoGZGY88tAoxSfz5SbImW27oMhBh65o
	MOGWawn9d7zX4LUdwmEx56hnlMyy86yf3w9kXDqhj7WQWFr4djk5ece2znvnvDl7G8mr1RBx2sn
	5SgOjYfu61g==
X-Received: from dybme16.prod.google.com ([2002:a05:7301:1890:b0:317:a78b:de72])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5106:b0:37f:c22a:c188
 with SMTP id 98e67ed59e1d1-39b260feb03mr53859851a91.4.1788986501987; Wed, 09
 Sep 2026 13:41:41 -0700 (PDT)
Date: Wed,  9 Sep 2026 13:41:20 -0700
In-Reply-To: <20260909204122.1993010-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909204122.1993010-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909204122.1993010-3-irogers@google.com>
Subject: [PATCH v2 2/4] perf build: Add explicitly sequenced -lzstd to libbfd
 feature fallback
From: Ian Rogers <irogers@google.com>
To: Quentin Monnet <qmo@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, Tomas Glozar <tglozar@redhat.com>, 
	Costa Shulyupin <costa.shul@redhat.com>, Michael Jeanson <mjeanson@efficios.com>, 
	Dmitrii Dolgov <9erthalion6@gmail.com>, Leo Yan <leo.yan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Distributions like Fedora currently ship a statically compiled binutils
libbfd that natively depends on zstd to decompress sections (e.g.
undefined reference to 'ZSTD_decompress').

Since libbfd generally does not reliably distribute a .pc file for
pkg-config (e.g. 'binutils-dev' evaluates missing on standard PKG_CONFIG_PATH
checks), perf historically supplements manual linker flags in fallback
chains (-lbfd -ldl -liberty -lz).

Extend the testing cascade in tools/perf/Makefile.config to utilize the
newly introduced 'libbfd-liberty-z-zstd' feature test.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/Makefile.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4d5993da9f94..f589a461f4be 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -893,6 +893,7 @@ ifdef BUILD_NONDISTRO
   $(call feature_check,libbfd-threadsafe)
   $(call feature_check,libbfd-liberty)
   $(call feature_check,libbfd-liberty-z)
+  $(call feature_check,libbfd-liberty-z-zstd)
 
   ifneq ($(feature-libbfd-threadsafe), 1)
     $(error binutils-dev(el) 2.42 or later is required for non-distro builds)
@@ -906,6 +907,8 @@ ifdef BUILD_NONDISTRO
     EXTLIBS += -lbfd -lopcodes -liberty
   else ifeq ($(feature-libbfd-liberty-z), 1)
     EXTLIBS += -lbfd -lopcodes -liberty -lz
+  else ifeq ($(feature-libbfd-liberty-z-zstd), 1)
+    EXTLIBS += -lbfd -lopcodes -liberty -lz -lzstd
   endif
 
   CFLAGS += -DHAVE_LIBBFD_SUPPORT
-- 
2.55.0.1003.g10538fe699-goog

