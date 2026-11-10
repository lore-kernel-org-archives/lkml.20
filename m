Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273776;
	b=GmPypHLJRa4/1E4k54miVWEtRFl4aOgekjmggC5CBdIwKVARML5Mzzg/YFUhYKR/eta6
	 +/+IVsa8XI5N2gDTwtN4hX8SpevLZxfgB+NKaSJcdUtUhaecOojdHZJskW55twMPIid9T
	 L9cXlKodaRwDblWaPt2FRbi0qBHgwAVG2ciBGpiDV+TVqZLREZotNPTrJU7BhOirUUihP
	 livW6oQkOQv3MaPV0fbIt2elwTPMj0t+BBE5EBsDfSBIe1PY8HdLQoy5uirslKE5FYrzs
	 5LnS4BBMTbzKlZFGBeHQ2YBcDcLp1d2IbvvNxbQ4WZZrVTxil8a5KLo77oxE2Ud77IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273776;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yIKtvc1ZmRXWfGxWgiVO8Ns8HZpEqAzhWlHpQ46fpV8=;
	b=0tRERZzMoZi8CnL06pMtl6Td3kVPkOe0cqwa0z8zq6DIBnLQdLCsNlZ0+U/Vneks3UK6
	 hACRAYoO49Fb96vgJLSiBjPfuWmBxq37ydUz23lx7C6bBKhHziMPxKENESWq2KShivKX0
	 HcMR/zcKP9gabKg0BbnK4rnsnvyFMntu9xoXooPaP23dpG3RqFf5jMv+tgqCR0El2EiY8
	 +4EpX8EVUBs4euUhK6xNOMp5VkZd/HUzXxfNn0sl1F6Jo6r8Un8mpyEcwWwV5DJKl/l+4
	 xfT+R+7E41pfh9F27E4O62dmSCH1a+6A7sOjXqJ4Hhd8Xjopzm3+u+ZNw0osG7qi2aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OL68jl5e;
	arc=none smtp.remote-ip=95.215.58.8
Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870F60A3810
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7870F60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OL68jl5e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=omlSFSzGf7aOUZjYbn/5+K5lXnf2XWvd5GZpuA4NvOM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794273773; v=1; x=1794878573;
 b=OL68jl5eOqQZJ8A9g06Dd+WgTgxJL2Uk13W8O4uZ8gCgG7u7mC5vZa0rgv/TC/y59jdd0B4e
 98g5lAgc1CnXpqmBJ+TTw6PkiaVSTjM07JhLHtpkacUSfhiaHGLZQzg9Ag0u/I/X1uxhVACOSll
 U/WNubHTjqr+do/A+UucvENs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0dd2321632bd0456;
	Tue, 10 Nov 2026 01:22:53 +0000
X-Mizu-Trace-ID: 0dd2321632bd0456
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org
Cc: longman@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	acme@kernel.org,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	llvm@lists.linux.dev,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [RFC PATCH 1/2] percpu: do not put btf_type_tag on per-cpu variable declarations
Date: Mon,  9 Nov 2026 17:22:34 -0800
Message-ID: <20261110012235.1024461-2-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110012235.1024461-1-vineet.gupta@linux.dev>
References: <20261110012235.1024461-1-vineet.gupta@linux.dev>
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

__percpu carries BTF_TYPE_TAG(percpu), which records that a pointer
points to per-cpu memory. __PCPU_ATTRS() applies __percpu to the per-cpu
variable itself, so DECLARE_PER_CPU() and DEFINE_PER_CPU() put the tag in
declaration specifier position on the variable's own type.

arch/x86/include/asm/processor.h has

	DECLARE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);

which an x86 defconfig preprocesses to

	extern __seg_gs __attribute__((btf_type_tag("percpu")))
	__attribute__((section(".data..percpu" "..read_mostly")))
	__typeof__(struct cpuinfo_x86) cpu_info;

and GCC warns:

	processor.h:232:36: warning: ignoring attributes applied to
	'struct cpuinfo_x86' after definition [-Wattributes]

which -Werror turns into a build failure.

The message is confusing: this is a declaration, not a definition. But
the compiler is right to object to a type tag on the aggregate, and the
issue is fundamental: every variant of an aggregate shares one DIE, so
there is nowhere to put it. clang drops it silently and GCC warns.

The tag is meant to record that a pointer points to per-cpu memory, and
cpu_info is not a pointer.

And this gets worse: for a pointer-typed per-cpu variable GCC attaches
the tag to the pointee, so

	static DEFINE_PER_CPU(struct bpf_hrtimer *, hrtimer_running);

comes out as PTR -> TYPE_TAG 'percpu' -> struct bpf_hrtimer. The truth
is the other way round: hrtimer_running lives in per-cpu memory and
points at ordinary memory, while that record says it is an ordinary
pointer to per-cpu memory. clang emits no tag there at all.

Add __percpu_var, which skips the btf tag (__percpu under sparse) and
use it in __PCPU_ATTRS(). The cpu_info declaration above becomes

	extern __seg_gs
	__attribute__((section(".data..percpu" "..read_mostly")))
	__typeof__(struct cpuinfo_x86) cpu_info;

The pointer spelling, T __percpu *p, is unchanged and keeps its tag.

Before this patch the tag also qualified the variable's type, so &var
had type "T __percpu *", and a pointer does have a DIE of its own:
pahole emitted PTR -> TYPE_TAG 'percpu' -> T for each one.
this_cpu_ptr(&var) is that shape, and that is where the records came
from.

Those are the records an x86 defconfig built with clang loses: 280 BTF
types, 140 TYPE_TAG and the 140 pointers carrying them, with .BTF
shrinking from 6831660 to 6828300 bytes. They are the derived pointers
-- clang never recorded the declarations themselves. None of them were
reachable: a record points at a type only if something is declared with
it, and nothing is declared with these. The 794 places that do declare a
"T __percpu *" keep theirs -- the tags reached by a STRUCT, UNION,
ARRAY, FUNC_PROTO or another PTR number 117, 6, 3, 39 and 5 before and
after. .text is byte-identical.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 include/linux/compiler_types.h | 8 ++++++++
 include/linux/percpu-defs.h    | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..0a18b3f10675 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -50,6 +50,7 @@
 # define __user		__attribute__((noderef, address_space(__user)))
 # define __iomem	__attribute__((noderef, address_space(__iomem)))
 # define __percpu	__attribute__((noderef, address_space(__percpu)))
+# define __percpu_var	__percpu
 # define __rcu		__attribute__((noderef, address_space(__rcu)))
 static inline void __chk_user_ptr(const volatile void __user *ptr) { }
 static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
@@ -68,7 +69,14 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
 #  define __user	BTF_TYPE_TAG(user)
 # endif
 # define __iomem
+/*
+ * btf_type_tag records "points to per-cpu memory", so it belongs on the
+ * pointer spelling only. Declaring the per-cpu variable itself puts the tag
+ * in declaration specifier position, where clang drops it and GCC attaches it
+ * to the wrong type, so __percpu_var leaves it out.
+ */
 # define __percpu	__percpu_qual BTF_TYPE_TAG(percpu)
+# define __percpu_var	__percpu_qual
 # define __rcu		BTF_TYPE_TAG(rcu)
 
 # define __chk_user_ptr(x)	(void)0
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..f53fc430aaad 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -45,7 +45,7 @@
  * that section.
  */
 #define __PCPU_ATTRS(sec)						\
-	__percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
+	__percpu_var __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
 	PER_CPU_ATTRIBUTES
 
 #define __PCPU_DUMMY_ATTRS						\
-- 
2.53.0-Meta

