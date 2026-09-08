Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AFF364950
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854537; cv=none; b=OjHY95fIxlkAYuCrtwrrrUjlhSISJgSW5roFAmiVLISdmm9dhYyn0/GfWVEUlhs5UUURPnvNIw0NaGngmdfbsoBcyILEnwdRPqUXkIjpPPdHOWcecfjU1UDOvL71RiJOuJAuDuMO03VNRS6zUlg0Dkpqq7W0IXt6hgcjoy4GL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854537; c=relaxed/simple;
	bh=SBgXFYdNYEUPVWubdVb9unTaNhEgBh6xGV7DWi4TnQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+yi5w0VkiqeCafSqO++u0GmHCzV5uDOQKsXQclS1OUJ54nPve+YyksYt7y6+z6ADpPkOHj8c5meFB4q85DFNgN1tUZXAhTqpHb4WA66e5hqPcKFhUSccT38I9TNM9z/5Q8MTvNphYKBwcVmM5vZ1TR+w9tQYihDa+at8rjwOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arIuAESW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXI7+1KO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arIuAESW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXI7+1KO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9W41521747
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=; b=arIuAESWcUWwrGI2
	pjqkoOyJNILtKK2cq6jHIw1appcqCWGaIrfPiN9hHaHs8t++cmtKy3CztvswBNVD
	t/6GjjGovrE5VKW00dJhb7Di5oG4pOLrSRwr8G6SqWWHV1FuFCfZmy4YkB9ya1+K
	ocMxPyWERANVyf/04rKh2xg5jPmZiBXA5WaefWlk1WEX21EhXsYBQ3zNmjkhImXz
	/7lfYFr6uGGQjS4gm+sKQ6MLV5ExzzAtYG7G/n3z9v55eWrDxNxZ/2IDzXUQUCDa
	O6gJ401SKTb7APWF/bnEwrDYZif3Ao/9o7AHNWUmW0JvheanXxCTexjM44ZEqwbO
	cpWkFQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jp04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:02:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7868c30d4e0so59078137.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854534; x=1789459334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=;
        b=ZXI7+1KOnex1vLq3oiTv+pwnS1arKhYcdBlEO9ktZHE6iIo6tSvOMFLZeT8feAMV7Q
         0vHutoax6xqfJQ6zYPJNoHe5u0z73dpc5xuqLwqe3gnhA5PLoAcnBZbbCPlstNpuVuNG
         2x6nuk2CMwElwJ2LNcvnJKrWg3mBzorMexyOdP8UWYNqmU1zobZyOxDthjR2ZlPlmWFt
         yC8SUShCqI5IEbg49qKmPa+7/H11ukYUWkrHGd0rDTqtR+fjUnE1DGiN1Cet8MkvRHjV
         0r3MGQuX5OftvJfyQtBHg+kCWKc9bDn+t+Z6Cpcc699pP71BqpI1rhepjSSBTyuoub36
         lPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854534; x=1789459334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=;
        b=SCWLhOmDSxj0Rm9eHQJQB5JKvjkoEB9N0l/bYPazDyTM7mS/ahTvEbYp8tQ7xyxva0
         9uuLxjq4UN6vo9RL2WXpEvKIraxv04jSbx3l9ZJKuEdc47h9b25jrmogaW2yn8Yhnxvg
         nM8jf0IylfbJ/Q9/8EUGimJZ4coY2szlxO+LpTRCDBNMdbRnwZVyb9d5nyfOqHt4DxmU
         EBAUgPj8Z4iYY4V3NwGoprX0fgm7QWwfQQHNHWFGeofV9ENeqglB6b4ZjBq9HENhvAOC
         OXk4S8nW/7520vVIJpeHYZCGCwK6aFq/bMXqnVzALJ7Sy7ilOaF7DIuQwcA4glsConNG
         QZyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6So7LFbTq62ygmJh37JnF7AAyXFHxC9oC4nZqaNkPx3CJsd34NhidcmycEzb7axerKm5P2Yb6DrrD0Wg=@vger.kernel.org
