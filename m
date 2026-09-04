Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79A3414DF6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502197; cv=none; b=q3/LfK78oFEK6H1bHVL2NeM16CzpiSf1QopmO9ZiIQpC2FYnHrk3Nfa9j54pT9DmfGk6YPVtz7XnrPmjIPZSMxwZs1Qu384W7owi4SuN17AQauNql2UCOD3zzUksRqHhcCeaY2LP5lzrvpjYk1G/axxD/EiFT0ncwlfGtAXeook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502197; c=relaxed/simple;
	bh=6i1H7/7wQUtpbrY5xzX/0W4P8TBzBKtLRiVT/SoT7ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6IW8QFveEOwlVDAMg++0iJvLmK2MpeEqdyv+VcNV4Qhx1w6HMFlQZ+AenoZIoYMXFXEAMXGCXHHN0icpvrF0wc5B1OY6qIldR//rZlztu5c10+/qWRdW0EDcZSgPQbR9V1f0yKlmwz8sVzI93B9IDPUD8NQQU57vSTeLkkrDHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ0VNFv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a09VwbJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ0VNFv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a09VwbJS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462k8I2886656
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 06:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=; b=AJ0VNFv1xDVDBSVz
	KoJgiGxblWZQ+uOGSLDeYQVFq2t7yCAGXUj+JrgF7dNtbZDzKoae0nCEEahBXe2w
	500aUGcmg+LO3TM4dk2PXc+4kwAsa7yLQkTIp8o3ezwYQc5/MY6yADr7c0coirIq
	eb/63gLiiFUK47FHiWw5AbJWsdb7X5O3V2gtyXt6eSJIHutneQ7v0ytvPZYfJh3P
	/e96YI1wiXkogsbivyr9UUs7T4yv29wZHooCp4irattsRDS9a/DCyq35ZcniqV4q
	pjeDbA+B5jxlE1R3XeF16anijzr0BYV6aV+APFWInfuJBmNXIQIFU5uj1HKMsgK2
	IhjPlw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp780eps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:09:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so922737a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788502194; x=1789106994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=a09VwbJSpxWqNoGZu/bBtNKK38qIMIMuuQAfofT+fCulQO+EMY1LuUgTrOVn+iw2lX
         ggD+9VgQRMIinkI+IBM4fTHt52Yx1LpDcrO5K2dpg29WYYfIxGJ6726tNljNK0YHEjfs
         NYAbouzTuTZDCgq5dme+klnZMcCSroYR3twAQFjPv0xfCpNJH4gfgxCMuG/aW4IpYR/h
         ib3Ln5LwFSHZsuVAOHzayOUZfkwiW+8AgSiOhAYhlN0gTzF5B+m/kXCmMH+h2YoktjJG
         xWkaeOKlVtR+Z9mWFPbeN+DLSpbPERu5BynBjgo2/VD2jcYB0Ckd9ISmMTwBiY86RhNQ
         3nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502194; x=1789106994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=iD5NFdkWLtDbbdi6wdQmSznVCZmy0mG3qJJ/yOalUXJAluPFxqphqwfemTI1PNfr0p
         dEypMcJXf2pCoBGJERK8hdQEQWI9p4Sr//rzaK+AS/00Lbc1hu721u6ZP3KxFKqJ1XVX
         ix38FEHd0BYMzOg7SD4f0YgGLgfXrU/BUDE+oqtWWqTDMjMsLy3zT00by3ssFuXKphA+
         L+ob+jEasKIhDufjzadxK+c61/NDA/AQe8fwHeKoTO8Frr0gE8pl+IcWXX8gPRFtT+3G
         0CEh+wQvdUz55cs54ZxDtSLoblXYrAxwZUs92Ok0aWkQauuYYSJI8ttGktpCNr1oBW63
         kMDg==
X-Forwarded-Encrypted: i=1; AKwUvBwLQFpYC1huTeE8MVvPskZ5CsnXE1WAzRKIolE2g9W4op5Z/W4c3DYHsw18wNxtvjSYJ7dzmX67kzPwQEY=@vger.kernel.org
X-Gm-Message-State: AFuF++kNeYIRscNWY4cNcadu2dXSmNUJAJTqHlQWLR1oUdY6/66VeBYt
	lNdjzqAZJITbZJXsx8eH3MHsqi5q7EZe38a2TrowACWDKGqyxDBC1a2Qvn80lCuZC/W+roJL/h6
	4vl3s3DZNVwuNfB17M+Y0Ym2fdgwdUTsh8ZLxhL7M7OK0yzi+zmIdQxN86nnItJQpzUc=
