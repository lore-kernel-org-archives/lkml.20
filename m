Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E99395AF6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037392; cv=none; b=jSjMoUUpbEJnTUgv0YOcXMj5BrdDJ8yRAzqHzU4LlrH2Vq/wgnuxKRJKxgoyN+2np9u01NEuLAUEmzKpU8OXnPsz5GnLBtp6FsL7o2qBcRNIgKnAhgFhQ49aqhhaM7xDrJpEkJnQnu/qyQqhBycQlYaaNF/Vti42oWjBxEJTeis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037392; c=relaxed/simple;
	bh=gBPlhmxzikCoYUAGIgnkCYfGjVuhe3GJM2b31NbsT+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2ek3Ctqp08oepEoSnhhLTM8YpBkmdrRwXdhI7uMKOXXJyKMQDGBTTYTOwwDc6eu03SIasbolkI2Lc9itMbM8NwfUl2hjW2UF2/ri2mfOEsvSUm99mUOl/mI7dr4a5BdsOJx0S+yEVlbRHyD36Mzfc9xIS1DQhLHm6M5jnvWE3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qadazxxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSLej0dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qadazxxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSLej0dg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXaLv644589
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=; b=QadazxxlAJGoXnl4
	efWZaS3QXF0Htj4qMIxKPB3TbigmiPrJBJF48AxRe1Aq7gta5rfkvNSAZOyQ7Rt+
	Eff6eWfbXKtBkC+S3Hw7fCH3Lv5ptQcV6k6+Dz88TRD1Ivq9nwSrTLJe0U6C7v64
	UjNLCMltABxPrZuv0rh4padmYQRWIC7iYw/mneNmWvVg3YkAypSuxWJ8SmzWMjON
	j13b2BizHNfBi5vE7Z4BcarYDuZA8kVzoUr1TfJFc3zEEu2wLBS7a+Pmq9CpFTY0
	g6bRM9CPd3hckbruJhUcYzDz7+ZUqM8yUuN4ey/pEwkEFcAcf98jdX4q8S+bwDIM
	gJE45g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy90hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:09:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso3047973a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037389; x=1792642189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=;
        b=DSLej0dgZoeGMQCH5nwdv71eNoAhG415SU0v/OuHoFOAoEs0+Xwvifm3+R1R5xnUph
         iqM4E2OYljePsRGotuvZDt2na91+s80nbxhZ0yHxgy4v2AxhmzC4eVwzMKcApiimUYgl
         VajNnGBJ940BmfycJEBkVLzIboBeMwcN2NIj1SQg2lPbBndPipSiPPjXZt+mMMMT1NCT
         0Z7EAt5wW82aYwt/fKe3G/Oyywxl7w0M7FiDUPl2dZO/FbU+XJqBg2zlGnVIFUZrYF4a
         z5dEMbAkpTyv5jWuiO00YRQYhrRf0EDYPZNtDw2/JB+u1GYz6OtLehSlgYPFt4sGajAV
         0Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037389; x=1792642189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=;
        b=ProknIG+mVNezaNp37n24oVXfHQ3AYC2nZTflIRtmxEssljL2gOzetL+3CvQA+lS8C
         kEQfDRbq7smKd1EHStE838YKfcIc93RymtL41gDmF5Q5c/jq3eB4CWqwLqGb2yWkr4XZ
         jNiks9IWmO1hdOs6X7LyOgo7ber0Fn/RpUqGLaZJdq3DE5w3GzLN6PPQvvV9it3N90rw
         GyQE8vJhY9B4aELQrKqnNhIgJgjmftbr8T7eIX4kw8ljl1/rSjsBDLGjncucX5L4miLU
         3AmLo9Axq/meWuOSRBNSgroRRpuhIyeJTMgEKnpEL8eA4r6KuM5w7MxdsP8Uc03qE1gY
         lGaw==
X-Forwarded-Encrypted: i=1; AKwUvByddldM3eN9C44hiYnfO3McySm2jBEz216zN3FmN1y17Mvj4j34fkINjHqG0jpC80MVCQCWXBI437CjsKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAa57RZBB2tguBBfsNkDfZTdRnu5rs10S0ImVVPsrxh9CCOhH1
	m77bD0lUGp044ipGxSNV8CTVsZi1/92N8lOIqsNQDMi7PYtdIwuBVKwEW1q6jaMc2mdUMA9eRGQ
	d/8qMqlCRLpucat/row1iUziEM7FhpfGPkhuVAaK8yHQ9l7l1Zeq8HkAdSUCNB14weRo=
