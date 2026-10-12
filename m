Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B93793BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811848; cv=none; b=sjbr1jypT8lah1BFvsfRede4ESu6Lqvvt2bQlBRIgk2u8+TWk0mkb7tc2BzfW7Mse8u9GNEQKdLyH7rTO7nmQf+vCnFZz6s9v+VgccVS4AYwUAqz9przL+aD0EXuAx9Shsk4Kx3izATwQNWTQMTTyVmDOsSvQHyGNnRhD+OaKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811848; c=relaxed/simple;
	bh=EQFWqasI/60Po2Z8ivIv/SBmzO/3fqqWFwoXaYSFiLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pUCIXI492Noxg0++lq6MTJoLEjFGDJJ9IRheL9qThPanraNUqMve1XITnHT5WeIL5+gUKmgPtMAQ0If3OWqfKEg65GC/r8ox6a5mh3PQWQAwbubHO5TFLU9N3zH8uJMcaymNyCwMRxRQQk9byxdN/zrqbAoeAhWj9IGSXPCDCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VR2ouf4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKjDnnSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VR2ouf4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKjDnnSV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0aSu2088838
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=; b=VR2ouf4cUZVIQt51
	rQ0Gk3U7np8d4hWDD9HCz81ABtp9bj6+iNzJY9G719oy62dxzwFuvWaPKuzktJbh
	8i36bQ2v2uwvFp3ydMT43bSnS3yA13MrvYlvV8VWjUp4clORHe6w2+bHFQ6KzDVJ
	1m3G904t0QMMd+5OLM3pexrr/xAndtKCxyoDMimRpRPktYgadljnVsCFT7l7iAEe
	ZNVk5GQxEOnfjpOGdqjo577p2vKhhg0Fnk+2sSDAxx26RYdYVX+xKRneN8FvoCV4
	XHEsHgKeyxsWnpVpBeMlZM/Al108UV77sLS3vo4fUn4KtNNZQ3wTtLCX5q/p+ZZC
	1a1ndg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2476-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:30:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a0c25def6so2275773eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811845; x=1792416645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=fKjDnnSVPa23LuHp/wTSv+fKKf4R2ULi6yG/0M9pMxkZDYbS51qAlxt9S+Dqf54qug
         rm6kPdU9srRQJokBqOrsY4qTgkG6skJ/vwhYXeYX2GFfv7Brcg9qy/gHPosYxuwJbXxd
         qEm94NIpJXJslNUwzqwweGK+MgUKUFuaLagB6RJC/lTyjYN/mjbTIQlgypIK7msoABjm
         t5rnozBdgvYI6HFvpTge8AsjS8wx8dX60NXxFT9mLnVPjWpcqeVjYhPOE/9H9WeelU/f
         QixA3DJPkbXKWPq1mrZCVD3CcN8Jbw3uUr7sMLHhBn+X/wSR8XrauqA3QhUP3D/NXAl0
         XTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811845; x=1792416645;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=FpnqWDSqNpleS5Lf5C6OwmmNq1jtZOBGRbzaaOWtWiPdE1Y40OzBIAiSCuxi1OxSeD
         cpvSaoWJ8+b2qiFrGVcOskL29/8gEaqwQUjuU1eQ9XFtTsbUy4I9AZwXorv8gwUA+3kb
         tzGnzLjaUgqz4hIC4TTZHD+cgFjmNjFKTZbID1EsOIX0sasILfObPy7s5NzIgSzdG+Zm
         mCvCdy/9hnK4EnKCFbZnam1UILC5n/hHXLISYXt6RTFcwAvmDUtgTN1xdeDuPx6wYXJ+
         CgAtkM+VRV1OYBqqcCKxz2edRxTiR6NNwehNdHt4/aoWN0fiz0yKHtXVDTAvKTmMiDoz
         vEDA==
X-Forwarded-Encrypted: i=1; AKwUvBzGpaQI7iSAHJIVUPBfHaQYleV/LStcEFJdzZ62SDaAyrqbEIxsP5mLtnCUkAFpmZUXBIk7Mckol1x0A9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYISHSCkTq13GWNbDMRfUjcodOD25X2kenBnBrnH5thjzrHZfIXk
	ExfISHJtme5zTSJmLxA2d+2qsSLKqz/4/Yd7K+aLjoy8LdnQgGXEMZirX4MAa5vHs8Jxh8Xb7tx
	c2F3erGmx/NHMX+lE3tHdBHd+WqWTb6anReG41vdx40NWWj2VwKe6BdNRIimzOHv29Cw=
