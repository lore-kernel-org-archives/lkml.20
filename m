Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0A45D900
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456591; cv=none; b=eOL1ZxecHVd0+XAJaHervroHWD7JtrtOO8eq6NrckAXAEpleXlKgQux6t4fzpXyUnmiM0Rs9xdROKsE08X1TolrZV/5xSwpPNJFPVsrlf5rLC5uIu+mRCql6xOQ2q7BD4TDizwooStDwTPSBeLRkNMpBpDvTCMB9EKvj/8kdAwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456591; c=relaxed/simple;
	bh=g0000I+DC3GVL5uQMPqM8ZxRlBzHUYe2tmfWKb6JLfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ns0c+R5gUdSA4OF0yF6O3osAZjjqeBKbBMm2cxU0NLW0zmN2lN9dpOBFWwyKxk4xzAI2pK69EAAPvDhotBisxGh7Btmb88acKhQCCnHskVw45G+5YawyYNZNgsF61BOali33tyfWwZWOETaspxWEtJUOGrrfNXzAtTgra5xQ+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBc6+HsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcAeAYhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBc6+HsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcAeAYhT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZOc31661451
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=; b=IBc6+HsKihcEDmd5
	ox8MGmbFbJrX8D8CBk0EN7QInqjeIzNUfqaSmKpBB0VINyiru9wAFL7JWhBWpXRp
	ptJx/fP5Zs/bCfBrIXk/pj3lhu8GJvTpqYYWtPhcjX8CQBG1ki5fXhqvVgXKnyHm
	64VhbktvYuzd4YD/7TaqJo+tmSPFjLkE5rnqOgPry4aQdlJYUVdTF2p6rRAoCsiT
	Ul0iF3vdrtSxbgsCkVEINA5AJtmcx8CQChYzaz/58/xNBzKv5Pe+rnpwAvcPmmI4
	KPMHU1QgTEpqcDSd1Jx2Io/6xb8YB0X+ykOn7302JvC7LZsHzXwX3FiujkJa6Y4b
	Lb9S7g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcg0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so593651a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456586; x=1790061386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=NcAeAYhTqwcDREz4uEsI1vmVPjwF4wZx5reS1NXGP5jBpgkxUCvXAslhiwrEo5xl97
         S/rPVOaAd7GQU/Fdjv+XQT6eU2O3VDUAoOHGdTWQ1ScfOkmT+M1xkx2FgksCwoyupC+l
         84cXH8iqNsB3aeQJ99vIb+UeFi7iDDe1ah+j9Rg9o0wC83D5a8JsV/SQn3nbGZ0KaAXl
         6cLcX81hRhkI2Cf1QuozI8uUCKNs6I+qu3HojSGwR1nbx5riyc67twMLa6vHD1sQnU6L
         HLhPzGnDDEfxzHrbThsSoFy+Qt9XFoOnP4O6zb25plTwSqWu9EFOLu8nuz1mkNAqNfLL
         0Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456586; x=1790061386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=p1juupMX404+b43LL0ziOhJQT7orpavCBJxLeVb18OQmdahmKvd3eVDVgP4DGCAo4b
         kZMsGe3N93LxZbN4XI10FpKluUTooAG1bVAcJLuz/cBv4HM2+TZdmmgRD76xcgI8QGU8
         9BJ40cfedWCQe/zKRftpE9kc4m86N8f/6knnw9YY9HlhqhEiZX1wIJoLXolNKPF10W+n
         dMtI4PUE/AV9x3a+yc2FKTDUuvF2XpDZAYOnOcaABs762uv9rJfB0Lj2wgO7fGSWSgou
         zC49O9d6ZjIeV2W/se9iGTqJ2j+mQgwXjB9hfghUlf39i9BOeuxFV2tQbLYllqExy8Iz
         7ZXQ==
