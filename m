Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7081724
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425443; cv=none; b=sLiCvWxr4LhUg+YqUPbRHU0sl6y0ZCllfhYxzZlORrPRLlts3k2GRPH4FnMU7GVLHFVbADBarN1F/PFp/JBOy5LZNhAFwT2ZrrMayu4OUbiGDwV7jl65L1+pcylon+PXghmGOKx/bop0Zl3bHlSZE+Uf3jHqa9HR4P9L3rcAA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425443; c=relaxed/simple;
	bh=yvRA6+RhpqKbBpG7vuhCaw8flA1Rlh5NgzfC5O25f+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCH0akgFzs8xUsQCDHJQh0Z9wnUDPlXQmBTxXwXa0AHVL5AY/kCCsIp/7aLAP99NY4gxQgEwIFW8G4xjZLTIJ2j6gvxgt+MR4oW3igJR+Q2HfAOX/q7Io62igUiDayIyAZhWxkeastgrCIIR3md9V1TeqAmJELijWTWR3PtzgUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nx9e6pA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iy+nnMKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nx9e6pA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iy+nnMKI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382Shh3549493
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=; b=Nx9e6pA5Lf9U0cjf
	02ESwiiizuR3tzGVYi1FxMJ3vSW7c95Z32Wk5jvxhM++h2xlKT8MciY8HqsDQS4D
	uMvbyvB5+dw1G2bDYO5w+q4u9cQL1tBh9muvPJV1WX2aGWL4MsyzIZqpnXKIvAFb
	Pd982xeucypNlYMW5fzturDSj5SAMzxPQbdUOch989M4XSuDqG8BMfaeVSqDIzOf
	VdVBldJvfPSPCexq77YCE/sNsIwh27y+SSM2xkoiNMN99287XZdekqgyRCMS/0ev
	ozxqPFgKmomtMxFp0q4vrGeby7S0pwLI4ST/IK/d7MkeJKCGq/iSubyOXWP4S+KX
	o3NvVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m06cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:50:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so51915185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425440; x=1789030240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=iy+nnMKIaJtuIP8+L4m1nGGawT3Vt2pOiuNCNXXCf/PVFgg0fha7s1E6kHsROFt+wl
         iWzCQxD+zn6950U+s0vM9/ZY78UuAYcAm6ICRTe0Zj51px3ZTPYGnuXLmwBanEiaD2g9
         gNEa4tE2xtG7GzxjmpibxuOa9Ml42yjUpi18pS87qqcasIt00JdE6Nle8UiV1Yx3Gy6e
         m8KixA/eDMS6wZoe9QMQnUygsmpNZcIzIsATnkkEeEcBXsr4hhlDo8YlERNc985pCR+N
         LZn7rBXFa5Z9f1XH7Kd9z5aZs5Uf3Jo5LRehy7KoUibkodEswVCUeftdxUEjguV5GsXS
         e9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425440; x=1789030240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=ZDCAh3I4Q4Cmzt6jc5uOrx6gppfxlRqWBst7NWZmEpEL2yv9w6MptroYkBS+G6DmNd
         14jwI6y5KMWQvpMUsDdqDp2UHhGFYAu+kOp1D8cx02dKBOWLqVB1Ih8I7OiMWwSApkm7
         eNJdH/LfV4zdobywzR1Zw3gOlrZ2bcTzNYCnAFIB6WNw0u6bEwHiBSOWkXO80ZBV8wM9
         dF2LHEu1UlF0jhRmRkUg4yCKMgXcXLB8xx+GxXBTz96VfBJAJ3bE+6yrvMWKoK7dJG1s
         4OVURXKlIh9tGLilprKfQM6EsWde7am9fZ6B09HJnROHbJG9knTM3jn23GsIi9dZDwYo
         oeeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV9gbmaqXMJH5madJ4oCWINwM8+TefOuNgPVNAHpsoR3C8BHpy7kjAGv3zIp0IBuWI6ztdjvX+LmHmjek=@vger.kernel.org
