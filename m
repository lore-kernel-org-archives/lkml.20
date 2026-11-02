Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608819;
	b=cWIPmazxplwM9oaRPC/Nt3Y6gfohkYp6vaj8oeHwAkD2kCveq1eS1P+x39SSSs0EfQ1q
	 accMTxo8ctwqBl4xtxouG5GUZi2bQ5bwcriXYNja+Ol4hRY8xR/E3yI8ZcUNZuDLGZB06
	 tYvj2CgwylC/w+R4qjc+o8VtxyJr+t3AoH9wqCdZediheY36uWD/ntaS0j+oID6yBVh6r
	 7VA9vDtdbqvQ89ksq+AYge7jHe48DInRy/QA4tr9C6VPIHGCfbckf6CZ2gtBiljDRLxQ6
	 t1nTfkRsHwvx2s/BUJM0r0odWhM5ogYJ0s0kEb/P5NItpqA0eDrzLhp2Yh12+7+FPqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
	b=PpOWMB32wAfPGoGhudN7krPncgI+ETpI8D8yPxpWfLvZbnaYLQ63rjnJkg/ZrpzAiaBB
	 zBvlF9pJnkRdJCbRRfCDDSTAwu8NaBKcPPZ8v1yItWU3w662I8XXOjRnzWnIJ6wvsh2Yl
	 KruFja7XXe/Az4Sem9V0SM9OpcO3qH5yEs7l05PSmc8DP0vwI65x6rsNWJzu/E25xnpv3
	 LiaNPLDnUH99zanfp0tW4VjhwZWpqKQ+9wpQyS6CHcHzH0Ey8h07ojZclAcnNPdSKkyWW
	 3t7ggppFniT9hH4X53ETWUwDjVFlijjSq0X94JCCDaKnrphza842UFqlIF4RXH4BTeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaxwUrVW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioWiOtn7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaxwUrVW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioWiOtn7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CZ9d1811498
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=; b=iaxwUrVWDGpR9G7m
	KHrqIv193A+yxzKN5AoZy5ZAyieB9I3E3lhWPp54Bt/8yTSYgjpB6jAXJJkIGz1z
	cHcN5gA1XljRc8by1OyBzW3IYw2FREqbSCq5JUG8CmG0xYbKSkmkKwwnrLpfyzWU
	FQGMt3CCKtsSytSMlHH+OI+acTFa87WlaEjn+cENDPlTAe8lSEecgYm2vzHMUnUC
	R11sqpT/n8E/Y2wdjbi8BlODrDOP8f8rRf4k+hk7GHCZEDHrfGv23OwUH6xiXpWa
	GO5ETvKb/VqiVkNXoLpgCFcx6O8hnR3M8goN1Emz478V1HBkpUHPAOYPezYhR1Ul
	fKibnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgvjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:40:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso4278751cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608817; x=1794213617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
        b=ioWiOtn79Sx/ikm2bWlccyUAb3wXNSEMfIPrEqYrz/f4trtfnZJiQdYFHXO5/lCEAr
         DlZcfukuozQhjLVm/wmzpP1ebqKIx1/XmXkwMWKULahyBgs+4VirOjkdiHj3Ih1SSEhD
         wiYxmTfnpEDMGGJuPLPN0uheRihyVzBKzrjuWtQS1q0y0eViBv1/61Lu1N8aGTOXFxBS
         4jFJiwX5KXDKWnPf2Owk7BGC9m7J+sQHbwFSGEKp2j4zshLBXnHxCJ19hRGjhUpSOXYP
         eBAQEeeWzPSuPv/d4YNG5PzIPx2ofitEK9rRonCGAP1ijXWOxHKNYEAYbWnMGM998HGY
         ud6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608817; x=1794213617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
        b=bSkGDvaI5TnbWdoWkqReunoj2Jt48vCh3ahyO2ZC9uqwkbkF6Jo0lMhrO646gtL9rp
         OcJxNEHePkaxSBCg7018ZW/C8f/F3ust4krlFcrSNh0XbecgpTC8B1YF6vgliW00j+RS
         y+dk6Jdgv+0FEB4AmJUGdoqnthtDBDxzHDzshcaQKZmQmSuqY9EfzTSo6yzwbvo2mNOc
         OkAhM01T4GiYBUY01tkdPKqYTXT/1S/7evoIkLl+0pB5jnV7sZVLWkqU2j9AU1wAqy5f
         9P6UxNVuvkET9t3duAm2c/iMH3Ji3dlCaq6U+cP6HL1V+4WnmcRsX88HGT3tNh+7CVFW
         5ppQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAdZxLGHxiFjTLq3rVvkfgj4p05rnWKDNmX7UO5OY2a+do8mYVJ8Tdyc7p4W3cXgmcbMoi+Uhni+g40+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwYlh3c6GLf9Gp/dnMzqqVdXydzpvlyLgJ4sKS91dp2H+vGKU
	wXpxHRBjhM25/m/3+Q5Cu/Jy5yvHF375n8f9djM2WG+yfhrUC4fSBk7keHB4p6ZuF0D13uLFNA6
	UTP4Sm+OLx/90kJF9ErXe6G/YiMQmV4/9o76nEOrsYc1GcOAIvEDzoUOEHzD7v1FT/ws=
