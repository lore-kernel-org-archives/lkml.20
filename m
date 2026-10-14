Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D614D4871
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982360; cv=none; b=DeWm7BNOoV3G4uZd+Euem/cuaK9AZAe4SMpu3lBUY8vWc5SMH6PXtSAdMlDEl3+fjoJ9hNxgmdip3TKNebkwYaI526QRvEJLu+nuKXasxOaffmb1rdYi2Tfz1CRAaXA++1YKP0XeFwBpe55G7fzCcORRQcb8K7ILBvYxIaHCK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982360; c=relaxed/simple;
	bh=ggIJpFtBbGEOkh9+LAMjApcVH5QDsNsEeUnjHDyW24M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stJEcMMeI8cbphqGpS5NoseyYQMKKZr2SQYvLq9b4IYbi24OjvKp/a3tLU1b1L34Ks0rqOd7dnFToim3iPCBzf05jm3qLxpv/QT+heQ0KmJpIQiMwlgJnvuNHV1vxMsF/ov4475Yjr4QOsvD0p6xVqSlMZ15UwTcyWvi0PoGZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIHBFsNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeTOiMRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIHBFsNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeTOiMRw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eEM93696421
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=; b=ZIHBFsNfWR+rgZZE
	SSS/paEcFVjnSHJFVuKa8I4UXs44sJTgB/RoqL8DlGwmm/3R/PjrZm2Kr5ojHrti
	dWUBexYRKSW/kx7YPFoCa2m2IW3FVJR+dJ4QSAe8azX6xXO689NTWwqYgFtoQcDH
	MrbSJ5KEsHBtONGueI5V1QeIOMGtwLB72NzsaI/gZo4ttjNkY0beCTZjmAwQ27Tq
	LHKuTX7h1vFsU19joWqcF5jCTDzKKjE0flanw7LgAE0SOPvZ9cvqwz/LuPObKxkz
	UHpChVQir3idXbuTCmyIpD50LhPVlY7JjjTVzzshL3JfBuZqPhFEwbaRQs0pxQWW
	5A3D9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aegqd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso53302885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982313; x=1792587113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=UeTOiMRw04F41y0j5j8d8OI2BXRyc/sUXMYpV7PjhJ/GiU5JIeNqoFkMJZtr/yGxM5
         xFNL4tDf0gwn78nsOmUyHWP65NPbrPXIXeDts+eeCp09zDYl6Y58BS4D5ExMdYeZ43iC
         CURFEcKQdsgwJ93+Id17cPex5EmVpUX0fJynTivSxhpjVI7+T8QSX8zD1OcZM5Sgyucb
         0EAmkNu0S8/lHcvwcmqWpi2iOI8HLbMn37D3+PRFfdYaOm1p05BfyWAShxElImqAzHgq
         RI1hfvksMQ91EYh3H3KSram+CBC7zGeHWqrRg4pybYmbsiK0VjhCqFJcJG0h12P9sqBC
         bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982313; x=1792587113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=oSevmabR2j3hLiGrcukkRNU5u4L+CFs/RkAvn32hfIY2xpgWDFFfLN7ft8fdcnnGQQ
         c2c6GzW+69z+jjV3TCtyZPGfN2zyW4LtLwlqZ0bYXC1KtssfTlXGVpxDXTz/turrdME+
         XgoW0jaX68ljQ8Wg+tIjYFrizwE9EycFmYK9a79b2Kxf8fKSAC4J8N5SpCtdyoqkrDVt
         OTLg89odByytc5Gz4+pj1SATBDWpQuMfA/5XqFvuA3J23lReK1y3xEXZYcJwo3PWUM8p
         p3Z+ijbmLvW79+y2DtYyissB5mFrK9baaWvV2gIaxJcDH800BJmCIOyrgnG1EFg5TWFh
         aEjg==