X-Gm-Message-State: AFuF++k55iMTArmVg8Iit6wqtCfdZmYp5Diqr74Wgtj2nDdgHHfJr6tz
	hobEZWa1P7OT4ymThIN/T+pXc0leMzIGiFbrXExiWPsRsG3XW7Ho2vhCEZ0ydmpHExx50F12qqF
	uVH2zTm05ID4sWkI5NMy/48Qr2J/DkrBNar3GTRoaQp9Tl+8rJt6ZvGPrO1iwa3D+ufo=
X-Gm-Gg: AYBFou1vV1d4O6vVn4aWppuuSu33EdBtlE0l7C5GRNMykWK4QaKIV44u86G9b/aU31v
	iT6gYiJMQTmdBc31JQry8DPotJ4U8EkS/cyfli+mVifF1+DA0yJm1VXOLv26k4O/vzr7JFEtsYA
	8fTP3JW3lzknjavG8OWBR/b4B2V5t5kmsDz8hAJiuptYRRCJDPmucGszv+Zbubk1lpuj6nsdqK0
	DarZnwnYocBU8wfq1QU4gu/N3R+lQSbEng8BFCAXjWvfrXr/0vfYWKW0pNsAF/98UXNQh6EL1DB
	kF/tdEJDqpJrWLu5Vcr0ChsoM4l7y2NS+FrIVwfU2UL8EukXkBtTdUiGqTcgAeuSYkF0MQ3+3n7
	kFpgrpsOTELZmgeos4ibMOA==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738065185a.6.1788425440578;
        Thu, 03 Sep 2026 01:50:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738043485a.6.1788425435305;
        Thu, 03 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm67614866b.17.2026.09.03.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <6ffd13db-1ca0-4497-9ad6-fdb65b001dbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: kaanapali: Add ADC support for
 Kaanapali boards
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: miXfdb04-UAUwXUeUMwsa6Ukaw5V5K1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfXx95wFNozJI69
 oTxUP6RUMvEZbb37w1xfVJNP2zDt7pq+Arenw+4X5Tt98LOb3w1cqA9TJsfk7pAT4RegTwDl299
 R9ROVGmsRXH7a5TgVaE+0nSBDC/oVicpWAQxthESpPkHBxXucgi5kKXbi0Es/QoNsI3X47ZTw6T
 E3Rj/UdlkpZ6zXDucpbRwtXohS+GbH8n3XZGfsmJUTP3dUq8s+w2BSTU0XPn2p0/jJyCM5Muv8r
 gJO/YbBJYXk0XVBTFkh15o6T3oVtmpJv/ezB5flSpO6SbvCPPTnSeLa9UHNsbA0+BnXuDOsgdSf
 /XFyri3fC0c236A9nwiTxIzgbEZwbSbJ8Ylr1r4usqrAJAmsNjqaLBHkVdHrU7qwmEx+edubUgJ
 SVFuAgn3MXfwaFyszJiEBqtzdCkPTXT4QV7ipMBqKouk25oq/h281Rgu/7xNAZ/tJkVjLqM+043
 UmPJtSSvzWfoGXBNk5g==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a9934e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=T6yAfy7FHkEd-x0P2_YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX+Oo3nJqOvlmf
 y05VB5MC1pbBjSD8xloFbuAAsOPJM+ipMNpdtwLXH6VGWGWYxyOstQfew6WsBWemVDBkiXZFFm+
 mHIfOGaHyUqy5GKDfRY5vUNvWdeHE/8=
X-Proofpoint-ORIG-GUID: miXfdb04-UAUwXUeUMwsa6Ukaw5V5K1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC and channels
> for available system thermistors.

[...]

> +		sys-0-thermal {

likewise - sys-n-thermal is unnecessarily cryptic

Konrad
