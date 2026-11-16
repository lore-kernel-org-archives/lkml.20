Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841211;
	b=m1QqbDqfkbysg5VZlUDGEYGYz4xXFaeiRcjmrKkM3BxyEG5JRTlIstIRkInFgGsNpAz7
	 N2raTbnb2rtPkAa6j3UNVSV4nKVNBGxgXcNO0rL/UGROQQOK3m9SJY/gYV8g6Zy5wpgpL
	 QtMC0Go6BrWMFzY8bUrRIN1wtD0FitRBlYfXJzvgvHQCnEMbrpII52dAetUznKdWEQOFh
	 PrSyf9+EqgDppb1oVneyCKxpk6tIs0N2DOHFdy1eUqs1xA0cCNun2uZec1wQtdqaZAytd
	 hvpUDGMx8fEujq4UwnA5HG0lL+/XUm7nzqwGXPMfwE+rGKxDJXbv5yNMUNZqzAdwBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
	b=cyDThD4LuJhkvL2IpvbaQL2ZQgxepOOW+BO687Hpaj1l6vg2/YBYaKGsQ6oEJF5ImgP1
	 SKU6id0qZM70FMaiZ3/2U9WtBFzLpT06UAipmdexSYYqIoGgqe3j0ci73v9VH3m05Lv4y
	 Z2W8syzHo789KpSrCKg07lQWlUeeAboBkVN+Jn03eBD6wOHTz8YaUWNW32gDFnJRwpNjp
	 PHQygFMMFcI5BX0m8KuuhnEbd8Zu6aXiy9Oc3+LW1x4unt9EWeU/mihyses+cXEuGgfKb
	 GjPHqDPU5Qp+dWQJ2C5msoopXpJFJ1jjZWAqoqdaXqNW3kruaB+gk0EtA30fxL0E9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChRX1BFy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRhB7I8+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAB606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5FAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChRX1BFy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRhB7I8+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrS1K1249275
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=; b=ChRX1BFy2FuBC2wv
	GnoWRv2rK6t1JIBQ8R0clsS10kzhUo+TE2gSMk/o/sRjDxK3yKEyVYWMOyXAFS5W
	ER9y2zR9uMtHZPkuJNQYa2HczEapMFKGMbg+WrOX6y5jY/apt51240IWCf7tSC5v
	c6WZcr1XILQTo8EHCmEQ5nw3ojCxS2YiIcGOux+OF8nr6Z7MlNufWgzYoOu9y7kD
	FdnG2BuKmXMpc4kzCQpMn4O8YHbM2wpzP6AZ4tX7eHHFpNZexT6qFERV3dwCH1FY
	dmRM0d5lnFRr+iFbKZfp5LRkyv5YSz/G1m1Kd2kzk5QVQRGOVz34MQnzob8e9iNW
	q4SCyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0yvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so2329265eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841209; x=1795446009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=BRhB7I8+Musb0LXMhb2GIe5HNIc3lF2UW2+NPILqN70Uaip95Jr8sjhYtVBUkkH1Uj
         LnAusA1j4rgb4Fy9xcNTWTUi8CNitgUk9KiooQ/7zFxbO1/KU116JEb4JVgWnr+nQdzF
         uKmuD2QyHiPj8/gNVK7BJE2NZ1xnbWNQDMpqQ9+8tIU1CKR7G+sC9LIijezqWpUOv/Ox
         SD04yYlloRDT4UOPkvoashsqvMV0WiyZudUeO5M7MtqPF1qSO9pLzuWDzBfeGBvOfEVD
         P+wagwtmY8Ll5Y+HEzPivMjssMV638zTmsLlmTrmNP4AoRV/Gh0fGdg1c9GR2Y0rN2Su
         8crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841209; x=1795446009;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=2wPKONf0Lndiki4NNQe54q/W32LC0Oi+YeTe7pYiSgAG6ZPWjuGfiKgD6RGPYKapJJ
         f2r86k9tTJ4fz+PmoZB1awXPj7SJ0wCL2bhkx+3D9YTePNRcQDTYBtVQLL6NkSNojXUU
         iEvVIiItafT7b8iXKx4hVsuS3C8CPBbxFsPBfSrnp9IwAR88MhuXEqgFDUsDtriElbFS
         exPqv/nPc/hgP4OP/cLZfU4ZczBFac2tQhd2r9U3SJMzhAEjfoM92McntoUcUEQERiuw
         TWmrfyF/ZDUruoKyIvaiurp5Q7ePQTQJLFnsNBRela9DfnPEeWhZKqamqpuPik4MA/sL
         BuPA==
X-Forwarded-Encrypted: i=1; AL+hErFnIDUnVCmuoxoXBww8EK69/Xc6n34M8L0bv/8GnVM5/4z+aCnxh8c3Gw2QtXSdK2LKrVRaYlBBag4VctE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U5dKywpPq45QPwQOGSzuNoj7mUx2/Jv1T6x/bSyMSSZAlQ3xc
	5sZ0coxRBBvOP/WSW1NxrCRw7JjQAmo6g5iZA7zaiPJH7f/WaE7aXbB5lIEVPBFBPxYJ7ZB9gBf
	FluMPQOe9W15b9tKITMMPgS/H7yJj87hRHkvEk35Hra5s3IGmJr6VRlmQ8GJp9UKHrHY=
