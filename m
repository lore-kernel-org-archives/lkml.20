Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A333ADBA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270414; cv=none; b=OH7u0jF5D42wcIJjoPoXnICaZrEnbKelBYAzro3qpu7rP5g7rbdvV3kXmfm1HX8d2ZCLHVUNA5t5I3NNIaTv1I8C8nrwJUr8PbgoqHscINVVL2uc/SnF1NrWQBcqVd98sqOBCZ6nfGu0JqsVnCyRF6CiMVUVsbHmmzhTrFR9xXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270414; c=relaxed/simple;
	bh=XhouFcGaXkX71w73O+gImeoNh9LkZ51129t0CpL4kJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm9qxAa0jqKGt1cAjgHLc3WEb43t2U57C6isB+xx+w1o5+cWwVppw/M9YO0RsxZXe6uTX6ZadLTU5mgJ8m/V1aa87VMPobpyrFkaL+9GIGxdcpQD+6k8SdoY1C5wvnLFCLyOKGs3JPJomJYa75TPt949QSwn70XyO2jMLGxRi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpJPlRuE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wd5v4XHp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TpJPlRuE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wd5v4XHp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DVnNb2829423
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1fLyC2LJrsM
	PxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=; b=TpJPlRuE09hUQt5ujRbsxtN4hHW
	aQJG3Pd3y80qZiMkth3qtVPLWthdPCJEamQkRVoBmz53Rw94Z3GXGa4u2v2c+ERz
	vtqkNV2whnUchFAb+0v8jVtTnVLg4hHR2eRtmL0Ahcg3JweOBNP8ii7Eb55/r5W/
	iLpOULYwGL0ht0M1hxlHiFV2i1phYsS1jWvgxMYn1Sf0J6JWZ2lz/o21MeDYqfB6
	kPRPRLniEtZ1izpEF0xQhIDNbAJ6LDKQA5C8DdYPQEoEor5/vNe9ydxpBmEDfp/5
	4r2foM+JY2b9PDpsSIiv+YifBlx8RD4uPpCmLtqAXgQMabMyq6qeEPw0CEw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2k6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:46:51 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so3828129eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788270410; x=1788875210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fLyC2LJrsMPxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=;
        b=Wd5v4XHpFBCOCaF5DO1NJTL1xW25hcnxcs37ds1tN3hwJz6XPoqFmfXjeYmcochsSR
         E4ddd0EMlaUvHWagdVdXLjCsgEJZKasmnCYtz6QhD91XK46/J+xxMkNYZwRfTxF9LM0z
         uoCMfqTHfWG8twhPlNpA2EqsjjhAj68I9Egcu1wF3BqZFwTe8uzB5oZBVxvBemnUgKG9
         J+Q1m4n+0L009/tUj8PmlepuNuuwB6HTCiKE4l3JqZ37Svom/Y+IN2JKv00nbXVUJZlg
         8mJdi990oTeI1xd7yTutvUq1T7vjParW6chKWcGhz//XJ/PGU58bPyD/bQPvEvgu1BoI
         Ig3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270410; x=1788875210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fLyC2LJrsMPxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=;
        b=QS5TUMXOjDRh86lcoBkRbK+4MM/Xn7Q01e2piWgGl97AW5lnz7apa8gxtFye9VYAZ8
         7HcJI0aE//suUoSJU04/0g3vwv0Jh8VG81FiJB0WVpqEY9DTKCde6GV9VqONld8yi/um
         9F/nQiSOzT3N37IYDnixaBEDN7tFVB4McBz0K6+d7bEqhrVq+n7vKUpoAKQKrMXxAfUr
         W7EDCEnPn6OAoYfzXf31n6FVwGGbrBymr0JUhkPq5RlEcVzEqFNP71/16fTOb4C3/EG+
         BWbIyxr0Bsl1Jk1DAVHD3Ljzt4aZ61XTcQ4shXErf9C7qWYfynjZqfSfhBovXXjn73o6
         mvSA==
X-Gm-Message-State: AFuF++l3sKhviFZvRgjkSKTA+gwToaGxYbeyRQuKFBX8uQ0L82jLeKYt
	r01L4knnl2K12P+WXrGFPk5zfXbp+UHkE9q4C9/jTWQxe1FqCk85jShRbpSK/xdCdHKT6YJNP/t
	kYxpodbmi24+KPFAQ27OY4P2Egiu8eZdTIWnOXQB3lQ23oWp5BaeZIDdM9tjZx/hg49WbkWScpy
	s=
