Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705427;
	b=p273bz2MzxINbCp6IvbW+MBS/6FQbqBuqE+i3D7ysnrMjNFm99YGuJOqFqVnqfbFaSCA
	 tpwG3YlqaqQKHkK1c02LsgWapSp7iW37nFJ/FP8ITQUNGH6e0YWxkkV0IhftULUf1Xa6/
	 pXHk3qQi15cilXwW3tbeuxIT/dz2CKlgA/p9LcMu8yhK6Zr3aXHibypnke2DXeWbxWwos
	 x//GcExBzWWIMsIWFwnhFxgC6Y9LbV0UPqGk1Q4o0I8u5zYlRKP7LpLfES4gmWuCawvcQ
	 BlL2Q0TtiZSSgkTp40vON1A3QiNHtbfZ4afKKZyDZcu6TmHZ0oEyBQebPDmjlleYR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
	b=3cKar6RP4EA04rCt9b8ExZAuNN+/fU7HR0Ryq8Ku/T7e9/veNkH14qniD9xTN1f3CfaI
	 GcgYCFraQgDceUrqOuGKjPs+HrjjqGwdTcQgtC5QjlWx21J46q43ir+AuDjWDK2WqhPmH
	 Oh3oqQISh3e/iMbsXZN3CuQ8C4WB688VUiKUbIoPuCMVzAGvGGcwavSgRhG2cCnkDEE0+
	 +e3PuMMofHMHirgbWkmmilU3WqWALIByDtKFWjp4Y9AbUbTDbh7kzu73zwqbegACXa93j
	 rfe87tUXY0bcMV2qen+uoxD+lKSYlkKSr2BW23B8ss5ppXHzy+cg3v5Etv5sdpy/t6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtRFm+43;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URhDYdLb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81E606C57E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C81E606C57E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtRFm+43;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URhDYdLb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAScL1594041
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=; b=TtRFm+43mkhdOS7p
	3xzT8ukoiVZFxLgboLbyziImNglLnXKCV04/vNYgNWs1jb6k/1LCbvpoKumIz0oS
	xqkw8Fh90T1FssXYax9/hFM6ZI1QbBxkCugDQYKUUBaac/jFVYj0uR8Oe3/3FRFx
	H9ybX3xm+dykDMebMWwvNSMAIWir5r9Y7ludiWMkAjvTLXCC13WFP8bCu0xwQgVZ
	5SggYrCxIWaDAHWghi4Xn/RrP4Qv+9cRDVYP9mNXnSL+x0sC7H9E5P4jwm1x7drL
	t0ck19WmKdlUmOP36rI2LgL8dc4JCm0rMaVscQ+ijW/PYAuH5790TEEkP9ACcfTI
	mTdfMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081ufte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:30:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso39977285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705425; x=1794310225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
        b=URhDYdLbIr18cbGa3b7LNZGYqlFEqXyqVCZNVg4dGuAJo+rNJZ8spqSLfe0LAFH7eC
         LTC+1nCX8KFbLDyBKOWWE+d6py3ggdDZhx1LpMAupfQrqcVQgnl+Z5rdbJCLJRqhE1YU
         verjJLKOeN5pNtTbS/Qnz+k8pjOqfChgcgHI0W6iqGojGzpsZcXugjKHCUsCm/yDoS/Z
         U6kW0zWGnfV0qcU8gqVYVrgXMwA7VLl8Av8Ax3eCjMl1lCNEOmMdTb330dal4dsSBVj7
         AjxbnvEuwJ4Uob2cX7eovMLb9MJnCrqymCzcALzqeRIX8luXPrfA14phRojRKd3PkjWO
         9luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705425; x=1794310225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
        b=QcRI6iPtx/GF8cxnjnFdOUFCSNDPsyzz4fp5EQ9L2EV0TvUNPURB+xTCxynQSEwV3F
         I9Y5oVh9fmKoA7GopYK6x+6479X2jLv/qNOw7zEzaCKECS7FjCRDLkNDF2y7IGV6vptQ
         1YimuPNUt7pplonOeYW/s7WUrz4STSvsbLjRmlX8W/i/hfcNLzOux2vZ0BtbzpAbukwz
         a9bqs9c8PzGXdr+mlnVbCMAUSrgFUJRZJycGa1cpwxEr3eS8rp2PJIJLKVPoCiZLAJ+v
         wAZoukglU3ok2rkWEmw+/0C4KU6K4R0CNXe6NsGvu0YnXBnd/GWZFm+5h1We2jzHtZlq
         nr6Q==
X-Forwarded-Encrypted: i=1; AKwUvByQD2mNhnpN0PUYzpmAjONvR2Ztg6b9g5KuThsdA5xzN4wJ8BKsf5xJ5dVa3xXZuwWs5U394Z1RhynE36Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SaeUiiPlH4EGvEmVS4Ezp7vfc54DbMX7gSx0rtmOrct8Gkm3p
	sbkUYgnJkBPo8UacYJ1GgbqLdoJJNw0JeLrLcrpmqILkOJVfUz98YKrkgDtXEo1/CY+gZs4TXe2
	3ep2QlsAT/7jLEmUUOQRi6wYdtuK+pIl5TJiec89Ie9RsYbnigKKved7rgyNef7KuH7o=
