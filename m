Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956543;
	b=tIfFtgV9a/kP0B0TnvzxaBonUC7U55KrZzL/UiFb08wOMeWK7PCzrBoawFU8oXetMzqo
	 GLNVQ5R92vNxrw8hkoQgBjOzu0n/xo/Tz1TPRhFhXjH0PDt3KoRIPUqkQj5F2QSFl5yA4
	 kjLbVKsr1Omsmw5qKKkuc7Tw/MvrvhFGR7WSU71D3N06ltuXSDT79zrLPbX2vlkv+5YN+
	 MbU8l0VUx6QdBsTRd7D+qHZUVv+UIvrxIHpLMYfkxytjJKDUbugclYOxIQX4oIHkYIeVX
	 /Ckkc8m3fvLXE7J49SdzFeEfb4eIwSIEamjtAl0ppDu0GO7p/WGHwhWACN7/kduCcyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
	b=kWiB+eoKLGuEBsXHCd1vbi2vXDkEyZuP3tKc+Hz5uc/KizSeP41RECoCqNzdNNYQLr8C
	 0riGjiw6Z/5RfdGTwLi2NlC6QjN3lI1E5s0gJO8ED7NM587bVYV6miX24IZkVqmWGrn1q
	 ZO4QMXIfuGfvtoguwvXsNgd9DQY2N/vptM7tFW+UVoDpcFM6U4KNCSgUgcxES4QZVusa0
	 YesttFH+5geezK6t1YE84U0iQCZEmcOkW0a4UoE2tEIzVW/9W/UuYT/iqX6uCK1CHRJD4
	 Tqj19TzMMQA2DhrtCkcrjZEbpIbIhM0IhZoHV1tiE9hTFOxhUrFaTtqxl4JmOi8LX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWd7RSib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVzVDCgf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FECE606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FECE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWd7RSib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVzVDCgf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9SD2333847
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=; b=LWd7RSibu/BXc8C8
	1ooN4oJSnFH4vqexewTRgqXn8C9MFGV6nE7By94Q9Mz5Oacun4yMVGsJXx4foTQK
	8sHtWNJAjUYkIKGVtqGc9VNLBHgcJ+8GiX5mhfhLB+kEC9mtfLiMJToHXgsYFyoA
	JVqSJCp3Q21+LuusrZFHvtQhW0+tLFGmFRHz/iGcUr1U5SJt74jlKs7DpBrb/TSn
	2gLsdusz4M/J0NX5c2On3J+UggLPJdnw8XmIdQbOcE6U0FSG3obpCqUGfdw9vTSH
	vbnGMhDCDxcvW/Bv4wv071Akcy20c7IaIQo3hmThg7ZOuDlmn0/ke71gtGvN3+c6
	NhmTUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a4sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:15:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so11407585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956541; x=1794561341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
        b=jVzVDCgfP80sN2Vq0aLTNJQny4DhqrsTRvawFf46zr7xRyL7Fd53OUubR5NU+wLZDY
         SgTStJR46ZMOE0LBpWncw42Hrqx79I/Spkk1M2Cba54fJRCeeK0P0g8anzfxzr6dQwb+
         nlTcHCQpodrqeQOMwIPX/7ofTpkbkR/GS568L8lDlXqktUfR7zJ2xY9nRpGj9VQNRvD0
         /keBRAGS09J2xVvF/8x5gHzBVUbngLgqyLhJXDCGnPYI52A+gkoXgq7rsZEIHo1NqZHT
         tfJ2pgPoIjd12/k1Mt6yCPSFWyj8uPqaR0l4sra7x/wl1LEKbihhIy9F48Uf2oFeOyAE
         ZZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956541; x=1794561341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOvgA3Dd9qL5xew3nXRI7HiQdsmXf/0pyYG4MlTBi3U=;
        b=264BjTqqL+9OmuL0qZI//LWboMlv6hjwfFEOFhcjsIU66zuU+4XMdgvEJvKYcmS6C+
         ihIZND/ZbKUM+ChRGwzI32TzSF7aYH7DQXTxoCwtxd54mkRoReSVXfP6IyOzAnkbZdx4
         rmyT6tTwfx45wCbAoIwYGsnwJMD4bdMgCspc+erBXuoO1HH+uKwM4FMlc3/XSHOqvNLG
         hXCmHDdFHkx3O0k413qAmEjbJqIS1P5p1uaglk5jy7qIhM4dnYLQrW3vu0Zoy40q3E5q
         6pJJzD52IDLLSfWQLO044MTBVE765X5EchG/1iHMalRzoEzI7OAaKeMr63LPcn8SchbN
         Ep8A==
