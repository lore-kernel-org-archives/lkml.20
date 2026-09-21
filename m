Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3D471428
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982860; cv=none; b=hGgnjEDWYp3sWVhxTpDIkxllMlnvNm+mWeBbWMQ0g0JH2h5SLYioOmH6hw44ECvLS1B1sc1JkpoGBo4pA4k8982ASllkpDxB8JCGzSmm3Khc3m8sXqSgEfOfUai3oHW18b+eSyFXgSiD5TKcSLDypf4dYrtaXLLRq7/4Ef9uwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982860; c=relaxed/simple;
	bh=N7Bwiz8vNzShNEWWo1hbEjNmyTi8IpUXmCv1WVc77gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZ2SO+6ek/wf5fRo2kU6mYQwShoYOIOh2b2uBCyinqoFAEMfET5wX+uz0n7TzrjXASjf7hIjAv/gYz7BEyJhsUhs5XHwmGC9Tal1stmMxdxB3DXElA9zegXYA6qF43dOo4ew2NBRfDw5PAEpOWDN0OoeYn/bD+M8zYLMBImGa9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emtK+myv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPFTvmwg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emtK+myv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPFTvmwg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84QmW4134832
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=; b=emtK+myv3usdP24s
	OllM6ZLLActmbGIWq2Dsd3DlQZsIk+9Zg4RY+DSIH1KzrEkwP0XtH1p2heGqZwlv
	hpc0RnbFu7RCi2ETWJIXuctcgK2Y9r1NcaK6fb4kUTiH5fGyFpBZEQeJdzgz7Uou
	sCI2F8YJlEVkRJwCU3vUrIZx52YSEZhasX+1wJc0lrLUpku7pDP6CmtETVcFeWac
	CPPIuKYW2Q8NlxkjUPZ35ukMIJLzOZEfcwfyrWotYX/6/ve7VXvENjXPXqkbMYvX
	RvgdTpNzG8kv2GO8wTM/Fn+2qFVYzv6Pf0mD0kfr1EvKeaqb4RsRoiv0GKZ/8/w/
	7ocMAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0bu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so83249185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982857; x=1790587657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=JPFTvmwgPbAmq/ddV9qE6qiw/GTc4AkFv+KR/iLmZNC19sBEwUSBVmaO749ZL/xg+k
         8NYI9cAoMk6ZcuKSToRn8gfja7UgaWHla3Lt4PU3egU0yCVLRklMKOH2umeeEF1El7PV
         7E4acvbTTIEqEUOf0yDsiYMV/NZ8sFLslnE43ksnxc2ixA/FXGKwBKUSc46M7Ek61hyP
         HpCJJs5MHeW8OYyFQFENdYEomzHw+jo4aGxYloD2D9QOtdO/vczCzjEIa8Eb7K0pdex6
         DODiOjeGhLzBnK6Yy08alJYBpkc9JZ31Kt07NVmiv6h609ATga+a2/f/9HBNmB2CYXSh
         ATew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982857; x=1790587657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=eiIGrgJwg0D6nxAahjOJ8vBtFMdJsFMWeex6H93LCJTZTBFMfAdBLT7JZf/OPhvI/O
         1UD3RaKkIAMTIsXV3bWK3YzEaii/8TI97V2Pg47l+sbn/WcmhhfirRFwhv03gob7kaTR
         QaOe4pdbMY6ypfJQ65CC1UoiJFJJn/prdKq6PpguZ0WAVO3gFSF7HIYevjkM4UYZNzbT
         jg41TpI4KZBkrHALPb1Y7NUU+GGfcGtx0E0zINwLQ3JybrAfgut2suqMWDdKysDUKScz
         uff8jjw8DO1M/u3OIFFL8J2nw6AVk1IWFIkYWv7SPXXxX//8CTT69fCcmAbZ38RSKK2J
         WBJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGTpIaVHcS6u/8CmIX8atrW3uCRq/fwj2PGp1GJvNJJbVappCOpi4DEk13GpV8LkMM3m8nF7JqL/st2Xw=@vger.kernel.org
X-Gm-Message-State: AFuF++l7AOwQEzceV8Z847Q3Hhcei6GXVS/fDp/anq0yAe+HgkmHFArh
	X5dzLhz6TaoRLxW5jJ4W3RqA15STVQ3xuPpHkxL3W/z1rj4Sq1Om3ujXTr3CFYXhnjRrh8Pv3gh
	JcNuiSdBxDWaHTTXhCzQGn3pTdI26SzkAMpeSPAondNkpUnSYaUlzWCIn9igvbjXAEw8=
