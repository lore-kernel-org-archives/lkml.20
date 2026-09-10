Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B73D333F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028271; cv=none; b=P62sdMe3qQyvJWFzMF7lbnD6EOfIxbkLacNeoP1AbcY2wZFIvrzTDwdO3NSqsFDgCfl50mTAKrRPwDmsAZ7t29iYXz5W2kfhZ1tb5A9Qkdk59k3Oh1vO4i3V4wAPTHrHnLrUJWh6fgMzDcd7TnC5u5oKRsqK5ySbWxSvslbUXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028271; c=relaxed/simple;
	bh=PAqcHXy8LZXAS6z3iAsn07s1vKnAVd/2G6kkS2rSYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHkrCp4QJER64zQIueArAIX4e7uyyF6o0Q9uafLp2EXgPOro+6Ajr2eKi7J62fLxyPAQtfasqpeyDQf9cx8lDXqAIGxPPizsJsX47FZUhvayb1rpJ9lyWsbL9xI7jgsPxeqFO3SQl/K9x81LVK2CYaOO1kgv/8ME2o5pmHhmHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8gWiCW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0UwHL/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8gWiCW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0UwHL/D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gx5D4142698
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5AEaRW4+Q+4g0E3CSuLIXhC
	YjcEmOyKhDjUtjMfI/o=; b=m8gWiCW/244l48na8aW2DVd+CEhL+jS12sUq5UU9
	00s48fgPxh+/ghXT/IqYQjaAwvE7myfYikUraIQVkBoTqxC1WoLwd25DSjDrp1bY
	NpU6F5ZqwFhXiI4KhwVVyRuLSokyos+Eezh9ButWZ2HyPRtaMr7j6i6Siudi0+Vh
	+tzfWH2THZ81xKfaoazS3lI5CiE9MxOW0ZQkxR/3SzYNX0OWjazx94WwQzDKlvxe
	K5ZnAF9WcIIc6ovwt2nRX9a5ymQSC0LKaZfgm2S5CNvQ2H4wXKrmsr7SV08fQCdG
	hXlkp4qs76clZcaJueJn/1GMpTqbWOYYi2j0Q1l0ME6TRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2sj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1350779885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028265; x=1789633065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=L0UwHL/D49jwbq5b3pNdQR6BGrr8+/5mbnAkafklr61jyAhdwtuuzfux8SsBc8YHwM
         aJlAO+kaN5NysW0ZAHdT55u5icEHPxh/XvfnOI4K2xNEKy8u5GrYnKWw3hk9RU8pOpni
         DeDXYTWVFuTPFUUv4bLbbIZoh+b41CDXSCN3XC7gQrDGc5tSK0A+4UqtbdtYWHwsLqxM
         YomlZ8F2Uglt02qtQnSHb3yf4WNEuV8VD7kQnmK67DX4UqkIio2rQC35cn0xTB6N16s+
         lMaQFeDIZsYWV3oEFL+WBC3HmJQAGjQVmxkS0BOsDfD8Bp5vmJEQ2ilT/Z6YPzQ53f0Q
         /PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028265; x=1789633065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=SLnLLU0GZ0IH9Gm8f0fEvBi5bpsu0qGx16NWVy/lY/BbqqMVjvtr0FmS0/N4j8237B
         slOvVlf19DWhhHgYb8Z9D+EJW4rEL2Dfd/lQ1P3VmfsWD6fXFNnp+cS4W/KP6WINDXAk
         xRt32TGNbyjcM5lBd2Kg39/58G6qNgIu9qtUXSDwxY+0UcDPsUTsP3Q7f/ElgByHIbga
         lji+cQsMPO0hVdB0TjDKMKbvhZr9iHEl2mV9WBJqEUZ8NFJfqfhLcxxXeC1Z6NGN3G7A
         Hb/Wtahqk80jpp8P+MOZmwR5CHodepjq+glnu7DpUFaJqkBF2rRGqpYFD7kN8PIhnKXq
         +TWA==
