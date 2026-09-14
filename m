Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD3258EF9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347039; cv=none; b=tyQV4KhyBFIoFR4IbqfGcobd1NP/PzlK4Sx/Pem+rByyu1EFj89ST2voNTlxnUR97g09uSUvKx86sQz+uxBGoHvDVuXlIh/CUqlblsVs1ZMej/rqwJ6yIIdUg+azxepHMu1M3rUyZHHbTxeDEndLEPS9G3II28aH7J7OWjXZN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347039; c=relaxed/simple;
	bh=BhhLq0kAUoP6SjkHOa6ihyiJTZuMj7B+uI7Zc5zJhAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9nc2Pozy9qypoyka8JApKQxSq6m4yMH11kg9U8DrHwyr0HjNZ1r8ihaznpGeFPWwjP+41RY1WitIO3aD2ZmLF/hV5ZCY62ABfUKqtj7etsqhElR5LQYG5n1rDSISJXekz5r1Z8qrdM/c88GvJdUKDrtEpQIzbxutLz8py5Mwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rpu4QKXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBep13df; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rpu4QKXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBep13df"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Vag3131699
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asdURPVQzX5whnoLxzBXSnq5
	avohb5NjScAZbrvWiNA=; b=Rpu4QKXY3gQNBMg6lx6rZ31xdK55mimRsuaSryd/
	hQZtTAddl61kn8ty1TCk2sFiFblA567q3CEv1wsb25QIcMqPUQ0+3DJb7sHQ+yfc
	UIiBaTzcXMvrrG7RQr23P+togK4Koyb+GqPm+g0pWZxXjDYhMI+EJFMg8CHJy8IB
	GrLAAFa6zPLb7zTgxi7EIeAKjSj9PZxXtUhm9CLKpODgs5gj8HVqxLBsk3qBGeOG
	Vehy247I8VBID2TjTd3PxpwV5DP90CGNfgxPTrYxzZXB6/FqGHMM41GvEPUjebME
	N/U5xfrR4zjrNqXTVv0yEEqZmep4HHTUMpD+yLDv9S0WGw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4fw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78481f4ba52so2701403137.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789347036; x=1789951836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=RBep13dfS5OIq335Y3lsGYYHR7Ow1BP6yEE0cVdeNK9r82C9peopy5q/fLO7We7lhb
         hnM0gxullC5ImMV5f02/zy8ZKLcsUnyJIkWFum1Gk8A/3QNATxuxHZBjasnSVxefqYh7
         lM5CVCC1X9w0BioaSak5+pxp1sg71GcQga/VZLIdQi9Is9Rsb9L9BImi4QCLQddZDJVh
         8+zntyHWD5RONp6UbQgM/aTGYv/lb9SEtlVjCRwtjKNa1ODRrOclZMI7cLTBXy5xeP5E
         /6aYGB4hm8rjNr9IYbQ4LHO2dxegS3WoIRP4tZWeLnxgSTsBzDvJ3XdRf1ZTAvXAKjZr
         Yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347036; x=1789951836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=riCR52AqUOnhmNZxhsPVu6ewpAY5zdbCDXjdfUrzMM1Lo3c81s1aVBDMkMmudzIOAw
         N121pHQAF9xc7UbEGD+5HkrhmlIhKB8vYyNSVUd7kA3L2dyJXhYMtTH5erGhTc3NZ8I2
         Eur+L5TwveMXTtue7R42uFtYgIqqzyxaWfrtSHMBYPJed5FfgyChneKOiyBustvFdwt+
         mdd9EfgtJNOiDH6v2z4g6rFmmeBQfJhlFevn9lm1wbxKMVMkSUpSRqLfK1c4bcLy+iTE
         JDP90UmzVB5Tzv4ReA9UGRsZ2w1/N4uW/DHtfwbVMLLayoR4AemwyeA+6jcGiud6S9Kn
         kdGg==
