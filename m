Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F642E419
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235497; cv=none; b=dL0hmOGnqwA1tfhMvBCd0a/SchVIGlGVreq7wyvbSo1kg+rQdlLVmSTGbeOtdQrdjbR2tVNZx39pZnMv8gKW4gbfps1tdYZNklIGfFpA2+ucbaoDZv3VK4V/y4vjXmtqTFa63mp+69aq37p1vxv9CxHx7FuZ6fXMC64zuGjxdZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235497; c=relaxed/simple;
	bh=IPDczm67WB9cdss4DG7r4mgvBThj4nInB+DV/41f8tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERZEZodOnM0JJpSUAgMcaG18M9ou6g3R5anoF4jMToFMS86YST6b6jNcPv2HrFTDQFRkgxhBebe0Ysl2oY20U13G3bZY7I+y4i3QCB9AqW/Az23VgQw36KtB2cM+wDS45IlTA6wTNZLIM8NTZ80St1IqUwaV339SRamxH0pJIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBLfErtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCJ4dnXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBLfErtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCJ4dnXs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eD1E4147349
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c4sUVCmmjjo
	/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=; b=ZBLfErtjnHbpJBbL2C3TJnOe6dC
	rnrCo7Njc0NBxWlfBgH3egh5mSCMfCi72t6i+zCk+AEp711U7KE9VOV0nN9PzMY9
	HgMn4Drml+qLliqS3z5jQdWXo5MVVXhhS0Jg2sAgVWbnylsdfmUsGaL5n0jdEeWi
	wJYEJDAelI4PCLyCrbPjyk2b242HOqHdau7MfxrctdkRl5nNfAS49wyu+g9klAib
	88w7retfxiU0dHd6Zrywd6pZPGn2ZeQHbLj3qH/4Ip+S7vfekM6wcUfB0KgEjVxW
	TCChsOlO0SekmYqLNZjo4QS7M1DfHcTOUgT4hlivSPT/puQ7W7w46YDLmFA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3w4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so2472444eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235495; x=1790840295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4sUVCmmjjo/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=;
        b=PCJ4dnXsgqIKXoIVTPVpokOLAt2vgqTddPLg0HboYMqUyfsUohccjMTKvMriXc81FT
         eaVoOwwoCXayv8aICrIvSlxHaTKM2aZuAtw/m2Yk/S0i/ghBqNmpork2pQhrMOzYddVE
         1BnObrb4tRMpW2o4dnVi2a2FuyIYS3RtOz/RURYwJx8YCJpboOGsKj/uSUqfJzbTUAo5
         +6C+pJlY1AHAJeSwly1iOZidRmkDZqLSLSiWmaRb9zhMW6YiGFOaXb58qxi41ONw7y6u
         fOsYV4cYd9q/mN/QTxxgMXc4FLBFEBwDNReJsVW9hVfmtn+jWnuwp8Gu1cddXjxLq+4K
         30uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235495; x=1790840295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4sUVCmmjjo/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=;
        b=tExrtRO9OUIBIzYZMY4bk87S8xDYvitGczVks2b29QxGXJacD56fXukgyQdfUahclP
         BnzvwrnFPyyDs4aPRri3xMYinKyA42TVw7KLjUpr8XuiBTYfox291gqKH4JgEstrD6Zn
         5Va1BZ/b6KhDPdceQ2M0dgcfi1l66FUQjdahbAvCHqsuAn2YbKbLwtTMLBQVurHEqZzw
         OZP/Pn+J9lsHJOnEoQa30ZzVTYHnZfjLIrhp6+qNzdMiWuKqV7Iyxfykw3QPCGq7ScjE
         1Cr/W9cQYHWLUOVpmdV/kmFgJPiXR0JxvuNqYycg3pjSi9otiKbRPIT/8deY/2gUH3++
         r7dg==
