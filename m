Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794026603;
	b=RiWqfmuCXc8/OrYtsZRxmtSBEbjrqtzA4EO79sLFvUnZ9GBogaRVnwkETThvotYKAZmT
	 vI3FmU8kkHRrZrfbkHHz8jqIgUp3E2YZRyiEPq6W/TQexKLm0WuOaWNzV8es67z4CEbb1
	 uQxnOIjl4Hw6BazfwH8So8JKVjDcbz3TZU6PPH1sbzTlbEsef6/6STcvr1kZwDmAGPH66
	 pu9gmykAq1CJPt5MG6mpDnxkO9TbzjwQEazssc88jGcqyVNuB+YYzblJ2TLhSt+LkFZc3
	 oI5SSpF6+F1M90dir67o0zZsuNWa5o+EJ3tJO8NkTDL9TbVw8/x5Y1QV9+V9P7DHOYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
	b=AX2d03Oa43WPbyx8tmk9va1miZzDK6EPWORKN5V93O156enqoRUXxibFgsScbKhpd1lO
	 Bo04wcj3H2QlqmWI9HGABLR7xAtHwPy0sogdX53iVQNAhgTVRP9SY3z2W+h2s6pcx+pxJ
	 vXjoFcDA2A42cydiz+4SlElBPSXZmtHeaD/oeTB7Gw+BMemA/QqVu64QKrMAZuXaJTHE4
	 Iy9Ciov9zL8wCdPhug7VjiXLP8ohAmSywXOY+yzrTSnRIXmOR25d5GylM4mamxIca6gUp
	 FCSKTyFmJxvXTG9cEhLC799svu6P7f836k6/cx7xI93lZYxIkEm/S3cOf88rmnAxKrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VXQw/dZe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7lJmHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2B8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXQw/dZe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7lJmHa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A73ZCiM1661565
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 04:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=; b=VX
	Qw/dZeFsTGMBxP819rfn+TGMbCQaHroanEkDnJrtwq6CfkiV6FjfWeLmsKrmHcLi
	9EQ4FcXRhDxyVl/L7KhCzef1tFwtsGuHP/4M9et8BTkVbnC7MhKAMlepDWxRgmUh
	rWHj3Z+y9KXVgrg3vTF3Wf0XJUCmZy/wp9Rj5tPiOCiLhXHlJ/NhuKD43zmDZmrh
	++0I83DmOqDTUV1VKTNosuDfsZEffxp1aI3B9JfHZ5VqXxPpSqa3uTAp6pOVt7rY
	PMJ760gZQ08Mkz1GJaTpjY4Mopq3WNTWROdjxanR8u6hr4K3lPuY7piVrayeWLrl
	zq4Qt6g5oYRV7hmyB9EA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv7303s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:43:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8488f31d754so984389a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794026601; cv=none;
        d=google.com; s=arc-20260327;
        b=gGt+uhx1t/IQTGOxGBQ/SfhOcy1UW05pSeOkN4d9w22LYcN5QFnZ9FbYmxIjH0/b1X
         irhDiYdKzJUCSjefK//vppFbOTP5iPGoI4TfN+aelIT5tlHOPHkkXLD5RTOqks+VlC4G
         UlzHvtu0vGZh0l8qnycIoGKhHOz0GvOePfudgVCtZyu4BfOxdCbFYFSoFmTQzFHuclbg
         64vTEwgMaN5DLT9gAxLzboWWBOTeF6mWhdMdiySQLRm8ieEzsgfy2zgKkYflhnPYdjKn
         EhCYf5qmDc3Prx0AJHrlLxAhXdFOlEAajKBE2sKJa/Bh+pL4GuUwcytmqmoorwrB0xWV
         MYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        fh=ze+M0ppwHbsyomZPH7Vnfkn6oNfuTjcwmHiDyZ7Lzuo=;
        b=ULxnkDvOvUOrre5FYE2Dco4pBrWve55/dGx21zEI4fqKEjWyQuQtVXLe5t7XE3QD+K
         yXQ6Z7Ws5AlaknmKJkEn5NOoJ25EL67ooTaExT0bH8xo7s1rqYqieLLOuXR1icQgelDI
         hbZF3ZUBJ+CGpmsjIPq3KSdPaPt3/oM/DVZwFR29ngrBtINeE4L2BMc9wDFwkokwkYLZ
         W1Izn0kwtIoOune2pp+S604f3Ja7Mk0HyJOy8BIndC/ozLSrGE83t80wbgNEpy/DhcP6
         QsdmeIUNoJuuXbWBNCuOgcPN5+pG4IUeqXXqkIizmbwdkav75FWKXagdyFh1RkUYQTDq
         j0VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794026601; x=1794631401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        b=Ji7lJmHa6aGI/jNe1y/Yjnif1tV32+hHaHXV2ZjyBqqRoF3YhYUHqp3TfyXjHPmMUK
         tQ8f+BJDl6l/dTreh148gF09wezOZfCUrAZTAi+xXF36pG8vw1ea9YmDU040KCCEGTSd
         tN38KY4eQ7Tk0KAR2MkqHvWG7GnYXuZjeDfkEqoHaRFePbZAjmNzC8qoFEKEGUwyD+AT
         qZZxf4F6kV3U7Wt82rCTDuDMD11riqdHeUGiXxrg5FlfDHh+l7j+U+HSzgoVfZlWd9ao
         Kb7cnLzCP31t+IIZc7fIm6sbjrXNZAKNOuB+ntpgZnKFY/DFs3wR6Xa7NpUR8LKgPJvf
         or/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026601; x=1794631401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        b=cCzdKtPO3HwIwusaRy/hajBc3C5ztEGkPPNHKpUZK/PblrNs2rNW/sTWQWgT4pSloU
         faXQi6+eCpLP1pNT6SiFgQI/Vj+larlTlDeCeKcbKakMU0Z0w/ZbU3EeTBE0Z6foPZCN
         HwYNMQQs2h1/ZYgvWJPYMLY1HbsNN1pN7M/pKy7rfs0lVCLD55d6kWoD+UAsDO2mDokF
         dEC6EQ2S5EYmJSMSS8081wv5phvC2RlY/lXmYC34I9lhYlVDgHlmjBcBlS0A2LyjqoHg
         Ap6/n7057iKuTgPzLrG1bnQa2IpE3SHXitUVIfhaSV7/hm1kWR6tQIIXXT6ua3n/yGv8
         U2xA==
