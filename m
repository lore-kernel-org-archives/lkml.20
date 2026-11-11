Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418950;
	b=epzKWEfGXeKoKNiebmOLkoM/GxC61vbd1kk6E0WNzAxxFNcd8wkrA6XbT83I4n6rOLEf
	 lHvhACdwtP/GAuWpw1Ao8CHJ4SBCuefZiCYQrZyPuo30biGTdgH35d8RiFEwHkYvySmEA
	 NVXezWcqtEdjbJWyzGJRHdnHQEqmNEc0cHlX3Px/HsSqUpbAN9dzB6OYlgOwv+BHfB+ia
	 mB+diNj9jTs2qBaMJu1H8F7U+nK+oDMudlCAojuwB8NftXtpBTnrxBKDLlJebj7JtVK6I
	 WGmFG/FQVJCtX2pY9NazczSaiXnAAdPajHwxlFt8CmteizX+Zf4WG3yJjNRw11dTang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
	b=AubXdQKR80EiJUtGV/Sojyw93J+IV8JCmvL5OJ0clL1zHxRTvFIMW+g6+2M37PC84eXG
	 5vU78ugS1ds3iNXebvv99StLwsIeQlMkmC6ekBJgDZp5HdSHXKJm4crMPdRLcfRunCgeq
	 L8MalVCt15Vxt8kbGxLD5ezFDUsTcvgZEInK8L63j6+Z2M/LVz47k4elW0XPtCtWtS3Ii
	 F4WkXYGUrNnptuHwcbQ+yvquSopvijAGvvCEUbJwc0lS0IOHZFcOysIXg6U5oFXwkUhLO
	 2F6nmXpxjyLf8LjHNJssIo4uKY4rtHK6qoiiqALRaVkjFJpEDauhJyHy748mbO8C9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gayfeIsk;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1CE60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1CE60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gayfeIsk
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3763bd79663so1591407eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418950; x=1795023750; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
        b=gayfeIskl2++4z3l+UbDjqpv3/dhSEuxSd1TJRaCeBtNsbdWFDZBy2c3G9slp3F+dQ
         fKFE0N3apQdPtikJUdRk3YATUMUmNEcH2U+eSj1oodB9i/ygqoouelkciJrWyN73Avfs
         mS6wTH/ll8QNdnt+Fh8oE2HZcXpnvWxNjvl9QBRThNUg4BoaNpaOpY7089DLQLueeLu7
         Hm0z7zKz2zI39v7FXver3yDDteMu71ajuUTvASWiEu34OfISba2FIAnDRM+FdZnNe03r
         tel1wK8raWQaliTX2vZeh6kLL3K65HbETDS2RKfXhVkzRnEx+mGYuOOm/HT+ie1Dwm0n
         M70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418950; x=1795023750;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
        b=Fhrum/cjSbNUFsv8vgymmFMUraBB7oa/I4ezP2jtbZvtXoEuEkDP0Ujez+ASqatZxi
         /hNWIQXFtVJUfWNa7MFkCT6mX/2oPxg9Tt41n+iKYWBH1JrR+5S9AbUnAcTHtefGehp/
         OvCfvH2NqUsqxbaQi2GadNn76HBcmTJDp84FkLeypSpRBJo0MPX9v6uFsNZ2RcJxuufE
         4MXRXDb5y8TMCJxV7jbyzEhzt4QcgUgoBj56LC+N86V+qq8xBx7O/j4LSpXBvtbLuZ9A
         Dj2coyocVIIus8jV4xvDCXbhkWOQPxYUJUgRQgzzqHjL7iIZOP21C4LmUinpgNF2b0gD
         zEBQ==
X-Forwarded-Encrypted: i=1; AL+hErH4/uhT770HLKoqbgzRFQZ0s+qr+sihFQOs4NFGwBQE811nlYUssLlPfB8am/BKUfXmUlRF5HM1wMvlZgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g/VnRFot3gwrXgny9B1zX95MNlSdjxQxFCWEDQzYorqN84zdu
	htQfylXdsU7N637KShYTFoSYhKQKc0YpA+KP/zFNZSqegUnEQBIY9KWr187FeyYkqeG46cKKSGV
	S7VObgJljdw==
X-Received: from dybb16.prod.google.com ([2002:a05:693c:6090:b0:368:83bc:cb15])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:88c3:10b0:370:ff2:f78d
 with SMTP id 5a478bee46e88-37685c7a800mr3499244eec.8.1794418949297; Wed, 11
 Nov 2026 09:42:29 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:57 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-6-irogers@google.com>
Subject: [PATCH v12 05/20] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.542.g3ef89b7020-goog

