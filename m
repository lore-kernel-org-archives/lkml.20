Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C221511E61
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687764; cv=none; b=cGipdLii+yLgZd0ybbKWIOQatJLKqU1s5PkXB24CFA4CN4gTiVZ19JUbmCST9ptOejXCHjbKtQrB6ueCxAS7ewxXVxwFVJJpOL+RT4wzvm3BeQkCJcfUk67ZEfwL+460l/yqbP38xj5UVTWJ7EuT+a7pe/0Nhsx+HS6nhW0GG+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687764; c=relaxed/simple;
	bh=8C2QM8PCCveH2S1uREZ+hMj+7+Mn/kc2094lRJW8H44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrrDsYRZ8o+jek6EWsMI0qGvQCShvsq7GyxUWg7sdeSPXmzemjEl7RmvO39TZYwFjcoQzdhI4/yQJcVb8n6WNeoGbHoJjrqACH7u2DiWGhzt3+0eXhQxA6fVSFC1oI7trbPUq7OBW+p+i48bYdZ41QHnuorUIccJz0KUK4DeatY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLJDIrii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlKyhfcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLJDIrii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlKyhfcA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhdB4151435
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFl2aUIBjMMRWVsBPz1x55IM
	XDSAEwKxKurM1GPMbbs=; b=VLJDIriiq9PrV56sY1sL1ueS83fOBsA049yjnyq+
	0TPokCrRbnvIKGt/6CkNYUdNJe/1uG3L+TRC3pS72MDWE6OMI2jRdXOQbrlhb6VP
	5I35HltoQzb/tNlp8BOoGT4flYu8m6XpbPQq9Ovs88RR8UiG4RoPpp6n+EysIRhP
	pArvjWR9L1YpFfFAOU3eHGqYWm5/f9MnAP8EnuhemUdNQB4iiOwVOO8YmFE1atUb
	tU5ycMgy8STZxZOu5bRStu5RfKMFYvdaV8oYGH8vEeOGtUmydVUlotRkhP+2sliO
	G9g/0tMb7HLtgKBNH1xv52MrMGKVhyNWyWLez4eUmYc8ZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc700-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:16:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3359737241.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687761; x=1791292561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=SlKyhfcARdlx0e6UAjdQFr2DjHoXEt2ug8mQ1J/iRlYXO+Z5szSILBVgqA0yFkAswQ
         4dUTfrK+pC7RcV57uWVwhR4X2UbMw0lo6KHyRKX6RWgz9LeTPjdNBY0cb4q+jdGDFrjj
         LpbSozHcVUSzp6FhO2yJAKjHC04UlCY60NJnC25BT0FUqkD3B+9avkQ3PbcKb9B/wVZz
         FS31L4dRIz04Kv7Q3WxOJRJRYEOuGPHI2D4A+AIri2dCFs3mKOryVGlVVrNoCxP8FgDm
         gqCE+qFKFMuSvFx+rfCrTVNiaQYhlCrk5UkCCrfNA/mOsM+PP+Rvq+vbiOtWan0NPxeB
         OVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687761; x=1791292561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=CLuXloT2XJIbO1SdVPlguMNsX1caP2+RycOKj9GGmaYfR0kowRLZpzQ/QCfoctei7x
         gvFPOKOLTPGhOQtLkFkFE0EqpJ6GB1+kAz53kAhydel19yYf3GurFeSIaKvSffZMzjYp
         2aVws0H25qJUXJMQCnBHcWljp0NVYJk05MaDj9RGQhUE+SlkIEJI4+DahfSYO2UIUNKe
         M8iQJYwKz6EPQc/XGqSGUdB6WpmhwAbdT9ihuPe58YVlcA68iswB9haBWY1QcL9Jvd2q
         FCJVW0zhIhft5xBuiJ/TDGH3o0q+h5Gd2dG0XFe/M3vM8/UXl5WE0Iu57mWxHFWKr3oJ
         6qZA==