X-Forwarded-Encrypted: i=1; AKwUvBxwdsDLiZg/TwhzI+3WSfGJCIfz3SAsnx5rHkRn/2A5TVIU+2JGkj8LRWUyic4CeRVNkqzeCJxY8eFETAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QwgEhrRqIEdxrbbE5+NySgg9WzkJ6hNSs7MFgh5A6siA79Yvg
	o0nsUaW21S8besqmpJEpZfBw3P2+jecwzSplEE/edOhoML9v57gqab2kPooKeupZ5or46xkzhzy
	kcdPj2U6CDW4Wqix+GRGtEEsh9Vh8xQzy/Gnda8eL+cNlVHp/uEenqK/zhlkB7XXxvik=
X-Gm-Gg: AYBFou2pXa69/0+Nc+MuufKyPlv/8bU2iBwjhq1szT4n68dTqbPkI44d7qpJNsAvxky
	G1Y9zltIYfQGqkeOShysshWqGoNgT+9ceIubtpDAwjoX1lp3YebixAZrkX+r8PRXi841kuhpAUz
	0FDpcKWjRycDYGeS+Bzpa9O//J1DUDSsS7rOVk74yw4Or+CiTufN4MGgJyq318ygK9weHdZ4SNp
	1pTz5Q5z4SFQKn6dhDsF1QtkhV7xfagXP9UrbDxQQRaNosKkiq+hHF5qUqNAxP7FAh0T72iSfPX
	EWENrcssQI7ThYzULB3KJhfoALpqpUc1LQH0HlPzF1U5MCq5UPDMQ7G83WHpM+Jgg+x+v6j9gZX
	yxA+Fj4OhR4xBj+u/tNlLnq04YBz+EhaR7LY5A8ERzW8Ro6jo49NUuMO/gN9mWjk/mjC9
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr263241185a.2.1793956541171;
        Fri, 06 Nov 2026 01:15:41 -0800 (PST)
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr263236885a.2.1793956540624;
        Fri, 06 Nov 2026 01:15:40 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569e9f7sm61637466b.51.2026.11.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:15:39 -0800 (PST)
Message-ID: <96cc1074-9e08-4d72-8ffb-598e120d2055@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:15:36 +0100
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
Subject: Re: [PATCH v6 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y6Ms9TMbqj0XttJIVjP1MasYhooyvHwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX10cjOtsAYu6Z
 ReCMPYVFxEM/hkGnBceqxTI/t03xJtQtMrG2hXslF7pfp4zm5kzW4Tbi9F4wc5fI+8tyob3bg3B
 wyjwXZChcsutijJJcAruNmI3ltikyNdaddoi+FbLnb481brKy4V25lCdVf8EvRbetlQbc2znZgG
 o0ardtD7a3lhDKY17Cf+HaMk4AW1SU6IMDR62keFno5mR6ZwYArkCdwonK9uBdT01t/eYbkZgZ8
 nKJ85j/BXaymnbCfmbwKhPs076cfak2B56NhK7obzDl/VM9mcORa8yegR5Ykue0Dw/mfgZxMrwL
 TLCFb3+Hjxp8P8uOuq7wQ/JoUhCtEv964sI8KDDTkGGsQhdnY4MugeLIz0Jhg3plGZay8pqhtt1
 4vMCA0cYvBhCBEd73wF9lR2XZ/pX0R5bZhhzt8uDsYIUlptJL+k9KII9hX4ceq7JVSzrn/TJlKk
 6idmhx8fJ2PjeJL9Vag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX9y4iN8AndNj6
 JKipVhJ2w2RXSeX+dQO+YE0HBeKv1mVXKb5doSUIwFih3ZkEbcdNWW2+BM2ym0ZwkcMAncTQLR/
 pqRRqSctg3ZFn4wXs9h8lefqAS8lMvw=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9abe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J6-XaVkY2UlAEipWW64A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: y6Ms9TMbqj0XttJIVjP1MasYhooyvHwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On 11/5/26 9:29 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

I believe I already revieed this..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
