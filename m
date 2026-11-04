Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808488;
	b=2GPk/3OWm3YGvtMc11XxWj77ar+x6pA2DAVTe/XDgj+XvyaUJZBqM+pU32CvQwBXPXg5
	 Z2l9K/DgjFWLUZZYA6uXfNkTX4uJOajE6t0iQqaCcBA8t68ZRm68y7Z8dkQw7RbP9Wq3E
	 JotlzXdB1x0Q/9yfvDYDPP0MnpiLh249trzz6QeLvgMCCE+pG6SkmoDp31FjcvQwz5xr4
	 aXd+W5KV4v4OmdMjfuxY2VWbF+jpBVSR2W/yKJHPVIhIdM4Lbc5P4g3hX4NYEVlw7CLQF
	 EjnCYwckBqDMuXU+oK8RtoRQNO5yPxrZkHv2PFgzqyb3pLPaMWmtdq9d3AwP7vwJSgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808488;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=12512aLllXftI9moEQx7MlwEUWUL+y5ReetVj26fF0E=;
	b=ZvbRv7EwY5Iy9Y9GNuVuAyOZqgF+rTI+1Bu/n7yoJ5NaHSy4qyZXHWewkJwWW4HGcCLq
	 SGxsi8PZ6X7HPdQdUmPKmI64OMhAQxMZb0wvqCqrJ6YLWVFxfMjEMoviGqS0sRnhlxB1W
	 UdivcnBcokBRjPzs+0Wepwz2LELT70Ap6//hvwauth6AmAsAsnGiCPVLgOb4B1vmVu6h1
	 ks12bQ7A7O8T3Du8Kt587pkDo3+pfbQTeiE+Fd3UHescdqDdSNX2epFQjSnUEizYEAdOj
	 MMvCBbGM6r+DkLSjoXUp3/zzWykzkZK9HuQKr/D3kZiCJRWBGXgH3yOpYIMvSkMzHuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QixuRtfD;
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C300606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C300606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QixuRtfD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TEEBqA5mys4k9gU+dMidncfMYOQA4DDB7pbBCcoYQ8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808484; v=1; x=1794413284;
 b=QixuRtfD2BlGZkmyOq6j+n2cjmd/JVGNW3lunS8IsrkI0WSeBnGRw1DgpFUt+WnJp1EYNWE9
 EzQh5m7Jk8M17/Rb9FfenGX4iDcxL7FLeegs13BfnMKF4uCXXzhV9dnPfibPXZyiFyVlkrNMbJW
 6U2dMMf0lZ2hLCtWmIhA6zDQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae6b6b9431f873b0;
	Wed, 04 Nov 2026 16:08:04 +0000
X-Mizu-Trace-ID: ae6b6b9431f873b0
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/4] drm/i915: Avoid -Wconstant-logical-operand with GCC 17
Date: Wed,  4 Nov 2026 08:07:21 -0800
Message-ID: <20261104160722.1637541-5-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104160722.1637541-1-vineet.gupta@linux.dev>
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
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

GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
of && or || folds to a constant other than 0 or 1. Three places break the
build with CONFIG_WERROR=y:

  include/drm/intel/reg_bits.h:27:48: error: use of logical '&&' with constant operand '256' [-Werror=constant-logical-operand]
  drivers/gpu/drm/i915/i915_config.c:13:43: error: use of logical '&&' with constant operand '10000' [-Werror=constant-logical-operand]
  drivers/gpu/drm/i915/gem/i915_gem_context.c:999:45: error: use of logical '&&' with constant operand '20000' [-Werror=constant-logical-operand]

clang has the same warning, but it checks only a constant right operand
outside a macro. Here each constant is a left operand, and
IS_POWER_OF_2() is also a macro.

Commit 1a839e016e49 ("drm/i915: remove IS_ACTIVE") moved
CONFIG_DRM_I915_FENCE_TIMEOUT to the left of && to avoid the clang
warning. That does not help with GCC 17.

Compare each constant against 0, as commit aeedd3a82678 ("drm/i915: Avoid
-Wconstant-logical-operand in nsecs_to_jiffies_timeout()") did.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 drivers/gpu/drm/i915/i915_config.c          | 2 +-
 include/drm/intel/reg_bits.h                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..1639639dd290 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -996,7 +996,7 @@ static int intel_context_set_gem(struct intel_context *ce,
 	    intel_engine_has_semaphores(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
 
-	if (CONFIG_DRM_I915_REQUEST_TIMEOUT &&
+	if (CONFIG_DRM_I915_REQUEST_TIMEOUT != 0 &&
 	    ctx->i915->params.request_timeout_ms) {
 		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
 
diff --git a/drivers/gpu/drm/i915/i915_config.c b/drivers/gpu/drm/i915/i915_config.c
index 9e13b1be407c..9bbebe0a6a70 100644
--- a/drivers/gpu/drm/i915/i915_config.c
+++ b/drivers/gpu/drm/i915/i915_config.c
@@ -10,7 +10,7 @@
 
 unsigned long i915_fence_context_timeout(u64 context)
 {
-	if (CONFIG_DRM_I915_FENCE_TIMEOUT && context)
+	if (CONFIG_DRM_I915_FENCE_TIMEOUT != 0 && context)
 		return msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
 
 	return 0;
diff --git a/include/drm/intel/reg_bits.h b/include/drm/intel/reg_bits.h
index 2a9066e1d808..f913c3e61f39 100644
--- a/include/drm/intel/reg_bits.h
+++ b/include/drm/intel/reg_bits.h
@@ -24,7 +24,7 @@
 /*
  * Local integer constant expression version of is_power_of_2().
  */
-#define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))
+#define IS_POWER_OF_2(__x)		((__x) != 0 && (((__x) & ((__x) - 1)) == 0))
 
 /**
  * REG_FIELD_PREP8() - Prepare a u8 bitfield value
-- 
2.53.0-Meta

