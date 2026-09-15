Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FF45C6F8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456672; cv=none; b=FKt7ExxN9RzK7NiYhRK+CmgtB/+zVmrLseng2rklek3XOAyALmr7WB9pJd8sK6TSFdKCvERc/ZVL1vjZSd5eelbJ5/XsyuqO0xKcIc7ehiCRLS6RMpt0K56G02iOgt7efp5iIj3OADGb+sAMF1SDX5pwvrqyeXNNuJFWYwZuKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456672; c=relaxed/simple;
	bh=hAXGf3fwKFEiB3f4/YXlhsIaiotd9AUAeVeNMwuOMCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNWkPC+n1AEQodMIL7gmsvVK2l37QZUdSNcBq4rWhhVfAYeNUR5LbHN0WCjF3rQrye5t9uFxi55BfWWPF/FyIc6cdaxuaEM1fgUndzkxDT0tceUvb+SUH8GTt0gMrRFyUJK76o1hMVhoRbPPdKSnXVNkEd2ARMemfMaqTTq6S9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIhqtdmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOUpZoXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIhqtdmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOUpZoXE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zf2B3126464
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=; b=UIhqtdmhYfZGZQJA
	FBERNDICmZ+DiCoaE9/9Ba+de1bRnGJNuXWg2e80AqWSEGjWYed7uG00K43AAi3c
	f5VZ9xpVDpLt6q4bBxqCA6b6mM2rKD/rC3SY4qVqqoHU6AuSraDcAVinEykwFpSH
	PsUdmTwe+dW/tGfuInRYMtebxkJCy6ErmQwc1yX1lQlFtkOuZmwlJR1BJecyv75l
	TMAYbg2dmQP39DS9KpeeNgIGHoTlgEF05UC1HAmh1gmvio/PLtODyk95lK++O9XJ
	P5K9yzTaDX8zvpgkfGQBT4QdNNiHmBHXybD9Yx37U21U2R4yN2V+MRXZi6A/JNjo
	imPlwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u23t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3048384a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456669; x=1790061469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=SOUpZoXE8K2LQQD8p1g91cqWygvVYsUIjbfdWP3cSnfTe4jvZ7sl1Er3b1rRukg6X0
         FxTHvMUzp3cogkOE8YMU1RmyHeR1SlI6GbGF5HuIgmg+yPFTWxs65+ORaSCRdURpSkzk
         /KXCEBT5nfnYQZNzxQXSzKNOGLCM98yZB9BvIOog17Hn6uiSbP0al2BSi/0JctAYLPMB
         WQqB4NkgwTied71qiFEeLE1psh9bYzx3ygaqTRPE6GC87d8qOVgikO9vdNE45IDCeH/O
         vyrSHt1sGesAqcg/62oXsrj6/dA+otNZiEh9tIFOO1TBb2GClbiRd2R502K8Oy3xlLvG
         mACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456669; x=1790061469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=P0aR6bYyjEXr6VJ1zmRrSJNjoXP1F6tYn5ayZgdHBHuPWkNwp4ACMHFEhHtKDth3vc
         1BsKO6kziiUvlNUufXSuuqZcuIlNrzTTwGzhx+v/E2odbd0mSn0MUz50pJNBghNuOkOY
         zOOtRtuctlyGaIfyPndGDfizTtYehHjDs+2oE1xgGrzYA+/ZuOQdOqTfJkEemGcRTQ+G
         nz4tnr6OFI0IqJxn+4o0KSkaCpQPHttSKhBpw57bpsnVY3ib6eh2l78l+cMg8MY6hLmu
         Xq3WMaR1lNUsQMq08tocivNNIU6Jkr3S2nYW68bXGgwQc+lmuVEC2h5Cl6eUYneWR4C+
         UiyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOzb0G1dcOlrectPofed6AP2cptQWmJ8YLSwneZzkHYBJcGfEBXX+VulF+ft7tUxJFna+lZZKCrZe0fBk=@vger.kernel.org
