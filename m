Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97A445AD6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243698; cv=none; b=Agq1fgDDd7rmAi6CtsVRsJDn9oZkcKvPUKcNVoo+pqgGMzS3Zala1PsSUhi6Jgbb6MTTRHuplFYhXtzM4llIBF3kWmAV7+qxxo1D2iHpReHBl1W+7ugoDMBCIxl6Rxk6PtMQmKmYc10hfisWtW9G9LyRAV7J6nbJ9gJc6+Osw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243698; c=relaxed/simple;
	bh=GCqtV7gztwacl1wtluzqhR3Rrfm+XRlmEFzBMnqYPH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKIBlBfOVOp8ie91h3/QXCU0BvGU3kAij82boQlYH+ZMa3jgK86Dx26APz0FL+T+jYiSmWbwYecTmS1zuaHjRPycm+MNSuk7QxQgY1Zqrf1l1F9tLsdbuCD5mIWm4zzuh9teQMOENIh7DdX0vQvVmJaQmNRfmJW94Eufif6YODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKC5m7Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwSCTjGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKC5m7Xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwSCTjGA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q9iV1774001
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pV86+SxpwWf0AIExCaUJX5mz
	1KnFAgW0PzRtHkqTKtY=; b=ZKC5m7XexAj1uVzerlg6Mt0TSm+38PkS1V+9Qt4Y
	YElhKNRlrSX159eOOMp940PNXHR1HW3yWxMnqntsD1EfPSSEaMdPSaLB6uTGnam1
	qNy6LdE7MQixUhdCO4v6dcdzFxKeZQKJlttNeV2kx2kQlhOQfjSYVM/DOTtbAIos
	qzeRQjCJ79e8jBRYHN9fpYU5qHM9RV3FVioxSBGQFB9ZuIfeiU0Cz6ImDVjpWlAT
	lZSRPtNK/NJ9UI/wueJHwS1PLCiy4nJYE4P80GWTt3sikVa6lrnjjp32TECWIELk
	mCIJSOAhWg5eY5Izqpa+Symgr8rqATajL8VbSuMtWmA+mA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb3sbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:54:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-338c2e27430so1695491eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243681; x=1790848481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=QwSCTjGAgip23HmAKQqzAGUGexwZKfQciG/rhjQmeAayw2J8XOrhuzhdnlnt1O9bR+
         Lr9FoH7UhOcnjLOJeuKxX2eoJETgr+xWn5f38EC1wdKkguGUckfyQG4I6HnlbB999BGQ
         sN1VF5Dzb6+tzzrhgi2DSGhBbVW5kq/eqrE+eOZaIVYFd/nKm6TYZfB6CbLk70fIbNea
         SVnMbTrptaSLsTZUbMqHrSeVUJhJaCZ+VfQxC0Sv6xXLn6fX0LLyWHzod1SiYfJW6djy
         ULSbYqiA2ssFpqRWSTI+7P8XGBXSPoaOlJDX/uhB7ef/Gr0IftaoXX35V8/icj3nCNNb
         J2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243681; x=1790848481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=YodI9qKQ43I3jK85RMNZCCwitybaws01k7DBR8pfD6M5ktn83otRrdayYeUkmZBiDB
         KneTmvZjxw8LVhIpkOyIYlEWy/Ag6B3xdkTIrW+bc6t0rG3Ocfu7tc0upb9dRT7pJ5IZ
         huw0rW0H35EAtHcSf5ozlcpczkdx075kzzfHGjmTPwnNmaq38FYWiiROVEqEBzoihXcv
         nLTL0VKNLXZZwTEcEvwix1uFmldXgIZBV3oN/9qhVZqSn6tSLIHthGkgCaB2WXg4H16n
         DK+pylV3AWWV1GK3QSolIa72i/e0zT9hpb8M9TwylR+lS9udmyt2VExXgLuUWw1MDLM9
         t1MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIqfWZSZQExYVAdAvi/LVDGX5ePEz2GpguOjZib4nxWUefjIvcAWFSwmc+LRU36ZsXX7SN14bQqj+hfcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kSaoXEU1g5oCWcGdFJUPbs1MtRsfFx9vLCNTTu0asbd+8TK7R5
	8oU1qEIodLm9RRHLW/lq27Vh2rI9GTtL/RGDUSItUAxecJQyLoiazOY1mU18Yi6xs3sX9KyqJeQ
	IJNoffw92XjjdmrHhKTibYqKD4dxBRJ1KrHc1VwXDvu4u3fehB5ZaqrcyHbq1cjx9Jwx1RUxLoR
	lB2Q==
