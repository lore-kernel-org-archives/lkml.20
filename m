Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201F4CC624
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350022; cv=none; b=MECTEWe6onX31ln6fjQvydfB6OGE+CF34Cc1TdSq8oIMGCrIgxkkFN2tqPAbOshUrYEPxVmZXRWtls31Ef8CzFuTycEfoNoKgV9W9KOMZo+piCqep1Oc4IHcE3ds06WPWP15era8OHuwulL9E3ycgH/uFkl3od2xwzDp55QzvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350022; c=relaxed/simple;
	bh=MJKtxmh5YLQ4CTMXT7Xtr7eovK4rSJJzlr3jIYaPDp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ThFeLHGhacWGutdrMYeSWwY2fG/iHoQABl/7aIg90va9cNeI7MPWW0jTL1AZBP25nWF6XXK/HoUoR5RknlQXcVY+CgsvzYjqbXwemNthMGjQH9jTejpzBPmuB+C+FrygbX/ImYAXxtlcdVoPa0S/VsqrhcrnESQ8Zdg1UNmoezo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUv8z3s0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnOJUM1v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUv8z3s0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnOJUM1v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDrZM6756734
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=; b=dUv8z3s0k0KBBbwd
	NNjzCGxSoFZpRrYh4gsf4b/rsVTNhsq3s1WxUbIhens0l45BT0yRCL5JuR3Bz3yI
	sSQarEpn1fsDZxH5W+YCaddyiYHMM/O83wYkAkNE5lgV07rWL3z8R6oPZs6F+6bF
	bVXroe4y9B9eqRxscuLFPynjV9gFvgm20WAmAAW7u6C6g7oxCVPTZayz7AB4elc5
	fNkQhfOEGSU/HCuLiUIYQs1ROYAN9sH+AgCBDCvuQMeNXz+q7w6AI+9JT8bwU+Ot
	klN83LPPEgQVFGLBiWS7Fpb3Zh8Q6jlyOFaG8q40iDQJHWDZA0mPYvmKGW9td4Qr
	8bsMWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09xqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:26:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so1203986a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350018; x=1790954818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=;
        b=DnOJUM1vNIhldMWFyRAtHP+1yElp55XsEt+ulk+RgKfIBqm01MTXMrk6I8S5s1tp2M
         QOWy9NNYe+WQyXB2uTu+gNX3jhxCkakOgHr6P8DIJumc5OpMsMSghjMFO2H0MZMYP/Ns
         mfxjyYy7vQCb9oz4OSkiUPo0m0f1PpKTq7jNo2w1fr/FeAM2EGn9o6+nS/L06lexla6+
         fWYdzPWuagDXo1sZgdUxhU/5XUi/PlJzcNfMjxLhw8i7GSrubtHr1BH9jtrooJ84LjPa
         h19d8L26XA/2CTko/u1c0KSp+dwAArsuaOzs0VJ63z8YWJS/U9xD1sBxzgWRtCkLVuXN
         +8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350018; x=1790954818;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=;
        b=JvQ/BbpQ4qTuhZ0F2DLuGBqYkqTRvhwyhV6FAr6mmHdCoFU0y9AjfvVQSs4SyW1RKu
         PnUZlzCYjovHgZOzbyy7e211as1SNv11una0bjT9rev64d5EfdUsEK81zZGkNnkaP5JN
         TffXuzOdp/PByRzVIM32fbiFoV/5Zf5KPAQV6v3hVoXshoaCjkhtltuIbQU1U1hLh0CK
         CjOWCa+ugdwoxw2iDOhudAoXTM/ykF8kh5ektO3QpnA91/PNwJfhQ3OLtELsKFvrMMAF
         EYowDeptBiUkK7MGM5YEpAqa8fRvqGhxPcoSfIy9b1ytyaHCoDz16SvKtV4MXu2IYfus
         D1mA==
