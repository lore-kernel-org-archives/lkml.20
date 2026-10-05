Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC525B08E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198117; cv=none; b=BJYDUSz78U3/f6zgUkfpfbccWySMfouA4UOruHQCfKwvpQ/59+yf0PoINnwBCuP4fa4p+J98ANxVijq1QQEgOeiGcyMHj9l4ftWPZA2Rp5tu7JuXOHOGlbHG0pt+f3WpNmYCYdfQigWDR7kI6Z3kAwfWS5mspJ1kD18nBTD3vzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198117; c=relaxed/simple;
	bh=//qraIri2DlaIWPw45MlZXonKd5zhrspMWOiILpixHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWemD/RIvkH7L6iHfsbb5B0fKTY/oz021ETlWXPWrf9Tec5PF8ReSpEPzTncOZMifs0G8wjZFx5irryU7LMx5+DmHy50sg6SXa+0kaguQzayNWB55OfaKCo8lVSG6pJApr0ufIu4dU0S1n3gJi0TplmqglREt1OH27rCJFbK9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRk2aSzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LR/O48aB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRk2aSzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LR/O48aB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoGuU1744317
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7E7K4byUVJiE774L54djWwz
	KpsesLKw3mnR/cGeHcM=; b=WRk2aSzFYCp/2UTmSjZw6OZFQVLL2nNsqKUQKzT5
	9rCOtW4CaEtONqe8NynQomZEKSpRaEZO5XDLocv86bG0NYZouEYBIC3sghyJVQfI
	EDin35lZQiDWnzmL0E+2RVRPQ1nwwOTudvgcqCn6ZaiSGdNRwJWtcCzwYpDxVQdu
	npRIzhJoSJrzqkwyoNdRIMQNUU7QzVEQD0tvQma3i0dbkpKHMlxNdYxyWzhdvHMO
	zrk8izOheX1S2wndrQx6gqpeFjcBhGZOyNj/SrWXQuYiQScdKu3Fap6fdH8a5Z5i
	O7BvSubsDDsjdDgT1YJxH2SekT10lEa+ZLB4P8sk89B6Ng==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgystes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:01:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c02e1df088so54360137.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198114; x=1791802914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W7E7K4byUVJiE774L54djWwzKpsesLKw3mnR/cGeHcM=;
        b=LR/O48aB1nHXXNSz3T7Q1TT6CW13xy6XWXl+D+v06opA+faGoued9Qe7h1UHahvAR1
         WLF7SudI6MLBpoRtLsPjJ5nkCKnVfVhXEK9db0n7CIn/YgoencWTtgpVjre0Tyl60IA/
         Ztz1acRsQXY0p5BMTlY+YWX78u7zmd7J28jCy4iCW5TqNvtmu1E10bAYXWv2+9q9nGGR
         ttY8f7LU1Q/uBbSTjNUoNFzhyhZx0DjtCUdG8YTdmJ7TtlE9OeW+6pfiYLL9q+uFFmU+
         scBDx10TiZsQijhI0br7YqfpDWk6u8K+zeojp7SEXTV7JBH8MupS3YYewP7SBsLM5Ges
         rDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198114; x=1791802914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7E7K4byUVJiE774L54djWwzKpsesLKw3mnR/cGeHcM=;
        b=HWgQ2jgxhIREYYNoyWbsoqOCN/+EeTWaTMAKrmoCdz2XYxN1B29fOsDJ4P5W3potzz
         4vjQVD885HQCrPVOC/SA3GIaNmOIeVA/OS7oFNt2cPEw4Tkf0UuYt5VCA2+x3+Buml/J
         S+rYqzIoTIjsMgpXnHY0XqRjgYdQyP1PWuA7ZzvcACS/+km1xuR9U1fSyMetX9CPfYak
         gSTh2gUj3OUierMBUxZ126qCt1lKpdukHz1/Dt7eVKvGj763lKT/Orkliiujx4h5Ydt9
         O/JidibJONnjWZ0okZSdX6SeV2UdBTDDGZOWX9Jma0Ywhi8UbeKz+5Ljoch5GOf6lsjK
         A1sw==
X-Forwarded-Encrypted: i=1; AKwUvBxYoVupEn9RtvC5Q8bZ7prdwOXhKCbC26OjRuqtng/UtnhU1wMIjBlJJCdP/JdAiXx7MLaUHItJvyOl9CI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFyPMnDGsO/mkEnUnaJk/ZCISD988csnHW9zlxd6eeqa31mfOz
	Jhy3Zdpm0/gskVlzIGL6WU168huv95CRzAXcTOQMs7LHFK7fdhiXwr8ip7JY+Yxnpg27ejYFVT2
	8zUs2Ff4/zq2cS3IJQpQcWYNQoqGclJOLpKwQpyWPaNpBzmyffdCKMOI5ON+7D+N4jyc=
