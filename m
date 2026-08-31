Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1853603DD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194466; cv=none; b=poedxFZu1dC2aUqXQOSPeGtWMrWS2FtbVBIIeGa8xpVX4+ZH4vvVlN63ps1RL/rieZEO4VCrcYRwKPdcz9gVdtiySrPMzrydkR/AdEZKz68HBUDbYXwlat/8g98HEu28Im+WXP9syhf3uUjrvzJ5xyzc7M8nsyAc32+431wK/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194466; c=relaxed/simple;
	bh=HET/5PBzK3ZI9Xb5d0By242IOl2Ez7CPljB2CT6ZvfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqqqWcuKCqdViTMVd9Tnv3YbpSUQ3rRNOSk1zigycCWM3IbwVnOhghpi/5Ek45sdx6beDoqnnMTtB96VowZgS6pMv3oXiJ+tc8kfN3gdNx2Y/WgAZD7M9Yu2XMcclLfutP3yHymwfhRMKoScksl0701EzwiVI0edSzzf1l4GVOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUgEG5zH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcZybo9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUgEG5zH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcZybo9L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq1OB2900861
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XCYPqQA2/de/ZdEUTzkwaR/TQwoMx1WEwb0RhWlBhc=; b=aUgEG5zH1OMt8PXk
	zvjhjP7vjmiyD9mOykEvoqf9abH6aYPyPVOGusQXFU6DHcWRcHahgEmYcOFxt/Sz
	iY4RWuZn/lhHvtDucofwfQ8j2mdeFETnPB/vZoxYMUtRYokPFTrso0l6YrDT0c6v
	qedfXKgH/sN15iVb+GZOcmS1Ik7x48hY+6a3tikokcsclnjX/nUwGKLlULPqKBsu
	g4lOALTfH94eDXh7qXqBGoQncz7pIBpysmvo6goxq02X9LeGHgEEeQiw69MyQrrl
	C8QjsUgrwxCWJ13Zwe8RRnvuZD86yCE8Ij40yEfMCDjZ3c206qDCAoF/DX3wGKEj
	hAJOng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahwav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:41:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so72628785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194463; x=1788799263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XCYPqQA2/de/ZdEUTzkwaR/TQwoMx1WEwb0RhWlBhc=;
        b=NcZybo9LKmCSF4ZV3S4hEVkuCnhgTkd+UB0NPvhm94V4rjMvaLqm1W9XhqubZXyE+8
         3Qaiwp6AiOCDS5D8nKBzJZLkEeTJGFhd+LOrbni8fQXAD+UtleB01YOKrSJgtulyf31F
         y7VfZFdpaeJ1Z+pSdfFdOQLZcgniiYmaATo5xS7M7vvKz1fXDkACt31g2kTVRHSIGbZU
         Y2psr3T4AphYQmFsi2OoftxHjiTIkRnT+rOc27j6PjKuqnNtociF89emGXI0W4nb75k+
         HKfQZqr87YeJduemkdT+paDPq8qqasbfNc9WW9MMuDRCdS5PXa8gBUnvooYsHcHJa+uf
         gecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194463; x=1788799263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XCYPqQA2/de/ZdEUTzkwaR/TQwoMx1WEwb0RhWlBhc=;
        b=fEob8irZYLotvMjomYcrXiaHfYL6cCGY6tOQpXzXA5ISEo9Dy1AXA62IBqMgkDbjew
         ocuWiSO4DQPjq+P49DSQEBCZoioo1JB04eCyXxfLxioy3fH+WuQBzq9WGHetKQ7HOAWD
         nBnm76GvU2eJbwxqWtVp0eIsyduj6vxIPdj9exuee+l98ltXw9rvfYBzblPBjO+3tgyy
         V/nwqGfmUzJbCyEQGJpLsY/sPcZgiiNQpc7uUZUI6TrgmzeGpyA3PTo81HFa2pc2MtSZ
         aKa+ZuiXPcuFhtadMm/c27z+YpnhVwrLWyMCyzqJhjQNrvBvXkMluhURYhnlNbqp2hMc
         mnpg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz7zFd5a7FIRyD3FedkxUtb9EuAUYTiqf5ZGAXpIpbJVEwiqImC+eaKFVP2Pxr4EKMGWf/0dTEMICMUtI=@vger.kernel.org