X-Forwarded-Encrypted: i=1; AKwUvBydYKq1MqTrgiGcaKY3TakvVWWFP63wpTINS1EU+2EZ9rgFoxi4RzEa34PuCGee2Yvf02lFvDJ8qqnw9TU=@vger.kernel.org
X-Gm-Message-State: AFuF++nSkaGVDbGeyV6gHYqlJOnO1vLrhoSLsm/YkheVqx96zjYaHFTm
	s2ONilc2ptaVLxYm7Um3X7eddCzvH6w0EbV3enNTXgO+NrDzm2neeuZVx5cAJz/ietdugC8QFi6
	7ZehsUNEx9iYFMRLs5eoykAiQfviv3/OYVOYuZqx43ONkkBziWHA/q/jxDYZD/1RxcXs=
X-Gm-Gg: AYBFou2S63k4YmqL4LYlQZsoX1Y/9T54c3AIrfX5E+xJXsJCtYEGb/sO2F20dwqpkSP
	yl9MkbukBR+hdnLfw5sbHHgpZvA6JBig/8uF5FRnkvfpI5v3BNxiGzhOJBtWCp4U57v5KVCHAm1
	BsJgd4TIufqQwCY4WnDx0YqR5RaR6O2p1M+bNv+Os+eVCe2znjSowrfq8JpAryNu6pGWIXP8Y2w
	cO8aF8RtFA7e8oBRfaHedY0y3AAgVYADE3Sdxpzj/A+IYaXoE6YLMsU3i9HCWq36VJl4Sf18XkE
	79L0y8NZ1l5Vwe3ykAhjYgJ2mtOpFsKXwbOeXSncQ+k8Vw8gWRYXNwWJablm0g025gQhhpJjjeY
	RbVEcK4OEJqe2g8cuVyq+QAdz2dGc/1v8v8AM3I2f0QGTXxlTFnop4xM=
X-Received: by 2002:a17:90b:3d8b:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-3a098b444bbmr4769219a91.25.1790350017901;
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8b:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-3a098b444bbmr4769195a91.25.1790350017326;
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
References: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix reg_info_store leak in
 ath11k_service_ready_ext_event()
Message-Id: <179035001623.3875741.2110365933382475990.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXzc8/OgF/6PPm
 9MO9EefeCUOM3vKKSXMnQksQoL/X3gQUKxl7Yq/5gDTKG+tb9ntV+T+u15ZPSSvuMOQxjiA+DCq
 Zf+foOWgcMB9SDuS+7YiK9BKdj+nhZ0=
X-Proofpoint-GUID: gTpVQ7q2DgAgo1tL0SMN_Uw3SkmnmpJn
X-Proofpoint-ORIG-GUID: gTpVQ7q2DgAgo1tL0SMN_Uw3SkmnmpJn
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab692c2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9eebIFysW1Mfredz1lwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX4Yi689DK+DIq
 6mKGvzLtCq5RSko/fYS6qSuh/wx4pcT4lhiH80zWYKq7V4pPeyUBODpAuRXpav2S6xVFw6CgLQS
 U8Fpn84beGK6aNDDnqZMEZW0SrybcHyBq5+Pb0Ya06b4pk6I/VOdAcRjieHHnGP4sraMibWoMdL
 nhcaUBy3Jc9K/7oCq7m6ebTZKNJlShzsXIjfizyXxtNW3wf9ifVRWKznDOxuo+xu7neTJncMTRS
 xKFBK3+1PXJB80BZWsenUyL+lkx6wEskr//i8Y6EWC84pW3c2h6DhQU09bug3mofCsKUste1O40
 MbYzeMwEbecBPCG10fMpDQH+mnqV0Wjmg3N6qTTQ26aGNKbVsbhu/P/abQ4UYz/V6ZYVhI+NVN1
 m3fOeKDQ1cwt81h2D/t1H4fMLS9R7aKYl6dOXjHzYm9FyFilJajAAtHm3uVSrVd1+mZtDolc8Ur
 TVp4IFXLwi2flWrYRAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061


On Mon, 17 Aug 2026 16:46:34 -0700, Jeff Johnson wrote:
> Currently, while processing the WMI Service Ready Ext event, the iterator
> in ath11k_service_ready_ext_event() can dispatch the HAL Regulatory
> Capabilities handler ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse() which can
> allocate ab->reg_info_store.
> 
> If a subsequent failure occurs during iteration, the ab->reg_info_store
> allocation is leaked.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()
      commit: 64828f091c7de5c1324427b140fb545f93ef073f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

