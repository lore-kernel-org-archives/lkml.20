Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850ED45D1A8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456655; cv=none; b=GFlwF83Hs2A5nnCpHw6N6nS3uNBF6lMqoWWN9F6BAdx0DYNZO4P3XyT2NqJuap8w+96CbN9skE6AxRdtuwvKlGelSzu7mPx+d71jSN9vSfyEceC/sL7+X1d05Bi72Zd0++KWgKTUIV2XCqKRQwQ9k0+LQA7t6N1MVrbsKEBtR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456655; c=relaxed/simple;
	bh=AWqWG6VxlflSFSzoqp4jCeQqQPDGRE6cdtAKV5mteNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsZaAefuPRqgrBZW9yG494b2mcTq6OApim5qbil5kKQaJl+lGw7ln5/ElVnzdNj9PVimPsIDqIh/ZfPoABMLLT746DDx9xEzFl3ngGHX0ZvOghjC41eh1aaE0srCgGr1gTH23I41k+IkK6syNuS7+GLXKvpWd3LLD6sPf21beT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPWks4+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLEauS/+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPWks4+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLEauS/+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZOcA1661451
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=; b=SPWks4+rEr9I5TSa
	SWGU3hX0SYmhaht54r/fN5dYD/cVd5yZKTpVs4v18l1jx1EC2SFEFnRRz8fEYmRR
	fQ+/fqN6cyeHl7BxRNmbGLUB8X8nRZPIF3J6ztoNsoJGWvCsiybqgToK44hfGDEd
	Awrrvh2w/aVw9ZqTTJoxuFFHGVDjJVqbqKITulrHife/nDHxxUAa/ucme6GHRMM6
	3X1yxct5UtAkIt7wqMqiNpNyzY9ZK5Ky+NgsoJQsqfpgBCzxFRUslMkHswkUK2KO
	NxpjAIqYL/V4AUIKGleXZuS8PzJtH9fRT+lAMZAPf+tNvS6+/Oiwt/TaVwq5Lc2W
	D+1xAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcg5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6947886a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456652; x=1790061452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=;
        b=DLEauS/+YNf3GfbhABu8BrFNgHomyzrQg3ihmPuVpVYixgNO1/myOh5N0QbxNpZCwo
         f1BxwkKdpgfU2Uh68I6X8V5GpdGXervChd6nmfOlkb8V5ycQesK9WrckdHszNOPlak+F
         EpbMNWN0fQ7lNrGa/A46+MAVARfX+ok+3iraE8fFUiNiWzzIlQWFAUI3szWOs9TMBc90
         LLRl8l6gbAtTP9f2gvuxPQQRLcf/eaZ4wldfRUI1QP/bKXqtSVz6yhAhPkHY5sdeAZC0
         vn2cdQSeebBxVkSgrSEdsdu82L1WyBSikWqV327gsiyds6TXStBHBW1JDqPAbMCTfWiF
         drZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456652; x=1790061452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=;
        b=KlgcXty3HwplReGgF5L0834OuUXycqZsXs/kAYIWHdp387bLc0IqCFISIKWeQRdVtL
         XPEla9uRgOlxxEzfZ1lP1keRc6Ob5L2C6lLPquDRIVoKD3RslXyGnt8z2iWkQIx/P9jS
         8tyRuGeHRsaDgV8LaJ0QsAZBsPkepvC+xtRNaj0/4ZOwRssQul7Oz2Tes1z0sQYXnXzj
         godXNrE/EY1kAcT3O0vz7C8rktffet8rhXbXXyEPn289V1X3PEWh0FZkqm6qHH0uWkmD
         G1/1pfJFPwM6J3+i2wRZ0Cy77xBMHWEDevM8OGXxJpUuQiap1eXTEiPsxUuhFRT03EOF
         uFRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDVFVFxX95Q6q9cAP3VLErIPscD6U+PeO1HjqfJa1CZEldAIDjXP4Q/w0spNIe8zhDyfZQLcOjgnZJRHA=@vger.kernel.org
