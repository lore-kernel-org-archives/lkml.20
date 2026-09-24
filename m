Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56440D587
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235474; cv=none; b=utPgBlcd/+LWTGLtuy5PBGDJ+364KoeVFnP4RfOA5MxEBTkMJVFGD6G7ZquNSmiNZHq9umtyLGuKZUBDSQhqdMB3qZb2f36aY8dfRV4SwQsRTGfPsHvcwG+X73zILVaisXyH9uJR1yTVYs29nOGuXr6eK1iSSQioSktWEiVr9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235474; c=relaxed/simple;
	bh=yPs54dR1sQ34iP9KP9L79uS4Msk6zBOQyyBaMkNA7CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uXx5wZESZd2uvgq1cfyUvRTysXAIQFxibzVLvCnPIvtkIbsME+33zsyiEMtslWhufMm+KBHXAopE2pHh3lvJSeBvQHwZ0FNEKj1N8meBK7iRVVYmAnODltD7itjT7mirPHNk6oaDMSafBHsh3t9YG20oYn6x2uZFkJ5UOV10+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUwXmaQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy0ih52Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUwXmaQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy0ih52Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBia4147328
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=; b=nUwXmaQA9SMdg14Q
	CXyYKtbH9a8HcwYYPNRPLL6vT2m1D8krKkkSA4YBkS2eP0MV8JkK9O5m11/XUA89
	tLX88fNfcSsuulD+yOq4DqZJWoqcNrCA7VDBIYFoHXNMIi9bpEHMYRvs/nQ5ulqh
	/IuKUrkYPPbOxBzCj05KTR/PGz/xFO14YZBpeT9dBWEbUj9IhD0d0IYfG6Gkxeg0
	HrtSVptcKdJM1q4ISr5ViAY/oscqbogbcyKNX3hqV7t1H8DOuYjlggAMVIxhsDsy
	xyk3BmtvLVUFZKDxRwGgD3K1/c1PJdIxfXQzbPXlq/G1J1+1fke6GR0E5kr5O4Jc
	CXltPA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3w3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so2472019eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235471; x=1790840271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=;
        b=Xy0ih52QBhWb3maK30AVUCxmw+rFBFFjb7Ly99GogA/4wmKB6AWjPd6UdJuLsdMiGv
         V13Jk2fkiRU1V7T0rizVEhs2Ie3sSW+Gg6HQT+8dtY/6UK10ClX2oPP109dcvALgIL8j
         7RvKu6O/DYe+ulyVJ7POA+IepIce7DpNOTBjHaK/K8we4btgX/iJMi1ytb/W2DjXJdZz
         AfEtkK8jdftlkLtMDfu+Q3lPMLm3zgY9VUd0HYyOl0r2J+ZUs71r9GHA/85NUyWxOLf4
         kj49FVBMHLxQzaKW9qRjQxIKoJAkMDZehoICGYuLRCtmVGeTDA1emh3RGFi3UqO3PmKd
         IFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235471; x=1790840271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=;
        b=TA0IjBk20KRWsIKoaVZpm6ZgTgEoujNTSFpRKtYEeicxh2cgX+88uS2eSwz4Ewp9UL
         YMqBGdYLx59q4LHlt9kM6mIVAOVTssTq9ddC2bKc0GYeFo5tUyTx/mBPoqpYkxrfSoBi
         Ki0IPQDiyDqh2I6d1fPT9YeD+e9a2pIRxPf6XgJ40Vlp/qBLUN+1U2HKpRr8L9IfcYKN
         KsFdExW54qRAB1Re2il1szQQuWa4cXZwx81oLO1lpiiyyYj1CK2orQb7XVf1xpEPN/5G
         9Hg1L9Uai9aU2A2vFOTdsPfzmWZqcaLAg+IFM7YDCyTywXGoxKdwQkDTHKsb7k21Xthi
         tY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyhy0KYV/g0i5yLBpclUTsjNshfWd7nWOyGi83Zu+JsyMshTTrTbWK+wpVr4meuiA1pzkfBh8zhJRGu0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++keXkId/Igf6DaSj3ScGvlTMmQFRY6a/GfIxgCa2eHop7k2fmm5
	41Bbm1O0vc6FH9kpEOqGWSHq4ASXcSBxuana0Zdv70ESBBC1bRzhdpo18YVf7XiLSvN8y1ETZtR
	PYKDAPyv6N3T+L2KWsXCYvkINwz8T3YoDGM4ZYXg3imiBp/m5lDnfTP+nY6PWyDTw1lU=
