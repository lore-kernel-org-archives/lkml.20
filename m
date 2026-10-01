Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBCD33A9D6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818229; cv=none; b=BDP1AJ1fce1gyiTGgbmhGLy5vZ+enKowD0P6sPqgNlKO9NE2B6Khy6SReerdDq+2bHdF5CgLpYHo+mGPC5zOEuqgvDWW9Al5csLNIGxHxa+dvXq8H2nguQzoeizFzXqSLDjn98lTeLirtlRx6j8wEupN250Ro9oRHXbgOMW1rEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818229; c=relaxed/simple;
	bh=ZXgnVr8vrxSlT+suTKuGSZBoYlHrJqfLt1b0lFvpaUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLvv7W94z0QVAvLU9nMycbNzVie81xFoWI43tkFr82ABoW6sHU8U3Qfcnic0nYc/0jNqAbpCwvVUQ6zO0bwtDFSmtrab0/C0clY9ncpeesHaMw5hPCIlxupULOMjMEb9262/cOQqdY6azUhc7jnmtkcHabI6NrnSulhnHxeeKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlohJp8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKtZc36N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlohJp8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKtZc36N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jmWl171560
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 01:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGwclrvkGkFDi/gd8U3LJ8vU
	MTfgL1qtLx/RYSRBDR8=; b=jlohJp8/meS2pus0/0/GbJO4igfnxXNFvB3Z1YIX
	TO+6PiYRgG1i9OjsKz7xE9w0Wge+QTakFSyR8BuA9kKknRr648JMXbF8rBVJ3Kr+
	DQ3f39iOBaPBx1pu/FGvlkDn3BHqmU/GnTCvdOKyfSrn2ew51vOKENDoakS158xX
	LD/Htc8wKX5TI2XS9RtItvyMK73U2DNtIunQja7Wu6JYA5AifxCWNbFIU3Gg2p4I
	ONUQnURYVhtAiF8j8MtKmc+Uztk6Rybqg6LaHZ/opYlrG5lZsiHDUVk/DOdD5aad
	uoM/u4y+6+a6F7HFWxOX8QuXuINGB5KfjgLcJX5FE/iBVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcspg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:30:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso215286685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790818221; x=1791423021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=FKtZc36N5B/C0LeKDO8TRS4rGB6Q8zNNCSB+BDINbVmkTtISblZkG7uvJVnp+Unshh
         DdVPQIkoB62HKkJUo98d5pWnShtgFowWhzzcibn3OxueyjJrQWFVxygXCmbzuk6yjKPq
         xPxPdQ3KZIpVZskbTV89M9r5rhwMKuA1w1BNR1r03EbTY9ZrJ6A2Qc+UL7ovuO79+Oxe
         1er36UoBzwnsYTynkr5BgNHPAzIYOBa8e1JqNgEy25/+OdnP7y2SprKYvwpjhCiSomCC
         ui5I9YnLnNyodiWHQhBoa64mMnYAjoSHV9bmWaLB+c36tDsal0afJpcYrihINpjq6cGt
         /x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818221; x=1791423021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=dLLUrLotYYcxz8Eb0OHzUdBlf7qjXkPVWCucazFXdguRosWel7IYcEIpgwcwibTCpY
         WYiz9XGAszgI5IAhEpG62csO65CsAnANSwoWAGhAgSa1JkxI1viqqPRyVYKAHr5v+Qaf
         pwYno2ae2w+PhdY3cA1SCIcZllrrnDNjh7MTFUgyuDRhbHQsYpwTLCuHLnjk33ft0+IK
         nprHKHIzi00balscSRoTmCczimynuCpVPZk4HibNvBf4pl8Sk73mlv8EfMB2wAILD6ZY
         kjEb+bDLkp1gMfd1WksvOTk7yMm3dOTLMWip60jgRMuTRiUa3odUpBKPH9pIYIrgjCaj
         dN6w==
X-Forwarded-Encrypted: i=1; AKwUvBw2T0ZP6TXDiii0HvQCYxpzTalSgysMZYkOVytqiBBA34BbhQA9k5Jdp3Qwy+TM6S0N8U3U9nFarSO5yHw=@vger.kernel.org
X-Gm-Message-State: AFuF++kVJsKfFFxW/PNdfMGVo4MV6qvxrmcjUWmU7k2vCJwex4ZKjOGX
	yLBCnxQMilPwI1tpcfq/QyCY4+daiM0NNPPtk52HdSPStPDnIdCNh7Jza/XSBqjAmTBSUGFlHl1
	75QJueZjhvYTKdXhEPpvBWmAc3PGrOjXfJMbvttFbGliEHfo7nJPz9dwZo8BM/ShlKPw=
