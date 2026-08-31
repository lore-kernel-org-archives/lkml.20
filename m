Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BFE4FB9D5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188413; cv=none; b=Is/7rLLcrXn0ZFfc6LkVngVm4qAfOmTcW+j9hL5m1LNvW/6vsyaXT9oydyqoCNzOZmzaVG2hsJsA+KiiXy71JnHfesQbLSHJ4qX81YQRc/pFKTnoOA+CSDoltzYOxeuZWpEdbN3g40auhm7WRBywGBWbFcjCoPQIoulYENWvl+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188413; c=relaxed/simple;
	bh=TFwknJ0YqCRA1LM+i6U61SM1MSuulgej0FGruggnW7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gU8vK0fPEk82V5BfEpi7p54HZsywDsaL+UHA9V3bGZjfuLSdazopO2J/qsqQWrjpXggQCGnuh9jpQqFEEj+I6zdkkNDslyujXnklvtKXIKh0XVFLFwob4pdzpf461RkMveXEgQkhrVA7EcosTZz1k2hUUwpKgotYTu6BtyaJI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJY+UZ5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjodTiDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJY+UZ5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjodTiDZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQKT3296598
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/0MUXfJDNe
	HlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=FJY+UZ5wY0Pooggdsd9At+BbBAQ
	Lp1R9dHZfYhnMrLjazZTQTXXwd13pRpgl/GN0BiudGNYxrw9VJpGYA4/YN7zt+BP
	aoo3n6IhpIxds9ukDfa3Sy65BuHW8PBuOBZZoKTkzKymwwgZxWhkpPsQJudLB+hX
	jYhqzb9rpHN2MJ+JtRsxBOLlSrh/I93wMoGfQbgpJCbBwxtANfeHpX1GK7IZhdSF
	DT56QYgg5H6tyR14AvzaAySlrenn2x2hcYYQ6bm62wz2pEs6RL6l70pKoxfbbSFE
	i1BL/AkVHtlAYA96jrfouNy7xxL2zzlszBLikRA8Pb5ENI6VCcUbT2hdxGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayhj0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so527850185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188410; x=1788793210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=NjodTiDZPJpTCSktQVNCerMnMeLLFNQRgkxr+T/t21LzsAJeI/84rfIOKHpWfLCib0
         fIAPzoJfldymeUZbzxlgl6L/zZcy8d5DE+8auNxoEqDhTWj4rzGigvLgB9jCTIPSQLLG
         KxlwcbPAST+tKi/JJYMjc75EyZvwNlhoh66gI8CHWGQGpfldAtcxdrNjn6DpZxZxyOzt
         vvBdP7HS2e/RQIWZVL+SE8zKw13WeibB6z12Wk8KwaTdoEQJr5aJyGNI2eE0/6pv5naB
         njzTrmXem+81NeNSSTzx/AT6Hr28p7X8VCDOU5VtR+Nd83YoF1tmvUkoZwK0qpcnrTSP
         o2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188410; x=1788793210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=pfAfcdP/eFIYSknEVj0sBQ7URXHN9QigsZaGzM2ka5oUV0juSPm25KZxNDEOSqNhZ6
         eOd9mTkYATSDFZCnFopUenbN0mF4tuYEKENBEMgMMwc98y7oS/FSPMqIsFh8UMoqC3S3
         3IEdLNtabFw8CxwreXxjIa6MzcPOaGpCRuPTX2ADHH+BVgkQfqGCOkVbRzFIJbFt/lvs
         bK6NwTRbvmlI8dSjlxC4LLzLgth4zsycqG0nP4Kluwjax6DixFkSJ3zBgYos7FQHyQV3
         wMF6WncAvskJ0fkz5rT215g5+dTwl6uPEYgJjwODePyOkLGVpNNehKzEtXyfuWk1xNBi
         8ZjQ==
