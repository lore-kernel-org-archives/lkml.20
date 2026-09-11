Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9A457E55
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146389; cv=none; b=bn2ercQ40JH1RO0xxmvmJyLoZHMKE5ABPzzwhY1ueh9Bw/O4aX2TrKfy1KF2ndH3NSHMQsDqSGFYBNeDCk3sVXrtQdp7aeJcRUmW7YHoaGaYn8hDAY7eqzLilqPlgxHO8syYh/kODC09Cy6D6G7/oZe4WBFiDCQSE+UUyRP+cYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146389; c=relaxed/simple;
	bh=jdfOT46mMGVnTtjhHdZMClmhgx/5Uauj11P8htZhivE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8XWAn6J6a3u4mxlbo11CBfaZf6DsyoRyOHoN+Lfkvul4s12zHc968SyhAD1XcG1xkjqkWEKx1e/qjCT5qAAn+d478Ubm+4x0+yGamBVHsN0VwOx8/UP48O9uxJ+uZl8GAQcMwKZnG6dtDi+uBbJnzlb9D8h7yOwbvs3wS22c5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYTMrLgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeHo1rj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYTMrLgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeHo1rj7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFfhcV921138
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdfOT46mMGVnTtjhHdZMClmhgx/5Uauj11P8htZhivE=; b=QYTMrLgnJnLKE5is
	90WEf9uLcWVU08WxMgSpv12yf220SbNrnaxMqDSnA9pTp7lYmvWONr/D1dPOsknI
	KG/N5luh6LpoC//eBJOHAxJcZZPUg95qaFIFIQwQrRAuQgWpkYmg+O2hSdMxBti9
	a1UBAOVhMz7PeEGvVNKB5MAVwbVxvjUZhPG4WRQBntR2ebzv/qqVPxBc+rClG8Ux
	Bq3+0vZvSVenPWyRf4el19VVd42a5Do81HOeW0j5VjjYyR257Rvms6nweDsicZwS
	GOMHtsqQiNnqZmqmdkBWynYCIUzfyb15PKONtnBQrQrDEEQF9r5Z19WsnRbhxl3K
	nLzfEw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmgv0bm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:06:24 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bc2e44e0so1443330b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789146384; x=1789751184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdfOT46mMGVnTtjhHdZMClmhgx/5Uauj11P8htZhivE=;
        b=CeHo1rj7iU4MobTBMuyfmdo/z2zkpo3kODA9WnXbARaviPtJXUKFkb2G3SFnXJSMHc
         UhXdED1HMAGmxHsg/nr2O1rkqPZUMJSWJU6W4rgRirsENkEpOI2kSI5n70lEx0ypfJb5
         JYXJd+s7WLLm+oGrKRi8XHxgb7h+MA8d9V/sCkpkz3yIPj/CA54Xe5OJbQ66bUgwXqnF
         jSrp6Rxs0tMsvaXYH8rkjxTvedNpa1I0DANryS3GfscZdCkwFpViSTMh7z4DrO7rFLJM
         +HeUaeHeflwUnPQrujp8maGnY1fisBfK62bsf9qWlOYfY1nWNAFx76/EECsZSZi3aUvp
         v/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146384; x=1789751184;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdfOT46mMGVnTtjhHdZMClmhgx/5Uauj11P8htZhivE=;
        b=ONSm93bxkVQFTuquKF2izCk2NWHBWXpkNw5/cQOy4bie3YG20i9V2GcGd/3W4dMl6o
         oK5y12qNtof+hT3vy5uehZV5e8sYgpaJTMOzc62HmecefQot03fXVpYPZMnhKzNbuKQe
         I8s9iw3wuYwXLL2LqXgwePJTbVFFBi7V3RJMFdNyhfzKGA5DStKPtnwNrUGDhB0zpWUl
         4fB6oeOv3wOJ9KJFcUlHNH9/WbHgEXEKqlmALy2YBTPINZKSaMHfPTsBiCcHxSRlZWqR
         tHhNuaQJ9FTBjCi3Yar8bdNjSnIv2sUys7LmO+tRPXe5nHsyWIAcREy3SL8FTCv/xge9
         phJQ==
X-Forwarded-Encrypted: i=1; AKwUvByaldt+XTVuQh5AfH5Rvw6NGPB69RhDOR8drkX3+7PafzF7sp1fH3QK/MiJIAzMLcNP2Ibf601tn5+kGyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mFcNlfkmvny3INR8wg1bD/qo83j4iyjjkkY6aFXhy4yRoLIpT/
	FbCGNvmyZ94jPnLAp2UwqTLO7Wh6oWl+ipP/MMNGvbHBJ9kLrk3fMnLjfQ44IYH0yqvl/LFUNEA
	1cmjWNnup4O+Scp+nZ+EsCiSKQek1tCPFyKdDYQCJoVrF/aRsL0ZdyS5uuDBPKyqjMSo=
