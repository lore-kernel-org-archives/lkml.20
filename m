Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9814ED1BA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474377; cv=none; b=XhBnPUw8jTF8fweoeQo5O73uLaYvPrmOKPigjIrRc+R9HAcxQWcIm/A9DPFD95F7pkvOHlj+hU1izsYYI05LTm3k2YmjzUOEYO0hhdLT1gXFqFZPagIyKNe7vDdODoJcVlRj7yxboMBMEA+lVKMuawpOvOd4DgS0+MMs/xifzJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474377; c=relaxed/simple;
	bh=MZcUM/dJpZ9RFXumChXzGNhuIE+T+u6w9tzzujXG9Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3Gx1+qFYpQ+b/sTmV7c+5VvTZ4GYZASlHJIR3KHD6C9bhYPnO9psDseszNa1JOVUUkIdfODcrb1dQjalGiF8eMpxYAo/n+9DvBF/33G1e9C3AVgEB8VApcqHKbRk+sqgKa0ccyGjVCJOiPAi+NGiNCo975cbV1cXVmpHQaP4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDdlC7KL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEcZTuV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDdlC7KL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEcZTuV0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVPiB3121446
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 15:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=; b=IDdlC7KLsT28Pq70
	Cav7C10horl4ykdp9KDt/xN30o1lwfnsXznhVNewT1tfkI7CQ337bR/X+2EKwtwF
	NFfN2sCP+wZD0KA6y7RJwjRHvftZSPu0o2gczo84BTg+AWx2ng2ZiXY1hcThulTt
	o2Y8lp5e1jyDmiIUnVepUR7GTq2+JdltN/bu8Q1mwhNil/Zv/lkPL7XSHFybSq2t
	RpLPLN/c51OsdkuXSFYcb6iucFZV2i0qPaeawj+4HIFlTZPYiSebeQiAOUotbQCV
	iUrth8CRiUGQ7OZphJcLiV/j//H6lRwgcmmKREZ+Syds6hAGERztWtpsbWwTQwn+
	SsGp6w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2upv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:46:15 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-822121639b4so9058548a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791474374; x=1792079174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=;
        b=PEcZTuV0aCN9Rew6lYhzERh5x3ZhdP0MW6ywf2dNWcCjlgW/sa+PwN54Yo4JfkLiRa
         Lu7zv2Jm8cb9qp433c9CO1jPg7dzsUIotm+BHV4vIKdftwecB7dgkLv6WkyXHdy8TDvG
         sHKZBs15QxSyZ3V2yyhIvkEZkjjMKIHHLtAdlHBVnGH0vDB4p/NVA1hQ5xg5vl+VudPp
         +Em8h/DjRSmU4KzumvqskxnlZBVZIhcQewzMk/+nJqwH1fvpHMQO3M2ru7qhyy6Z/E99
         dV3SfJW6MPiVYWqULHZOFMnUJM4TS6ery5EpvLjyK+zojFyxnVyTJ+eE1BakUri4SGZO
         FOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474374; x=1792079174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=;
        b=alzH30ksZaaJZSdfSn1Qb2ICG7EIaE71UCeD4iCULggJus/hBt7U1+g7muws3Z7gVG
         pre2IlFKXGPCv4nszvBmyIDTI1bqeB4loAlgnkBTm3OOmVsgdU2bym6xTA3TWhLvj5x1
         d1iTGZk2Es6ez8oaRUTeaAR6C8OtqvnPvX2nOWFq8nKWupo1UaD6BFPSUnVG7/HsiUHN
         9RAd69weWyRmCwxACvAwYtJZzN2uLDpK6+RNNF2XnoOApZjBrj10Hsnb6HO6DyeFVNvK
         Q8WifOd4w1TA5mErUUy8vrlDrWaW0pUCFEhd/sh2Qh3y/3egvnUnr7v9WCyFw/8qOY7s
         Rg/A==
