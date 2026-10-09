Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7513539185A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534188; cv=none; b=RaVmLHxSA8+oH961uJbq4IoXsqk0xAhxL0WhA8/vTrHk/aLBHaYtdc/a8k6KZlkgzsXNwNl790rKIn+cfOicwX7dnl/ZEX4UyWZhFROE2LDeXhlRzSndmdT+sgwhyUdLyOOULK3efMwfmNmzeko6raeoY7rfhjp73BwYCse6iHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534188; c=relaxed/simple;
	bh=oKcONAB5sNh3frsP/GTImS4Z63f4ZuBvkhfNSfI+ziw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhnQFi/oRTrgIrM4B3Rzp45Sc6XiAAoADflHTuQJwN5FFHzq3GslaAzdIIKX+69e9S//D3DLNnxQ9gQlsz7FWNRGT2aNPHofbF6sEF/7YaIWlXA+4mNVRqqPVs4D2aZ9YtIUGff0gbFLA4KJSlrwrGFTmKCQ59z/8h18zOrO2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qz91mjRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5GK7RQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qz91mjRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5GK7RQo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOpo1103157
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iNcP9lIMFixukf9jSoJkK4cx
	lZP96poOCV/W1Al4rms=; b=Qz91mjRHyHCL8vofDqUgYO+5zTg3hjs5dCMg8J+f
	P6+a+7XbCDIIgLNkKRZgcg/VUykHcL6tlQqGSOTT0YqIy4FX8njnILTnBL5cPi1D
	E84JT1HgPDixSuu8MTRbyzHF0XxgvoyoLIUEFbdWz0MvHDDQr3obh0qjIu0VP52f
	oKc/FPHzliL7OWWg6m24r8io34ATeu8Hf/Ieexenph2oLROrTTdtNjdjqOx98rNE
	Hsl5yLT7Yjt7L/NL9WsiE4UpZwmJ/Ri4Jjjw9kzX143VyCGNhm2GeE+c11IPpu3a
	DsxdPIcCTqFRWD5/1cGPJJCCFCGghkZGlV6Ev5jlzNWBYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkt54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:23:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so137174706d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534186; x=1792138986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iNcP9lIMFixukf9jSoJkK4cxlZP96poOCV/W1Al4rms=;
        b=Q5GK7RQoh6Be2GWVcYQnhFZv9BQGoawY/5lLmakWMn3rOR+o1fbBWlU6MtdB9j7CBb
         RFH3ckfTWHGat99xMBbYsmB9A4ggaSICLHyx9LlD7JCJ4OqDc9DrgEfvKRew8pAPbchj
         EXfZzOvj/3F8ycUzrqJj5zdRpGV1g22VLTJD/EY+T6e+3kkjwPKAmjB+l57c3wzneCVB
         Hq4jt+d14WzhBFsZrPx4MR3Lnqee6gedANOMqZDhxKPeUVa8jeJ/Re7LJlpAQ4Z/yKQR
         pviMckvIO8bcKhdADIKLBsXYLkfIxb6PNMCmUl581ol7LN+kBfh4oobG97rnwIT55Vlm
         3riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534186; x=1792138986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNcP9lIMFixukf9jSoJkK4cxlZP96poOCV/W1Al4rms=;
        b=N+MKmkW/1LEYlepqhF1CBIvB06Xf3rSCDa52V7q1IrPHSQu541Iz28X8ANIVwFhQlO
         tnC+SiEQ3kSFfFsTs1UwuzaU/45ta2tEIwAB/qQx0LKZFy7AwMQT9ieSagDVHW20rsQJ
         vbnB22c9AZ6ISNydDGE5ARAKzOxnXVN52d1YF4TC6jAn3Eg19DwySRQqSItRzvtnhXSF
         upER2sMZB9S8gzWJL/StOEcRO4IrWtj8ssqSv0hQCpRUgZvtIJB5BbS/1iqxJwper81H
         qjErU+NE9NFyhYUkg442s+nJNJr1uZIBEeTNMDiVrQyhkx6YhJ1nwKMv4JJ4T8+zmOpz
         n5cw==
