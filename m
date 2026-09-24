Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25714AFE05
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269497; cv=none; b=hhqga5q39F9Fw8m0SkG3WNvO0RvUFjoc45XbecHaDP1Vj2tucBLUgQXyeNI3tG9YoCenFQ7q49020VWQAJx4HPTPKQxbZ1UolgeH6XmweKiFXf/xaWF1DVFzjevQekE7VYE1UXTpfjMLQ9MKQmgJXJUP3MEW5HuaSGf0zVnWGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269497; c=relaxed/simple;
	bh=00O/XGUo+gBY8Wrh3lceAcc3am3kVkGIFmp1zBrc5ks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mYx3eKCUNFt76xSiZv5Xj0Kg4KDdUMx6kErGu1ytFEI1ifoOF2/IAnzqkq3VpdhFkps+oiGoSxwvChPTDwyZt2Cva7TfxgShKeONN60g4ZRWG4rnW2MUdnnzQxtFIDBA+OPQIuJlO9SXWn0vQYPH3P4KnLftTQu+Z4lfwcoCEaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R8v8a+vZ; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8v8a+vZ"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14371f7ba1eso39336c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269495; x=1790874295; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c9r9PHvMsmrjg/Wx3rSzk0iudZgpbLaOYADILi2T0o=;
        b=R8v8a+vZNQ3MmS1B6GSSLezDGq36Q5ugQbGjch4JkIJrf/LbAzuYirWRVh3PS6Yk+s
         gM0da00RxwinKbYPkq3wKHSz1GUsxzg6YF+B8C70OolasX8HITvdpgnTZ9i4XjnwJrL7
         IGUUVCI+DZA24hgllTnkS0V1SzmPcyCUqUN6vhHgCWaBbwSb46ZW/Hm8BCYhsKaC6hFR
         c4F9dz2xfbt3/0RlJvN0GrC/4HXIn5Q9YNI0OiqHRRUW7Za8EbuAiVO4f8vQUxDkK2pv
         /sJX31HfDqGljSzt5VuSbzj3kUz88BNPPRMPVUtNO49KklWDXAhkarJMsFBK+U2JO06h
         naNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269495; x=1790874295;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c9r9PHvMsmrjg/Wx3rSzk0iudZgpbLaOYADILi2T0o=;
        b=KdiMoGI5V34S19pMWsuMc8J7DFneT5aiPp5HAK/BEeAbgkuCMSIGzCs8XWJE0k3krw
         9JPPV+CVgOO1ylJ5Wob+8IDZxWNGHhOd2bAvL/ii6KHn0/N0x1VmQ5Rxe8F/36qNeuzT
         1vv0bPKFzWhKsnhvjkvtZ/4Dq+mhotOUmbRmsKpFoMUXkdZHFbSjFGB0gK4csDnLxOxp
         /ThFPWHVv80kvUVvCaMk40fh6vLel9NHHcOpT7i1zbtt/sCq0BEajg39NQSSYl2qPbR4
         Qw/kuEt3G96mEb7Ll+KEK92t39/6vJYOeX5994im05FLISrSlOxmKtNq2GOJf1dL5q7r
         sDOA==
X-Forwarded-Encrypted: i=1; AKwUvBx12Ia2/7pLoKUpaP6GmmyseTbCdSmP6Ums488DFFZnXDqiBD4Ojzl9B0IJXzlr8aoAH7CwxJ+P0BmBGjU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjrduZ+Ae/ZKq7T6iPCijI7TtF0yh6PmKZEKNYgWNGyivb27l
	rLz2q+wi9aQfzIJYG9314recVLKO7CsHIEQEp3dK+90SV9w79o4qb3elbl6OMb0hAReScbBAja0
	Cf8dJUfsoDQ==
X-Received: from dlx9.prod.google.com ([2002:a05:7022:89:b0:144:dc13:586b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:428e:20b0:143:2973:c08d
 with SMTP id a92af1059eb24-14503fb6d74mr2514161c88.28.1790269494414; Thu, 24
 Sep 2026 10:04:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:44 -0700
In-Reply-To: <20260924170346.3872848-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924053645.3555041-1-irogers@google.com> <20260924170346.3872848-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924170346.3872848-25-irogers@google.com>
Subject: [PATCH v2 24/26] perf vendor events intel: Fix sierraforest umask encoding.
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, dapeng1.mi@linux.intel.com, 
	namhyung@kernel.org, edward.baker@intel.com, perry.taylor@intel.com, 
	eranian@google.com
Cc: adrian.hunter@intel.com, afaerber@suse.de, ctshao@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mani@kernel.org, mingo@redhat.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Fix UMaskExt that was wrongly encoded when the UMask was 0.

Fixes: 9626368d429a ("perf vendor events intel: Update sierraforst events to v1.01")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/pmu-events/arch/x86/sierraforest/uncore-cache.json  | 5 +++++
 .../arch/x86/sierraforest/uncore-interconnect.json           | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/uncore-cache.json b/tools/perf/pmu-events/arch/x86/sierraforest/uncore-cache.json
index 35b1763b0020..0b95faa5e469 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/uncore-cache.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/uncore-cache.json
@@ -701,6 +701,7 @@
         "EventName": "UNC_CHA_REMOTE_SF.DIRBACKED_ONLY",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x4000",
         "Unit": "CHA"
     },
     {
@@ -730,6 +731,7 @@
         "EventName": "UNC_CHA_REMOTE_SF.INCLUSIVE_ONLY",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x2000",
         "Unit": "CHA"
     },
     {
@@ -748,6 +750,7 @@
         "EventName": "UNC_CHA_REMOTE_SF.UPDATE_EXCLUSIVE",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x100",
         "Unit": "CHA"
     },
     {
@@ -767,6 +770,7 @@
         "EventName": "UNC_CHA_REMOTE_SF.VICTIM_EXCLUSIVE",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x400",
         "Unit": "CHA"
     },
     {
@@ -776,6 +780,7 @@
         "EventName": "UNC_CHA_REMOTE_SF.VICTIM_SHARED",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x200",
         "Unit": "CHA"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/sierraforest/uncore-interconnect.json
index 1f6e0970141a..7fa6def25379 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/uncore-interconnect.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/uncore-interconnect.json
@@ -515,6 +515,7 @@
         "EventName": "UNC_B2CMI_IMC_WRITES.NI",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x300",
         "Unit": "B2CMI"
     },
     {
@@ -524,6 +525,7 @@
         "EventName": "UNC_B2CMI_IMC_WRITES.NI_MISS",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x500",
         "Unit": "B2CMI"
     },
     {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

