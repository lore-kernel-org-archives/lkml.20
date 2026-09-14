Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CEA4772A1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393714; cv=none; b=rWK9fq6OUCoyU/BEcZDRjrj27ynCGVJvA2LTw6X28JEuGxYb4ouIM6iV+kqzCyz8EwUe6ZqR8rk4iOpBMEAZpRzXUoOwHXB6ybzc1OihnOGNTksdzlIk0frMPaB5KWtgseYE47YKDN331QGm7inUqpMINlxq3hnR6vs1GgIo90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393714; c=relaxed/simple;
	bh=wTtt26P9/YFB6Zh8WHqX6MNSaxvf4tRs4sEIMdB7qe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqVOMdo2o4bd7+2Kl4K71kGIMaEyQYbgdlmoHPmsbofWg+IBhO7vASrI5G7ErKNx0k9qPRZEVoJELYqMOzTgxzfp6c92x+qwXfVwX90kPiBf5UYG68ivwDbGDOwqgYr3Ab2VrHlCt9Zn2CXAz8+gtZJlMmXEqq+wY8PuxrAVKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuqmraSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrvP3qt6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuqmraSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrvP3qt6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Ud13588154
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgXTfcLQ0D0zx+3T86XCbLuz
	91+Iob/1aPO996gOmTQ=; b=GuqmraSgFp0wUDk8cSY8HASx0yMj591K1BCA/wio
	EdOmlz2xZ2/t/xZkMZq6z8XmEOSvM7ezVtZYS8J4CBEYReToPD4s3/JjmTZMev7F
	huVxjpX0DmFMS13CohEX/t5Rw2eeEKpqfoUsnwSd+8Ivt1TdI5qtTFnI60+ENaT6
	wUKxZgRnKsyruib2KnwGOpoJq9i1Fs2REmHy30l+dAnNvF47fVdIUtjJQbFsNsFr
	cwac2IgXOUN4oZ73egSUhjm7TvAUNkHpLEpU+G5cG53aw+u6Vg5a1aon7r1IuuRo
	cbiGgYxyL2kM0gi0LuTRsiZO3k1eG1YvsyIExgkvub1WPg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8wh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:48:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8323b8464so4241900e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393710; x=1789998510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=FrvP3qt6wpzJtcXNaIc2bvxm+NypvhmVErH7G3AfIqFcGcKzbUpk/nHo+yTYjaegcw
         7GzAJ1/c57skvF9fB8630pE8Bvp03ElBGKuqyv+BVfdQnKRlZpVjfOIP7vGvxGJfvpwJ
         uKLemvCalDMi0hm19zcpcw+SwsbqOZ8MMcTjeTv6X0QGZWJU/zaf+SqYfIxx6va1pw2d
         ujwpIpHpjRrc3XMWxxsEFMrGPdZHJmlkLTSrG3eb+X447vXcXgbPFVkZM7PrteGcFU1z
         ztB0asy6hUZqq4g6wogvb5cIQHhiO4dVLW4KbCa4c21mkvMgZkPDBU/m2AMo2F07UZKG
         Zv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393710; x=1789998510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=aO5PZQQmpKhjUbrCKkXPwK6T9/6HRYKb4JrymC0TCQ0RKFCj13PmiDka7IadeaGhfU
         0XFekqxfgWWj/26xQ+daSEGoJTfygaKfFJ0uy/F3wnomc16JLkm70ZALVsTHopbKjduB
         P7r1EQdkK751+EK8Lb4Wq9DWf8Cko9/L+BQhON52tRbUTRghmkcMFt6qLSj+A18amxFr
         HlrtA6LTPDiUoYGGKAeuDM1fpOQw1RSPqidlbeFYUr49Sc0YlJ/pH9ybubZQOUPuqDkb
         NpnLbQOUVBKUA1mU3su9BoBnIBqGnCPL/CcwSd0nOFXliK5RwjCtyryQOPSSTpw1EKNf
         gStg==
