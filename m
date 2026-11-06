Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932610;
	b=bbBcWyYhJCual0Tf73DOgjx/JrXORWrFU2bgSuboKvdww+lJZ7yn8aQsg2PUeZFGmWiK
	 CfHhTcViTvVIBHYfO6fPbzz+sVGOkXvXiTINC87DPOI1PChsJGMnunHmVRpEl9b6wOcna
	 bpBOwReC2y90sj26t2ZiNIj0N2TSS2Q/Er/vvmVJx2QeKqsst4M2iiUdj4+C0chzb2kQ7
	 35C+6pSQNyVrxEsmIZZuc+BFZmAdloP/VK9e0K4LkItJnrTeDyF0rTxafjuRkvSYrOqWU
	 eoDZ/7alr0GWWCgNvscM+yCaY9h0+Ry0N32XnuX30MALmMSLwpkRI1j9OKp0BSU4HOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=;
	b=RwfKrDf5krsm0O61J8JgaxG0Eg65GjulbdVpczivKEVzT/ztyhj1nP1wtoQStehxm4lw
	 79gIcAZE10vSHVVEfglWGPTAD/Z8dJ+64fTjG5F/GepObURVblDqNA6hhDK/i6R7TbKZA
	 pyh//A5fLpjkwzo6pWk9NjttcX3WIRRDLVH8DYOQQIKG3CnMK84DiIMK8AL8JvdQB/aB8
	 1RKhjRyjtlLzoSzyXWgThNkW8zxottLqOAkqciPKeT4uei58SBx7uWYcSvOXpupOaaket
	 T+9csdyvoFOnf/fW9WbypdVw03zXv4Lbvnmlfh9eyHsJo/6bEegaDyDrkFqSy01bBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vpMfHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GIDBeRXQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BDC606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vpMfHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GIDBeRXQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeU7m2274215
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 02:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=; b=W1vpMfHGgPo30HEJ
	9bBx8hzYIYAapGcKSKIpR+nLEmzKOOVclknMYKm4P5wuYj8zb6NFD5fFgpH/ptlC
	tCS6jvBGcygUoDWBXjKMLBd3ApLGl6sLxZplg7ksWa9wXhsjXchOqR4T97kRSmPC
	dH8Ih8hrBWzjQU5tWshRLhnGw4AMmTXndqwvrMq6DWe1tP2cok0dMuUDSwhvzc6L
	Bcg2WwhtMIkrj/eXcjlv+1vSMJlINS9HBwCy4BHzmVE4U42kZMv/7+m1OZePxU0h
	rPB1LI9avM4m3S9Jm+bS1AcGIloWR4beQ3fOraO2WpWiktSuGhIqARlD+wjHI3x9
	PrvglQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0j5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:36:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so204370a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793932608; x=1794537408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=;
        b=GIDBeRXQhoJp8zuuhxYVRtUG6rrv9OlyQ4wQNJGn2FQy8f0BJf/10ythPGBBTpKFMr
         cr2W9SReisKKd50bGygwbJKUZm3I2sBft8dwA1WeMh/rr/ljFx6r19g6MbtpRNMT7Trz
         3Ws5OyasaT4P6n5UFjnZrKoT6WjSMCSuplt2fX/8L13qEHEkLzTNA7OOzd5U0KtE2WOi
         IYBKn5CHmUnKu/voCkUF7zoPZOqUIIdTYWjCCVv9qNPlSULk/hV4g9HgqYxJBjW+F+wX
         MUf6T0HzKoAIAzrzzGIHRpTJor691GwZwT1jW0OnKI8W7vYgD3kG92lQrsIl0Tfe+Z/K
         EQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932608; x=1794537408;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=;
        b=msULILBbScUZKgQwWRFSr0lLFZC0hdqjIhjz+tV6GpfN/KaUlqadKk2qMXCM1xipl9
         OC78ixt1Aq53R2Dh69z6yUqVp3HZu/1uOnw9zu7K85isnbAFLy4eBO9CqCMi/aD0CaJ/
         iHMzToaH5m6JgLnug+HSiKUpxTbTVJj46SlishE2kCNIZ9Enh6beJOKe4mMJkzoo1PGs
         53opBsezchLeHrMumHOGLoxyOKfdIw1IzyN+bESO+EGJpk5NaKVNqVC6NIzh8lxLB7v6
         IftUUrUXrTKpHVRQmpO0sIzMuRW4BWiYHhkPWcQGLZBii/Mqdfsl96qinsrJf2kZE/2L
         1iUw==
