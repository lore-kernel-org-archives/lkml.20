Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD27C2B9BA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344475; cv=none; b=MDy7wAJaQHyZjJXh7HIDZ4pQcBIHPqAsUIJdmpn9hHQuGm5TEQQ57QPWU+Dul8OEbgeWGXD8WB3Z5IYH6HZt8ppZbjIsjk1o6/n1yjptB46RdlxuVGpr3F/IU488taGCnwoh+4z+VCxNrmhV0/xyFQKsXqhwv2auchO5t0tBWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344475; c=relaxed/simple;
	bh=lYUuIvyH1wzXCp7GuV4HvE+YLRr/OHaGhwLibLg6PTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg4a8by2QkaFHZv0M9AXfWFxmw2gb5zno1M4ZhAYyIM/9XpkBSG5EBnbVL0AeUkHic7gXe/bRInLFGiZ/KyfhRJrqHpGp47U7H4Zev9ps4tWJ1oTDFeShJlFbXx4St2DUccFDQSXbCYVfs3NNkuAgwzdkMYsy+wjDYI46CiwtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAAbncT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV9Rff7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAAbncT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV9Rff7o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Ipc081275
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9bwiN3dUdd9aP+bWdeapn0I
	UEMXk3IGQ9B6+59SCMk=; b=WAAbncT5aYE4iVuA26PKrx/TkOqCQuGMD3P8i0SW
	zXs3f58QXjx8entbqCuWonjnQjafY+bXDHP9pYslQlL3RNMAl+Hs6LWAEinbidpA
	Dw1Ga0pyEMbNlFtvj2sIm/GFcmXaQpWG2hHRg1RE0WbBmSNS9i9Q1iuP0Q0XgRic
	B3pTDW+w2to7Tyc4T2c2wzsm5D04r01/whGNtEd4hDEZlqOB4gaUsNBcerHZ+ztC
	7kZt74zdus8/sPk8aEH/yQRp2R1jZaPbC781Cde85xrcvhKGi0eAQ4nyk8vixDhl
	Zx503zZXrH6aayjKmCXUOA/zsDMxfukQuCFWp0H0zYQ6KA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmd1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so3224814241.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344472; x=1789949272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9bwiN3dUdd9aP+bWdeapn0IUEMXk3IGQ9B6+59SCMk=;
        b=GV9Rff7oeh+hitwggQBJyWTVw9qWe5imBzEBRKZdYcraf9N4X3DzdohmUBeRQrPbFb
         G9EdHMRTbVp1ETRdRCzKnvRActTeDlmnPVXg9AiIDOuE0gEr6A4d4cdm+k5XpKgHNXVN
         lud5001WN5Cra3evWIl3NCX/lVjD+fsvUUN/2MFzcHf+TFMe56KFd37VBqjML6Lmb2bR
         SPEyjKQ200MKDQ1dfXVHCBfcfiLMfBa/go08snYJ4ohjLS8tKphjKQBb6w4c97Uux8/+
         a3gubaakHOhF6Qie97FBeIQFmew752N+Wr39yb+IFL3z7TcxaRWniywEvmMeLWcwykhi
         iSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344472; x=1789949272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9bwiN3dUdd9aP+bWdeapn0IUEMXk3IGQ9B6+59SCMk=;
        b=C/oOAJvSNVysFSDBcEYUekG5+slSSv3Uy436BJqEHvSulQOp5vPTzmoRWzYKwvcJtm
         jUNiJ+/UhAJxZamUDh6pzT/sL5gMKr1weHCP4S2e0roC34y47Gkifd0EE3+4Kf7cnJ9c
         sVkgAo/2U1Z14a35VffYl2aTDXhuAKoi4GjyG4aSxvsKgKNStt/0IcKalV8Q/GWKr3Tw
         ACplPoaoJfRTsWyQkb0fW5c5Wb02N+TCyGzLBcYS0t6NWlvxCJUYd+IKWwDKGaqeb/Qg
         Awv0yjWUwFgoDDsrDtP8IrNyWLYOPVdNSHIAfOnuDX391JxoRMQNIVWdS3mZy2BGDudo
         hRiw==
X-Forwarded-Encrypted: i=1; AKwUvBxkQ37k4HgCDERc4O6K++oSN1m/fJnUg220pfas1hjrTG9Zwbe3uU6Yg0E4/6c9e4K/fg3SmuCVJuTc3H0=@vger.kernel.org
X-Gm-Message-State: AFuF++mWdZ6rFvRlXf7YTjH+pvczFe6nLnoyCLQswzAhHLyAwr+GU8Kz
	R1OUQd16h5l4RQyC7xWEj1K9yOgxfCRruWs3Lp+/3xv5XhDuWqVVJtoTANN0RuiuXjnNWdgstLQ
	Y1oVJUBLqTUUkrZ3uSNQnOSb+G4k2Lo38Q4zWUjWuh3KOWEo0sEoXu4BXzPgvcFH6Ngo=
