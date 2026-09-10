Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFC3CB2F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025676; cv=none; b=FaovabpJtuz+JP1yS26xZ9z+di2dX94AdKKBNpmvT8dEiNzzSmFK2PZfXN2hIqUGmM9u+n+GrnxaH/4f6Z8U9M0Zg29MW7rfXyleeMs6LXRYJy/hjtcy8vuh3/CDWvS5eZ7lNihbPhs2Rfiozw+C4zMCHbK9EIz76kQvsU5fvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025676; c=relaxed/simple;
	bh=HEpcZ+N5k/PBTaFR1jr8ti0Jo5CNMvvcXr2gyt00KqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYNC1f9Jf4wYYx1NzpJYDnn+ejRPs2Aw+vZ7Hd4IMqB9p79YvsNv/4GKHGsSiLrMnRCgq2KkyBF6yCr9oUGQObMhfArY/VaUaCTGe60+Fo9JIhrlY+84mrgBE627qLSiwSBruWar6NPCJ7N4QMal4I2Waj3u6Y85tID1colVK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrA5ADg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csBBOZIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrA5ADg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csBBOZIW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GsGV3520313
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=; b=TrA5ADg0NJhtoRqE
	ZlEPBPOMTpb+ue8Y66UJYYQBotv6QHiYsoFk9z07cELpmkBGucU29FrwalCOhNVF
	wGDUO2Y13GrYcmzM/Eq/IbzXHRnwlCgeh/SVxusBdfr/Jd/0dhJCQayOlRnRrIni
	FREJ91rqmWbaeDtTbgdZ+Bbq7Tpx6xS+fPO402w3KNsJQKzXjQDA7Q8xFzKJYtYY
	l7cLDOEjfsko5ZBrUxedl8t3A7KRVSIQjJBH0nlLu2K6UZI5wzkePI4tV6UHCMNv
	PgB6En1yJMPis8ld1pmzJ18uYlsf+UYM40yLwqZqKVgJXLtMLbBMuj1zxFlK9vNq
	qzi5iQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfjr13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:34:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso160118891cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025669; x=1789630469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=csBBOZIWdxksM1o/N54HBuWqmgeUPLUMqjDRadjWoTo46R3FIsnS7HUXIsc04CVg/X
         CJ03SeI1EdR8KjqHFM88GmR+xJT8Fu4jErJ7ZnapqX+ABlguFKc+ijnhlQ7FRhHolLT1
         YUUKNy+GKieEAOG5pX6GJtMaIeuRX6bR6aFOJXlLhw5TA9r5QVNGYSx5Rk2HLh6oCOOg
         JTOM5/7pvZVz0sLZptx8cXME8ogIayPWwEbKR8GlFskt8zTFg3OA6QoOl8gqUgDVUZYu
         jhz5b5rO+kArsFKKoT8xPYILamNN3mxW9/dPdgWE2pg9m5emqgN87QU2YZTHKt8rddb8
         VzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025669; x=1789630469;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=L7X1ENOu9CblOHdKqigzasGgL6sHtYVRfaW4uY3srW20DFNrtk9H4s0jOLK7tLeqY4
         8BNUrR2pajXMOgyhjxKUhoWDn8dMOX5ob1ZS/QrhCFIBZIM2VQ8p3GOi4/1ndWkmuYwt
         xrq7NRA+LsmVf8rMCAZr5fuE/Pe/dCJI40L+QDLUd7C82CuaOWNi05WRjAL3zRC10LZM
         zGTMFRP2DzYbazILi4r1GxOrlhvC1Bk1ubcwC4vFYNDHCZudTdn03BPGbtGsTJ5UENp7
         R3PyC2tdTz7fE5SHWP+S7Yr16PpmeHlnzBU7Rzz+O5oqYRXHyynrsKfDUTao7eP6mks9
         OcBw==
X-Forwarded-Encrypted: i=1; AKwUvBz0RRG5aXZSsAz8cklYa6yuneuYvqrNoWsfKQuDVF5nZYWX8mKNle4RZyC5IQQa6A9h+oL5CTnK7zbcXFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l6SEVuKhgL4FYI7F8EwKRGmj9/2TPI6oliB1hzVFmbj2d40kec
	Em3Y9lqZRJiDc24uE4NDk4IBnSNPQH1e+VHy2+fLsUoOYOt6xZyk1DtViV87pP1YvICOiVWheyc
	QznGi2T6TewlVAsYMXodPESmO5XyRHLT6WToqf6v5PgK8/Ymxv31iq3xjkMO/AbTbtNo=