X-Forwarded-Encrypted: i=1; AL+hErEBZ+ozN2FlqHYJIBfbHGotYQSZxEaRaO1QX2EwQX+Hhs+Yvwvi6dAunaB+7JQsrKKGT1/b1hocBN4Y2e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RKpDmFZb9WuBHCjQKtRNMQvshumvX9M3E2IK2gE7OXTWZZE/J
	auTQKpZjwb+gNQg+qUI5ZWwkBtJFEmIaTriefrW8KfVFzoA4KPEb5vAgTdTa+YGJW7XEVBrTFPL
	JpPRwGR+B7McYwQHqiRnNn+JRNgqWPjVtHpt8d+wuY9E0ttfnlhJBb9C4UTCipxXuwMA=
X-Gm-Gg: AYBFou2oUmGzcnhZu9cu3Z72QnFGbvUBLIDzusMe0GAB6MWbNGOvBuWU2KnfmxQg1aZ
	ySOfRmxckrDWRHFVnu66DKs+S1Qcu7T0GuuK3zSq+HWN58gsu+2BOhjU2tRQdR/+ElCMkZKvO8G
	p6HcX6l0ihMsK0xSwSbRpLvwYOe3hA6FBd4LLWBlfC1PXmSR2yGhmfN4baGaE1amG/outEERPS4
	RE3+pVsQQR3VeRos8LpbGJb69oLzSy7N8VxSGw5LucV1d/8yZz7Jzv6T7UFsjWWhXLXLvFKDP5q
	OCFp5QBU0gmTq4UxpH4EjSMgUeE//JifkhlUAjG0+S9XImVhTuUVODtAjD/lGwAsQITZYRcSLO1
	HuhMAOmJqMNMGArho5C1YyiaUnJ8btmg/uIhs7h0MVUbxh5yCpxWV2HMczm8sRBaJM74yt6ZdBj
	94ZGejBdqYv8bGEzkH7XVwnUlxyHgSrnCEBvrRz0Dj4yMH
X-Received: by 2002:a17:90b:39ab:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b0db6210b3mr1026753a91.7.1793932607628;
        Thu, 05 Nov 2026 18:36:47 -0800 (PST)
X-Received: by 2002:a17:90b:39ab:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b0db6210b3mr1026728a91.7.1793932607031;
        Thu, 05 Nov 2026 18:36:47 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5753094a91.3.2026.11.05.18.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:36:46 -0800 (PST)
Message-ID: <d8f645d3-6648-45cb-934e-1b232b0f6896@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:36:42 +0800
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
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260926114037.3231795-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX73HcLqJgRlhN
 r7n3mibx971nzufcmNjeIQf2CsVcIEaZtPQM3GnvSlGPmiKuUAqnAtk/pcXsgYE93fbZEKuCx+d
 4T+MuxRdNw0ndrN/k482253BErOqlJo1Gwr3rUtWY1XXTDkSkybhrZHCbYOuZGKDyS/CUCTXKcW
 HKoPUGoswBPSJmGW3/K9kxd9tDyh1psuEzpgXoCjM6ptXZMdg7GA5kr3xB8qU91GPPgTot6Blj+
 5IUamix/C7n/MbvjMqjzSE2wHzpV8E7qFNcBMIC9nxBb1HunvXyC7ZZJd8nraxBl6lkA/PB6NhX
 W834lzQ+4gWr6xXj/I7JFfIJDnwCMphmerBeJgHkcSGkyQnXI9UCqQLv8b+jCH25yHwV+lM8826
 Mv3MMGvKoyuy6FlHw5UYyBLf42xBHcvRVsmz99pK6LuAamAvhGX0O/2G88i9x50CxHt4Avj5K51
 2CyNKPr9td/ZkR9Txeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX9K/jbDBUhPum
 +KyCoAaxjtxHqXyxAUdXSkeAQPHofDH73Btd1jF9Ifs+5BXr7VAy//foImEbi6hbuZydppRepG+
 YRj0FpCRY2h9JAGeIUQztw8Q7wwFxQ8=
X-Proofpoint-ORIG-GUID: jnohTUjauloricYFOeQB_jpKqFNgTrfA
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed3d40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=nvCuiLfjozt6xqLnoboA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: jnohTUjauloricYFOeQB_jpKqFNgTrfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060010



On 9/26/2026 7:40 PM, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> Reject frames shorter than a three-address IEEE 802.11 header before
> adjusting the skb to expose the frame.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
