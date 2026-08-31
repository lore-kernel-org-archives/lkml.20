Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305DB3CF039
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164207; cv=none; b=LuBSSF9i7UIQDBUFo4I9eT7A3pFXgmh8EBQ2suQ1GcXEaO2piLaAPXPTiyh3tYu9WbI+JQuF9WFx9WhJi5IA4QqwHcBcabxK/5KNAChmJ8zxX3teiuUzQMhicXEuWi7x1EKylDBx0x/IXq/YfIuRC8rwLsTlLYv5PwxxEGjijhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164207; c=relaxed/simple;
	bh=vZi5S7ZP1eW0VNgKaU6jpf5sIBl2piSGBMCPnTu33yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyUAQqreamsSxJGNkDyv+2iOvv8ozbs+dFt/oyLjldM7I0ZToxVN47zBOSUlcswUEgM1RtWGwe3tpZvl+LrIvdgAe6V/Jc3BUdqNo0FnB/Sm33nbFBK8TDvK8qFZsJhwAQwxq0sUK5OnXj2DNQzi5cVL3wJO+Kp3Y+0h462Wh/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku+l96Bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf5+V9j5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku+l96Bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf5+V9j5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNEj3018218
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o5Mqt86zslYM87bOrJaqJw3p
	pv1OLdoxFWaouUU8Krk=; b=ku+l96Bvyz7ShvMNqbdo/8u7+hQvqMrUsbjutG4h
	zE1vGrurjEYmTe4UdRQKmPbxuNDR+nqmZ6q1MjrQKlIKuaVrR5+QGUzBDuunI5XM
	XHge6dGHZXCV0Snn8DED008GOlOZ8AaHhROI99vsBwd2Il3VuGKdIY+Ryd8d1Mci
	6IA1yKrA68pulGLq7V5chdt/YWqJEIjbpWhQMZGSF6+s+zucj4/v9kWm7G0TMzjp
	kYwEJ2v7Kl5VUztY7fSUbryFf2HGerkZDheqFA8OO3LL4oSG4HONBOcFKcVd1IdH
	9MZhP4Du0ArBS5OxrDWJEaXXWrrvcM+/zJGYpFtlqLGDXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so486781585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164204; x=1788769004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=gf5+V9j58slsnsMU2qpKyqG8UMJ7kiKHaSw5ROT+N0mUdMMmyCvoAi0bdd4XrEMMtZ
         ddP+OPLsPgWlf5u1xScXk6ysMvOyZAVKfYGv0kNS/LB4XhQ/nQFyJJ1SGWPXeQquJoma
         iLIAu1cXIORYzUVPKH4/R9BXg8p6f82L23wTlbMbrMP6lHI1gRtcEPy6Hnvy8eO7kVSE
         G6IGBqjbvssOlFHgQ14+IEVyZy87FEGmD+mlgO/gWgQifQg1xpm5N13GK89mFzAyTYs+
         EzfsEM7E5gmMXyB1zys5ENNSSZy/1GfSYsbdnSq5dTM6Xxcl3D3rL/GncYOJaeyIqNhD
         47lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164204; x=1788769004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=FPK3hKA0xe9PMwU8hs/DbpZitn/MywWmV1dFT3HjSiuvuidaQuDNiy4962zFcebKQ7
         7zZlBQLAnv0frEv9Z0Trp2uqMHI7I9RWam6o5G1pkF5H5rkZIwtD8iZUh86Ibf2iQc0u
         /UWs87rEznOZnPXVU7Rd4aCVgH8JzPsnw6tY4sqBKPcXeh0BgSjk83iwy0NZVQgZiDDW
         Ptl9Yh/IC+UHcK22tssiEo7UDwU+UafW3dUf2TObFCaCvrALhO/j3wgpxtFSBPATrTyS
         sOBDftohZjfDiHN8gvm1cKt9shsRFIgl7pYXBPi1a2IEuo8vMVR19ETTsxAS5yrzbZcq
         OcZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqby2EEGLXl5oPasNB23lppwH7yEp8E/MOpTewJuj3c/OhFA4wjO9d0rZuHhxegI95Aj9eqTlEPfQNwHnE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQUouSM6AcIcIOru7pXLBavPrASw/e77Akmpxd/NnW4Vog4xD7
	rwMDjw5/P1A0itYxq6l6ETt39lt2PhrjI3zVLEiRNoCI6c/+LZhLTxuT2MuwRVBQvoosxdkYxuE
	5jnEZhj+ooumletkY9XlBEqVCvitFPaFCeTFfNet4V2Xju2ITDFUvv6hszZzNZdYjr1c=
