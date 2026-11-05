Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914763;
	b=2c8A6DTSSOA08saGy1BZUx+R5ClXlDxgh3TyTZtHiyUKP26hlmh8eFC7HeKkDtxx/pLC
	 nhqbxvv9HN5EmzS4hT2PgENN9rqnuMKfYQSuNF+BSfQ8XFk44mNFYlknxZGK0Z9Yfjyfy
	 dVy85Z1LXNnQHf6n0HSjJlaJ5lUFZFlf16+PQR2tALOi1Ndv2qm01HmjGKLDZ6L7RhsQ0
	 aUQud0heWXjWh2/4THlNw0WdpUJbpSiAYlFutEIBLa75IVX0na1CwuNcI62TYYYqrL2zp
	 F9AlLs5GthupXaUXX4R44lFs8XhsODdpGzNaM1Y7pFW4bRcqFw7Z9c0Ap/Ic4R16xdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
	b=wa/T+6TnR5RGdRo1eef5//HjH9T5NhY1POgzsyMzBtwEtXHyd9+ROGg3GOlraZOwUgCZ
	 qwCKYdr3c5BMZX8if1EK1QKdNhWTEAEQzySaU56HO7R49Dn2E/QtwfK6CSaMzUp8AHYmQ
	 diKJQkVDbJppB/lwCcrdxwL5qyIC4lN1ozpjIMLtuJsq/bB9Z2FY2uhPlUZ8tFrixIXY8
	 sCFD7ETbSgsRPlIza/ucHFcIEx1GxmZ80SZOsANwjCETcohaPhopocj1XE+1qmDaMao7L
	 GzDYgLd7Ww+4OwUeCJ+b7Wj1rLkDk/LErbqQKwzZ5kbA444grkp/S4eTYXeVGgEbhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIOSC20C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXGyK5r9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FA606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIOSC20C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXGyK5r9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6J5a1898430
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=; b=TIOSC20C0vzukLEm
	C29z/egWfChkQf/y89hE7R3EwkDA7lhYGQr27nLSLQ3ZBSacOXIVBIv+wZ5ZpbDK
	xN8RUmxB+O+w2JOCj2UB/Dz/D4ZjFwnqWz+I/W6rkxh0poejW+5SdgV4FHwhC/Go
	nTgBDQpv9HehWOX0g0LN4a+vadAbIFPdi5Mh2fHAUs/qbieXtJZjsV2LrvPNpy6U
	IIPy+nSxjvZqEd0bKGq+4gBFeoE1rT3zddF9RtUFGRS9gADj44VVpM2Z8UlXnfIR
	heCjnkZFOgoKkAeKCcnE/oKa4npyyajSd3QC3loIr9Wj5zlPrv4pgAcCQflViHWy
	Myq2VQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3xsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:39:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so131856c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914762; x=1794519562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
        b=DXGyK5r9+4CcYKag33EwHSPZueOBG5AM+7f95OxKPphSzPzlmQtpUzPpYOMpIcjhl4
         43lQfLJjKLlRcbOzW7/yieSd9VsrqsgtMPeDjkY4hSa8GHDWqX26/JjTnQikSiC4KuSd
         vC3U7ghI9NYjSkyoWeMHkxYFavLhqBgZzuFxGMxpAz9hMp+gqq/R6AnqEMDYHQ5vDf3W
         8rCaDMDL0ueoUZY5xFx6Iduz7Q9l/JtOKzCj6YSOQM/ja0iw82qvu9NekIGfWzj2k2Vi
         H5bR96CBl2q81Rtf3s6PyJphZXl8XqhSNp8dsfJ8htwWvlRY+luE04+yL/n1amKtvfbk
         h9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914762; x=1794519562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/c7itDsVVLIt8oIhrEQAQGvpBCCFqMAiXSmwOS2mWo=;
        b=u/aXWBNsT++ifgQSvbfzSebUW7Nq6+CAGcOD6YdqJI/Y6JoaKgyXALEVXVoZ4NB8u5
         dWgW2DLKOZRnDdvM151+vyR/hoDaF4AlmI9uyVtGgXwg9riYEhRNiEEaLzpAtu5uY3Gx
         2q/WjM/e0VMGkhzkXaze9kIhLgetSpFc8xReNe76MOsMJMszxxSy0CzprFEaq/b2d7bW
         rtzzOLZpqWMBNz7qyI9PBwqGs1gcryq5odsVc/A2Q4ls6DMN/daILBh9JfK/vkD8ITLM
         ugNoavmRVtiij6kCxmN6FTuU96+rAhxpCRHzxsHDhotU2a6BO/tyrx7AanBz76TmbCqY
         ENzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe2ikUREBk0tGRalecz2M4lKikoHo608L3oJ39vqcbgRYYXRON21GEgJACU+p7JZujg2VS5UxiN2ewXHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hPGFda7f0A7OaCtESOpD16c69wM0WSjr8FoOajtoU9LGaBBY+
	+ogs578aGHWqc4YTbjEabYyx9F86/fhU0j9Qdln9jsdkfItPTMOlLwjHRR7ydUWtg75+xm8RVkY
	+eOkLCeWCcUs2t4mv7pPpsi7br254GYuIJ11Xdn7PJhP94Sbf23MdiUwH2fXDyrukUJo=