X-Gm-Gg: AYBFou2Ya4uFvIGmaemvbqA2P47dy/tbDoHCb3/1PFJ6sF6lPcIJzSDQkl435c1/+2+
	eYVhUyP7lVYDSdspPBID3P8pMI/kP6FZw3MigF0laUAjJjABK7C4u/4qRn1TbsQPGe+7cjxclMY
	SjCHQBgbI3ET+lJ9ilp8psOJhzaHbpMsY/vIz7tU9IlzTLDEM+9IV3XjoZeFWg2yoZTezYzaNLv
	nCTL3rxhag2Xco7MSy4+pw8Goj8NYMdrFm/2yS/16P3UaZog0jEmy71Wds8Ck5NOYH8drqyfZwr
	5nVVL6t2uJ6x3Ep74CTzN+Y1n2Ae8M1Vzk45aaNvrIxs5w+Vm+ZFi9mZIgsRT1GRMBOFcRoBJMc
	t1WQN7Ut+2LfVDPiK3E/Icq+iTHsv7Xalozsxrf7byoPelNvgljX3Gt9GfHP5XPMK365Iz4sXJ3
	ENCtuDWObnk8cb
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539019485a.18.1790818221388;
        Wed, 30 Sep 2026 18:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539010885a.18.1790818220566;
        Wed, 30 Sep 2026 18:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059a94sm170385e87.6.2026.09.30.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:30:19 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:30:17 +0300
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
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Message-ID: <vj37teqcz2gzmwjjn2exvadtby5vugpsloa46laktwiyv6yjlz@px7ludjbiub5>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
 <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
 <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfX7P5KltgrYFdJ
 aKN0FB1qfSA4MJ5ax3Ee+kx8uELTCAXP0UaJbvvF/C+ocp7vS/OcIe9lxw983PJ9Gj928JDmOJr
 hFwr+OGOr+R3CH9T5CtqDb5uyDwodCpq7toK153E5UWiRrL8d1Q/D1WoN/5jQgDfn9XQKNeH+MO
 ihTSHo0wSUvl4S9FiD4IfBMw5ee70iXJU/oIxcmeUUV14xOJH16lBf193ZWDb4uqNsh0CeGHYCK
 h9CZovsoQv6MEVUJ1ICnJ7Ui90Pt3jFKgzL+stdTAKE3ea1H2f1/k9uzmSr8wB4TdQN3KUWGtBO
 kkVA1yLHo4AXnL6qSHTaeAMjZ7qpltA+2fj9EkpoVIpIzJwlCYUmYwzOlVArSfSgR9pPAzsfsOD
 TfbBssKeH+BbKJ/RY1TZfvw41ZJiKgLJ2WO9knAl6SggzhceGZ69lz6XAvmeeK+q1yPycvq/PAQ
 ecnrZCfI1DT4hg4CYQw==
X-Proofpoint-GUID: m72ug3dO5y37wShs7WR5yyNZ3xHN8PpT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfX3F0BCdBx/Xde
 nIVONTcplfsKU3BOcYNzjloKGBRl/KZTLT2J+fXsIEwekFX6Uxj4aScjGnb6+VHaNHJd6h1JvBf
 fX1Plp6eIaxoZGe9b7BtzN2Fuga53oA=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abdb7ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vJekXL2k7A3vZJSvyLMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m72ug3dO5y37wShs7WR5yyNZ3xHN8PpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010005

On Mon, Sep 21, 2026 at 12:26:54PM +0530, Nabige Aala wrote:
> 
> On 9/14/2026 4:59 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
> > > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > 
> > > Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > Does it use ref clock?
> 
> Yes, it is using the ref clock.
> 
> [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem nodes - Shawn
> Guo <https://lore.kernel.org/all/20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com/>

Then why did you not add it to the list of the compatibles requiring the
ref clock?

> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > index 0bf8bf4f66ac..91d7a5c8e19a 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >       oneOf:
> > >         - enum:
> > >             - qcom,glymur-dp-phy
> > > +          - qcom,nord-dp-phy
> > >             - qcom,sa8775p-edp-phy
> > >             - qcom,sc7280-edp-phy
> > >             - qcom,sc8180x-edp-phy
> > > 
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry
