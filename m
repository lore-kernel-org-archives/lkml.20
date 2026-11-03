Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705654;
	b=gf6RNXiBHGEKlGi1mlRYVEyIqC12lT4ZYJGrT96SXpe3gpHeuvEUOvYllC+4jggN2ZXZ
	 wdwxL+2qwCXa8h93lKceyPPWbmQ+MRUZIxcmQsStF3GSjELqbD+mkFdaCpWnkvKpFzWbP
	 0bNTX+yr/vojOg4F3dQyLJOYp3XbALHpZAdMoatpbQOOYQwzkRHiU9ptBItBvjfPjzl83
	 29qFXYT36nng77ujzvz81XTlJdZr96KGHaxEV5PTu0NqhIv7fkLdwziENT98RE3m22q1b
	 9YZXCCCQFfqBsN0zNiloPTaTrHz5wZ/QG5MRshuBIeWOgDzivMcK/omxEd3WV2xyUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
	b=QzTKBimoxthOnZoQQyKV6+LmYyjZGM3WXInniD7GdMuerye7dtaYKouccDg/FF0+Hdts
	 79ue6xnVJLdCH9RVlQx0HKl7Qv6byGJ+6R7aQ3neQK4O2QBMbdE8v2EXMAFftPV+M5VKc
	 E5N9IKVJj09C75PX6dM6EUgLBr6yWfMXaXgaRHDaRRvaY39/nOt9f+auKeqjBgqs7SZph
	 3ppV/QGLiIedKbtXtc7YK+3Hqrwo9cDnHmXlBxlAPd3husXDTNMCriLwQCtlsMxIuAnt4
	 maKgf/6GNuHmncpiL84oF8bkm3LDifQ12cgJA2rQJlNF7qAkvhMOAOfM47ziaP9/uTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AqoUVJ/d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MISw06+I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F585606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F585606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AqoUVJ/d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MISw06+I
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAFPl1476096
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=; b=AqoUVJ/dxBv4VgJR
	hreNW27lhBeJqbDR2aGvdFn6GgIwlabmn0rlabfPbX4e8t0LOnvyYdwUVAxCZmjZ
	Tm44HSDuZMgeN3FMWBE3KizomIQx1ckXtqNuu4cfEkk1JRVl6NlHDvLcIFgnDukA
	qqBy2wBnU8eQsxWJWZgeOu6Ujled71yjpbP15eOaL8Y76ni5hgjyVscKiOhceb61
	p36gErY18Qm9Eevb567PFH6eAaqFf5ZUpzNitRVm/0ik+FYcl/tQgFjhouJviqrS
	7CFs03CQgQNSVYX53ANs31qrYdiGSjL7BtB1ZNEMkbT3W+MRxG3lxkwT73C38+Lz
	6oZ+oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hj6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:34:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so46109985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705652; x=1794310452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
        b=MISw06+IxoqnQPS1QDrCXhr5U77lvKE0DudgMg13VAp4pEy69qrkecUlGJVaA7wGma
         HnVGJ9QZ6OAj+Cf0G9f4qLCSS2pV/jEZPVDTGZZfE24YXU/ljSItDHoTFek0+Cj1aWTa
         PRHhm6WW4BP1GKjbxiT/beuBcKVlInHz+GX20pTyCDb8qfF6bebOOeTWz+o/xk9FhZGR
         iz+iVXuMnaZ03lLWP9rnkZl/TVjeYu3Cm/y77TmB7B87S35VubWd3A1kzYc5BH7dNzoY
         dAu69NE/UfbPDA+BY1uMG/MGMKADHobteMr4ELeVSRWyolsuupEvrOardFVRRcfR3z9j
         WQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705652; x=1794310452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
        b=FWvtZ/QJdYwuRc02/eotc1SQoiop0IeWfHIWOk4dhG7OCxuht2PQ1QUd/qIq8D4+kf
         AWkD3w8UWzqZA69LVVaHT3DiLKrZxYvAhZRg0jGnkW3D38BTM06f8eHxUua6ndQ8ZxtF
         HnptG6EHywPtxqO2Y2TlOsa9jSWNL2sy429JXCQIMFAUBnQgu1TAi2gSLxrjDZwBS14S
         IHg6N0bgnEGxjICDtT/bFOBmOdUwFb6SYj/whBiD5sEeWWZFv03pH2sS/qCcFweXA/CU
         YOmoyiYt9zE8YKxIHuk48v/OyBn9wJ+ok8U1/h+W7DIE9OfFh4qUk1+83pVFRGhp1TFe
         r82w==