X-Gm-Gg: AYBFou3zr1ctG6bRvQ+6AfxUNNH739o6f90S2G1FGwwiy5Xs7PXJKfVKBzmNFP7yMZS
	vIswQx1rNDC5dGW83GkL70WQP57luWfdRlVOCntJOUpuuA3xPhO5OHnJEJX84OVWyNPJCWhQdJ5
	NYGsFoLmp6064tqmncTFlbjkL1gWArrTGV4j1XiBeFqoeBeGzy//ddRzxi0AajdsJu+YbHZtbUc
	WYE1xA+Rn0w67MPOTjIMJV73CdawM58SzeKq9UAs7y90n9bOjMs4smO+IJqISK5D8QJvTU4io+M
	LxRZoR+PrvrvCs2fzPQIyvfYI80pKAHw6/BErl3XdsdsAlkE0F8LzH3o1t0LxGcKG3O6PXxm6k0
	/SLu9G9wLBYzljFOk2LFZuPYw/Lo2lJ06ebDmrJAc4sCJrqHPUIT2mcPmG/rttlzOGCqyC8I=
X-Received: by 2002:a05:7022:3b81:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b25d38b6f0mr402176c88.44.1793914761685;
        Thu, 05 Nov 2026 13:39:21 -0800 (PST)
X-Received: by 2002:a05:7022:3b81:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b25d38b6f0mr402157c88.44.1793914761234;
        Thu, 05 Nov 2026 13:39:21 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm22952190c88.2.2026.11.05.13.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:39:20 -0800 (PST)
Message-ID: <f79f25cf-4b71-4942-84d6-dadf9b5fc52a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:09:13 +0530
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
Subject: Re: [PATCH v6 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX2g1FdYwkvcnl
 7r1Nb2/Vmj2FnJFAozDAghWTcrm0HkQex2qJ+DLhCgCN2EgdKowuAi+5HCi8ivJ90hWXL9PVWm6
 vLylrrvpwthebUm/tnhVaSo2O7+dhKs=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aecf78a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7x8pgU0wZ-WXSjAT5BsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX8ReKu8nANkGs
 Bu8FdBCP5zKztIBZwTKu+mygWy9ydusMToFxMSvcc35LZ6GVCNf1EB3TOsLXg/Xf+SriRv0qGra
 z1xNn+UTzjvCog3cGMxu4nQYy79B11WB3bTE4NathGUkTT/MydBZGTySGkUgIa0W044k0gLNWh2
 agN+HTJkngWVf9sSWhUxGyaKUGYFqayQ4nJXN/Q/W3d9qHDVxO/0SCy2U2pzoibtcHbJX38wCCr
 yNZBA8xXT4YgMYTj8GrlOgNq/I6kZ1ZNRc3DIAtWQ3rMHjL0wxzO5q6cEiuGd8fPOHtIu2LNYqG
 jusD9tx+O9YUazCKQ36lU1480JWTkZD7djvHX8U6TBaWc+DMSuvw2LHStD7zOpRm5yFpD8rfn2Z
 qflO26nK+l2vENw4CPXTv7KOec5utyofmoK2o98faBtYj0PtA6afhiQrLcK4Vp5zDxhYHcIOMLJ
 Wt/LGu4Yp5u3gkDO3dQ==
X-Proofpoint-GUID: i_ou_CVIJbPcZciA4a7StvCFyKah_3de
X-Proofpoint-ORIG-GUID: i_ou_CVIJbPcZciA4a7StvCFyKah_3de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index a3eab0307529..dd1a5ca91812 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
>  	REG_A8XX_CP_PROTECT_GLOBAL(53),
>  	REG_A8XX_CP_PROTECT_GLOBAL(54),
>  	REG_A8XX_CP_PROTECT_GLOBAL(55),
> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
> +	REG_A8XX_CP_PROTECT_GLOBAL(62),
>  	REG_A8XX_CP_PROTECT_GLOBAL(63),
>  };
>  DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);