X-Forwarded-Encrypted: i=1; AKwUvByKTQ7hCisJSRUya9vv21djxVw100A7h4zHF6D4ysFau5RugcKA3PaVmqe+p+i9HxR2d2xJN5YY2EipsUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG73s8oe5vG72s+Ye79dL4UDjqobJfFtqBTS5TI8A1hqoNB8e8
	eGY5LT+ZuSFWuXHXWsSBTChvjtpIpa1lNr0b1PPXtyM8fS0F5STvLduyd6Hf1PxLc9+Cwg5wFKS
	dKTIH9Z60e/5IFB62AHdp2RFOSMQZJ60C/hP9aE9F16DIe+Hf3PuXNBFrxbsP9zLOfrM=
X-Gm-Gg: AYBFou2mTNnAhv8rO3hfdWxyNs3+mj7t3qJIJjSHO4pir8TVkoKN7DZL9mPYDijI8Mb
	GKuWD7tg1l43W7p4xtH//2S5rbsg40lrwf089iO3Uhxl0zfs+h5r0efI8gLfryTs/jW/FjGZJ9J
	CcyqelBOrZDxKzzy1S7h+5utuXao8YjnvLzt+wqhybWJdkdjiNFvRq879/ptQQkURTzecggq5In
	kMVoMAaY1HvP4L7T5A4xcomk3ofY+R8++NNraYSVKsRaztxRM809gbxvc1eIaQwkV5BSrdsHPZK
	BJB0pvC5HQJJJDn0il1+/n0Z7rdELWU1hT/x4rVuGhNUJN7mllhcuYkbwy/NO9HQIC8D+8vFLBW
	dW89k8Odv5SWCPw0=
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642939137.1.1790687761219;
        Tue, 29 Sep 2026 06:16:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642911137.1.1790687760624;
        Tue, 29 Sep 2026 06:16:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm3963646f8f.17.2026.09.29.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:15:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:15:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Message-ID: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oep5npBZ1xkKBJOE6uI_7CJsjUAEsEuj
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbba12 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OAj-UWuWdFWybih5JLoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/WkJ9vdQEn1/
 znLvcoBqJ3HZ6omgRVl1EeicWWCOqha+hNvXVJ9E0nMX1UqQcmE5/7hyW9m12Sjl2FcTY1j4cVy
 rn9xCwkfyspTJHvhB9X81pzEDqnxAmiFoZsG7xVN2lkdb82Ve16P2BYgX5/szuU7i6ZHMYTMk8Z
 HmxBIZxtC4X7VlIfqopxSglqL23AwxEBG6IRJSbu5KDgWjsM8e8X4IUpkl6NtRnYA7bqR3suKQL
 IcozwS2zcA5++v8RMwnPxPU7azZ6KbCeOyl1w33zMHCvSJYRrwSXQfYYL2w9noXGQMc1/epmL1I
 kHuP1dOpZ3BeS54x/2DGiGm1OISk9PhuHMVzQIiFK1G9l0X7j+hkE0DtLS9rr01WePhJrx7cqNv
 d3T2zg8EBFiYByHIKkdOuzfNrEvPTVKi/5GBzE3nILPgnO3jIjwS4qaNLTU4BXauHaziLsoN6JH
 4YPkZDGR58Z+rT2kkOA==
X-Proofpoint-GUID: oep5npBZ1xkKBJOE6uI_7CJsjUAEsEuj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwQTk6l7ySEok
 6G2W06OUT4a+A13EPK3gNUJnOfcyYsjV7jXO1fsuY07E3js6S32yvZncO0kvQQ3Da3xgWa4HJnn
 QJ2eG9hyWUSDrzde54srzNGMNEdMKAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index 1a24e6439e36..52b5fc1ef9a3 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> +		sensor@4700 {
> +			compatible = "qcom,pm8350c-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		pm8350c_gpios: gpio@8800 {
>  			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>  			reg = <0x8800>;
> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>  			#pwm-cells = <2>;
>  			status = "disabled";
>  		};
> +

Drop this new empty line.

>  	};
>  };
>  
> 
> -- 
> 2.43.0
> 