X-Forwarded-Encrypted: i=1; AKwUvBzL/Ufzba9++/JRTkQ4tL0D2DPVagOL1VUmijQtgfyqJaUQX3soBM5XhLRjq5pVf1Qiy5rgwjyOjaOnD7g=@vger.kernel.org
X-Gm-Message-State: AFuF++lIjHSN7mfQrhVPsafYMgejhZsAyEZGmr3YfSVTH3U5t9X2mx10
	9vVJ39WmTUBHwqYGaZY6SoR+u7jcCvNcFYkinK+Zo9xuT29eq55I72hRdlNf0bhjIDWMgFP5N+4
	I5pVC5wqMCpxHZJuBd1VKIVoDG1gPP+FkNSOsUCYRlRjJqbEICBdRSyhrwpnjwFaLpck=
X-Gm-Gg: AYBFou0GFQUkmY+00ef+bCIGpg3L29OjoI6ww+R8U/PLve/AQ+gWF1HtYdcRsbEhaaM
	jplcFLC+MocF33fVsWArCekb7PsyZUSE/Tf9w9n10/MIkZY5Gp6wm0PAE6EsrC/U9y/+axWBfgX
	vUFwSsUkyeEv1wRUceib2tMeZULpoagbkG8F8Jo2iCGrRodIhvuPq87nXUUjf6JD7nBwY07inul
	+3jMxNdqJKryhLFKxM9R9rZK2JLjXyQdkPMPUQuTflgDtvlHdZhPwp5O+NEbBdAKyZErxJDTWJb
	SRctf26fm+sbWoR9cdNLU2YM8SiHNh3TOoclE8pGX9uAqf/gb+PKwXUozIkSOFWhRUp3CQ6puLb
	R1j0kZHOcsD7NgbS5EsPxGbIFL08PBfrbGr/tnAfh1acWTkqza5imgTjde/mEmUz/7hcSQg6sM5
	ZGzKiokAiI/GPdhWTUt9jVAfBj
X-Received: by 2002:a05:693c:821a:b0:33e:699d:575d with SMTP id 5a478bee46e88-34003ca6caamr1230464eec.1.1790235494701;
        Thu, 24 Sep 2026 00:38:14 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:33e:699d:575d with SMTP id 5a478bee46e88-34003ca6caamr1230426eec.1.1790235493990;
        Thu, 24 Sep 2026 00:38:13 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:13 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 8/9] riscv: Select HAVE_ACPI_APEI required for RAS
Date: Thu, 24 Sep 2026 13:07:13 +0530
Message-ID: <20260924073714.1650588-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwBeynpWzDT7i
 ZTo9aGMj4qn1BM6lzZ/TGQQ2ntFc8Xx79rnGrQ32NbkBPdhNXGHiV4FCWdeoq/K5Xug86O0Nnv8
 sFJpv7W6VeBre2Bvz5el+rZ2PCfzf4p6NF2d8OdjnJ5URDvUzIPMD/3RJEpj2ecEC1MIWmEMJRO
 YDTkPrr7DJjaV3gWQS63rFPupe/Ou/hisMAhR6bmXWRVO1Tns9h2A2KRR92H95ktuuyGf3m1aIr
 8wAGs/VrzI9DYf+H3ctNAVGWdTRVz98KSgEDBBZfUn11dHomCTocGlrw8E8+IVSh8X3m1ry1inQ
 VoCcCBjp7YqC+/d9TTLN28xmSgpg5sGzxzriosvS5UULuIiH/OMffMWZO6bovN95PRVnVzqWhUf
 yB/FzQ7s0IYn/qO++2m++FS+xAQdGb3/xmt0jvtp9BBc/FjUBoNaEbhrOZS3ggkDO+Dre+eQ+3T
 g7kJWZbSxgczOtlfcvA==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4d367 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ctgbmQax9_dbRqqonagA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: NIjNOChcx1rPt_KZor7ZqJVccVCk7xxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX+Lr9pGu8eU2w
 I5KYsIjEsut0ghtBjk2Ez110E4GNxbEDFPx87DvjOZ0zAORB+RkujMg84k2e0TLsklxcoFPw7PB
 n0uAV35SsOiy4UCRgc10ngiI9o9yNk8=
X-Proofpoint-ORIG-GUID: NIjNOChcx1rPt_KZor7ZqJVccVCk7xxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

Select the HAVE_ACPI_APEI option so that APEI GHES config options
are visible.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..9608abe126a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -191,6 +191,7 @@ config RISCV
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.43.0