X-Gm-Gg: AR+sD109BM9VmGljXa4KAHt8u4EWRDW89WfPBn+FJsf/AHmBj1zugoXsImphcyC3r1w
	S4PyKWPnU9oq8MJlSnY+cxBg8oWj+Bc/fAYu6REKvKuVLgo06aqWyD/qeXhJgdjP+EBUORGOh5W
	AqAx9c29SQSexz3LOgn4RCE1CVeyCVcztANZ4VChmuuQbvK1lb7zF4bMVEPEGWEsGKNZHSQP2eL
	2E3KXSOkHDkIl7Uu7JPvgEUf8C4kMDofSW1hheX+yhIgAaL/GXOJsd9p2w529u5moIFvnuyaLGJ
	PXt8cvnxYWTpqvPaJELO/S6649gilxq8LSIJ6xqDYxOgLdB+g7zUM2OiX21SwTPWuubdTSKNJ/U
	O42p0lXonyx0HAYLquJzc0usAtEy0LqFGZSc=
X-Received: by 2002:a05:6820:824:b0:6b3:52da:b343 with SMTP id 006d021491bc7-6b372f3a534mr6435436eaf.28.1788270410349;
        Tue, 01 Sep 2026 06:46:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:69a:4764 with SMTP id af79cd13be357-93948132492mr956841785a.39.1788269920915;
        Tue, 01 Sep 2026 06:38:40 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2901sm582378466b.33.2026.09.01.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:38:40 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
Date: Tue,  1 Sep 2026 15:38:34 +0200
Message-ID: <20260901133835.345001-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96d74b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rNTwnVtw_qv2rMTDxuYA:9
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfX//qeXO78i15H
 qjjtNUQyLviU1nt3ET26+tAcPYz+KbolDftqTwiq4p7GVU5FEl6nQKGPICuxXww3ng5IebpjpAH
 nRANUQocBsqOEkcsthCTE0L7tRofHET7lAqua2QWPjSZErGV+p+OG6phK0x60wQ/9eJn6GKxinz
 pY5vXxy4SJz+5iwx1qb/wQF6Zv0op8vuYevEKUvycH2xFmyNsIrW6ObXsqNr4LEiaQ1Kx12aH7/
 O3wIet0OtzV/VJ452A1tjiwFjrEml0uh6Tq2Z8ZW2s6LqN9uchf/DZkipjTY+0yFt4nGPNmXaz4
 79Ve8kbX2F+tNFcNvboDZdu6+Bbl+1gBl5F2nvBep/UNVXI+1grcAhV2YdbWXfMjdQMgP0te0yK
 5/GByAZqnpz4Scrcs9zre5DjA7gARQ4yjzd+F79A0m5wa2965PQLRzS0uoPu8EOEdvme3a0akc4
 lbmgwXi4IUKAEeui4Yg==
X-Proofpoint-GUID: hBH33MulRO-8asenVKTfxxA2oeE2CSqQ
X-Proofpoint-ORIG-GUID: hBH33MulRO-8asenVKTfxxA2oeE2CSqQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfXz4bclyev9trA
 KZ1EJNWysjMxByiv/EDZBXNhW9KiRTWYxZgN0L2BYUXeb7mFTSaWohXaVGonFJSKbyC9uQMC4bc
 /S3TVDlZqZuPxvYAGW002VfFuZ468yM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010122

A Sashiko review raised the following questions:

> +		if (!local->msi_va) {
> +			kfree(smode_msi_pa);
> +			return -ENODEV;
>
> Does this strict requirement introduce a regression on systems with partial
> IMSIC coverage?
>
> By returning -ENODEV here if any possible CPU lacks an IMSIC mapping, the
> error bubbles up to imsic_setup_state() and fatally tears down the entire
> driver. Previously, imsic_setup_state() allowed partial coverage as long as
> at least one CPU handler was found.

Partial IMSIC coverage is not functionally supported. The IPI and MSI
paths can select any online CPU and unconditionally use that CPU's
local->msi_va or local->msi_pa, so every possible CPU must have an
initialized IMSIC page. Returning -ENODEV during setup therefore
validates this invariant earlier.

>
> +		smode_msi_pa[cpu] = local->msi_pa;
>
> Could this assignment cause an out-of-bounds write on systems where the CPU
> mask is sparse?
>
> The smode_msi_pa array is allocated using num_possible_cpus() (the count of
> possible CPUs) but is indexed here by the logical CPU ID. If the CPU mask has
> gaps (for example, if logical CPUs 0 and 2 are present), num_possible_cpus()
> would evaluate to 2, but this loop would attempt to write to index 2,
> overflowing the bounds of the array. Would allocating based on nr_cpu_ids
> prevent this issue?

For RISC-V, num_possible_cpus() == nr_cpu_ids because RISC-V assigns
logical CPU IDs sequentially during both DT and ACPI discovery and
populates the possible mask from those contiguous mappings.

Thanks,
drew