X-Gm-Gg: AYBFou1YOtlXI1LL/tBOezCo5efCZbHk+6e4mlD11COduJxDiUa5+sbTAV/lhhXFoEg
	VveegfD1IE8P8R/gKhondZeQ9BMsHKJcC7nj3tyzyA0dVfFg5kkX8zzLOWLVnaG8HMJQoiFsKTc
	voiUbFjICM7j+mp29V/YyfGp7zu3OdDyC84HjUhHWPU+H+n2yDkq0XVEqrBR+V3zeCT2condhQ+
	/drwXTOhFqkhyFKpDTA9a95tDMf5MoJLYt4kRgbWv6sywMmxV64zXo5cNdvbZJf1+8CzLGfeR0g
	r5JOiMpnkEyv7S0Ui9N8xjXqO+BZGxatIcYL3VqYEhk9Brh9pB/ciwqylHLe337cGmhioX/mm22
	QZqhdFqFe9GClj+pTntJjyPAr/id2TgUYCw0fkTE9Im7JEPAzjxmzcDspbZR1k//uczAI1Imk98
	0AEj+4KEWg4SwAVgjGHC0ckcdT
X-Received: by 2002:a05:7300:f810:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34005c6210bmr1298353eec.21.1790235470846;
        Thu, 24 Sep 2026 00:37:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f810:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34005c6210bmr1298326eec.21.1790235470219;
        Thu, 24 Sep 2026 00:37:50 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:49 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v5 4/9] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Thu, 24 Sep 2026 13:07:09 +0530
Message-ID: <20260924073714.1650588-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwlXkfSLZ/Bfa
 8zl/rHhVY/w1kdB/clvTL3JkkC+IXu2GltuhQgqzGWueVgXydNqqzJG7Pp42WgEnX4DXEMrxSdY
 bEj4YFj7lBQ3ZkibR2HeNCHCOD9v/Twa0bp4S+0hkRLxNDi4o/hDNwxFttDYuktDucNw372mt1Q
 8PSiqRNK+O4+Jdf4OySd2VgW2nmOWhDeoVeyeSCNB54kWbVNW9QQZcLN80YYoixh9Ou1V/t9tNr
 ccr7Iii/T09rvyQl1Qk9kOJeHvjg9AEczuhrr44gc7uHP+cseWHxRKKd6B0fS03H+d0pFyG4033
 LB+aNx/zTRUz649y/MHEOYHJR70faF0UhJ4TIO6cAUWP8qtu1+qCTytfMQ6hwKJPcXiDqphwA/v
 s3hQyAZvA2sCBHF0FBARzcjmT8ftw62Gfc0/WDhln6KE0/27rh8OISD5bjLI19XhmUFJ2pL15VG
 OB2nHnjZJHZfwqxfbkw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4d34f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=h0uksLzaAAAA:8 a=EUspDBNiAAAA:8 a=0wheRbxtA0UXKxI4o1AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: Qcy2ZIyi31y80v7V8DMWyEc23EVANXdm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX5QijrH+JLw2M
 mBmHHEQtI8x/2BqBcWNRbUBcoqI3FXTMPu1rXmrBR2kj3SkVg81wu5uyXCj4YUqcWqyB13hlF83
 78X3LNuVwCJ0mm9t+2D0RB3egG5zftQ=
X-Proofpoint-ORIG-GUID: Qcy2ZIyi31y80v7V8DMWyEc23EVANXdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

GHES error handling requires fixmap entries for IRQ notifications.
Add fixmap indices for IRQ, SSE Low and High priority notifications.

Reviewed-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/fixmap.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index a81823c5ee4a..3a775b8d0cdd 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -38,6 +38,14 @@ enum fixed_addresses {
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
 
+#ifdef CONFIG_ACPI_APEI_GHES
+	/* Used for GHES mapping from assorted contexts */
+	FIX_APEI_GHES_IRQ,
+#ifdef CONFIG_RISCV_SBI_SSE
+	FIX_APEI_GHES_SSE_LOW_PRIORITY,
+	FIX_APEI_GHES_SSE_HIGH_PRIORITY,
+#endif /* CONFIG_RISCV_SBI_SSE */
+#endif /* CONFIG_ACPI_APEI_GHES */
 	__end_of_permanent_fixed_addresses,
 	/*
 	 * Temporary boot-time mappings, used by early_ioremap(),
-- 
2.43.0

