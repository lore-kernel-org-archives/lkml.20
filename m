Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A038DC78
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025428; cv=none; b=HrZeKTBE1Z5ygyHbVk5KPMBWIkTvJ99ahRWEGjvXWyQQHihsVPiNADa5IkwB6jJQLGhQIh2OOHpzKvaWL7sRjs8rKD8WH1ItplPYCgt6OY6JtB/Z1wNtiEGd3IcRzzdo9hztCmwsaEy4ffUH+Th/mxk2w3mDRRBTilJa70CxMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025428; c=relaxed/simple;
	bh=vrht1znXt3uXcYuBQYKysFl8qOVtK7VhAGNmY9fRB7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chJymnssAWjug+o264Cwklxcw2wamL0ZDsATIPUMjYKeigL6XKs0BIZ9Lrs/K5q6ERxo+WTUH6uVHoeGqyaEAVqfkhdESTk7YgGZZibtYE9pyGvfdGb/rID7/GNsrXmWscRTGT0SjeJr55xeEXm3VOLdsaAi3Nk0jHnHGO9swQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRauwKF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbFQPAXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRauwKF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbFQPAXN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GXW04187798
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Iwsy/k9/JWXyLyPK7PZA64Yi
	AApCiTXPVY8YLasBJSU=; b=LRauwKF9BEv+Ycnpte8YLZ1VE4QK1usNB5J+h3oQ
	v+lel0VHP2JPdUpx+euONLJYK0ejeeTNo5tIGn7EBqk3OgmSMMqv3V4+EWd5BtVD
	kuCwNBc7RzDwEcFQZhMlvEtRqua5lbSiAIfuWVALWsPDhz9nsKa1+Ld10l3b8gte
	TEnQ26glGhhk1XTwFQYWYpVP1gbW8eGA0c0rRWMFyyPlGCFSC+LmI+UCx5vfScPg
	oZhrn+ZS2kKcFPifIKl9JcSGbGMmSVVFYMVaBr7YNlZ9/0BJ37btEvgnGPnvsWZR
	zvjMgRIBNSAru307IBnd0MCFLEFFyWidn3xaBJkgTG2Jqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtn24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so910256285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025426; x=1789630226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iwsy/k9/JWXyLyPK7PZA64YiAApCiTXPVY8YLasBJSU=;
        b=SbFQPAXN6SrTJ9EwsFjUptSKuk+g8Nc0TS09k6A3mUxDkNMvW8kXY7pAcXhK2FWfeT
         KSRv4EMIbf+QpYQMvBXDvGrIWSfzKA9FOZyLzubqKF3yB5kwpHtbqxSMFe5QsLIAUpcN
         LE/Pe1Abrld8bnUA+3GLrK/WA0H7DG2Fo2HpoqWh/tRd0hURboFMI6Okpe5V5MnQ1TRo
         9+nnyzDi+BM1ME13KWxG5DGV5EZW86JEsBxufsATffjp3NFvIWYpqcjyjaR1eIa/AViL
         8daanEx6sNrF3353sDgbh9f/wC8ZPoywq8ZN8R8BUcI5/U5hsomAsD8J11fyx7wfn1mN
         ur4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025426; x=1789630226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwsy/k9/JWXyLyPK7PZA64YiAApCiTXPVY8YLasBJSU=;
        b=TQeiD8NhMdonoGP9f/P5jRT5ttLz+ozLNiqmAf5c9rgnZ/zuVCw6ZaRFFTPbbqrVie
         WA1Z53Pj/EhcpHIw636fyYU5n3wmr4RuDws++Iych5Pw+DxY6XNeNL7kMHpJcrRknDYe
         H1BrvviszCTEk6d4vjl9qXNmDKmWuupMJ1crXCue6BCO0leOtscvoVngRyKkvsRmJLeB
         a3MmXkwX09EzJ50rE+WFhz1gm+0cOBnyFIhH08FhKqSzR00bo0V+t9w4w+dweGv7nv2B
         NcoAMVLYULe/aOoaX9v+US4TpwzSMcMOQ5i65aQnz+yW/sORoRhBzzriVuDkDaolLSHh
         OzKg==
