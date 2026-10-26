Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008055;
	b=cPeUGqFc2vAP3F/auuNSQHVKjr7tvt+wtYVMW6BenoJpk7PavBz9JH9D74yXkblsDWxk
	 70E2hn4mKA2Qu+z+DpsH9HH4IXHvaizb4E54H/iJEM9402uvezEYnn8LrcDWjPtHlusR2
	 cP4d2T5nr3WiUxq0aUp2LEN8qbrdIW4Tbe75iGbL70CzH+TT4p1qkN8ngL1Pmyd6SgBfV
	 +La+2NO0QvZBkGwNFtBNajJrupVJZNu/HYSZzs6O8s1BdE1F1S92HlHE5fY2/8Sfqsz3I
	 aG8a54T863pvqGRc4j6hO5EN71/9t3q4j3XbN/t4iYb9KvBufDyCxFTjX8wTCzCmpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
	b=iYt5MI9IrxviGSxLhLjLIWx3ouaiNkunZtUjV5PRPhSwKD3ikeeKZ0r3X88bFL7NUSwy
	 zKNdt1yx8DCFphMkBFgvQmOx28Ss7fURJKiACFopi0/fhar06AkUFQaYTl6TjiedEEqT2
	 Mu70Nc5LgdBq8/X7p22HXDxV30ZrWScvhqwthL38ol6RQ6jgvDLQSvLYzxDDMRNQz5qKJ
	 kSFq6jvS0zG5kJJJpi0C5nMklx0WyD38lVTpMKPPRZKkVFGWnkqMSPHOXjaySL1sVN5Up
	 RQSsqOZ+Rcpbx6ZKDvY/4m+F+dznK4CkMHqerpkovEbZxNDcILJgLMwHJNDNRwHqn8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYNzNYxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG+qJitP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC53606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC53606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYNzNYxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG+qJitP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9Iw718211
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=; b=hYNzNYxNpZUjWKls
	QvHeOhnNOU2Nm+KKSGOdRsMeYRWFtGso4ZLfC5YrZ9wH6VCKfDVSxMyH0Uk9qE0t
	ggJU0bFUFTVsdpWtipYHDtwTmjtXNeSHCCqnCgrYwSc22hB8u0HXH8FFbW9/A5xv
	qPQh2h36K81i2Bxd2AHk4v1W/RI861Olho2RfSPngTiHfaUsDqWAeCtZBMcKEdTO
	3qM/nZtdagc1K2TlsQmg1eJvC+l2scyn5DUbbCMKzJO+y1rWuKEWHkd6cNblT3vP
	ME9ZRLZHWFuI+Tadro4UdwyrGDD4+H4Sk+s/PZz1SXmRoQTKmpfC9QLeevokoGEl
	1uYiqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssunx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso42773385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008053; x=1793612853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
        b=QG+qJitP858grVQ0VUiOw9QWplLb8jhRSl6LWABCfl5vX6ZR67gW7GhGr4WaOothQ6
         7b4//Ul6Vpk0Tb0g626q05ryOBIxcY1xrCgqFppc9qLUacIgZlblbWyxZ/+DBz0coQNc
         FGo+xnOfgg0+b8A+1sPnNIZrIUgzt/pElQi7gs9ISSljJK+bGOW4d4V9w7sRsoM9ZDih
         Pp+neG5eZFCJSDmOZLCOdcY3admYRdD0P5+l8SSCEVwYmXt8gg18h4lGkkw9yTSHUiMJ
         eHf97KaP3RuIokwq7zm5MnkjBFB5bRboCcZmkrUuo//eEh1I66PJoK/9rMPfnTHOTKDw
         Rylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008053; x=1793612853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
        b=hfua6oW8NYlG1s0MqdiNXyUrSJhdoUxXqw+/dXG+VzGzTLz1p5pMWvXWiJF5lQSo8h
         waHwa4g2o1A/hgZVQ3u3rr/1dDXdiGJSMlVJ55JQgv7dqfTdzyvCSSWX1LJyzAMfCu3z
         oA8/ztbLgkBzTNHMaaL3Hy+Gs6Ld4rnsNU2dU2ft3KSF7n3iNkINcM3bZlDYdu5o+ij4
         067HY1AUH8WIVshaGWSiMeb2hTPxnJvJ7T8EbmH7Iffg8Pvz6MCttJAW9IFIBEJJsiIN
         KKOd5orP3HXWanMNum4He2Of2YbJKNIuBFCfjTODAiyQZD6GX4C2SBQ0mix3zPzW+LPv
         E0eg==
