Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77028033B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791169849; cv=none; b=gIt6Tvr+l8OxzUSGzwKiSEQG2BDNGJyV6ekjwi2R8jMg1GphuFMSddNdGVT22O+e0b5sWGGjPuGD7NojsoZSv2vOZW8g97KwH+SSIVMakjjv45FfPr8RYrGhGxSfTb48gLkFlXmhttODblQeq0/nuBUzWq9a1TKIzMOXNdsv3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791169849; c=relaxed/simple;
	bh=FkAYTVSx/narKs44G9kWV+3HqbiiTQQLw1ziMHERtW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQRz0fJZxPYuNMPqSnYsw8q7v9TEb4xT1nQ1WBbNrkEpe3oF03KqlMS9L8noF3Dtlqlh5CZj5UuCyGhKvWYgtZbB43Uhj3shTmckMjoIJEl7P6HvEhGQsUTDMF/vti87fz5HGVBVZBBG3SLwjATRi7QAJTxMl+AcUI4sOg0VhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+gM6bE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdtJ1KyB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+gM6bE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdtJ1KyB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510RHo788230
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 03:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3OfEK2icYr2I7GSUxSDco0Fe
	v4FbkyIVeW2fdTVpW8s=; b=d+gM6bE0mp8gn+PS8MsvfEEFXa2AYtPjzXEvduFv
	bISDW94sY7FXV2hxT7ss4R+hJuJkDg7/MGREAEXDlrw2y6yBGUTTBRtbaUWreMAX
	1BJ3dqYZEXzZ/BJEHbFSrGcQfbLwehjIrHtYlM0tHLBn7GRvA6kW2c+IUWdUt66I
	OIEdwDWP3955Iuj9tzOOg79JHKCskYXfWLelN40GgIV48WuR9NY6UmWsr91sK4vk
	vREcrp+x2iU+1nbaPALvUV2UhBJ4oT8jNmPKpc9Q2igrOrrMPM6NJw75WsEI/lm1
	UG+SroPbg8/S81xTjVEx+77w6gZLf3wxkBFgNMIpX5Ad2Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4apt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:10:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so1132091137.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791169846; x=1791774646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OfEK2icYr2I7GSUxSDco0Fev4FbkyIVeW2fdTVpW8s=;
        b=cdtJ1KyB1iD+oOm5+Sd+EDNvhKJt8AmqdUEICdclBsT31UcfAdpFGTP+coBdvjq3Qm
         nk+zWmXGlMX82vVdQLY8Srur6uRNt/MtI2kWQrJoFBHOg5PEWYnECDClwbptYc3hfXAO
         TfEzC4vXdacyifM5JOHYoDH6YPK06vaK47D6Jwt7B04PBa86tpEptH9bQ5051iJ/YXHv
         mrDT4zuzpEu/dhSUOPjJq7wKOmm9e9+P4H2q/rCr4Jp3kJLCGam4hJSPu52NclEAsefH
         F6Maze6boJGYKkdYQviR5Q8Fd7RoN9zrUFIIZ28kmPHvc14/ZGg62OpYee3cIvMZLhJQ
         BOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791169846; x=1791774646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OfEK2icYr2I7GSUxSDco0Fev4FbkyIVeW2fdTVpW8s=;
        b=X/0uWJXSOoFlLhGaeT/RaVf7UHnYypcQa2OsnBo2dDRJlFFrVfJxzObthChEMa9rYy
         43HWmAVkvlruimkkILTMSQ018SCkcwmsHeMRo0MD/13Kz64Jq7I+uEbmorzmFRNE3r2i
         Xmeo+sijUvuu3V4lmTDHG/wjg7TDigBEBMU+67+u+YsuVR1aPQn490PtvJuVAqZySPYq
         0Ht8GGIe486TWu+AXBzvXsp1H6gEkkn9iVwbes80uZVyu1pF35gKAiKI9dDPx5nelO4o
         H5w6ow5pius/08awJc7IJY1/ucLxOnD3N/JasMDdZv7ChwKUlmxR3Fam+1kwxncIoPze
         2DPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9P/KxU8vbdaRO8+ENFqsJq9VEH54KwJTvjoCn2uFaQ4o7NKvdOuqerLiInJPcoD+VZ2b55uhzUJ9aYfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+s9SbIE/0OEWgutAE5mZYTQi+0+9kHga9oPzytzzfAv45gt8E
	IfFn/tTX3dJuKTdwEuXS/V8auLwzpyxJwWj7uQTb3FLHF8ddtjACxu3f5iLFt/8Uwo/U1M8Hau9
	S/zFgUHFifvs+cQtA38w2xf99d1XfpvnN2TVUKsdu7y981v3gRaLYkSNl/KhfE9cxfPE=