X-Gm-Message-State: AFuF++mBNtvDX3VJ1Y2P/b7S24nxSulU6Xsk4Dgke9+u9XeRIR1dd04z
	p0TeW9ov1nd36Qx353v5LpfUb3GSjAvMgzxfBFXhoN0vArekacUkMzg4DtIaD4sjnlfPCLq0Ta5
	xmPqBYiw6njEeSxo/6CUlg7PSCiPLnlQdiVG1udtKuZpTbvhusQ5T2kLN5DoViJ9q9i0=
X-Gm-Gg: AYBFou1/en7KhzcHlgBLnrvmNV572GMajJDPi6ya1h/xm/bAiRvmTCf4UTO0wbYTj60
	ZibPKbOqEAzE3iY3SC8WFmeBIxxcS0mQ3m0R7XJgbMxNdwdwed2+tYzBcuvk9Aka055Dy7mHZiN
	Ua2hnAF4la3N8VFKqgde6ah1VFduzLaPtF79MuAlzhKeYJh+PhFR4byvj4Dt4mg+AlmzkurIIQO
	3pTGm/biADQk7zmNNUjm2GwAGcwZ9exAd7GqzG6lUu4JNtfAvlhwxy3JsxKn32sQuoDhBRYxxU1
	3Z/g++fjVuShOxXvZGQzANDKoY7to/ghM9qqYBflsSvmmlP0HjwsZSJqSHa2
X-Received: by 2002:a17:90b:3cc7:b0:39e:d2a:e272 with SMTP id 98e67ed59e1d1-39e0d2aee44mr279569a91.5.1789456651491;
        Tue, 15 Sep 2026 00:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:39e:d2a:e272 with SMTP id 98e67ed59e1d1-39e0d2aee44mr279516a91.5.1789456650899;
        Tue, 15 Sep 2026 00:17:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:30 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:35 -0400
Subject: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7799;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=AWqWG6VxlflSFSzoqp4jCeQqQPDGRE6cdtAKV5mteNc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bN2ca5v8e1OveLfdXJGnaNPYtSvE7u0ZfaLu3r+
 bZ34wedjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIPA5GhvsT2X3ONTgYht2w
 PFdV7GCv2d72e6N528HrD34qfV4scZPhf1iB0fEZn53Sf//4G7ZHWFPCPPPUzfk2N9SfBk7cbHz
 /Ci8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8f10c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8k0796NHAHKl4oQHd1QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7jiZ686i4wfStm0QVyPhg_ng3mzvwuQ5
X-Proofpoint-ORIG-GUID: 7jiZ686i4wfStm0QVyPhg_ng3mzvwuQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3ANmwhUfCEbA
 wxjA9Df3CINjpyWkOJrkqHG4rmbiWHJOq3b6USevXIFdYGrC8Ma60I0rrbUIj5mOAUJsP4m0Nso
 ceW4oT+r/q2ESxUbE59EU3qYun2zA+V3SZRktC76ZVXUIvDsFZ2q3D5HYJEX7LOg77BkuNEgWoF
 toiUtf8NYAyET1KzkNF7JZrbmUboZvt2sEozXp9iay69octXaJgZd1Bi4EMh9JZfPtm2eZfoUbs
 6RmQDrWTmgswGt6MeWfLJu8OGvSBKOINoQnsH6ZMYnp+eVhuD3Nt4VqhZ8R+3PSERrxlSNHP7W6
 M9pOp6OsF39bC14+uqzgPQSTg9wch+NVs/E+y277lh6qgZiDmrGMtGCwkfbJ/92MErsXb9SQApN
 hR4wzoWuGELeOp/xmJD2MT2zPsLIVHLhTIduLV14BCxrNNJFu1Y55hF6Qc6ficuc86zo+it6P3Y
 Vn26fbc+EBB77G5iBWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+L9a3WTWL9au
 pSroBrxMZDIdis9fUa8Rv5vw3fk89L4VYCjjJYUrJCXTQs05QTVj1T8UQc2d/Tr1jz+poVZawzL
 RGzgrqeuo4IE3+ADhgNNsnt9sVYDjaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 113 ++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..89c64d42ee745 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -130,6 +142,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index de7cff5f48c34..f88031660e6fc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1334,3 +1357,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0

