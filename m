Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4914349B6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098125; cv=none; b=sSqln3HwYNTcowTTS4PjXWFvMe64adLQuEjCWOm/RpdY+0wbIXs9ptAinaDR8HifY6ixMJ2/RZQFhuc/s5ZRbE5uZEP1vd5FJWvMU5gwIMyroEzvDuBLrKQA1TkqmRRyE8mGNpSxwtSn/C+EaTEEZ7zWCNv/yQ77JlZ37j0Uqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098125; c=relaxed/simple;
	bh=CrId/mzxO173Pii4jucd8wzO7SQYyYyWQ7bm2bVwkio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czstb3NjkwFubYoKk7cqjV5pycIdJeB2+f4LNo9uAwIxcL5pDCaOhPTRGN6Ti0LJCK42+IM77RWUcXZxGhGQXZ7a5utP063v4fS+lIM2WR5MsuA8ttHrKhbIsabOhbW+PAbfCxJEsOKSgsB0wehVtteIJIQh90Tg9ykgoaNCKv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smQXQSlw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smQXQSlw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bb7ae22913so3823686e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792098113; x=1792702913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycEiSjweMphxeT+LmW+Ybd3KfInm2+XUCR6PcOqNVQI=;
        b=smQXQSlwtFI22NhLDDLPsYXq5WyqNBAY1dwFtXXZKKVitnTjDn8s52LaC2YayRQOfE
         sZezujv0DVwVAT7Nlhlkp0E6xRLsPqN817HYEnc/MkVMMSHAgh2DuafBtGSmTQiQifpW
         Yfq1EkygRejqYvpkx+BH5olOtK5Ey2RYFFFU7KRVYEkwnac1E5NXeA01cAH0VKeUQ2fU
         zabcXiihWbYMfDJN4rfJ48p/8Twj41pb4B7Tct5dWZS95LMaBMn2vG0IM3dPZX6t6hDD
         LLz06EOOWtGkYoO5iebh2G2hdM9hQTEWSDCoXHvcySQXK5U5GofW09SScQKTg5QcU10H
         ZMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098113; x=1792702913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycEiSjweMphxeT+LmW+Ybd3KfInm2+XUCR6PcOqNVQI=;
        b=IIoBEd463S4qTWWsbtK0MYxt82lvLZ2dDAFFxZA653Zb3BGfhRQa19Wn2u5bb7Pm+G
         ZJGWHacsz8bi9yBtiA6Jg7si7ePYzX6IWEIUh3zEOxVlO2EFzdamUoSuJ2t5aVJLQwpf
         3ikQcS0P7yPp1LYih2rokz3eoE2UpXy8AL7eoJrNc9AUh++dqmbl/gtDQU2aBEkxvNMr
         safrWlfnhTkGz97AJaMfln3W2SiQTvj4gmj0tFyLB0a/Lq7FPB5MIUKylw1KSnw580Nl
         0AeALWckKZuZEcBztyg7JKogubBtXdLLkmbedw5kTfRTqNdSyDSiouliYfynWPz64i43
         mSXA==
X-Forwarded-Encrypted: i=1; AKwUvBxFdmuQkfPTdqOaQxTtMB5qffOL0KuD5w0rwHCRa4vtoO19l4DQEuHuS2cBZoFe9W710Mt9SsOHFtJp4Rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIn0iH6m1drm5gEB0i9jQj9v9TFOZWu5QA52vewSsZHYGWUdP3
	ATAcoeogR7/agshqkbjEEKgGYOCYoQwUADff2iUtwnKi8FI4irGevFjJ
