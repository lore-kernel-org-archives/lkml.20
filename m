Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320C3C10BB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273255; cv=none; b=XqnRy345ukIeZIlCIEslai3Rv2dC0GSMGeRmaQlDqbSCgThqiPGqR3XWScwjwx8yXtlWHnmvi0GDhjIHRi4Q8miotO4ft5+DbHaXxBM0hZRTxbt3E7Vfba4vzQ742Nkkd8YkPJ0DUq2YSs1eH9qsY7lxe3TzgYaFJLiKjINBSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273255; c=relaxed/simple;
	bh=sx0OQBDy+pIlce1a83bwYnJXkT7AVyiE9EAcTjQD9bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P87qq/H3GPfYc741YHipVs6jXXK5Sak0dznJFrQXY+FC10bGogzD1nT1H3Uw4GVXPa9hXVhMg9W3S/xnxPd+dpwGfPXeig0qXg+oXKOgzWOWcsJ6S7h12LK1Ld0rm8wE1xSL+Y1eF6DcCkvDSByGvOMSHpr6tPgm19PB3Bx42rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nmy85fiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBBOx8ci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nmy85fiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBBOx8ci"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e4la095547
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=; b=Nmy85fiYuzwr7PLx
	xg/MeqPpOICLj+yunc6CcPDVfuORe3hYfVkN8CIWyn2FNrYJMOUL/DMxN0TpEQDy
	NrVrVliPE7+zSlwNSTaFBOpPc3HvuNBEt779aoDIzEofgmPhckWtlFZceJf9yQ+4
	3HHrSTJWbrTvlKn/mlKHk91wSxyaaBj8EAGR23JTU4QTOlCfG9mToHZSCSg58suj
	rx7PYSZ0y2MFfeQZwp0QXMNGJkVEpjZryl6X6VZ4s/AVBO1L6/0m/afw6xpVKgUP
	O+xxEddVHMT725HRUeUPr/oR2Fl/nxW9v7k/N8Vkj2TzeSoaH+E6cTv4arqep7y2
	9HXwSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jkue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so397608185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273252; x=1791878052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=;
        b=hBBOx8ci0An7RNgiX+UyIW+AirDMzPHyjwiR5Kw/Z5CFUWia+Mvtx5zst+a4BO/x7d
         /Qr9qlKDZCIF3nFYfjy7MMvHAUMTuUhfJ9dNu4tPyhaBAdq3jjfhMQfH7seA9QyFPJJj
         jCsYF0BW9sD7p/eARTbA37CZGQNv1vp1nK2GfsvmtN7lJo011BxjxDrLiz8ZPy1sRpE0
         LXkihHWkdmNEEP3KfFBDfUgxpF1HXj40J8DYZzlnWxGcB/GHnsUJDzkkZ/+UfjPA3JdA
         D+Sg1iGGj6BPvYPAtzZzqjayf/BC0MGSPZonzLaGFM355LeuGiGE1EvyxlLDmsKugw+9
         Yq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273252; x=1791878052;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=;
        b=vSuZ5OQ0t9kBWBwQyQXqNDGwJp3QOobvR10QL3FETsgJ1E2e2lyjNtJBcxjkVlwGhy
         ZxCVA9f/9/KBgh9WJK2z3Du1YMpuTOpQxKiWnatckSLaqqgczeez3cON3YmAtVyScD9I
         gRqzye+qsKSSb007fGq6kWZVg7RNQ/gOh52JTuhfam8SMaBJ4hHtdZ8K3OlgSyzT7TUS
         vZ686LoOHetmq9Mxfq/cBTRTSMRKDlZy9mN31PnJ8cKr7Lg0LLrYtOr1ORkpO6efuXwU
         KdldT+hxgWCRRU3aSdVStH5QMcOdwc++HKOUR+n9zw7QRtcRaHDn+fihDxuQk+iwqbn+
         EGxg==
X-Gm-Message-State: AFuF++kjkvV4QdL79nup5z91z3i1Eu64EQM0vK6roNCmlvpu+bO4jgdE
	wYGEXaY2QAG7YP96LEBzLpTG9qX86v4aR7G5YiFfl9DNBFgljgbwJ0Psc5Ae0vWiVfSVE+hVmLe
	G2dSUEjKYSm/LU0rFXAEV5lBVJKIACGtYmij07uXvhFe4LpzvM3mVFrT3MjUh3zruM3M=