X-Gm-Gg: AYBFou3Sc9Pa9/GbJIb6AxBEQt+aGIhl0fuoRFgRf8VlQWeEXMpPYj8Mk2vxP89vEUU
	s3G3kixKeoZDtZV650IjfkSsRqK0F/M2GyBU3CG5l8QDwdQhWptI/9LJY11WHtIEvP2ua3jzXiQ
	ZiIV0ur9b85cSw+9Cx9Bwxl/s1ovATaj+OWoKNOFc+y57bZStJC+wNLn3ynt4ZWS93wMQHICPLU
	AyCfBaH9d3x9MPdMj00rwyECseXVH1IFY6twuQ5dZzRg8d1YGDyetFVEG/C4tg33zaN+huPehFU
	LG8bXUEEaz5e15FIGJJxEbhuh4ZzfaUsZpUwPJrMAJJb/Ad+7TC8UBL6yx+yaw2E2VQWMaisueF
	IaIy02IYb8J0KOXUG0mjLrEgsUqQ9AngGM8wosuNFmuf3ALJK9eVKeon3S4nbLFLalISt+bdyVC
	0SHzCHw0QxoHIS
X-Received: by 2002:a05:6102:3c8e:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7c0f51af767mr2878351137.33.1791169845829;
        Sun, 04 Oct 2026 20:10:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8e:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7c0f51af767mr2878337137.33.1791169845260;
        Sun, 04 Oct 2026 20:10:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e31035esm36650811fa.30.2026.10.04.20.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:10:44 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:10:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
Message-ID: <3w2te74boo63yqbfgi5mwiu4rqdjd67nmb4ums7p7whucdr2gj@5l7euw4umfun>
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfXzfVm71pFG0lT
 5/yDUkCC+EhMvLi/PyOwl1SSEvr+Q1euASvih9cABJKfTDfLsK4QDISLJfXij3EkR+YrQWdywJX
 wLqnysueI7Zb7Brz7Xb/kDryHSm5bYIaw9yy5lCQxWkCyHJyWrBFpJfPmbyICOaG84tzIQDAwlS
 LkO++ydS6NkbM5as5Dpl/vMoPT3jkMjyRYrxoGDjfnpsoDybGcieBnTSBzhh9vJy6d9KdI2I710
 NwH5qpsLcISKezfJRlN/aWI4k6EaVgn0gaSOQofkwxoqZhp+OuyLi61kFKV2Uzq0FF5ayNYfn83
 Hp05Fpzn4YxM8d9FRibx81Eczbx+JMA2XuXmKw/hhgdcUytBdCY9z2L/Z22JxQPlj60YSA0WPa3
 9pNaE7kMemk3xpm+HtGa/Ui4W9BgmMgMCQRBn7TbIDi5NFopMA4yk8sMG2zzic7H9Xm4GH55QDi
 pttfS6wXdVagIb25HWA==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac31536 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=AYGg-ij1XDh01NWh1ucA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: xjlK6GS7JJqwJdRbO9xxTRDKYXMknPhN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfXwuqQeMWoihYg
 JQAOSE9NHifhqfFRhfP1YQ34d0of0i8tsfE/D8oBTEde8bHB/gC6fYDjI3wvREH26XRMSRMZjNI
 GYQRgffFdBRRVW7Q/N95Sl+ZADYcQPE=
X-Proofpoint-GUID: xjlK6GS7JJqwJdRbO9xxTRDKYXMknPhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050012

On Sat, Sep 12, 2026 at 10:18:12PM +0700, Reza Kurniawan wrote:
> Enable USB node and PHY. Since VBUS is wired to the charger IC, also
> set extcon of the USB node to inform the USB driver of cable events
> emitted by the charger driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
