Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EC2D77F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510823; cv=none; b=Tu2De207bT8JxZXnZnM/OR6D0JcfIGGalKvtzpmPz8k4yQM91IcORN/MXR7UG/YYCYErRfjtH/KUVtT5hIOZKirVsxjokOnvmNHl7v11MaJGK+HhPzNl5RcFl81EAiFFiKd19MeuMiQUnKFbyGk0TABchAzJZGQytMqyNL4cboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510823; c=relaxed/simple;
	bh=nVTCf9Sr/vq0ORJbBuTYbOI5ril/AeAbJy/T92yigrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRCrTFbu8E0oOHe/rJOi9+ZrqsElbuAoFzx9UCxXzZDwaCbVDK+KaFt6aKTzeAtz4MbtnYs9QfVD5bmrQkdm4h9rybjG6/ylJMu1O6mrLL4AdnBji0g67LLvTW4uHQAfBys15GP1xKcT8HSMZfuEY1JXzB3CknCvG6vOEgRh3iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYoriRDp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6hUA6hx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYoriRDp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6hUA6hx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PxcI230816
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 01:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=; b=hYoriRDpkv7cDPRY
	qji4J6LUI724hUWhFWHG0bwl4XXTLcuQVl9OQkpiyy/xbsAowdPhvpdxf2GIxiq0
	V0x8bQpGTufaZEZtXmgjqtvqNxA3o3tq0PcI8VpK1mLZbl0GqasppaAdyLeYNn5X
	UcBc7XK8QXABAyl11m84hJSOiTZg91cFYqLZ1vBW57FiqS/9ojSJGLOubEqBxWtZ
	8c/FTyxdy768AXUS3PenFTFtsW86wYJL55SNoVhV1WXfdmX0KGrYq5D7D8VemXRb
	gOOWg2odUzAKMxecBo5YifCdnhx1pGOeq5CDUxZMrsnujI8+3MMQcBF357auJVsj
	JhZxvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2kkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:53:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so7255040a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791510820; x=1792115620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=;
        b=J6hUA6hxGPD8iLuRLZS9/zQHQyesH5lpQdsJmMzrireKv87fygG+KmyhqldTevnc5E
         E+oHuQqU7IWCIE6MbPCRU80KeNmenSTJLP2n4NeINkIKYSF6BqB0LK/KYRzTXNRiIrbl
         xuQzq5+QMuZUH/q8ncwQ+zZaAxCpzDlo15VjPoki6ByyDqkD3CKtr1SL7FHOgfFTbvtY
         2L1k0efjjviRrginIXoIeGis9F/NDLgZcX4UZmxv0xPsnnJp4ofv2849QXHB9d/xgSIe
         MWEdtZAewHpe8t+OT5pFj77nISmmkS7pv33/tXZiBaqroFus/duVL/714m/o9y4TaGXB
         a/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510820; x=1792115620;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=;
        b=tkRv17OkbyhajsFibRdd9lPJ17FdZ0yz9OualwZKndmZ7fGMV6jX2R8PZDczU87UHJ
         RNnlSudsq1JxR+bN2SkjIic5Jc3BXAoipg5NwY1jyi2Z4L5GBidPEKs+olT4rRTFdi42
         Zfxnadxff9MmLKMfcAeX+h2+k/YP1xvD5BigBU30+p90z8eFi5685OM1WCiDqVOF/ASr
         /wRD/7G3uajEWen39T7WIORLw25VKsf5TjvBS15oEkRcpwsm/nGVylceekFAhkQZzPUk
         tWP5qMu9MlUmxuIpAmqbrOqxYVvYQFneI44/tm2QF63rqGUuj3yCWb49eUfm9QIjHt11
         sjxg==
X-Forwarded-Encrypted: i=1; AKwUvBxQcdb+UBWn7189e4/J32c8YDIIeqvAUJ21+TOqlFIPMqrbtZ0IMVXQZhG3brCX9akgwo0LzCnHleoVYqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfK7serhzTSPipGkLJM9bD1pXwO5jooXNAUwHCF4y4DeSNLTRs
	uyXBFtDpjVUqmKVOSwFNiJR1UQqVl1OFldFC4QdsKfyl7JULKUC2Kqm7PlnGNxG8BfM6i+7wYrK
	eptl8rR3s1a7qIYQiVpMXtGSkw+jfCLLHdC0Wfw1pT3JT5h5n5RjWddWLNlJ5S3O5BuY=
