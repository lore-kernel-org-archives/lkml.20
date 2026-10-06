Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D72931F1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247198; cv=none; b=aR2njhnlVm2LlltXU6ycVtw05gCcNYDTPaEI2AyQB2FmBk447PF/HAA4mxcmh+tDZWjIV9WGfw7Sro1mKsi9QV62nwepC1X5Jt6keQt3k03DqYfNcXGj22pkXiEf4DBackIu4fMX9Qzu6Ssg5nBIbDECemDG3rwulXoR0g4lEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247198; c=relaxed/simple;
	bh=xfd7voO7tE36nEMwmvhnhqtwXd+9sNurmzQCmvHnQy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYz7owx8hEihDtEAM6WJPds3g5jCpvo4l8thTwHGMFkSgph5OSvFyCy7Nh9qOnKK5k9WBF1abLzYRi3VNJlHKKdSd8at6reeWMlF+VBul3aSZP30zTjcrFrXF/uqFPuTTSJM+KVfNAcxraMROxfuNALINJYoN66USPWYQuAIRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA10ErgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2Hlk+dt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA10ErgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2Hlk+dt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNRHi2955594
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 00:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=; b=ZA10ErgSLT5HyZY/
	Y/v6nBvWCR6Qu9GdffazmR+/AhVDkA7RSXUQmK8zR6MB/avSOV+MH6alNdBF07QU
	TO2MT3rprFdLcyL+t5zpwHsFWC2N0LqE72EYdcYnbREVB4h833h0/vAqaQlP4NRD
	X+PmL3+EFnrpUgd6X+M/zMmFZpQ8hT0SLmmPk1Gvnv07D5OxHfTk0r/JxER8Udf4
	OcmjtEYBl5oij8mdAs2RVf4ZWBCPJxtaF23MryLm5ivkqzXnqT7WeieyxOibraXJ
	uDeIxTeBvqev9ff+RMn1NoA16XR8oWYEq1K/n9dYbcKrY8YBTVeSVQ1+AO1Q8PpS
	YK7o9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj62gcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:39:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d84114044so9759769eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247194; x=1791851994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=X2Hlk+dtWPtqWAQsZHOH3moj0dXj53MKyuKjZIq29OYcNC6nVfBmbIGd35tZiMgF8O
         Q+tBtaS0MRG5iwP22ugnrC1x7dRsVD7hMP8aNsjAcRnq3M9NptrgP8GycFx49rhdG6Ej
         B/Qt+xjaTnQxIhv7ueL7GzaqeH24uNhQ31Zn0LRBEZbkpyHY3wmZrN+kRpPkbmTSyl96
         Y95kpFebcaLEoUpxwWJR2LyESwWaGW3XgNEXCT7zX1NVfglyx4zshmErbRNPB7Q/zfhf
         2AsQ3SgbM76Vy0aePDb8TXZjRRgXBKOJ7xbj0ItJeBMrdWMSGMiNZwzwszHO4CZINK7J
         UYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247194; x=1791851994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=DH3fzSnMMXsBbN5718U+LiBEfCoqPKogsqh3ZG3+MAcI+hRLeBT6lToNXh0s+ElMpO
         q1uhxLKNCPnJZ5y9Y3LjZE0y3F79VvR8E6Kcq+iAcljPkBbqHZyDtB8hA5QQUZqGqCBW
         x8PFj0dJwLjgQPcHYWX16R4crJqtHo7I/tZyVjFYNZB9mEETi+tmSyyqdrRpuf7T1oIG
         ATiP9tRBjsuwXJeJBKJM4RZqwUkwtwj0VJv8cLtyscvU9AHJa9SbnQYsGjCzCvcYLjqc
         nm0v8mMUSQhyt9syxz880mIQIo/jtXFhxKzWNoOQtM113lU+PQ2Ochjz617FUB1VN+rv
         rn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBygdZW/BWJwDG47G7y37sU0/nt6cgst3EdL7jgluM34dad7pb05GQHy/o6Q5cut/JXHUGvNw0ddOPcm0V0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcPl8LfVV4KeGFEt8Ztlx1X0hc9+uLvF1bx0udDRDHyj2DBxPS
	Gsx+IbQWnsLp8FH2FNJV0vGSUX98waetdrxBj6nEcrHlu3e0Qgu764uHn5NFQGE9BpH6jav/7GE
	jQ97j03sIancQyxT1llyWXrY2sm+dsyrf9D1/dLM4OY3OGC070TNmU7tbRrvhdK5UXw==