X-Gm-Gg: AYBFou2TpGqLqPkzPmUQx2cZhSIdJ7U0wdRTZupOthA22IdOJbElfSoY5IDamJMTunT
	2yYfpTrdTMA9gj4Y5ZgbasHhBf0qSr2CUA3R+p8xh5qIhcAjnBLv0Pm+XyFgThWig/6iQp72wus
	O7EVHILhbT/F69aBPZ641lQV4Xrqj+wOhi0P8mEZkJFmWtbmDA0g7bsgixoD5ozRJQ6XK7I2Gp6
	LRKT1fWsqIMPiIeVvP4J1j9i64oIOo+7onUnXCdN/ezOYl+SnOwwJBmduD4BevA89YpmriseZHq
	pdeYUiuUno24mumbzI7sQHZ6M8BTTggNTEZ5ZECwrsZcO7KAxj2ct0Q+NvUM+EzAD5VRd90yYvB
	U7LUFTvx02AVqYI9sGKlgsnN9GXwlOHPckDiRQw==
X-Received: by 2002:a05:620a:3186:b0:93c:6963:ff3b with SMTP id af79cd13be357-93e8f4a60a9mr100050685a.42.1791273251823;
        Tue, 06 Oct 2026 00:54:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93c:6963:ff3b with SMTP id af79cd13be357-93e8f4a60a9mr100047985a.42.1791273251322;
        Tue, 06 Oct 2026 00:54:11 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm84506095e9.14.2026.10.06.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Date: Tue,  6 Oct 2026 09:53:01 +0200
Message-ID: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UyjOzys4BO6uVBJBcRXguaApdAeX_gjh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX5vpt4RYh9ZS+
 uduAqbmmP1U2M3UuiqFM+Fnhd5YPaApnQYutMaNYp6YV8KQkgZUuM0zg+yBEEx7+JuPoTG1XOiO
 75HfqIcHUnbRl+2yO1qyYefYcLskvEU=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4a924 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lsg-wI8U2ADVYaVtWPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX+MdWDHBihdW2
 sUivLiawx5WncjbB5kuvqpnLw1zHk3hJYoUNibyKtUjobfL7+iAEkKAcP4SpjuaCzJr7jWNZV6k
 GFyabUQb47qUUVDtGAu3tBatJL3sFRVQdnsuaO/45EHe8uCMWWDu+M6GWXexbE4SCdMqSQV91K/
 OaPgn+fGZFEa2FQeHJoJgE6WLQXSesDpsTkhJ7KSjmRgeJ1/ywTFcOmbTm8Z1o5JjxWVVwS3LBN
 okHizgZPIVIfpwzeCb9jf682tyUbP/TW3TatCFGxPkZix8HDh8pd7uSW4z4vTa4ljMB+mM9SsWW
 7F0XULhnENunYJSa3bf0n0BUXr9V4Y4EVVj1tvCM1XJdKyQoLO/wUS0OcwMmScJhSair+aWbqr0
 A1mbJE95LCr+oP/4SFBVxQ0JASW/icVMWSGpzwroLdrOu2cfsF89MKaYTic5rp8KZIvO6VfKezS
 htVf3BcUnNqJOJRx63g==
X-Proofpoint-GUID: UyjOzys4BO6uVBJBcRXguaApdAeX_gjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

The RISC-V ISA defines Supm as

  "An extension that indicates that there is pointer-masking support
  available in user mode, with some facility provided in the application
  execution environment to control pointer masking."

Our facility always returns -EINVAL unless Supm support is configured,
the pointer masking ISA extension is globally present, and the user-mode
is running in 64-bit mode.

Hiding Supm in compat tasks would add complexity that doesn't seem
justified as 32-bit code has no reason to look at Supm anyway.
Reporting based on the a global sysctl toggle isn't done.

Do not report Supm when some harts lack the extension, because it's not
available on any hart in that case.

(Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
 violate the text of the extension and we ought to have Supm7 and Supm16
 extensions if we care about precision.)

Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 The compat hiding and global sysctl toggle better fit in Andy's series.

 arch/riscv/kernel/sys_hwprobe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 477d8fd780a6..9a864e050acf 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -101,6 +101,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (is_user_lpad_enabled())
 		pair->value |= RISCV_HWPROBE_EXT_ZICFILP;
 
+	if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM) &&
+	    riscv_isa_extension_available(NULL, SUPM))
+		pair->value |= RISCV_HWPROBE_EXT_SUPM;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -183,9 +187,6 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
 		}
-
-		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
-			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.55.0

