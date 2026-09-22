Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC65678D5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093027; cv=none; b=C7XrBioRHi3gZOnJ/i+mA+TGMpTWtnxRs8FEn095+loYBEVQqKlygHp+KizH2aycXz6P+I9NozUSYtE2/w2nep1RbaB23wKBz//glzbx26tlfKZjSsHi7sMemHx/Bm8PecttPVo63b5neeqR8oheXBZJ+DZjL9mFJXuc+W+m1JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093027; c=relaxed/simple;
	bh=3Pa5vevgeH9L1GoM3IyUEL/eARRqFWTdTHKPE/pFyV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpxfEyehXbudvr99ytn8WxQdnZjG4+N5YStCK6o/Bl5ZkUDCXiOQBaQObyicVQ1OhTWZSzUP/Eqtj/cMcw3mg2XRmJfqUyHgj2FrgUPk9pziA4ugATzGUgRTTeVY0SE/MO6yrFzB4UxwFnFiLOh8dFdC+koDqRbnYvFY8SFzlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtkoHJol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoOYrhhb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtkoHJol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoOYrhhb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVvd1058307
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hxFL5rS+2MxjfqN4yIib08BX
	XXF5VfMlIqKMQUSCXFk=; b=WtkoHJol4v6Y+fXMcQMEi4nUTtD2TlHoP/OzJjv1
	bMLJuOJuXIb7rGt8umdLEsGioXs6MYJJZACd4IF0G7qg/Nb47eNRjNeyLuNSqoUv
	JVeQoWYVFN6MH/RuvHiEZfXP9bEz5zxdUPUv4p/8wQw+8s/x6Qj+MZRe5U9mASq3
	8zleboGb9L+VZUGPmqoiuUZBhFpd6kD0rImToV99vdZngi4xPQd9al3s47z5gHDv
	1L8XzkdEBNuBlZZfFlNfMq++XdVzbVUm/HmSySgid6kmzCw/245ravg2x3Jd5qzL
	IaGrgYnqcBWTx9SOm140FvSuY7dS3jkjz4uif6q5lHGvIw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u9ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-984fab5187aso10049241.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093018; x=1790697818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=IoOYrhhbDSoccGkW4cmbuN6XlU1toUGC/uu7bp5xWmxIWgqSNpr6BixDr0+vof3rsC
         NcO+XWjYGR9P6Bgc+jkjAuctsVJFuU7mUXETL3hCyWUUhsMD0oTa3FDYkD3v4+YiWHpq
         tYIo2nQOh3JmFh1YwPyXEDKgwR72uV8XQdJhIHg+h/rgxN4K7H32tvkoDgW97upZBEVJ
         DqDBzJ+ydr9uAFASf/V7I2PqtyyXdkkp5mr4liHYl37eKvyTMod1szAuqpib+ld6xB1Z
         vmAsoLlzMtKhEQ5hnxsf6kVv7hu5GdtEMWJPms9sKs6g1X2PhkiJrKbGM+erfgFz+aWJ
         t/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093018; x=1790697818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=nl/QI6u9tvNJ4TJhVEZTBsHh9llo2Pu8pgGiA1ToYzp9b7XGqLKaSgBS+UGafrF19x
         2w/H0h+ux70kG7zA4Nqk0hzyP5sNoq2OgHyBbKuyDOFO49pet3t0FZq/BM0NLOr3IdnP
         +3tJstuwWrlM5ZwcrYtD0BQcZWK2Uc32aGQH9R9LyyW3nCta2F3pltYOg7BGru66glxj
         kcBN3xYq/PmfJ77YZArZS4xszBK0Dgx2ncbQOnEM6c7M2RWxzfXj/STU8jVBhIqDDPQd
         5RWY9VbnuXun77KVyy08OpsK05bYberuYUY6Z+phwciAI8rOjR1X228ANg6n+VA/A8dM
         bJSw==