X-Gm-Gg: AR+sD10a7j7yaZFFXGZrc/1NvK4V29PRWr9IXixjW6Qrrrl9QSlydSXN9k78ykXxTzT
	3UN/Ir1REhnyAS2PELPBbP1KC0LvsU1PgaUtDMhqt5DL9AX88dYJKyRu2cMrh2O7swChHHx3NGJ
	xU/3Hclqu52d7WYJt7pdrU7OwRYxedIhZKfxFEcV09pFjFcG/1DUmKa9R+MKPLvSxxlShk7nY7M
	TmB65QDEu7TI6s0sIhIKV00Nzgci+E1OqY2nfYGDvTduEYu2/ZwKr/uMy3z/Nf8ZIxuvTF+G2cI
	4rPFwx3pvFVy6qgoRG4/k3XwPKQVZbvIxx/tjB8k78pcuPUPL075d1StyCZFjS83NObd4SZ33Kc
	cCoa6OE8gCGn2
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293029085a.23.1788164204260;
        Mon, 31 Aug 2026 01:16:44 -0700 (PDT)
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293024685a.23.1788164203684;
        Mon, 31 Aug 2026 01:16:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2fa779esm114204405e9.2.2026.08.31.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:16:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Message-ID: <h2m6oky5kqmm7ci3rrtbkjme5w3brtgljivgkgwoqf55upbgbn@pcjlbqf7c67g>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ooIJDDnBpgZlPGkh9JCiIPx_vnLdTFi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX42iiiRlnly+a
 Mp+EXlWXu0ciZGGoX2x9v8xp2WbEkHg0H9XbI1pLJ5eb7pVJGyP4OQ12almWEPJSaej+Hlb1Hwi
 KzKdxjNCobAiEdSOs/8LS8j/LkiH2kiLv/6G1+M/1acunbAf7ISrmCpAZGlqMrVkaswOPgMnYfp
 mrO/QFuGPe9Zsl9kRv2xar4CQV+7O+nsba+cT1lR69n/YTelaqxhIXoaq8PPmhAOniQh/jQ7moB
 hVs35SCwZtz4jIzMvCrKk2oUx48RYhegGB6KYMB9/MDhod5BICtP6PIgKLGY0a0LmNDk2ApRtdb
 5/TxqweCFOYR3l60GfUSyKOG8Bhbp36UwtjhZDzPMhUmFGg8cDKVq0qW/an00G5/3srPzVpPdMq
 OoMeEehjCpy3jz1I8tPbwayqBLdr6Rkf/xkRV1FRZ5BxFGEJy6K3E6elpU60IlSLR6uva/2FgXU
 RrZvRokgKB70UAy7/fQ==
X-Proofpoint-GUID: ooIJDDnBpgZlPGkh9JCiIPx_vnLdTFi1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX512eEJORSUms
 A28Xd3eRV9RcQEbJEjL+aKkUmExu7bmEL+lr0azeepPXvVvoDRlskWXzPdMt15h3NPuZQ2s3W4H
 DM3bqElrSvXFVedJgotFydCVxs0B+dE=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a95386d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=r_5Z68Ezhs6jPTxZHdMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

On 26-08-31 11:21:00, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
