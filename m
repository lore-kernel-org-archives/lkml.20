Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349343;
	b=V/to1MRjHwgZbf47L9Kj4YHYuZgmjvdgXwwjpNe8y01ePFFl6voCjPZFJ7/aBuFweyGb
	 1fUXpvQGeCt0BuhkcvaUoiosNy0PSDRIQHM/ipF59gYHbXvu7rgtB2126sfmOdP0MDPTw
	 wBciYCp+WlMz5myEN9oDkjSbwIWYbRzWK6HqApa67ZsatbbSr1h7Vkw4bRd/U9ribYgKO
	 GhtDuqgGzn5bOmfzMVYvnGjGXSQh6oX/cybsZwdW+n+bodrH0CcE647yNsyVYnNJr1708
	 mrtE6H05FtVmkoKJxvvA0gskiZXZN8etKvL9aM3S66LnkEZf7dJNXhTBszSp+qvjP4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
	b=p0dYyy50RwsO3uf8otoRBSWUe2qyhpAFpA354S+di/NR5lKgJBqweBuOL45AaDgXtxYo
	 JjSHHlTnNe7jCEird4hCYTiFB92lIBYZl0dN2OQKMzeOUpc+UBz6XNEsufHgE0JGtHphf
	 dBPHJ2pqP64ugV/UFv0jzfLQL/F/dOaVc86hHDh5jP0sf61dgPI4SoNKKmQZpxY1K/t7h
	 bqgXsVGQg22bAzymgK50awDuUwNKVE4sk7DlgvgQ64Xl+28B6dRTnTWF9vSnfIQUjOqDM
	 9cBv4ksGFXWA0f9PiMLR0Lf89HkKO4DaOzxOLP9D82KPthsMhL8yy4LrsoXdf7d+mqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLtXrypl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jF7100Wg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EBD606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EBD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLtXrypl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jF7100Wg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Exeh3737811
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=; b=mLtXryplGnXfHaLA
	tmlbdaxGFX25tKXAXCGF4UqGa8w5dlXHMM7JB4ie0etfTPDjxg6yk7/dfD/x1Dzm
	BKhqDdRokrMVx04iYqWr2pBijZXMvPLzB/e7m3zGdfrQehS7k29aZX/XEMCZ4QqX
	kE5SgeaXYu92h61JFBZkWJPOmegtnHNGTSWxJwP7R54oP/ZRP+j9xrFfBU70u5sX
	1MBbWKdbm8qgdJ+qI0hLI3GgpjUQWQTHg6sGgx5au5R2PVEVbeKZa+BuAYPkL1qb
	VVZN9+9vrNMWbiCDuzMMPULbbELRgyKVK6dfECks65MPcr25TokrC9f5V3WQ9At8
	gDAy1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751y9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso1211056d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349341; x=1793954141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=jF7100WgLKYZ0Kq0nC8iVkFd3zIYWne3xadPBLqZaUYbLMkPJZCb5ast/gogwIDBp1
         5XTIrcjQ3U5JyUDn/EQ1bfvJnmJqwQsCAnw5jI4ZHU0Nds0aAe2zxtYNOROjTGcffowV
         nQWpP6I66N+4Uuo85gzfgsriY/CRjo92/3kooALuDgT7j8O5k70AFMGhVQLGAsX2a5QZ
         geBOKWLAIspaCV+YQoTES4cFDbvWrujAtYMWz6EslEy+HpzmFDePs0gBMPFdqHAjBV66
         dKfMOD+LAqbzsge7C41AFKpUoIeyOgKTKb34cVbGt0dZfFo0Bff0D4KDGkGHnjdQ5P/X
         VTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349341; x=1793954141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=MBRaVMKLG1qJT4k/WrzTK5my3wJO38zoiIDYpJlKuJQ+ooRsr0bOQlDKEOey4nTGVa
         S5ngwS46vJ2dM5D8rLvdduSUvmRj2AXdugn7jmbyXfYkR0NlkasqY20Ix5e9IyHNfpN/
         7hCQ5VlZBAMDr00RWcPxS8RyAmtInv43vKSHaWxGGy8pU8x5mbtIGvnquanz7Y9Bnd6c
         nvD48eBZr3C2q9WGz8ISyHdcdzy4Nyf0O6vz+bQ8oV3EP0MaqCIWO5QD8+hSiYSiTgnd
         lfMlKlLgWCuP+co13lU1vJwjEbEBd6Oe5LaJQ1WfX8KwXWTORU7EedGghIxan+/dARzg
         nV4A==
