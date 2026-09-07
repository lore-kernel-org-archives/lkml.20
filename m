Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF1390CBF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774286; cv=none; b=dS/11AvM7yni6ick5nqnZzyOPhdGNk46blcQR13VbTh/csP1GpIkziKpYEB5TgWcnULq+IBw5WyieoYSxFxbF+oZBehcedAVUPF8VEG6Na0kQQMxL+atnBQndnikqlgoiZ3Rr0F/b6YWr7/a3pDA2/7mz9LrLpGdo8bebQjjo2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774286; c=relaxed/simple;
	bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWCYQ4YsJrB9l7v2yovEUTnW6CzVJ0fcuUVlATs+pjYgxLjENv//7K1YMyyo0r8KEGiQeG9ZN88NHqtELCkU42BiGHLWpfmlwTm0kj0kY0c8hFtPvM0XFp+3Fb7htM96W+B7FFh7N7eg624D3rA5FjD4PxalG3zO8Eb61SbeZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADqQI+Rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC6NCfxM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADqQI+Rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC6NCfxM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bj4x3618228
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=; b=ADqQI+Rc9/PByyKr
	oqA3W2qgI8GFRt5Vm/sZ/IfoqfXK5NyZUeaVmbLWnYDF0LbkofGkAJAy2HFl5c4E
	a/YMUUQQpCbvrn30v6BfTEnBxlQxcMmy/tS2+Pz7KRLyDTjYES0nnr/4nlMDeEk/
	W/mhyL/12dR6dJX1LIfnVwfEoZ9P6+v2dlb7kSMzN/FIQp4mfIZy7X+ohGKGLK0r
	wJTfAeoeraGL/kO4nACcCgWG6yQynq7TcQCouNf7XZIeLwqNydxbEUEtfDhsJyuO
	lyPCDkc3ZL28acIZr8JvRrHqis61gtzNgOpe+bEjhZWks+AnL2EDPtLqiPgOqwWl
	ifdUnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyge4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:44:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so3644209a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774282; x=1789379082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
        b=LC6NCfxMgWqdI5WF8mMnZHjKFBYWZdtLWpPw715RXQ6LAdbQkAVPqyvufmFOqKt00l
         NQ66H8/U2VLX5JIDQoIacidxnztTEE6rRVWVPSgivBi1T3Q6JUljDmF0zxes8PWUS8u6
         AiipDl77DqYTOcrPb/o7IfsNaTiassvPTd21e6blES6ergfu2BPo09bxxSQreTDo8Rqz
         q4gGbMEIO64UCiFIZIwtSw2EYF3WAY6k9+DSzP82cTBeuzBKhYKzRFVz5MKDY/pTGSmL
         2jPdFI1ZabtB3GlRid2FW57/tnadlahjCIsJJWToRvUMSIM9lC7QNatMH10/bKkJqYrG
         zjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774282; x=1789379082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
        b=UqPnWAn1uVP60Ik0bqycTQeae2DYpwrld+c7t07j4695sRZzMkbHEzKJc7NMkhltIw
         tKwO0tqzkPNUxNfer5PGi6CQywrwZYTLj4WryXRgI6P3F3lPBhYvOuC5C6c0xlm4zJnq
         0lZYZXOKR61yTj19hXFAfLMyjG4OpiaK+Bs9IGna9a+yuwr6Ar0ZU1F4f+rOgaxNnig+
         fwbdNKBs5OyIFS4/Y+2aVtTV7lo7Xs2mLgVqpbxqPTKydIjcUt+x7g+XqTgKHnEo7kEJ
         GzYuZUYTVF67LI5Khqe8chufuu62sPW7QoZrogliKJ2f9iAdjn6rIwdP903TKluQIukC
         Ch0g==
X-Forwarded-Encrypted: i=1; AKwUvBwwliKEZAb4cIZdYXSK0jL0fR3hAfqLycP31o/zMB/EOFR/w0xHojpJVlOv0BsHkxujwt9jgepYu9J0SNA=@vger.kernel.org
X-Gm-Message-State: AFuF++nC33FcJci5QEJg0SvNAjuhdC3zC3r1ajkvu4Law0UCGW4GpaCb
	MCpuWYbVh6LgwVsQla+QuX+Np+xtH45Bl3/ICxV9/cdullH8bNE7kek4Ipz8xQFULdfMsZimAx6
	/pteUgEK9Oa1TmvDzroiELCpH7Yl6zu082LwPxgTNyystCqwEJ1nEPwvG36K9r4M0rD4=