X-Gm-Message-State: AFuF++kOfLUnZE8wgivpA258fhHMlF5fPL0GgI4oeSA01G643DaW4G09
	4aCpliqGqZhhMvqqqaRDFfr9kBsbGqwhKVGB5HObAFC69miBxX4FoKnI6pXhx1eHNQO3wQT9vZD
	MSVqqBC4+b/aGBalPYqIEywvXCBQlKEhUj3MnyPZcYyeK1S0qQh9r6kpnPCxfxYmStXg=
X-Gm-Gg: AYBFou3LOOWFAnlOT/6mGa18A2A57PYaxzSuf4pqME4I6jxiHkFk3a0N7g2kqEej7Jn
	hDeNK6pIX64MVXMKhTcn7jUbbzcMC2UeNVgMCLj/hSKWaYEHEb+dbqmp5gevVp2XCvIpi0Gd7wg
	qWVuhEOSxMezsUzMAn4FTdXgo4rtN3FcnD7+8j1BWeQCvrJ9zD7OJLEG4TP/iUauDY2W+OEKcoQ
	ze5nmmcw5RjUbikc9j7KphGF92XK0C4J7mrA31kQODBOvBfuR8ETfKE47jDxLaUezfUMcdijI7q
	SEdCuomCPeAFgE9r2rn/aebkCIzIApQFwYhN+WGXI230lmFlunE7C2UgffTm
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277489a91.16.1789456668470;
        Tue, 15 Sep 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277428a91.16.1789456667863;
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:37 -0400
Subject: [PATCH v7 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-11-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5107;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=hAXGf3fwKFEiB3f4/YXlhsIaiotd9AUAeVeNMwuOMCQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7YpVSuJte9Zvqye67H+4vxXO2sv8DXe11vvPKvAz
 K5jldmljlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjI9yBGhifdP94cOHHwtdIF
 NvV1l00OBU1YXDvX8duRD6KLxEN1krgZGR7811SWUZ3wqXElB7PmRZ5JE2Yy20bnNv1eNPOccrF
 8GBMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f11d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+LR6rwq6IoYe
 6A9+otnGb+5KKFr0HOFud2Q/kr0f6SqXbJKrUZEri86q0RAXbIBTRDVzbMXQNTiUuxleAQWFyB1
 XtLu12DFI/7pj+HamBa1wNFgmTrpKhWINyX0bd0PBsYQ0qylt0rDrDa28w6Fao2XGH5zfqYLHOf
 NnlTfzxbYm6HYdvyPBTxPK7b1TyjbjYfV7XufjvLA0f4j4MJpazHv7gJ9RcrHl2W1bW8aZHokXU
 XuZCqwSX7Mnzarm//P5a+R8mS378T2y2ZM/AdPLUZGG90WSw24lqVKzY4B0iNwWLtEafeTsl869
 7yZPKH8aOwNXp9md7QUllgv3sr+ZZHgFWgVO4HAvZVE2HQ+yoKdri/3rIsGE9DnGXOWqFEz7vAJ
 7FFxK4PC+v2f5CQfQ/pHEgfc3NArvdSRoP84nxyW4vEkmV5LiUN4MRrQdiDG/X38MZhKU+MB0SP
 hQFpKRxV558RJk34/mQ==
X-Proofpoint-GUID: SHF8Oms7iOLWAKtdO8LRJ1MzrL7Pw-xg
X-Proofpoint-ORIG-GUID: SHF8Oms7iOLWAKtdO8LRJ1MzrL7Pw-xg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX8JKcXDQHFZEH
 VtMuac51aGP9YAtkfGetWbTKeeN+GBC7/GjH+UiTJ/u8bANn8HeTiUQoYdybXZVHuEO33H5sTnN
 d7YXbtSxtKCIpTkrQh8arWnPAMSfZsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac489..51a85e61088bf 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

