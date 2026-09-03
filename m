Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D33F6606
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418125; cv=none; b=Qd0olDDAkie55HtRdxTekCowqWm5CHEA3q7J992nSTda6iLgbwRov9arRPPoV6E2e35YXSS+H9lG+GrbEISiyejCv8B5DLqU9H/jsh3cDQUwhfIKu6RQGGPQXK5akKZojApFfpnamhKQrqOUhpC3lAMm3BmEL1oZmyCiUuAh2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418125; c=relaxed/simple;
	bh=VNg4Ml8WWrvjIJn2pMNElqo92O0nPPWlpnfUKt/mm3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMS9o/151g3bZ0u6vqFxaBCDPV43czVwqbq5Z82Gz1P4df8PF01ra4N39sL7qA0vkqyyX//ciXX7ROKBzgK0LVJm8Zw+dhZZhg2ewTCNMm6I9n661OitLdpo32KUAjpY5OJmvIIfMgX5bQgRyC7/HqrJZBkVWmNbl/Usdfko5W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2b98CLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNZSJM8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2b98CLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNZSJM8h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lewt2596900
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 06:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=; b=n2b98CLg44J4KFtl
	Y0YfDBPuuhbPYX1R01CIULWMyK0UKLNd9NajiVai7QI/teJR3osEZ2j7HC5gAkyL
	WsveES8X2Myq507WFEk9GS958U3Q7k7opfxJ5gcAgGhmoCHg8K9NViO2C7NVIbhv
	mN8mp/e7/vqevkFGqGIMP/4s6Oj/WHt2ncqp8zBUH0KaHcvazRZVo7PRaPn7Bio4
	fO+89s35tJqnvajZJGJj4RJZ4+Hc6wfajWhBhtDdolYIGwH7s+CxgS/G7raXkAuy
	4u/FLf19HAC7dFEg+rtEddKfg09R0Em4xPutClxPWdTf93StOzWXh01Wd3+4a/kC
	HaGuCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3yb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:48:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fbd0f0367so2858491cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418123; x=1789022923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=;
        b=cNZSJM8htQ1x64hy/piXJLlzvb2AgM6h/xWuNrUFB3MzUt8H5khSZTdYCf9GjjJOd3
         CnOMWmXGDfNc/QZGFh/ng4JvUDYogqdp+NLf+LY4ZpHayfCEVAQ89wUEmAGPJsQXmSEK
         9kzphIUBjiy/G4uDvnTCXbpuSC3E33SIkwAezndaJ4MBbjBfV60djMnwmpJXm1EOCxC1
         qx2pp3La9zUROhqTODNd+I3LKJ/qEtscy2wjvXlhXRRaWrvxunlX6WEkxtYrhVRQwsQt
         3TSauSj5aVCfTyq7o74keAz69HxXCPEhlfYdBTfJeOm5pEVzB9JzaTNIuZzMDq0xmHNT
         qBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418123; x=1789022923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=;
        b=LFr1DDmvPYYxodSjn6z89oAdyXOI8aHFZeruv0ELIEItTWW/QZIil90dIGYZ3WxFeN
         CA4LgzJa+AjuNe2vL6jLxfHaygO+VNx5QnBtrr7iX9jSV3D0O20nzzOw/40LtKNwgkgh
         VhvCZkhpR3vAUsmYGt8+GA3Y3U/1Itv1NNty3JyqqlTGpMOyNtmbpB2ShjHczbrUbZlL
         B06nt82j8Y/uFPAeBDTcnYzxu6vVn1VsWYXUzolNLro513I9vpCbidY506OwD+21MAKl
         UJDJca4t0U7e4y7Y55NyS+23F86SUUWm9TjBYurQsSjdVpwHubOfK2dpopMAYT1p79wr
         dyXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6liEAg6gQ5++Jb4QfnwR39l6KFJmuxb/3nUJwSGebaZ5x5e8Qu7ybApvFdFZEjs8YxZxH/ZQlCGfXD64=@vger.kernel.org
