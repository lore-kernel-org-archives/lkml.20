Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9403BBA0E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848900; cv=none; b=s30RmD5la5bNPlY088a8PnL0j7lmpuh4lIifRgeWxfw6UYxCylYwcYTLjEJH8ueyVdlLGqPIz4wJx9ZfKsB//7gkd5VfqqAhGCZdIp0iPAfPX86Ul47vvT0mktiWHCD7GZfbEPGcx3ylQPSLk9kO8JGNccWp2dDJ7HE41yWAwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848900; c=relaxed/simple;
	bh=HA+lxBMri9uENcLDmGrwEOdt+nkfWrIl7JvMgGDu/hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfPe4nVeQ6eJpkh1Acw5VXOiaXPDtDXh4eoiiibvC7G9ADFO6YaCSd+A9yUX8/bjT+RKUgNXsyQgTY3KgpXNPo23IBdvaWX8Xa6vR07FHYoL7HA0hS+jNp2JWMTMB9qrgCrcKPWjEAOFrHJ/zc9eJTd86NP5iebxRY5exXUwSks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh7iwOS2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hA7GOyrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh7iwOS2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hA7GOyrK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xj5R396111
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FhCLJRTVNsdis8B08EU1ZSRs
	p44UCFICG7klwxtE3HU=; b=Qh7iwOS2zSkfO3ogGqaI6pnDJNS+iBqnwqfcqtCr
	ywhQ+VqLGlfdvdDkWQiuNLpNURYaDNCaxlyFmYauKnzUHxCSVxiAHJsCvRkCfyDE
	qNYJMqhPfXm7eX4FszIV28ylcv6Gw0G0mTMxLum/Ia7Z6/FG/sfEmT6o8G0dKIy3
	ahVt53k3z8uft99r3zgF1JyCj6z5vy2APLxNoNPb/kDBkDRdwfknV8doIv3wEuo9
	sy1iVFHsbE0lJ+l5pTGyUspcaatNEn73eWZC5GK3WqWkd1hZqEGWhIvvt7fRlXdz
	6ryVH6UKUtaYKaPbqMlufOvDaLeKyH6gdEQP4PjwN3DdsQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a8vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:01:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a77961b860so1235806137.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790848898; x=1791453698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhCLJRTVNsdis8B08EU1ZSRsp44UCFICG7klwxtE3HU=;
        b=hA7GOyrKb7qoXs8kHwvYvM8FTHK0URX9EPF/GFqKrjY9N7zX2I0PFwA6y95xAZqHxA
         flW/g7XrZUGCLPGDuiloo8lClNIExFem8tCJu9ZlmY6UT8Uqh622qbcKs1ULIssFScZ5
         MmgOoBwc+ldVnvwvUUTYBpOcUWaDDapE95ifj5zkMdggQKwaMvp/9180DmQ8MS8ECDta
         SiZfGA3cINUvWR7DDVqJynjOIAnDkTG6amobWXHIynDFEWLvlbP1lzNV03OtI4jE+TFe
         /wPNaP4HK6EWMa05FD4XIlnfvYMPPYmQMbSIGMBIxii7XM5OceYOIWfcjGXWLkFhPo1m
         fiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848898; x=1791453698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhCLJRTVNsdis8B08EU1ZSRsp44UCFICG7klwxtE3HU=;
        b=lJXFSVuNQSTD5pC0HHLxwrjpDlK2v26qPYMgozJ5zR07V49ThDeHEpUqESrXunoKny
         +h3DH8jHiGJYyC8XjtTo4Zb84gpa61Rg0knT80nPJ6+P4pD0fAwDAy1Q/lUEbSmf3zvH
         sJfJQjAWDZU3JVIAGdx1kHVyBRlF0ahyDEs9AU95Q03dnONcVAXpW5aC0W+lTkmDGFM4
         0/WSwWBTdvoZCaJEM88VZq4JY//PL66eEoNbPnodJO4gWziaIuKFjdrLP0hpsNsRT34z
         yvP09oNLFnSl0Tjbu49QyK6lPBKhx8MK9uVSoOJaEOmVhn1XBbC87GFEEismh5xONu1q
         IQlw==
