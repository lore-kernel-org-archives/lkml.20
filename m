Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279386;
	b=sFDkf+iF0psPQ/3PFkvc1OOmwgZCehTCpXwDSQBCKKH9ec7+w5u02GAJQHYD0aniiM6l
	 RhV0kXSH7cu+D/OGgiq/FHWEzft6sr12IrGcyOBxxgynzcRaMmdWMNpX7ux++QEp0gQMb
	 wjQJpoaOzlKjJTirnP+qBqUfqjfo79P3rvORYb27yUr4ar/niUHLGsqwD5d49grLSWLpq
	 9DeL6tSTVaC37esFoAsV2HvHcjTtUoPT/5RNY/DoL1bq8Gb/C6Ls2+QBJe3o7ysOynXQo
	 A6zcMA2U1xoeqP+uXqLqu7PSX/1BUZIttmHK/yyL0iTb7YwmckeTYvUDV4c9xoqdVUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
	b=VSCu/uMOPmUBz5n+5rBifPoJ77LwFhVGV3wKU3sfzOW6fP89tqdWzBoAB0fgeiKRQY9u
	 cmhRiHduDjvnPeYkmpBuPEcoCjRyq8IirtyZjmdc1althT4zL6G3djxTqMEAOxWlkpTH1
	 DiMB2GACEwIym6kSQCM3a7k0g23TNjEs5kdokQTN9AixVW38qd+UizfBwDiQ/qCM67Hd0
	 FpFKuFd1MTx6BeOegaF/6N60EHm5ie5ErBsTf0yjkc20h6ebzvl5paXtFV13vLlbc5Th6
	 U/7S7pMCuvec5nftXHsoD6gqsmFGm3IExPahwodoexb1/yXq+djtXBKvehIWAiLmlCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p6/kW6SS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSdWyN3Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4898A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/kW6SS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSdWyN3Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdvQt1147371
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wYJ+1mP65rm
	03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=; b=p6/kW6SSbiy4Oh0c2cki7HvH5sq
	bko1iqCXSSHyFK1WGctUvPXA9GwRNuyqo2AjDleBsX5UwQieQyxkmnhVfgrXcbeD
	/Nj21atD0YgeIy/CBwHdamQYf79wPs1CU9q+m72Q04DoWMNb/nOO+W1+7Kr1Sisx
	OUmYZ1M7ahleo6oVwF1a24UofOMhWA02jgG+jpIp1vs0pPwIJMCCGhWXZ5/gI5Fa
	VxVpU/KJD/lk79A88VyAZukV//k6DlPapvOI397X35V431xu4SDzkGouVuBsjBAx
	hdAs/s5NaMPdLidNsPj4rgoE9dVlD7wL1YJEF2NivjbCoH/f5JUYsD3a8Iw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q8k7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1637253a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279385; x=1793884185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=aSdWyN3YYJGY3JCYVfDUxAs+ypXSzGokQ1ednEuclujfpVT4caHXe+5DRsUe0LJafw
         VIJSZNOUxn5mGd4XgYjeL/maPEsSG9b9AHklFQWq4NZ3oY3gGilyP5LqjYoPlwkc+JTg
         r+fbe+tNpKdt8qaWyx1eZFj87WJPDVy+r9lMy2+4b8i0ar2AG59ziQwHkFgYsUA14elF
         OFd3fGfTKUnu+c35edojxRCZoA/pepwNYEVkjQNRLxVHZ/N83sXzZ3xeehqLoLUE4Sgv
         LWIH6mfu7RIrcop1FRWHiQcfK2hTbFORiYleYG4+d1vvccpPFAbjVXRDp3Wz074W60t4
         MJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279385; x=1793884185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=0bE5SXa6+kqCuz0gSFUnWQWxphP1PracMvsrMWgpTyo+d8sMG5+5TDmM2UqFQIL3qn
         Ke9Cg6Ihc4By4tquxtKzlEcqqYCuQ8nJ9YuJ6kfAP/SEeMYq4kdD5fNGHVYKeevF0Qfs
         mXM9WX6U3cN1x0yYPeQmWKSpEjFogsCYb9vzNl7eQOHVUjzlm2SBP1x3KrvQwY0JJRfn
         G80MPdytyR69IcZgfKUuxJ10vNgiUcEG1rtytOkj6nSbN3nsy2DzkUU+9bA1JxZsyNde
         nFWETzlSy/fIrhAqc78ERVNcVEzsQGxnidfL0so7pURJGOprTNCJg0bVK57R6b1vr4y0
         yrPA==
X-Forwarded-Encrypted: i=1; AKwUvBxPmvCftzLYK6sa7XpxN+RrP7/b052Ge6yCe1SsYsxDW/3xbdy7Fnqq2QB3qzEGLlxq3qp+Fz0GoXq0FP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg3EpUpQUvsy6/kyPS+i+kVSfJJkd4zgIhM7W0w+UF+llmvMLN
	Qi/trTVWkc3DHKL+fhrOh9u51fLS9AG5cn/XfXARYFqcqaZC1VvaaQ7eNXAoXaXOpMhNqATH0bc
	MD//Fn7MzikcwB90Ac0NvwUHht3hV0ywWOh0qY2BhGqUriqS7dl+BqS0ZLsRVsCtZiP4=