X-Forwarded-Encrypted: i=1; AKwUvBxl9qI17uz8ZttR0Y2WzprQeRQHg4hvpoChk79INBqStwH0EFH8gTugnbbxzRtVnIGaQuX0zRyRN+pgups=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ELB7gPYko8DgjsV1XTMEbh2aFCKeCAfdU5JudHsdzBAFdWzm
	zbZUq2GlCJqxwU7MFUm3V5ZgEEAXdEMrT8RITSrWHl9UtTUicn1yz5id1Fuy1DyIJ2O8c4oc95m
	ajNsRbVDDeA8mJgq4GSO8nfEMOjreIVIkLH6UxHThfqnaZYDZGaQHf+kcUpCTZW6S5Pg=
X-Gm-Gg: AYBFou2YxCIeWNjjYjHGQoOYXWuBqmb4Exl94Hbg+duoVDVby2owdZ4DNZX3zie1YDq
	oqr+XYPiFUCdiOHu5DwtksyExS8+necKd0aPrw5qnsXlpU68aO2b0by3tCLZ4mHf7TyN5W+9/c4
	E4aGiAmOPNrr1wpIa6kv68u90y0D8hBhOUeHV5k04+oheJuy5pBM+eSE0Memh8jlby8YFbwgaEI
	63mbHDP6GQ2JRVXSQR+P67PqucsOh7GXAqtYBoPXbJ52wC2+2GEsHUfEiKvijzEfnuaLM85kOo1
	XbgRVTHJMk/Wo5DDhbMQlhyArwAK7Fa9L5R8K6I0oLdJkkvk3JBgcfUACVDUlp6m5IOVeBQy7XH
	wA3F4UhrQc0nrXOLVfs0QvdpruEBHF+RuJPl3dyCoaA1U1NmBX331sKRkavEyXbxAAiUlbg==
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr2304381085a.3.1793705652185;
        Tue, 03 Nov 2026 03:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr2304376885a.3.1793705651744;
        Tue, 03 Nov 2026 03:34:11 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec0751sm77048966b.26.2026.11.03.03.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:34:10 -0800 (PST)
Message-ID: <4974e205-c6f3-416e-ae31-eac2d8569b1a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:34:08 +0100
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
Subject: Re: [PATCH v3 1/4] drm/msm/gem: Fix VM_BIND range check
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iIxAL695qYt3WVy5t0JOMdbipkGZ9SWx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX9WCD6iz8T7Jb
 pNFuIJbRhUtyHcmWK61YcmIdnQMafNyuvIHOeI0qR7Fdfswxtnzwqfyvo33ELJHvCi8xRmDN+wq
 YdhFECXyqG3u/BMcI7/22QqZ4GrFRB8=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c6b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=chFjt-TYfWtG2qqLwSIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iIxAL695qYt3WVy5t0JOMdbipkGZ9SWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX4Vp2l9E8+3ZX
 v8orZSgnAmTT1HZmp2ZqRdz5wJ63btCjFtvt0aN2RhPEFXbA+LRZfe/SmQQbtYjg0FrxL163lEB
 6BOYzJ48RbCz1SYEBAvBkB0v52kNovxjOglLImMOIF/FtdjOGQCgFMJzpHryvc6FCa+lWECzBHU
 8/FBwF9mh2yU35BWzGtaN48o4chpyjG1k8WXHBTmHU0KVhracRys5J73OpWjtsfN9DiSUYVQ0xw
 Xj8eYtWEAXoe+voQABDyRA5QBMl6JIVLxC9fq+Jax5ofL74nKnbYyaaML59Mgceft1rS7q4/Nhr
 AuKjDBawdJgJTRtydLlumquCJ+iw2GpI2hOv/FjJbuMxO1UDD/2+4juUbmquqIidGx7iTeAE0mn
 l2ZVfLDAljdd/VAhTXE3gNjSZMlkHvvKKolqUsmBzX98Q6hA8yTA97PvX0kFzSMMWVP5ekUOQoi
 EBb+uwl8TcC3vZJrPLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 6:19 PM, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