X-Gm-Gg: AYBFou0NUpqDy85dDWCcUzGVkd2AZ8PdoA3tcKGclRKlLkS2pRiiBZRFoss8zB52H6K
	Jv6i/GwdR3hn/UTkZQYN23AyLnOHqT1Vm+m17bmVf/Q4mZVgH8p5kSFQCHhxsYrtY/Tu9DduCXH
	NXiDsoVRq+7b2h53F26W2HhADQnvqFHsSDWpn6oum9PTDt0qvPdSbPLvbJ8y61KAsG+oClOIubN
	TVTFKg5XCQlJn3n1L8qpF9pEhGWVWrtNyRjIb4TajIB97OqSpT8BEw2Atcm4x7TZNPPsqDUKyew
	10Cw7czvMLH5Y+KQjpfsCpPKhG/VWptVdpnu5cocCT3b5to3sd2aYi/DdFXe6q24pVbOAcAosqz
	42E4+Ui7rrua4IVQ/Eq5ve/JZN0SywQzgjX++kL1caNt+1A+EOP01qROPhznQpcaLnvJVVA==
X-Received: by 2002:a05:620a:a7c4:20b0:945:c3f1:4008 with SMTP id af79cd13be357-945c3f14cfdmr411366285a.2.1793705424647;
        Tue, 03 Nov 2026 03:30:24 -0800 (PST)
X-Received: by 2002:a05:620a:a7c4:20b0:945:c3f1:4008 with SMTP id af79cd13be357-945c3f14cfdmr411360985a.2.1793705424067;
        Tue, 03 Nov 2026 03:30:24 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefc972sm76300166b.35.2026.11.03.03.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:30:23 -0800 (PST)
Message-ID: <0574f915-51cb-4eb7-9d6b-49ab32aac553@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:30:21 +0100
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
Subject: Re: [PATCH 1/4] drm/msm/a6xx: Restore GBIF CX config for A640 family
To: Val Packett <val@packett.cool>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261103011358.65398-1-val@packett.cool>
 <20261103011358.65398-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103011358.65398-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX0J/W9cz51wPP
 DNX1y987KKXYoA9YArSq1iq5FuppdLuY/whXEzccw3988LLXajb9L97vbuAnaf1oU3v6+VyiWpJ
 S0XPUCvyb4Dabv2EP0UXoYVtbGiybRU=
X-Proofpoint-ORIG-GUID: wj_TT4PmBJhfoSn3ixBLdupAQo3HuMq5
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9c5d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KkZ6ciwvikuB05GOVvoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wj_TT4PmBJhfoSn3ixBLdupAQo3HuMq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX0zP1ZDNwMyYz
 AQoYuqZDekob5l4QFkOBAhJvj3ogyGnpvhBCEJp0eg/wmF9xdC4auWTOXDvHX5bKN09+rgfBbCF
 UUvdjUaZGSyCEStH3yUON6n2sQ98ndE7fUio6qUPYXu/tfFpWGpDqX14Wj1z+1PGoCGPDbUP/2U
 A2G6NZqXn4KdKZTXe4zX5FK4BIm7GmMPECaxCnBQ+yzvkHxkvqeP/tvssS+TxwTrEpjCHyt8pA/
 xtnMKQMoJA0pJTBAUxzWNOgRmjMnpqF46knxNcGKqtZdNFjTlykeg/slHF5xmdpEBpolc1tkF9W
 M+CE0c4G5SKojahS4JCDXVUBPPzpaKQAa7FOlpnEF+V7Jt2yjbMgKT1vxMhks9Tp/yzf6Nng3Bg
 FlW1t+zPhkmEIiaIza6n2OY0+WXSpryuGLUIR6GvkqhfVRavrvpTuFz4qDYLAvNJ0/JGQTeZNY0
 2RhQqROCs246EoD96fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/3/26 2:13 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Commit 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU
> start") moved the GBIF_QSB_SIDE{0..3} configuration from hw_init() to
> the per-GPU catalog entries. Previously, it was applied to all GPUs of
> the A610, A640, and A650 families as well as A7xx. However, the A640
> family entries (A640 and A680) were not updated with the new gbif_cx
> list, so the configuration is no longer applied on these GPUs.
> 
> On the Surface Pro X (SC8180X, A680), this results in GMU HFI timeouts
> (e.g. for HFI_H2F_MSG_GX_BW_PERF_VOTE) and GPU lockups shortly after
> starting a desktop session.
> 
> Add the missing gbif_cx entries to restore the previous behavior.
> 
> Fixes: 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU start")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