X-Gm-Message-State: AFuF++l415xsawiiwCIBAu60P7hEfJdnmt1fRq20/aZhn/pea6nfpbOa
	OAqyNiMTGe9gRoiTSw6UOG2ShGt9KG73RYH/kp+rFbYFQ79ebGi0qKXDQskMwx79n2Xwr3r0yvn
	2DV4K7mPbEQ4qYEnxBR42KcyZiXroaZhApjWEg42In7XoOVZu2GiWtRS6WS3eZh+rB3Q=
X-Gm-Gg: AYBFou3sDoDKE8rayqgzCsGqF1DkSyZHaTvyM7GknbN4waGl6qdLr9htDFQFahAV7Bn
	xgodKkt88IRGpezqgbGLpuMDosnpgCtW9jMS0nN4QkfMNzWnnAUZT/RB9C5hAIcrg27+1gxVdCE
	X4cgmHyAJ3smllc0msvfNEfk7heUk6qvo3L6WSiVXFS2cyr7sP10HYFGlBsxWUwv4qUoB4hATsO
	k9joN6di6XjrlKUM/bFxP9MMAN4AM1KZ4xDfwhISByzACzRzB2yJXfeKGEylLpMifJYxz9xlMjE
	spMIiUf9gl8tAU/5JCfwKXtsL3OxQRuYq5vhaogXMqjYq2AOocRf6ZLqD3a1l9r88Dh219S0N02
	/ZWms9qsYYJcOWxpIGsEx0Q==
X-Received: by 2002:a05:6102:b03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-78a60e5b62amr2664034137.2.1788854533913;
        Tue, 08 Sep 2026 01:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-78a60e5b62amr2664022137.2.1788854533373;
        Tue, 08 Sep 2026 01:02:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d559364sm565451966b.35.2026.09.08.01.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:02:12 -0700 (PDT)
Message-ID: <06bb2b19-bdb0-4dcc-a6e2-6805edd9084e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-1-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-1-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX3haGd3CQTv8f
 esI4AippmnBjf3z9DsxvfcytgpbMXF0+QyNJV0QJ2a5gi77tOKSimxZJXtc3crasNsiMA2hgl4o
 VmwbqoT5dS0g7rbXe5TzjBsYS0o2GTvSpu+YRub7Vycy87rm7w7OTEiMRzpY1eNaFZW3eefN7X5
 3CgBPptiG7BoIboBivvBYJ+jZqfvAbMXkbmDzz+APW2/khP3m+uLu7IWT/aam2ooAnMQ87fzx66
 kFvB7IguxWHeRJdqqnZRtJ2bVn1ZqYaQ5ThCmQE12N9wFAQi03iSCEY7AG1pRTNC9T4k1Msp19E
 nZTs5gwmTHgwNuaQgaRcMGHvrqstCvo1a+tXMxsrGROqRbCm5FxYUBOhg+1Eydg6AdOV0zJpNd3
 YuVpnKNEKTBsW+784ygIfnObNH4/yjgcBfuAgBxgcwNSX2Ligx/deoE+ukMmyyB9kKQFmyQmlLA
 gdWuYTVjSF9392Dvj7Q==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc106 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dCp4QOuT8fr3gmi_UlEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: _mloPKWKryophD5Z2vU5ov0NdenTQJrd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX+iKApvbT81Km
 ouY76jN2f/8X5TweTQhSn1JRochtbijhuUO0aJACi/N5E+FZyXeSKjJLaOcJpQVDsMiXnPTB7uD
 DebJpoEgXFx6eyGNGHTOZNHxCY/oyzU=
X-Proofpoint-GUID: _mloPKWKryophD5Z2vU5ov0NdenTQJrd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index eb1088755cb3..15e37596bdb1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>  	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
> -		return ret;
> +		goto err_pm_put;

If you're a fan, there's PM_RUNTIME_ACQUIRE_xxx in cleanup.h

Konrad