X-Gm-Gg: AYBFou2KwDN29FjfZCddjE5x+BZzpbo56d66rFsnaumHTDBOn8gnLac5DhAInDnYo/k
	OmEI38FEpONibf08H+4cYkiqP2CxZ17nBnJMwZfYZF6GAc5pqR818RZbhwsSoQkWc8SAw5YBKIf
	ujOCnXXqmi/hR5cM1jHu6V3kHjYEyZdT8dra+y3PnLA+kHeyPEpxKN+7Qj6RcW+RgCXHS3g/bld
	djeH+Hh3BVHrtb2gadIna9Xo6x05z9E9IiFXCQ7Oohn7ldKMM8HotAMwhfneff0L0cvvf6AjpDk
	ejGq5/Fm9kFfBV27gv/NFzQzKbkk32/eL3BDY5z7DdSRQxCmCUQICzaz6Xc8hdNXhLw+0XbS29Q
	T+fFV8pJ8jw6ZlpX7vFoe/fd62mb94TQUU6PaVqNjA8+HfjHWW/yDXhZaqCtsfNkcIPnY
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332349a91.22.1788502193742;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332268a91.22.1788502193296;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.244.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm8911619a91.10.2026.09.03.23.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 23:09:52 -0700 (PDT)
Message-ID: <fd9f1fac-e4e7-453e-a830-a32e8be2f965@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:39:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX2fc75IuAaBUC
 Pqi/Yvpvn9ksQqIw1P9dsSTJr61n9yMEZRcytHQJuGeTSiHPeHPImuDPBNSa9nR0rVdi29rjXqL
 0DeGI8D8rue+wfVIIXIvkW1ST37XOYU=
X-Proofpoint-ORIG-GUID: 490zi00IJjReKRBUvTqFo2QQKeAXfFsX
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9a60b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=oP200lxkGh9fc4MeAAR85Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UW7aF9AyQ5xqPRIsElAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 490zi00IJjReKRBUvTqFo2QQKeAXfFsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX4BhzMOHinlvl
 DbZxDK045YoE6Syk8jiia+k7P4izV0YtSw3XRnW8HJsS7s3UHhQhIaa8Sht6h9YKvr1P8cYCWDp
 5SdyFn9fdnawuDEnAEKMY9YzN3VMi5rSBUAJkuaQE5XhTLxfgwv7o5SwzdKVrvLNPLRRy4bUQFh
 8uC2MIIRuApm1B2APbhJ9bogEaRVFquwQ5krSuwvZJgytYgAmXOpx6sfiFAP7Z3aOkno+AXCVrD
 2nu3FfhPMAICGUfhh1KuPvBMbn9jvX8Xp3sw7XEhTx/tDFqqLcrM/hKg2ZO8q1rkwBHzeQwgdzP
 VqnI+CtvppAdcA2Nfs8YqDQjNQX+Hgqn/E7fDXFQLoo4Wwq4y/eX+c+diKgdArcoDNTw+2vcTLF
 3ZwoEeGITlZruewtu0JvMCdQKAMtRZitvYuy9RCNru8rf7xY7GVTcoe0hlDP7NjzpKaNsnhhpWK
 bsqgoIxKF8d75QUp8tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040055



On 9/3/2026 9:08 PM, Faisal Hassan wrote:
> On platforms where the USB controller loses power during system
> suspend, like SA8255P, resume triggers a Host Controller Error
> requiring full reinitialization.
> 
> The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
> but dwc3 previously lacked platform-specific quirk configuration.
> Add a device property "xhci-reset-on-resume" that enables this
> quirk for controllers needing complete reinitialization after
> power loss during suspend.
> 
> Let dwc3 manage the quirk for the usb controller using
> software properties.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/core.c | 4 ++++
>   drivers/usb/dwc3/core.h | 5 +++++
>   drivers/usb/dwc3/host.c | 5 ++++-
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c59..eb6ffd5148a7 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1712,6 +1712,10 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
>   					       &gsbuscfg0_reqinfo);
>   		if (!ret)
>   			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
> +
> +		if (!dwc->xhci_reset_on_resume &&
> +		    device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
> +			dwc->xhci_reset_on_resume = true;
>   	}

xHCI plat does look for properties in xhci device node as well as the 
ones above it in the parent chain:

"
	/* Iterate over all parent nodes for finding quirks */
	for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
"

So adding device_add_software_node in dwc3_qcom must be sufficient.

Regards,
Krishna,
