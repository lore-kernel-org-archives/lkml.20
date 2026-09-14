Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A8D35C68D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371536; cv=none; b=mH2DwA7FfMsiqR61J4t1uN8C+Z+l8kAWKt4xHqDmwLsPeqCC0KwtiGMG/jEpNT4XyNflbki9Aw/inW7OWtqr7G53xEwEGzpEErzpvTayqudqo5FWjLtL5RyDZdwgHtziEGxCOmPVp8TzYkqexb2yk0k7KvsduIKQ985Ygv1THCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371536; c=relaxed/simple;
	bh=IZAQs5Mbd0VHxeZKpUFNEOb0Cu6bsj2Yfmj3KWn/wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxZc/gTKWW4MpRqkOeVjr9C4MJSvaLKkd8foxOmh2MIoeTBkRE0ASnpoMVFWFehsWmPSyHqCBndqQSpdUQf+wq7xp/i9C65qAHzcV2A8i0JeHm4Yl86WXbuL7wzB7z2pZEg46kXeiSbQi72AmlMr0BO6TvuBm5GoOkgl9lXRCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyUmKA9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6yfFJLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyUmKA9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6yfFJLp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j46b2628351
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HKYGjaoMC5AkTZVbZyYUvH8u
	rS/boJ/Q+kOD1Piid8A=; b=KyUmKA9rHARHtjXsMn5js4pUi9S8yQ9bUOMBPMQY
	CuSef5gESsVvphF6Hw03GL8jmubsV0b93rNMAZ8R3jZM+r3Tt0AN0JJZdUphynK1
	lHDN0TyM7Xg8xlO0SvJKgmp793FTTDpM8RKkFNEMkBZfKbQRnh8uLDPpI5r+3NIN
	+D27kZAC+BstxTyiG3fV9QfobNxqsshf/HiMODeu7k8OsoElVcY4zysx9/20q2Yv
	nlpyxqETA7GpK3VhzJi2H5o33Z+6s1IYApeUI6DGPHIoQiS1eIVeTdJ3ZYqgllSe
	aYOoYcVsuETD0NpCP5nVjaGbbjcPfRyhTOh4GpzaE7i9CQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5dte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so183126185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371533; x=1789976333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=h6yfFJLpVVbxxcyELKrCL02D5/g7q15xE1oOWIltseht63m3ieYYxi2VajaDtT5mql
         rVcRo5vnVzIisSCnh+3xOYhybEYZc3WXq+Gw0ZyEgun+w9tvgtmz7gtlDmwq4/lRxmei
         YTG2ZoJwMVMkSQ1zfabfsl94pSH5152jq/9TaMmQgS3aWviZR4Q3tZPG7QJ9wisyYo37
         /5kldIp5ih3/a3ULRWpKMd6HxRB0vyZNlisUftUSfhxy934R/QtSskItm+L5Gql+/PkS
         EWbsOp9qBi68FISNl1sXIICzNv/w+6ZjKGpGCwPXHHfuxGDlf29ebskXqWgg5dr3Dm6F
         O+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371533; x=1789976333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=BhnAzWOTOgGuCi4JsMXNnpzM2Dr0l9yqV4juxrVKYKw7YclWffnk+I2IUpwYaoMHoQ
         kV24DW4S1wz9tmtG5wuiUbuFEndIAkKTplt2cAgF/IfnJOAIWM32vPQX4dYf7LuClk3/
         LXfi8rLEqcpCC8FVEhIXLMZmobkeIZxdb2xihhuHBZ0fmfCvx47AZj683r8BZqlElRqO
         rWsAdIoc8txB0AFqNYoVqnfJaLub5pZJTb4xcjEQzFUHSzFgP5XuL+TQPlegf3BYesCX
         42STw/HsrZf/jTFofrM2osbPz5mc0bVl4hNzFT87GTX4Pof/mPPL0eVsZNCP1i+bhhPP
         vPuw==
