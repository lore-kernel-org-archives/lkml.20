Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5949A3CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593030; cv=none; b=ngx2c2c50HFdqluJKUaMP4fnzj5iM+i5IxVE7m8PZDZ+uPdyayV0vGM74F2JFCiSti1ymudoW/KYqtJmNJEOM0fODp532Hi1yxv6uLyLKmMKDNUcUZRTaLcGkb9VGWY9tsYJWZE8goqMtFR/KM31RRfYtq0cKPa4adsjVmWn13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593030; c=relaxed/simple;
	bh=D557zzr+WR/16Rt6Y0KG6Zy5JvNoW2oCPNoIqwlS7y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYez0C0MKY6y+5FqRWXrUBmzIMCikhbtSBranCnXazq7+zx7WiLmaQ4qSQtpS2Wx2TwXgF+Uf64RHfspeTru83QMcTZq3OEFPcYXp0SGqEDRbysUkupQQMl3vJZsHt4izuUD2nCeQI6YeGD/S+nmPxcTLsZOP2qFCuIkXvKvDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvnTlAw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqA3U2rR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvnTlAw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqA3U2rR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M4il245798
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S4yLLM7uCYQket8rd9Pq6dEX
	97HjH+y8AYJVBdz3Q0E=; b=jvnTlAw2/E+rAGs2X7Wvf5URybq+Oylk43sy41mz
	wrWJMQXat9HZPX6PbNjPv1nuHWWPzgdBijazlIbRtYOpBMWZWV8UDNm1iGKME9nk
	gSAgOULoCVQh7Mmzcwycyu3ceN7akynxUtzIA7RpqnvWLOq/sdW16xG0XqZPEIBU
	+1FH7Sb0SJFX4SYt0nEJ7AM/tFKv6By71Y6JeWO06Ah7Sib5rrfFezTgYwhcn0db
	p5IFQOF9fxBiYEPoG3T+Gzy7M53raHJzPXAflYqbhH39QdeFZCiW/w4s7tNrjMFp
	uO9aH07nUKiBd3s1SC+iPmKp6i8kyEjznziTOajnxmqK2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt111fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:57:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so8581660a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790593027; x=1791197827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4yLLM7uCYQket8rd9Pq6dEX97HjH+y8AYJVBdz3Q0E=;
        b=OqA3U2rRcFmyfOtCsnuJRACpz5mfzrPzNjR24IkKisngGd2McJ66Wn7cbl6UQcdqSH
         n6h7dif7Nn+KLQcYtOj8kJKb8RKpC9QwwZHvziyJDSRBgBwxelbU7XdnBZbSEn9vz9KD
         zPYMRe2MQcuS9nnFAIdGEWT9QZiYFAjQV9hex1fU6l4XGFFBUxML+K4zqm8KJlD34SRP
         cJ17Y/qTgZyjqf8IG9Q175FYJF/BKepuiz9xBoTS/ddG2JhZaPkP8h8s8WpwrmsydjQp
         rbAluXEQ10xCzw72xd6zxiIF9u3ENfiXLeTCxkh/Z5kTQZammpfmwJwyS7pDFXCVgdtm
         mB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593027; x=1791197827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4yLLM7uCYQket8rd9Pq6dEX97HjH+y8AYJVBdz3Q0E=;
        b=PnCvdjOYhdhhbLdTTAkuzzQ7hfETedykd99f57TiXm83PRbNHg+GLPtC+K0eCtdphn
         keiqAgJ5+pEjFXrAx8vYeNo4cECXZmMqTndRDHq0ZvX5QqS8TUpmCNiGHMNbhxrz7+zL
         PJ+I2wLs3NwA6jUsxy358w3dxdcL6sx73AHSsizkpjlpMsGZW2TTmHg+ULdt5nqiIMpi
         mvpQHtplIEPSycN3zGsw7nIiycqKsH6FkxJjGZlUhe7e7bvajSQkjHcQauG6Bmh4hGjH
         XzhOVxAPuKkEmqfhWdz6MWhHVSkwI2cuea8AYmKec+xEw32tdbMnqlALDLWB4EvrdGNl
         okAg==
X-Forwarded-Encrypted: i=1; AKwUvBx/E/xZNBO6jVsZQHr4WDfXnDyDUb1T8RKfqMjQ+0FU0yaVo2pF4jpQkpMG+G+IalxStxVTi3qBu5T1wgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL97mWosZBUJkdSH6CtXdR/H0pO1xtYnokHOT6plMNJdFjJXi5I
	nR3Jor6Jtl1MoB/tAvDETawSXHOsIaSbdkuu96qG8DKq3kM3JHqcEJMpRGhhuNMKAL3quG6CRDP
	z/t4GvHVZhX2Evnic0Nk57tglT/9XvuhB2hicsDIJZX41xiVEnZwsYExW3gBJwIN9rhk=
