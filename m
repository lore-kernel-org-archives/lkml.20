Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934B46984C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519499; cv=none; b=DnYCAnzvMViEKxr5lx0JlIeDDQaXRzk0w/eiAhXGAOPxuS4OTWYfqZwo6NZ3/QzliNArpONITmTW4wSlPfR1EkDJREypUVIlTXbgcav5Pphv/sIK3dPVB9CTCBWIlx2aENGoGmSfYQAcC8hijzewgamN+Ji08KIxxvEUMcyMl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519499; c=relaxed/simple;
	bh=bF1FDXBCoi2buFVFtpiMnptMDkjG/+2sPnHh7nDEKC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjoKiCyyIo2lRB8SZmakKTNBaR2wDcVQt84UgZVh3ZBEK1+leLO/41s/CoKsUtwd6uJ8V7ibn7YKVYdmRxL/kbU/bKTmotOOAVIESrTBHcJBy7Z4cteHqa1A6opVDtN0IAe2dtShbO3OEjGQgp+6XiipM9Xq94DBD8yrvcw73/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5tdviy4; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5tdviy4"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1030262a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519492; x=1789124292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPcTYs8oAkeVV0FRL9AgbrivmoqvTTcMbkSKOhNgpI=;
        b=h5tdviy4bzm5fISj0+ZiOro2sK25mS4Iid8ac14IOyqiw6e5tQ9cx7BiXzNpF2AeaU
         mv99Ctpqv8eN1EL0Q4V6PcIlqMlzC4kav6F8p1rEyt08f/+47awt+HMOdU5GgkjW090d
         Q3Qp7+kYozRAOWCC1J4t5LQdmtDGeGBfj81gtsQpngsVqQIyLFVnWE7DcLvQMlsK0oYP
         b0O/dp5Xsm9Ga6jYLSrkEs3/Pqen9Sz44GpdzGkc/GIXeuVMdI6M3NM4Q+S/3r9M3T7f
         3shF1DURGGSC71WxiQnOWyhgFshMKPccq0plmuiNeZacgTOXw4SwvfhiUO+AG3NhasOH
         KA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519492; x=1789124292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPcTYs8oAkeVV0FRL9AgbrivmoqvTTcMbkSKOhNgpI=;
        b=WGlGbkEy7YfzsxpEuunZYOxMU9IS1+8oVfHsZdFmnQSWpSYnEJGWwR5R3KJaLRgaTh
         FlKhX+huzvfkpiMuDssnsQ5nGIPYg60MFMsdBKXKce1rDtjHsrLb/9Q2W3U9xHCKS2VC
         4qtQgzu1wREiTvgaXBBIumyzBZP27jX5ZnWNSS7lXlz0eoc/w8ptJgVbhSKSnaXxzgQX
         MPzpO4Rtr3YpEqpzJ7YJ0G5Gveu3V0QWuTG4wn0RdXv9oZ4Xh370TaW3n/3EgsSfoTqO
         RfQcbfq4JwF+EqirFFr1fmjLXljdhiyaFZmLmj9heDez0t6ObfygihINbQMqVBZnBjya
         1iuQ==
X-Gm-Message-State: AFuF++lxtfvg+znxx2KwwxOGM3p7iqzOm1yrpqA7beetfz41eAutDnQr
	pSLrWSThfwHT4sw4/UOaefAKBV8hcGYQQZ4oYdd+k0bqr2QBG24G03zm
