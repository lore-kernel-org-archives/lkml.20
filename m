Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF13421231
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887311; cv=none; b=ddkjGq0lAO3bIlMxBdb9m0X5lf5aQslL04EdrcJN0cc9pls0MTIJLZZCP87KeagXipEa8nyKO/8ehfIsiqV3lGwmmu/MjZWCEgNzNx7ZTTEggU9nQob7oTPEwMLIIlzpPRUbLZDM0TyV2jpvBjszD86gQWElJ2lgG/bn1PUacRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887311; c=relaxed/simple;
	bh=NDDyimJay41Q8YbZxA74mfwjIjsKdQBWWx4V87lUn34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nadQrIuhvNETQSFJCtEJPsqhKjzGb2HSe0fW8sMMN+ucuKrVx/W6rwTOTCSdufqxQ3R0Fg6uSy+3mYnw5E+lwTkM699zopFQAf83yGoHFDjI1MDHGD5gUAOjLbgSx5zBhLKtd/GgLrZF2X4NJvRe5DoCrT5F15IGKJkCdG46bjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+CpLRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Kgq9/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch+CpLRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Kgq9/L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D86AHl302840
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpe8qQ3M5h1iDZEhG5mujR04
	iapwZbDf0fYwJj5/lTY=; b=ch+CpLRf8vZUGgf56aNlWN/1uHUr4tjEFSawUP0G
	hvgrzNqir+yvF+vo8626EQ6D/RSR3XUhr7rAIuQCOJ1um8YKFTPhUhNNtHKI4jvJ
	wdMCptXNiaZqoApCOJOxNmJLnmECRM/b+Lq2W3sh2hOe7tQPW2ewzyswVPl65tKV
	JPeNqlcUO+DO0CI84F1s10yXiFA7HnT5tS00xjcBxYM0tF6W55W6KmH3PnZw9uXj
	HLEZqYLmYIA5ubqTQNoy+h2nhpBJZg4qMS8zAWNsLoluw5WaDfAZRiUbPEbbXY6/
	pEihglGTFqFeFpWudux8AF/AKJ6uq+++QS6JnbQbSoYeIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqacn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so614059185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887306; x=1792492106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=h4Kgq9/LAUE5t7ffD6r6TMKYpdZEhGFTKhy626+kR1qeOT3T/l3Py9dIJpmGCLyvPa
         txJCdT6jfinyZI5+fYBe6tJH0Lu4+pfzwD1zX6wr4eeIsd35OwXH/YRO7HBwrEQCnQYL
         geN4Qk44Dwr4xcVNk8T+Q8zQ8hy0Iyv8RleNMVEe5h8idFWrHazIF0uNnLivCWsJ4qtH
         juhI/Rt+VDcRRin+qc9caFLmJlsLpc6CjARjpiaY+1VFMu3dtKWcw5sTQSRqIp6Ep2DJ
         D5hEozpoRqLI0hhM6WBIZa3u4KDYOP4Kj3ORUKzq6jOOyOLYs4cJsv4l+IxQ2+q8S7Cc
         7KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887306; x=1792492106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=P9TqKWQUFVRFgU+mG78McT9n0KaG8358oQ0i98SXG024zxpJ/Fsj+foKXJlUY32JR9
         Pt8wQtiV8EmYuD1qeFLSAJ61SRdouFh/bzeGsQcBT7IFcIAZQMS27J+jCY9SPzZXVSu6
         gTkGn9kY553yvx8ngEi7wtB+rp7YqZBxs2GZXezbCJVd17rlXqztedGe+1x8t1QrXQWl
         ZB1kyf2fgFIXINtmC2FyBjBIc9SDVrKuDZ0In0Dq397nuvV46Zhyqkdg3BA/LQe4S0+8
         +U+zwZygVKk+8G95PwajCyFuK/6dS3EgpNwWDJAlUEyH2kqxwKGQmUyjSgOdWcyY5mDb
         8M1w==