X-Forwarded-Encrypted: i=1; AKwUvBxfpwcFxL3POs1ufchpFLuKtA/e4deMDYPOj5RxKxG4aJK4eMW5DLz01p0mNGjj9vgGRAWCorQq6G6kDvk=@vger.kernel.org
X-Gm-Message-State: AFuF++l53+vEY5z/lohtx9aVXCZWZT3mbyibZu2AbT/jPHzDaB7vI8as
	hBddEsUNM5IMj9u5ZwaL2go2iPLxD6g1W/rMHRMGXsJV5N1O/480SAcCuR1KiYcrkLWY72tC6Lc
	VsfT0yGGSb2xirnn3NibhL4PWL92UaAVhCyySpA8WD+YAC0Ldrb7SY6pKtxA2PrflbQc=
X-Gm-Gg: AYBFou3bNBLoDUsvViSxDvK7WRZgao0tJuhoMm2bzeJxwJW9Z8KRf1s8gQF4Z9H2ei7
	7aSTx1xNSqVmhGO1auLMbogcyIf4nBqFDSzatqdqYSooFCcyNhJSav6Va2ZHvFmvV3PD+yT0XtL
	/ba4lq1DuYc7+827wepOf6Pz8dvp4JQlqlE5RYUa3feHCuU9hv6YQzjG3vwvvJmFJJ/VfeJUAPv
	9uiEfONgVpfo4gSmhqWmEzLLMTM4RHe6Ya7CoVu6zbAHAq/yeK9iaMTsaiouW6adRzym3n4FZ5P
	JBBjZQwNNRZi4JwVunoOGQ8sKcy5C5OI+1CWjQMcCO4E51mXSIhtv8lENnk4kSrJSwYw+peeaW0
	T037yR3z+QFC5
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371900585a.2.1789028265241;
        Thu, 10 Sep 2026 01:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371896185a.2.1789028264730;
        Thu, 10 Sep 2026 01:17:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm52018039f8f.4.2026.09.10.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:17:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the
 mic sample rate
Message-ID: <iavjnu7emwyxrw2ozzuwa4uvk74to3fwi4janpijkrpg4x6g3t@ftzeyvnok4d2>
References: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
X-Proofpoint-GUID: Re2KQgsohBEwYNAAWTPzH3BOBN4wJBqa
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa267aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uZU3vtNHNVMDsrlGVi8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Re2KQgsohBEwYNAAWTPzH3BOBN4wJBqa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfXxqcg5tnftOkt
 Hq931xG59vTVyoK9YAZavks/G/+a6g5ky7rdjo1UbDJWq+niewmD4NAQP+mo7s+kkFvUvykNTpQ
 beovqQN6/snrPYnkQzxNp6XRcQxQcAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfX6acbwsFweLry
 dKsELCITrfKo2/dwMlK/vTJNvR9LNzgGlbeijn8ME82b5fc9gczMegXbMfzvyAYydrXizR3DitF
 3EzqXj7dStbCFg20CXN9i2OM5v2EunThK7enElULXCpfVCcnIAF+J9Rq+21SmZyfo4CXqlNS0Rk
 1lu6ZoEPLk8fFfJ6Gs6ffJnu7H70YGH7jeBrHwQPDh50JC7IrLMK8eF+O9S4m8c99LmzDoG5FqE
 RGArJ90dny9oTZZzhtaeRHfg+FABAKdUT8fvJU3Wgy4n9uGvOSmZKT/sCHniLXvEzC2L3v3xDx9
 7V/9qAEkJMjrRJ7VsBz2kb9QZtb/6eYXmFWv7G1/EGH4r7W7BMTvx0hEmpan0SgY5qOCLtV0hpI
 CqTQriomx5mZSQLA2O0kugVupzO1o23EKQeX+9mc36J+Sg6lwgoVEztP8AopyDg9W9dyXf6ulQ0
 HVXL91KP1PjM7VruXVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100092

On 26-09-10 10:15:42, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the correct value for the hardware, matching the readout from
> Windows during audio recording.
> 
> The microphone seems to work fine either way.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
