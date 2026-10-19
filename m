Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4344D0CF0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405988; cv=none; b=rq9DNf53HIb89IZqQ+gnhBdpu7dp6vFaqwLAI6X/xzDSB/0qOkrqChxUyiwVwh7RxH+3QICxNgLcGRtmy0kG9UsEDRZv2+8Gng4qHV3eb+g2A3SFL0dt0DqNPwputLU3hPdI2PcvulBTjWZwI+AG7nE2tZtWsxXN5lNBuifovkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405988; c=relaxed/simple;
	bh=IgAFxojJlv8Yh7B3vkbS5J+bpRrVZTSGNCU5qQt9mN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFmM3w/vTGLhqZ2QjB157Fgv1ereLh4JATkvUcKgz/reTfWEbAANZoA/Mh1cmFiwJeraJPWTkuqCI6KsFlJAbgV07/jWKcLsL8fu8VH3fXB8REq3eYKwVYfQM7bVuGtp88ESEwrhEtOBpGso11XAzoX6a41+3PabXyM+wvOlDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV27/6qI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClLUpkNY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV27/6qI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClLUpkNY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2Dw724563
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hc3ydRd9A9oXzi5TCAAQjVkY
	HHdVa8gETxavOGXNQlU=; b=oV27/6qIcoWpWHMxg6uVdYukNJUy11hWIycDSb1Z
	nSwrM1L1mg/A/ithp86g8uD0PaU8tJ5xY0mXRHCmWAJPLj0dXSMcvEEUEXc47YG7
	Uw1BkD6CxhQl2jy2NeRDnPDtxDuQvMbsgXAR7QQdi92E1Ipz9iku/GGp9Hp1L67y
	vIIrUXbSU9vUN9CwUxy88KfgkHAukDDTHsU0hjgMuDCkgy5oQfEOoxneAlraQ8BD
	xmjiFm9XrhUyb7xDWDZiTAYn87K+7Au3nCBEpGhTkvV+9FfLY5+gnTfheXNdflkK
	1a8B6w/G5B/hJumDDXFEamZpRowa5qv1kr2a/8D4vl9qKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gm1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so352718285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405985; x=1793010785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hc3ydRd9A9oXzi5TCAAQjVkYHHdVa8gETxavOGXNQlU=;
        b=ClLUpkNYOZhL14Ua+MJIl+Ec3Hc/HuWxSZo3WmU6Taojad8QD6l/xGzXWGzcwYFgzZ
         b59hBAME+22CsIw3j0+Gx1xmiogiIDGczBOTuMsw2Uo14knkTTdtgEq4rYxPzSybFvwq
         2KVeENXxDO9lqz9+0RtUIVrbYA0LysMdk1Us9a1Jk2VUtKj1YOzpenl3iKRdLKee0lCl
         GEa4ZgIfhc+B1jaJdIdLFv59XxOfkAAKo1j7C+egdnJzeOSRvFChZLXh81za5H4oD+dK
         xPz3tginKdjBAS27gv7nUJuidmetlP+f46hSLZ5w89AHe/ECc5Ha8pYADSAPZDrO7MpM
         pvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405985; x=1793010785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hc3ydRd9A9oXzi5TCAAQjVkYHHdVa8gETxavOGXNQlU=;
        b=yycQNCca6s3dcKzbiGlNO5MVZxYgRX3Wo5hOskbIVsI/VmP+izjK8/pS3XR1yPObNA
         sCnHNRBnbpe6XpROXCB+kwgfvQY5TklhRXtXNoxcNYGmN+2owrPFcvaFTCvmOaSrSSZ4
         IaeKY571fjnXq5xIM3i7oQYpF4B+AxnGsZKECLiKkx2+DEvRvMdIl4p3iHVq+ZCTZyRq
         61Fi12/GpQ52jFQOygGK17HfrGKU1bYoVNPCRSoxy3WiWmq/lMyPKiqDpcyYomGsL2KD
         Vgkmk2+CVP6MLRZcrHJgNLsq1j16+cLExQeDbdIcw60sixQKhaOK3VM1gANK9MsPXrVE
         +RUw==
