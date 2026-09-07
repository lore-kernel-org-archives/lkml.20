Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C958371D01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756734; cv=none; b=DrrzRwrhw3JcXKHEhnJ93tPt+kT1E1Q0UD0fYBuk6ZlYDmu7WhNO+1lwAGGQHLjLreQEjWH4oq06XWS06QJfIQE1688dzTLLMElV/nNmsEH8rvCyof6A+5P1lOztqYQIiMruo4NvocJBIz9pU4s9J8QwK+gApV4cDAdNBGwyCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756734; c=relaxed/simple;
	bh=p8E1QK/4FioG1d4S1YkCrtoTmqQDudh5HjsVGvHc+yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbGdBsPNA+OjyxnE2Z4ptGUWDSrE6FbrT5D+QVzQlftjB3a/UKhdjnhWvGRVE07Obyoy+v4l/TwiW+MvnvX2VB4Ywjb7Etx9IhXBm3Ph0EJ8jsAE+qG+1SEk7g/4uTcV0VRNVM6WG62l2HpwfKmsCNZDBWY5x7tF2W5LPhkx2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNE/yBgc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNE/yBgc"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3737888a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756732; x=1789361532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGe5bwb/eYgn9AMup9CCvH2ogR87NmRNuEpL6c/z+js=;
        b=TNE/yBgcZxbGPAdOq2yiMpEsl86HD0pULin3jKN+bYleIdqSCo82bIK3nb4jVDnbRm
         5K+bl+kvgXkeddLJLnATBuAKWGD6O6L+4vz1coLHfkTFoziLcpEEXszSfxBekqW4bPPv
         OIh3GKTZyZp0JuS15PlkU1IZTilkuwHDZi2ZBT0GWgYu6SX9GV375vih7iiomFKREv6y
         U2pfGH7HIt+hlCty8fkqF7EOYMkoyfAXvvE6VH2kWQx6W1cKsOZJcrmXOraeVGJyWf1d
         CPbndhJJZelS/W/rumZnff/BsqxOd/duZ3q4CAewD2wAaS37h/LMJYRKUAqXe5wBOuyB
         mG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756732; x=1789361532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGe5bwb/eYgn9AMup9CCvH2ogR87NmRNuEpL6c/z+js=;
        b=gXgc+CYM8w+r1ep++MVD0OqryIBwBJmNr2+555cRdZfSL1HGDAyYoIfWvt8mh4tVsH
         QP5RH77s6rn+8f7Xj5TBVOOOlYo7wLoCFClHH8EQ/hrCbYju2aXbLjqA2ruIuiHkA781
         8gS7Kfrdt8X+DGBBiqHJUmGIpj17HfB4Nv1JFv2yLAM//Ebpa/2QkoPe1FjOewcoVMt4
         6pli3Ufaa/t80rdc/2im6vw7xfWVKDdVPDydsIrLAEf0XDc/ehCYVvi3V6wEf+400Knf
         2rtelvNzgko9V6CxUYAPmtl5cvHXGQOfklkzm8rgn8gdoPqt3NduufJUv4e/v1AEfNz0
         4oag==
X-Forwarded-Encrypted: i=1; AKwUvByAHZlqwQOjAlHRHHnpeFvwb4i3xDzbB+/fR4IAdKqP7F9+T1O+Qu0NrqgfMiOCMXwhgJEQ0aJTtBF9fpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k0CitOixatRyfVLDfydpruIIHGdRw3hMItELKowp5SWHuGxAAN
	9EQrDXMDAs43EKxdQQECjDcFz5/JJg8e1Z3dHqhJ2s5/cnZSswrh93At
X-Gm-Gg: AYBFou3SFrlpSBMQwb7fWRHpica0c1gmukTLtF0T26mN4LMzRQctCANVcwkBQYHnbJR
	BPoy4ELPWvGJWlCxf74F0bTzo2M2hZGK0qPjm8O5dadatuDHYB9BKH9AwXnhBqRxH2sjMToswAK
	1Egk7SOmJ3dqflcYcHe0iPqPE6PJ3mbbDSDUPqqVAQKRull2UHlaDprrT2CedLAj5K4Kt9hm30L
	I10PITuZlprVSA6r7A+f9TZQohhLA35OMqyiO6W94+jDxgFEEKQ7HRr2GzE82gvJ8f18G7SV7wW
	CBUFIHoUHc81I//VhKVW1LB9texBaKwz5lqs8MdfygZu1c1Pc6SdonTLzbDRX2bo4nNtyljh0Kw
	pGwbHLYuMZQcERNozgnh/2WTSpjrsn4pel21SE+1PKxU01efN4hoNmeqC1YSG/Pj+T6rct0CzTE
	wJDE6PJAFEqBGe84zb3XTs7Hr7x1hms1Cw7A6CsOQ0iTcdKiWt4qEjpBgTZ0Bwu8ZhFRpOrFsdV
	4oTtzYoPUCUew==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr28690908a91.21.1788756731628;
        Sun, 06 Sep 2026 21:52:11 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 3/7] powerpc: net: fix typo "upto" in comments
Date: Mon,  7 Sep 2026 10:21:31 +0530
Message-ID: <20260907045135.13317-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index bfdc50740da8..cf8c1b49da25 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -23,7 +23,7 @@
  *
  *		[	prev sp		] <-------------
  *		[   nv gpr save area	] 16 * 4	|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 16		|
  * sp (r1) --->	[    stack pointer	] --------------
  */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index fc9db691e820..8a1a00026c69 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -23,7 +23,7 @@
  * Stack layout with frame:
  * Layout when setting up our own stack frame.
  * Note: r1 at bottom, component offsets positive wrt r1.
- * Ensure the top half (upto local_tmp_var) stays consistent
+ * Ensure the top half (up to local_tmp_var) stays consistent
  * with our redzone usage.
  *
  * tail_call_info - stores tailcall count value in main program's
@@ -35,7 +35,7 @@
  *		[   nv gpr save area	] (6 * 8)	|
  *		[ addl. nv gpr save area] (12 * 8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *
