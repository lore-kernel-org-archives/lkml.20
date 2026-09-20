Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC93DA5C3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888814; cv=none; b=YrsB3xSG84xsz2AgmZ/OlVHTx9aNqu9OclZyo5xYtIJXNlJRPJNeLg+tBxPAI7mF2f8P6dBEtN7S9saAYQKriyjiYRJ4fwBhMnquOfKPyl6Voo66StpCssloVD8cDLopEBWOostmR06b+kwMTVAC7/CjNO3JTgN2E0JNTrb9jWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888814; c=relaxed/simple;
	bh=YgS/IB4s8WPaIOMiZ6JH29qlGPXEFMhKzue+pmpKLGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkOf8mcaqBWqSLh+ITp6BLtu7+Pl++fm09jTa0pCEtQXIlb2JMxidATR8b4f8VtniW8rCIoS/9kLDH15VJtfELH2mmZoOxsHuLa9IXBMbldPpMrKA38qDlh9cdXwOA4MW4m59fU3mAFTdx5GEzRPKwP8GwvhBxeEC7JgjVJK1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrWy3Jbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdLhvTqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrWy3Jbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdLhvTqm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K5mUsQ1696702
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=; b=QrWy3Jbxa/9A9xki
	0xtBBUiAf6w1VFoyAQVQZFTg9AgaKDYZ6MkMaieHlPUVSvmbTct1oLK09R385Or4
	jGLNR070jFWIVQWBojRKsLTaSC8MfpPPqLv7BB04SlKtGylLWCdvrXbfEI4gqCg0
	E4iwc2SppLmWuLcPypBmIg4TpSprjr6rf1qzORywuoGNlIg+pG8vOLAR2J68Isqc
	ZUkVl3sjbnJ+TIaQ7K+Q6uyx367+lPS/OH/s2/A+Pf+AbT2CB5fGrnSFwOFMAEHG
	esWIA3vN6P4uKYS2BFLw5bI2CVZoI3/X7AI+O/bKnLczk2CtNlXp0cOgMGhusHse
	syj1cA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:20:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so24066855ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888811; x=1790493611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=BdLhvTqmNl0eQwgVyVvoinT6v5KWwR01X8FBV2ASzrFDZFSY0FErxPVB7CH9rafst8
         /EqBPUVTs09nHVfXD8CzwCFfN0kTiPP6hcpTgXXxWwl8EQl37fWo190Xm5bA0KUGw3v1
         KGSVg5bFRNDre6pXTWRcdrtLoFUG4plY9cFelpIX7/1TpNE3bTmeNf4CooYeGBuJESWS
         j6zT/Rru6xVYvD/QfyE/pTP4SyqMBt9Vj0v8V6e7VJRKDDYJIyYrE6j6rAWvJgT+iCQA
         qCoCTyUon5npKzH0uyeA7cOYwXUVzASXYPWiXnrcZB861KQLUIho0me3lbhmrP2WAIFV
         lbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888811; x=1790493611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=o54zExIoS6LltMmXx5cZQMBZ7uBBf44ct3FYS2JhboL6x7PFZ3HC+kRZ9erSZRsG4Y
         UIxYRpf0/qYYy1vDjdOA7EwejGwhyBe6lTKNWfBygQqDS9tj2PTzH/sNwsWBxt4CjN2s
         5mBbNUbsFsXoYm0MjGz7TI6PPE9NcV0I8+9CljE0Vh6fbwunh0ODl5KkDtZJ5FhuNDn+
         aHgca7trAjnS9hxdeI6XqVsgNgmU38r9+TuHzQ6W7hwd6tVuMh2dDDmqRCJvW/HdBSii
         4lp/KlyZFDOUpSbMOHqGVF4rJ7jUzPnNtWPglDrHKdSBPXZaWz2l3xnqbZkWP6eXLbxe
         uOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzttYL1ACkeF/5t0vW3vLOT47leK1fFVZ7zOpCvpY91IUKMfugTngP469QxztFh5dOJTcVkw9KjZQTU+Os=@vger.kernel.org
