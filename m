Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416090;
	b=zw7uZwBfe8KJFDJoBarmHBPIB8jK5viXr/XAbYa+8zSww3wA9v+GqVxb217mUN1yXywM
	 uQTIN6IXYFWRyZt3g3Gj6djiomxHDnwKquBD0XtG4zcY6DNypwz+2yaq6iCF7ygF101zK
	 z6dgwXGeeBBRfvvyUOhDKz1hNwnj1Wj4++7nw72nu8cxkqH26HSEHLAExEi8cEJ2ltfJF
	 DmUxIZpWh+vWVZtZXsdiHIg4/4on2QHKxi5AEtRESTnQEGcXV/rfQKI4kySkzPaoH/0W1
	 UtZQNECxttyq07BFADdxxjiVva8qb/WlRuWFTfOpdP/Qf3hnhcnj0gyVplv2MvpXUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
	b=pGHOhZ0AGAOX0h+elO9nm6Kh7Dahgw2y+P14fUuFLwrTER8dtkwIGbpaEiF9eEp/+yug
	 w2ie+zUe2Ie68J3awC26ZOMGELCgJU7iVq+Soz36zg/Oq95dXeZvQmiLdL0E5hM4lSA4D
	 P6skXxmGYxl0DOOCYvLZ2Ss/owt/tt34U/MWFCdAfeGncA02Vn3LNopA+dTDoPrx0kcsO
	 hPBcJ3aJ6HWyuvu60j5yyAMXgJD0HHgvO36YcLp9a0DRl1cPxNppTveNxC2MhzEGwxoft
	 k04tcZsHjtpHBTyZy3V9qgSimKmDcyT6ms9PIVDhTmg7/KEdaUdYe8A5aS1hpIZzA0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D47606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D47606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so1345014b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793416089; x=1794020889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=PR1nKxpik6V79K8q/LNhpRQ378eU2tznOaZY+s3r8sZKIvt8BulNk73ToJPdUdYGXl
         dOk8JZKtI2RgGYfrMH0NE1UstYE+cb8Dp1hlUxXV4rM+NofrDb1Cmnh2W+p6ckEM4Nps
         iXPB29uWC+QqEwQvEYj0C50SdGFtMW2Kerfdu9l9kpYRKiBK6AQNMzGt4n01Op6smPla
         dk/x40lhcjPC6/XjCBqyN6DaDkwbZLJjiZ7Zd5pCFUAMmHBngOzO0NaBvxvRW31zPoIo
         IaQ9Z5wHilqcYGEVS3tUZYYtUpy3wrMEiZ8IVR+FQzDwDqYjTZ9IUaVhEOFOniruPdJP
         yE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416089; x=1794020889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=TvqybjujDIDbcyqpsViMgepDjqCTEQ0fzkXktmZYv7zV9AsCYjzpKSeEONGxrW2PBH
         9iKY0K3P7lgPVWaQSj1c9J5ksuj3OY8q00KI1HyRfTI73j+Iip9+3Vfxx4svjkX+RMZc
         CNyMBubPvZaXWpU3DDaYJS1agaHlLH2IUuUjqeo9M3FGMfbE2OHJ5PhI2WHfnQu47WTz
         SQGRvoyaYOV1rnGkYiYw/OXQjGPMuea89YMwBRs83x2EfdSJhYIjDI98kcvMe0XL1l47
         xj66saNrbB5MogAFp7EAqsc2SMZ8D+8GeUn498Kx9UwLtkPXE0UxXQaIb46OqCF6XcWB
         +Nsw==
X-Forwarded-Encrypted: i=1; AKwUvBwl03lfyIl2gKy87h0PHCLMkZNEYPjTn0hB2f4Qil5N+T2QYXB+k7VMu/3ryqlb5zMifAHJM9/YbduCX/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZFYjpsAg9jOTvmgpbdpk76qBMCx1Hb/vbKq/Mlx3tiEpOUpgu
	k4mlsy7UuclJyRCvZaAlRnXGl4UepHxeRbe67zHiabmFNLNOh8uznU4o7HDwbm+kv18fEHHaem2
	2EOm84w4il+eGsyaadcz4Ww==
X-Received: from pfbft2.prod.google.com ([2002:a05:6a00:81c2:b0:8a2:dc6e:fcd0])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c9:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8a9bfa0326bmr3697231b3a.46.1793416089082;
 Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:08:07 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031030807.4101384-1-jenhaochen@google.com>
Subject: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_RUST_INLINE_HELPERS=y, cmd_rustc_o_rs and cmd_rustc_library
compile Rust sources to LLVM bitcode (.bc), link rust/helpers/helpers.bc
via llvm-link, and then invoke $(CC) to compile the combined bitcode
into the final ELF object (.o).

When commit a960c2cdb19e ("kbuild: rust: add AutoFDO support") was
tested with CONFIG_RUST_INLINE_HELPERS=y and CONFIG_LTO_CLANG_THIN=y,
cmd_rustc_o_rs skipped the post-llvm-link $(CC) step under
CONFIG_LTO_CLANG and handed the linked bitcode directly to ld.lld, where
the ThinLTO backend applied --lto-sample-profile,
-plugin-opt=-split-machine-functions, and LLD's default function
sections. Non-LTO builds (!CONFIG_LTO_CLANG), however, ran the
post-llvm-link $(CC) step without $(CFLAGS_AUTOFDO_CLANG) ever since
commit 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

Subsequently, commit 5febf432df1c ("kbuild: rust: keep Rust objects out
of Clang LTO with inline helpers") updated cmd_rustc_o_rs and
rust/Makefile to always invoke $(CC) on the linked bitcode even when
CONFIG_LTO_CLANG=y. Because that $(CC) invocation only passes
$(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) and does not include
$(CFLAGS_AUTOFDO_CLANG) (which is normally appended to _c_flags in
scripts/Makefile.lib), the final code generation step for Rust objects
is compiled without -ffunction-sections, -fsplit-machine-functions,
-fprofile-sample-use, or flow-sensitive discriminator flags whenever
CONFIG_RUST_INLINE_HELPERS=y.

As a result, Rust crates built with both CONFIG_RUST_INLINE_HELPERS=y
and CONFIG_AUTOFDO_CLANG=y emit all functions into a single monolithic
.text section (0 .text.<func> sections instead of 417 in
rust_binder_main.o and 424 in rust/kernel.o on arm64 with
CLANG_AUTOFDO_PROFILE set), preventing the linker from performing
AutoFDO hot/cold function clustering and discarding SamplePGO weights on
the inlined C helpers during final code generation.

Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
post-llvm-link $(CC) invocation in scripts/Makefile.build and
rust/Makefile.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..f2d9b4411720 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -658,7 +658,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..bd7bd05e9fe9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -369,7 +369,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..e72efa5c6c05 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -120,9 +120,10 @@ endif
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
 #
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
-_c_flags += $(if $(patsubst n%,, \
+_autofdo_c_flags = $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_AUTOFDO_CLANG))
+_c_flags += $(_autofdo_c_flags)
 _rust_flags += $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(RUSTFLAGS_AUTOFDO_CLANG))
-- 
2.56.0.317.g454f8302e1-goog