X-Gm-Gg: AYBFou1gfhIyJbGaIpZI+JEEaxCp6lcB5kfZHSkLSLqriwpc0Ck9VWM+LUpxyZW7qG9
	bCjsfk+pMNKRXzirIf2HfCujM0MtIZ2mG4Wv9Mx9kQbSLcyCL0HiGKMAKCmsIdv+7CDanonhm/W
	8MRQcjgGmYiHhHYV6x6rUl/6Ze71ErpBlj62ftJUHCbYSHbT3f/9SzG46Iq2RJmH9l3+ETpHAfD
	iI+xQFZs5rqAs+BfKAVzCvgR/WbkXcrTj2jlqk4zOYr12T6R7T9VqIOvE6d6kmFC8rt0VyPZ+XC
	HURypZfNYYJnYgnoa+vym29zZVJd3rsIuDWVB1lpqGfMjtTeilS4vGEsmzOczuB6fN8olAaKyNT
	x67Vqznc8wmE4Cp4Npy8EveSQIkrnkP0al6BNGlEnbDJw2/rQRQuGtreetF7z3v60xV5YYhT2CI
	84TsgYm+4Jdb1lDU8Gffl92OtC8oh0hwgXpT6g8Ab2/bi/dKU58yXWKnwlOunV0CbczyVOISTnY
	/ronMezvs6z2Liegw7/mm5JbS6rFVSTBw+6tA==
X-Received: by 2002:a05:6512:10c3:b0:5b6:183c:5c96 with SMTP id 2adb3069b0e04-5bcde6adb31mr7892347e87.52.1792098112887;
        Thu, 15 Oct 2026 14:01:52 -0700 (PDT)
Received: from sc-mac-012.corp.sbercloud.ru ([188.191.29.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm11127e87.14.2026.10.15.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:01:52 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with debug info
Date: Fri, 16 Oct 2026 00:01:47 +0300
Message-ID: <20261015210149.78470-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928105330.25427-1-d.kandybka@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When debug information is enabled (e.g. -ggdb3), the assembler
output file (e.g. kernel/sched/rq-offsets.s) contains additional
directives such as .ascii with offset info and debug metadata.

For example:

   .ascii "->RQ_nr_pinned $3048 offsetof(struct rq, nr_pinned)"  #
   ...
   .ascii "->func); __data = (it_func_ptr)->data; ((void(*)(void *, pro"

The current sed-offsets macro uses [^ ]* to match constant names,
which is too permissive and can match unexpected characters when
debug directives are present. Additionally, the fallback command
's:->::; p;' strips '->' from any unmatched line and prints it,
which causes debug metadata to leak into the generated header
file (include/generated/rq-offsets.h), breaking the build.

Replace [^ ]* with [[:alnum:]_]* to match only valid C identifiers,
and remove the fallback 's:->::' command so that only successfully
transformed lines are emitted into the generated header.

v2:
- Add BLANK() macro for better readability of generated headers
(suggested by Nathan Chancellor).

Fixes: 7dd47b95b0f5 ("kbuild: consolidate redundant sed script ASM offset generation")
Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
 include/linux/kbuild.h | 2 +-
 scripts/Makefile.lib   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/kbuild.h b/include/linux/kbuild.h
index e7be517aaaf6..118568971fdf 100644
--- a/include/linux/kbuild.h
+++ b/include/linux/kbuild.h
@@ -5,7 +5,7 @@
 #define DEFINE(sym, val) \
 	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
 
-#define BLANK() asm volatile("\n.ascii \"->\"" : : )
+#define BLANK() do { asm volatile ("\n.ascii \"->BLANK()\"" : : ); } while (0)
 
 #define OFFSET(sym, str, mem) \
 	DEFINE(sym, offsetof(struct str, mem))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..96c2ec50f06e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -493,9 +493,9 @@ quiet_cmd_zstd22_with_size = ZSTD22  $@
 # the .ascii directive whereas GCC keeps the <space> as-is.
 define sed-offsets
 	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; \
-	/^->/{s:->#\(.*\):/* \1 */:; \
-	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
-	s:->::; p;}'
+	/^->/{s:->#\(.*\):/* \1 */:p; \
+	s:^->\([[:alnum:]_]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:p; \
+	s:->BLANK()::p;}'
 endef
 
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
-- 
2.54.0