X-Forwarded-Encrypted: i=1; AKwUvBxzxiGcUg+ZMvQIQavOrMEOSz/Nkhg0W2PSOdOYbCEhdTqRvZ2hPCxXSB95zxlmcj0lgNl4w1IRG2cBxp0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwYg+nn5sYn3BxKBi0jeOJz9L3frQjYcVr7ICNNbvidjWrIgHa
	lml8jpel7zPDll10Hxih81NQpOn/hGlLO/ZWUdUoopbkuHLWDpvZTFv0XoVyMXxqgn2j2Lq/hdG
	lzeHJx8lEKIs3K7UNfwREZKfB9Z66Kf9srGlhZc4swvkP1yD653aPRtHtIqivCzji49k=
X-Gm-Gg: AYBFou1Jmhz/wZKw100cBc7mihe7SBMz/tzvBLCTXWQjG2huWduf60oiHPksBnJLLRX
	Mk0fBCRX6I5lvutYtoJMjZZtym32ORelW0kC92+LFV4XrGZ564KE1Q69BtXBq92CGn2aNJEGPXC
	xn4joZo7hp7YBvc4i1iMh9Ho4AMSzBPDkytcwSbzUVLeNecoII7+96AokcZPeZhXgWJjIhNaSMv
	qjBW0QNYbCO02DrLE3r9RfL8DX2bgwSoFqgzL8EN2CUJldd8CNTCzJTY6sjvKAL5NVSkohshlBZ
	3Prch0ntJZYXMf5ZvOTPIGsXmXsmLp5wWbyNfIq4xY0pmyipLIQOWhP3YW7L/kiEPjmVffxPD36
	a2MlgI6qsPgGumC7Qxwc3hiC/CofJNzFYQcfSGOHZD2I=
X-Received: by 2002:a05:6830:2b28:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-82acd86affamr8593975a34.2.1791474374491;
        Thu, 08 Oct 2026 08:46:14 -0700 (PDT)
X-Received: by 2002:a05:6830:2b28:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-82acd86affamr8593949a34.2.1791474374041;
        Thu, 08 Oct 2026 08:46:14 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3eb1d0sm5702069a34.10.2026.10.08.08.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:46:13 -0700 (PDT)
Message-ID: <6de89bd9-ca0c-439b-9879-00d0cd5cc706@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:16:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count before
 saving
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261003101944.596546-1-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7bac7 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=CgAF95LDYrE-zO_MwBMA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: KwbxV-1L2_BBKUiXx4zU72WI1HwOEqAV
X-Proofpoint-ORIG-GUID: KwbxV-1L2_BBKUiXx4zU72WI1HwOEqAV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX9IshMqY+dfAj
 aeEk0NyQmZeRwgU9FevssLiMZXXZFVQOYevPzxJJNEan/FyOAWEMMqWwXmEFprxqTzfD62zjkZE
 KaX7MhnvfkJjjI0WUJq1shiws2mmAZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX6pXgTtIYtGi0
 TdLTwR1IVLadgBJV68u4rQn0FgW5B6o+tgMEdQM9BCgCvwszeiFY5QWt7ntp/v4PUfBpf0BNm4T
 3u5saAPHiLxrI+cj1BH0g0cdcstiVr5JytgEHo1vlnqdYwdxmcJ3BPemLFV9DR8l9zWxAHXUOvY
 4RELHfl5lDs/JnrOgrvgQgcn1XYz30inW2xuWGrJq3giUPGvr6De32Qqp1gHJV0jgNkAZwJq2zu
 TDhYtr0629441m6vECssrlcqfr+cqCli+Yt4YQFm4vrIRCT4znbGY4amFURIGbiev5m2TtvijLE
 VDDANdEPLE0b/q+eA2G/O0M8al1zzl1xeCIgRe9oFshwwW6aHYe4yB2HgI06OT/fAsK62ITG/oH
 qDsIOFgsO7REzgpmf6fO289yD8TNYN3ubS8yelGccjnOoys1LwBZXBmE14lXV++jJjyWE3yL+yT
 brUQ7q4iJWixjx5ZOzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080062

On 10/3/2026 3:49 PM, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> ath12k_wmi_mac_phy_caps_parse() allocates the source array for
> tot_phy_id entries and rejects excess capability TLVs. However, if the
> event contains fewer capability TLVs than advertised, the remaining
> allocated entries stay zeroed and are saved as invalid PHY information.
> 
> After parsing the MAC/PHY capability TLVs, validate the destination
> capacity and reject an incomplete capability list before saving any
> entries.
> 
> Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