X-Gm-Message-State: AFuF++nOEwOe6J2ekA8z5tGJx4IKjLfQTKZam8HYXe2pnR0pDuoZEM25
	3DimRpBtpJWnUUbsePtI+hTFUbREOWGpG86J40XYJLEEzhOrhBP5lToT+EhFQiec/YokX2Hrerd
	qonMvtTywFTX61sJA79obEiqoCeT8NDFqT9pesWat54ZasiylS9rXuAla6CCzUDKCRpM=
X-Gm-Gg: AYBFou1LAg4nfgwFkTEMrp8K+AEBlXqqZdjzpQE3+WX8J8do30O94G65iMNQG3uuecs
	wnYh96WkeZcOuKWKum3pJvUjzs0eC2nMjS0LlJ9KDQ+G5SLKHikc14a1stvAhRRU+vVidOpnqqj
	Hh34NkuGNTmL6U5QYQWvaW+c9luxp48qI/AWYR6WhSIqvtU2sN+I9Aakn3Y80dkKYH0ILxUpmyh
	6W9/aHuB8JK567q67vc96vGoceOhLziV3afarib49CvAo8J+FlXem9Q32+VTxC6Wrh12TrXZ3T7
	yaR8TfIgcR5Ph3X4iM4nq3ba9s73eCXSTwaNiLNzM9AWrSGsB25cswx+KeMse4zqlayeuQIJ3AZ
	16EvWCw9q5CZiZkkk3LaNtA==
X-Received: by 2002:ac8:570d:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-53036d47004mr82357561cf.5.1788418122814;
        Wed, 02 Sep 2026 23:48:42 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-53036d47004mr82357281cf.5.1788418122392;
        Wed, 02 Sep 2026 23:48:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9432b6sm1838033a12.24.2026.09.02.23.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:48:41 -0700 (PDT)
Message-ID: <30b0ab70-b4d6-49d1-83f3-f53dde24f817@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kCZJRclZn7wPE55Ei3_SdXsNSKRO1e96
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a99184b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ka2OnlH1bFlmAtb8fSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX9Z105N99lokM
 pTcDMOzxZqVLUZoE1GVBtNfR4J0erOjv7wUJjyX0HxktJY4SJBPgryZlUxto77y7c3H+9LwqGlE
 ZOTlCspJ0K1/Y2PzHmwppOukqGuZAIQ=
X-Proofpoint-ORIG-GUID: kCZJRclZn7wPE55Ei3_SdXsNSKRO1e96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX+m7mKOCQdP+7
 0jbqJcUsB2VcLXNn6QZgXVHBVS0OgUvT4Yw6pmX2BVwFBwMOuXvKGuhPa8sHEgWbUpYbj08Ij/n
 s+nenP2xeUSRE/ZDTPac8ewt4G8z4VpW8RLaFsBmBHJu7umSvgEDi3oktdjWmmAifyHNk0o4Kva
 v3yd7prwL+++bwJZQ97Xx5o9RLQFJvmWufDXlZgJ+txazNhGdrJs8ZIjeInWJlvcmXquXBnvWBv
 NgO8B51Y3Bw7P2jsSO9XfrJgGhCrGZDn4HWk0bDVtD0gEPlIXvOA9wk/brrCDDK7CgzGNPF5+a1
 WvsZFy7h9I6GF+KDyetbC+V3Ip9spXGQDNQn6ZDB22mYjJZ7Rvj0w8Z8cB5X326Iy2dwPFsmelA
 g3q26f+53hriOFDO/w+pD8eS3Nl90fDuensj1v1q7/pEDSN5uqR3+CCvqs80OfTi4ic6F6JKb0C
 1ILFK2390Aq+sOAj6kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030059

On 9/3/26 3:43 AM, Shawn Guo wrote:
> From: Gourav Kumar <gouravk@qti.qualcomm.com>
> 
> Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
> Glymur's UBWC capabilities.
> 
> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

