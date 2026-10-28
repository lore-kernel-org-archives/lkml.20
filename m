Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201098;
	b=d/0bDxcMZMFNk5t4ONjcxArfBMFtR2Yu1BK+1mamZhT+4/cVsEcN01p5q/f15BZXxWAh
	 EsDGCJBSxZn7XASZxAgjFgeZrk5aUPxJE1ug7/0W8ebhWPcG01yj1CgaIgEsjzQ9V6PC1
	 btqvb0ZzkBARclj3w2bfO1/doOrO1EGcFDMLjORaZZtGnt3D9WTiY6+slE8Joh0MO5xfc
	 4SSWgiNEukY0DnwQCGxvTdu2wbX9zqbF1iqZC97kVOInfA1OZbETxtsixVV4tQW/hBI/q
	 j+3T4TXnN2OKNLTtbZ6EeQUo6QCWliWWuI2Tg+WqhtUk95XTUCwEAcqqmgJmt47HL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
	b=Mc5bhcDUNw1SiNnZ/1dBjegKFttFroQrgvxA0V3z9V3Py/hF6fU5PSC/XtSTXPh5mfKr
	 l0E1kFXk+ueiXeek9jKkZ7EPR4+VP/+cFdN/8x0oZN6yN4Mzwo5zL7L/+pDUPrMtYWABU
	 E5iJxBvhFUZZXbaYkGTH1d/cKRZiXOq2HYL6ZENKtr5K6gHH8hzzQ5MZ+VqnBDIRF3u4C
	 zu6n0jEQmFUuwfwIKB5rxCNEIoC6M1gpWDAmTCz6WiFzh3DuX2ei7s1qFuhl2TXLnT5DU
	 ZaPQMKIY+VC3RWHQrp1IJbenyuqL0VhtPLO90jVz2VIyrSPoNa1xhjz2bUGwP42odDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8235606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8235606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAp4t1154504
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QLQUXqUYirntPTS+AVIsP28Q
	uGK/Ns+GbMRyoGZXnHY=; b=RACwGrfBZ/gA2Kqv3l52ojRFGLZ2TwI7tyazYofl
	h0AEGY/8tMLQWFfCsQdx7LUG2NtcoabfuznOh2PV9jTzT316ZweXD20Nv0eR2iRB
	fpAQqrlExWEZomtKYKdwhwQ0x8klqpJMRBC01d6mGTjh/1YJl9fwU/2oaDXXqrfS
	7Uwk2KIq13BOcgr/gepJfJOKdJUyQ5toLtFe4DcT16z5FuTFkvMp74OqcLEI3hY2
	hHOGMDyC/Q+JFX1AoGuuAYWRr6tph1T/5CkUvbmt5Ks3HX4X1TQBshve12JuasDK
	f9uTE1YXv7lXiKzdm2Dw+2T3zI5VYSpafFpGzJmeJSdSDg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be35br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so369270e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201096; x=1793805896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=SxMtTmSOs0xXzmv80/HN9uC0699yWPeex+Y5WeqIdc5iarDoOqHNedW+76e8/n2mcX
         4Bi7Job1xB0O2eMuwbL4RjU1LusJT8/NWEjAMN2TLTOw7G9FktKFwaWngqyN2d/Kctop
         QJHPValRdWuoCE3Uc/pCDDxjf3+UvzvVkKYJrCkqLBR5zWmjYN6GZqEHO5GkckzXWxvG
         L8syDiuMCptBzHsrQpET116pck1kc7drcLC4nQe1XAioqnbTt8Ise29F4miLr8tfHZWz
         rkMowPBhEmlJxsz7ag8HT1fNCM12/eeWWnsqKWgSX6AqSIMvKpybAha0MUaIL6LCmSqd
         Pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201096; x=1793805896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=Sjf/nquSzfImI+ZaUMuNz8E0d0wsQM1VC1qCbIfYuoWuVwnZqjARDVwh1zHv7D5FRA
         KCmYJQ9TEeMfIOg5K6EBviMqYTrgVmb0A3blB67HgSWPnmK+N3aLlLxr+Y34xIcCjphJ
         Dn3vZal95yI6sJbrhugEQmR6KrbhiYoeCjRWmpQE+ktcBm0WV6wQ1TLRpNQ2R/oAh36g
         CnqVvTACrUeyxqWopU4sKO8MTrrtXbcuHWLWO/Y4Bly2vSyT9xpBwLTM5nX/zvrYj1L0
         MyX33AzgdXsHxLk33DhzwSfTO7sz6SZGgrNgbNkbExfM6IQYJWZBnuXQxj9E5t1bA1qn
         OYmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3fBjHtqG3ZA+NOcUdNlZHneO1LsBcHtp68E9kXYv7eOZqfZw4W1uSfvfrjJTnUla8PVKYiGV9oAg64AU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxZRZBbDee2zAbyH1vV/onIosHcX/J9vCkJmxi4uIC84b/77FM
	p74wNsM32GQ3mZQDoZhiVKsnqa8MFjl+0HpCDK6EupAZx4trCjyM3+d1rTYVuOqUK5uBs/461eL
	aePAZv1v4DUiqP0jGJ7lV3EZ832L4/+nm/JwwSfc4+oDpxPjYcVmASXyPwjhqvEEoNqA=