X-Gm-Gg: AYBFou3dDNFsNNMbN34kK5HhNaYgwvaAQtMwji3UEkQgebV9tZVB0tu7wxwsvu5sfOi
	c9q/3qDO6hgZBwm0oBCMVfQHQtqoJMG78IDd3WCFu9j7y/GcHCZR/dB5D3+1HP01o3Hs3eXo1zT
	hw6WQqCJKQjquUaSUrtJU6b9oxpqtrIDJFaqgpoSQ7v8F8lBrceJzUBJzJ4+EyyVeeQW3Xulp4s
	banBYU/SdzCJFfbeFb8rchkuRaP1j5aU1Zk408B+KZ/cdpGJZfpcv6QyIHi5BcHI28eOqzAVB80
	t7z6jNw1q0O829DJgxwTxv0izB3IrB1ybo7sz2Uviqb5GlXXdY60Mla1bEgKf79w9A8glP+qPJ+
	15HOD2OeZcRXQnR+1FS+bhAzSaIdQntoZFCGBU44WNyjCQroKvfoBj4NxKFj0IbRg1GxoL2/gfY
	OlaQtGLHBiBHpE
X-Received: by 2002:a05:6102:390a:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7c0f488a869mr2125294137.14.1791198113825;
        Mon, 05 Oct 2026 04:01:53 -0700 (PDT)
X-Received: by 2002:a05:6102:390a:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7c0f488a869mr2125284137.14.1791198113297;
        Mon, 05 Oct 2026 04:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm41714871fa.39.2026.10.05.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:01:50 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
 <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
X-Proofpoint-GUID: 2ZJ-jEqKg3X1HZtPSS3IrkdxOMI-D9GZ
X-Proofpoint-ORIG-GUID: 2ZJ-jEqKg3X1HZtPSS3IrkdxOMI-D9GZ
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac383a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHZ1h7A91xy7d1hexNcA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MiBTYWx0ZWRfX2Wwh9opyCE0C
 bKFTmg3fK+/WZa5Lhe7wIuMIiqMHPSwlvUTXyQvSg9HI99w/qYll4iaORm42VkXEpGnaHMxfObH
 ev+Mt349UBZkx7LUINYk2P+CsDGxfAOs2Hv7XhdlyHZFpocexRvAwkfvl8G4//D6RaSgQIn/ORR
 ZxCttM8gLJnCWwdDL9ljB2J/ZM6eeEFwY/udWdE1hN4fmDu4QKL3Q9VBOWKaV1IGCmUnWMpKUvF
 XTGSF9R5cs5s0EPziRl4r0GLTWtZyLCUmoB6AqSU6p8v+WmO08+4Rxa52JwEbUAkzPxkThuIz9E
 UygFlgfOpZhELoTu9hBb9q1fMWYMRIMcUIC24piboqaq13nmjBsSwTs69UHbOEP7UihdvYEgTLw
 /K4B3YwavhOzjN7okXjyNkycR4INxPGNI12HMdhXEArgLTFajZKOzg7NCKN8ssGt07FCuYbdMIt
 l1dGQjQ7iJt3rRsGCBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MiBTYWx0ZWRfX1VkfBzibrRy8
 cruTm7dGkno8AlLjwN0NLX8La90Lm8j+Y0yFDD+mcAwVw0OiQKPkkrSIevtsIpFVIbA0HIpr27+
 D/DNrE+CZEzoRGZokZ0Kc9hJ9bBozdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050042

On Mon, Oct 05, 2026 at 04:15:12PM +0530, Varadarajan Narayanan wrote:
> On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > > on this SoC require a dedicated init sequence and override parameters
> > > before they can be enabled.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> > >  1 file changed, 62 insertions(+)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > index b6bbf2b570c7..8957f208bc51 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > @@ -29,12 +29,15 @@
> > >
> > >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> > >  #define POR					BIT(1)
> > > +#define ATERESET				BIT(0)
> > >
> > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> > >  #define SIDDQ					BIT(2)
> > >  #define RETENABLEN				BIT(3)
> > >  #define FSEL_MASK				GENMASK(6, 4)
> > >  #define FSEL_DEFAULT				(0x3 << 4)
> > > +#define FSEL_24MHZ				(0x2 << 4)
> >
> > Use FIELD_PREP, please.
> 
> Not able to use FIELD_PREP, getting this compilation error.

Sorry. Does FIELD_PREP_CONST work?

> 
>   CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
>   449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
>       |                                                            ^
> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
>    39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
>       |                                                 ^
> ./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
>   136 |         ({                                                              \
>       |         ^
> 
> Thanks
> Varada
> 
> >
> > > +#define VATESTENB_MASK				GENMASK(1, 0)
> > >
> > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> > >  #define VBUSVLDEXTSEL0				BIT(4)
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
