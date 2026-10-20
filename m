Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501609;
	b=BY3HSVhoN/Do58KWjLpe3O3nvG6Y7Sb6gl8AiG9YIxSPG42XyWVeZnXeT3q0UxddNA3C
	 y6L8kbNzlUCvib3iG3MlifoZB+Atyvl6CBb+EuBFFx0kAvJcBniOjQ5QLSBXKNCb50UXh
	 R43j6t0Rlz8b4hqFIhHNpryvh+S4Qx3hG70n511a3/ggzeEDz4XQbTkOh9yqzHQLcHRKj
	 42at5Wi2dfrKTzMDMs6NMHpEdGxegK1NwfZKJSUFjF2EUNLjBVKyJ5DpT6Ny5ZY9GdgZU
	 FjisyaKkLytfMOwwHCocjQAq9zvO4y5D7Ao0kA15UU9hYLfyR38lUrJQfptbP74pIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
	b=OLW39YC5lQ0bYF84P6ENZB9jz8TEKwKx8EDGUV60j10ZSdtguvFVsbhd62naQsDtzxuI
	 fSzoBi+9UXvosdFgkPERAjIGwWqFsQwHhHK/8wJ35FBZ077dQ16Z0tshs7MU20BFIBCx+
	 bmr4IsDV1G1Z/4GQv7O0HBU5giSrXmZBb5SVXa+Ge1TpzNXa1lzAJmUBUozeMqr11joUn
	 BdzVBhHqEZopC85OlZwpNeMcmGNtA49RuTDM0nb4wLE99QYpmexnzo5vIJJFgM5NEvOAu
	 iwbYnnjHY84Ph/kosEDGhZBz15j13c2vXWGMMZv0dtd4U8aldyROtgxBF0kxJCeVobA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2903606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2903606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx2jr599709
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P8PnBpQSPjgMpKEa3DFhjRcb
	ocMPaeiZQ804/GTvmxM=; b=XbiecpSWGqbeXCC5HGb7RQpHgodCzVBZBjh0Un3f
	dKKMUM4ZgEkkJUxi7rSlgZyaHTAZzZsD8IoR2MfNIr8AsROurWJ2esbN97gFvUvp
	b8Ys9jwsj4/XodGQliBRRIQoOVJdAbhzcAsBMKntNYcFx6BtWuB3JLPrFY8X8wpa
	+UdI8F4paFUkt3xfu18a9cvUyvMIZHXHi1Kdfv5DeS3qFlVII3dSDHjTcg5NPsj2
	5A2KSbmpgPiLnmH803RHdLQr9R5ETRyQOzC0X3RYCNNgGFOqrUHpmbjQQng4c6XJ
	6USPdznDLRClNUSwfBqDubzAKOieFqoFT0o346uZ6gz9Ew==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2j8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990835cec5aso468845241.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501607; x=1793106407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=TuTE6YrRijRIxnGGV2rSFfP5CAx3neopC/0Md7ZyIMW7kO4OtOjFcbqWBSGhhLlAeO
         K0IAtnD2CGS1lz4gMxlb+yPtlRFEfo/yduTsiiSPyixyickIk0KCQ6pZLv9TZv8RPzAM
         NbCukuYxlnxP3f5iJF4AmM9mUSDdgU0VMfZRxiK08rw1R+e5dw8a/I5rnnEUEZabtInB
         J8dhHGWPbNBGVC87zztu9OMNrZtgB4GcgqUUtTlamtUS1O+myl3PlbGdzvNsnqqdpi6G
         m6G4N3bmRgxc3dzfOCk90tSTxIGZvoi3dvOAgHuSOtCYSTcysbNFuk7nMnPQ9b8PV08y
         qV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501607; x=1793106407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=hDjWk7iy8ERTnaIBYsFXiei/U8yqXuvDFGgG0bqFo+CFC/nGExJjWVAf2u3dnInQ2o
         25Of0adxzaWBa4fjID7YAjb80OR9w16I9Z/U4WDYiivMSzoKpHRphUEDIhdliG1A9wOZ
         8YCz7jdJNcG6eot0yF520hvSbpyqkP1QtQmqelkru6K64DFNT593X/JoYeu0zTipijmt
         so2znSYcBr8tJoZaQkWVnb9YoxyhiPAKvTW0A4rPGFjg43QOwo7lKE1RJCPUu+x32v/D
         fWZ/H2TLPDYVF584ZO/qwadPX8BTd0lceiHH7JxrKQotDmtpxhploUHpmh7yfw+vlkf6
         nXXA==
