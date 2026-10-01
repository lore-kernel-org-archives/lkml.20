Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C0D3B3883
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822078; cv=none; b=a4CaCCyEGC3zdq4OKOhx3/PifKdUhazLWXypEKYyGA5s3L8ZAzT15TnrIswnLjzFuz1Skuuibr8gTlRUeA1KzRNgDox9rihQtlIq4IxTjZ9LpazMcaWgAI3n1Jxd8woEyBIXLibAw1Fh0JLFxXSEzFg9Rzzz90Eds/jYrdS5vxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822078; c=relaxed/simple;
	bh=O5ODVShe1B0LC+rEY7qNyzL+7S9xq/jUBnul6lx10x4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=SFxgbxLmkd5U9dKRj7vnI0d5PX7OPdJSQq0srOP4ahbXYfyU4LPZgZpEN7AhAubsxwHSZAiyQ4/4jKVksVPNFwh7cjri2Pj7cwuDLofD/hW3GwPVlWn8qXR9fUA/bKClrSuAbCOSWWzY4FpTTlTz5oW6BdlP5hZgEAYLZAAN2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tlnAlGi9; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tlnAlGi9"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso6009077c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790822075; x=1791426875; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x310nNqKeL5QTlQDhNqpbdK2+BHdclA/oEK1ZuBObLY=;
        b=tlnAlGi9OGYiN6+TYhs0ZSmNXgTxyE0wcGLhzc0miBcyuGPCDRU7OF5bp+M6ISe+3z
         QY4yaW9W4Ml3UzUS50B14c0CkxszTvadwnX1LSvLkHqF61lDmJi9CkxaD2kUJBnyr9jD
         cA9WNDimp/FcypWWnhD8ECYOVLVKnk3ukXknK9gMjDsoH1AA57iHfJa879H6K2UiVsv/
         lHnx+dapuA4/qE5yPM6g5csye2UcditjGPmdhkwHE2F+xS5Wox63pFD1dPA6h+c40xH6
         xloPLG1O7pnIduzZdEXXC4CGJFB+B/k9C8z9sb8RBYYc0YQq7IqZ1Z4c0YC7d/a0+xEi
         d37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822075; x=1791426875;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x310nNqKeL5QTlQDhNqpbdK2+BHdclA/oEK1ZuBObLY=;
        b=DF8Cld3CqQdanRG6MvIcEKjfOySDX5Lhg9hHRqj6uVrtKNVKQFggzx0A2swqFdfceI
         UyO4wfnOD8coslqB/yO3dMQVvraUBICm5/TtY6RuzLz/9ucrewv2ZF6veCxxZLdksEPu
         GoSBfdbBGj7DkJK5FPdaflsPNe2drbeTABTfDm8usUpnocfCVbkMOaJk91xR2u1h/v5Q
         q/rEWQrmEpGS1dLKNDV+FldkhCdiCbCjRmEOZtou4s/xDn5p2OMTMahHvTAi2AFJs4BQ
         pGsLSBo94ReqsnszAGz/klpfOJO045P7g8ACpFcNxI2H5hlhLzfm9REw9Rl9Dtw4tnEQ
         PFWA==
X-Forwarded-Encrypted: i=1; AKwUvByq3MM+rM2gE4fRbOaLgWtjVlalutWmXYxAWbjCv3sDW6IVw3uzPI5DpgiGOAsA3YjJw4Chnnq9gXXXbtw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzj5ZYRnBxnQq1Wuk7qwI+N18pRQhd8Ak5CLBQO+eDfYcTKhUP
	k33jL8jukVP3ccW0kSUfnPIRkcSJD2zO+L3GjHoKN6JYxqg/dfTtmB2m2BdWx1KqMXOLkjqJOW/
	w2CktARek5w==
X-Received: from dlbrl17.prod.google.com ([2002:a05:7022:f511:b0:143:9658:f913])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3715:b0:143:5c63:23a1
 with SMTP id a92af1059eb24-14d3204da83mr3085033c88.19.1790822074757; Wed, 30
 Sep 2026 19:34:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:34:22 -0700
In-Reply-To: <20261001023423.1225713-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001023423.1225713-4-irogers@google.com>
Subject: [PATCH 3/4] perf build: Clear GTK4 instead of setting unused NO_GTK4
 when gtk4 is missing
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 4751bddd3f98 ("perf tools: Make GTK2 support opt-in") switched
Makefile.config and Makefile.perf from checking 'ifndef NO_GTK2' to
'ifdef GTK2' (now 'ifdef GTK4'), leaving 'NO_GTK4 := 1' in
Makefile.config unused. As a result, when building with GTK4=1 on a
system without gtk4 development headers, Makefile.perf still attempted
to build and install libperf-gtk.so under 'ifdef GTK4'.

Replace 'NO_GTK4 := 1' with 'override GTK4 :=' so that 'ifdef GTK4' in
Makefile.perf evaluates to false when the gtk4 feature check fails.

Fixes: 4751bddd3f98 ("perf tools: Make GTK2 support opt-in")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 8f46885d6df5..cafc7be79643 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -786,7 +786,7 @@ ifdef GTK4
   $(call feature_check,gtk4)
   ifneq ($(feature-gtk4), 1)
     $(warning GTK4 not found, disables GTK4 support. Please install gtk4-devel or libgtk-4-dev)
-    NO_GTK4 := 1
+    override GTK4 :=
   else
     CFLAGS += -DHAVE_GTK4_SUPPORT
     GTK_CFLAGS += $(shell $(PKG_CONFIG) --cflags gtk4 2>/dev/null)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

