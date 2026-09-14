Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A344AB68
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387895; cv=none; b=emS2bGY6XV3w5k4crgBI8lLjvi4jeRbkg5kuBjdUgf6lSuTRSxpb9dnhBDWjxQrlrVxrago1oe6mJhG8mrzQIkRY0WjJod26TPcXH+g0/M6/kJjOvpZPPGSgWgcqk9yvfxPlzObGkDH33qS9hGze0w4ttOS5jrazcem0kzNHavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387895; c=relaxed/simple;
	bh=/qXZQiWSYZP3Hk5lWB8Zy7NUdHgncjUSfqqrWQCH8HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOa3hScDyQE18W0sum+aSFjiRfRbae2qZMkEVV+vfLrOeQ1SXTK4a9IIYvlcpup2TUJVltrxn6E/ErtGZwKKUnxXjX3DIECOZ9ZxsUDsgkxsmZSFUQfGRvNbEf3AxMAtE6oxB4Ra7W5rawuFvcfGg0TdX2Xl+0ptS/PuiUySpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLu1+IBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgeMSbhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLu1+IBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgeMSbhP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmADh3291626
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TGOsUT3dlL6kI53BlDSeWVAg
	IydWNJ7b2kgtqLeWv58=; b=ZLu1+IBf/RnwYRTYq8ExeBOIkuZOTXWWJ7HUZ9wS
	+j8xhBhd6B9ut/wdfdl8wx+7TbHY2X8sHPjkYICYOw+6+ot21wH4ehpHO3s6zd9I
	54D8Fl7jJ1SAzDGfvnkcZog2ozCLnRUX24p+G6InWJ7rbJLFliRyDdh5i9HouZM0
	BqPNUL+/WkGISuGfWwB1F7TMTSx9h7OhWyAgHZS4NaYpWRr0/AHRCaJ/0m2ZocUy
	6kv2ZFNuxEPYd/xD7XAi9QI+4mVbfd0O1p5FpkAx1wVNk3LkBkfqjyvr7zLjVGlK
	xS2u3yc1PRe/MHS4txbHJzut4h37bCv1W3eYRxeM4ohBwQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8hee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c851df59edso1149013e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387892; x=1789992692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=ZgeMSbhP6OUUbgcCZy7tMlo2h9Eg0Shyf8GCAWYWuKA0V70zFjORA0DA7O0tOLOlvy
         JbvndHOQFjMZwqVA1ZOzx1DHKXwBhmtsLrkWgu977038UipfCXaj2NYp/Jj2E72KL0SZ
         wlkLzzUKD2FYR5WS8ox+BdrzC4gNn0Z7YYqDzXD96JMZZ7AhSCRBEkigewUUW663WDE6
         Dp047rw9umeYqh9IydUgKrOzvrZ/+jCoXCUj9DTrQ4jzs46fTfWL1i/pcz/m77wIUCkE
         haFHhdr5EUiOWqAZSQfs/xIeiW5dh2zZejQNWYbHAvOANrB+TYyhv3D90+5zZcLVagqG
         2JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387892; x=1789992692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=BxKXUufWpWU5FYyhI6RHX8JgBo6Nu5Do/qS297rYeTYNLMt7utTlmm2O2IkxbpzI5p
         EolNUmi1ybaZ0krZWOhXg3guNmXyatO9V8iVSVEg2Wbcp6E8IJBO2D11Wk8LWykQoesO
         jQA+ZotuxJZUKlxPixaSFabfyWdVwv4FEFCw6xABKDcejfRdOSewLbAyB0ededDoskuN
         UJvL/Hmnzv6BGu/uwkzAUJ1lJ2lBDRm9ROZgYlDAIGTdXFh96K4tic5u/bsAY9fA7Ch6
         fN78BxrUtgWhIBOuq4+RfzYTB9Gal5AAwWr8m5GMExtOqC6cAuSO1a51sM4EpYf48V3x
         gHbw==
X-Forwarded-Encrypted: i=1; AKwUvBwC0+Jl07+9aLTP3A40iHRcHQcCLU/8KCxG1ZpcfCTc+OwoOTZyx+mML3i0lhOyxYJq/clOvSvxEVZXvzY=@vger.kernel.org
X-Gm-Message-State: AFuF++moHLzC4rHaEkasKF99zSaMsaLc6kEn5OYPeaZ7LjHUVMsl69iQ
	pUvzLiXkd8YHGL3rPWcvLg1Zv19O22ZeQ3P3ufmRDj0RUvGB7JdIW3oNTHRmj/R3i6Crkpfdjaw
	plupSRDRsWrGdkrBc6spa4dpNmenFwcVp9gvqe3pC8/FsOMrRvaMgYrGT8HVTddlgUZs=
