Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501577;
	b=C2Pg2gfCOeTd6oJF9PXNMXfY6sloWfTxENkRYOo/NqOFVPJKpPIjrolrCMSe4PwqOQLf
	 5+2iQ8/bZD7mmQVKpLDvIqSdciXCTqch/P41nSVxDZIGJ98fFXs1ubegoxfE/loPYMktz
	 pPofIXjMxxwHJU/XLb7tbU/4ubSc8iKHkY/D+FVgDtWNsojU5lZZdvskgpsOhmY+X0fSR
	 mTdy7qKzOViR2gXnXhXXbJQflNR21kxwImXpusVjkZRkKHr+GcihfmcFt2jzm87+oCWXv
	 Ms66s+PA5TlV0vlzgaRFdFCehPnFnQS4IvS+uFWLLBdK5L+UHD/TJShiw65leZQrQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
	b=oy6M3BSgWaD4nXkPypqHVV93Kyz3TJsAzW98YooqRvV1ZmDKXtCQtZt6qhsgjimS8c2Y
	 LylcxvctAkrpkhy5uVhuydxzhSFI+b3E7tXsgcfoF6u923z63ZfkFNRMoubH+jCmQ7uLg
	 FeXCNR8W+XdNIOSHiy5WWIPPPO7iWv8CwJzhh3KeCpuyFPV222zlgM99CeCPVDaKQaYAx
	 K8OJhkHVh8udFGykIUPQ+2iAniUwStc+iuOluYJc8eRO1TCZ8BUNPzxA7e76BvDt3SPIf
	 7odOHzRVhHNL0CycdO4uapIhiyAX6T57WqEU0hkE1o/FeuK6f241GjtV3VytAZjFd6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eVl/rqLa";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7703B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl/rqLa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxA9B419924
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CE0LblYMBDhwvK0/37IJJYzW
	6feczp9XAWylbm82xTY=; b=Qnsg08wTR9ZQ891ogCrMHX9ECV8khG+TBrcQurDv
	Fwesgel3VDU/uqrZgfHZfHPHYVgnls1G/gR1cps2J2Ohd1feR1PghgfO+mmKXqMc
	yGktTqNGQWXAdtUTfOZ1ehwBRNB7zptacSQ1sIbIcT660xAgXO8FIuIWvch2fZ52
	i1EydDbSlXXvY0cjw4YWAWFzQyTYBy2ViUM7IBiNs5Chm1eIfHVnJ5nOFVDe1W4A
	pSVgXCY07pdRaM47z4yHQ9OsIQT78wiCvpFiRau299ICdg4bQq2I8Jg54If9ZIIY
	livn1eKq1RDldvsA4I2/RGsH6XN1W9tqoREo+5JZH5u3TQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5sthdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc37ee6562so383346137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501575; x=1793106375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=eVl/rqLamutJg7J+wgICd6B+u6cmattpRX4g0Xl6RGI+aP28ZF6os9Jmn/wEdt2yyK
         j4lb3ECmHE1AIDEm9iIKlG7188BkJHvXLG12Q1JCVg//1Pp1Fq6K+C+KOO337BtuZL59
         po0DEhHGp0kJFFAASVcmxwZtj8fjf2LYHfNnx6FD4bXwA4g/YmSGKAvKBC8WXAFGmhnY
         G3w2/u7i9jQmaO1OEQYfc8XiKYnFj5JOYJFgFUZW/vh1BlP5G5kAawbX3iDoQv0N/fGf
         /i2O4I+IB+KAH3oX6vxpSOjtM1v2EP/THp5HxUQkkSxIT0a/11P/4kpxmprOGDcpB7u8
         mmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501575; x=1793106375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=H3DFhG+pIi+FF1/Ub/ewh+y7GXiJnNeMiVTQZ6MQy1PF3T2yuRQd54o1BftTXu5KXI
         MT2quAMuzNcizIEn8ux7xMjUmed0RCwYH4sbSYEw3d7Fp8QmFl378nlaQID9vJc3VCVj
         p8DcJqMYGyCtSdwmYErmvQV9auxt9dNLfvmVNmst3SHNGxhmMl0Pbi6JrU/ZRLPVOeg8
         YnUOBktRH+ImW+WKIf76a4cEKAGijyuatbSFT6R9ZG9nBPAA6sitUMP+NRdt8zWyZotp
         ZlIkV6p4Z/5BqiOEl0cXZxqeHhMSC4Oh/9/9zm7MVoBEFP/3i7pXjG5y9e37vQrFvkUn
         mw3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzl2y1++ir5+gLhMr1SYoows13YeEwr2+buiYQeIg8Lux60Mr7PPSS4VcRn3L3AHcGue7I7fBbyJ3TYHwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiOmXT9l8vM8iBYft+UoGBVrL4x15uJuxjIU/TvlpB8f/urei+
	4x5OyaUOl1fahvbMLB7EncID4vUznVxmopm11MfC+p7acw/I2s0I+QdXu8/RwxfOHqYZlk9XRa2
	hpGNTybrx6qHsXkzZ+uZpZ93HLOK2Hhhgms3f5/HV2K42CBqxfZJpMPmdIyKSXFVOgcM=