X-Forwarded-Encrypted: i=1; AKwUvBxdcvEX2cyP0P41g8NuamJX7jn8+yb9AxdFwAUcTZP7e/RxdIXY53nyOAU9rVA0U9oVTugm1ztkbqrZtl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN53XTG7Ow8UsI3aZHa1kIdBQiUp9sDTPL7CTgCRry9WYnRslE
	O4+HNROTQ57jH0osnSNPpXvxD9Rk+FfDjDEpMVdbfieUDWCV2X8kGI+wpHsnzY45P6PIS3ZAwmo
	D5PFXwv1m4oJIre7xkG48bJwPc9s/n9C95yM7eu96RXKQ8qpHjYBFxUX/3wwPUxdkLtI=
X-Gm-Gg: AYBFou0Yow5mHP3oTN06BrguGsovtTn6aHZ6tz3oEyM/qy2lEMtN+9Pjqvvv5owB0fB
	JYwnjhnlW/aGwpcmuYnzLYoPWsxaH3nD2Tus14ohk6D7ubJ6xAYMqOBD1bIORYTL15KFB4scwa7
	EqgbUozsrNpvdHLWLbhCrYuCUshUkZ9MxDKsFmacer6bUczy4SS3LhDHpD5OL/q09dGY7BK2aFV
	ICiksX1UFyPOPyPE2tE8P6J9omjJDFraWG0/zsK7ABSRALHJkY3y+n8GU1+V81VBMaSzR3VG8uZ
	JL/IUp6kplV1XvCiHkar2KZryYgSe1fUh2/xuZ7PBhuXM8lX0f9JNUdxxVpnWvp9nTKLiTFt2Oy
	L+UemTb65OWKVKNgLZt7fNZKotn1MwCrDj96RAm8k0MWIDOpaO1XUFPJ5xmhXstO9Y+ldRts=
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24294151cf.3.1793349340689;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24293851cf.3.1793349340133;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm39225666b.53.2026.10.30.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:35:37 +0100
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
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Rob Clark <robin.clark@oss.qualcomm.com>, iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2lYciXa9QLLOSJibTeqyXquctoaRYH0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX2Mw4aEfNiU2g
 7FDlLTvUiqfxfn5URiSKGYX5pBzg1sxGQhFSXICYOVLANfSxURLf749pYEY4u+gZVjwGigov7lL
 gee0QhkoEfBuPyNnpYHlCQHduoxXrO9CFaXC1kO0lwMt9zJ2Ah8cCR38P085x475KIjljlSFZrt
 ON+J+lJCRjA7hu3g/jwfKyvd0sEPAZ8jE58EulwaRJYuLfK/IATIBQeegpU4XPJctVGAsVzD2gr
 A3H5/ILc2PYHU/8gKkrDjAigozMgQ4sbmX/ll6wTW2T3Nri2dXzWcBkMMcogFwmapZiv8kjQhgm
 wHPkGJgBcYsTJzyszAPKdC14dkWTQmc1La5YZ0I24+SKht1EY0OvWVzlP5ImqE3tFr7VgNMOQVR
 r0XzcuJVrcEoQxdr6RbJJUBDkvePnVCHXtWKwQHS5Tl3LW2nbtK/saAKo9v16FjlmMjGBuNK9JD
 RHkwWvc8YVRzxVOXksA==
X-Proofpoint-ORIG-GUID: 2lYciXa9QLLOSJibTeqyXquctoaRYH0U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX0fpoKMa03ad7
 fk1iEc54fLtWHSQPpy3QQyHDxND+Szr4bnoEe95smbxUZaj2133FaOau/grPHYN19OQgNnndB/G
 1jAU4Xo9yYkCHVs4/4caj6Oh212A3W4=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae456dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nPYanoZRiyYWTCGofB4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 10:23 PM, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

fwiw I'm not sure we have any devices with this driver and mdp4
but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
