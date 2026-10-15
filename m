Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FC2561A2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043757; cv=none; b=pAA3owV4en9kyBP7AJWHe5T5EDKf27mJdZnUbrz3AHHHFq1C22lkj9K+/1gf8J7nmq5JxyUP+0FZrG0Ky8v+gcwTM4p1jfnDQKMiAmPkcmjZYBbUbFCWZlHwxbuxeCx8LWcGemNcfYondQJ9CLueDVhdVF54bI25RTEzPopZpEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043757; c=relaxed/simple;
	bh=POSD5JRvRWaHv19KVClcisvRnC+h0J9UC8wZvw7DbJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPqEvu0DPbd3j1HGE4o/cLbrdRcLTgkEq7eFttMCC654AEv4AyZeGROEMBYLD6fsi8+SnBHzLkKquWbdLsfrXRRLd4LEG1a3wLBx5ykXCK4cfcNXQN8nnlOx5QkbfaOw1iqJK6Xk+6nQGjKJweoi+Rnk84mvNWT4YuYdlJbcr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYHFVvy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWxkqeNN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYHFVvy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWxkqeNN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F09VFH1672259
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=; b=DYHFVvy/G3u1EcBk
	P7BLTsjnjKFyK9oBKSqns1bwaN01FjrJb0ao9ZwRQZA18Qf7WXgtcQqkfDiue4LM
	j8uW1U6K8OrGvpMaO0xCXvExR7OQreGc5F/5/ydCaIHYTEWv80RH+80yZt+JHd9Y
	5z0d33HFvkHRxtwIIyWAb7vEkAbgPt7D8le/dZOQ4iYQvEvjNCo01dOpLyFV9HEL
	BNi5j/RGYyUbVZekLYknqNFhYE98hF+ivXN85E8YEE/WjG1/BIJ9Ku+8TEQsYppM
	ZBSjPjvkgQu4fp8C4wFMOurLXf0shpHuJ7dxtBTU7/fJOXCk7y5saCcpGBEHL9Nj
	fx3Dzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrharcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:55:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so7037265a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043754; x=1792648554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=;
        b=iWxkqeNN+Mz4Hre2F/NAEzago5bRh4pZ3uTjghtJ7uHvn+nXsecZY4e5kgCIif/ir5
         sJfLEqpERJ7Nb/jycAl8J+0qu8qLKu0nPF3CCbX0UosDWEDyL8mHkPWoTAhk2tGZF/O0
         0oj+jtP+27C7ascx3BiEggDpZLJfl2u35ezSU8xTEpxWAev6UEvZlVHoKEp8dTbx0aX2
         pMqz7E/CHL3FV6XGzSuUHnRoIKPe58A3Xz1n1eJlExBeRRFwdhkYnZC5+niAMkjlnNXh
         5pgVJw601xBBF9WGeTqJc+lRXq5iUFh5YmX3LTinUFU1hytNf5TQdVxBu03mbD5nFUk7
         ufTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043754; x=1792648554;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=;
        b=I/NHLnPV/J3EuJ1nUYUNAId8xWepRrG2DjUpRrjh9OWfTQOCY1SY4N0ArqRnE4B2+G
         p+f+FvIq1eaiSBhe5YZ319tEcVR8tLc73xxtltyBHGUgcgQKph8KX5CT5wWYAhxSN4VO
         Q301Ur6t7bgGVQebCcnXSW8vo8PoWoAvSfVrhzmqoyh2ugOylhhOaeb1mNsxeZt4pCRN
         uL28cp+MADqCeBGCDQbX0OCuoWMp83WQbnN8xuTZ+XvdV7M2kxJ/fNzHxnbBlw4/RMcY
         ePuLzzlGFsYbc8gtvAjQmT7M8QhoGv3J0yv0v9dNml5omNpT9tp85oQ0kQ/Iy6jg/rLi
         4nVg==
X-Forwarded-Encrypted: i=1; AKwUvBwdHMcvCRRrJDR0n8mzaIX4tpq5ZarQCqa4ZJ5hGTAt42U7IBEkw385pkV1YQIswGycDPCZwGJPLqRtHSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcCCKZKF5O/AXUWE495rbH2zBZ2Pgf/2a+Jg5u4piWvYzSUUXI
	agTJSft5Zbpr2WjJw3mVYT08mVdHeD4mxb8nQHscougWyB2Z7reXIOzZs217jl9EHtYqZxIeYWR
	SuGxqsTzeUwkYFQ3/Taclk/Qe2XU7hFiK4gODiDFUeXLHQn8zU6LPsM++B4B8c6ldQUc=