X-Gm-Gg: AYBFou0/LvOc/q+vU+uTwGdqZp9ISZkLTTFDWdKxHVcPTvE7bv3lf76MoGdHcUUcAgO
	9Vby2u1BlUfOy/G4X8WdVO9KNA3+Al2gyGq0/3Ykhcj1dh22X/dZ5QC4JMqyGgaMVVCo+qOxqLl
	eiswF2n7uKNHZNPWunfDMPpCZf2AHH2tRWctPD7ODOf9e1BXtwgsYk/A801Uq+23vTpEbdgjYcK
	cyz0ucc6FOC9bfcukk3wlUJoTjFQgP5DeZT06uQX30mukFsUjCirdGhof4a+Mv8VDS4U8/pugHb
	EonHaD4P+rGEie+gieCEXqrrE9CVa+8P7vLyRCFxfrzrh1W0A/7c6InBhUy+QdERTz68c9m9XAU
	S3UQkZbYE4gpPMiPn
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642210137.3.1792501574610;
        Tue, 20 Oct 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642204137.3.1792501573972;
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dbbasm5839673f8f.45.2026.10.20.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:12 +0300
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: kodiak: Use ICC tag defines
Message-ID: <z2cfdniye5rigkc3zrhazk4zqkq52bzl5tm5mn36ij4lxhq7l3@mh5whmrnowld>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/zLD8pWiG9tU
 vQ5W3qxqyB5ubAxxaaqIonbpeDHk3L9ZQvDREJ5pX1OXHOu8aY84bdWspcGcYpddGK+IUkIJ6GM
 jJAroP8S7SDK3rWx/ysgWPzLkbhMbrWcuXx1jMf7tG2hPchVC5U/D3m6VJGWR864XbwgTUElydm
 1hzn+fXeX1Nq4HGGTSwnBUwBR71LbkyQRYJ8rSvXITc9bb6dC+GPVyRcL6+nYIU14rVDMnfpUQ4
 mpc4IJqZle3GScp790VtH8caUBxBG+z233+Pksf1PmtxCLEE26ftSvBITxJrPkTRn4LfOl7L/R/
 7HtemuDD3oiYRNy8A8i4qjY4aQ78MElVWccXZClkbI1CqtrIeu82bUxnaZJiT3Wv/EYKSWdcx4v
 QVGt8arntnPR2dyF6rEx0SfJfOdCCkY8s7HeM5l9IlD2KdaOdhee7JtYTd8QkzTeVC6KQKBDQSe
 KnVK39gUQg2s1IynJDw==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad76747 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7jEBbBY3jDUfc6YBOLYA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 5Id-b3nJnjqLe7paYDhmmBxlj1KP2ZXu
X-Proofpoint-ORIG-GUID: 5Id-b3nJnjqLe7paYDhmmBxlj1KP2ZXu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXwHDlbPQXFkSr
 ZoffHmKIUNz+COjXIlNov5EMe0MTw08ZYfhtJi+ffutZnbAo/OcR5XOJCzs3pU1iSFxknNLbimX
 VhgyLhL2jQYU5Yg/MKGMZAIWket3Js4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
