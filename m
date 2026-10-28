Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201332;
	b=FSqYFd6Agn3MGvmsJ1a2IDuc376VsyPtRYJwSFp5s7feLuI5z5RmyIJC6XKwyWVD5pHK
	 ht3HlmIeZ/VLwpSY5KiS2LBjt+Y1HZFqQycMXkGFu0OSGT226GJW81KG5QgfeYsEn0Tw5
	 Dy1TKTtkLGMHr+NgGdH2wncd0g6Wme+PcigyyYiA1u66OmABMe+NBCXPAIiLTP3Ayle13
	 qDiLHJPJjoDht78AKuadYKsfd3IZSF7pFehMAFPPA/UfC03z03EFu9gnpseTTbKmTvrwM
	 jbXUNErdyak5UVDRzm0dteuPzodypebvj+O1f/uyOHft8C++IFLic5acmNItrj+zJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
	b=PFweaGNOFI/QsI9hnUwGci/1YNZwgdq1XqLal5t5HY6da/WDaOSfKDDOZNQFM6RVPtGI
	 1ne0z4F+/huwfx7HwalSGDTuJxHESXD/GYr0+qMWfFpn6dFJMCg9foL0OmxLxy5HivPx6
	 PlPusKN7EuazZ4G0NI68nbIBbFB1g8S8My6sLeISjBNp818ZxP54ZzPTy6YJl7ecjUm/4
	 78lhuT24uCvJ1RzO/WTZKbrw02q3pku+YcSXDy/bNKAExoWixUTgpXqzg33EOR9ZQGoau
	 UD2pL+k9EB26Ckf/Rs5rXd3mtzC8oEZtWWpTG/gTOICxtLwC42qmdzCi9VieVZ+3lAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9tcg966144
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt+LWj4JTxLvmvfKCHSS+whi
	9VdAbkeinOtI411OZBc=; b=lS1rxH4gd8sa+mABPrYZM2XB4BKBJaRx5545SSpY
	9qvU8eTk8yRkisoa1vBwzUjS0DKYUC7ZbPmdW+U8oK/Jtwb20aV7bSGtI9NafViI
	hNoq4YalpC4qqgl8Va6coTYBmm0Z6hEPAG0ONkQOAuNzqsT/rcolJqvLb7ywJ0qV
	hYiReKE+glOqBl4W7Es6wpIKly6Y4Mh72klLHAKizGWjvBFrYTDBQyTln8Tbqst3
	7VVSVkKxy7afwQHsfICjmeMe38Lx2zI+js8MJhWWWCtuh/9oviygJRE0UyRXFBhk
	6lukfQp5woYMvlfh/6YmO6REeQensQ64ifs9mVYzoLJvFA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgk1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so280947241.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201330; x=1793806130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=MYCADI2VqnH6blFMNO8Ahn2dr3fg59JUDBOe464BsrzKo+xwCsFR2y9OyBrq+Z+uAx
         dGL+UqvvSymPUJm6DulHh4mrycNLlUwPb0eNgnerQs21duxhQJwLBE2rZkQ/rTWbhTxh
         yEEHdbtzyuuMv/jzKCGXIY5ciHFJ2c3ovdzBzIwnqwwFwtZ6Wcc7Tbcnjcf7Ys2Dv/0K
         osYX6G8sft3auJuPXsbrtWpBJFCiv+XO9qfgoWoFYRulIRTBKa6oak76r1QfUhfKSZwg
         v5wzPkVgfY4T1Q6O4V5MI1LniM2Tz6wHlH4V1GjzYjsSxLw3Y0TR6cTvDMyjF6yw7sC0
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201330; x=1793806130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=bQkP4EIU9dtvIviYaOzqoC7YUYuLPUkQQ54rc8EsMe7+n5EHATXzl8H+lXa5zmFnuK
         yuuQmb1GGUaoLnlqBTBnyooLSoxcZT88pefBW2tzgOJrRIrfu50bRzanQRStYxKp2Isg
         M5hduzR37W20HhL8ObZSw6nvanLdi8QDGns/BXMFsC4ohRQHMVZXtZB68Fmv537yV5Io
         sRdxRM4x8HlqJUgKEBAK5XHuu4pT0zBNrUPVrait/1P67ZkZmlg1gY6AJGd7BSzo1T29
         PH2xlMaVifeEKuyKQ20GNgcrUCC3058MaiZtVfx7eg1tVAWR5c6v4Qh5Fk1vVB8RIdLl
         y3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhLX5bkBHohBVvpsWcbqSRijWF+irGv73r4JGV+Fbo2h3wuczWA3dYcmZEnI8KkOoOMFOn/gKCwIUYnsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxisPE9xpWHhPbjLCItFHGYnZiTIBcmQhf8Wcm2FcbrFOIU3XT
	VAhAxYqvNZFYMPaveDIpK2FIJip4P8bFA2QPVB5Q0wAZiJWFnCck6AGRBZo+fEb5jGeqELPaZwf
	WFyhj3lyjhGefwhIGuN/fwffZx8KMTQzEnC/iedw46PUySixWzIe3Ttc7qaJKgBvGz4I=
