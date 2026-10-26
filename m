Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008343;
	b=iv89p0zVTqHTFUK33jICbyft1MrXSiJvQb5k7oZVlDBvY+8yw8TwCi+ojPMVj3X5yG+B
	 ufeYMVkXWD0A1hFNSF+X6Sje2lQI1MvIp8SP0VEC0kb+SbM62bgmwTBKxg5AVJxkv4ATh
	 Zi005i6oNlUMgSGBsS2vjvxdaflTdII9QezvBBfNPUmohWSWUEF1MekeHhknFABi5yOsi
	 gUb/6WGlVrNNXANsNaeLvN6WwkiJkgCWlCGU3jdKxY5mCN9RE5MKTO6XrDvIBW12v0hMG
	 x0X/3K/EbkS8Dyv5UnDmw81bKxL+AY6c81yASNrU+upo4Uq8U5fGkZ7P+rYyGDOraCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
	b=hJDd6VM7UdXgNJkWT1K1i30t4B9lRD2EdKPqUNON701dOR2dZLkZXZoYAg+waFLlie6y
	 lHxGH9QhH56Ylj3BL+cqrxJJaqN8j3Cs8yUt7uBlTzDL6c9GgVQkxcUSM6DFUkwCEhy7A
	 PPhblFww7tR/aSw+1xp43TVf0ZAYjErWNDaAOasZ7qz2aSZwy8mPjpF35bKliP/pen2/9
	 vPciBxBtSIYUD+2H0Hr8KdI/JyiOyo+KrYEoDPhPNoK8oSYVUnS5fIKfFye3xZS5jliVq
	 laz3VFaO7U/hAlc5P9Cud0A9gfr2sNQkXpbE07H/B1B2t51o2vwBm5SVbhkoOtpMzcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UOt3gzwq;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+rnB1Mi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2582E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UOt3gzwq;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+rnB1Mi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPks2222520
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=; b=UOt3gzwqp5/X1jCI
	Io2LU+WTnhExq2YTUf2cjNzlQFHgtPXtw0/sJHWKWz6RnPrQ0I+xV1yoNqveIqMg
	eqmdoSjdoYV77ppTP0pCOOzNqaRrBhW9eiMjEquyUMO0tZ3mq66gl9lPYAO8mvN8
	XOmrHt9Hnr4Dwm3in1T9WD7G2Ep8yJ+eGBVMYr2Qyy/d5q99uMHywf+LRApJahI2
	W855lwZAxdOFCO+H4g4nhmU6KfKzo472WhR1v6NkYOcu0HERoAcrpAs3fphfXsIG
	CiCxxagEL+r9h4H8f6mSMDxlOE3xXbXjPxgxzAr6aM9IjCAE8KLG9AFHS8D4AOyK
	THpY4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9j0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:52:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533758f24f4so3747961cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008341; x=1793613141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
        b=T+rnB1MioOQWl+T7nmlOci7ECBw8ne1XGD5uohDVbb4vZ98NtsJb2jHcCQeKUMrb3q
         QJpAgYkNy8/tp12x9/Qja3cYBQNM4UEidD6BT0Kji641pzEh7gG/750iv7XtOESfu3o7
         oHQdvkbjF8NzjQq3NhAQsAf6QMwjJXHG/zEAIcHASdVe6B1DPLY8q0tlJJPZPx+CvXRV
         M+L9VTfq8tFK7oyTpDsBz0coO36My0aYP4GHNU3tHJsbLCYLURicisl4GoU0GFuPcGEo
         Bud+1Obb8vSsAexzV7h6SmgGKj4Y6zYZu0Qco9lFACOqQV6Sg5JYa9pWfCS0zfPKGms5
         kM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008341; x=1793613141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
        b=0eOOgH+Ui/bD+IaRBn4F9b+d4vXK6RhM5erN945JBNny1tZkstx5u0Z/7Yue1ChGHE
         YjANsheoiysVMgUsowrlVYKhAkdTuxofP3TpV3BPB4feqKHX4MmWdMxdcd3aWVv5yu07
         FwcUZgMiG2LWf44scD93iIbF3bvRSuI5z4epfV1eYjjP0yYYI0UPvN7ci5Rv52Dc41gL
         cLgEosiiE2clrRyw16gx1VBl0ptAWzl3hlGQrF5Njv2i8yRB6mWpCJ++LPGtZjVfcA4C
         MVI3DuCHVf2nSeMXZXsdNy+GlxI17F+tjz1zt0WN5VqaTBIB16uep2g3B/cTRJYAGeOV
         e6aw==
