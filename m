Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B9391E76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888799; cv=none; b=T21mUHzXuUczDs0SdISkAjetY0klwckpolPEzxGPNwb5YhF17r0cM6O406uXOmydGighVBmi0xeakTouuFiSt4+nzYX2YJQwE5H+rH7UJUScBsnhnGZqBDFr3C5ZfxngaWU9NO7Raz10HpXxwe+GmHwIsS1dSHBmKEDoFxeDLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888799; c=relaxed/simple;
	bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLKT61VvBmca2yNwaweYsgAMtfMcnghJzR/N0CrToILONBOlDE/YkjDzoMnPFa13HCQfJqNO9VfjijEyTwQbk5DkcejiWftgZjyeb6lvLg+7rSxxHabXLTXG6lPlTvcibsPnFtAEcYJgXMx87zJyh/5Kmj2WrFHknLl0lPNlAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjXAMP09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWCpHIdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjXAMP09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWCpHIdt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55D1P1375892
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=; b=VjXAMP09Ggey6wVW
	k6Wt82ZlJOTex+hbBMd3dQfhZo8+dT3hRgGPgLTO03P0vlWf6CSebHvPUqrqlMYz
	r0LBVqeMrUldbHdaXaL2Q9PA6vhgM1FSSaNdfkMDzSNfNwVTNGYoKMQgREVD4oEz
	2pK/8NAV2m6ldCV+aEZpLxSLmDnww3jwF0/rlCuKMNDcCKFlDmyB0jD7YaSYQ9o3
	am8PGPsE4fQL4RXLSLWI/bBpRsH3jDQxLOP3YN6sl+cMYhgxa6pOkM9KB+ryMJfA
	zDkltq4Cor+m19iGEuTEuAr0CXAOZg40ds836ZGC0f4Fjykb4RdgKlJGL3fljJam
	M96+7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftjn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so740311a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888795; x=1790493595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=XWCpHIdtvbFygfRrBQyQuZZm8JVCpOPVx06dPAcYsCf7CcZyidKt8Zh2FuEZAWjoE+
         H2kum444kz74xlQaRRq8x/lclTDnJKBmjmLDmuIeltda8frUvWRryEQqk2fJmIc1NSjC
         lwG4V0/X9d/v+nAW1ACVzaXiZamNIWd/wfMn1xTW9AqsHXdmBaFQKIrbT8eDqJM86ESY
         RuEybbeH3AbzIp59LRRLE0P4xcBmPkcQumPRKc2bqca1XNSh4flrBGDkH+VsBoyx2h0Q
         Jn1T7zNtBpoX3kx71lDjyGNG5czHhBJHMarwqouDt+9geG1RsWZ9yp5zMA/OGrQpvV8s
         V8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888795; x=1790493595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=vO/WkLEz9E+0SqIMUnL5kTTX6/55ywrhzfWQ+1QIm4ZFJno3af7LcnoIMY9/nzYUSd
         KsHHdVgCVYR2aL1ZBUpxSyIlOQnwz0NNVdf85EO3SHo084tvoLvnw8eJxJsufSjqiTAh
         HDOJAc2tf7rf6tAHFQOpamdV6WYEb7aXY5shQwsPmG4PTej/ReLe1u9kn/GEexxOICiI
         VhYliDPgMwwn7UQSDrKE9APLCW0byxzuYeREtopG4YglTg73eLlCYD6izWUjX01nTA63
         MqzCaImvKTXl7X+HFjd3PQsZi3qr0XD26c9mxIgYvcezlY/UAF7yRRS86rb319ERBgP1
         Aknw==
X-Forwarded-Encrypted: i=1; AKwUvBzngIqzqtS3R601Gbz3EkJVMRsrtvs++6LNr97aVIwD9wIX4olQ2r+5xJSeV9CWRoerwgtLoCjBTg+TNIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lvYl1AIGA87zWxO/VN3tTJRcoVxZAATKZLVu9m6shni8y8inNh
	LJ9nJQXWsEDoC8ApSzdPZWjCO9n2efQPOvilrhSmI9WokA352WGw9tRdw58pxgcMF8ejJWiLPpw
	jfnVrRNCk7tW0MaV3JdKiOxfc+Y2dMW5gHjQJBMea69qOoUjvw0nmDnuuvtPTnLzZf6g=
X-Gm-Gg: AYBFou1knaCJHbdDxwb0FNT++J4l9d5973MF5EhzGLVP3Z1uhS05nMkmuQC3y9bso+3
	WBXEXZKZ21qIeJWm9lcn2pKbI5dMmnWp2QIRmRChKaoTSAnCJZVjjD4RnqDyoUEoCLRhdgzH/pW
	QG7NAEalu8iM6jeVK7yTJDE8l+sNctpTQDOrh163MOorAYd19NRlKi+3eDaz+C1KM1kQv6MpWK5
	4+I6W0cckn7khp/X6s++5fKPSGyV2myzWom+6QV+PanKgaggjYSrk04Qsdy2aTcv8Rqb0v9Y0KX
	R/VrDSPWFX84F3djmX3vdbYrbsu5OAQlC8BMNZ2YqCCRQnsWZN6iU9IqunA=
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61371025ad.40.1789888794675;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61370925ad.40.1789888794067;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:53 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:29 -0400
Subject: [PATCH v8 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-9-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7913;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HafmauqU2LZqJ+c/N9MOjGGbJlTzae0Kab799Tbq9
 U963Js7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIHNzL8L/q0t3Sb5GvWB5pc
 lid9NCp13pw9rFGgPaXNJlrjsprjNkaG/TXq919aTmKzmN8eOS0yi/uY9jk9ppLdtne6A9WslVd
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX3yiduY1OygV6
 Iy4Egxyym+2cdG7DNBDVvS+Z1OTJ/oaiOFhEeIlDtHOL5F6wMN4lBxD5dbG/aDH9NeT32Yh8C//
 ZtC6Ya2A14ND6zJy1WMyQuvJHHGBb5BnW6Dcd++Tto2L6Q15lEdNPJvzFXdZOucfhfF37RNvxKk
 byCG+WWNySM25TdjMUWninZ7yq5DpAmJ2cmLT2oijK815YjiN8DylEvm8pph9D/Dyl9moPVjal7
 W6ijHFdsubyiEVahsnrdY8WDwKXOjiFhe6ZK+58EPgRqChGcwXfhFtTmX7ok9r8fbPtlgsP9eWv
 wnUCJ+QonCbijpobWgzQjXZraD8O19lYVv3HOhsN0VSwy7VwEaLnVC5z3z1DnB5Dn+aRR//7sC1
 taMaomPqiKM57i3Kj5Kv9L1QyFbv80q1wS8nsKjCNia9u5MVrRZdv9y+F4WSLpI2jbZBY9VSEer
 WYk9nMdnv2SUwvr+56A==
X-Proofpoint-GUID: hGyvNpqoWjFuZFlEM0vS_4D0UMgTnMUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXzIhiHE9tYZ3S
 HMp7rse/wfaZt7d7oPEimkD6LBAXXZd/FI7JuqaKsg+6FIW9F0YzpRhgt34XE0194BBq+kKimeG
 ciByRW6MRbr64taY/Vq5M2PPs85Bnbk=
X-Proofpoint-ORIG-GUID: hGyvNpqoWjFuZFlEM0vS_4D0UMgTnMUu
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf891b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2dgCOJfQ_T_1aLmlT9AA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

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

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: Add Co-developed-by for Andrew Jones (Conor).
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
index ef3133a52c0ea..126d5466a6f4c 100644
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
@@ -1350,3 +1373,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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