X-Forwarded-Encrypted: i=1; AKwUvBzQod7ZLa6AAprCXrTK0QQCGlVEZm82T69QR5Dai2WY+Y69tLVH9VXP4p4JgwaGaQ/TgZqT9aDnKSjmsNY=@vger.kernel.org
X-Gm-Message-State: AFuF++lb9HsyWtYUv4009j+RuNCxbKVYlmJhdWdA5j6L3S5s9DgtoA0w
	vDgigu5rnUd6IsQ0asIbtU6XKmaB251JQddyirTB5+5ORMQdmB3gU4btOFWeAqSlPl+/aJzq8Sw
	mhembIt5HJYzCcq2/7ASD6a4TVumc8YxGYrJBznCct2nP30uTlf/YzVB43wcWc6fiX6Y=
X-Gm-Gg: AYBFou2T0U49Av06KtAwZgmzq8vRluA7IK4ZtK80JiaBYsOKQh/yz3M9eHTYaWbXw8G
	ygyHSfVVl49yZDec6tJtR313RMha43jA34cpKpzPWOmyf1BrQb+U75gusJ7ccMR9+lDYzM/cj4q
	EE5VJ2JknQLTUtBZ2+wegY8UCpxKtCghqUBSPXbZidQovlQOpMvMWMK5uw5xe+NjGmblLEm9DcB
	QctJALkDacxMYmJvMCsLQgQrNiSzvQVF2FLe77ulc6TsGhIndqbXCIgqH/Y1hxNDBmDSiHDPRuM
	yKPWtIBCvKbcKNdNhkcnmRe33muc9OaoPlKz9/690oHKHeC7NAZoj77AY2n+z9i4ME0t1LQHWTJ
	Qq4d6SIxdqNqgDBPI1plwmRNzTls/qcMhnoD6KhbAk3b8THXhDVOvElsXOUyuTsk37d+tEXUGdk
	2wz121t3iYGuZn
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2537031137.15.1790093017886;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2536990137.15.1790093017426;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f47162bsm341071fa.4.2026.09.22.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <4jjdn4tvuq66yutjqpuwxrlruw6lrjuwaf5jvpatpkvdroanet@64dipmovgw7i>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-GUID: Eb_QuKO5BpvCdjeQxIpuCgxNv-Xh_alm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXxC31+5HBz8eg
 g9k99AqqJEqeIsTM/uj2vQ0ny8g05R7nNPsSl4wXfg7YDT9ruSOFFD8XWMNoTS0GztPbz/BimHl
 bhRIIvaJ4UptRdjpBcJ1MXZcEm+Gl/c=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2a6da cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Eb_QuKO5BpvCdjeQxIpuCgxNv-Xh_alm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX/GGLWJ1yzoTL
 J/lb8pzV0jR+rNZmAR+k96+iSDAMUiQcxwyWI4Ch5dRAJaLKeuGFg91Rt34qpX5/aSpj9+HR4Ie
 d6m3bFwOZhtnrTXj0JbNSdhfhumQqBczpoz2JUkjOFYKQq8mFsBSUJw2W8WAfG9YgDA181tfmUu
 84NzAZ/14m0f0jRj/xe3I/fdnXMTdGim89vWSCu/JcH8k5127nWy0R5peY7a+x9TnQNGIPrSWBL
 kTFbfLpteFdg45m+SK0+Vnqcyf8W4cvxwr5FEOYfxcwWMKF0UxT7u/w47zeUI3Yz442CYhO7xpw
 43f+sjWfgRyzhZ5gtTLqvEdVx1N6VjVFQXbNIPKLVMJEnM15f78iCkie3f8HANsB4TPuVIJHCkD
 5x0bGfz+JuWoE00JwG4yVRsi/fSLDDKKDzVE0lxDnXKKuzNRCfYoZFjbPIewNsvNNRMBTjALwnz
 CX87FjeBAbHDpgCswrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:21PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board and CQS EVK board.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
