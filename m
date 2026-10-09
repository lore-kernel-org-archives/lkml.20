Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352635C68E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587127; cv=none; b=r6SRqsdzKHsT/NH/EOHoSj7TZ3IKL1YYU1XhuOZZydX2lVW4Zdd09iG+zdaiK2eK1bjh5GQ0c+zxxxtE4OKNtx+MDYOa+MKjHjoiJz41T7pKACRibY9cg1NN5+s+mLIxWf2cXzKTunsw1nc2hXZAvpyn5fGIhv8dgU+g8zw4PxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587127; c=relaxed/simple;
	bh=cuml1WRoVPo5CU/+noegueeRxjpqh8+p6J/SZJnA1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfiVoe1YMAaMQaVQ4JBvmDiFt6KXR9XscRwh8nhQwJ61wJWbTV7S6JT78/tgH/ZmIPx8ZQ9HfoCdHlTZnUlq2F6JTnq13YwFtceSuhWxE2AJHO/I0MIpYIOZRcz0AgKhzZaUAveIb0xwa48whctwnLaKcG4SuSTE7xMhra+5Okc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A825mXVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnDuoouI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A825mXVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnDuoouI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Ki0uF2858473
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 23:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92iPLLNWa6TK/xvUvTOqX3t1
	epK+uEt96Kr0e/HgmSs=; b=A825mXVhs+KZwUrOLshBD8MYP9LLoFjL+Yzw3ys6
	dtB5xLCIer94OMkdcIa3QJJKsjuzxMkafDAmzCDvDRkbTxS9ubh0+WCCjENVhJWU
	gDhweaud8dn0TW7ARsHFTOjF1H10S3n3jTDeyn6mJizHguPz8ziI35vTSTE16xOg
	J1kLYlLWQ2UqwOT6DGAcCj/dpzBGVTFWMegWR9qNvf0iSacKFdB9ajhzKC3vue7i
	cqhlKLASmdGk0rFfJRHB0s6OxR+4SqBmih9YfjYEgnPcr/5BfHXvQVuT30kCgc2W
	P0KsLXRh0tcHyEW7qi8QF2Fa9HyrVs76IdBtlsrAeMYaIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t890pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:05:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a510b22fso7747316d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587124; x=1792191924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=jnDuoouIQvmXvA9LrB14GrvwcEsgw7GrhO+ZFcxV1c6EVXdHbYqDilYd+wKqNLu4xI
         w//qxIVgyNY6ABXXhHJYOaicdnSxDQZoaIugIcXuqpLQXvcwNw2B9jM3RcrxLbahDcpX
         ZBL7JWShiL0wIcC5N/F/IdoV3F/GrwBjp3jcq14tABqWEse2B1OF2aa3wazduN85T6V2
         52G0Nurp7JU8q1X+ZyS/2A4up4ey3cok7F5FliKhjAl3LP1EnwIPByP8HxCq0ZoWgIvR
         t+D1ZAOKRI6bg2SzEH6gXainB7CMnW/qKCCM+HttMURFCnGN7Texvmc3S9Tqq3l+enp/
         Z2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587124; x=1792191924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=hpsDMcu1wkGFEzNI9ljSS9MhDWsUpm+WhPj/EBsrZiZ2RhELfWUTEPh9xBiM7712v5
         gSDiEeyfp0rihIsSGPy+jle/kq0pIW5HKLLIpa44cN88mSu4BccOwhl5c8d0AieDg2k1
         cAwBpLvUR55X1yYdKrROQGMtlNKpDbnzR/9cjxhayoxAiDV+Y3ezsfxmRYY8KR8GC9CP
         Ewxd3t75AcztvGfeJHi8f0M2waHp0I/9Q1r6UztWF9j5I2MGGigO5O0bN9T1Mmon3Ooa
         X5wCXW/ExhedR6TmduPyUr0sijvnyhcPowHMTC5qwCsxaK9R0kZ2yveu9Gzs1WGTCyC9
         kzBg==