X-Gm-Gg: AYBFou1NzYbvvW/2bFE2wB6YPsUbp7jw5rhMunf7bagS7xljU6MQO1AY68fDed37OU5
	qATyzvZp+GFvXsocYWuquQ2fuqMqPfAtnFfJ/BCY7G6eOlGjX9GRbMsZ6vz0XB46GQKndoN4sHI
	UHN4lS1XPxiCsI3ysnw5CPUczuwtCvuq8g+6fV/I+EXfkIoGOtdX3vM45qK8P7o85d4aJU3Ohnw
	DF+lxNKOVL9NznJyzUbp7kqbmr4rJJIHDWA7FpLA8pefTPyeC0XMw7QvoO2XmsKCrzUnd6q0qZi
	sNfOKMf8vM5QGybOcdJes74E/qlF8Dsd+U0Lkvn3+ZqzHcRZyrOGTCoLelO949KQdVuEbXjQL7/
	YOCNYaMxCOKNkO55cP4p9GgsUM1KGVgOiflheUJ2d1AkAW30Czw==
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617721cf.48.1789025668823;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617551cf.48.1789025668499;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
Received: from [10.38.244.96] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530868ceb68sm96542161cf.29.2026.09.10.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:34:27 -0700 (PDT)
Message-ID: <68453b13-624b-497a-b5f8-b59acb2afcd9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:34:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
 <ap_t_x0D5moBWJz5@kekkonen.localdomain>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ap_t_x0D5moBWJz5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX9EfAzBBo9QfF
 s2zFaoPAK1Fd0Q5pmpybxjsbrUTFbX9pWs4/m1RpdV2TEwfuGNWsD9HLxu+7erc2cDWlMh2Wljv
 Q5aOSRuU1tTjcbSgE09eE5UXKvAssRg=
X-Proofpoint-ORIG-GUID: GQeW38AF5_XtDOQ0tHow1RE4iwIiLdQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX+/NgNgBrtb/Q
 whCx9ZfiVo9sfJTrRRoqQ9vci9c4ekVLA1H2gbFLInWAmjufhi5vFZEXoqgHgBZA1fRFhtOaxe6
 inBxQhnGDe0I3Kb8G0HhcGFsvTFwLKozv6uMA/Tr1IPCSev/Pyd5EdcG9fuRqhJ5XEJH11F/FnC
 vlckGsLGaZI0qwaF7YMXV/kHyzPziUhlE3YPo0QsP9n9IVGmesZy/Ctt9gMeUI20CPKx/l8SGj5
 1Es4kRzh1deeT2GflijN9rSqrKKU4QeVkjjInnBRVs9AgeiznAC6oKTag7HqvCV2lDgiLufsqnb
 31ld/vMLs5z8QSAuMuUxNfDaVV7ALPL11gquOfi5BoFiDe2nP0TWOnAz8FUmQwWSpzMYcM79goQ
 iK+J1MT4HJlOArki65TWkH9J0e+12NPJ3chHUzCPOt4+hjsVm54Zl03mA7AY3Fot8Im3gPtQ8ZQ
 n4F15+k0pWfCe8Ofyhg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa25d86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PI9LhpIBPIlg1HrUti4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GQeW38AF5_XtDOQ0tHow1RE4iwIiLdQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

Hi Sakari,

On 9/8/2026 7:14 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Tue, Sep 01, 2026 at 03:40:05PM +0800, Wenmeng Liu wrote:
>> OG0VE1B is a monochrome sensor and cannot produce coloured test
>> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
>> Rename it to "Standard Test Bar" to match the OG0VA1B naming.
> 
> I guess the test pattern generator is still the same (or similar) even if
> the colour filter on the sensor isn't what you'd expect of e.g. a Bayer
> sensor. You you call it standard, however, I think you should define what
> that standard is. We're not limited to datasheet naming here.
> 
Good point.
I agree that the monochrome sensor does not imply that the internal TPG 
cannot generate color patterns.

I'll drop this patch from the series.

Thanks for the review.
Wenmeng>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>>   
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>   	"Disabled",
>> -	"Vertical Colour Bars",
>> +	"Standard Test Bar",
>>   };
>>   
>>   static const char * const og0ve1b_supply_names[] = {
>>
> 

