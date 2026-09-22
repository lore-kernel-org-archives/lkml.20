Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6940A92F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109101; cv=none; b=RpAP2JndSLlYaSSW5CFUYfEfZXdA3KY8lSb6E/tToa5AZQJHcqxuP5uX41ZVTRVpAZcB0s/qjVOzPaxRUPN6FuBqv6RuTo2wwEgwyxAateV7gkGKkUpm9znhN7/aHLoMB38xc8gdEL21xa9KZ5K8eTdN8x3yDHFu/6YitlzxaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109101; c=relaxed/simple;
	bh=2SILvg0NRELw7Nyp8PHvnzfGtHVKPwkLNhQMISSJheE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRVLf/Ty89w0V2ESsY5Ngtg8bCZ9oerlu+AF2xw9IBB/MF/7nqjf1g5gdUi8HfSkVgavwNrWjVg6Pp5xPe8ZvOhfJyX6Vo+C7+DyjqzuU4Q8oeU8bKegtuA9CNs2/6qqvIYCALapA5rzFjdNLMDtzY+HKnLtnPXHpM0buLT8a/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MunD8rhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aqTgn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MunD8rhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aqTgn+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI80Rh767753
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SOdGFJHM+QY3bQbQemDVAYpt
	gztbGbVsScvPY9HEk50=; b=MunD8rhlSUsNocyd9LcmWUU/fdjKDNQZi3JSA/uS
	Mcp91FoVAlQPLsCNC8zYbmOSBlvVbp03jkwp9aMDlYiJtHIidZRtIjd6J/QZEZCu
	6VjLa8JUUGMdGERs4toWO/ptXkr5aXaidp25cBCKU6zHXcbgVI3qBIMc4YWcLq8Q
	atLCS3kNqg6Hu9WKINFaIdJfda7fc4mPtrECZF/n+5N7pIrnrPWS5jfXppFHHshB
	5k3d5akJKIQhi4Hwe9w4YlMefpyovbmy5/ClBBXzWNRWbu28GzRQlEeNFOzNnt9F
	8TS06L4gsxqPCfGTFVqlgm6W3EiYgKN/kNyLI7GNxq6I4A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqkfes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so100379137.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109080; x=1790713880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=E6aqTgn+C4ON8LM5Njs+KvJ99+mFGsXuLJZY+gNg35SNgNPIuGOxgCabiIH1Uo8ogH
         3cb1nKnLp3HqhSjB2ZaAzrfT7DkijrzDArSN+QG0zB8ixR2+1BACXWQwjCoE5oI1ni01
         2mbLXsSM7GP30yfszHjfCdD9Inxr3vKbTaIqoHwZ6iE4wezuWxQWIUpjYO5nuoRqCO70
         uWF6Rwuv8uj+UpaFOyqeidAXF29Xk6oRmRV6LVKZRS1Ph9Rq08cFobRApEltvreE10L9
         3zLB5gI++kxx4U3Li/I0wcc1fZ0FOATIJ1IEVr1J9U2C6sSk6ZobovJkZdo2oSSHoM2x
         4Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109080; x=1790713880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=G5wZtp4s5uEDAd2sUzTE8X+c450SSXQgOaFMrKp2X2U/Rkkw55KlGvp5So91dN150Z
         M52rS6VtTXvjFP55N+41g8L7oZlX2kdWdn+Zbw43I2GuYGuR4gAZUQZ9nLgS+5Lk+yvS
         0KFa1nyXaAvhvkquYiv7C8IulRkKz+8rrX4YY2biojGYQboYDR2DVnHkJtZF8xWhjK7i
         Lf7NOQpG4V+nQ3j+Uloav0PngQs/ArsSY+7JgD8R3UxVaIXJXTvT4uDcSppr9sOA8eeJ
         LqQbqpMzIjKzvDK8oyzautC6PqUpkp88gdubx0urEydjYRfUtSKsUUDzlPWs5VKdampj
         2ceg==