X-Gm-Gg: AYBFou0kL+ekJtwelfBB/oV8M2lmSyc2nVCSz6R4zhwUt//e32cmhJB7MA114XcG2zm
	U8OLjyi/XSUbekIx09ZjwQs6DP6YpHccEAS93NXpJgzg8cOwEkwdiSIfxBhWeXLPUsHop8AN7Gk
	vMJnCQOouDXYoeXUzDGHAKg+ilk6dPUt5Hn+BHIsTMh5fooYD/RmnAUzhvFKL9uCwFoRD2i/5b8
	sxXMFvAPWF/GUpIvNg7nF+mco33A6WEFWzqc9QDuOFV1Qz4NfwShIgWotKAqWvVS865GiRSeck/
	EJRzWUDN7bxXnWfLg5B7x7OjHHZjrtDssVkEhhSw/C2TYDZFpuui7MaWuQWRKioPdv+IX6T754y
	vtb23sBMfLNak98oV2jG5M3G6AfaVZTQHjWoCilDVda4+zt8ddJcDy1ycqYoNQOEDWnNiHoClME
	+SsEaAPVUIh3mW0NcoG2vvEUu6AGKXacfttXnj7M1jn1ZRJWRoAOjLvRqNL3e9O//9Rbjl2Chjw
	IEURjAh4gtzaRxeezZ7mS+3oLXfy83B4mKxuQ==
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr7668073637.8.1788519492320;
        Fri, 04 Sep 2026 03:58:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:58:11 -0700 (PDT)
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
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/7] selftests: bpf: fix typos in comments
Date: Fri,  4 Sep 2026 16:27:34 +0530
Message-ID: <20260904105743.39799-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
index 1b25d5c5f8fb..8b96fb861368 100644
--- a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
+++ b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
@@ -13,7 +13,7 @@
  * IPv6 header with a Segment Routing Header, with segments :
  *	fd00::1 -> fd00::2 -> fd00::3 -> fd00::4
  *
- * 3 fd00::/16 IPv6 addresses are binded to seg6local End.BPF actions :
+ * 3 fd00::/16 IPv6 addresses are bound to seg6local End.BPF actions :
  * - fd00::1 : add a TLV, change the flags and apply a End.X action to fc42::1
  * - fd00::2 : remove the TLV, change the flags, add a tag
  * - fd00::3 : apply an End.T action to fd00::4, through routing table 117
diff --git a/tools/testing/selftests/bpf/prog_tests/task_local_data.h b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
index 8ae4fb2027f7..9f2971fc7cd5 100644
--- a/tools/testing/selftests/bpf/prog_tests/task_local_data.h
+++ b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
@@ -243,7 +243,7 @@ static tld_key_t __tld_create_key(const char *name, size_t size, bool dyn_data)
 		}
 
 		/*
-		 * TLD_DEFINE_KEY() is given memory upto a page while at most
+		 * TLD_DEFINE_KEY() is given memory up to a page while at most
 		 * TLD_DYN_DATA_SIZE is allocated for tld_create_key()
 		 */
 		if (dyn_data) {
diff --git a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
index 624078abf3de..d7e30ee576c9 100644
--- a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
+++ b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
@@ -7,7 +7,7 @@
 
 SEC("freplace/btf_unreliable_kprobe")
 /* context type is what BPF verifier expects for kprobe context, but target
- * program has `stuct whatever *ctx` argument, so freplace operation will be
+ * program has `struct whatever *ctx` argument, so freplace operation will be
  * rejected with the following message:
  *
  * arg0 replace_btf_unreliable_kprobe(struct pt_regs *) doesn't match btf_unreliable_kprobe(struct whatever *)
diff --git a/tools/testing/selftests/bpf/progs/verifier_var_off.c b/tools/testing/selftests/bpf/progs/verifier_var_off.c
index a63e33675091..227dea0da3a0 100644
--- a/tools/testing/selftests/bpf/progs/verifier_var_off.c
+++ b/tools/testing/selftests/bpf/progs/verifier_var_off.c
@@ -225,7 +225,7 @@ __naked void stack_write_priv_vs_unpriv(void)
 }
 
 /* Similar to the previous test, but this time also perform a read from the
- * address written to with a variable offet. The read is allowed, showing that,
+ * address written to with a variable offset. The read is allowed, showing that,
  * after a variable-offset write, a privileged program can read the slots that
  * were in the range of that write (even if the verifier doesn't actually know if
  * the slot being read was really written to or not.
-- 
2.48.1