X-Forwarded-Encrypted: i=1; AKwUvBxBYTcj/IfUokUljP1l3VAzSO6L3nlmy00AK0MHuJ7eL5qRMnPpCKDaQg6YHu+oEj3M+u96bWOJ2h6Co0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Tq7nfQCy5xUGGTjoyemUkB0fYj4SrlDmCjTeAUMeEiPlb29R
	1G50gx5L3yXdhxPWfyhkr8UmN9sbuWSv9imUFjwK3YeJhb/1nuYHVVA/74/Bd9hC7zoj0Wem5Zf
	oDF7hmJPyYZwK5ycel1Tr5SF/p8kPmVU4v9nR1qsBkfBehcmxfRysJErqwU8jjT9wcPM=
X-Gm-Gg: AYBFou2RsXeK9bm3OHhn2V4OQ9R7Xyaf1YnLEBCQn0Z4s5OiqsgcyjCFRUTXID8fQGl
	e1IhwSKHU99zAMYCBF8G9UGMpM+eWwhd8j7Ua6izmn+PW8ySgNHWHsUSL7gTnCYnqWELZcC++aW
	7NvCzQ+aNBNJ4JsytojX66gSqQ86jMow6OzukaVfE9G65mh2YCZ/Y+1z7GpFcfl5yT0wli/kl7g
	COLNHmHev2lnGtmnLJj75KELxR8INN/kR/FpQz7HraVB5wAsABRA7ozZ1zYZmWL+Sa+855GdCjH
	mV0wgY6ofo1poPmsOJ3+q1+vsyCD76rEfihd1jqghHiTTW4jTWqNB0QkOIiztSJvl0G8yugB3m/
	q3lH9dnfU3cQELpeaWAsUV8U/Lo7RI+0Oqdl9SnsmmmkNkfJmhhFw2LdlEZN/grGzFS63TLKuiK
	MORSCpOiqhNH2F
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099039985a.54.1791887306585;
        Tue, 13 Oct 2026 03:28:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099035785a.54.1791887305992;
        Tue, 13 Oct 2026 03:28:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc730esm34197011fa.26.2026.10.13.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:28:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:28:23 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 10/13] phy: qcom: edp: Add Nord spread-spectrum
 clocking configuration callback
Message-ID: <ix2c336s65dqq3trynfpugujuadqcrpojef7vov2g4h4sek7eu@icwb6gfeewax>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX23fjtHDw57uX
 FilWmDP73waAlSBpmimfL6KcnZg89SJJXuxG0JKhM17dR04te5xiigaAcbZ0QJpmLioIquP5tLE
 TITxfOsCwtJbVnbfMWY1qFU3FKc/JEH332jSk6q+PxzAs++UhGGYAQ9ajAdkedmOFI/eMKcebDw
 nah3wLem92+0P8Im8EV8OPy6TWH+Y7WhIB6k0o9wAscvRIH/doBtR4aTUS/O0GmZYOKRhulX1iD
 9xP0GjzCN4n+6GtObZRcDcKZL0eqcvfbVxOfA21yMNrcFRFBNljSqbs5Jzj38yQ7RinOIoL8H6j
 aO7CMZVDVf32F0058Hk9+e7SNOiS4UXf1EaljW0n13Jdwyw7CfR3Rf4xEygCIC+/dKscIER71G0
 SARH/EFnMbG2N9n7SNGfEUNn0ZStNoornOqII1ZRdHdv9qF6mOZyzEJRNCktQajQfJQBYhIjr0V
 GbHtEDLWBbIpPuldlqg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace07cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kwn4x9jUkZ_pmG-z6m8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX8g2mt2Rz05yY
 aJB/kEqlczyTPRzRhjT7NSom54Ef8D3Arb3AQ4gkVexpKs8/Si8S6EzXc8HAn2bAAfa4hJQtqRK
 128fJWQMCtS6poH/p/cbkEBvrWcaTJk=
X-Proofpoint-ORIG-GUID: 8lzhwFTEcuXlqfjRqAiFhi7E0oYApx4N
X-Proofpoint-GUID: 8lzhwFTEcuXlqfjRqAiFhi7E0oYApx4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:20PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different SSC register values compared to existing SoCs.
> Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
> fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
> HBR2 and HBR3, per HPG Table 2-9.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Squash into the previous patch.

-- 
With best wishes
Dmitry