X-Forwarded-Encrypted: i=1; AKwUvBxMfJ4sQPAgYrj3FHoXp/GyFFuK7vHGvjkpinl5cjZiMqPeY2YrIFh2XkJO4OjwxAwaGncFpQO6jxpj9Mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNhZgw23CWBE1JYdCEpj1RPMNvKcHWZKEB/8wJMVXbA+nm/Gt/
	mVXlTIwN55G7awEtevMD1m++Eq8VXiAnX4xqs3qEU6e9acUa43EMUcEFGRJN7CE5aibs2quVpJ5
	XnOF2MsQBpyR0qgOn1bwBH5WFfaaVhu329vKUM8YqkRzwquHYW6jX+6wjx7gCNWaKyPU=
X-Gm-Gg: AYBFou2Eb/TJYR888H8C2V9zao8P51ncap/dfZnL3HsjgFuFyGurPYTmZdY2qyNdLpT
	WA3uZoXP7tWIlOybeo7s0BMT9t0fgb34UqJwR49uhM+uMuGa9Ao4ek0cLc6Kn8Wm3hdJYXjdzmx
	zEum3YKEpIIlmj2oAOghkQwfiGzsjs+qYtu9zzU6bXXYAjQuNlahS9Hxdh1JPwwy/iCcfk/ANVd
	36IHu4jCMO+LBwzRvQpCvjVGkGNi+PAUDss59U8H8xJHd2FNEdbH4YUVTZcMLlBShDTstx8yMu3
	xpHbzNHa78pX6DfJoyiR9+oQwkGzHQ6JL8R1WAcr0VSviNCjVWTXoHQ4eF3CoH4tL/D8oPsxz40
	ugCGLG81jeTnvBikJ9JGg8gi967K98WLSikbUSB+5AJQPRDLxOLXoKei4vQaybP0SVhlBfBVpvM
	gNHBuECOzV8Wlz
X-Received: by 2002:a05:6102:3f91:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7be73997455mr918866137.29.1790848897366;
        Thu, 01 Oct 2026 03:01:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3f91:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7be73997455mr918853137.29.1790848896786;
        Thu, 01 Oct 2026 03:01:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f1e64sm14360591fa.17.2026.10.01.03.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:01:35 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:01:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
Message-ID: <rp53rdt4rseek4cjmyqhmwg6rm25nnm7e3p2qvmjkr3l42ymmo@25os6fta5wm3>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfX/6Tkwk8CLBPk
 utJ/a0RdNBELNWSJ0yi15hHHoyyofH1TMfauKOJGh3vvNmdQ0tRLKOztiSjUNowWbZZ2nQ4BVbZ
 DI6J+l9v4Ka+NYm5xZI97VRhWqf9+oXKOkWxWKRf0/4WtOfGlf5nrPndKb2/yhRb205aqbe6efV
 xU7e8Rz1B84aiSn6MrPV10XgEcDZwEuQEL6ZXvzbx/cHNxek/dFiPcyYlO9W2dpVUzoc028w2HJ
 P74sjvzrLz/OIEkPAi4VhfAjA6Hj2IFYBuKwKKMvZb4mygkSwXoZXfChccyRLBXnpVoTl7jRxeu
 0RBQll0cJJTJafSm/b/rZOno0RsfgzzJwneqj7CxUxDgDPhxlYFp64EzyI7JE9x5EIuQpuCxa24
 B/KowUwhSppoZsHdQCBCYM+SfYcUY8M3MOzOKHKJxMkMzIAfcKnhGnHssR3dvgftGcg6YwQdy1Y
 PU76TRaTg9P6yWV+lHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfXxF4zEcyJTydY
 hOoTW69aXO+N4P+678rxRFxE4SQddVEDvdXWPNvNxf+c9yLEtfzIbpx0vwDii+ii/T93UbHam6c
 Qq68JJR1l/txMqZGE8rw+zrH2Z6pqXc=
X-Proofpoint-ORIG-GUID: b0mGFeSxFORkVMONHItqlF8f-9ye77E-
X-Proofpoint-GUID: b0mGFeSxFORkVMONHItqlF8f-9ye77E-
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe2f82 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cuVGQRL4-KZBxk5-JMUA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010039

On Thu, Oct 01, 2026 at 03:04:21PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
> mode reversal based on Type-C orientation. Add a configuration flag to

Does it handle orientation somewhere else? Where? Is it a property of
the SoC or is it a way how it is plumbed on a particular device?

> ignore reverse orientation during DP mode setup and enable it for Glymur,
> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
> fix mode value (0x5c).
> 
> Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
