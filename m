Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EAC46EF69
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230807; cv=none; b=DhW7OwXiABrUh1JIpHuzm67oUsMm6/uphxRkQ1ZvakOdJh98iKH0QIlC/81JM7MSnv69WiZA5p8Pj9hr8JVcG3JL0gIUhBabYzPN0F+i0dtKGvnhIiwJjhnStXH0vWqM/K6IGEwPM/opwq6QWRw/vsQ6aeTsbgN6WPZazoUzIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230807; c=relaxed/simple;
	bh=j58n6xlP1WdLlmhvGi/Za3kYOwUNNCElJDpoHZoH8UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXNiYdeXjZtY66DoI5FRr/LRBYwB1uewe7F92tlgdidvQnWkBmMhnhdXrxfVzPVJGZWRfIw5k4NjmQqnvZjqE0cBDKfk8YCIyHVjrxetUEhqOaVHwUJ8CoiY8OqYA33+j7LbTqrq8yGuDglUr/TalW6V8J86P3TkqP7YM+/ghss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X62dA5hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXz/lOBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X62dA5hr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXz/lOBQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6olgO3534405
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtXS4yD9Try/qCHd07nuVF72
	fRP9oxFrjzBY101VuBE=; b=X62dA5hrbOOwcSzXIK8DZjEgKA5+PWQ5ybpWnqa1
	8yqIdGl7fAX+uVEehWCiT85sopw3Mf8a0BJLphDpWhJISrG4OpDzE8A/v+WorWyV
	yIZjMnqVqyPo/Lc2cLQrEI2Hf1eirStcsENm2ZfyCU5nikmbUYW7ADHR932Klq3G
	TgHFR3n7vLI5AI6CXDuD+aB8prHUGlhHpCxYQ91uNwoiVIc3Xk530e2pPy6QE0d+
	8fbwAJu2Q/RHRf6nLmV7Rcsgey2CNvY67Iib5dF7dcAi0NRJMiUL4oh4x6xu8uGl
	EiJYSTp3kQMXWKGrm8ptLfW5khDdZU5kaEzcLAX3Abau7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7rkpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1014887eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230804; x=1792835604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=MXz/lOBQvaek5smvaQ3dO+1Z+Ay3XeWy7UAfifQCVFxIvup7ugjMNdhOO9AQnXJbhE
         ZuNqJm5hWhH1gG8IAW5knmmdLFlB/ub5XfnpQLkJwCFG/F9gAMkPopD/Q8j4b1/joyiL
         i3CVLXiT1OE37LlQy94MhJJuxKQU7b0Su0EZjB6Z8eGjTCgDj95oTER09cCT4U53b4q9
         Gi5lnCRCpWr4C+GGiTTMxW3WtddqI979Ot7ud3i8Oj5X4ndF6FmpdYv3EeO1FY5sGUz5
         NcQyzkE/c+36QZYeSWyoXXqF/tJLoB9SyVtnMiIpViPdPxoHvs+AHod4+GYclrnWIkUp
         gyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230804; x=1792835604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=HI4L7Zht1oaXLT3/pkIfkfDjA2dkWVaeHNVVnCFy8i8czt9VWZnfjXP8+Yfif/NurD
         4xsBp94LiKkNhT11wuOR+ojYh95a4/kgjpr2SvoT4bwI8rIKhUjMGfNgInuGur9zYLPF
         lNRm4+14uQfMN5NQtl7kPg7eVyat9hIVAlg1SHGkFqICw5YcMgpMyQR6QnoCZa1oP1hU
         YNs8FT4BllUD+Yl4nbc3VTQry3RKj2TEsT6g6mGuR+6HpvWSDoIZpt6QdYp6DFpU6J8J
         O6EZq+ky69iGYWQfhTBIU6DcAPj82TLqAcy1C1X9r1AiD/Y2E9dA4L7zNxVxIWR+Ih5S
         EoFA==