X-Gm-Gg: AYBFou0YQEe6q9i+mxumVLWttgXKazfzgwMXFVjNALj364oBHX5I270jn+7JHHA8jCq
	Dcyh5bSZbgA23b++aCxsAYfyR2wEpohllx5g+1qdgvRKsPjKVbeuA9lG8RcRZclHav+PH3yDDLJ
	Y0VsThQr2c9nLZDKJn7tx+IFiR6prTfVO8qucGt9NNlwGhuetFIjCWOZJ8jzbXkLy3MDTw+v84Z
	qAVh6qN2LthLntzbY6DJSstNibBM0VjTzMPFjWtpNIFhSTnFThoxhV06rBJk2IqT9gVOlhGPzjP
	F2uYCTzyN3dqlchE/kNRK4CJYUb875K9D2spijUxoCpY6XSjuBXE2zFBRLuE5LYlZ7IlofmR7Pc
	ko+lqWlYMjZVe7UjQZKyralZnksMISKA=
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr32148257637.0.1788774282496;
        Mon, 07 Sep 2026 02:44:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr32148214637.0.1788774282034;
        Mon, 07 Sep 2026 02:44:42 -0700 (PDT)
Received: from [10.206.103.40] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm41820620eec.15.2026.09.07.02.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:44:41 -0700 (PDT)
Message-ID: <fa897e53-2ebe-4322-bf73-98788854083d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dp: skip LTTPR init when no LTTPRs are
 present
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
 <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
Content-Language: en-US
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
In-Reply-To: <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EuLQrNsW9gUAMjKOOrg2TbEf3uDa9UOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfX2vSfd73qvTcw
 TRDwSDPalBDpNk2GXx2KvxKVb2tSN4pvPqmtvlpqBFKBYFJihOcoVE3EcTP3gPQh37VDoTxm6rA
 MQJNlruFtaDdeDrgf5TKAXCNuEKpk4tfqSROqAkC9IaZxiyMe6TmPi0tuppZixxS+1edJJqByNz
 VmYIZfJsma+3ONUDMjKVHPkLLfdwYPs6MdfquvvML7XJ8bQO+l3jYzG9H7c6KLaIsKa063sTSJm
 UikMQVhws1R7vekBGVDJGgve0KxnVkuSAK4kSNxSo70Qa/RRCNhm1pq4a7GJ/apnNTYuWXlYyPV
 E81PXl8z0g7XaGLkRtroMrvVR+Zmqje3PoAebo23P4D1KV+nBmO+7SrFCfRCcMZvDd8ePARU/C4
 C/7sOMuLTCsTAaIyrSl7naN6gwL4fHYX/KUn58qxN8F+OrYMfd273n6rWz/QKdTsh0lKEMtsLM4
 xlkLL2mTJ4NKRu7ArRw==
X-Proofpoint-GUID: EuLQrNsW9gUAMjKOOrg2TbEf3uDa9UOK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfXwKNiSZBxJ3+v
 9dsUpbv3ruX8c1lLi+dxRzzRUByuOEHwc2LKZrHYcxcV90RB3rsLhYHi3lReSX+Nk3XBYmxJRbr
 B0+cr5xhJxQIo8m9366O+MhNQMtuXdQ=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e878b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=RZhGKP1uXM2L-Qacb6AA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070106


On 24-08-2026 18:45, Konrad Dybcio wrote:
> On 8/24/26 1:28 PM, Saurabh Anand wrote:
>> drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
>> negative value on error. The previous code passed the result directly
>> to drm_dp_lttpr_init() without checking, which would call into the
>> LTTPR transparency-mode setup with a zero or negative repeater count.
>>
>> Add an early return for lttpr_count <= 0 to skip the init entirely
>> when there are no repeaters in the link, matching the expected usage
>> of drm_dp_lttpr_init().
> Reading the body of that function, I'm not sure your statement is true

drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
negative error code when the LTTPR common capabilities report an invalid
or unsupported repeater count.

drm_dp_lttpr_init() already handles the zero-count case by returning
early. However, when passed a negative count, it still writes transparent
mode before returning -ENODEV.

I will update the commit message giving more details.

>
> Konrad