X-Gm-Gg: AYBFou0jGivB3M4rVoteX7qvzpdupslIL/sheso9wVyCdctpdAk0gH3zXG7MfJQK9Xf
	pISzJeur4Cj+v2eSFwaeL8zyBgyC8vJERp/kStEe7yaldyWDIC7A0S6bQqQF0rx0mj35AFiPDrI
	p4Wi845YHxuvnT12FHCRTiT8Kl5PaqdfKJmdKnZ4gxXHiYwZFnG8VP4lvYKQpccF9we/mDZjfTS
	cmNYRIaJxxpK8IaA80JSW+96cREFSf5wy2HvhPRkPvmI/Jvyr+QRmuJMJtsIo7G0WZz9LwjcAbb
	Q3F+DyULv/Zn2jKhUOhKPXde6hCP/ItKz3lk8Z426+X3ruEXkVaQG3zOG/lJ8YY6FU3oFsym80z
	rhy2dubVzmn8p
X-Received: by 2002:a17:90b:3c05:b0:3a0:e5ed:ef99 with SMTP id 98e67ed59e1d1-3a0e5edf00bmr4635283a91.45.1790593027266;
        Mon, 28 Sep 2026 03:57:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3c05:b0:3a0:e5ed:ef99 with SMTP id 98e67ed59e1d1-3a0e5edf00bmr4635259a91.45.1790593026762;
        Mon, 28 Sep 2026 03:57:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm13347868a91.13.2026.09.28.03.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:57:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:26:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Message-ID: <arpH+9ytWKFntjiz@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
 <20260928-gregarious-deft-boar-e776ae@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gregarious-deft-boar-e776ae@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX9cavuWBge40P
 EPuGea1o8UmQfXzQ4B/JRbgyWO2lezuFANEFLnakzv3VKozc95NrtYS8IXFgcsWzVTGaaFV9EAw
 nOUgJVCvvDRLLQOxKT76hSxGFJxZWSqLN0uY5WrN9aAPA3C53KHdWXlFkRFQw+zNmmv8UJW1j4s
 OzlVMQ+pZ4TLvbqw8aPc/ppNuZaVHjf0F6yk4kvvAmy5Zz/qV21L0AqMN5a7BN8rptCpRkEXmOV
 IId+5Vb+qIqBEKjQ7bVJ68KYIZ/CQfCbsBDW+5iKuQD//zJl5rbr2zcraJtl/uZc0odBDcfv3NO
 xURDLrADppy4RBDClpZrA3k2VK8Nms+imuY92nQDqoCkmaVMpxppl2/b/iCWkKcmgOd+7G0jHQH
 Zdsn1S7uYHM1QrPdUbPL6sPGlLWLF9kLCY9CDvdLszHUE9cP0VperWC6UA2KAUimaxNuDiDxZDP
 HzzIA0lLb+jex26BQNQ==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba4804 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Sf7_UopSgax0LG51KRsA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CeN1rdODsEYdOYirucQtnkW22klzaZd-
X-Proofpoint-GUID: CeN1rdODsEYdOYirucQtnkW22klzaZd-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX953Nd+SxBLSo
 WczanMrMJeytcDDZdPL/pLmUP5grlgWTnSRusSxPLVupkvb8/mssmQxoJKSBg6cAYhRQWi8lQ8s
 B9xGawkImce8+oBiHRbJkhnws2vpa1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280043

On Mon, Sep 28, 2026 at 12:16:45PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 23, 2026 at 05:34:17AM +0530, Mohd Ayaan Anwar wrote:
> > Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> > SGMII PHY binding.
> 
> Why random order? Why not enum with existing part?

You are right. I will group the stanalone compatibles into a single enum
and sort them alphabetically in v2.

> Why not even compatible with existing device?

Nord uses the QMP v7 SerDes register layout, whereas sa8775p uses the
v5 layout. The offsets differ, so Nord cannot use
qcom,sa8775p-dwmac-sgmii-phy as a fallback compatible.

> 
> So many questions, yet commit msg copies subject.
> 

Sorry about that. I mentioned the QMP v7 details in the cover letter
but forgot to include them in the commit message. I will expand the
commit message in v2 to describe the hardware differences and
explain why there is no fallback compatible.

Thank you for the review.

	Ayaan