X-Forwarded-Encrypted: i=1; AKwUvByVZDHwKParftCJLknxkGo91y2Kp7fNHeUAnPxFV7YkH5Iaf9lyZ1X6zwbYwIq6YqJQ85T3J7riWY46PEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mXj0d8J6DmKfSgms+ReniQ+ikzqzgh5vjh+cYzIxwlIUd2Ln/t
	hDGqa10BaN5y61AK8fnrXb1jnaxhtQdT7coj+IGw36Xu3W2KpK0OGQ0YP1pFeLCAAL4UufoJC3A
	GO5OMG0ariWD95OY7uh0HUTvZpCv6EptF3ZuzWsPucDgOuYpazxqToXPKC96H+Hz8JNA=
X-Gm-Gg: AYBFou16esGJlqk34MP7fZy+rUSA1ZQDClIFclMb3kVwOKNDGl3AAyHBPHJARlUL/Kn
	VSKMCDgG18AsKFkxLE82eEG9CdNXd5zHfkWRhKOFIpiNNYFXxtQHOKkT/WmC7g3325RRn9vOIcB
	FOC+krVlX5pLLN+vOLLUFiJEs8QIoJ3++r4kyB01SZB4sTfBMg+3GgG+eD9E/r6+LnPEJKxthiW
	ocRp5EVt7YzyafSvjJhHe6MTCQF6aNvn5akEB+fHD7nuAn5C7QupVszq1UNNKXiqu+1c2V8Djtr
	0CxQsifLV2j44xWqtbxTcN47PSqujSb8u4al0Tevg69DRv/wl//lrKRDpIF7e3zcLASvF6WA4Vz
	Q4P/jMxlYCAsZYE+7U77102pGLA==
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630620137.11.1790109079863;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630541137.11.1790109079268;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm5738655e9.1.2026.09.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:31:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:31:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX6+0UHmAz1/O7
 abD9O8GRCMxIAmYSxqp5DEynTMWibScdxIOPlSTLKKZSoap0Le2eKscv2qub8yrmFwDUXz6YdoR
 IUA44VDqAreSIuAvYRmZelrPOcDs96kCsE+kfQX/dtQyFQUi0zDZssDFLj8pdI/GuBhRYja7/sx
 I0o7GsrLmeYY1vtfoXwLD/Xw6/K0kWu4+bHN0h9m+hLczt+s5G5O1wQ+Qg5JZ6wWz+MgQmSVcH0
 EKOCfhbnh5+eOSPI+DmC0kIID3E3wIBwR8DoIw8qw2pN6C2f1qGLe4P5WGt2g2HyUDFJbxelXBY
 +0fru2asv7wDDD3PD9baNvGTUR2SvXMIdpO+XavTDfHhG6528Nz5fRDM9QHWqCdNVPCPhVEl4E2
 ksAvqS0RbOIVbMrX0RTeUl2chrXSU8qjlYeXNhfKQoMT/LRyf5JFaw7GE7EPtign9DhM2QW5UeI
 wP1CbePE2u53jrn5Ggw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2e598 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=B_ILVBOIu_Z04Xi5GswA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 7gGb6NVFvkx6KVP8K0s3RHX03Ob1fbJD
X-Proofpoint-GUID: 7gGb6NVFvkx6KVP8K0s3RHX03Ob1fbJD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX/8sV/W9WE1lO
 w6WOOmM/Nnd594DjgfU6aeTXtZwzMYGNgZyPu/p9CqYrmQhZADxAo9O4i/cjVvyWxyYc9GTCd+K
 gW3UhMhTQeuqduskd2DpMIDhkTjXMeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 11:33:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> index 40433dc2d6cf..d3356fcd25f0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -670,8 +670,19 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	/* EC subdevice @ 0x5b */

So what is on this address then ?

Anyway, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
