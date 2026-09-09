Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67273C3F7C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979596; cv=none; b=uFnEcJWZoDsXw9i96SzvGaLo/ORBSxkjhUkj1OiLpLtfOISUs5p71zAEU3DViWhpy79CpQ9CK1rTCOq1XTrXY4mDnESwwalxH2qbySwrU9SE1ox/8UlZX5pJwCygBbs7aR7oI2Oy6Ovo4gWGg8Npz5lXsExM6oNwUDEY1OLdSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979596; c=relaxed/simple;
	bh=nHVj6C7ObfXBJe+eF/4Jw1LC2YX6A5nzTMPulUhK9dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYH8PqJlsZYOHX31PKojNFizUBEcLDLES/XVl59MRkL9igqz8wZFnuPkHMEm2JM43/Qmr7bRY3ivRQYQnPS5pUKpDohDK5pvEF3hdfQrM6kNavm8xl6oonJT4SkJIKSzw+4mrw10ejNIXc3NhpQfnlhLtShbbUsNA4ZwZ4vCbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZompsQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIzoQYUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZompsQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIzoQYUo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Ijf1h3939996
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=349eBNq8SzB5dySvqp4+a/Lr
	FlWacg3L3HHPu3sbxTo=; b=IZompsQYvPCrZss0gRV5Dwhbu6U6CXX8p9NOTFFI
	lZkThIm8pinUC/2ObU7kN7Yot8zRAm5jhTpu3dVipun3zIsoUaexzIPjAjnJZjlo
	VhaLILFdz7QxKXD3N2gA/svRldNHSBs6yZYNYldB9gLupv+aWHBxbYKVw4JH5Crn
	JVeI+Ln6TOWcF/SX1+FRmpzg8RnONkihdoz0n/c6bEhfohaH8HbZ890tXENc5p5Q
	eondRcOjST69ZzArM4IbSG3wX/I+WJwQwhEGhBeEdF7STAQldS/KES8I5PicZcPC
	C2mb6irotp7BISZBNaxoqquMI9hlGepOcwl02A8dT+uyyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyh80kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:46:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8135d7eeso97908416d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979593; x=1789584393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=349eBNq8SzB5dySvqp4+a/LrFlWacg3L3HHPu3sbxTo=;
        b=DIzoQYUornhNbhapYrgjtrGF0JGHmMrBMYQ0EnLdY2zGDxq0m8kOd5sF+3yx7WiMCm
         HoUBvKQhkL0pZZCHGA1KuUZWis9oNB7XD/oEKifDG3CK17WwIlTDhDEaJXrgINu80HfP
         mgd7sDY7dfCaHdvit2w0YXdtdJmwQUHSN06bv4q1y7CgKWM8CW2rpFCMTycKdcsOV00m
         J6uNDGPVAm4oAw58ZsPE5ZCLELpdgg7SjEdch89v3axKGPM1N8wPdnG7n9Uy+dlv547Z
         1JMajLu0uB/hkP2eli2TpS9aXwrOthqX/X0Pn0ln3REHYJD+/IeCqF6lOEz37darsld5
         mbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979593; x=1789584393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=349eBNq8SzB5dySvqp4+a/LrFlWacg3L3HHPu3sbxTo=;
        b=BvJO6glhNImc231CcWipUTdKluGBHuraj/KiUkXYOThU7xMYkyxKxoL96CzLMzr7HD
         7ISF+IpjrBqdLbrjzQ2/QBUzqaAXWKFMy7E+W+cejPkZqOFFWS6VWMUVfhbphZnVYHWF
         gLxEKbGgeN00NQs0rDjYOJctUo3K0LNpG6TWh/2MGePshuo3oVUO+88a778L0524yTnw
         S99m2nb8F5DdjwQYyx19XhF+ryvuUldTlXvg9iN6gnAbJpOw0cwjOnttHaeQuQ2sEeNO
         IizfB/gewS2chn78NOZhcIl9s+Ao7qrBxolM90nWmnBPMUmGHj12XA9P8S133yd6WDYJ
         9JUg==