X-Gm-Gg: AYBFou0fLjgEon6dLsbLL5qg/fgRJhCc5DGtyeyKWgCs2Wup00Rj9f8ftO/zA+spajE
	g3/77qFg3wKm0C5w6EwqASXTwCW9BnEW5LW0+sCk0iqvcOKr2xdjRXtNfjlHNR3/Fq3dDVwe80U
	niwMaEaVJbTEqxm/Xc5EfPgEO61YX8pHQoHnFv43RCd0SKxuDfNQoNJ6nxektLYopJlJohng4LD
	Qrl75cp+mycgUBDj3SBgxfJ2dEP6g5KoTduFvNl4GYwyy1SOpUDTQ+kepSsBV0uCxue8wJ634Lt
	V60BZgNXm6VpOvzbvK5l6hsB1cKq4WI/SanU2OCbAhzVVGnUua1Gdfw8x/U5FWsXUithfhUMPgI
	vAtZMo1Fq9G+nPulSS7ETJEUpWd0ZI4HZrxU7Vg+tLk0hUtLqpeejNP/45zNK/7z78Q==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443078137.12.1793201329947;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443045137.12.1793201329366;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm27880107f8f.55.2026.10.28.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI
 controller nodes
Message-ID: <qnxjvwd7phkvxe2gft53i5utnddjfkjyljvisx5wfd2epqh774@4jxv7jqlubs3>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxteKTYoemBw9
 Vb4/8RReLIF+ur1oIWVH0GQ6BVINDBz73UIbzLw69vVygL+SG/UAizKQ1BR5B3duoXvM/rtqCsM
 uhHTtp5UTSjZj5jillYmPePaTzcOx3zVCLZ4SUjNgadQsgxIj05oJA0WaHNAQEZpT5W2oQoLEqH
 l7plQ4iTPnzg5Ugr68aeghHyGhxcumF5h7C4y1KVF1JCDrjNkHS4QY7dlSeDdTKA90JJyuKLPG2
 QLeQ7FNN978V82L02L3/tpNEF0j+WXGsZUOEx5RJN6eCURgGSTSpTPgO64hATmIpES5l70wBcTX
 kNCTZ5TStctxmPWQn0T9lQrJClycjifjgINNJR2lcRMYuJE8B/DrCYdy3i2TytT7VPaUoyxeWs7
 bBHAO0WL4InJTrh6DsXPZLnUqr1Wdi2UEwEHxpydhXDLPGK7fal763FceP4k+20zaIwxvArgoA2
 Kk0FVZNLmSS7mL2qfaw==
X-Proofpoint-GUID: 6d4PFLgQ0bJcawXTy8FdQ5_8i1BBwrgL
X-Proofpoint-ORIG-GUID: 6d4PFLgQ0bJcawXTy8FdQ5_8i1BBwrgL
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae214b3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ew9RC34E4BSkZ0FC_vUA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7CzOhvYoA100
 wn0MdDfwb/+Az8wg+ExXjtzUVayBo8xxcgsNNJgruZ8X2JQb7OCcHMq6eX7pzzeYZYMYS1sO3dQ
 pEy3UiN+ve2CktACT09/s2DbQi69qa0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:47, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
> 
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio109
> cci_i2c_scl0 = gpio110
> 
> cci_i2c_sda1 = gpio111
> cci_i2c_scl1 = gpio112
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 = gpio113
> cci_i2c_scl3 = gpio114
> 
> cci_i2c_sda4 = gpio107
> cci_i2c_scl4 = gpio160
> 
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 = gpio108
> cci_i2c_scl5 = gpio149
> 
> cci_i2c_sda6 = gpio115
> cci_i2c_scl6 = gpio116
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