X-Forwarded-Encrypted: i=1; AKwUvBzZsDyqEdeb0AdkE+hVjfg0kuLUpCmObu4M1DF6y2MP5UI1aO+fVwHphckqHQ349xCG5mI8EP3w/ZoLMXU=@vger.kernel.org
X-Gm-Message-State: AFuF++n+jHK8rUpmdTgUtfWAb2+fFV1UrqVT8W3abDmX/9iVgnYUSGlz
	jxxO+hceh89zO4Jbak3n+nIpDPe6sWxXuXfY+aQ1JVP4lyKkI1UQNHEKBEyss4Y8bPjHP0VphEi
	0CyDbYn+b9KvDT3WigD94a1RwvZciqq9cvboTWYfhym02fiV6w2rxfjuwf/5+rXZ/id/ltSnYvR
	o=
X-Gm-Gg: AYBFou0U+2w52SSgUD1EHpp4ZCqAUc6FvuORI7TV0jxwrGpthjWIe4yPe771OL5WSkL
	0yCOZ3GVSrh3E7kISaXtqbDmazIF8y6Cfh/b/FV9WBuBUggXcCGtafamyHcH3y/MHVv2FAIXVde
	5nRJQxRiQ+kORk5u8edB2aWDQKp4oJBgkHrIWdnKb8khEppevoSZaqNbhCiXKZpNKt3qHOIdtu6
	CkyzaHmAkhzd+jGPoeiR9s92t2RfNo886Zb4LNLxh0Bb0Us5giwO1Du78UHSaja0pSQVk44bieq
	OMCrB8Bs0xpIugHfY8u7kMMquz3FCfdDHu9tr7D+L4hFhu2Jz88dmi3m4wWedOtj0/lhJMq3tXG
	58u+KKvW4JeIH
X-Received: by 2002:a05:620a:7009:b0:939:9d6f:91b6 with SMTP id af79cd13be357-939c94f0f1amr1437922185a.42.1789025425591;
        Thu, 10 Sep 2026 00:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7009:b0:939:9d6f:91b6 with SMTP id af79cd13be357-939c94f0f1amr1437910585a.42.1789025424776;
        Thu, 10 Sep 2026 00:30:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm54356958f8f.33.2026.09.10.00.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:30:23 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:30:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] interconnect: qcom: icc-rpm: Don't skip small votes
Message-ID: <adpb46vmpnr6ypnzh3jhopyqlrrfjgckkfe2xbldw76emx5zh3@k4zxa4y4j6nv>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXyGzNsnyQaMjr
 s4+5UtZqQmpw1gJ7S1xNPaVr8/3KaHmGESrqhIyh2dhZuRFlqV9RIH+4KtTHFKldVfaJHHv3sMa
 NxFlbZhX3VdiW/sUim8F3KyBLrO33vlCVBisvIQQ86tzGVmWP6D4Y0/VOp6u/QD/phptalRR5ND
 50a54mTL5TFkWuu2X6fAAVOCu12bZ5sX2+5DVA6f0eUuplWHVssWVgcPrTkkLlEXCaeo6qsI5Da
 6bLsFt6jP3r9X67OOmmXHLTIbbg+mSVBi0G2bTVMsfz2/JeqvnDHgGuP1h0m8wOyGr8IplioPEt
 yPkMiLLbb0lnKWnDlKp007KAHLtRoXBBra2U4zH7I/oM1PMX7ozlA6cNWRm8SMmT4Soa5zd0Y/S
 MV8kNJ7Q+M0IeknPBiOPpQbNM4X5b+e0XnbCv+mrheEhrQUbvgwxLLZIIfiJl8kkHs217f115D/
 HQ/UJIm+9WQTjQ9OPeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX+8L8So86JYfJ
 jc1fcx4I+uzNMfE+b2jJEdRxYHYXBVyOc64OvP9PBYnXdaGj92bVQMxya0gWTphGDPj4kHzFcat
 I92xSD2V518ue3Z9H1smw7Zm8rGJRrM=
X-Proofpoint-ORIG-GUID: ZsdCDyUGGXxgeAqgEBkX5QJbrrTpoXWv
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa25c92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6T9HyGjP-Dkx_CtKVfoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZsdCDyUGGXxgeAqgEBkX5QJbrrTpoXWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 18:41:55, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Small votes (such as 1 or 100) can end up being rounded down to 0
> midway through the calculations. Use qcom_bw_div() when dividing to
> prevent that.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