X-Gm-Message-State: AFuF++mMkQSkh+hm3q3Ev7/ghSepr0psl29VzV34PagdiShilqNLu7Vo
	D3nbAtGwO0vLOf+ccI4VM5aL7aP/CvKlLgOXF24gehE1zoCwBmT0vxYy3KoM1Eut7MkuK4Iz6v0
	ibUYWeqIBuqobO3fQadlzcZ4qQiRfeBuoorOK82UqQ441k5xG9+GKooJ8N0pAMvSxmCY=
X-Gm-Gg: AYBFou2/54/O8CypThALXFG5x7yqzYKHFrRHQd/FEl7igEL0QXFA20Joax7oz6AAmrO
	wfr9zpj21LpFWGsxpnue9iv8vqjnB/iXUuVrRy73duGKHAU2XeBtxGanCP2hIZ+ndCiZ1pYgBzN
	p9nAaT31BeMG0sXCIiwucf4LvdEXRlJ7xhYGIwSJy2lynvMWwQBVnvw2snj2Qu6CqetvLBKP5El
	jyIKZnZpcyvCur1q8eNMSLWwAp1yFg9ixS8Dyo7z+55bjhq28hNuTHZn1oaSzW/f0gSZ8A2osWd
	L2CkXHAZOle4av9cSBiyPlr8rRv6JOeX2GswwnajVdJlL48SDB2jAdnLNHE=
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039545ad.39.1789888811045;
        Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039295ad.39.1789888810468;
        Sun, 20 Sep 2026 00:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:09 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:31 -0400
Subject: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YgS/IB4s8WPaIOMiZ6JH29qlGPXEFMhKzue+pmpKLGc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1Hacz970yXrFEP7L8taGpf8LFybPPm9XXZ+lYu5/OV
 50hqfmvo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACay+QojwxZex7L/k6u7WXpq
 3u9ROaKy+f+009EZ30737pmuvejg436G/1mq58UvJL1MiZqk/F7spLXDpnwNvhkfKv35/6ke2l7
 kxwYA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: O-X4Ub-zpkaYyYeCU5goau0tGxloEokH
X-Proofpoint-GUID: O-X4Ub-zpkaYyYeCU5goau0tGxloEokH
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf892b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=npia3EAcFH_frxJIFygA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX9dcpmhqJSymZ
 +a94ZcS/M5L5FmhvyDiBltLF8Qa9R8yT/XzsCBkWM4izv0ypsPNwVV8EV42l7fngM5iVAVU7doM
 0TN4SHirK71/QZEKinMfu7DwDswCsg+WilJJ1tOHIysOTOrBLCP2J9eemUu3p94lrfWMy9fEwJq
 /dm26nuTDQc9LKbolM73U7PAZe84zVsXTygd3meS2KVfVZl9z+1+4DpgZGsUlVdov3MefRzpfDV
 BBGQcyX6g3UfiNveuGxZBWwvM9plEAcbmmOiEknIZU1CqwcO2+5tN49Kp2tAoAyhv+cJrBsa6Zm
 vyPh+/upKV1C6oEdWjrVHuMLph3aM7p9ER32PoVFWpq3o0p+fFC0zG23fXi1TUtNeSL+HRmj4Mu
 lchsmr0cgUusuQxOF2k93cv6bH5RCHCRRvtl32ndz25wi1y5pWZXjG+Mtyh+y2cuwnG+YsRfkzB
 wQmWTyYC6HHNmHJXYpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXzM2NGHftrs/a
 pauZLYrm2wkyby8nsvtmcYtjI1am98+3GhB79F/qecODHniWXjFtjS3/t1H5de2Bp0UmXbuEpGZ
 qCrkt4YuZ6iKpZYS7hqQg1dnD17l2Po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

The IMA bit is now derived from the same cached bases instead of being
hardcoded, so it agrees with AT_HWCAP and the "isa bases" cpuinfo lines;
on any system this kernel can run on it stays set.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
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
 arch/riscv/kernel/sys_hwprobe.c                    | 22 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..0392a8f41d86d 100644
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
index 8a38a4d37806f..2290126792797 100644
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
@@ -307,14 +318,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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

