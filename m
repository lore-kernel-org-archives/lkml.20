Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CE3D5259
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632079; cv=none; b=d4YO5qMcOrWxxad2MY3ylvTMnX//sLF+9r5N+TTAlOZ6XEj3ih2nLeBKlcfGOVx8sWmUnh/Dntr4KLwb2PxhCi68cbo9MoGZmUnLqXLMmxOpYHKlmHhA/cuQOnBvikLxEgxf6bs7p7qDv/Lmy/9FZzOWW/Poyh1JVWB7pHbhGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632079; c=relaxed/simple;
	bh=5n2spNRAVJiYvE1gs6ZNcCsL0cuyjrLDepDe5iIv0F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB7n5x1uuHUI41SGaHRjV+xAyf9dMyouureQU9RmAa8ADlc/rKYf5M1dmN7pNzBZwTwHUYiX9MWm1K32c8nbKqXJO8eUXXpjCHlD1bz244wgkJrResyl2wgr69ZoncKMxYqyHnSsUzdizEiPCdAlUra4RMfvAoOfyMDceSvM4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFJpSvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIgld7Em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFJpSvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIgld7Em"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61YKW776798
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=; b=pcFJpSvLfUHY2h7G
	qjfi3pTGF1CAYG91LLay5TK+kU8/jehpV+wOEaB1/hoNfY9oxu0+yAqnQPEqnMds
	pjC93/cs790/rg24DNlkGgzjmgufw0e5XGdA9cz7ZdR/ft6eZe2ZrYOOx8LpOBnD
	GSq1xwGyX3HJNMLJzF+fhDf/uKUHhLcbHjIsvhR5vDq5bGyWcvaXpYZlTnm+pGEV
	jfCIdlIldEo7L+4HvqlUWeOyRKyEELShmFqcF1hT8VJalJW6cDqLwfDhtX6QpIuY
	z6rHKzIt5kyG1IiJR6uq8vDrnSLv1YnBwLMZocLjKzPAa77Yk429rR+dhZ3j/pRj
	qpTeAg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2v67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:01:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e97e2b643so6399241.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632076; x=1790236876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=TIgld7Embdrc/cxxAU0v3RWc3O+GqvU6h3N8kEwyRf5ONWuAwBD9kMgwH5d8bz0U/U
         vRjEC+JrEqfFiJHI4KRRNK2nzg+NtsBOSNlXVCOvNARrtBBBUCnDAHIIdAITtBayZqJb
         PL42Mu9pYtLqHnXC86VpJ2XGLPUQVkje3gzL0PFN5qzgGf5mNkkTEdMwq79drPab87Mm
         sIYfcJOZopRVgc2CcjbeoLIV/9AsfB2c9D9UThp9ub/yXXZM3PcrHigGlAtohF55GR4M
         uECW71Ht15+dST5xLn9HrUUmNymBI0+VJLIxzLOe5SlRJq87N5Ufqkjd56L2ZLTFF3pz
         WVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632076; x=1790236876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=em3spo1RFzTxOTIfHS5PnT9AoVkfWGmzsig3jd/TXgfI96GQ4SjwrVIqfw4gLG9yMf
         HqOFGZLDEKqcIso9Rme6ZiLFGeQSkX08Lro255wKcQQv5mU7pWdOfWWvwVk5Yc6OQ9Za
         HWyvxa5kLcd4p1pMZRoIiliqsHWQZJ6hNQa+p2uCHZMxrSZ3PZOrpTs5978Uec68Wio6
         IwqnOPoV6k69Z/Dwbta8vEpb6YJpgzV008whODS95GtWR/xRzRK+NQbnTnWKiHWcTOoO
         7TEn2fT5+jeHnlgW8a74DUFseda7xsogGQ94b17gpXgIGf1BjcAxHBAxhiXUkBf7reXt
         DqZg==