X-Gm-Gg: AYBFou2+m9Q+5yRshiaHnORmHpjujZVQYGxLBrv3A6TcyW+UMHMUU6LTdNjw601dMLR
	QmLHHKXYi5RriD8ntNFdPa2GdmVV7LJa/lLknjAQIGeS6B+51rr40JAru9cVJKjpMoiInNg9nD3
	LAmyulkcGpgst95BvYctndB6o5PNdhVVtrigYS02kycSKNHHGRKEC+d1fIMcJIJ5uykPN2c1dFc
	LaHkh3yUEgK85ErvFdDikeIYfYfnQNmnV4/5bqcmYu00mii/64JebHHZsSEYrtHxi7oVPQnYy2i
	J8fLdzlzH0/HJXsc6QWOm+nF5on+JIIA3iBDcSe7S/UtS7gBX/8lrKZzmcGBx0N9NJaoA8Uv6iF
	RSzBzcHJzAgTzL4/hZ/RK5zCQsnS0bDP2+8YnfKN9Y5tNIBfh7/Iwb4rhT0cC0h/qdvg1Nob0
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr16543061a91.62.1792043754050;
        Wed, 14 Oct 2026 22:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr16543049a91.62.1792043753534;
        Wed, 14 Oct 2026 22:55:53 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437b95esm2634070a91.2.2026.10.14.22.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:55:53 -0700 (PDT)
Message-ID: <d265ac9b-a162-4b88-8b41-0dd354179e2d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:55:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
 <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
 <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5aiZ9CFFMiRgMHgBmEvfl959917KUDlp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXyAZJ29mxkWVu
 la1PyFD0YvAbbqZTltj4BW8T6KSKh7ZICMnqaTM9x/kx3gcjQ7QS3tnEixiBaV9n856gBVcpGiH
 0Dou8U4ZdkktFlit6XGwQBcA8fBBZj8=
X-Proofpoint-GUID: 5aiZ9CFFMiRgMHgBmEvfl959917KUDlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXxDRxlrgGnQxp
 byowtQoFHpiCjosIx6LEer5F6KMaZS+XrKXQ/orhljsCxeyfXP4WLeXg573SguFRKMzw/CzBIl2
 4ZG6s+VbZxxrorZaR/N4CwzNgr8gTMv2dsrinK4fkUqC8HCpdM8YA8aP9txyX6HvQLrke1eMPLc
 sOgkxfU9BjoA0fL+KbauTveheBBwqNKDHE1XQIMlsDQ4TobZcy+GtBBAOUAZL5TgkqMd6pUvL/+
 mAsjuTv0DCEL7TuzN5GrgKwbcAjaGA2j3YERYBHhDvcm1+N8BAql3mdS0I1JiOqSzWYigvMYz+9
 QJ7PLJGUoXtxrWXZElQH8xr+VWjEp+EThBGS+DoynPu7FAAzSmbC9juAG2SCsmOmlX3S9WR/V2X
 jZ9m/z2AuXghTfBdixqORlGhVMFQfnEQBB+0lurTkwBd9smJ2EMuQAhFmE3LlXigFF9cEVS+4QD
 ev9ehhyu9EdRKHbFCUA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad06aea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MPl261hcqzs-rJHzN6cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023



On 10/15/2026 12:09 PM, Miaoqing Pan wrote:
> 
> 
> On 9/29/2026 9:42 PM, Jeff Johnson wrote:
>> On 9/15/2026 1:00 AM, Miaoqing Pan wrote:
>>> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
>>> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
>>> succeeds, on is_sta_assoc_link verification failure, it takes the
>>> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
>>> the dp_peers_list.
>>>
>>> On the next connection attempt, ath12k_dp_peer_create() finds the stale
>>> entry and returns -EEXIST (-17):
>>>
>>>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
>>>
>>> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
>>>
>>> Also, there is another error path in ath12k_mac_op_sta_state() that
>>> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
>>> undoing the assignment through ath12k_mac_free_unassign_link_sta().
>>> As a result, the link RCU pointer remains assigned and a stale bit is
>>> left in ahsta->links_map, which can trigger the same -EEXIST failure
>>> on subsequent reconnect attempts. Fix this by redirecting that error
>>> path to free_unassign_link instead.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-
>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
>>> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create &
>>> delete")
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> ---
>>
>> Baochen has a more holistic approach to this problem in the works, so dropping
>> this patch.
>>
>> /jeff
>>
> 
> I believe the patch that needs to be dropped is this one: https://lore.kernel.org/linux-
> wireless/20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com/.
> 
> However, the patch itself is still required. @Baochen, could you please help confirm?

Yeah, exactly.

Jeff, I was wrong in the internal teams communication. Miaoqing is right on this topic.

