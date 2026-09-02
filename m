Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFB1F1304
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321745; cv=none; b=n9QPovUIfR3mpl2tgXYrsFIDwAu6Z0sZP1z15+UL6aQHwTVn8rqJxJI9uZH7oYcfO1d+/fZ9nbMqljGeWUsWZsR1V0u2+HVFVRUSGN8pGhTaJWl4F/YCVMQOglvvWg9XpBMDPAmf6JO748jXQSyMCnWTNLlb1wlbgbHlPifwb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321745; c=relaxed/simple;
	bh=Hw1pCWbKjons5MyktJhlnowCAcV8eFfeJO77b1R7qgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaJkC37e5X3maX6a0uuN4Oov43XeVnOzEVcOs+/3bm6I/RGoSTHUqEP1yNFPHForneGg/M9zAWER0ENJ9Xq1w79J7yNUTRFKVeic8QX7jBk9pX2iJ+pGVwRCu6+1ut2vjGApbPJQIEJjmZhh13T4jBCC9mBpGWe6dR5DsFR/1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brKuIfk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+EXNpg4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brKuIfk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+EXNpg4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTECh3484782
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 04:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=; b=brKuIfk2shRiR1vU
	1HoUrB30jg8r6qidhiP/raZCoOnApbVO6JIoNayQNtcNRihs158l+vNd4Y9wPPM7
	iyvtnB0gAJcxPqYA6T9b2WypdV2pWceF7yp+iwwflw5PUzYYJHd5CqWbk65g8VnR
	lR293hjd0EnHJ6ctb5y0GWpJFwilF6ngLkPflIO/XiTg3IEPjVBwBSrxtBTmu4kU
	r6uZUn/8ZGDItwY4Fw0Q5l7OvBgnxJ1RUWLRoxR3yTTp3sVR/1OXIg5P0Drnx8Cs
	wZWSkHXrjMEQoRMiU9X+i52cn4bemuC19oZ7VUNiwUXDEHVjuWBgN2HFTDn2JoTY
	f6etUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435sr76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:02:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso508308a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788321742; x=1788926542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=M+EXNpg4jyjZ01V0KyvMhqi0jrCI/NYSoqlEKLHUQAWXWOJTQoQIKnZWb/+aSOqmOP
         G+tp70XkB/Uan2DneOvcymYYWUKu3gukrXZaN1TiHUhZjsGrWtf5KHDytbUhckOuoU15
         VbKFshKB5XqUpK4oJwDeAuDfR5EJzJFxGBHVOS2kHRuZrv2z90jqlwGd/qvy++37rHGp
         sM+wp85iTLGUEVeZcvQCCRP9WYDbGQMnZPnW0JLBXIoPpgu3cM3ZAXQkVR5Hp2BVAwyt
         D6gYK+3RiXCQaZ8iKrq0LHKVm6wm4RKKyMawsK7lnne/beosb14qdgwbcAYO7NKXxbpy
         u4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321742; x=1788926542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=o4nGh1zfqDEmNmLeS0OUyjjodwGNX0BUdSGZFQkDU8ryqVPxMTV0Mu28GLJ4jj9Toe
         rToKkKlDDBGQUj+Y75+1DNKAx6VrvBCntX4rFsikyfuES5X3bbBMWuOf556H/m6FyfdB
         Lijcb45tn97bQ6FxVpNa2I2LIu1i6BX3IaSl8oBjYwHECmusgvBLa1TogLdmWCQBTW2f
         IvxAuQ1wsq0RG6D363VpOz1RTzxslke5hu0uW6fgNzJ6WVb3Iy1wPItzXbGXJTwwq57I
         veFMgvDMTkoZ5vcm/aCLfaGPLywITX+u+wd7R+SaHbRCsO24fotgr2Oc5sIrG0gGVr50
         hEzA==