X-Gm-Gg: AYBFou1KnnM+VCj4aDUToAAMe6yXClr9P216oT6NOMfgdikvL9MXeiuTakWGJJEYsmH
	Hj5qWfaXsFiF7kH/f8vlxtgPnoJLdiOu17TBbAdlSSrHu/q0JN/edz7Xj+Rc7qJ8iHgGfEpiEnY
	+dDW3G5aSkkObrBqW/hMoq2jANBzqOUa5fKP4aNXZQlAfaXz+DGACqMdnEfpRWuF7GKUwN6t4Cf
	wRg4XaYmBMzRmNl8qH01iN9tNxYrF+06KxFFDokAm/fjoSYv6zMWq9bDDUnrixMaFCzmzm2Z3l7
	dAgenpVJC34CRiPdXblQu9lxPI2o0Eq2Ug4w0+uyD66dTcnSv4+4bnjcu/WgkKWZdFRxSj6Hvfm
	q62PBf9O5bimQ/90RZnEA8L1luEi4do8VqQ217rEhHzNp5Rbm6BrQQSy5k8uH/L48JA==
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308322e0c.3.1793201095757;
        Wed, 28 Oct 2026 08:24:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308242e0c.3.1793201094884;
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm28208441f8f.14.2026.10.28.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:24:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe
 PHY on Glymur and Mahua boards
Message-ID: <keiqrug6itasipmizdqrpjtwhe6qibgtallk75kyorvpxsbjr6@uhpyachmpc6h>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
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
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HXebJSVkfdy3Y5LTht1VzxHWATOnpNDl
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae213c8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n262S7Ma3DPWuRD1FHQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwJn0bCIqzEdn
 7XmSSxWwu1kNWAsKN3gbCazR/qAdzmWQXV/cmDV3rTQs+MAf1wMeJ9k4ZFrlEZ88Mn2Y7rNPvvq
 fA1LbbW7hqa3z1mUG8djnZTIq5tLrl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXzGQ1bKUVsXzs
 6xXr6O7FYAzRTTEO41PJ7g0Il7yj9OTCzuIUz4Dw2pf1Vo/WUiAi8OSor+AOUC/S8h1Q6Es7SA9
 /FnTVgNL54MZu6MVpqIfyRBfwLWAunvUK+HU3Kw5kYBI3/kNoMZKrrSd3cznf4yJwxlbMiXHuY9
 xQAMehmbLLd0KeKO5UxVU9j14ihgSYTCjQy8uF3JTRJ99Nchtkkg1gRTeThvh7NLqemVMpajFDI
 C2VlkPYuTbfpNX8bPK5Oq6QX1+s5bWni+fVniS4nIBFLreF5yqxBShfkbJd/7/nMb8dntYuzuY+
 ++98U98cftumfp8uR3wjBgFx1PJIHwnt1xRpqObPpTlHVdJuZXDj21PYLFd9rUACqKLMYvs8KNZ
 Q8LwituNMEG05YU7Ztk7iWn/ZfqB+JhCmbEZgLvtYTqf+xswpzymKLaoR3bKAMfWG2LH0tNchRr
 ZFiw5PksBerLH3Z43cQ==
X-Proofpoint-GUID: HXebJSVkfdy3Y5LTht1VzxHWATOnpNDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

On 26-10-13 03:16:47, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
