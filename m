Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7F3B1034
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784338; cv=none; b=UVErWn56N7yVy9v8U7JE2DwfjPLX3jS4rMc570YrxUD0HhrAumt6Vm+v97wKj+2Md53/X4QJcgvQlxNNDHXzgxZrMP9Gm/y0lbqF5Y+DYrdp39hYtJ3YX1ouaFMVTJDDkw/inziKeh74UgbEn5x7gZjF0VEgMI8AGRB58sTDVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784338; c=relaxed/simple;
	bh=TckgbKWaNNgwEjAplxnS/C9wr+NmsgkaQh1WvvJaetE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RlhnNYQFQG7yYEdjbJvV+lzJZsLKf6gwos27n9d3uN7UfP/y7YhOJBJX5vrRHgHbhmjBOyHJGX7f6BHFF4UE1al1Gs6m91FOabq/8LVbvCkwAszXZAS6DkneTgqD+DeIuizPE20DEoILcGAo8KVAleY78baKzPtLu4gsBiVEZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv7YeUWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DsXElmoj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv7YeUWD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DsXElmoj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55dRb1314464
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=; b=mv7YeUWDwdmTClRa
	/9xojwGT4f2gOUhaSAPS69WH4dnR1EEFMnDekZ2UdOjwwNvv776TwH7linE/GaqT
	ytQIpPQcPa1yASxM7oiIORIGAlYGgf12lPExmOmDugeAzKX9FBSf/ied0SMntFmZ
	tRr/VeZpiENXZ2cR0rfKSK7OJ3MWUHXBR9u4L0l2tuNxtt1QFhWmtzsGfu6KU5aC
	qtmlc6Os2mi5mU8GpKndWLRGEUa7XODy26uVmQxy0lq4czJTQDOuj5s4q4Le0W42
	7Ap8too1RT35+aQbU9DqaOGP1uF3XNCLzTd3MvHE/QQ1A13WrDoEBR+QRDs3az+w
	j0CLBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7114ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso1050952a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791784333; x=1792389133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=DsXElmoj4bJ0CsPbk0PXcv12R102vuphqDrEkEph9CX9XtC03dRk6vzLnb0VMOmzTF
         SSGpz0al/6XPUjZ2fml0NHexfc91s18I5LFw22Pc2ZGUGmzT08WIwrN9Brwq+vWIv/17
         1U4XojVv7CxQapxYPa7GcGj5OMMkKNJXVT0rtAz+M2Yz48IoW1/j6sa/EXFwj04s6G3Y
         NeXE8eKbTG9EKJCMAj5vPCYTdgOTDe+leSL7kBJvPPkymCTm4D+mahuZfekMIsZTVCNV
         1x95QnSUFZmbkuEkgD/OeTYdm6ab4zDO+ENluQqhDIsC8GiBOwcKXYZ+ZYf5uP31yVc8
         2tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784333; x=1792389133;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=2e8J3d3kV4pqP9yrFRIjuCaBnBwm3hdTBL5+NbHs327UvCZvyjLLdHyZS3eN+Q/K1U
         1fn9Z2B6fLSHp38bpIf4eWjlwwexbL46Z+z2Ld+UIyYTAP16MySVgDv6W5TY/6o/wqVv
         ltq89vnEUEAapjNUDYU+FSWJcsi3SeBp0XEkJ1DZDny6qsdlnAkKTyYRRDGBogYNJOMs
         m6yyy+TYyuVZJZ5VUunjguLrA/M+3Iihbq4p0BX+TrI2iacesiaXwTrHeHeBa8joKW6J
         6WQpOn12SL74EqCxmHGSi37VyU2G8meDyd0d8oYQAx2mL0X41h5gONcWADK4YYZWR8fd
         /0/A==
X-Forwarded-Encrypted: i=1; AKwUvByPFBMYgdU64jEjqG52t+jNCBpnEayLHw2mP5U9vBBqrj1yGDJk7jAcyoqX391Ox9Q995wTcjvemdoN7EY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbadjuaaT0lRCemozehhnoELEsO3L6lRQy+5KeiuSwuqNX8X0V
	PunxCcIhM0ggPD9Ubx9SB3SJqVpcQtjlXLHJ70RVUnapBnlWp+KoOQTKfpK0qYJyTfvflxZm/ZI
	fZvgsZMgA2gqwyTU9i97ei+PJri9gVZYoP+LPmJk2LxfQfAYQI/wIhvOckzoT6R0yarA=
X-Gm-Gg: AYBFou1gsSccL9aoez5nxnAp4mS/UtZo5X0RvTVa4McbjMXQkFBIA37sv+eusihpGRd
	oEtqJ6Fgcjbpmb6EoVquE16BGWI2/F4pgvXKipU7zu54cs7OPN9cx8cryQWe/DK9qtVRuCQQNuv
	K+2OH/CXSn2RJFrUkiLlV7JNVvpXm75f+BFOpj443ptmNvql8Jjh5unz5BN63nfj8jxtkjZETVj
	Yv102jejjwAtLB2h+96PuRNNiNFnozo/FGLSca55PTu7dafAXdk3+kooxxTcIgDVwHNXEXc/srl
	zHe7HtW9DHTOhD37UgbkheIpgR0i1ZzCxge1SM1G8vsfOduV8TBvV+2KLjIs5OB1fY/pk0oog8z
	qQi7oio1zwZdBfyemvtlHHH9UjanGtYo=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686386a91.6.1791784333385;
        Sun, 11 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686375a91.6.1791784332909;
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e41126sm3869528a12.23.2026.10.11.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Message-ID: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:52:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfXwsoHVk1G1+lV
 yAz3obFey/gPIrCXHF/fzvr+x7APA50rtxSwGRrlkBD3MHAtxhyjh7BxDe5Dg6Ti2Q9P6QzhH29
 V4z42KYZUMCTEmxRYG5txMuwktv7618=
X-Proofpoint-GUID: WXftMvz23pOyf7ff_psQ37lwcFo5Zrps
X-Proofpoint-ORIG-GUID: WXftMvz23pOyf7ff_psQ37lwcFo5Zrps
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc758e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX2xsxy1fJl9Wb
 FUrdKPhHD8pxCoSSX6s+MPSPW/C4gw007q8fbrBFZi3tSUucwFU5GlA0SoCik7XjIMVBdFTwEE0
 dt/nPodrWjyriC+ek7I1FdNtWUw63Ysu07mQOYec8bMhJ/2jiH/+BdZJq2RkCmo5xZwV1stcVy2
 XwIoL7JqQh/x9N1N2/mlRIDFoVK2B7HQKPwH0IiRHiZNaTYKSU5W0YUv3zylTbbM5u2fS3ndX9B
 lIpfBKSY27HGLEfGzSSP22y+DvetwNsQm/Df9MCJbgZYopKHBeyElPl28iOOiz/BDP5sncTj1th
 2FT+Z9zLVyQXLB11Aa2DzwiyZ/Dh16pIthTqE2ldvlE6pL20ZBeHbeYaY/1uNm9cwc4wHBd7snO
 tlZx2UGhEmQ/06Rt08qm9iqkrLpsgXkEzk48L0MbJi9/J9tghgcoXZZiPwVPXGs8DWjBVifkisn
 d1QlTTK2Z/ORA53r3Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120023



On 10/3/2026 5:20 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
separate future fix:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