X-Forwarded-Encrypted: i=1; AKwUvBzN+JCiTSLoemMipqprUBDzyb0UHYbURA2pfIx4mqc7yjsH+W7I3J8ynzEiQRRonp3qoSVUSY5mT2aGLvU=@vger.kernel.org
X-Gm-Message-State: AFuF++nCD63c9hFJR7KcxGWN+EG7pNzNrSlXyc1rnEyX/hH4aijJtcd1
	28JQsEUumoqMwCKqcX2Nh1NB0iP7TQYI291kEW1R8s9woA3zEhOJO+sb0w23yPHJqrBpHIcYCa4
	heaqJnT6WPQRFLOSM+czXBOD3OdRjMdKAXqyNcb9hMAm/rBiQpgUuzMCD0Qu3fE2UD4EIM9xosO
	g=
X-Gm-Gg: AYBFou1Px8XmGR7sCyLcLHuAFjQL8xDlQV2Sm+0iizwVs0Q97jdK+GaU4SwXR/wTfdt
	fKSxPWV1yWhglvgh4dm7U0EdpsK5k9O5iJKz3VbnGF/OJArM/iS7NsJMDh4cPcLj10gZZ7BhGjo
	Y3VHoVTaIHihL/+60jc0MQQAOYwbPdFTnwuM9AWDWrdPM8NyfGzLZsRrO8eq280L5V8voZIZMRt
	bUa2JAs4m9tEL8mG5sLAoA7WavxLdb+l1sZSeyhVixDEz2JiLD8PC3+PbuGmBX3TpsCfU/kkb3J
	yDOg/xOVvrOvpRe9NMX4dMKKyNEo8Jnl7Fqn2f56tLvzl0DGvC4cJFQO80FdUYU+ZYj+DjJeXhz
	pKOStp0+q5aklMXszAg8nmQ==
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895435e0c.2.1789632075671;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895418e0c.2.1789632075297;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d29a1bdsm3362760a12.26.2026.09.17.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:01:14 -0700 (PDT)
Message-ID: <d2653084-b3b2-4c52-967a-2b8cc805749e@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX1WR2xjlQZYzE
 BLH7wVuj+Q2SwTkR755TQ5jmXuPNFnXObYYHGFgIaB5A85tKhINQASZO79+RPqMcMNb4xbMkU78
 o4PH9ZoC1+/xDPqezg5LTYg4BpVlPvw=
X-Proofpoint-GUID: qEufD6pFoSBiM1WSZzfwhwjX7Lh7Rpo4
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab9e4c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mAKI-E3sSVMRA5yFQh4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: qEufD6pFoSBiM1WSZzfwhwjX7Lh7Rpo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX0yumbop98UqK
 V1+MsjDABj4K/AqyJPzSLaSWSiIKKoOQ2QqkEMd0PLCwbTFnKwGlJhNmaQ0O9kpSjNjG7HiCT6e
 Sx5PVcpsE6YyPWf9S9IAA2NVa1wTstLwA0GTS7Ter9AWYfBhUU/2ILsDmOWS9YNE83APhXhy/+o
 AqmMowyYvOarFWntvdrqj+dd5sqzN10h9Z0YzEYA6vvkvJwlIelB1/G7t4v/1+Hsj2QBgGUoEB5
 DxrNsSnN0XW+mINIJkfP9Xzx+hPDiPOu05wNB+oARYAY0930zGPvHw99SfEmXc1KSGkTrC/ZuLi
 OCZaN4YjbtivOa/zyVzCHvdpRiHX9UcaZU+/xgKOhZMMZF0+XWp9URFiidt0mq2zp/abrg1IxCX
 Y07ZeVCcWHUUE33FlyjbcjFz8vZ7oapbQGxh3SZkUaJkzxoFDDkeBqeFskJ8BDmtDOKS1c1b6gO
 2AGx1SmT0AA4/4b2D3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170108

On 9/16/26 1:45 PM, Abel Vesa wrote:
> The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
> The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
> rejects accesses to it and the clock cannot be enabled.
> 
> Correct both the enable and halt register offsets so the driver can
> enable the branch and check its status.
> 
> Assisted-by: LLM
> Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