X-Gm-Gg: AYBFou0lq0loVVeJUr0lnV0qrGe8CYXs3P9HOh/RVRvvjuH6U2Kh36z14+yaxRVl8WK
	RYQma3cHKh1PzI5J71K4RZzekUB1/N0/ieJ1vw2Af9nS4gD2tF/4cVGBuYcLYUF+pI2wg2UVm42
	1ESNa19cDfXPDXbX2cxFOztZFYihagLI652aM+lNAKeTf2lAIP34MwNKb3WzCUTwJUv5Etosc1c
	Y/y7TOnFrUrf174BLAfjYa2kZdFDW71DJxRw+knbG7+NoV+fKS0KuSIKZkwwE/YsT/fFAovQyB1
	6NfsAMxht/bwiEk3InFIlyY8d6xRl4sbntvB8xoJbJnzc4isXqebdvUjBFkLStMOh82Og5buqOT
	CpbGn3PNlnAQBPAFnj1SvNGStzv+YW3P5IOVeGz3n0iAeo3LNpM/eayNewQ==
X-Received: by 2002:a05:693c:20c1:20b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3511b399f8cmr9534074eec.8.1791247194354;
        Mon, 05 Oct 2026 17:39:54 -0700 (PDT)
X-Received: by 2002:a05:693c:20c1:20b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3511b399f8cmr9534042eec.8.1791247193689;
        Mon, 05 Oct 2026 17:39:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:45 -0700
Subject: [PATCH RFC v2 1/8] tee: optee: allow RPMI transport builds on
 RISC-V
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-1-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX6B9NophTKJYM
 P4g378AgoRd8EWeWnr3Nniq2DzCKLuMHf9U/JIRcX/xtTXehg4NIJMTnLCmnkkfmiZARTlhheJ4
 OHhuOZrGrshsPXFqkz7LC1E7/E4QqfTqhcVmkqFfj6qxVRaRDN+ui6k+7EPn5EONn8Qt9Z/nT/l
 L0sU8ard+hT3Wh49ecuy3rCnjtGrjc301pQsMQCCGVGuASXt6TRAtPrsjqjQjvuhhJhGLkN7NCc
 YqhhZ1c0fu9sQoyjJbLfuLDJ+GQKtjbrT9SkT/DTxh2svRkg8xVzIc891wUcVatuJJii1zDte50
 bZsOdkTT+1fAx4ehjil9QJj/TU8DQTx86eb2DNzgXTMvoWCaV9mNcYNdBmnJYok6+AaatU3dtlk
 F3O/cYz1wsc7EzZfKA5qI4Bi/FJsdfAASbGRnpFD1kM9ihJshMcKTA2Wy6hkodf7E5eCUBKoezs
 +lotlfBkLHuxxN0C7qg==
X-Proofpoint-GUID: 3kP4RRCA0oINAOly37wR0fPgRKzp2zYV
X-Proofpoint-ORIG-GUID: 3kP4RRCA0oINAOly37wR0fPgRKzp2zYV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXxGU83cU0r82s
 oSgtBs6pi9bwqTyxRqshgNxdbq5sR3tdIlR1/Tfc2sGZr6oM6oXoeLPaib1Vays7QKdCdpSvYsw
 xRCs0heeNcPpWllyc/ZGVSvfqu2NZsY=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac4435b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FVoukCuPRgDGiLv7d_oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001

Allow the TEE subsystem and OP-TEE driver to be selected on RISC-V
systems with the RPMI TEE transport enabled. Prevent OP-TEE from being
built in when the transport is modular.

Common OP-TEE code checks the memory type when registering shared
memory. Add the RISC-V implementation so that code builds without
reaching the unsupported-architecture error. Reject mappings with
explicit non-cacheable or I/O memory types.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/Kconfig       | 3 ++-
 drivers/tee/optee/Kconfig | 3 ++-
 drivers/tee/optee/call.c  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 98c3ad083940..ad754b647a3c 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -2,7 +2,8 @@
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
-	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD || \
+		   RISCV_RPMI_TEE_TRANSPORT
 	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 891dac63cab8..cc057c76de62 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -2,10 +2,11 @@
 # OP-TEE Trusted Execution Environment Configuration
 config OPTEE
 	tristate "OP-TEE"
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || RISCV_RPMI_TEE_TRANSPORT
 	depends on MMU
 	depends on RPMB || !RPMB
 	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
+	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT
 	help
 	  This implements the OP-TEE Trusted Execution Environment (TEE)
 	  driver.
diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index e046aff61828..267513cf4ec0 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -604,6 +604,8 @@ static bool is_normal_memory(pgprot_t p)
 #elif defined(CONFIG_ARM64)
 	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL)) ||
 	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL_TAGGED));
+#elif defined(CONFIG_RISCV)
+	return !(pgprot_val(p) & _PAGE_MTMASK);
 #else
 #error "Unsupported architecture"
 #endif

-- 
2.34.1

