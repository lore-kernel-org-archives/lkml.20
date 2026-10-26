Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000858;
	b=yzz5pzhwjY/4cyfI7KPfjggQ7kjX2Q+gG2Exm/LgHUlwEOkPEUKHiJjGfe4gQLgNhyY0
	 b5WmyKkz5MaAfaybc9cKdyJwmX9C83+A13/DPTbof443ETth/B5Ai5m4dH/r8Pv0NYsH6
	 iJFh5EPC/rPSPZk0cbkBzHaIbVj83xHjR0u4sfETY2UM6LHsojpzlUHORwfGWF/ndUNXo
	 C8xYH4pDmMTORjQmV64RfsZoiW7l/04bYkP3BHtGkU1bahoX9LLnuAm6mNXkHISuBQ3Q+
	 AR2rgCcLdNeC338uulpHe6xRr1HAFux6m1G0A27vxyFY/KqP8Z4t8Dh0BlwMeo42jbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
	b=pa0FkR3BDzzPQbpL3fk6bn3+EiQzFfwn1jKKYeqzC3hz8lHg4w67WJvyA5N3HZ23WvP7
	 TSKi6t3poXM2jpfzZ4Iwca+SFuCTBdSeFo4wygKnbnC4Ev00n0psOeS4jacz7gtHRHfv8
	 FBIuYV+VTjklq6XYAw0Qs5F61YYNeaJOF6UKhXQ2LwdND+/MDBUprh0yPeABfXG0cg2qC
	 itGpvjA5v2H0eTfJgVqYhATvQJeGJzdFwInA/42plrcYhB1ud4IkmZxUQj/cW6jBeBYcw
	 X3QEY5sU4n7sLEo5D5aDOO4EZv5T47cllOxcvqjqsn2O/KytVGCeI1fFCKRNVdgo2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtS1+Gm0;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D3606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtS1+Gm0
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so25140691fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000856; x=1793605656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
        b=FtS1+Gm0kC1H4kbEW1IubNEaMyaB3+vSvPRkxQcfQIvIYVzTmS2hI8PTfpI1pjgell
         6qVt2mmVG1i9XoT44Z3lG5Ag1riz4Z1dmRhdbBEg5HAEbo+2D6dhZ2vqw0g2MtGl+u89
         4F2DPmWtulDk6aoJHlO0Zz9iXd1hMOZzqXcifjFPcrbQbNl9o+7fWnmoUVNOrV+Dz1OV
         SbnY4sDScnKYHj+ZkmSeHRkSHwF98TmFASHF4pB3Ee9emDWTaKm5IE13hvOisqzCZ7GN
         gymjKvSA36puJtisAImmXGrIMEoUl+cAL6EpV6rPxw5BDKxufjEjTlIg4y6oFYt/5/HZ
         jWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000856; x=1793605656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
        b=0qFNbGjvn99TRmDzOEst+FHC5RCPgfuTFbsxthYdZxOsS+V7+yajUAG4/Q35DTxDIB
         sz2QMehOLiSHj2rk6SbbQhBQE+TR38F6SWHXCVxaOy5lQEavGBIG3ta0pRI1F7z2cCed
         4IRPDG0ITnl3mwoVkT1uGiFUDz7SUmyt3R800KtknCjPLrSoIMAO/lcPV8ZILOSfKsYY
         fsOkcU731zeN3c4AmEv2rlN+gDp7RozKV3ZtxuBfAriXjikd2muDanpl1QKrBT7gY1hk
         xQ2VZLuSD240G4HHLUhaTe0jOwwsY/0MYJ/NVXR8lKnXXeSe8XkXPLyQ0QCUHCVDZf9P
         xYow==
X-Forwarded-Encrypted: i=1; AKwUvBxLrtUwLddYHsfpI9vHdbPeLln+lCLnTFtwiNSwSD9/ZNbhR9LBXyP4YCu0Jt3KekUNg8Qa+qv1n/lu2ok=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8qd1ek47e4aPH/ng/V0En1GOMSf+Y+l3cT8oyPyeUC0iTDduB
	5c5Gk0HorbU2vVV3x8DsMDstird5/OgzY4COHwkdsnccYMHwqYhEUpge
X-Gm-Gg: AYBFou18hZ3jIRAPeudwlanWK8/CJUkmRFYAyVR57GiZQPNSwe+lYFJ4zySqDIzSUu6
	2KEC4uA9wWOYn5opEfJavJPtmhyq1IzPsh3RjyTy0FB2zjCgbdWsdwYs1LY8PjjUyzJvOPq0l2k
	GRizI8jdphKC2/Vic6ZGqJ4klOvUZnGaXqA0rpn/kKW9loA0Sr0N5Y28VO85cemiuFUz6KZS/li
	SuBNR59Zo4izB38QNHQRFNgcRRsNP/g1nM6vbE+Ieo0xrjSJpT38zpm8U7qMW2r8ixaAVfe2bRP
	YhoxPDXe0lnGdrF3Hpw07mkc1if+Ua3YBa2rfOJPSJ9lvz4lzDe0F/kK7ISt0qPKkBVVu+HwGqD
	6Ieb4pMWXaAIwtkGs3iq7MN2FL+DOMenWnsAiAF1hEM37iGc7aygpvHF54Yi+uGiN1RHxu2qZ6o
	gyJR6Wx6Hi/dEKK1Bgk3i04A3SnR3/J/VfXnCgeO8aeYylVPJHCYrHwIKAPht8gELRsHNqK4TGe
	9726VsfNm5ez33ceBpTDz4iMuKKoOBG79W0rxQ1rwMp9oSv1J9vZjIoYVbY2DNftjfpqB+dkD/S
	2FYdX0ZU/jMe2FyzbKZ8clMgULVLFjoGhjeGmIk=
X-Received: by 2002:a05:651c:19a5:b0:3ab:3d02:d03e with SMTP id 38308e7fff4ca-3ac6ff34e59mr13548541fa.3.1793000856228;
        Mon, 26 Oct 2026 00:47:36 -0700 (PDT)
Received: from sc-mac-012.corp.sbercloud.ru ([188.191.29.26])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a463f5sm15727121fa.36.2026.10.26.00.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:47:35 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] kbuild: Makefile.lib: fix offsets generation with debug info
Date: Mon, 26 Oct 2026 10:47:33 +0300
Message-ID: <20261026074733.11777-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928105330.25427-1-d.kandybka@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com> <20261015210149.78470-1-d.kandybka@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
v3:
- Check for ->BLANK() at the beginning of a line
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
index 0a4fdd8bd975..90422215046f 100644
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
+	s:^->BLANK()::p;}'
 endef
 
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
-- 
2.54.0