X-Gm-Gg: AYBFou3OtjIYGiMqCW2BHofB5OKnJfLQh97rrvNh1cETPw0uIUwWSUDHlDZnIPE68K3
	pHzgsLy9QHBBxfCfq6UuX1v83oHc3LrHUQ3xwXZ8TJP3ToC2KXwalxIKS3o8GKRr2ynM8M7dTFr
	fYqBDIjd0CeXcFgmiXxUu03+uf39mghH+K+F02MgIjDXiEeZEqxvOnpZV0gjiCtIgYKUHsJRvWX
	DzoptIjpK+54ch8j3nHHcjJvZGzv+7U9ZPQ6eTORZMsfbgvucYCwTbyh9YUo7YxtO4MiwvbYYVg
	ELPZD5G+m0YskPIYhJ1HqRxQYVEzeYfTlekWXinLBB1GiiMFM3wMpzmoNEWM9nfB8tTKkGDiawa
	oS+unYXbaPY9riQstPJ4LOq8kNY5IGbRRbFa2EbuxgSrMxgGCz1Q7njN2OsFMQT3pPrnpkpg=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1550672285a.1.1793608817434;
        Mon, 02 Nov 2026 00:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1550670185a.1.1793608817034;
        Mon, 02 Nov 2026 00:40:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcd6fsm2945801a12.21.2026.11.02.00.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:40:16 -0800 (PST)
Message-ID: <719ca9f8-85c2-4d91-863c-849d38559447@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:40:13 +0100
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
Subject: Re: [PATCH] drm/msm/a6xx: fall back to MX when gmxc.lvl has no levels
To: Tyler Baker <tyler.baker@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C8NhC4IBAFbIxLKuN4PTyUrjvdg0djHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX3CjZl0cxiMIo
 ZhV4ADBnbovCi8gSPI5oRPAgpQEN5UY2IzYEuE9n4jHixTyfp3CCqJtztSLjULBtyaZo3iinsBq
 w6MbgUCf8nWKW1uIH4alNQlBAWXkarIaxupiTQXBNKEGG5+QGZjdH5LA+S7fgGhy/YG+FRGSt+3
 6PO9IHrBhk5rqYRSzhAWlGMlGlSGWQI30hF66XI3HgI10TjWlwNXIr6d18oNclgk3cZVQbCbq66
 kTtbDZhaGkKvJUVh5E6xTvFh++ONONuEE/uXDQEPLypJYSwJzcReSVHyvYZqsbexOLwE9ZKbNxX
 5eUPtZPKu9oHWUU0HDK7Xw7wD+QLXNqTX3TNGybUjMVWeDokl2lryQxE+PesL4m0U7zYqLCry8a
 3jkJ3/sd8fJvm+jdWewTg3c819iXGGsUsbHly+DaaqiLKCQ85Ux+EkdKES0i7KCT1oQ+pBU5m/E
 8Qk8Lt99UIE4M9snh7w==
X-Proofpoint-GUID: C8NhC4IBAFbIxLKuN4PTyUrjvdg0djHA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX/nVDwcFQ2KuH
 UtaT0sQblqSLslYYTuN2CyKOJ7RtkhxFUJQg4pa/gSoRduSlSvBc5F21htIUoQYkScRVrhANESu
 rehOHrYkFpr02n8wHJsnur6+Gsux/E4=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae84c72 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nSTmtbGWhtfu_40JH2gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020034

On 10/30/26 8:20 PM, Tyler Baker wrote:
> Eliza's command DB has a gmxc.lvl entry with an all-zero level table,
> though Eliza does not use a GMxC rail. a6xx_gmu_rpmh_votes_init() picks
> any gmxc.lvl entry as the GX secondary rail, so building the GX votes
> fails, a6xx_gmu_init() ignores the error and the GMU gets a zeroed GX
> vote table. On the A722 the first GX_BW_PERF_VOTE HFI then times out
> and the GPU stops responding. Before a6xx_gmu_rpmh_read_arc() began
> trimming trailing zero levels, every GX vote silently used level 0.
> 
> Read gmxc.lvl with a6xx_gmu_rpmh_read_arc(), which rejects an entry
> without levels, so the GX votes fall back to mx.lvl.
> 
> Fixes: b5269bf0e1ad ("drm/msm/a6xx: Factor out RPMh arc-vote helpers")
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
