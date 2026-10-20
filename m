Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483411;
	b=RjwgE79hSmC0pwHq1pH/H620wJWvjCT2QAxVcgrymD9zMvFBKG6bdRsa1EHnqzBsQ7R3
	 IQtvSSYn49bvIUTS2EesU63SeT43liRRJ7Ik645P03wKr9UMMJth85HGvm7ZIv/CQUZGx
	 n51ZfIWepCWGAf7PmZbkPj2eQPb8yzozKaWihwiqcz2JAW6qaJKdBlUYQ2u0oaXrZ/f75
	 D9vY3auJfubYeT9ove+MfnTYpjNbW63TKz7PdkDpZW9T75nEhQnOk4uMBeIKZgbLhngMR
	 TnXd+Ky2GgyRct/M/vcvfK38KZlOw/CHKzPTHq/rUoCiU+jmbo0LgrMg1RDlBJcxpFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
	b=azfT1by3Rd8M6FC+nhrAxrqtS7NNUNnc4Ypa5CvezHx4EoMhMmcW8dC4V0eVSgXzRSsu
	 /Ke+t82ZHdmTYOIpguC7TzFYvUWQ80zameI699jvuJeu+FoIZj7GAEciMScQfKG14u830
	 E7TKo+lTQ6iB2yKqlWVSvkB/a+M4e+VJinFN6nTaD8q8byVw8xYGGwOScCvFlNkMjkQrm
	 U+y+68s3SrLfjXqCyyvj2cHvI/hmOMs1CBpzuqKeU/RTQc7peA6dBg4hP9SLfqLZr5wA7
	 vrm6JvcjziSKDNWIfLJGXwuJB29QFkHWkN8YHJvBBYjYVdvKdWr+YThavvmRE7uFmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO86+gJU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A965606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A965606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO86+gJU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7mcR21595758
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=; b=AwIW49qSYs4fGCDL
	VwFeNJDN7IHzBkHSnFSTpR8xzs+O9CbaFMAA6TXvDlQxZZ+5VrutOEkGYwc09Yi+
	ynaGEduK5MdNSy6n44A68TTi5B4TTaVVrs1n1AyBlx0z95x2z+IYVdo5PFQY4pp3
	wvPwf9tC6NpfcbVjId4CC+TV9IPERa3TeoD3ZNgyaDf7Pwx94LoEUZ5AI0Aux8bg
	wWNla66lhwhxS/kc0mBuE7tLF8qPeMr2EiG1WRXTfTq56NcKD+j6T3JfJYBToBKK
	b9lzH6uVC7Pp5cjxt6uRAps7kBC5mxQqFQZh3Lajh7VRGLzmikUPwI1NiXXgzjri
	z3/3SQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phhta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:03:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso5058381cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483409; x=1793088209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=YO86+gJU+to7GUZLjzW/UqfInXi3I7Oxr8dYsgt8QfWTdQNX++WsKv7y8HC3bTv93N
         wUl1D2ZOfjxkgRJkYoSNp2ShA7dcr5IE/ROuzKzftH4+yM0cIF8bfGjexao3fXThopNt
         d/OpGLxk2L7ZvbAOh+3t3+V4zoZZu2T4VjLj1FY7ZgEsLQEOCe/8Ttaqhq91HmJOcuNb
         xnNe6BHjRloCVxMSE7hm0L9jx2ETO+CNvo5nsyDNmUBdyYNypJ8+rHTA9Z6nn96ctqjF
         /zBdvc/8VIM5feZYw7YdtjfZzfcPMgEhNJwmGDxIfMQo0UlfKbyFI+xKyiGek0Ep9mAC
         dfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483409; x=1793088209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=MpMdcb35ZC9sRDFZQtMpTvwl4Xj0rBaftcvTcQ5ieypyUluBeALUudKFarYoqG15Uw
         ifAZxWwSQjuo2plJpkTIm5Yn9QWIJCneCnEHpIbQNvqDBN1ZJ8ES04kVhvqOO5ea1DdY
         v/qfBOvDMyQozOKo6eBAQQeNojz/lzuy7oE6eZsM26DBA5LOGVNZoiwINB+vX1ui+158
         0Dz5dq3JGOprYM+F+hIhMhRiIlmL9k5hdi75yZfwnzsByPUskNPRm0Ti6JhOWmpSsGC7
         y1ixjGJL0dm9Lg7Zn0RSHbyfDP06GSATUyuPezBX8cS6XSAYTaYxEwec0uLPYMz3TnRV
         q7DA==