X-Gm-Message-State: AFuF++liIYf8SJFMN0uvDDdJ2cbtcuDx5acdMuds83wZo/yTG9KWxA4b
	CIGkBp9bjLEVfGuLDre8vC1Wrc+9gacPAeFqt/ncbeR40UftvYQGFBiDWOnYs898hwEgZOb5FdK
	NhDqgxPA6A4KyEGlsWrAvibx3oKhiFTXG+qPqs66bUFn22rGQqBcI/UeRg+MVZwEeKTo=
X-Gm-Gg: AR+sD10sAJKgSTw+G7ERm6+Zd+YMwhPVGsdN5IglJsKsdmsOPmnhzOK0NJ8GG+587n9
	TaPGT72x1z8+nLYpy+uuZW/XrrVgf4iXnhDdyrQPawAgqvnBuT1ylVd/wDIFiN1ItzMHVYlUnwm
	O5Xka/MpxPJyvxglF49dz4lx95hDPqSTWHPos0O6/1gARJyPZfn/yEyEroD596GJH0E07h545Pq
	HG2citnIaSDhXEhdV18vjyzheokBp/FwLhNi/3jsRacOVS6396NAiggGsrVBu2AqR0rmI1DljMS
	e2PLZmvmwV4rbwzEVl+ZnZUYyPrazJrvuSzvc/9n4ujtSc9JmFEjo7Zqjoaqa090RFTTVPDDGEo
	EepM8LrNBczPk73v9kSCmI4z61BXwtanxVmg=
X-Received: by 2002:a05:620a:a404:20b0:939:365b:37d8 with SMTP id af79cd13be357-9394817f9d9mr195749685a.36.1788188409698;
        Mon, 31 Aug 2026 08:00:09 -0700 (PDT)
X-Received: by 2002:a05:620a:a404:20b0:939:365b:37d8 with SMTP id af79cd13be357-9394817f9d9mr195730785a.36.1788188408868;
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm252798825e9.1.2026.08.31.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 14/17] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Mon, 31 Aug 2026 16:59:40 +0200
Message-ID: <20260831145943.313726-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX+OJ5RUDbwFVy
 VSeirUHrmL+NUTwqok5/+e4FcBqS2uezgL6tlIGO0wGi6fkyB3kLd9GEQTy5ah04uNqvU1ZY/ZK
 2+Bd4vCeLsFqRhFy2p/+4qSHyZ+DpHo=
X-Proofpoint-GUID: DDZku3CxVgt0RI-ADMDtlDEdQcehNFDs
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a9596fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=e-vb6wPzIjHU0Swrx_MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: DDZku3CxVgt0RI-ADMDtlDEdQcehNFDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX+33Q4Jui/MUW
 WHMGGVn2W0c2BvAK24yIQgPf5rXQciYrNO62uEw1oVLsrPQ+IUothVXUWz5dP/uCUnNM9wbgSvy
 cM2zFmtxAmIs5s8NFocq/pLTpUuFhlH6H0o9g6igTGHfoLu3ADXQpUGa2P/pYQG40nXvRtcAAtv
 C9b0vSWvXjOH9ZZPbTCfF8PBmdxEtMjkgwnEZRw2te+HKPte2ubQ3FfJz0XlXOrpUK+WCv2Hz9+
 Qxq5Qw20XKqzeH8TL2SPffiqeh17HNQeZMzggkouXXHwjKcfjxzMGwrNvTbfBXr92uzDrFM5dMm
 R4jzXWyUj9e87XXcRxcLv4XLN9YKcOCU14TLyHEBU6zFdR9+a2mDPxl3hHj5qCWg6tHx0nLCjrm
 Pa8valj9iZ6WIPPe9VdQsnB9BEuvpnFF/kaFb4v0IJVtMz0EzuTU9BPrvZon5iNvm9i8HTquF8q
 tz7NVV81TQgIne9j/RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture, now that the RISC-V IOMMU
driver reports the IOMMU_CAP_CACHE_COHERENCY capability VFIO_TYPE1 and
iommufd both require before allowing a device to be bound.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.43.0