X-Gm-Gg: AYBFou34HwHgvD6H1/biA+/dZBowAFFv4ybcMAG3VxqrTNxPtm7Nnj7gfIT3w7jILEE
	rxK8lV1nqSimN7xOxCGF601EMLpjzLc+DfClW0V7yCUOpzP+WndxK1oXVU1cxaZ8hKOK/yadWOe
	r6rB7sy2InMkzTELA23CRIKBH/3lBuu9AAQZsq2Tgmwe4jGL5CLMMmmBVGhgzbNaP92FHhzEn1R
	ZmkiU0R2u6NgCemBdk4UA5nFDNyV7SsK3p5xVjNjdEmdWbESz1aPHVSsO2j43EETrrGQvkRxala
	Hqmy12c50LEWX+MJzcgDZZ2VpLXbh7wLWKBL3AUo4OeHr4oaLiugdwDKfOshsHPxc1ptlkx6Ey4
	aIG8NuwkF823BTH8hES2kaL4ukOueN9nlnWn+yO/7jSC4VWJWqHcZyflUQBPAsnAyuiAcZGurt1
	SAA/lhRhnopX+2zq2/U2LI97wCyUOKqHVjfhWecABIDYtQ+btf5Cn/2ilcIl21sJkt2ds4dh1T3
	g==
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661284a91.13.1793279384719;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661254a91.13.1793279384272;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Deepak Gupta <debug@rivosinc.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Atish Patra <atishp@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Hui Wang <hui.wang@canonical.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Sergey Matyukevich <geomatsi@gmail.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 2/4] riscv: Add detection for Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:11 +0530
Message-ID: <20261029130917.3714691-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX29rryHuxlmAG
 NBT1rBcLz6MYjezlwq9AbcbNVUFvcpjIIHhuphaDl6NuJcd5zaQkrMHy0QeanetcpLL+w+j1ulU
 X81Cf1l/T0ATP0XfZvbLwP2+vRB5HdE=
X-Proofpoint-ORIG-GUID: Tw77HB7MG4ecjqbrOTcgs4zuYuy-tbbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX9/5LxRChZmDW
 3KwwL+ontQ1k7FAxp7b8ToPw5cTodRTL28lgIE7ddSoPYp5pJrvuLLSHRvH0oYbol5WwxrjV7nr
 hTEfWZ5likKB16gDaJtAfDItEYeB8+N6bzjZga0ySuvlRnUr0NUauiJz4/5PnYcT2cEd9iyG1py
 QVie2ApSsMhd437oCQjCJMCF+NFk4zC3gA+8+DA3icW40MOJN/bqc94+ZrRC0SCPzgm0mNFs9mR
 csVkChbDd9U2Zg4nMA03DdQ0t2oVyNsSZJCFZRSg/yFbvBc4au+zcUvZV+1ygkR93VAJ+Xev7tJ
 KuZOkqiSJuRtFbjcgopAsIqtXq5xTFrOjamcEuwjmyBQgEQ0eYuW9KHRxQh1o0eKmKjy0TVKtTf
 mOvMXc7Cyb6HyIg8YEBTEZhGnQo0Q+mhlMMAxYwllVgNj5GPTivP/nRzbnXJOcSx3KvIneZ4ppY
 5DBBtfRpSq64Z8u9JTw==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae34599 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FU1YQ2pZR7vT3BSyOn4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Tw77HB7MG4ecjqbrOTcgs4zuYuy-tbbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290051

Add ISA extension detection for the RISC-V Performance Event Sampling
extensions Sspesa (Precise Event Sample Attribution) and Ssplcofi
(Precise Local Counter Overflow Interrupt).

Ssplcofi requires Sspesa, so validate that Sspesa is present before
enabling Ssplcofi.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 621f84d1898f..220d1dfab89e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -350,6 +350,18 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC		0x5d0
+#define CSR_SHPMSDATA		0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID	GENMASK(4, 0)
+#define SHPMSDATA_MODE		GENMASK(6, 5)
+#define SHPMSDATA_V		BIT(7)
+#define SHPMSDATA_METADATA_SHIFT	8
+#define SHPMSDATA_MODE_U	0
+#define SHPMSDATA_MODE_S	1
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654..030a946c73ef 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -122,6 +122,8 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_SSPESA		116
+#define RISCV_ISA_EXT_SSPLCOFI		117
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7329792978cc..46405bf2dfea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -287,6 +287,24 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_sspesa_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCOFPMF))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_ssplcofi_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSPESA))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 				    const unsigned long *isa_bitmap)
 {
@@ -631,6 +649,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(sspesa, RISCV_ISA_EXT_SSPESA, riscv_ext_sspesa_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ssplcofi, RISCV_ISA_EXT_SSPLCOFI,
+				      riscv_ext_ssplcofi_validate),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