X-Forwarded-Encrypted: i=1; AKwUvBxzdYHvLkWE1HGjbfAZrA90txMiaagYYW8kTfIHNtQ3EVnBoW1hRhSmIQ1CMUag3UU8NcEoN1zK584bY/E=@vger.kernel.org
X-Gm-Message-State: AFuF++n61CvF+qo13ajcd9wkuquFAvBEAHmcTyK2RD8FdeJ/DQVRb3Uh
	uUc4QMyuMvmPyQnRUTv2PnhPTINHTROoTutfTAwBJRTwqT3fMvsnijjFw9t0nyJp22lp6MoDld9
	1UAd+VcLKCCRHGFfHDR8r2jCOSf2mThKi32NAlmuJvGQ9N9qgeI6NShjnWfEdYDUUfP8=
X-Gm-Gg: AYBFou2YdGcYtpf5n1U8KUm+hVPDiqCRXTX5NXawrsWp3XLekg+F+6NfZSy0Tgw3sp9
	nhzhuu8BRvYEwkp06d7VQvSJ11JKsAHHDXI5qA2ysb8QCuYyBoM1Ab6LvwAR0oVVJz3fjerb4k7
	m2CkWiwHEcgAP0mK674lm63YqedcDpul9sEGBqY7jMe89i2uJSuRf9BvM8BQ36R8i3d+aGR4j70
	x+CsuUJ+NmnWRXjr6PNb9m1d2wIgJS4989iGmk4zMmOGNvNTZMcKLGUWW1sWE84hDqWV5rXJGw/
	gvcMPClbPUj4Wntd96AqTauyMaTKpad/efbQx/CgScLTa2cUg8iwuR/iD5lRoAyLJ7GyCMxMwE/
	+hZCf1WiXXoV0Ce/Z9WNNJiv5Qk/LuHRr/nVec+kuTEutkrHySuCVxX2ZIUMs95wSP0MFbe28BX
	CtyDEghlx/DK6X
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr1802158137.8.1788979287032;
        Wed, 09 Sep 2026 11:41:27 -0700 (PDT)
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr1802145137.8.1788979286652;
        Wed, 09 Sep 2026 11:41:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a372e9efadsm42002251fa.39.2026.09.09.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:41:25 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:41:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] interconnect: qcom: icc-rpm: Program SMD RPM
 auxiliary QoS ports
Message-ID: <opmidp5oqmpamjp2hucf6nkn2o6qpjtvgvreoyjbspyu3aa4de@wul3j6n52uju>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: mk2v6wWudIAInNFw5YxTnVHYHioapPa9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX70ZLwjwJjgR0
 vMlxAmFWZair7GKy1Yk/SjvcyjZivk/ULbG1zfRGB3ag8MvJGJt99uRa52OK+WD/0bCJvG6TJr3
 hVoh2EIkNgjbQoI0BOPIpRIEXYF7h0pm0MaXp+FaX1+UnJ2wbq4fA7pYHFNM35wORPZsqqQwSgo
 peMlZpoUeelSQfFRFyX/eFA9Ar7LvZEBFjKF+WhP34wKv2nfRgUBYeqJxDZpEkjqxBiD95cZhtI
 +SQg/GpooUVOVyQAL8dzQSsqtvTMzG/kKpkDvfvNCFx28W0mQKvVFl9F7sC8jgDb4VhUxguPtKD
 9wZ4TwgUlHgR6A1/v3/QwRiwLNL9fOn11N3bd8giomE1Yb8rDirYFQ5ID8dbo3eEnEZZ6mNmzyN
 ThuI8UhnY+BDM5pVW/nDKbT4LKdjjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX6VzGJlWHCBWx
 CW2zo51Pe+66wd7laET4UD5bjzdiN0dhvvdJb9Rkr/X7aQLSeR9IkJ0cfjHirBfQvykyvsQI80z
 6OiMfKyIe6B9wxzEL+V4soRTlDjJp14=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa1a98a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WdMRlMAzhO2SUoSbdeQA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mk2v6wWudIAInNFw5YxTnVHYHioapPa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609090210

On Wed, Sep 09, 2026 at 06:41:57PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some SMD RPM interconnect nodes own two QoS ports. Currently, the code
> only takes care of one, leaving some endpoints partially unconfigured.
> 
> Keep qos_port as the primary port and describe the optional second port
> with aux_qos_port.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 82 ++++++++++++++++++++++++++++++++-----
>  drivers/interconnect/qcom/icc-rpm.h |  2 +
>  2 files changed, 73 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