X-Gm-Gg: AYBFou10ggCcQdgCYCcssISipJPp9KWr4SxcGzOktEFbkZ85agpap39qS2/6f9b9N21
	i5eIk8neMvZw6OrwCjjxltgB7pNgHA9A8i0HsF5+YY8S8sMvl9P0CZURLqTZBSlrXuhNAUisHRy
	u7swo0VIOuWxb9hmzjM5aYKmPUMlPnHZ7aM5YnzwYKbqKpHa5vI1SRJQbU+3kQCttqELJBgFyGb
	17QXwAgxzUAJutm5UtimQ3DYbdSoK5Qp73jJLnrUEyQMyJEoVCsbWXO/HSAvhfplFUIVWgIUEjx
	3jOOjyc9YFIPaDLquBLQuuB7GfmQPH1/fkq4SRlaeV8FffDNuNm7J11qSc7Kj1r0DTNRzwubGKY
	nMaO9hw1a2Vp2tQT8vkDL9CZnS38BD7j/1ivYS7xwXPn+pDfn+kufEW2JL6HB
X-Received: by 2002:a05:6820:5605:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c0bb3f863cmr4855890eaf.15.1789146383962;
        Fri, 11 Sep 2026 10:06:23 -0700 (PDT)
X-Received: by 2002:a05:6820:5605:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c0bb3f863cmr4855837eaf.15.1789146383555;
        Fri, 11 Sep 2026 10:06:23 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09a122443sm3710647eaf.9.2026.09.11.10.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:06:23 -0700 (PDT)
Message-ID: <5f892b6a-7c02-483f-84c3-43c1161ef251@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:06:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath9k: stop a failed register read from
 opening the RX filter
To: =?UTF-8?Q?Nerijus_Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>,
        toke@toke.dk
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260911014653.1566388-1-nerijus.bendziunas@gmail.com>
 <20260911014653.1566388-2-nerijus.bendziunas@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260911014653.1566388-2-nerijus.bendziunas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1KFC-a6RcRl8kEelNS6iiydAug2874MR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzOSBTYWx0ZWRfX7CCAHeTT1a3G
 fnz/xHxc8DGuGWnYQaMlbTFaPS8EQNaaOwU+ieonW9XPzghcX3yBeRwvaJ7Abbi70NUIvt5yvGi
 zW4ieW46E/Ka3SmhQpbSw5kCvjYrTpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzOSBTYWx0ZWRfX0X/qSDhTjGRU
 LrxbvnigR7ULiV0moFsmCJGvfS5NcHnMpJcnqQncmkGgnyExz4z3EVeAJtcbr+pKxFYP0oCisQn
 bVktZw0onTrlBBpNpev9d+mp9mld+R0VPVlL9JOblL1jMgMIJ+GIzAUPIPwGns/kf5nk4hUCaPo
 q3WzIYSZqyrGHivpW3oeYVix4BhqfJYPYM8CTY6E9RTEZQcxcWR9Wh+qhjuRImlDsYIA9uork4m
 pHSfE+m3PZAOeVosMWLtSp9rMWPwWYIhUJ2qXxZ71EDm8SVr8GYaopwpEMKnorzPle74nXKuXdl
 mXD4r7L7rX6QdpcyWkwJpint6P3NKuTZF71StPehyFVnmhta7MS9ot9B8Yu+t671GvsNpWdVhaG
 OA8cX1NmY7JP87yOph8tutH3K6z++oVuCgy0xrmfnOauuwPcNIDSWPbVDPeJBJY7xLyyhSWMvzS
 1dRUTYCq9tD4tmOtrGg==
X-Proofpoint-ORIG-GUID: 1KFC-a6RcRl8kEelNS6iiydAug2874MR
X-Authority-Analysis: v=2.4 cv=EfFd0/mC c=1 sm=1 tr=0 ts=6aa43510 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=oCg_hTeQ7_Ete_IDjq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110239

On 9/10/2026 6:46 PM, Nerijus Bendžiūnas wrote:
> +/*
> + * Set bits in the RX filter without reading it back: on USB a failed read
> + * returns all ones, and writing that back would open every filter bit.
> + */
> +void ath9k_hw_enable_rxfilter(struct ath_hw *ah, u32 bits)

there is a standard for kernel function documentation

https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

