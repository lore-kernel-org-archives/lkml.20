Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7D9483BF8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780814; cv=none; b=mDJyhBuZZnh+v8k5mx1WgAGGUmFuGCW2YLnXfOiLvVs9zOKdsFdG2SplFmRtTyg/2LZnFQ/5BtGjf/Fr4SZIfXyqon/orYyfTwmkT7gJRHvuBUS6xWrU+i0/f7FqLQnkM00YInJLzE2V2qQ4KMp58AdZhb+LeuKmZvSwggGevRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780814; c=relaxed/simple;
	bh=rZh4no+oFdPPXPsq8sVxETGHIYaHBugYPenGQTICKAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bU9DZsTiTQBWkd+SPIrk+RvK5Pf+G6olNkD3uuvH4leipWSMnujn0cX9FszYnau+2CXKs/rcQuR0Gu2EwG65mdOUSB1fCef38EbggegrNvib0mS4gt94f5+HB+XYxKUWOKGYtEdvmKklCy8soezt/k2H6GrCE8XEaHmaDiD3HII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUC/FrDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm0qTVvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUC/FrDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm0qTVvO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnG9W004222
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U462SUlZWjSB02RxjateNW4W
	PG4RjfYVxegug+fdJyk=; b=IUC/FrDE3+3dnqQhNKDr4C3sUUpvA+rwJKGegMtp
	9vt48/UTUStMXW7Z2i82RnRqf5FWcxlhIN/6xBbyQxUGASZVo3q2ugRqcbZlOki0
	skC+YHsz8wTPMzFA5nYsmi6CvReNWCSN9iBW9gf8DcK2zjNOBJV5SlXYhCsHdroo
	GyT9ohdhDY1wlyYJRdmsyt0dJNip5LJ8zAvaWmpp9IpJf8RdfJ82sxvVcAMaxwxX
	66EcW9tAQzfPbAXmOonb7xVWJJMalhLb2xAoJ14OmFknTL6qhrxYj/1ZHHgaU1MA
	AOJODo0s+4LpUcXAJupoat4bmXHcniRpxOIQq+dvUYHSoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0sef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:33:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so4312572a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788780810; x=1789385610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U462SUlZWjSB02RxjateNW4WPG4RjfYVxegug+fdJyk=;
        b=Qm0qTVvO8eynBHl0W1U0i6naDINHg0mHhGeN9ZFuspiCKN7NU/li3xZ7oVQU9xfz+q
         y2ookh71lQxRZXJOUn+jmbbvAkKJjPohkqdZ+ngf0EkIbHCwPa/jz2lctRdBXQ0jvyGF
         6XkaVa8TqLebtpZVETd6ManWnm+JyYH4WRBE+j3TJsjO19PnPEzfT9rR/9ptM4+pBr7N
         U0tHvjkvWDmDL88yUgXA+pC6bxN02hn6mkRlVUdnqLU+ejVwd/Rhlm7EwWUhreBk91p+
         2Wh8O7mVX0nM5k3PFxK93UjX7L1uEG59CK+nruoKcKntTLDCY5onIPVIL4b0xDlWmY8K
         EvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780810; x=1789385610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U462SUlZWjSB02RxjateNW4WPG4RjfYVxegug+fdJyk=;
        b=nI0944rk1WD5Bwro0mPX79ZUNn+R08vMRuD1FgRTKETHdEZZ1E63qG9NnM5WE8Sah4
         EqK7UVDk4YNSsIOVC6SpLr9XmeB3wSWE6GE6nsu4yU7cKuNnYzA1yacTCjCte3HEo8oy
         iDEelZKkFZYE4aoZoWQ8CBfnvkRSCD7QIq5AZvXMAk3KfiogYoxrJQE+8OzCxlLAdrd8
         tpqkBkagfWt+RrCbN/ZOm+VsK1euo2VvYTmsOIEELKdqC5C1tyR66dZTYW7cYCPqBnjT
         2a4MM3fcqIJVEF3DhBJGRn0Cq1zYQlw5s6M8QGcuZdvBl0mdIp0xUskZwI6fhfFjmMRt
         aJug==