X-Gm-Gg: AYBFou0e6zMEZzYDe922GFaeAtXmHzPnlelg0mxcokGajRC7jNf3pGv5gb/j+Vekgj9
	KkRly1d/UyALNJy2BcLQKmaxN1ER1Y0Umrp9n7ChvHYcgOrHk06mz+zy6APPdbO+LmFeEeCS+Ir
	7ihprwYxKC/k/7FcV0TbdD+cy3Ot7eDbne9vXarKlTbAbn5DhpvPTDCuSCLHcZLcKJI3Of+l8C/
	vvLXrXzQlDOEyrJedYUXYgFd/mwBzThVYnbXjduX6+0AoT+XIJluheNkUSWxIGbYKezsC4nK4eM
	mfpgoKWnV3uPt1AtRUI1nDSArJv/nH71WEMzloeLVWs1HxC2vKOC++iSG1GV8WABgEqsngCfbci
	57CVmrf3dqZzohCoYzRPfUFHHtHOAd9ZTFSbfKwvQ4cH2fNpqCuxSKKGABTPDEitlbs75bxhn3A
	IarC99ScS5RPCa
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305466e0c.1.1789387892340;
        Mon, 14 Sep 2026 05:11:32 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305402e0c.1.1789387891867;
        Mon, 14 Sep 2026 05:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046499bsm2338562e87.44.2026.09.14.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:11:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:11:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: Add SC8280XP platform data
Message-ID: <cwljkshgt7q7dbmujest6u2igpnwcgyx7xmxct2ns4g7ph6avo@zngraegxzmue>
References: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7e475 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=-APiHbVL8haAwMLVaR8A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: jk8gl3ntmaCkCRUyj_vWuGEqlPEioK-S
X-Proofpoint-ORIG-GUID: jk8gl3ntmaCkCRUyj_vWuGEqlPEioK-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX8KXsFn10kHcQ
 DwQkGJqLLA9CeVl5Cv3SCwJMndeFENuDKPCDl5u2jaO+A4HxrYgLDfaK0KWPbU/2neEuOP7YXCR
 sCXXc/0f0rPLKXAn83d8Ddn3OPin74ilyTk6qV/0Pq2htdogiwdmvuRBtrIzVW+t5V8ZY46xw+P
 F1KkMxdkfEgP1M2cH2AVsCJxUhGstq+2Cfs2/PLGW+5PT43HwYZ4UAajhmIhCXoLbXPko1JbgWr
 8EwbmlPNeX1/lpSPaFMqF9FhWiLVPBLlHdhqVtTQ0cxTqPfDGaCdij+M+Fkw7+7pQiYyD5WGVeZ
 YCJvhDHOZU6XnDCDD8pGkVffgPUiirbnUGjemk+/N5SM99UD4ouJS3Op/HxzqqFXwUYOwJNWTHT
 ZSyQU8x9LnVqM3R5jYb81iPbx7gor3v8hll/oXTn5PrQtUFh37NvtmVX88d4pkqh1e/HL3PEHAy
 Icz76zrX/pEGKrhqbvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX+5kuTmtQ3iBk
 L+6HR07aShdN6mIE72tWkZo4rWS/TRFeTub6AhH4fWRUcehgp86OzxQ5SBUPZNW8XW6hJ76LGo1
 1Xtbpkn/GD9teNlk+YLAscz/CNjy7Ss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140173

On Thu, Sep 10, 2026 at 11:34:24AM +0800, Xilin Wu wrote:
> Add platform data for the Iris VPU on SC8280XP and hook up the
> qcom,sc8280xp-iris compatible.
> 
> SC8280XP uses the VPU2 programming model, but can run the newer HFI Gen2
> firmware.  Describe both the legacy Gen1 firmware and the Gen2 firmware
> so the driver can select the available firmware at runtime.

Please extend the existing sm8250 entry instead of adding a new one. It
would allow any VPU2 / 4pipe platform to use either HFI Gen1 or HFI Gen2
firmware.

> 
> Set up the SC8280XP clocks, resets, power domains, bandwidth tables,
> format list, capabilities and DMA address limit needed by the Iris driver.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 36 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
>  3 files changed, 41 insertions(+)
> 

-- 
With best wishes
Dmitry