X-Forwarded-Encrypted: i=1; AKwUvBwpb9jyxuB+RNoWkjnNVjfyHUsNx7VDIqtmvnFG+E1iLHJQ+uwOqWfhLP2RlipHUnU/06xWzX//d0U5dOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5DHJZqw5+fMeVtCMm4NI1AKokEqIweQpbh6q6iKFVVwbOFhQZ
	VAZmlNGudn6y6BoPTxGdrsdhph9PKL9t1nTl9gHdHFLvcu6TGlPtjbaCgwjQHRqhNCTEW1/D3dN
	oZm2a2ZcV3ARnEVEYerqineax5qzUL5CF5bN97Fzl8reh4MdXhRmvOkMT8C6prSR4caA=
X-Gm-Gg: AYBFou39NvzolX+WaI5yTncY0P7nSn0HInDJKmlFGLP9N1iTzW0NkChPf6a/M+ahtQL
	kmTtE/ktYfVRs/iPbnWAUPc2p7zpU9NQ1jIGfhousemesOQzpgrzi8gdBfKUvWbskReTFGScyZT
	LBa4oEWoYMpTucxTSbeAwB0xglHf9WhmZMYFytFzb9wQZlFK+nb8hErlmx0jABo5KhfJsK9J6pN
	FI2fL6Wu8fiacVuGfqyuaX5psj4+9rSs7Hx0RTpMq9YBRTXfyOdNVVddFBnuH6m/Po1E87HEhBZ
	EfG4lhwxPt/6rEcuUM4HI5MRmdF8Bj8elIEhFKpRBla8eJ2rBGVsynyagkv7A5OQNpmI/a8LBLI
	jSQXcLjSCzu1slrdyarHNzA==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1009175285a.3.1793008052880;
        Mon, 26 Oct 2026 02:47:32 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1009170885a.3.1793008052401;
        Mon, 26 Oct 2026 02:47:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8b6sm295595766b.48.2026.10.26.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:47:31 -0700 (PDT)
Message-ID: <48d378b8-ca15-4e80-9c99-d4610f6657fb@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:47:28 +0100
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
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Fix GMU shutdown idle check
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-2-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-2-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX95SvINPECgXO
 Jio0mU5Mi5POBMJ4hGqEznyY8BZRIlIQjtT8zVioIZigtg3kxVn75ehaVINQpH7m0CMC48nGxsO
 pJUzHYaf22HwhKLxP5cuSysux0IJAs8=
X-Proofpoint-GUID: 4uFjObr-Mm77SOvtrYPs2pH0XKmUkdlL
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf21b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4uFjObr-Mm77SOvtrYPs2pH0XKmUkdlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXz5b669qVDrRY
 aUQBgfU7Hm3Y//kjXZ8kQWKqzcGwtTD9LPqzZeglx7wirivBIRlvoXa87UR7wIAjbZCKQNKitsF
 yTD7rLMbsjhPDjUl5/Uf6cqHLJ8iIzci6x5nxNRVzHfrSkMcRDkOzlV0mzXv/gAs6ypJetBzP9D
 r8MKfP5LsXHoY00sYFgTHqh2RQ0LY8NnWtDCoeS+cFxrX77rm5Y0XEjPlqVMVL0Aj0P00d5T9I8
 2B5x0wyn0PXNyR0R3O1nPYke8huJO5Cq/9qMfc5TfWaiz8aPG6IvZ4Kx4jvV/RltHm5U1+3qzuM
 P4mfzML7AaGNSwynkhiqqxDwHl89aZd2tdpSj+gJm9iAh7UPZtLOASPUclfpFaBEEzxWlpWHylK
 nzYioYdK//nyeNzx1u+fgxDPUASbECKFP9Eb3GVfm9C/oK4lc4wDsnP9GB1iIpZpCvdxUzH80U2
 F7YqtJBgAPCWqOisnNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> GPUBUSYIGNAHB only indicates GPU hardware busy status and does not cover
> the whole GPU subsystem. Use CXGXCPUBUSYIGNAHB instead so GMU shutdown
> waits until CX/GX/CPU busy activity is cleared.
> 
> Also, increase the timeout to 100ms to match the downstream driver.
> 
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