X-Forwarded-Encrypted: i=1; AKwUvBzz8mZQmi5KdDSAAqerxnoUzgrOQAKrdevaDHRwCOVleV5EXzlRQF8bWfS4Rxh4Vwfu/pP/aC/waUfbb78=@vger.kernel.org
X-Gm-Message-State: AFuF++n0HtvfKqWMDmeLZa2Lno0vAG1i8eycCTcbxXCVU6/+LLGRGgBZ
	vEoQqbZC5NpHGw456Dsf/lwLFzmKNFXnAZgJ1mjjfOpNA3Ncsb6IG0TSCxDiDWsmgze5ESqWyvC
	F7xP1F5sDs2B/tQxGIL1CW2GRkYy8fFsOOOUt7fknf1UbvXyAAFjXFxGIJZqOElZ0YDQ=
X-Gm-Gg: AYBFou01XntATyku3IJeZZCSobVho5QcH87QgcjEMC3nqHUwwh3LOi0+r3AwL+9mTXe
	3R3SJMC3uGSPJmf7jClBKIkjbOSTs6DvLX11S31vm+d33erPEWotbVt4SVhhvu1vu1h3a6H31yg
	exuZ6fYoMqbhw0zMWYzFB8QnHratjTBhtDx76WTRFKQsvyszX8UcBeVbsnRiZVoihIR6vCUV+IK
	mWZQtvAIPPI0OSK73XDdflG3CNFGb2fcALZoYvQo67cSHU4Esa11UpBAvi4B0HKttf6tg/dA1K4
	CZIY8OVJPlpPNSzC/HsuVf1/aq3OLP9eTN4N9a9NFrMkqVxMIAUN8WB22T42RjwjrjkHPmfXJ/b
	K/TCaKBo/blIwclWmjhk4QtVAXeMAqL4XLRiIZGtjl2k=
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr35276856a91.15.1788780809755;
        Mon, 07 Sep 2026 04:33:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr35276743a91.15.1788780809266;
        Mon, 07 Sep 2026 04:33:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14344a86512sm3773726c88.10.2026.09.07.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:33:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:33:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: qcom: Document Nord Ride
 Embedded board
Message-ID: <ap6hAhGcPlu5QuOn@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNyBTYWx0ZWRfX4nrpi8itPTKe
 qdKywJlUAm5UdqYp/yd5lBQwl3xWbQpx91zbwYMlVZ1ZSQBlWbQNqO4h2SM+ghFpIc7bstsXLRB
 oXqX/cEUWvMuMYzZLPl2D/iER7nvenZKQpmFneqhpTMM91SY6AfEEaDBIrAyGivFWxn/O2A6S1j
 1Q5eYJW943RQai0NuWZ1tqiP6aNMQ56tdg/A8bDonlvqImSUYc7N3pj7nmrz48rODH+KsRJItkE
 0rn4ZNosIMEsj43U1VkRg/FZnYCghZXEUNm9lGMiQjJt9SBvBq1hQezdjwjGwqRpxfBLeQscDqV
 YC/uCNNBMWPmOcEwT1MQoda//0s89i9ct6SeuPVvZe4oqs6Hjoh8+OK9Is5MC/yB9NI8COW9SHc
 cOOjn8E0+MruCvaTdqKEcXHvSmP6+6u9iiHNaBiv1Xx0N0tvqQDWfhPjVTigBinVBqLToIhwYCk
 fab7mbKyIw/hj/yrzBA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9ea10a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qpVXGJN02MuQuz-xvjgA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dklWJFkloMiy99rQg2LtkP3ryOVoSDDU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNyBTYWx0ZWRfX50Oc/AysOcMf
 esCqyi81P5uZrMSi/UZT9RHSNWv06fr3HOKSA/Xh+RmstRB02cP/zd71UMfNalc55bDcGWsp6yH
 X5ER0kQBBs5lDFV0QzT8gjZY/yohvS8=
X-Proofpoint-GUID: dklWJFkloMiy99rQg2LtkP3ryOVoSDDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070127

On Fri, Sep 04, 2026 at 04:16:18PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
> based on the Nord SoC. This is the Embedded variant of the automotive
> SA8797P Ride board.

My apologies! I said I will update the commit log per Krzysztof's
suggestion on v1, but I forgot. I will do if there is v3.

Shawn

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 0759969b8aa8..7efd837b0fe3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -407,6 +407,7 @@ properties:
>            - enum:
>                - qcom,iq10-rrd
>                - qcom,sa8797p-ride
> +              - qcom,sa8797p-ride-embedded
>            - const: qcom,nord
>  
>        - description: Qualcomm Technologies, Inc. Robotics RB1
> -- 
> 2.43.0
> 