X-Forwarded-Encrypted: i=1; AKwUvBzspHRUfxUcUbRdjCXPblivmOsC0BPKcrU9FkliLj6oJgILhhKuLvgNSsXpc2slB++tVhOIBddA1OPx2tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm4hoaRFRJ+IRe5V/XStw9ft0L7JJgtpjzZMsBFWsJWHg6HuEv
	j1T19f0M96JkiUPS0uWyynCJo/AF8fi7yywjGF6lQvsm2fPWOVxE9mN40rBdtWhtroXxM4QoLoz
	M/mj8j3npEA4lLKawraD3KMlgXDWQuC9Z3IAXgS6jIJp1GyjriZqBl8QniC25rhwTDDE=
X-Gm-Gg: AYBFou0+FMykcfjF1B/3v+eqjluEm4r9kzLL3jYJb36S0MLDr7SaHLzxe/pJn4stla7
	eXhvR13NsnO+IoQkuQ6cdWkO2wUJnzNQLa93z1VPk63qcGcoAf3oK+t5IUKZOLuq7pn4ezLwXBf
	n7IGlOg6GU9ZU+C+iNjQKLknrrnjOme1bezG92TnasN/+/0ubJK+sZ4J2ljdcsPWQfgQ9b8AedP
	gL94Q2a1yuVmSBwI/pd041gJfDv0PxP5xW94pDjXZz0x2BvUP1Ibox6538Y0yzd46Cr2/0rqcqC
	uj9VEec16dvkgu1KBxmMI+BVxq/ttAdoRdbqk/QVHcte916BcU8ESd5hi2zr13Epppf/QH9twMd
	/99u7vdSZgnq8c7ilDd2q0A==
X-Received: by 2002:a05:622a:6804:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-5383b504b5cmr93393481cf.3.1793008341267;
        Mon, 26 Oct 2026 02:52:21 -0700 (PDT)
X-Received: by 2002:a05:622a:6804:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-5383b504b5cmr93393211cf.3.1793008340839;
        Mon, 26 Oct 2026 02:52:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm296717366b.74.2026.10.26.02.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:52:20 -0700 (PDT)
Message-ID: <5d732b4e-4558-41d3-8c89-a2218c93d108@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:52:16 +0100
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
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Fix stale boot up BW vote
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
 <20261024-assorted-fixes-oct-v1-3-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-3-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q2Q3NusGlLduoXNc04eQ0AM8YK5ciPZE
X-Proofpoint-GUID: q2Q3NusGlLduoXNc04eQ0AM8YK5ciPZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX7Dejl0tOTDHq
 LwrkIcsu9Qem/nnWr8vuWyt3C/59qbk3foRj6KPNKfrYQYRROMi4gy9hJIioUGEBW54XD8RuYRH
 4SImJffYqCc4w66OQR7gCFJSSUX3oYk7qsaCw9DlfUpS22ut9X9GQLUD3pprfmsth2eEjHBqRej
 ZnC4TRL6ng4uVDObV/KVCzcjav83oTi/dtiKw2QcJkE0JZFSq/a6CTqvExAEVM6UuEWdGn/l2iy
 7te+fzZz6NcQ+rcb947KZyEP7QT/ulJmM/daxMGipw/DrqdCGVpRr8FI0S8+6qcIAjeUmEhjUf9
 HZZC90EuB1gCmzGTYa2bmx91GzYUSTFcy2GBZOeFo6fHoL9LqCamdmNAp9U5fyWsY4BCILbqmde
 crmKeFVL+w1FYx47tmdc6qmPw6yPSTTX3Wlc/mYL6SZiM7oAlp6rrP7coETwUOl72VLuRtKqZy8
 I6MZThi2y65cIrqxw4Q==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf22d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1Jnm8Am4PKJ2EhgLYOkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/61lm5jZy/UE
 9/JO/cKkGIU9v/9SVksRRDtU2kWt5X7GyOv4gKsM9b1gQxVSjsuEXPlU2zPN5hl90IvKczWuY2a
 8MtU3DGMY3zJxnPYpSEFd603/56QDx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> An initial bus bandwidth is voted during boot to bring up the GMU. In GPUs
> where the GMU drives bandwidth scaling, this boot-time BW vote is
> redundant and can be removed.
> 
> Fixes: 7047e655a567 ("drm/msm: adreno: find bandwidth index of OPP and set it along freq index")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