X-Forwarded-Encrypted: i=1; AKwUvByp4W1gk3h9DzYrR8EXfBGwyuhNHHuqIs27fJ95KV8zgX4/jvbFrzis5JERAZlaW0HPqRfXXe3LhfLR1kw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/tpDsfngPPmSAi7knY7Q64VnKF7FBimtH8QhJmIzRmSpehwQv
	niENMuTCxI7siCH+vYk1k18PAmbA1N0ZujuBHazc9RjshcmCTA2D+Tn/idpmQ0i2epXXpSCCbI+
	vGSWaReM6RBDoMT4fxf+ihzaOmsanh3sWIh71603+gAQA3GBCSGIrZpxGnsgg909UXx8=
X-Gm-Gg: AYBFou3lpVnnHHm+Q1YOJctQ7DIe5aHIfzbUc5lV7kHYvyiqibHYmcp8Sh0NMlzbhCV
	CJByndmJxEZQK1nnQc0vKVha0AQ//jqS+d9aTfKdD/PtagKUIQEMA692O5bV1JFGaDaTeOWGT+Y
	IW8X51Sfsdksl7vdgB2+xcSacIubTKsH7VHV94Nzir9aG1U16R3D+Mst0Q52OSpCbrLzy6QXyAF
	/TnX8ptPNdBdHCpzmmUmIliJPZe3kc/HdGMvTPoTri6GlTGfaTvbWhhfDd27ZrxpkhPHIdH/5Ip
	QTUVHnillIEuiid2SlvHNo3mrls5xoNsXPheYPYZ6c2QGunaW1NPrdrHCPWUcjCe5w5Q5sxVD73
	R2g39cvD5wBOd7+Ze
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360817137.38.1792501606817;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360809137.38.1792501606247;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm6527902f8f.36.2026.10.20.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:45 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Use ICC tag defines
Message-ID: <w6wsx2id3nfr74dy5xuvcml6hnwrjx3mrhwk3zgn7lco5f4prk@p24kgufpr42p>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad76767 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=F3kk8pQfqi94-d1tg5UA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX65ktdvek1bG8
 pmmtG0wahyyjqnTL5sDsBAgoskXymH5zIatK94Fb47B63NIDA1qwaplsidY7qep2YQpgCrV48Li
 pwymEtArdfdmBHpu3Eqm8TgIO5ojkNE=
X-Proofpoint-GUID: Fsml-JtZu00220I1I8JRCrRqqxwkfduA
X-Proofpoint-ORIG-GUID: Fsml-JtZu00220I1I8JRCrRqqxwkfduA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX3o/xhDy8L07c
 Fol9dmke8xVoYQfylKciRuSBv3otK4MBzM5qx2VUp6jYUO+qGMsh8h3tJfAG0ENmyO0yJbXCf3C
 fTIP6+9fPgSl3F/OYvwc0kU5jF4u+rqPqV5FhMKixUrajCzP//3LT+Jpk2xj36YPpGWbB0F9QqL
 rLp6oB6iBuCjxD+ctNw8eqdfyut4W0U1kSgQxJNOMPHFx8Nv1tVbzGMQdHl+Z3nBn1EX/OL963F
 6LZ38GG0zt8BcbIqKfbrWJJWCK3o8Y6zFO7kIr1XdeIFOXMQtGAF3euWhA3nMrisX7Mx4Cis1Xy
 ZbTPwduyCZy1ATY91tjXe3BS+ztNtl5e+OR2gx7uvaGlqxEoxjTwl+FnL/CqvvVWWv4HmnHmtkx
 IUN30nRwRNEtxifF64wl6yjVIMgKTsLFzJfTpwvJ4pFJOwXcgK4MbqAk8kO9h3bGToq8IdYlw7I
 U1ya5obVK3lXhphxJpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:06, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