X-Forwarded-Encrypted: i=1; AKwUvBwu/TZANpilOfQotR8XZ4oaUsSzV+OCcd8hN6T4b3DLYFIGjWSxdnpbKAFLUaaYde4dqrjBxufdI7Q7KqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCrucb55T7Q6vxcjtg+uB2/lVTgS8boP/zNMzx8hpTXajquH5k
	ut6uR7OpK1gRDjep/pgkWpc533voHMupFnNE8rAbWkkx/GYkQ8skecZfo9r97CJMH+H5sO1bXad
	eyRAdquzQbbdIHQ1yp0kK3UJWjFubzsHQm9DPNSm5u0uUPUznKfApY4cTTdYNGHoQQr8=
X-Gm-Gg: AYBFou1P8HlGv07IOO+pWdQ5AKM6rVflqcN0bLvoLL5SeEr92Q6r3YL8/p3ZQKhdVWG
	m/lFq6tFtVxVLqLK9WszUWANvRb34U1o7C1OKK/5KxG9ZQzuNxPRMa6Bcg50fXV7NCUy9cdTKwz
	u6MviB5qIvhHwE908eNKSpsDHJbawzcG6WPaYmWZc3SvsRyAICjdVJCTiO1L5xFXqYAwbCiYitZ
	9RxSc7IOetDuzlhBg9rCSZLG2tvFlokMdApI8fhbTVdIZx88r1f0CGt0vauzKLHPx0TIWJutfye
	o2JKUrzGjdOKEuLBZEcM3u03QwM4EciNT6hxAHRv64uvS/Ryha/8/ZIXczTr/2wCbKdDj3QZhhp
	XicKVp6RejfTkdZ2S
X-Received: by 2002:a05:620a:25c6:b0:939:b057:daf2 with SMTP id af79cd13be357-93f29d66b4bmr1170730985a.45.1792405985485;
        Mon, 19 Oct 2026 03:33:05 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:939:b057:daf2 with SMTP id af79cd13be357-93f29d66b4bmr1170726185a.45.1792405984870;
        Mon, 19 Oct 2026 03:33:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm188570305e9.0.2026.10.19.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:33:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:33:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Haipeng Lin <jimmie.lin@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for
 eDP HPD
Message-ID: <4bjltrneapg47b2bzs4tr5nhilocsotgfptsfojvn7oxoq6ypd@cmhqx6xgrh6k>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/emDqcfrBdjL
 YTK4OnOXkjnjtFLz9BbywZ5hhe+NJZdntjmoTs8rHsEuzw00AfhTEftXhE08zAQ27Qo/mvKcUzW
 Jlulih80nNFhSiYoVbl2S5WKqegvSoM=
X-Proofpoint-ORIG-GUID: EH9Vv_qAzWCaY-v8Pj4P1lkAdaWfkAjb
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5f1e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wIhZVfkV9TNV1Twh65YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/bXV8nrhdEIV
 7MrtPSz4QmNR34z3ak9ss51/ZX79h0YYaYoeR2AQseD5Sa64HAtGBseb6I/bbNFXrjWUe1f+ac0
 EqUp32vzMQ+ZmmKXHkagaZZrcIfuZn1OsPiJVK2ZEi606m8q9idfJ4hYz4joKQijgCLmp9IM+c7
 XL0qwoAyDrx7DuG56AZ0/xs7ebdER+7nX4pmGpTvktWhq5RjKJ1CQGJDsFAjirc8fZJDQGjo1cU
 EEbaY/bu6Ba41iyBuMV3ZKqko2CZ3SqhFSz+Sgj8Od3c/F8D73Gbrx0Ag3maCYBCYyXjClYz9kI
 E9wk0D5ZocZEg9ZJO7GF8N+LOe1ffhFriHE1YYHC/umOJ3b6vJ2MjchpSsz19WAYx/HwFveAqn9
 wTt0gWpBBIzZ+bkHm/p7H04cM7dofUFWAzPNxoyP8xX6jIkRDD1IW42VYPYy5J6DHxy0fEeeQHc
 /l9YWGZKO9cBK9bas0A==
X-Proofpoint-GUID: EH9Vv_qAzWCaY-v8Pj4P1lkAdaWfkAjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-17 18:52:25, Dale Whinham wrote:
> The Windows ACPI muxes gpio119 to edp0_hot for both panels. Describe
> it rather than relying on UEFI.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
