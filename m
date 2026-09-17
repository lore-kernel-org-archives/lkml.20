Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F64A8434
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637142; cv=none; b=D5jh5RHjBeIRytQCinjH0foG7Pc5Pl6ZRZE0uyA53E4TAGIJSe8cnSZ937twYaf0MddfDqoHBMkcFGyoWn4rtef6DxX3BsE42o0HtrP5Xf+XNo929mgqC10/AZ9Py75AdYrdWt9E12gR3ro3xerc2QnT0PT1EBNzEWZnnhqvMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637142; c=relaxed/simple;
	bh=wImfqcMzA2hutdV05gMXWCl9C8YAeHAtDEmm3ZgYq3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HybaZg3x+RNe4M2HAV/UzeJeLM9gw8YUd2BV/sl0AcVqfRHpNYLKfv1mg3MAOVefwe5cJbmCSSycwepZjH/wSrrcczLkXBeXaPw6Q4zuROV4Y+Hrj0VwVK0VUYmjgivhrKBk9lwGvgSb3UVzjwr+g1KD/3QUFDJ/Lo2eDWnVYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGTIZaW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGl4TuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGTIZaW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGl4TuS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60sQQ1031543
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=; b=MGTIZaW4ENReRMGz
	JfeWV7Ui92RrfyLqfNhCV83iFmUM9jq44MvA5pZ4wpOREoKyAQVUUoQjPyRYDVLo
	rZ0+AfsnxlOvk7w7Cll0TQrgkjQsysSWWGfqqGh6lJvN+XrglAGl1lhEc4TCjWDh
	B9kb6+JG9jTa0aNrGymM4mRTV+KgZKNx96pvK2MK/eZaM6pb/C0buw2lCj1ayCX+
	dNHv4ya5PCHXrJ7Yss+Xj02VbPRtZEqVX33taoHi5iPT1/AnNWTkBmQ2Yt+5m6yi
	wo+gqVgN9/+sU30n2iOAt7elaoFGfYFNIR7SlxLj6QjTbh6xqghMv27JDlq8G3hk
	Bg2H6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hbgwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:25:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so24493585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637137; x=1790241937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=BPGl4TuSm1k1xwdhTXVybM3J4Zhq8h1ADqje01j6gai3K5VDflOXMFMpi6TVO+NGBq
         MwtbRxcpvvm2COzm7lPF8ZSGqCHBy4uEfzJl4HwXZOzQsHoBHglrC/aYpAGgMgJVs2lR
         1hcX4BLrVMvOAE41DS4mXbU/+gX9Ca1wseUgPMAfl6lecLrO4PC+eyXhpOVY6LLfdBQ+
         /TO1hEa4a8UNRS0o47bTSvYidnC28eolG6A5rtyDfFi0Ha4qoxC03gsbR+C+u36G1K6+
         Y1HUCrV/cnEHPumgNsecDBYIiuSoyGEJDgDncIXZ5eXzIZuFJb01JyHvT3NYE/pTog4j
         XWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637137; x=1790241937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=wANo0xUGKNQKBTUdOfTSwIzAI3iXdyV3jV29nHlFPnZBOeQ34ijaYm1VUW8MjtJEz7
         1Y4UNpXd4Sd6/E5W6ZCUWYVo4V/Nh1VCXj9RdGGMMg/37W14797GRGD/0fJdg22eveNv
         vPx/e0epTQhrM2icSn+RxavdOJf5gOlLxGcJ4MKMv5BC7CRy+Qw1rfq57IOKVLmuZyw4
         htaGn//pJNSJ7xx5xcsec2CaO1wekB56a46IxAi64DqAy3GZI+eHkVG0w1Bj4AZFMmw0
         gS+E230TVL/jXXk6XP+6HsLq7jvxwrd0/IcpH8PCg0B9O/q+m4Qaqpc3OSigDhodnPrJ
         GHRg==