X-Forwarded-Encrypted: i=1; AKwUvBxyqNV6lh3PH8A9h3CEPjx4rhfAje5oTg8ZAFCw8WV0YFUlPzniiO766B6McmRe/xCTYh2b33PFszx5Blg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhi5aLxm69w2CU9YK2AT8cyFgTz5sWBO4CvGbf0hm5Q66NUwt3
	tnkCFvw5xVaEahY84w9YxfRVCGcuPK+73emF18Lg+7IsIbxq/xbu8JWJW0pFXchCnHXtgTecZBW
	+4+jAtpCfpC2UM2Tb9hUWGSEQKkHDRCa3BhgxwzBsr8qU1w/MVruIZ3IDvHiTNGnN5Po=
X-Gm-Gg: AYBFou1jY/oI8v9WRKyzDb76vcNLoKW6DYVQF1AkhKHNb550RqObMcX2PGSXbR4RtmU
	Ef//bTQOxsN2Y0TMuLCw+PbbiQPzHdzLahK6lDqDA4ktOoBxNJOgY5M8LmOBLkeXZ4exHlwvuZc
	1jM9+uIyiEqrjQrpT0+p0CZJQ+ym97JaU24x26KS7tO3BKzLtpVYa6GQ5uxDjX8jIpeqGfOTiYg
	prhni4tmMxNmq1LvwlXMyCGGVBhR4C+MaceSZ1YIWMP5AQlwueJTnvVKo60aNJq5M+3GFJL1clz
	PloPSjY+/Kil1T8EBb4nJq2EgdHqGTEHGuqI6kuQLRj8PK+ceDOOcl3prZKW4r+Uor/MRZDTAFG
	k+sQ4SdkhCuQLeT//qeQP25ZJIa1iSbpfBVEn+tYK44cU8daiMQO6fi+KBAEXjmcfFzb4Ij0j78
	lYvXtHVIxyROG1
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596919185a.52.1791587124234;
        Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596913385a.52.1791587123677;
        Fri, 09 Oct 2026 16:05:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bae2sm1004191e87.35.2026.10.09.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:05:21 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:05:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
Message-ID: <k4yulw6hzkiw37ju7tp2bdxbh3kxrffkemyfb2zlxeuk6sul24@j6obth36alho>
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfXwmQ+ZoUdh2BB
 AqqiQ35P36RQteBpFnxcfNyIZPdDvhZzsg+igzWgeUY/2fG3tw6ki9R917lMib6SXWOkHqMGwGp
 LQyKw36Lp++Dumw+xiVPy++/GbOXua8=
X-Proofpoint-ORIG-GUID: pUAQ-O4QoSlYr3_Sc8yE53yCnSV4PyZp
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac97334 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=OGs46NaP8JcU_4BjHI8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: pUAQ-O4QoSlYr3_Sc8yE53yCnSV4PyZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfXxroFOOgyB7Wv
 ZCaj/LJ1GIo8Iv3Rujotv91gmJazYx4vzsA65mqvCf2RUiku6yCqq4le08imFa+Ae641U5J1QTQ
 aOkrCTzhwYqx3RwyXn4FpWmouXmzjGDoFgoUkUJgK06tYgGGsVSoWcvBZq8uoTGx9ptoj0EhPhs
 vv9VJSRDjTGomnFu4qyDPH9Vxs+uf2e+OGxN5pz3B/k+WobxmHg95Hyudqc/3zvjxamXqfvogkb
 1kFjS3TIxKnf1Chqzm+R6l4zkH92tQe6EGfwioUOl7WZVH8KOrEa6NZmKXbxQ+/VLhsjxGGWp14
 XmB6LIAZ4IyWFI2IRZ6A5o0SR3hSZ0hkoUH+rwfLIo8E8M5njlykTkewX8rLrn7mTQqejluyB0L
 9eKDepKCESZqxoSV2bG4NGzp5E0ibeY8/ikW1z8lRzzZMnT3dCpTqidoFpVdEg3Hd3jazq2XxvF
 NoWaL4FH+bh1OYaUXQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090092

On Fri, Oct 09, 2026 at 05:49:30PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630), whose board file is not in
> mainline yet, on the sdm660-mainline tree. System-level sleep there
> comes from changes not yet posted. The UART nodes get no path: their
> driver requests no bandwidth.
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
