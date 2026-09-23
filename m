Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F4414DF4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153424; cv=none; b=nDSAIp6gAC+D8y4sC8LX4T/U28m1ccxNi3+MEEf+sElvxgMRITtd1oh4oXeUQ5Ejl4cX5OCw+gEDBCRP27g05YGnGFw3gTPWtbd6cz4cX78AwZoEpmyUh70+mNR08gUfKYm58buqaH9JPaAFJ/BbUbX6bOhOhl2AQmJM5kdrxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153424; c=relaxed/simple;
	bh=wOghcGOSFojLTwr5rZMmk25qAZsebnu+adbwA9aFgk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiLBmIfMN3RSZV/QVMzTl76Kh9PjsfsOWEdDJsAGI3UAVUvW+ia00/vFkufF/azX0malbPhW3hxKBN88PHxtJMpOjc1G9NMAwoV50B7+WCOH0NMLZPMEHGDZhTXQcFQchmWDUM+xLJcU7cr1WtM2fylPgazkZ8zMISXmqligJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdmVqWUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgI9sxwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdmVqWUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgI9sxwl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JNvQ2854123
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=; b=bdmVqWUvwfUM/NzH
	C9M3sQfHAJVUA29fGYkVINDuy/1By3pWiI081uN+wm29lkXrUhHPequ4MdG99R3O
	KS55ZLpORnebG+IQnodlrXyb6EuEwxcFlHAJsCSJT3MNnrlzSCa1X3JIZyL6aBjT
	D3Qrh9fbdm/QPiTClCH2PRKC0qRHgnumxF4yH5CtJKzUQkdZIVsaKp/RBsJpuPxM
	pPt39d+bdiply7MjlcdkEdfF2FzJVgRv+PxME2ScAVy7xsz2bbbV3P7/niD8m5pL
	yTqDs2PDXShKZAeyWGYN+PB6jOECTnFS8z+4NsunOzEUsJA0oLuJA285IJF5aIx3
	llPiAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw316a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:50:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so789137a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153422; x=1790758222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=;
        b=ZgI9sxwleN3Crl+3rHMdo3ol11JLilH6v4hMwgFZFV2qztkS7rqi3Sp9PTUEyZiayA
         gb4V9hJP/bSVAeMtyBT/8VGPy8WC28Rcc5U5Z8p9wuiW5CJbXlsFHPPk6ucHzdb5Tfoe
         ynsLrqNy2QllJaFU7ObdeVwvob4PR/JriasQtLP0oqiD2EWUtGUYfp5QFODY7w1oBhD5
         1UjKmmijdcT78SbkdSZrw9AmgQsmw8VlIl6NEFg1dVSFUvIcFSg6MsKNdBCAxFsCaZqr
         E7H5H8RUNqpCS9cZg15ZuTFU7z1bASJXIuPPUR81PDMH17aIl+mzAXaWfHStSrXyfEsF
         5E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153422; x=1790758222;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=;
        b=SYTxOQ6Y7qLZJ48BAnYmkAIg7sP9dMKMv2a4Q2yHDYalGC8ruCBCl25nNav3d0m+VX
         Xh+beYDYrchoI1aX/n3fX8zTsSIPW3uuE1CCbjxZLMoz2e1OO6EGEVRotFlXaKn3B56l
         wCkADb4dBhSMWaOff5M3O2WmdV05kAkce4zyF9R+if3rsDu+CzY+8rdAcHhigLSWO5P2
         U3RA6/Knz/Swbw55aH01MG/IT5S+MrJ463ZoGP2I1RdzhOyLaZTi+nN/s0UcAUUYHw8A
         C4ITXGCL6sUPzznpeXWlKpwV/nkZRRjpRwcIjTjclczYyxl/6ZRk+2bDkvIYXGJfBPti
         rxRA==
