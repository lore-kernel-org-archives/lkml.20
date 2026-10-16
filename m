Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9231E83B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147563; cv=none; b=qtutkY1SyrdEOYaWf1aUIZQxEqgZt4fxu5kQHD9RRq1cWw0CqqteiOxhkFJjoowfS4Mf4MVShXUg327xzeSYQa/gQxoWTXhPwklTAGrlMU7aNiaILULftiRo3BF82w77jXlYTZU7By7K9RIX4pcnpw3Wp3o6jsnR7eDCRZLVLBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147563; c=relaxed/simple;
	bh=mRnDU11dT5vxr36UinnGYhY78N0KmEwfnFRcvyJODck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvFXgzYF+WBqBg3AJu+Xo9xyo3rxxSNT2TAp9ep2o1T+mHeA5/wwG4AyS0vLscK9BvCbqB9/VeTMzS9Nq2WYD/HSl+ETCyHNqtf03hjSVmFclNYptlyQgHDFgE53T3fb8HsHFWuGo/whON9c6uQHhenBEXoTK69f1g8JNSONGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnRRLQfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5zypVTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnRRLQfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5zypVTW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAACOq1104708
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=; b=KnRRLQfX+76yDvTu
	86kAqpsiWrf9wfhwsbmwhPJMWr/ZVO6EHvhsmW/+n2wyexRibcZgLsLFoJgjdSCA
	t4H6Nv0j6DzQyYymyxjWLVIAJ1qprt2eWCYCIX2SrZ9Z3B+SzUE6DLVESLVbsprU
	SL2DPPqNShZiDlQd/HNimBnFhlqa0bd5zj9n/6MtGmRLUCzIuPP6teX0UIfw57gP
	hIbEMrAR/4ghHe/wGk1FJAuCFrsZXctgz6r6Fge2wFjWvqFMv9dZZQaZ7VL+ixtJ
	IBoo77XzZlRcb+Jm/DF+t54UB3B6ogmE09iuzN9Yigz8LDf71JLM1iEDku5kXs46
	85kZsQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3bdts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso676869a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147561; x=1792752361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=D5zypVTWnvyg+IKEyI4KW5MfLrMcNXZwSYPpX8W8hFR7w5fqHI5cDvei6ce14HRiKy
         uCV5sh0BhJHAQQvuYiIPWWDav2NRQhZzgPXmGhj8yYTbh4LYPIvTVBj8KNzhmGibxmjN
         Eo6/30QuXL9XvtKkVWqXHx3000vPeIxq3KEZZ33PmPjOKRwEfTToqgTvqrZ0PL+3PG6Z
         dCMQdbfoVTEjv/baq5NE/IOLRDZCGUePzNOMKeYbNvwGYscAjGmc0XuMZmkFv9KwGEbw
         dgTsXob8gGiTtVf+OF1680JJoxTp9nTuc/bDLiIrnCkIEd4Jl2vOoSGu5IEbG505+Zkd
         gMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147561; x=1792752361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=uu5RuhFe8mCzjXCucxIvCUgL6UjbxAe13sqVuP9eb9OZzmdTjhQLXLbI6amWgE0mx2
         PuqAB0mfPD5egaX8QpLn4JWEgSJXfG1uTmbrgsuuvId6oo8pgVycPr/nLVOpwqUrkBar
         schmqqFM7ZxTLN6CPQsYhV+IO2KqJBRbRHm20HdEAFrxe+jZQUlRyeA4nhCxDZKYQZPZ
         TWN70AJRFRbg/eqmiOUvitLkX0WmFHDJx05lGRNfk78y83mGmaG2kUqmOGtSOD2VnWs6
         KON0w8PyEEpqZMbYlzMANHkBiF1FxF6L7VuyJj3+JliTQFMjaJLoWF1MqKDugVPdaK/x
         y+RA==
X-Forwarded-Encrypted: i=1; AKwUvBw81ir3kdFHR397CmnKm4xXE5jJGYMgNRMhNNHOnAmnUZ7mF7PODi+NuQTU4R9LalE+MRhcLHOEekeWJjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgiaPL+C2sp9Sq/agdznfkCFENrtgEpazUyoojvZX6Txg4AC3O
	V8qFuFFMICofYof/QOYMP5M/qYnYD4j3bjidFsI9zUWYQ8YybFElwuiq9THb/BVCS3trdWMGUqh
	WCkQzafzsjVrsBRpKreAT0Id17BXV2lhwYg22b+Q6mtZ8u9YvV4SGujDd7ekQe0jgn2s=