X-Forwarded-Encrypted: i=1; AKwUvBz5ghHHgWwhvK6G81oOTdihSGFbQxjqiNSIj+bKARAVRopTBI6yR43m9/kRMRac61iHZYoAWoj68hOQAW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+pLLnAKbNpe4+dTDTSwom8eWBqUIKXAp7SqNZGNRpuxDPPMul
	zCMDQMtR3jKNGKfVgnMgpEYaI0L5wZn+TgDHV5Muvnv61XhlOePirsKf1LKmRjxZiojBwTAE7Ch
	tp7NpQ7/wRs+7FslTCkwn/XxxszFP5Lf4xd8/INkMoKfRYyEmDtVAU73VkRFvpNp71kM=
X-Gm-Gg: AYBFou3k3vOwZJXZG/QtEzwcMhQbQCEAQfIb8Fd5m79BJ4ea5YoObGjbnvlnGRqRaCi
	5t/NSEqItY7giuqleGr1TKeXBYVDHjvPQrbQCIsI6ATkC0RZakYlm/GFQxx5LDBuIVaR04MVzO+
	uuQFz9ufvswlx4aGQQ3TvSdzZ2sgIrXE6zCdVhffOwTO+1WPXUnPVetLYUOv/MFbdPtBBDH/vwA
	0HMCwqwPuSXxoznQiL6y3vHPmfH25lYT+nI3hgjS/zTa9Ef9H06VVTH55p+2qur8JJphH9AFQe5
	T2O9senhso29LJuIhw0GkVs5MikCvfveP+aVQaxEjhF3jeFNiCvyh+JTJVFHIV2MRiOfZplgK+S
	x5MIkgWyOClfR
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990900eec.37.1792230803771;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990870eec.37.1792230803002;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm13189465eec.29.2026.10.17.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:53:22 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:23:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <atNFiFvIeecfcgAX@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX0wSGNiGCkfNA
 vV2j+rGnqLPShqmYGIFgDTSOurI0OVKBoOHraYT+c0j3mwV3oeIRkRqESTlin47fN591G+c4oKr
 TpTUNE215lKOU6puBrE3dHzwYJnDhuc=
X-Proofpoint-ORIG-GUID: V40ziiX4MomPPYaCFSnTddQpV3gFepVZ
X-Proofpoint-GUID: V40ziiX4MomPPYaCFSnTddQpV3gFepVZ
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad34595 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3MThnnmduzqR5zQ_0GUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX49j3LU9IwW1l
 3X1ztVSvHMw4BF7oZQ1APnFa8l1G+mwoG8oBz8BrnOKVWSEouEweq4LFnkHl6Fvw5VKRv82JspZ
 Do01LKBqghLfOSfLQNJhR6SCNtQBAaAE6RXeDw0hqq0BRc0OWuEfAiI5CpDsbY9XQwIsEJlTN2K
 34Cl1qbXhicLu9eXlMisBB21pcV4tIlWNfFxztLuc4La4/G5KFtrgvQhCVBeZ42N0Bbgjoxh/C0
 H/uZtC/OWDKVJCjTvv3zuoCXEEX6YLPt2Oumpb7x15iVSBaLL2rSHFr7TFXCi9C5yBMsLESJVZm
 uqdyqsgSriv0Wir9sh6+jn2/b91ng05GthCbteba5/gariewrGQa2Y66ClGHV2HW/3agQwJz/tR
 dQSOUksKKD3XYUFFUqxCwzv+mIFeo65jhMfZzu03lXV8qQ6OkBR8ijTKHHTkTxYQOu8mCM9WMot
 VKwJmP0IfU1XU/oyA9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170039

On Sat, Oct 17, 2026 at 03:15:11PM +0530, Mohd Ayaan Anwar wrote:
> 
>       net: phy: dp83867: add regulator supply management
>       dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
>       net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
>       net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
>       net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
>       net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
>       net: stmmac: qcom-ethqos: share common GMAC4 address table
>       net: stmmac: qcom-ethqos: add per-platform NOC clock voting
>       net: stmmac: qcom-ethqos: add Shikra EMAC support

There should be 10 patches, not 9.
Looks like I messed up some b4 setting and it dropped the bindings
change for dp83867. It is the same as v2:
https://lore.kernel.org/all/20260908-shikra_ethernet-v2-1-bbe3389d0652@oss.qualcomm.com/

I hope I can resend the series after 24 hours.

	Ayaan
