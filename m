Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279394;
	b=LXuD+RaGAZ4WRIEzSgMK6FgF4AH2/IXeQQzx0wMkKFrLHAgH6+mGe8AXTEUcVMzChJ/D
	 kym+olGk2LJfruezucNJzkrJbFJrTZR/7p4BdjOW2eGEC8xXKcEMBPxMaa4Tzn2hXyiQK
	 N/1mp1qBvmirk7UKVxOA9nPuKqo0zyqP16yZ6Gi3q7YoSh7VHPSxgfCWTz/qHTisYXypJ
	 8KS05gaLiYPUy8UVqnKkbsOW3jANePByYKdC1HYx3dClccSgAuqbKShCY7/sYLjM/OnE9
	 ucCk/gmCvlhNi4E/m+WXWV8JXDh67d8UOsVVt3Xmap7e+DZMu1D7z1hSco3WjHUbWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
	b=0CbvChmDPKdxH6n97wt45WZ1pBIjgOhpm2c5aU07V39vFDfIxCPmNYIhOfGHKZ23mMqJ
	 GpNQlfZUttGDBEQ9IlUnolqxaaqX+rMUIPL50LAYKYQibZ2VZM4nIE1LLI3U89xQ/rVSt
	 4KXeP7KkR+S5EaAxrq2ANrZkRGKXAmgnDpu/dMJMdtfNmDLa+T82dZ/8/KMXLM8phIRz9
	 e3DxGntWCaUyQyI70enDdMI4Bz3KfOcTFwYOHZzcg1PtDP9dOAqgEpPPmTQZai/bVjT+7
	 vugolWWXF3D4KUvGKihQD5IVSmzd0VjjBGlcLYoKkyuoo0WhAo8Q+wJnMFvGZ8F2v9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBmpacEv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUTwrDlG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223F606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4223F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBmpacEv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUTwrDlG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe4pZ061093
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n+Lh6rrQmbo
	J2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=; b=FBmpacEvz7WWL70DvADHpRxoXt0
	zU6RXP/3YrHk4NgguGOt+CIQaQPonZl9O2E7UDS8xva+EouG3/FwtumYWdThK+Dv
	sCyb7P35FGhJ+eXCwK6cb6m0l9qIOnjFOL6Fpcar0JRlaMf/vKGu/e2HuTUbuf8x
	Tr92J9fojzDi0O9IxKj/p8TDwsfMyFPfcxrNghQC6HI3VzD/GeRMhQoskQqs0usy
	HstpnvkobixH34s/cxoO8ph2m5H3MvmC8ljcXyWcHoyqNzf2RDT2aVuh5vopqvI/
	JRG0hmwTj0369/of4djdlJOkEyFaKUzkZxgkAKQaRVa4ubTZdYA/MwVVkXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpup5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so522842a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279391; x=1793884191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=QUTwrDlG3GLsfYqtNNiQVIUP2/pdJxAu7qGbaVZBO0anfa9O5Gzr/OD+4gvgivuF/S
         ZElztH+uwxQnH4unfHa7sucpARKn2+6WSYVa+i8Mj7lU/k5G33cYl89s7x75M4qcuwVO
         gjYZsds68kV7Yg4IEYyAwFVyXmLBBGhZsOhgXT2OERQEI9jE9Y7JIKpkG0rV7HQG4x2h
         Slgve200pCtjsr9iMX6yHNsZKILqKTIj+G65/t4X5JYVfrHpZaeZA9S4DcToiAKV4Y35
         Cry/Fk/PsrrDmA74DPLSih6xkPRZp9ieRO0gYtg56Rm25t6KH50DflUmDjaT6ilNEmsh
         iQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279391; x=1793884191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=uEs362MIeDim0sXTKHYRTKm83poochqpkHeGIydtZFxIl6O/ZR1a5pDhRqa1Np97GW
         LswH829F2677X/2us5AAFbjpzj3oyQZY7QIpVvq3nNvUGCQnqt+6tAP+9WZAlW2S/5iL
         t3GGj8hFnz7I/0MecvXGK6LVSlG83jlU62DSSv6f+Z8V4HRK+xSBRD0Jdl6tlG/UXwR2
         nP6n0lb4jfxq4x+IDQSdWDqEs4rL622D3c29MJ4F+YheCFgF75hiGS9vavovEaphkL+B
         sobAydiHk1qiYUUc7LJh5NFurZaIqKxY6EMOfkKWxmlD6LJFNr5qg22sloGbjL4T5B2v
         xmAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyKJXRDKATG1UABLw3lA4/YoVUqEq4VAXmqmT7C1Q7ljLIBqoPbLVFlpa5cj8y9/jAkmPrpi4wlAvvUiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF/bkTgKLdFm3VKj15NLkg8ZPJ+FLATgWmjdgcHd0Oj5VsHuB3
	eIinp3jTFhUY72nhnlIt0MjPZAHmikp+4BPdSsdimS1Of6qM+cAKZsfzHyZ6aOtdUucbaqIitoo
	BQGFPWg/3O8VHHgdxq0uB3hFP4PxT2nDYfTwoxzh0Ir8h44DiXjPY+b02GSAk1npffZU=