X-Gm-Gg: AYBFou0QcROQbS4uuXQ/oruYq3TP7rHIDxQ84yoAQBXq18VO1gs0CZgcUNRkm5iOMMc
	0fqrA2LV42a0f/z5pAhkyIWugY5hHpx7TY2lID8EaGp62KHLw1UdDaeo8V2/UNfh7KebHGX+9op
	MckW6Q7w8KGsLqSOD2Cyu5UMvZnREj62Jbm2gn5PTE2it54xJ7bAfU91tcb4E6u2xCjMXlZxEOw
	gj4EttzoU98cO7w7uxi3HwfvQ1BCMoE8aaOSyCBMqNOZ6K6+weinxgGCHuzYEueXiz8APqe5B3X
	lIDqiJvlNYQmQ732ChdYQCy8NHoVsXclCuqDUpwsL3OeP3QYhh2tB13VQPuc7BD1g6K8l3v286g
	MyuVGjO7hMkEAYfpRpFFQ7FkACdldcdwXn0vrHADm+gR3YUvXSV6S33tFUry+F30oTzFjCTiuwN
	gTG+eKJ+GYJkw/
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr735059137.17.1789344472258;
        Sun, 13 Sep 2026 17:07:52 -0700 (PDT)
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr735027137.17.1789344471682;
        Sun, 13 Sep 2026 17:07:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461a05sm2019561e87.37.2026.09.13.17.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:07:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:07:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 12/17] phy: qcom: edp: Add Nord bias and clock buffer
 enable callback
Message-ID: <4z2wtovf7uzmomgoqkjfgcuu7jg6l5rsojiwtg2f5t4tmdqynd@szbd7qtdb5er>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfXxNGyC/YoXkFm
 T+64/QFS2c7/TQNNzXRmNVi1QkHvvRHYx6v3cDebNnokQ3ML/i/DioZ5UzknmW2/gJk/O5a8SOj
 NzAiXbKYaMLXwGo9PL6yw8MuVOHs+WHena1LRqrsxy6Ln0Gja3x8L0qqV8te0ZFNJAREbTGKMpc
 ICPTJgNSa4/wlglNmN4ofHMssD8VNHq2FEjsMtlagDj4DEYN4dZkPFpdONJ6u5q1lu6u3bYo0Of
 kg/OjNWjN/8aSo0CnJc+agn95MrFrc/0ZqjBSlmEoONGV/C27m5HqH96m5y54Sln3eCM3UOBTd5
 8PpVY0Ol8oflsmdf0/vpN+Btzun12zf28PO9lY9xmpUOUCUlQf2+zc6YjKvXEqobXecMfVSohJz
 6Vwy8uS1hRuzQkiE5Z1T6aqG8OpZE2ny0wrOE1qmBd+BFRt9kW8WHpx2Z3rPuj3Ak4jkL8I9pDV
 KtWj8NeWV5kt5omNvsQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa73ad9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=rJC6BC1qXBLC2pyjZnYA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfX3rb0NcF3yFa2
 3OAN+wKk/8iG9n73pXW7TOHeUHesCwI6Zr7Mvfw/kaf/rROLiyxHEVw2cpDTB7W43TLAcCYQM07
 FgxMwGyof1AtYWZ3H6QC/I//OJg8Xd4=
X-Proofpoint-GUID: KjvmwZV9sPDqtYUPabgJ8oePQ61PvB4r
X-Proofpoint-ORIG-GUID: KjvmwZV9sPDqtYUPabgJ8oePQ61PvB4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140000

On Fri, Sep 11, 2026 at 09:06:43PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires BIAS_EN_CLKBUFLR_EN to be set to 0x1f to enable the
> internal bias generator and clock buffer, which differs from the value
> used on existing SoCs.  Add qcom_edp_com_bias_en_clkbuflr_nord() per
> HPG Table 2-1-d.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 6cac4b55b66f..ec4220cffe69 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1637,6 +1637,14 @@ static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
>  }
>  
>  
> +static int qcom_edp_com_bias_en_clkbuflr_nord(const struct qcom_edp *edp)
> +{
> +	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +	return 0;
> +}

qcom_edp_com_bias_en_clkbuflr_v8()?

> +
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
