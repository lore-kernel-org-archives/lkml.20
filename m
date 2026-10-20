Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514223;
	b=mJdTU089Fy1TpO0ZZirBGbCsmfl0xdIwCkrgD0lOvJZ3TERdw8V9XFMXEveK3lWw0SIK
	 7fU8+j9n2Vtam4uBT0vM4E3IWCz+d2gdPOEd50Cs51ml3kY8XJKibpqZMquUWRkBSRd4L
	 cZ06a43CJlB7gb2TvtzofJyWneksoTc+NVv1+v+c3ZJg2L6y5uDb48tn54n1SlwM6VVMM
	 bM2K1nYdGxVwbNNq5psHjI1PQ71vMNs6KzCko/REozGNyn0htAJJRQIbWxArY8DYUn6R4
	 mkDhXYQr0NHjwos28qQ7lqSZr0tji9n4PVj8eRuYcSMILk7WCpCNhhmSyjiluCRQM3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
	b=axUQXSraThLszS5Q2WjQob4p4M+3EM+ZZXIgdb6oFso13Px9Xfxm+nzCLFEhUfZf9Dnz
	 iXFF44NVPvQC3VZ9PaJIvSgWKz5ZTDVYX5y/X7lJkcF0DP5EwCryAZqgxp+lAHnaub5YB
	 /0b2lfY6rU3mlbxy4yUs3HRiYknLedctQu2w+VaAzNcVEAc+PVZ0bLvalHOEGkDlCNWSK
	 taGfcPRMCFGIvfySiGZYPI7o5AODPaIkbMXUuguh7E18lhI7/B5oHTBlPWustuqjda7IO
	 i0jNGogbowutVqistyvv2qwKXveRgiZia6UnSA0H/ljmg06aLJXXkxL0Iz02XGfaAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OTTMZc5e;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63860A2615
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD63860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OTTMZc5e
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso6362053c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514222; x=1793119022; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=OTTMZc5eqUiYqhkIKYdRMRRzgncx6fapWEfD9VeVwzL00OcCJhLd9a1CqgHq1G1gA0
         5AKQBBddiXT5sxmHEfzHHBTWYHOBtimcYbBhtSvPxlY8A2izeViT/x+dcGNBCZV9G91t
         ZkeXBqvMXeDgvKo+62d8Tk365M6KcH+dPMXNz1spVjAKU0W5gbxPWR3y6hEEkoEfDmZ/
         O//s424YY+YaW4GLhaF7lEgm4r5u5svtaTozDO3sHsp8TT3OhIGJsC4bgWa7Rame3VdB
         MFc/IM1yMCDqIDCEPTSEvu98lMjPRB/V3VZ7ppSeSDdeN4ytCWuT/4l6x99IgmleOOaT
         qBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514222; x=1793119022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=H01DkcUqxe8avK+pfmcG11J7uyosZ3+E6c426+fXB4oqzmTBXd0PeBqtm/ipSbHqV1
         05CUYGJcpLM1uLlKu8X5pmZSiyDGdNDWHmSXhdSqy1vKJ7cMUOAc8kqBLIqsScd1LDO1
         TDTM94nl0PyZIr9mPYS4z2ssQfRG/Y0TbhjXZiH780UKGJzwCul2ehzLSel71djQk/CW
         MGxTnff1ImOZA9c4QuQBvvt5+vuKB4lTmhy2hR7JTvrmstilV8rDavWvYc1taMhBkvoe
         B5TqHcLqKbrGmNxpcXaalLbwgScuBlSVbLdOPLbWCAeXpREi2n5u7BV5IO6dlTmUio2e
         SOsA==
X-Forwarded-Encrypted: i=1; AKwUvBwF+ZfIWbgiVIVvdQWKloVfnj28WLpDnk9H3kID2NnpDfo0yvTL76WraiGDQEad+lX3V5EEi+luT92EG2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7hs6SjhrgXRcmZ04Hhh0+rdEKSHR9L/Ntnf4yn//Bgq1zsqUe
	cQ+5k8qQ+nJMMfA7+R9/+v+QMrZm3rERr2FFDobUd18Ins21jE8Mj7HbIMJi1JA1QrN4GdnedEj
	yziHelAmBTA==
X-Received: from dlec18-n1.prod.google.com ([2002:a05:701b:4292:10b0:15d:9efd:93a5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2207:b0:136:c443:80e5
 with SMTP id a92af1059eb24-1876658f6c4mr12120611c88.6.1792514221602; Tue, 20
 Oct 2026 09:37:01 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:28 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-6-irogers@google.com>
Subject: [PATCH v5 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..ce746b12f901 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.212.g129ede20d9-goog