X-Forwarded-Encrypted: i=1; AKwUvBwkQ/kAhmNXuBG35QtiuWimc0vUJkSxKR6WENzJiBH7bnhFVi3LfGES/PUWL4GFl5SZd1qaeD3Jp0WvIOk=@vger.kernel.org
X-Gm-Message-State: AFuF++lbmbpFMUFLNV9ptuPQ8YkVUh0C4HJkj+iLv90N5ixBjUOIFYbP
	c2P0AoeUUl2oU5u/CuT7NXgk3FAnqBdgkHafT/5PwT1DL8leLQme5WnUAFaR75UoqN8rgiAK3PP
	couQ0iS8KAtqrXoWaDjmaJ6O30aspzcfouAPUpWwyYk8Yg+DugvNdgFKguBUsxgBZwiY=
X-Gm-Gg: AYBFou319JbROz7JD2IjHNpKpJsOewx84V9kvj64SeGvPG4W3lLOzOqjBBSCOiyeBdy
	E3LB5Yjm3jtn2xGvlaHdAZttjaHkDAOuie83Fs6gsD7E9wPHe0h8Jg1+x2Yy/NHe6UVUnbUANum
	slxT/FVXMCO7PEtwO0/YaazVWg/owpaCrtOcryH3XAGG7KU2swVe5DsaU80lcArubCsu8U7+o95
	iq+pgY2/LRcV1EMYpNA+p0WlHPfJFI9Dd+zjSNUihMvYzuyjcHYyNpNvX8dRn7DDAPHLgfuw8Fc
	9oDT+0JhxFFy5gAnPU1aogt8PWMb5CwU/tUYQiN7f/79vKn/Y9y5NDAVowXbXbbpwu2HPRRxkR0
	7OyyVQTlCU8DkvJJyUftVOvrCp8HdjTS2EszQ3xZKm5LyKgJakE4H10T/0ifS7O7/KtFQ5GEe
X-Received: by 2002:a17:90b:33c9:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-3a07e6a66c2mr1496385a91.24.1790153421765;
        Wed, 23 Sep 2026 01:50:21 -0700 (PDT)
X-Received: by 2002:a17:90b:33c9:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-3a07e6a66c2mr1496355a91.24.1790153421265;
        Wed, 23 Sep 2026 01:50:21 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de57682sm4609661a91.16.2026.09.23.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:50:20 -0700 (PDT)
Message-ID: <6fc9265b-c58b-4747-a5ac-510e93bce60e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260921173033.846332-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXzzHpLK4D/sMc
 +IS3Jws91bHzCZ82Ef7bhc8Drm7Hu/Kn20D/O77PqHxh4P3i9pm2+aUE54ctNmSOd0DTyfUvzBN
 H/PWHjMWIwmVK/1P3Lgq9SN+x1PF5hbhgSe6VvBSj2kCRVTVgkDambBGqabZcRk9YWkIqOEfArl
 0tMZnof05VX2FyNgNtMbOtmgrs0Q9dfxJqQZbcrtFD+dlySgC1ZYD10t8FMK7t1fMTLOleG42Rx
 GF02C7kyOxxD0AtbzkFzgIE3WU3siSphScwgwknJm9Y7xQRjSQiikK3l7RnTseEahIeFS/KtrR8
 Eohx/39FGTOpZTkzxRt1D1eLsz6u8P1GjkPV8S0oFNhqNtq2pQwehp3U6uXhiqUU5vjnoOJ0vOd
 6XuQg/y/elmtykN9y6QrMWZ4M0eIA+UYYHLVofiSpvcsyJFehvBsGH7zTrxd4sz26CURA57XMkS
 hNgmAWnEA0U8M3Is/6w==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab392ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=CvJZMSMp8JnWWA3HaTQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: j0a27CFxjxiB0GGYEjUItsAiXHMP9poO
X-Proofpoint-ORIG-GUID: j0a27CFxjxiB0GGYEjUItsAiXHMP9poO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX6mcOaC+DM10e
 sBVMkd3oIndrVMaPFJ2ZaSCPn3Pe1DiiamiJcu4dr/DBPg+BW2xjksfNPZAMYRBsnDSjP2IbH31
 YXGw+h3ddjXmMBz772g8h5nHgRJJWsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035



On 9/22/2026 1:30 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