X-Gm-Gg: AYBFou2oha2+ebCVgZF7+bSLrRtGliPKgzN253u10lO+Usk7QGdsR08JdW7Cp2yIv0F
	YKmODF3jEWzEqIdWXo7pNKM1ii3WJO41bs3IEp+hVJNYEut7GjElRQOEqWXa07oYBQuhgypBO6q
	uzjwIKiSWyhzlCrmpJlFxGZp5Ush2CgQpo2Xo05l8NI4JuyevAoBBe3yBk33xsUpaXC3WLf4mwA
	zh+1EV1hIsNpdl1Pon70soT3D62FdGFqzPNySZSS4Hnx2waD1qZd8XCpdJwf3FuhuCFw3bRLF5Q
	SN8IXPnI0BuO9LkN/VRzh1cqSpZiNmMX+zpvQpKT1Ee69cqzFvveBZMj761e6XrnhwHkbMQ3Fk1
	uJK71/8d22v+nupOYLWT8smxZxxOUwNyCjw7AC34AFg==
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1450924eec.12.1790243681132;
        Thu, 24 Sep 2026 02:54:41 -0700 (PDT)
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1450900eec.12.1790243680436;
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm12706547eec.15.2026.09.24.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:54:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <arTzWkL9kTaESj9s@QCOM-aGQu4IUr3Y>
References: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: gFzbDgfucdjXtnBQE2gwP0XgWYR-ixaU
X-Proofpoint-ORIG-GUID: gFzbDgfucdjXtnBQE2gwP0XgWYR-ixaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX/3H2tY9+S/Bn
 wTuzqKIrvOt/HWrZ/ImAtaYSjuCbgNjWCQappCNaUQXrzRqKhmBQKl5JJXOmz0lYy7hm6Pe//LK
 pTdUz9HjTBVfQqsV1YXBR7DBjjjs87cBw7C8Rok80va5yCdEatLfmzeiryE3DS/j+0Uokx8wg5T
 VUTNsumY2784TFLvqKwP561yjjdNylcAbFrJ2RvYVpeFPwoRWd6eV4hFxxqiXXEjVAHIgUI0vo2
 b5GV/Ce88oXii5RiMGGVZvatP7Uuv56bHr8qPJyr3+/YdSUWzTxTvFUDbvOb2xwwIajbqw5TzTq
 MAX3F1w1aOY4TK2rCEMhglufjxG+Mim1JWMtN4+emTZ0WDjH+/KiaZm+I1jwGJCGYLFLPNb5HCT
 xjqlyGP/4V1Fdo6t38T/6JLmLEW7R92HppKk8KyRz+PDQj77itQNaYmjnYyJzogJwNNHvpa+GlI
 rzoYVWktWQixB9jwnWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX4dItcGN7AtB9
 fXzMCmZgneBcDz/BecV/afCAhn99I3fJD+tk+m/lIO8klwFqbpfEexURXq0SyzkrqJMaoQEWnVv
 QeKg15xr4Z7u23dwQv286c5rw32kMB8=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4f362 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5bXfVmoitGlP2aKi_t0A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240041

On Thu, Sep 24, 2026 at 04:48:05PM +0800, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Oops! The nord-embedded.dtsi changes got lost. Will fix in v3.

Shawn

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