X-Forwarded-Encrypted: i=1; AKwUvBxXL37bRxCbdE6Sh40go0/nmFUYkxPjWa9QZxrtgvPMgcBJRurU5wlTbE0qM5u7bkJCcpwydR11+zt7n7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OIOJ7KPTHNXTeNtVt65SzR68yP9i3MFXSH7/V4AkJpHIn/ipt
	xo+fJwa1fc4679a8hBh3KN7GOF00tkvcF84hBwkobKg7xgE8rImH2FYr1u9/VUxUAlgKfbX4+04
	U3UlucTDp+62i7+CiIzjnwiPYyf33fd1P/mBpFGu+FBmsc6zeIyHqtWGEEUsvxBs+f5ANNJrE97
	emEZhIMrW10SA/EiedHf9dyR8fXtFgEy7aV0H2VQNToQ==
X-Gm-Gg: AYBFou0r6KqJ0ju5QJ4OsHJ3ea7orymY4kzsajSe9BMj1JRrPxfgFjHBZexo82YSzTP
	ExCXqge3lMZiiUpEq/Nx5xgndVGCJQd0A2re9OMgp6y4XQDcGZcWRynZopZKf+S02vHKkHObgE/
	Zltq5diNnqWcmuUPYLuFq6bEXoT99QuHAUcD+ERVpnrr/ur9r+uWdXYhelU6ckH0ZDYdsI6d/c9
	KCYZwytLF99WE+H9k6/Fw==
X-Received: by 2002:a05:6820:340b:20b0:6fa:f881:7bef with SMTP id 006d021491bc7-716e7938ab7mr1898639eaf.46.1794026600912;
        Fri, 06 Nov 2026 20:43:20 -0800 (PST)