X-Forwarded-Encrypted: i=1; AKwUvBy5W+D1ZXy1km/AmSK+80z9ub9B2dql2L26/G9tv4+S+3yIbjdRJt8c0pqPq5/oSBMSidl3yIvGwkgpFCY=@vger.kernel.org
X-Gm-Message-State: AFuF++k4EXyK7hbkhIxa8MEgqL/0lWiUtIThJVB65ElwxNnW0+Kd6zFg
	8LZPNveKiyyX00GM6p8DiIwg6oQrm/aPjonIXoyyG3hCBnb1Ru13Hc+YdAdFQE1VGeaUB/MYYz3
	77upSw7nSPaRwY9Ve1tLVygjh+833lhEs6yIeIyvUaAtXLK/LcRNucT4vaJH8Wh75ydE=
X-Gm-Gg: AYBFou1ScP/RF+rYB2F8MHdzrLoAK2fZcjH8ppawvovX0YVz19Kbq7A3hXlHcIwNjT+
	2VlLCH0896xCUoW5fo/PVqmT8WkTRDHtTKKcMxTLutFXMTtjVePSmW57qf12mFMRVguTlfIKJCE
	cdE+Cri65a2ys3iCSFJ9WzzkfA1uQvERi/KaAeFyoSOoXQ9eZVFqRvFEJvkR8EKFPyuSsqpNc4k
	0+fBFpdBEEqcKPaqz+rbSjeSsyuL75QQJAQRWWk+mHI85DNc+cZL2eu5s42dsUoh8gV9zK+kukq
	ClKglkeNnT6fHRd7YGUypAbJs53BusDlY18UCOAxglT6sBOS4cMXMBC8F8QWML0A/3p+tblArLp
	wRZwzFCpYY9wIBIce/2Q=
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr153056285a.42.1791534185536;
        Fri, 09 Oct 2026 01:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr153053585a.42.1791534185087;
        Fri, 09 Oct 2026 01:23:05 -0700 (PDT)
Received: from umbar.lan ([2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd783csm4527711fa.32.2026.10.09.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:23:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:23:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
        Junhao Xie <bigfoot@radxa.com>, dragon@radxa.com,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 2/4] drm/bridge: simple: add Chrontel CH7218A
Message-ID: <p34hqt4x5pthm5ailvwvde4le3ubhcsxsiixi4y4f3ma2qehrr@54mthvv3carp>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
X-Proofpoint-ORIG-GUID: -7eICpJCrP1bO0X3AkcoYiPJuSK7CypF
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac8a46a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=6mBZQueXRAtxK1RCuRwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX+1xXG3D+d5z9
 JoPKJJVg4i3tGPpLQ3ftxj8XL/OWpMrFptUvr9pubAD2HbO+bEGNPidrLNW2tIFNAlcDIxY7uFk
 6j+KDjYxmLIOpeQ4DtoldOZHw1C7m3w=
X-Proofpoint-GUID: -7eICpJCrP1bO0X3AkcoYiPJuSK7CypF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXzgTNom201MZs
 bX7Axw5xe2bEOVIsLnW3dYNiL6Es9SzZFB4r7lEmxiiTQVKieQgHSm8P1l+6E9kMcOUTrFUpFxJ
 muSqYBkK/uODHE9ITcj43xZF0k3pseb9VsNKr+jnPeubup2z4x8O6LWr4m7PqDBN15JzASeJDIs
 CJhnOhec1V3lQbup+aASiRb2aN5Z5I00ZraRCICNBshTBEh/50gzGyKeOgwisgXbvntZ2hImIw7
 RjENxfsPIvLfWUhjLdpWEJHe8hUhr60lSS4RrjJPRunq8ug9J4MUrpmczhTxt84ykM85+PnqBfG
 k2gu38sNX0EgNDwh6h1Gh8V5f1u1Li4liHjqDw2BZcnDkzTDUsoNQib0S/Q/26X9C929G/7VenE
 oRX+rM58d1KtOh0PrrgcVNgdK+D3VT+adkSYW/BcW4pDuCGTR5Hm/HcLk1LwVUw74iJmp+GM9Rs
 vOEWOxA0ZyOU9+ejd4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

On Fri, Oct 09, 2026 at 03:55:07PM +0800, Xilin Wu wrote:
> The Chrontel CH7218A automatically boots its embedded firmware and
> operates without host-side configuration.
> 
> Add the CH7218A to the simple bridge driver and expose its output as an
> HDMI Type-A connector.
> 
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