X-Gm-Gg: AYBFou0gfwlGfZcub6zBe3NXHUes+5IOCyDjLApMCRM8MAOC7IeJOV2o63Lo5lFryPE
	JDL6LLjqBl75yuQ7hK/tqWa4a8/ZPcSGFfjrpn88in6ryyztEhUXmSYP2NHeqGV2yta18T6B0/e
	U9UiNJqIyXV1wRqHJiVOkVjI04qRXFhVCmwiQ5Raf6gMYt21jJn9cMHE2+gtPf1sRBzK71T03j1
	bKM0+oEjb6eq7iNBzZUvItWt6V+Ut1IrQ9y1WCe0BT9WIpqV93aNjbSVsjuK4iRMkaW7g2R233C
	ey+tWIHAXsfuv2Hcmj/JwP/YVGmd7SUYHFZI4q6BSO0UAJefHnA1rLCKELN/0QJlk3RbDTI6W3k
	+dCPPpF3MMOG25KcZFHIJXwlSceSkoXYIYY2T3nIJ53e2n9bHi7uIw3Nz5zdR
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590123eec.33.1791811844951;
        Mon, 12 Oct 2026 06:30:44 -0700 (PDT)
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590058eec.33.1791811844129;
        Mon, 12 Oct 2026 06:30:44 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44711556eec.9.2026.10.12.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:30:43 -0700 (PDT)
Message-ID: <92649385-8437-4391-a233-bdb59cc600c6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:30:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce106 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=b8Ip5u2rk5lctkbpsk0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX1AmKPGuBGbu3
 Rj0PNXyZLE2c1/PmagkHHH7T3O1r37pXpFOFQJSPj2Z+5Xn7KMcXbzBYa0VdkMxFcLd0LcoyPP5
 TUH3Qw3OM0YHeE/hpyI/yJq++m/lEdudY+yLhOZdsHwQ/InwArUO1GSsu6rODBG8Vp+kx4Eemsm
 bLqESiJtghkWlbr1jhh3W8HJmUu1MSRfrW+Of12xtafJJmH59y3JYBGhoPpcHnjr8TA0/g/SMK3
 PVWgPda18qlzP+kYASjQKBv78Cow1iip51ovBGhp14W1sDCJhDoLDVQkkiThPLbFv7UWFqiZni/
 VuZ/HcAV0KRjpbYkdRjZLGMLIjTcf6MD9WYKWjv17CXnHNhEjStQPlkYqGLbSYHqfLDepECrPjs
 qc7IPX/ug1d1dod8KQbXtoEDjmUCYacnxvOdcbpiTLSkY5fprlnUtDNdaqmy5xKA+0vvZRad5ku
 qAckpn6bEApjVrlmz7A==
X-Proofpoint-ORIG-GUID: tQvNSnPPfOLw4AqTYLgjU0N_8GJOna1j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX7v5t7+AQUzIW
 74KBNuY8ZYMA6WFFAs+OC+Ja4LqvKpr67x43eLNGs6i2TFV7YMJBMRokUZ3zmqt9Yjfkpc7jocj
 cZ742tFqP8zEerZrZgtUndcfnJzgmio=
X-Proofpoint-GUID: tQvNSnPPfOLw4AqTYLgjU0N_8GJOna1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053

On 10/11/2026 10:52 PM, Baochen Qiang wrote:
> 
> 
> On 10/3/2026 5:20 PM, Jiale Yao wrote:
>> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
>> the current entry. idr_for_each() retains radix-tree iterator state across
>> the callback, so that removal can invalidate the walk.
>>
>> Use idr_for_each_entry() in each cleanup path. It performs a fresh
>> idr_get_next() lookup for every iteration, allowing the current entry to
>> be removed safely before its skb is released. Keeping the existing locked
>> removal helpers also ensures that a concurrent TX completion cannot find
>> an IDR entry which points to an already freed skb.
>>
>> Changes in v2:
>> - Rework the ath11k and ath12k pending management TX cleanup patches to
>>   remove each IDR entry before freeing its skb, as pointed out by
>>   Rameshkumar and Jeff.
>> - Use idr_for_each_entry() for the pending cleanup callers instead of
>>   leaving freed skb pointers in the IDR until idr_destroy().
>>
>> Jiale Yao (5):
>>   wifi: ath10k: avoid IDR mutation during TX cleanup
>>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
>>
>>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>>  7 files changed, 44 insertions(+), 39 deletions(-)
>>
> 
> if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
> separate future fix:
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Since the UAF potential is pre-existing, let's fix that separately.
So this series fixes the IDR mutation and another fixes the possible skb UAF.

/jeff
