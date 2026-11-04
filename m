Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808467;
	b=mKfxRPlknzfHo2P/AGPy0gjmry7zielCuRYJkBSs6J3XkG4cwfHAR5ZQHol890WCGanA
	 T6253K1H3wyKtuPn/sR9swI0gY6KJPjrY1HONrI8B1EN8jVrb5W+AzGJXJqTtLfauk1SG
	 46/6AHS/NfM5IVHLDcM+UF0BmMN1RgQptpjgcC2mD9xcjkq9+PR3AxYaEmu2X1uGoTgzv
	 td8xVT2rAzg6Zc8Kn5gYjp33Gt54A+0kZMGzIhDt5qhliCCRJXtSNCY3XRozalTpdrHJg
	 ZxKDdMBGLKOsYFp2pjI+EziV3I8ulDRwSbXAxzC4f6LR3QV99OoeycYwuNm7JDzXvXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808467;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/9OycSbab0oLop7I27uSpsY55X6pV1loB2h/5WPOjvo=;
	b=zaAs6S0QGbLJuUD0nL8N+2tyDuTg5QyKzdqo768b+1jj8+5v822wFuKqcOiFhD5MUeXD
	 XcfZCJPatNFzi1qzST/VUVjSzHoKARpg5ueIGLKPcrQz3t5mKGPDqeUb+9Pvp53QIt+n4
	 HBFQXggI3dXqfP9a3+Ue+i7QMJB2TkR8y6DSihVf110KLNsmnlQGfQVFhB8MqF7Ej2mHB
	 VFKOn0cTcLdsuQJRHBMOPI/NCNevQtrCuAeBV1XqPT/kwb5NnKheH1L1+6BAxG3+O1DoD
	 EvPekZf0Q2U8eL9s+nMTSKgdKGZTzl/JYiYCZKgtx9EVu5FTolSNYEhg1bgDHLEjYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OY8vW204;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B8606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 774B8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OY8vW204
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/8Zi8wb9hfoOYhMsVXBD1wr36RrVK/LpiFnzdHHydD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808464; v=1; x=1794413264;
 b=OY8vW204zgsBwFZuAGXD6wyPMllmquU8Dsff2FrbqccfCswggILmyFQFONRBI/BLPaWWZN4Q
 HX098eHKH7pZiWMz9IbEfNI+nu9Fe1Zjq6u8dEhvjm9jvwbwRnPpKvyiTIx9td5SJ0F9H9PLj72
 bLduD4PELTkcsM9LyMOaXp9A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 81a47fa767449914;
	Wed, 04 Nov 2026 16:07:43 +0000
X-Mizu-Trace-ID: 81a47fa767449914
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
	"H. Peter Anvin" <hpa@zytor.com>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Brian Gerst <brgerst@gmail.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] x86/cpufeatures: Make {REQUIRED,DISABLED}_MASK_BIT_SET() return 0 or 1
Date: Wed,  4 Nov 2026 08:07:18 -0800
Message-ID: <20261104160722.1637541-2-vineet.gupta@linux.dev>
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
of && or || folds to a constant other than 0 or 1. An x86 defconfig build
with CONFIG_WERROR=y now fails in prepare0:

  arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' with constant operand '4194304' [-Werror=constant-logical-operand]

The *_MASK_BIT_SET() macros used to be || chains of
CHECK_BIT_IN_MASK_WORD(), so the result was 0 or 1.

Commit da414d34b555 ("x86/cpufeatures: Use AWK to generate
{REQUIRED|DISABLED}_MASK_BIT_SET in <asm/cpufeaturemasks.h>") changed
them to a ternary chain masked with (1U << bit). The result is now the
raw bit value. cpu_feature_enabled(), cpu_has() and this_cpu_has() use
this value as an && operand. clang has the same warning, but it does not
check an operator that comes from a macro expansion.

Wrap the generated expression in !!() to restore the 0 or 1 result. All
users test the value as a truth value, so the generated code does not
change.

Fixes: da414d34b555 ("x86/cpufeatures: Use AWK to generate {REQUIRED|DISABLED}_MASK_BIT_SET in <asm/cpufeaturemasks.h>")
Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 arch/x86/tools/cpufeaturemasks.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/tools/cpufeaturemasks.awk b/arch/x86/tools/cpufeaturemasks.awk
index 173d5bf2d999..a7856f874a6b 100755
--- a/arch/x86/tools/cpufeaturemasks.awk
+++ b/arch/x86/tools/cpufeaturemasks.awk
@@ -75,13 +75,13 @@ END {
 			printf "#define %s_MASK%d\t0x%08xU\n", s, i, masks[i];
 
 		printf "\n#define %s_MASK_BIT_SET(x)\t\t\t\\\n", s;
-		printf "\t((\t\t\t\t\t";
+		printf "\t(!!((\t\t\t\t\t";
 		for (i = 0; i < ncapints; i++) {
 			if (masks[i])
 				printf "\t\\\n\t\t((x) >> 5) == %2d ? %s_MASK%d :", i, s, i;
 		}
 		printf " 0\t\\\n";
-		printf "\t) & (1U << ((x) & 31)))\n\n";
+		printf "\t) & (1U << ((x) & 31))))\n\n";
 	}
 
 	printf "#endif /* _ASM_X86_CPUFEATUREMASKS_H */\n";
-- 
2.53.0-Meta