X-Forwarded-Encrypted: i=1; AKwUvBzOLYdUvracLNy4JB0S7OOpgodUBoFkpxBw7SXhctMVUdDMvXGYvdNSSpsiXPJmWNVFg6P7i+5Z6XI+s2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mGJvJo4eUK8lRykgXfADxYIA54BfYwn7vMRkVR2pE15DwQ5EIp
	428PyPbuWrWIE90FQsZDpW6PZA3lo6bzkiGH9RdG6AFCHM6isLDf0ySottET1wQxF7WX+bdUVVx
	RfubfQdjwdtkIewsGEe3piS3AGgi2J8bRbJ4L9jzNPbKCN272dwwM2XL0me6cPX0Ac/0=
X-Gm-Gg: AYBFou0zHhUz2Hp7MFPcTNHhfsz7DRp8tvjYN9Z0n2pHUc6GKvD+j1J3NQkOdx/MGTq
	Li4X+n3In4UN+7L0WdFNWU+IR5b7Bsp9cg0iC4FNX1x3utHr8apLl+xNzYAY9B1sRDcu0dLqWLM
	IDvUDnYpslpjoskOiUi8r0oGNF81/4ldUfzI2MkGZOev+R27qwjeS2q6VhUDvfp/UyeOKbcH3Ro
	/RvV733+NjKemnsnUx2zwA1O/DlUp9ZLH+luCzn/jydUnce/BbQCEGqM1Aq2HMO3sb2Fyk9aeYR
	wc+PLVQmCn3AvhK2jnSfWwOt28N+91SPOpT9IH+3Hg6FRvNoXId3Zd96BmmKS3nR2JfZdUaqhHj
	YC1Gz5vjRdS/GfwUh/xOFB5IGCMud0nHtQSY/cDOaeTYeqljLuW6i9BYaunEjcMXAnrlzUavhnd
	+IPjOO3ck88z2e
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108155137.9.1789347036241;
        Sun, 13 Sep 2026 17:50:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108147137.9.1789347035856;
        Sun, 13 Sep 2026 17:50:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04798d2sm2023587e87.69.2026.09.13.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:50:33 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Message-ID: <6vmbxuukduj5tpvijgltcizdhhgllj4biep7dqs6twj7qte4cp@khfdliq4agqy>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xS26dD6yzcwyOrV4BcrmUULjvQJp-dQi
X-Proofpoint-GUID: xS26dD6yzcwyOrV4BcrmUULjvQJp-dQi
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa744dc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=5Adlwl6woCA7rngLHykA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXxDZsCq3ClJhC
 16nv1jy0ioZtKl5p8NiWbN8F+5deXMny0PwFj+00yJ6rM3h+RShlMSvrgLl/SDYJR9bK5iLCE/J
 yaHV/BZhs9WDSTgCx21x9JD4MY0vCwl63xdte/E3h7wYu/4iiHgGzELKzidYkvYe9Ib4ClQK/we
 Pda6HKWMQiIf9IxUvtpELQvsXqgv0N4VZeBqS8Bf6aLdDUsnyKoxCYyT4l1udoBlmij3PN+iNX2
 f1nkJkhVoq03Lr+IO+t6R2gMJM/Zjt4AXQrBNB5Ak0E112AC/uPFRkFYTrbOOzh0xi/1nhrsjMq
 K2doed/8adbNdeno/K7R6lYt6JLDl0f4GIH123eY2g0yETpZr+Y95eWt7cqC8bK/gULvsGLksy9
 VwE6fBVSyUzkGx9fhn5WVqTRCaufPoWfhUXmtfh+0UDae67gj1ewGgU6DFXAOEcMktgN0dA96xl
 p9iSungee3jMuXHH+KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX+vOhk4knZwsc
 4XZG1h3GgR4QrCo17CCLIL/kQOzd2RfzPKprqPv89Jf2kkia8MzrEjDw55nbV10ZtWuEvJt0g6M
 tJqox/SzuSZ34642aquYuRJI0sBzNJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:40PM +0200, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead (which are defined in the top-level
> properties of the binding).
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Fixes: 2f14bc38d88a ("dt-bindings: display/msm: hdmi: split and convert to yaml")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
