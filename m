Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4915650EB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658848; cv=none; b=KkHktozxxIYbJtOp6PY+TTxBOtp3YK3fz0DkmCmUSkaWyHovFJFjTFjmZnUPbGdctVJnt2jTpmAmXBEKPY3uP6NKT93M+S4WZW9d9cfMtGpgl+4Sxf46bVAyiUlpAXTNUONNkfMg7q854rqj/D61o8auE5HL76wdIFSPXCB5ImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658848; c=relaxed/simple;
	bh=ORrkQdx7WaXLuX6nCR7n/UoR4xgg8OSPPnuyxEfLNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqJZYqNikGobikEplR3Zw5w4TuAfE984FRWyglRxokbArlZ6G2HUnbl2lteCDungT1uxzNh+kQ0s1QacEyfDKynk+lsnw1FFU91izQga41r7V7ZV8pioQVjlBhul8KS63iCJ0yep7xK2mLzRe7Ht2QnpRRtXVA+ia0WYg7VlR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ0AS78Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF6FPlpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ0AS78Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF6FPlpy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDk5vX1955214
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOcf1R7o5InmAsKwg2E0EjTS
	IYI7yDGuX6N2Ud8ufV8=; b=MQ0AS78YiydvB/L9ivANs0HuhU7RutkgB/3kwdsG
	kMln+VSjUbSBBkbM5olq7ZRZzRo++BRaqiiaJEvyz0Akj/Hp1UHnUUiNPhcVNDSq
	pBDSU2oW7E2Qzwfg6V/uLmt5m7FsWiMArz36lg4/pTUOcg04wcln4stYkJvzbgiF
	baJAbhBtKQd1MqqD0O2f2nwVFWzvlvbm3z5RoUurE/IWD78pLrjtaHdulPd1NWwg
	m/+K+R9RONfZyvdSC6pJKvZZ+M2QdJsKFhO/3iyPqUVyd7Cyh3DcuKaYkSkTj//Z
	X6KTcpwF+lDdjZ3eULZUuIS/dgjHB6Dq53/u/7u1UaTO1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gqb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:27:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce8ad8002so20375016d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658834; x=1790263634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=fF6FPlpyCSwQaHGjcVNd5MjyCjbetN7WV1blgzFr9082tOU0WbDziUbZG7XZT+cZMi
         SNck0Hkd9KtjOR3rC1cg5O6dt/3H/0hBYn7QcWDFnZ5ZGhIi4nj1RSx/r+dNPrwfjKEx
         +kMnDfUu34tkct9uFkgbhF01K8pLn8SaOrWRvXsj+EjZQqp2L0BLIgTycOiYjnDaJskW
         9i4kJF8+5BJdlbO5Sv8gj6MRiY+oNcxD2Z9m4nc16qf2SW/ovq+iqOtZxnRnzozFQ8Ro
         vSne9G/6mxeVVv2bd8DX7gZjiXAymgcNrkywXqvBtFp0BldruuzNkh4KERopfqtUOiRV
         ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658834; x=1790263634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=hpjhacF8mkmvgD/9KvwcluEYRFyw0UqPYucyffMJp3QWTneGg7760tPvd4kmlDQNxx
         TbSF6OgcF9zuXfGC2L33Gye9ppJcSWoV0P++zXswL6Z2ax4B1pKVCTVUMcaIAvawIVMz
         4SyCMaiqnKVe9y5Y2vwaCbmMQvxODfb/WwU8BGC9zMxydQatZhlLw8Um5kK/WV9VBnjt
         Jgi+SVkEBIq21mgmbwTsQeKr49gWYfgG/vsqgdmQcmW4QfhKiDSxzVTghjYeId3cIv2Z
         vpc5L5C8pwnb4ydIgYY+Hv+/D3LZ3mhdXc02/b2Dj6CVprR+Yp6XqugUcAjorU7rmxBE
         /GOQ==
X-Forwarded-Encrypted: i=1; AKwUvBztQ5BnrciTEBUc5TmyfIvSuByk0MJVvzRPH4Qs66vQQiVjNZqU06YZpk/AfB9OGpeXRc0FCUSS891OlBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kCjWsKkNFCq9i965xRFc21bFM2DVGDh0hXdFkibEqZW2qwJYzF
	o9oRLo0HNw4r0IUprNejGxFnN4xDuk2YT7NS3IRCP1aDuAtSABE8nl9i/Dq5/GkZHDy/hIN6dYq
	V5iIjdwj9BPG95S6xN/ZNARwGSkGqr+zgjz1X4xGOlnoRo5WzYKI+iNdX18jnB7mBMww=
X-Gm-Gg: AYBFou2jlxf/uWoeVF5hPM+Ot7XJvnCGUr4rXz7b6B95vZ/ZOhtq0syqtM4jdevRszf
	EbQ7AZorxlRDs+WcNxFtTntZYpSFCywKSQAE9NYbRtFlwQyIOdRcDimestZ7L0/z+Hsw8f+8hv6
	Mj87QsG2eih8bWmU1pPir1Zv+DrIoJtUOiHwXQRGtDjifWcRai6K5P35Kg4TToxNCfSM9LCXp5G
	mWrIc7Tmc4YdySXY6keY5JnGsYP65p4AyIam1R09Yqak+3QWhvvWARrKeU1Bqyo7NU63+bfMA1C
	M1CWFaKMpHfrVapaz9/TDKzdaWFXnC1P9SCiPGB2gvlfaTfchDSeJqn9ECSFAahn1YquZ658hG1
	NA2mgGPqfj3Yo8J4=
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6212156d6.23.1789658833868;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211096d6.23.1789658833203;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm16288601f8f.14.2026.09.17.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:27:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Message-ID: <ns6fwcvy53zd3yx237nrnbyzs2dvnp2imucgdxmj2wqi7pupsf@dkif3wniurye>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX1n4YQ3EhOvDj
 cvpUNSjjJdUCpTKHyOrbb8RSxXKDe1D6jNGfzNwDg8Iva9FrZnyLQVvNbINiu/4965wbm6wAVLB
 +MioRiCGTvY35GUJTJv8ftIY9xTBvFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX9oruqk5Oqp4J
 L56VLnCiR3whU6zyVJEJAKiKPiBnP9waFXROPB3QxwgqKMJDEXNWlk+yjpBOiFYnF3oKfBm4Wyu
 TBQlCWHxgH20NnlWb3CJaw2Rreos0meq0uCuTro5gm9QylpT3Iwpdb0GttwUpoNJWOAcooaN9Oi
 BawqokLjvuc99uttqRjNqDozRgGlTb0YHo711+INILz1J2eaEKKyReoxljx7D3LsCfqVhv33a4Z
 o8smL3GAxrgxrrSoyeoDXN9JZfUtcXGFEtJ5YPLDlz0Yq6toSwksMzuhtw7AWxlZCCM4oZQecrS
 G8+bXM0MRCsnFhz4ZjkkYmwnau9smNgA8xHvaCYEOw0P4EnO/ZOgk8q9OpwdYej/Fanc8cvrAZ0
 Lmlrgy1AsyRqiz4arEhuNuCMr74CZpTPQv2BYPd/BMS7T3gZeNmRymfhqjNUCPjrZ2ws/Jg1UNe
 I4qtlPKnXyaVxWCXIqQ==
X-Proofpoint-GUID: Trdlg7s7cgNR8VDD78gA1LAWz_TFNitI
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac06d3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Trdlg7s7cgNR8VDD78gA1LAWz_TFNitI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218

On 26-09-17 17:11:01, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