X-Gm-Message-State: AFuF++kcV4yRGmYp7WZlZ8uHcdY6i8LCErFsl3HyoKPlmT9IwKSPBy1M
	pPNuoL7ta5l8wLmVySslgeZNCxqvQPo5FOzfPw8f3RP2mTznNdTTLgrXAt9Xigb++UKfbWqDwQ4
	Oj5zr4ze5rU79psJoXk9MrrunKNdITzpXnMBV82AsPRhsrwIZ+SqT6s9AeJJIp+F95p0=
X-Gm-Gg: AR+sD11LNApjqqmwVXfBbU8Hi+sVnakmVIPxmBj0dER6CP2ighAG4UljnqOfC+0+CUQ
	HsnRskYo1FbjhnK73owBrNPUcGcylRY40FDZ7Zqbuwux3WSiljglNu+ZUILM/ePl5VEm4cdzd4H
	FMP9GO0SSDT6g6oQR/uyAtsA7roCR+5lNCseEfAbhF/CpC+6IwDrafoijucH7Na3t8W0h/5Ib59
	2zRYkoE3JZHJPVp0xhb014HBc06WUzdxBkKuDqyqC6Xhp4qOVFG5QVxmyNQoPNQt07GboJQ7+v9
	vdwOvn/Jd9cZfG2bh50la8FaIknMp607wpN2Y2ID/5/3VKXnzxO26tqZKsZvn5lw/LcBOy8Krij
	gH/ss4fVfS3FH50prMLC4gA==
X-Received: by 2002:a05:620a:90c5:20b0:939:48c8:656 with SMTP id af79cd13be357-93948c81290mr128478485a.1.1788194462749;
        Mon, 31 Aug 2026 09:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:90c5:20b0:939:48c8:656 with SMTP id af79cd13be357-93948c81290mr128474585a.1.1788194462308;
        Mon, 31 Aug 2026 09:41:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2563c74bd8sm432590166b.40.2026.08.31.09.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:41:01 -0700 (PDT)
Message-ID: <c1d13f41-e29e-41ee-b02a-b38013e4e7f2@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:40:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 07/12] drm/msm/hdmi: Split PHY init from
 power up
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX+NIcne0H8zNP
 3IQTJAbcnBXcl/WCW5SGtF4KWExtGfkv1UwEc7TDpMir1arVTfAlIn5okEy3ahivv4mhNsA9RVQ
 euHmYy4o41L8+2cG0DvT7VfiXUILYFoD6vbx0htEWFBmeXlBh2Uow2QIKyi750fD6YpXv0uEFm9
 xZX+qrG/thvSHBjESl4FrmHM5GdIbomIFKOplACHnnP6IPmyZU0utTrsWELGNbzYIrSVdTwnHxe
 WfTvvkRcjoWGJzYiReTgzHLrp8/kOwhQy+CcaMN1N40DzXu3jeYSaTixR60581ekTfTC76y+6fu
 TB5kXdYXkf8Kx6A/C9zS83OR0DKnmUCaDwMsdXN/vmeOfCAmq1tne4q8yQXFjKyDgCz05YK3fX+
 ZrG3xt6wqy+OOwsW/AYHDE0pmL5g/y4C++Rs017iTuYqmWMYEI0D9Dbbd7+2NZiY+oBDujJWD+R
 EGH6BxpLyTMLpBqtWBw==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95aea0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=nbnyxt4j9IoekFAbjR0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfXwqfjoneXur++
 6gCiuNjAsHctuJ1edR87Rd2d1MwZWzBQryrJFJvUCIXS/pUs5foTr5IKywDX7Z9zcTEYomzs7Ci
 1jbUDs9Y7S21oQoITaONCZcNU2TKE0E=
X-Proofpoint-GUID: _cNbw-s4fdbRHolBSvP1S6UGydfmLemg
X-Proofpoint-ORIG-GUID: _cNbw-s4fdbRHolBSvP1S6UGydfmLemg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Future Eliza SoC HDMI PHY and HDMI block require certain clock
> operations, like reparenting pixclok to HDMI PHY PLL, once PHY is
> initialized.  Similarly to what is happening on Qualcomm MSM DSI blocks
> since SM8750.

[...]

>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
> +{
> +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> +	struct hdmi *hdmi = hdmi_bridge->hdmi;
> +
> +	pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +}

I know the caller is void and it's existing behavior, but we
should definitely not continue if this fails

Konrad