X-Gm-Gg: AYBFou1nD7T6Edotl0s6e7byeXAPu4AJBLx7AH+iyie6MymYoG4Vh3Q9t8gqiMO0Q3s
	pHWeojlVoGzREOGa1HNZ18er/4AoUkt0ttc1wMxVE88taxcr1e7gVvzqdpi5r3Qgmq+UxrxvptO
	XQ0eaXEweSR+H7P2Fjlbu6Kd9OePvy1e0gLW+7dq5n5c+KQG4FVagmAailh6FaRX229m/IXxIe4
	SiL22rwDg53Ucr+cQIouQSM/IZ+T0lwjIhNKJ4JbyVyajR4/aHhRcEZ0V0U2L2qLCDU3wsrMCff
	Ryfes0ER7YzL0qkjTxvmrXOQNCkxp0R0jRtrpGy50djUeUtKsDGwHNGvvNuRgkxQRe7BJXMcyzH
	5VDHOTXv0XCR7kmKn4UZzqfhKhUYW1NOlWq27tf6muk3vx2OTQ7Grjqv87FahTN36vPuRJMm7/w
	JWoAGd5oBaQiLgoWQ8BbmPPjM0ny4=
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991658a91.35.1792147561534;
        Fri, 16 Oct 2026 03:46:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991569a91.35.1792147559753;
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm8694482a91.0.2026.10.16.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Message-ID: <05680cf9-eb58-417c-b976-027fb6267609@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] arm64: dts: qcom: Add Kalambo SoC and CRD
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX0duaCaTrSv8U
 7J4caR+vRQ9jTWZrDksBHVadzn6Vw23DnK4OT8GdZV98NlOVy2bJHRPGLPf+Z6hJ9CBg5kUtFXE
 9PHQU2iDYVkEwF65rWJBkPIknHoiEZH8IGkLEXG/POUxm2muMnKsC/5hpApuTwz3hiDVAP2xpY3
 ok/zNGFKpNEA+D+PKMDPTzQRBe9tcsxmxWrNvJbzPS/1puG3zXdv4NDYVwZ35B9CV6to5jzMTBx
 0fa3chC52YqUU5YG4lkQCOxGVd/3NtsN2Th41BUM3x3mH5W3HUXeEL1DSNAf961euhxWMVrPqVD
 b7as9T5ouUgdGKXFqxEYQiD/7NJ02T6QNLjsoNHsIcCQO+hUwYcwb/RgD4q5Tti/UMiAIu03Ogp
 fvubr1wdwxYt6N0jcanAX2lEtsE6948ce0/MSxV4xUT67hfFl8BtadHF0T8oPN0hS5KqrCFPnIe
 cIGetPG19iGiuTKW4Cw==
X-Proofpoint-GUID: mBZKTGzuVA0f7m-d1-4ySX0hdVt2-M3Z
X-Proofpoint-ORIG-GUID: mBZKTGzuVA0f7m-d1-4ySX0hdVt2-M3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX1Pm6jxfnXCfz
 BMJAJFJ7x7D5FurGKJzb/a8zkid0HmbRFw6lGO5mjFAQMc0NHCctgTvX+/vyTVX9jce9gXSDBqy
 qRVeQe4rLaqO4TAdzD6EVSYdSlqILao=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad2006a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=94Q9wnbR4VJZ0VN6m9AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042


On 10/16/2026 4:00 PM, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
> removed, leaving only cluster 1 present.
> 
> This series documents the board compatibles and adds the SoC and
> Compute Reference Device (CRD) device trees.
> 
> ---
> Changes in v8:
> - Rebased on next-20261015.
> - Dropped the DT binding, SCM, and UBWC patches already landed in linux-next.
> - Retained the Kalambo SoC and CRD DTS patches.
> - Disabled the unused bwmon_cluster0 while keeping its shared OPP table for bwmon_cluster1.
> - Link to v7: https://patch.msgid.link/20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com
> [...]

Sorry, this series was mistakenly sent with a v9 prefix; it is intended
to be v8, so please disregard the v9 label.

Thanks,
Gopikrishna