X-Forwarded-Encrypted: i=1; AKwUvBw/OgGlmPhSgf2HlakmWGhCkRuCOI3FceJCU/UgGD8i3tXqOcWZKma2PJKILGq6HiM/lfOBE/cmEsIVrxw=@vger.kernel.org
X-Gm-Message-State: AFuF++mp2gPkRL31EVpvsPr5JyML8AT7SQe5sWBHxsYtaU/4qAKTty0Y
	348RprduDrsKSEi2zaIgan/oLdSoT7LfUQ91ljBdLPqymK5GwxtaxsolidVOBlCJ4KiRbcHco49
	D8G7LChyx7air8i+XHbB1QrbclnWW2dV2n/mchZGbUfKK+RdWsfoT9Wozs8Nvd57XNyE=
X-Gm-Gg: AYBFou2EAUhJG6yZWzHj/aeEdxkF+L372VV6kZ4wMaO/JxgEs4TV/6Eb4jLD+IjFgQt
	wWXt0t4mwJ4hWCL7ibyvlfeoy30kdvjAMibw7wynULZh1meSnSlCWibSWy1jTP/bLdifeCIk/HN
	EOTD0LhxmutWRXn/iaYOGgKim9IFxqn6PVnxx/YukkvGbKdNqLrYFvMCH81k0OcrSb4zdsZQTbJ
	UD1rEZe4Oh3+a+lH2/2TkfR1I18U4+3Mqkr5jlv4n6qKRPNgQT/0tDdnqD9H11+3DJkkw0eDZIs
	HqMM00KDUpJ0QaPNAFQv33FJ2HpOY7iuBX9ukVXEKUQAI6l2h3RfrrUGt04mi98hOat9ECwe+M5
	sJ1sBTuNKB+lddRdZ0Z59RQ==
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24675385a.4.1789637137471;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24672985a.4.1789637137049;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4879f1sm268554966b.32.2026.09.17.02.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:25:35 -0700 (PDT)
Message-ID: <848a64de-c120-4f61-be03-181d4df92ad6@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfXxz+CjFIJoiBN
 Bidbuti99tzKYqcBiMxSBBxRQh/+hbj8IpI9C3IGnN40QUXQAkVizPgFHYEH1e+SynObsTqWk3k
 F5fJr29CpdvVSSzCMUZEHNivBc8GSBy+EpshVmtx2imoiGjPIMc+Iry92tKepViGhxChRhpX5pb
 70aBudHmFjFAL6nQsMWRKBV4+vO/mi/fGNSxYriWp4yPBaKaXVuRQXnPFI05ZaAS0CIGjld/mXH
 UXSgZ+Vt9ADN9P6AxV32qT+/2EsboSf/+jnLZvvREvGuVL1mbNXICS6DkjILD3O+1mHa87UHpak
 ISS9ZV2m4/g/AAFvVEmnXoQ7syG7TKLe1USiKFT0430Lv5TnNIpQXUnJqIdzwBGIiqo/+ZDly5L
 owHvphC5wpXzqjozHOHWZnB3fNvbFaWHHjuwO8qvTcRQPdgPc4P8Z8KzPfss9jo/LQbjXvc0MCy
 P4P8S58aQEVMvfjYcmw==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabb212 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=aHkRhLIturER-sMqCjoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ZtHR3kV8d07cKWaNBKAGT2_w_TRkUCTh
X-Proofpoint-ORIG-GUID: ZtHR3kV8d07cKWaNBKAGT2_w_TRkUCTh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfX+YiMyijhpyrT
 f5YxE6PDYGB1p3u9OkYkLm6ipfPuEfevpfcOxxaPy75i0s704JJRj5kh+/cGMk4O8wr0EmymYDf
 ecIXkQpxB3LEEjMNyAskJ3QwnvpXHiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170129

On 9/14/26 4:37 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	aw8695_int_default: aw8695-int-default-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	aw8695_reset_default: aw8695-reset-default-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;

Shouldn't this be a pull-up if the reset is active-low?

Konrad