X-Forwarded-Encrypted: i=1; AKwUvBz8aUWHWjgr4psTnIogI69PX8ZKnJj7f3QcQIMEecQ46qWIoRuSLGKhLyB1+HTMSlaq3muLfx6YAs+ysL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWYnWwptwjfdZdh8e+0acZJzBRJS1Q2aOjRWD0AylKMriSZAkH
	7N9BdtVYO8K/J0uLpn6Cwyp61br3ty1QyNmdnvNocUSf3m+hk9f4nmX7eDKZdZGRuWBOTHXwByD
	m8LhS6guZQYt2/wJSITX8eMGsz5R6qSewY5giG0H3yZwyBnmGyFHgyBsIWb2YZP86SGk=
X-Gm-Gg: AYBFou0Jk3CniChuFvcpjxtD0pLZT8//EbH8+3gQyD79wcSLbBStuBhQIiUXKQheGwW
	7Ii1RQTrFfV2J3cARTR+9X5EiMS0Jz3NWs8AQU/yVDmjHsXuFlTQVP2ovPOeDMuN7OL4bEdrQKv
	WuGIcpAwB2gXVWNH9y+ya6DbJ5q90JqWJxSWVAQQl/d8wzt1vS/CB31z3K+AcjNefs9h8PpggXI
	ubxrPCl4U1fEa6S6Y47sYf9PFCgd05dFo/B2BJShTW+Z2UMj661K941r4vgxd6h0dAx/MfzqgUv
	erkh8Nfw0lxVdjWM7eW/7U09i0w3YB/nHHoJtgtfQ0BTInnDGTpwhDDheOG7cVCgHRhgnfdjfVV
	ilYo3AQ+M8OUpszHUnjG5sA==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132808385a.0.1791982313171;
        Wed, 14 Oct 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132805185a.0.1791982312668;
        Wed, 14 Oct 2026 05:51:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839764sm1094637a12.7.2026.10.14.05.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:51:51 -0700 (PDT)
Message-ID: <292be478-dd1b-4ad3-a5af-5df6e61bb89c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
 device-specific pmic-glink compatible
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261005164303.1208127-1-zstaseg@gmail.com>
 <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SmZ58VW8Sx-277SfdVvvmuXbZh_nXoUM
X-Proofpoint-GUID: SmZ58VW8Sx-277SfdVvvmuXbZh_nXoUM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX2QPKxoWH4Euh
 wucEMTHJcaEHS2/GRXp038sgNuwcmDv01n8I3PKSzyW1/WAJCo3mCc9PbwDzhudpBhS9w4bo/ly
 RxFG8D59wMXRUaR0gCjNNwHyKhN0rsE=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf7aea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EvRZl4TTolMPfV8XnZwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX7APIYMEBh9xL
 WRtcu67Qqf4Gb1iuw6mYCioJuqReHPIVRZfBvbmrd79gcnx72qncg1xMG0qHDKzwIMMsn7NKkoJ
 ISgDSx0Z6kq+8bSFHM3k10F5MC6auZijYgBeouH4f++P+FuQUg9wQgEP81Kz+meaXo/wCkD1cO3
 w8wmD/O6Ky18bPHCQoSBELaXXTZpEQ6chp//LUWt2WTq/8gRZfLq5LT1LsXokL9jcPBf5w+2+DU
 NgYcxZV35fk2xYX24GmS6HYGDx+1R7VTZ6UCl/2iqXXAWmvlLyKTifIT/8urCP0wJERqcWyNMx6
 hnjfQ4N7pDEns9laAgdb29fLoLYLz74dDYdC6WqrSnUpMyqppq0cyl7xG9yq2mLskPMqVkvo/VN
 o/OxB9dPdJBb2v71fV6hDGKVx1O9ltgZ+vvE4J+VnRoBrK1e5OHF+FGEyu3XMP+deuzHHIPmelI
 4kV+sKX74BA/7eTFxzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

On 10/5/26 6:43 PM, Stanislav Zaikin wrote:
> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
> qcom_battmgr can identify the device and apply its taoyao-specific
> battery property mapping, required because its firmware shifts
> battery property IDs relative to the generic sm7325-pmic-glink
> firmware.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