X-Gm-Message-State: AFuF++lpCne/oQ3yqTWGB3DqAmXOIX6p+QMuogm6fepCzFxvh2NIYxXg
	xVsX+KzunQ6VCCRoNPbmcppEsxISaO07Vpcnk2QjRNl9a7TSYrVhhPbcWfs9c58B7h9WSOiaI5F
	cFYV7ITOKXFFN5uAuV+km9YlyqS1b3fGNCmQE+tUYRTsNFVhVL0QHRi7irFmllUKyKyU=
X-Gm-Gg: AR+sD12wLAfGQcu/pPFeuHlbgjCLdMwUKtDw+23IHdhb3TA6BChAooYpeh0mHO/ZzpK
	VQMkXZiyWVPqIvHnMZMVUMhnlbrISzXg8Oin0VDKPBYH/B/UxVCsofBl3hbo5ZeWxWz9TEPK3Vn
	0G+C5fXvZHmD/p/XsKI1ozKzrrWNXLm1yIPgFMIbuN/4+kpHTV1Xgh/qkeTMIlc28UiblZu7YAF
	B3L3Fng+PwSw2/yykU/0wQSwAWRQsWm3njp4xDtSQ6NO0/j4owdhDDf0wLYFzvDNAheApJ+0FSs
	C94+daupcvGALqqd/JDJsyLeBm3FGm0lm3ttMUxnKTtjnUSbSKmdohwJDjdnvTk/XTfuQsTjtoZ
	lA20apb54QUO7Yi7ro2wNSuv5ku5r9g7Y/i2XbQJHbjgg16mn+mxfZ9KA2HIailu/tRPbVnk=
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3227990637.27.1788321741923;
        Tue, 01 Sep 2026 21:02:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3227931637.27.1788321741477;
        Tue, 01 Sep 2026 21:02:21 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d03b5a8sm377772a12.26.2026.09.01.21.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:02:20 -0700 (PDT)
Message-ID: <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:02:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
 <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX+Xdx5PdpRLPc
 rgCKBinBH83ScdiIhwGJoD9J7oXmgrNe50PWkw7QqsGxm30kWnCdEt0vrizGz7PKAHzb0E17zsO
 HWqIFtM6o7bBgC7ckWsgulZNDxIpJGHibYXETyDjHBBvK1l9EVr7caKRgKhd/D/lPThxPhN7VYs
 udPC52X8DRf987eAQsMjSafMl+kWbmWrpcN7HRLB0dZfs59cwLMa1iUraAQEIiuAg2v22wtaKpW
 C2uvYqNzSdw7plxXadSe2GI5fcHSIp8QVDcLOjcSHzG+/SPUyjupm+MRaC8IpBWuSCdynNLdZhQ
 OV1VxPYggHT7ZwzwstTxy6k0DxlzZPVoLkLvjbbNsp5PCB9wfIHXyh16EVxaFpLP7r04K4EVPDY
 3VKNlUvk34MBYPEnhC4DbPoP+jJAYFuIuOFc9bK07Bzw87YSB458ij/xlHivS1Hsey7RZA2Vjqf
 AUBXsyNH9wCJ2xymOMw==
X-Proofpoint-GUID: aslYn-wAV0aAAiIcvA8xMKlIs_szXfsk
X-Proofpoint-ORIG-GUID: aslYn-wAV0aAAiIcvA8xMKlIs_szXfsk
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a979fcf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=SqRly4UM2iiU9c_N8OcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX7K3P8+Jib4p6
 awrCrNFaEnDTgNZIfBSYYHn9br6mIyFwwcqrsuhlkbfh6+xG1B7TM8X021wXpMc1LLgSWWZGOS6
 lh4eb5vh02gBAz3QZQYfMG1GMz1VfM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020033


On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
> Setting the firmware log level to 0x0000003f may cause hardware response
> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
> be increased accordingly.
Yes, but this patch is for fw log feature, response timeout value is 
performance issue.
I think we'd better use another patch to fix it. What do you think of it?

-- 
Best regards,
Renjiang Han