X-Gm-Gg: AYBFou01KADWi3KjXzZzRoCINC96Ttp0mX/ZcRJXFILXGV+ANSBj5B9nfq0A8VGDgGD
	ew/g8zLg1NRftpYaDq0+pX/6l/L8iS+ktHZK6W1XehbUYLJCLy1CmFcy1+uq5kQedj0edQJnlnt
	EPAHHd6wXNo0u/z0E0MgJAGE13CbOsg9ZOygQyuQzlN9mL9zRrRPFJXqj1iTc8uydmKrqCWlf1H
	C6wylqOmyZTvB0zW+m0Y5FwlP2kIlL93pq8SKWUgaGYtXGcREhoIEWuKvvYMK9kCDLPsGWZ/QyW
	K2xRLlrmZKM1o7jC7wXh+wupfHmBI+gwTJVwjNZ85BvcGvwe81Q+1XqqzHVwUo8Pnnph5dP74+g
	SWHGQB2pHHtTIeG8kCynN3oxCneqXRU6uZRkepDe82OakQwE0QiKiq1g5+wdBCd5DN/Smu/nJ
X-Received: by 2002:a17:90b:3b48:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3ab3a90e82cmr527132a91.11.1791510819943;
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3ab3a90e82cmr527118a91.11.1791510819521;
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm848786a91.1.2026.10.08.18.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
Message-ID: <b106f056-3384-4576-be23-590e57eaa829@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:53:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfXwwa+hs7suIrs
 iAKlBRqLBn6QKVfixcWi1gKUSHp6Q4dHZsPMxslONMw9RlgyVP8rVFt9taF6982twiFDUJEAwd5
 sVlXnZ8Ld2QLEmn488l/nA74Eks6Q6hEN6se3gspxqorqyQ56/cCXgo/UfNeeRFd3didXG0DzeP
 6Gdy1yx0uB4HDV74qX8NO7O8//EpDuKPn5vle32oCP5adToefxKhGfcG2R9NVcQZvdH5Kl6kdJA
 OLlSkn+kUsYggg77zsB3JZtKstOaezgI102xkMoyQUVPFxiitueCm+r1blumK8G7hvG9Oe1yHfM
 7Fc/bfIp5kETip7qirwPXdUzEkrabPLU20kM6OOQmXwjDevaTJo8N1tcjfWLkZucsIxR6c3l/VK
 rBkx44+oPgK4wbmT19j+SLsdSGQAIDDtI54t1SVVdynb3FleqzrbZwnO46jk6oIOUjyur5V9TPb
 yE9yVtBej0Incr57Dcg==
X-Proofpoint-GUID: c8XkTPPIWjChnjeg5Zv9cb45wkJrUDQT
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac84924 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PJ0sSsB0_FnI-LRpuPcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: c8XkTPPIWjChnjeg5Zv9cb45wkJrUDQT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX7zhgosXrOIUP
 PxCfXXJl9I4rKJrzsWF27pmqo6vMlQZa4MVavLeqFCiXa8oS1E7kN67JAePZsTJ4JiDtAvkSPff
 5XEDaGoUEfyehIrkW1jVCQrOMDiG8nM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090007



On 10/7/2026 5:23 PM, Aaradhana Sahu wrote:
> The RXDMA buffer ring size is currently hardcoded and shared across all
> memory profiles. This makes it difficult to tune the ring size based on
> the requirements of individual profiles.
> 
> This series first makes the RXDMA buffer ring size configurable through
> the memory profile configuration and then increases the ring size for
> the default profile to improve RX traffic handling.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> Aaradhana Sahu (1):
>       wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
> 
> Pavankumar Nandeshwar (1):
>       wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
>  
>  drivers/net/wireless/ath/ath12k/core.c  | 2 ++
>  drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> ---
> base-commit: a90ebf2176db07c5d91e0a62e15ded1fd50710a0
> change-id: 20261007-mpp_ws-a041d5cfac9a
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

