Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700120;
	b=365Pwro/s1QKjuK5dQUNMe7kxSheQQszbVCuONXQx0kC1zHKP5cTInJtrNx0D5Mt/fzk
	 XeIVSYoqjtsdscxTaiMHqmz5YY8o18azW47Wh+CftOLRAZQ7Gw+WmYQADE8mU5eesWOyI
	 qvDQsQ+gE9EEH3BALM5w2Uwpgnls4zos6NvBp3keur03gOlhseXQdKxY1kEK1y//pGn2P
	 Yb2eQhZjVfXmzdIyrH20WtV0KGbMU776zrrvDRZ1V5Y3Ys1u1xe+31e7JkbKH8BxdlpYE
	 g91/xs2hJYg3kHoNtKTHP4kz7KjH+Fm9V+geiBdjq5EDomJZtIrXplYGfSRftJAUsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
	b=WJHq+rysQKHeDNPz2vBLIOOLhgMGrLsr6PyFh1Risk+Nv4rQ3FNkZVujqwN/Hoh6GFV6
	 rh1LxGrI0LW5HK1sn9l/swS5rdl5HUMiOkhr1AcDxhGWPsgICJPnVHWo0qw1SIg56HPnG
	 FpxfL0W/ol2CY7JBrCDh/Ph+hASqsTeTgFyJFBLaEVIWpIB40qxbAomZgi/vIHHwxeXdN
	 C200/G1fUpIIdLJNnENZYIoCE5hjrDGIY9k35eeXNaymGzGzcpo8mwndHosH1thK1QKI9
	 JyD1SJP+ehCnNzJLqFLLYwbv9G5R8F0UmETnHYwS6f4RETkt3f09lE9TL7WsFFYo9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hoqMrJuO;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F031606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F031606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hoqMrJuO
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so228516eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700120; x=1793304920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
        b=hoqMrJuOb0Lgwz5zWOvROhCBYCLTVnK1T0SPtxbYqZyXqOFTMxrpWomm8DtuelfNX5
         0o91IE449GczzV7rchkpwvsbgP4v3rc/4E6K9loGVD+e6vxcwi0CAdoZNpJHGO7arz4n
         Uyodg+dFWyHfBnYR5UjxyrXlCZf5DYQ6TOpILMGVUjDM0QKFea5/EHA6RXILtHT+WohQ
         olHyfeWD159BtPUfA4nuSPSCQk1LZR5NOES14xKx6Vt1ytjES3bNx8PtAz9m88dTwpcZ
         bIEUjNI5b3DlAIBt1AazqL320+fmzYo2B5gqiHJjb+bwRWaGAfxSiV2tZBSA20o0SiMc
         m0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700120; x=1793304920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
        b=PUk7rSHonGUByKHIkw15SnjXizowck2tFoxPI/Xk3gXQHMl7Lsu4zf0GiTVzqRbjK6
         yfDplo7+wVSYcAzz6GuuHaqV2rdRvX8Bk0543KnJ++lFgUbNmJ3ZzkuCoV8L0iuDi4Kv
         sXbCxPKPPeiqJZ3lQpXxcdDAFgrNGKXy5ig/HEG7YmBYkBo9EfrfL2cCgzWkBjfqpfOM
         ivNm9aIBQ5qjQxz9AZWQWnG4ein4BmVgGpdS/BFxJimyH8OsCT8uebNgnEGj01kmFIoL
         geOnQunnWuoMb2yAPejR4UiuO8FdcRY/+0OhuHRm/YbxE7M5ztbMK988nfmnJd77wY/v
         Vp3g==
X-Forwarded-Encrypted: i=1; AKwUvBxnvMU0QymBkVi3b1a/n2sPH0b5XYFdYoGeomzO9OZdtAIanlPOt7RBftgnOWK1ZuERJ0iRf+mLeWl7kWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/8cxyTAJPJ1zWcLIh1BeejqTKSyoUqrl2YbRo7fj/g5iP7vvv
	nTmLc4oQ4LVxorczJGdEOCPM+gLFelUbImcQSl0x/N5clwGArXFcqw1ve5Z5tD3Xb6uTz4yHf3U
	cR/A2RCYEGw==
X-Received: from dyev8.prod.google.com ([2002:a05:7300:4308:b0:368:d484:7709])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6505:b0:366:fbdb:2070
 with SMTP id 5a478bee46e88-369d989eb57mr380050eec.34.1792700119173; Thu, 22
 Oct 2026 13:15:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:38 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-6-irogers@google.com>
Subject: [PATCH v8 05/19] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
index 3eb8d095cda0..b50702bac53c 100644
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
2.56.0.307.g5fe7bd680c-goog