X-Forwarded-Encrypted: i=1; AKwUvBwN0bJie+3oRqspVAov2bG4jJqVAlxsN6l+UdvlMqFYK6J0uGOS5qNL3LKdrUwD9QXmIFS12L+aRsFh1EM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwyn+Yr4bVmErkaSpOdZCso7C99ty1CbwrSq36GDW2drGajDdw
	No79oHzIksmvEB95V2hvUt+ilPP5npbuVg4jZamCTXjnqa5FBKRArF5n8vomG5+BpenQbZhLCev
	1cdr32wXUGOThW7/eXQInGG2R7lisgrHhIuUDsFPkBle+ucHrwJWzoDou2Q4S9940ApE=
X-Gm-Gg: AYBFou1xz21zt42dNQAF6LbmkMX4TJ1IqRDMFJ9X53MN8LeQjSGD8eobgXwrWA/MbEq
	+mkKuxYc3fRAj9EpZLIND2MN+HIz+CWFfNVu1CErUegN2yEjgNxJObAmjbik8v3QXfdY5XwAboF
	EsaQsGZq1XRokCQCHKsC0tDWP/3fUANin4Df8QBD5Fb6hXJu0vUcGDTD4jJg5ZrAqjQZIPJoAKj
	2UQ7dlz0fuShb0KRpiHXlvyOOlehgTl8cLhsmsW46oXmhvTsu6yNPYcuZ8O3MnFFDhPVdMOrvpq
	d8YrJG6Ky+Crh/XA5Qrx+EFM0sAFIT4/1wqCPvq/vLT7kGRExtLw1f+ZrVd43aMIrs02Mc57OYQ
	EV0h2c5COIjIkCfTa8CXksA==
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180282391cf.0.1792483408828;
        Tue, 20 Oct 2026 01:03:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281231cf.0.1792483407204;
        Tue, 20 Oct 2026 01:03:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm460634166b.61.2026.10.20.01.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:03:26 -0700 (PDT)
Message-ID: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:03:24 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad72051 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nmv2DHgxKDD6GQ1_MrcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9V66q4v2BR91hzZf9BA0Eh8vLDXZK8bs
X-Proofpoint-GUID: 9V66q4v2BR91hzZf9BA0Eh8vLDXZK8bs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfXykCvDYRWq4h4
 1vq9CRUmZHFcg1tGgudxhxDK6af2JykVXGF+Y9lyeUP7J9ptoCVEAIZr7NufX21e3bwB8LdQDQM
 VEJniml8wf966USt3XIBVFK3frOOfMp66J5TPANTYZCRw0sCa/N5ZX/X5WgFpdP/DoM8WHFxBCn
 3etGVNRUSaJw55tLYxn19cZbYXA+8TPcDh3rCgSG6mmQ9+kgNl431OXEp5PL9477aA64cvGXHZC
 KjjlhMevVAaiPlZLhD+S8OakdpH4DDIMraFfnr1SkTcenRNQKm6YVtGvWGhFAVSWZwxgqNnX7Nd
 9OLNHz7ueTZieZwxZiG4DjKD8h7ctF3g38sWoiCp79vaYbERcwLHFODHZyF64TyevBz8RkiP/7l
 Ty+CgUQ0sslC7WsYsCAdMWOILc9iBZkGeNWDrjWs13dNezxcWz4RizKfHwpGU4LLwPwpvxYHjH9
 BvBVy9ek9WJbkrL8Seg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX104K3Z89IaP4
 39U7eRRIoQiSGN++MFGokc009rkUcSk6Yl/5SjJT6H7E+Sz2OKRcMtQ7VKRmAHYTwf/f6RvxSnA
 PGX2mTrPb5KfD5+WulKh+WVU/BrL5DA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 9/28/26 8:36 AM, Anvesh Jain P wrote:
> Add support for back cover, keyboard, and SoC thermal zones through
> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e27c697e3170..571c98124a40 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -594,10 +594,12 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	embedded-controller@76 {
> +	ec: embedded-controller@76 {

"ec" is a super short label, perhaps let's spell out
embedded_controller

[...]

> +&thermal_zones {
> +	ec-back-cover {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 2>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

This is *really* hot!

> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	ec-keyboard {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 1>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

Likewise

Konrad