X-Forwarded-Encrypted: i=1; AKwUvByapdfTWV2MSEvy8LS7Sx/DOug30ibrZ0hfvybv7MblPAEZUypYSiR4R05vADesklwKrGepWnUEeUMJegE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ1D+VPdXsVGKEckDme49CLS7Uzs8D4H6BqH+5BF3J8txAyFfg
	O3oUVrBkIEiypcfaxlguGCPToDXbsSRSFUmI2zKHvJZKbACVbEjaYdihO2grjCL4KJ6kwvoND/Q
	ZcEBXUHhF8ippRjNT1urxtfgUfgCyYcpxfy7QGuX0y3UFzyKraJlnUbyZjtH37U27d5o=
X-Gm-Gg: AYBFou0mwv/1C+aQBC9/EPiPI4tqy3u6BvINwse+VJ9PxzZ+5Tr03/mUzTmobNBjJlD
	yI872lwr7xyShaixTPzD7CmsaUe3pECkffWm97FV8tnDfxFQbPDq2VxS9iGZ2h7UNLe+re5+Y/b
	q811AXAWYc4+5XbBUnO6rptJF/dL/80oVMHsfKrP8J8ftbZHJx8wQiXLrYafbXnuUn3z+PyUbSe
	yBnH8dYIson/ayzjCoWslRraccrl4PX5VEOHGJA7tNHTNkDpO0aiqNkqiiYiCYlFSkqVyKedtjv
	OjQU8De2etXyqNUTXMQ769n686M4ykcgpxMqGn0wc2cMrmHfszZ9glfI0QF2
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722365a91.2.1789456585797;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722329a91.2.1789456585264;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:24 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:27 -0400
Subject: [PATCH v7 01/11] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-1-aa35ebd9ae96@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5564;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=79VdSxhAJWwAJ2I3+EjaPF/Oe48XuOikMy17edoXtOM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ7XlB2klL+cJM5+EIBW9PrsE1vFgba1TX7HDfO/
 P5rKp9uRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk7UWG/1mdh2ot/6ffa7pQ
 IX+wpW6q/JQHWqtefQj8kJ53pf/BzV8M/x2LuxmOXvzzt/NV7FSLvV8mqnS2fnd4++Xo1Ab/qxv
 MhBkB
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8f0ca cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: WtrQDYp0uAV5Bpcc0yumCWvaDRaj3PH8
X-Proofpoint-ORIG-GUID: WtrQDYp0uAV5Bpcc0yumCWvaDRaj3PH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX62eX9tdrZ51l
 CULGHi7epiH2RAJhuxcvCMlZwwk5whH4xomih/q8RWkQSbEotD/BiGA7anlUoU3zAuPy3yRBR9n
 ZEQBkP8W4qf7GQH0IrFBmZWrSdiRyWrekKsfk57NZGQvGt7qtUHtoO9npFi5Ohgb+ZwxaiRQP/e
 nS4keUmZ0BXpHvKLaUaXxEcKL1QOzvt83Doo9NcIVm7ou/VUwOiWyeeKPXg8OI5kF0ZP+sLLOmt
 o49BlI+Kl6nIkzLVk1wuImUAArFgev0RKXMMekh+8blK/oT5ESfLPfmmQC1SC3kpjZPXvXhKJqf
 Oq10l4uDvyloJnSsxdtPuLqjjypr9Ee+OMlT3LQCzo73DEt1R22daHgBtqgKXozvUcXKbghZpCt
 a3iARiBhYPRgpr5PXYJbyQ9R8bW8zYjBelSAfrjRC5SLjPNfhjWaf6RAk2OqPkvX8h+XEuqHD2/
 iUIr9q8BiYXm6CInTaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX8Dn2MwpP5v5W
 7EthJ2y+wAjQ6g2/0dFn6yAzJSnp2Ac0foxA6KPId4QTuZW7MSfqERmrlIG/Fhq62J2H4qIfkaa
 lZpuxWKb3xJq73eL3Ne2sPKLD4M964E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
    _BITULL() style of commit 8da45c93dfa9.
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d23..fc68dea397aae 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654b..6a693210b2519 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e6a394fbe7fce..9323feb7c3c81 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec968434561..7f615d1a175b9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -519,6 +525,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1145,6 +1152,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bd6ca7d769da7..12ea4f39a8381 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