X-Gm-Gg: AYBFou353zdJ20uewjwlKZmYIvS+MjUZc7yTlU65waz8xhK/CLgSEF2bVl95pqIoFMh
	SvBMtU8wBfJTvf+1Fq0cm2nEohRAKVaY9LXiMUnEn0cbEft+rbVNvg2PccOsu+e4tzbeCfKohOK
	gssWUWaacuR9nn4mlSn6gSUKk5/a5W2/i+cprCOdLeSbAZvlrBzoccCLUbyBS3GSreSgaP/D8PM
	GeW7s+ohfFO31jFLk3xbyIUwmeNgDWtsEZPWYTD6Lg1Jii8lOj1JpcoYevHYL4D6z2tW8tlqf6N
	lpAYAdjHkD1APCKmwTdUM7m+whGzyWTVGoULmIHgWStzZ+9T54KERy2aRUKRmcy2Pt+yx/cWqeV
	Hb6zCfWm8d+cCVZXxa3wO7SKoCqdxbZn0si//1DUArRWGTaIY+9afM+IcMCEmTGbhINKTX0dAKW
	3KMY6M3PMY4B+xGKWOy7d28jJREXPXHyfmeqR5AzC8hkIHYldsEhwfBGBjuqBwBWEFDacziJwVg
	g==
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148816a91.48.1793279391104;
        Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148793a91.48.1793279390665;
        Thu, 29 Oct 2026 06:09:50 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:49 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 3/4] riscv: Add perf_arch_misc_flags callback
Date: Thu, 29 Oct 2026 18:39:12 +0530
Message-ID: <20261029130917.3714691-4-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX+aLRMWptKAa+
 GhDDPjpVULGGGjPRw1e6HB9lKS7IkDsZXcAzypIFiZF6AibAR8rc5HJ5FCIMuDA62D2TCeeN4wd
 C/Z1EDFvSxDI4qqf3QQHhrZGlOJcEvS4l2IX0VLgrMxf7x+FFNrf18lBniZEV4i2Eg+dgDkedMT
 Cmfczs6VTBvY9jzCXSJPuSdiCvELaVTRNx3Aem1D0Ct0PQDkaPAe388nnDftxk+DAd3T/YqSuwZ
 ZQd96DBBcITycl2e8kz+tQgHhsq1hlznXjhiONe3EbpupbYKW3hdzFxdYIcXqfeo7mjkR0jrGi4
 se1HQagzhOjLACeTarGPqxh2jz2UpwJvkiCei6LXYvuE4THGjhz0PhVTTtkW/hJINBJKo8zkzot
 Z461IBl1h4y73of/tH2lQUPZUNvgmlTl/Oa1tDtAhoTWNrbmJxKTR2JhXUu3p1b2jhR9KShRG9q
 dopHp6ADGTTIHUvZzMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX46bUVQeg0Fg2
 JESPpnJxl0f/rpq9p/OFRB/qAtVPpSrLYEw24S47cBGZggWgoX5L7cbRBHWt8/tLyGD6DUmzxG9
 FykzumrHq2SKaAKTljwYrFRQkpUI/R8=
X-Proofpoint-ORIG-GUID: 7OqBGiJrqRCAvdAAlZUDv6i7_LfddkbG
X-Proofpoint-GUID: 7OqBGiJrqRCAvdAAlZUDv6i7_LfddkbG
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae345a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IJwDnuRGQWnalj_uV-oA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290051

Similar to X86, add perf_arch_misc_flags callback so that
PERF_RECORD_MISC flags may be set based on the regs provided by the
SBI PMU perf driver.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..cf13702b185f 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -9,6 +9,14 @@
 #define _ASM_RISCV_PERF_EVENT_H
 
 #ifdef CONFIG_PERF_EVENTS
+/* Use sstatus bit 2 to convey whether an epc in the sample is precise or not */
+#define PERF_SR_PRECISE	_AC(0x00000004, UL)
+
+struct pt_regs;
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
+
 #include <linux/perf_event.h>
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..9b68d21b3a51 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -6,6 +6,21 @@
 
 #include <asm/stacktrace.h>
 
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+{
+	unsigned long misc;
+
+	if (user_mode(regs))
+		misc = PERF_RECORD_MISC_USER;
+	else
+		misc = PERF_RECORD_MISC_KERNEL;
+
+	if (regs->status & PERF_SR_PRECISE)
+		misc |= PERF_RECORD_MISC_EXACT_IP;
+
+	return misc;
+}
+
 static bool fill_callchain(void *entry, unsigned long pc)
 {
 	return perf_callchain_store(entry, pc) == 0;