X-Gm-Gg: AYBFou0Z5sQc3t21HnRJ8u4DBXLtO+iDRWKM8Y71gEXeax4tDli8OALSf+F+faK+h7L
	SyFtsTLx7xu0E7IY5cr+q2Fvkp4liKNvbPXnS0b035PMtkUIZfKbFT6yDGwySw5Vehy9/fJUNA4
	C61UuoLhuVp7ePwLMbrPM4Q3uZxP/HPVY/6yhfcYSJ764ApJ6PREHDXYWujdts4ilaX7COx7/y5
	Xo+T7IsVbUHXSsHIr+e47QK2EvqyEiZWke43k5663xl4YqWCgUh4DEoG1yMcBVwH17rCmK6Il00
	sBSGjQes4Kft6j/PWphOXdASHeYP9XAv8zx6kGVrMAewGt6CwTVEgwWxGwY0mQ8tkwdzXRUbWVo
	rFxfdIDwZa3VBViVAGAf7OMIU5RP0LZIpYKnR6VibFVW+BhdijDbU4CmMs+sdF4bxj6pmUFdHjU
	Z6r/0DFmuV9eriDQAXXOo8IdoShZH8
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725384eec.14.1794841208813;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725347eec.14.1794841208111;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm35495661eec.5.2026.11.16.07.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:00:07 -0800 (PST)
Message-ID: <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 07:00:06 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXyc7Gooi9yFaO
 i42v+Sep8kI7MK7OLpbKnO3dGF0jFW7I27qcgTZ4Iv6D8v6+uU4JkLgg+lT3s4vfowJf0hqlylJ
 Lxy9Q7ND+BQ7n6xpu9INnlOfAmf6Ep5CFtwmlkF37uBddfnVqH5T6RorQ9hEUCZlIAewei8o3z7
 nHsboFcn/RqIHUJM53zd5qSnW3P+0erJDHRWvuUqX72rIc5hr9wlRD3wJ35jtEUpmDZ3BXz/d69
 ISpgraP+eNlMongH6Mo++BgIqnI4IWytKS7u6KPHbZECau2u909eGu+bLsrUWwaG5vFFMtmTSGa
 /v/9HLj2vBLcodqwzaR+xYBT2QDeX0/bNQmb7yrHOrgQCvkeQVPf1hCvNFxVUVgmtmixQryTLEc
 LlfdBmlZDOzeiD/l2GEw6GZHT1pcj4aL5uzelX/0Z9/Yx4+pM6rXUcm2zbL2PjH2B35AX9itgHc
 5NaUBA7fgZrs5yR6ODg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX9oix1Ha4Od98
 ulaeJfsAwBXI1Lj0b2oVnPqLZGThfMZnxBdDY/qoZbOWfOwjdSqPcPpM426QGcumjxdi0f4bUcW
 rTt5180/jMXowxlqK6TgUyx4dcsxgak=
X-Proofpoint-GUID: WS8rzpxmkt3R1tK2d0XwJmlQzwXqIeGI
X-Proofpoint-ORIG-GUID: WS8rzpxmkt3R1tK2d0XwJmlQzwXqIeGI
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb1a79 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=UiHtVcSbJgHVZnjgSQMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

On 11/15/2026 7:03 PM, Baochen Qiang wrote:
> 
> 
> On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
>> From: Christopher Griffin <christophergriffin05@gmail.com>
>>
>> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
>> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
>> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
>> station info without that lock, so a station dump that runs while a TX
>> status updates the rate can copy the HE flag with an nss of 0, and
>> cfg80211 warns:
>>
>>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>>   Call trace:
>>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
>>
>> (the line is the nss check in the inlined
>> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
>> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
>>
>> Copy the rate under base_lock and report from the copy, as ath12k reads
>> its peer rate info under its DP lock.
>>
>> The change and this message were written with Claude, an AI coding
>> assistant.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
>> ---
>> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
>> warning in its kernel log; the cause was found by reading the code.
>> ath12k already reads its peer rate info under its DP lock.
>> ---
>>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index 1a237adaa37d1..d76eeb1ca0019 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  {
>>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>>  	struct ath11k *ar = arsta->arvif->ar;
>> +	struct rate_info txrate;
>>  	s8 signal;
>>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>>  			       ar->ab->wmi_ab.svc_map);
>> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  	sinfo->tx_duration = arsta->tx_duration;
> 
> arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
> ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
> anyway, moving those two reads into the same critical section would cost nothing, and is what
> ath12k_mac_op_link_sta_statistics() does under dp_lock.
> 
> Not a blocker, fine to leave it for a separate patch.

I'll incorporate this suggestion into the patch in my pending branch