X-Forwarded-Encrypted: i=1; AKwUvBw13hbmRFwjTmxgB7SDiR1LZ841Db2SUq+5uBoe4y5DwEvD1AdxBfFMKxt9vla8TXZno/ozOvYdmUWgXbE=@vger.kernel.org
X-Gm-Message-State: AFuF++kl49qSr3WHr2JTJEE/Gm+qO9ZdKiRESlquLAG40D2YoJTmX2Wa
	eIknxAh97BKgqcjX534HGXLz5uB/37nRMf4xkWjdmGEN2StG+Sp0xRxfN1AEX6evKbXY9emPXF6
	GakmoLoi5IvwRbm+wO4KDhicoGdcupmlB8NmK91E1WvoG3SPyvLtAwy9ZRYpqKJ7r3Mg=
X-Gm-Gg: AYBFou250lrmwa17ICQO+0+q0T7PrmjXSXd0bWozmnmhftNW/31qAhDJigo/bXFZDEY
	U5pqft8GZTpq3gevUSS37LETf67caX7zWR8gFzZJ57rGQ7OXX5xanKIumlraTIzNKej8e11+NVc
	6h43CwiwERg5b44l4Fy5Y6PGqnevgyfeiI1m6I/4zd3khr5n7Pjz5bUvPgdHmiyomUUvkC3H5Cd
	qyJiezEgTdhohpW0EFDFWmsJ66DlF1ZywoaFmhD5Gdk4PmSVvh8QkoBfvumz8fZoLxkMVFuzg9w
	VYGP1O8UVez7pllx7yNyJ55WaLR9LeCzGed9/z7z8apmyrvDw4pq9eKi3okim8+CvYSL3PIKvyr
	sv30iHGIzmfmki+w=
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183311585a.31.1789371533190;
        Mon, 14 Sep 2026 00:38:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183309385a.31.1789371532741;
        Mon, 14 Sep 2026 00:38:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm25373986f8f.19.2026.09.14.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
Message-ID: <7mxsmfbx6qgzfn7vaz23ylvhoixolc5ge2ie6fer3bmzydwxjd@njd22lbnyyj5>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: Q15J6xorJs2DOo4rDTO1Cq6WwCN85KOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX8kjHuNJ8Db0O
 fQEmZ1a0gBP+XFVOAvja0BMQylHT1B0ZClRkvQ83csB4DvunHb1CXg0rxm6mFxtRrE2/YnAZomZ
 kUELgY27u2S11gXvHzLZDqX1rnSxMeltTz6h+crUIpz2AeZ0+OQXMg+6gswls8cf0+vpYvHqtzj
 rG5eG+Y7dnOvMierbMAFouF0BV1Kli5RjQUEI71n+Pn7e4+RNyl40GW3K2cfhsBFXO2oy+XMdkr
 +BJynfTrsOkloFtQRJM7qkUhXA2FzZ3N8f1syodwFxpsj7hiv5XPl3ZuuEkUImPEYtGEPgkN39H
 Qdi7wJ1aLbuxQBCjmVV0hP1BcN2EDgEQFIs4hghuxrnEgZTJJ2dOP06mdpTjSYokM31kMOyFCeW
 eKvl4rPM22hjcA3PO/HGNvsb9rrwT8JKQsvpvW+Z+l5FDAMVvjwey9RkeigL6Ae5SJfWX1nkm0D
 f9N9MCq8F3j4MR3M4NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/De52ai9aELX
 P9LgrZMI+rrfg1jIOXq40U1NBXLGCmzUaytOEga0buG6tUQU37V+L5VvRAtU6LkMvJxQOQjn82W
 kZWqkWuT5dEfT9olBk1ZSUk7niMRr+0=
X-Proofpoint-ORIG-GUID: Q15J6xorJs2DOo4rDTO1Cq6WwCN85KOv
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7a48e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:44, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