X-Gm-Gg: AYBFou3Uz5NnltbP22JMqXk1CjhPn9CHVfcBixZ8nH+IQxXNVMwXTUYE+VcWGbDGH3V
	M2XO0Y+sCopTHacsmEZhNRjbEjsYzixo0Kn3sdax1//6g/Kn5izbaMME5UmZjVfkIT+4mSRJfXe
	Zwa5OCesN/iX+r+4mJV+ES+wFv3a+w6IkCR7T/gHGf05tRXFD5j5XylOGi8TTNtPpfFgy2SjZof
	Po0ypw3eyrKvS/L+EQaC1+k4e3mxkWG7w2lK6yogAuXKumRcOLWE57hatsZpzN0PZxuMg47PiuH
	jAxjXP9+aL5OB8eBcIkl4Ij0XIH7Y/tbjMuOV3GAHBGjTpkOg4r2oxrdBVBXRAEUPs8EiaJFNOu
	VK6CkubBQJcp7p6m6NnKGHQ==
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981020885a.3.1789982857295;
        Mon, 21 Sep 2026 02:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981018285a.3.1789982856852;
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3573ce12sm276656166b.35.2026.09.21.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Message-ID: <989c8883-c481-4132-b6ca-3a333aa0788a@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] backlight: qcom-wled: Fix NULL pointer dereference
 in PM callbacks
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
        stable@vger.kernel.org
References: <20260914-qcom-wled-backlight-v3-0-d69fe9843841@ixit.cz>
 <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX/3ujfLgkU/Is
 pGm3M+f6ZDKBE8k5hUf8RT/kJA9pVoxaYEkgeR+A+rhANitzl42Dcz8Y2tFKYdicadVqplBtGEO
 oKOtmG4DpoMZw9PIdFSBDCyz53FIl80=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0f889 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=WGO8Zn8UdcYOddqErpsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zloapH6-5iHcdoPww16wekTw9dHUGB_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX11Ya8fgLfC+n
 Rw1ODOT8iew8qxKFou5XbxN3KzdyrAeVqe8JWxJPN5uPWrIIXY4USPUSv6k9XYYGot4zkuPmIS5
 XcgecWmrabVFIWy2LvaCGXbzNdoXX8iTdHA7r4TWt25XHScY2Jxk6/UQNNDPCfIfi25SaXn4FH5
 yhYn3Vx80/j3giAc47cPtL1xpyx/IvdySurusyEInR4nsH86uBIgMY4XKNCGZrnLKTQjORQxMtP
 VprkBq/m29cjTuSScvUK4fI35FYs6m3Cx7si5e1zeiqyn21s4Be/GNJRfWuunBx0u2GeL5hoKqj
 iV29x5rG1cR5dccia/e3f+qztEkelf2PS/ZPrl9lWTQ8EBJk77Rg6J7iwIzMcBnzovOX/FWTKEo
 QXry0HzuBYol8lx3AKZJ0RAS/+8+JU56BHMh5WciBnQuskzhbAApXrFoQ+O4CPGWWj0JKq5FHQt
 abaEVPl9wKXl2/j9mLA==
X-Proofpoint-ORIG-GUID: zloapH6-5iHcdoPww16wekTw9dHUGB_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210135

On 9/14/26 8:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_probe() doesn't set the driver data for the platform device.
> As a result, dev_get_drvdata() in wled_remove() will return NULL,
> leading to a NULL pointer dereference afterward.
> 
> Set the platform device driver data in wled_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 650dd95f06ef5..a76158a298335 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1747,16 +1747,17 @@ static int wled_probe(struct platform_device *pdev)
>  
>  	memset(&props, 0, sizeof(struct backlight_properties));
>  	props.type = BACKLIGHT_RAW;
>  	props.brightness = val;
>  	props.max_brightness = wled->max_brightness;
>  	bl = devm_backlight_device_register(&pdev->dev, wled->name,
>  					    &pdev->dev, wled,
>  					    &wled_ops, &props);
> +	platform_set_drvdata(pdev, bl);

This does make the pointer non-null, but it stores the wrong object

Konrad

>  	return PTR_ERR_OR_ZERO(bl);
>  };
>  
>  static void wled_remove(struct platform_device *pdev)
>  {
>  	struct wled *wled = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&wled->lock);
> 