X-Gm-Gg: AYBFou3u3IvUX4x2KNc+lm2pXS9V7Zazky8U34EB2aCzq6ZIkuPAsN1qbn/kn4SdBgj
	+hsxBxV6yt15wM+ngLfROs0ZGe17MoZQK9MUBEkYxEm4jCKZyuCaLyOpf66pfHubzLYFltQcLUT
	52JKtAxMSQECdg7VZW47HZBEcaAa9LduTGNdLOI3Rd438WzDx0dp8rp3FLuATO+8CmWyiWpGSHp
	gGaUia6oE/mKU8r4JlOBazDnzvqJKNJpp0fF39kYCiwikObTZ6SrIgJpBxsbyU1Rbc4cbvFfN4q
	957oQ2ZDMRPQbKsU9EsB72S+Ei5/0JOddsOYMI6WdnPX//tE8nPlhW8pcyVKc9GVUNPQyuxralC
	orpafCpUfOBnVebNW/H5fF1vtwmtU+O2YKYQtuv/zu7/1UsM7NbinaJl1fCooQuBSNB9w+w==
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr17478082637.43.1792037388887;
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr17478064637.43.1792037388427;
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cdffa5sm583593a12.29.2026.10.14.21.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
Message-ID: <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:09:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
 <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AGtfTBdjx_GOW_m1Jr1fX0rHP1Qf6fd_
X-Proofpoint-ORIG-GUID: AGtfTBdjx_GOW_m1Jr1fX0rHP1Qf6fd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXyNxMxqy9E0N5
 UIz+OH1J5ZKgHjuPAuJj6pAvVL7kSKkH+XCqoKCiNxXuoCsYRNy1tSXM5LeHQ8iY1z/IwCTw8VH
 RI8jj4Ja++Va5W7h8vm6MZi+LFm4cuw=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0520d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ogbkhcyfs7hGS7LeRn0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXzVd2BdGMy2bf
 7KnQdxDB/nGLbFC2Kkf0/rGfLafpgRqz/8BBXTByTd9oItBIJUMjY5xKCqP0yVMc0p8gwo6NtTi
 zpv7ySQ0hZH61uNkhFHQIR6XfqPYHOLvRpfCtAcmkcRsX4jZYFsEbTih/z+ivpjUSu1CtuOlE04
 DQts1tJ52JtU7AOcwonrmL2lzKtG8/EXPNlqd26z/cZE6OjYsA02K9nnxp/EjJK1u4wLX02dsOu
 oIOMk8fzz64oXIERiC0RKDt6TJrOGkKrMKngwWREs+7KFHlp2wtyYGv84YBo0u0H62QtWuzGm+Q
 KJd/3xHQrj5O/ttlFiIUsjXWOLHdzG+hW5Cu8R7mE292SGCDXNOlrR/WktCKhItbVvvkj8PFXQ9
 4W+HsNL9SAXgC8KAbYilCRDsrX3UYSCQuZ+cxpK/8i7Uc2xV3EL1yt7I1nTuw09WPEaeROOdRNu
 XX2PgqDUtsgZ0DiMcbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016



On 9/29/2026 9:42 PM, Jeff Johnson wrote:
> On 9/15/2026 1:00 AM, Miaoqing Pan wrote:
>> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
>> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
>> succeeds, on is_sta_assoc_link verification failure, it takes the
>> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
>> the dp_peers_list.
>>
>> On the next connection attempt, ath12k_dp_peer_create() finds the stale
>> entry and returns -EEXIST (-17):
>>
>>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
>>
>> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
>>
>> Also, there is another error path in ath12k_mac_op_sta_state() that
>> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
>> undoing the assignment through ath12k_mac_free_unassign_link_sta().
>> As a result, the link RCU pointer remains assigned and a stale bit is
>> left in ahsta->links_map, which can trigger the same -EEXIST failure
>> on subsequent reconnect attempts. Fix this by redirecting that error
>> path to free_unassign_link instead.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
>> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
> 
> Baochen has a more holistic approach to this problem in the works, so dropping
> this patch.
> 
> /jeff
> 

I believe the patch that needs to be dropped is this one: 
https://lore.kernel.org/linux-wireless/20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com/.

However, the patch itself is still required. @Baochen, could you please 
help confirm?