X-Forwarded-Encrypted: i=1; AKwUvBxfaEljSywdGAImLP64der0U0doB2NCL3ROMWG8Una1XjpUHHLz9ogq23mnFeksepd/Ap2ws8iTNEyaJcc=@vger.kernel.org
X-Gm-Message-State: AFuF++m4vGRVMXIoODUIJ1bMl9jeh5NO8kwQ0alJlDC+tfxZlsxFpZrg
	6WcJmXiRPc/H53GiCrAm8ozePybK00DT4m7QtzhRisAUCcjrkaLE1SAxunnwEh93dbDinqrSPmK
	xRTh8aw+Xworme46JuWASr4BW5ccybuKCtY2eZgqDTfqMSlXrClVcacz/fhwUCUEhBBU=
X-Gm-Gg: AYBFou3T/Rx3I2DcpxvtHPnB1wJbYKLUs/54okvsTgldSiZO+9dJY8n+IwOgHtZ12EJ
	GJrqUgKBojo+uD43dglw6/MsL1ifuEE22yZOjfXXNQVfPsLBwVafrRmIgrpDbbQs+746D4dO6+/
	Po+Q/W1AXYfnIeCP+mwAvuRr8+Xsx1z6kSE0AUnFkg0kmQMZHbBauHsLFH1PD8lSTjNg0nnrenm
	J0Vpn7hbHcyAfe1mk5uEu0bXKWwdCH/ZQ+GxhDFTGCM457hG7SCu2vLWL8N+y8WSJz2vebKiPv0
	0xXjd/Xjwba9ZTugf2ej3o/wUxzE5Me8I5LgfLPqR8ULGspCtYXgACc/mQ27gFlwOntjv4yxfzg
	q64shMCeXzMep3g==
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352700e0c.0.1789393709485;
        Mon, 14 Sep 2026 06:48:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352577e0c.0.1789393708749;
        Mon, 14 Sep 2026 06:48:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm28037041f8f.13.2026.09.14.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:48:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
Message-ID: <ua54c4qtcxrly2qyae4usdc5f45vrtlpnog65ym2int5jpz2wc@3yxj5jrcwec2>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7fb2f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: C5iqhCApc3syFJ95gDD-Fyw_2CuhK64m
X-Proofpoint-ORIG-GUID: C5iqhCApc3syFJ95gDD-Fyw_2CuhK64m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX0ecuFsAyL4Ae
 56IE8t2Vw4lX+E13thcuXVZRWOI2T4kSMltxXotvjTVgEhwg8/WY7GrYI3hHY7J0djiRi0Qb+tv
 2wEmDSnPLW6OWERgYAhA78b8aGGmBbJGjVCHQ6WqUc3+cWN4VCDySymuXxH4yiEGbxXn37hyAZE
 sSn6JfgTuSByzJFLfwQOSAtTeqvdtKaJmHgLTI1visdlPCS6YRlOXrk2Y8sd+jwSArlWrDruoqF
 jRDTgMbytBPQMrpCNn+Ofq96bJpr5jy7+JLgAJ4MWGIxGEydsigvEX4S+mPvTZa2jzr6S5gChOR
 j/IywWCdOpmmHiHll2Ai+qsdNiNRMxDWSRYsW6AkDmT1JEm43oPADWhNMpBah2ZyQd4fH7dEVHo
 NsChhrP2KNzkbgxKAba2kUMO6c1LtHeqhVEqgUuPWdmxAZiaT+UCXPTpK3FSZXKhvmpGct4NmA0
 yvXTr1Y1B5rl2ZpLyaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX37k9zLclnHpZ
 Hf0PdBJvaimkMMkJFvrgszps9JvHiKSM4myjGvSWXrGW8P+jvEmIniuhN4yXPEoLdr1XSVKmdb4
 3fBr5HQt5DarOMaGIplGU90PoTu9Qjs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140197

On 26-09-14 15:19:41, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