X-Received: by 2002:a05:6820:340b:20b0:6fa:f881:7bef with SMTP id
 006d021491bc7-716e7938ab7mr1898634eaf.46.1794026600505; Fri, 06 Nov 2026
 20:43:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103011358.65398-1-val@packett.cool> <20261103011358.65398-5-val@packett.cool>
 <07d29a8c-1caf-4041-8c01-845a51d11a68@packett.cool>
In-Reply-To: <07d29a8c-1caf-4041-8c01-845a51d11a68@packett.cool>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 20:43:09 -0800
X-Gm-Features: AclHuK8ZvCB0v91X3y3MGuHIzYr_FPdHK9w1jmFQ7gzccPmsaAhQMvCJpL68CKA
Message-ID: <CACSVV01eJ4sxzZWC-RxKW4OLvXPmC-auru9-wTFSY-CPQpRVnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Import a680 hwcg sequence from kgsl
To: Val Packett <val@packett.cool>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxOCBTYWx0ZWRfX09XE8jQwA8/b
 uGc48v0O4feswG6NrDeM9n1NViU7U8TbOnFUXswlRIX7vg5RYYWxDFgUAZjt+PrB/24keYhZwIT
 wVAEXDcx6J8vG9prPOx5fRO73WsNB/0IlsO7gviIg47M40/wTGSxq16JToYv4D/esOu2uFoqQcU
 Cs0D476MmXxr1juq5mIqjhus7hUV71Y2lwD14LJ/TbYJLnsa4Y4f+utKw461TztHZTsXh1HKyNE
 vl9uUONsd2XC+mmO/zkpWHMcCqXC86VhIas14vB9kUA8c2uXmCsLOOY8aiE5RODnAYLcst7ou2d
 MoaLK4IKfiM2298AnyO/QX5+goBOAPYw3pmvOaHkiG7L/LhCaRpQ9z4WX2oiMp24kWqpeJqD0TO
 aWdkfBqwCxeMT30o/RGJmL9Y0xAk1g2Kg2mvX24St6vhfZb55vC9g50bxC3ck3tuO97uSt0/ecA
 qmP1+ltR85fOsxKsC/w==
X-Proofpoint-ORIG-GUID: WnT8L0MVXL9p-EZVrkd6ddkInnDyDnvx
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6aeeac69 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=17JunTclo9ORA5DUsrgA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxOCBTYWx0ZWRfX0FeoU3FNYU4S
 qDLxLulFWByTchlHVRxZloTs6L9firVFMBb6lGjMVXQcE1ovKrYVVjwr6CLC6ZrMPotjPvwjmAw
 p+CUzWV0PFnBTveWEW9gdgRisQlW1O0=
X-Proofpoint-GUID: WnT8L0MVXL9p-EZVrkd6ddkInnDyDnvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070018

On Mon, Nov 2, 2026 at 5:39=E2=80=AFPM Val Packett <val@packett.cool> wrote=
:
>
> On 11/2/26 10:13 PM, Val Packett wrote:
>
> > The initialization sequence for a680 differs from a640 in a few places.
> > Match downstream by using this a680 specific one.
> >
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 56 ++++++++++++++++++++++=
-
> >   1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 6c154792cb07..48197a54984c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -9,6 +9,7 @@
> >   #include "adreno_gpu.h"
> >   #include "a6xx_gpu.h"
> >   #include "a6xx.xml.h"
> > +#include "a6xx_gmu.xml.h"
> >   [..]
>
> (As sashiko confirms it's not a good idea to try to write the gmu regs
> from here, shouldn't've gotten lazy and assumed it would work anyway..)
>
> I can make the gmu driver write these on init, but would like to know if
> they even do anything interesting, and whether the entire hwcg sequence
> is worth it=E2=80=A6

vaguely related to [1].. I guess I'd suggest to do something like that
for now.  Longer term still tbd but dt gmu vs gpu split makes tables
generated from hw view of the world run into these quirks.  Longer
term we'll do something to clean this up, but not sure which route yet

BR,
-R

[1] https://patchwork.freedesktop.org/patch/767327/?series=3D176505&rev=3D7
