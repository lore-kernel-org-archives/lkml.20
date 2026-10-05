Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C0478E25
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197125; cv=none; b=hUopmUNpUotudc4BF7HU6Piheskqz1ZH0sjZDrwQkvMrytKkKy3onnVLBB2rsf/V7B8A1G41vSABcUpt/9WbLAeZaKb+Hx+GKSa4wmmGj6qxVLkpQfQ8kYPSrkEK7Bjix20bDPs1BgZHt/0c3k9Kb7VEmTcAhPcSBnqunsO5VNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197125; c=relaxed/simple;
	bh=Oi22PG/2WusMu/4lVK2j2cf/IGBMHwO0Bsn1RuvnEt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STe61TY9Ia9ZHuX2LZunTnWAWPsDH+y3gUeD/P5HA1pIpIhxZq+krIVRMSE01LESjq8mLYGYp0nQSL6kjjdnOz9KEx5oYvwjxgg3IoTSLRx/rfJo8xc11AyB5eZuZJYC4SsQSwO7RnZh1UagaCW2g4NOvMrOutySKPeSfOZAfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJR9AuEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZlx5fVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJR9AuEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZlx5fVZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xPjk493521
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQeClRWL5fMnV+jW+MgQGB0s
	7nSB8YFmEBzlXVtXF7g=; b=jJR9AuEvbL0VK2nl5a38FNlDKkChzxp1nZsKcG/7
	qXezKMQxYRBlj9igqMX7mlEvTWA5ESLdkAAkBHthWwd2LPNlrmg7ODkkcXtQ/nnw
	AI2zPgwsm5L/O7LE1Eu7y2U8N6alJ/OX21qZWSle0BLV1fGACI6NOLABApPUNZCK
	4cExS5J9BVz5O0ri3GAoORoEytWMUHBXNgmJgoWIRhkjpszBftt/tQAKQrl33z0j
	hMDBuz9iXAjHEGPjx/2hNwhqArsjLovpSPFteMfjBmGYhKv2YnLiGfNlg8aH6a/z
	m4tuD4QCeeKOhhT7s88IazqzvDW1RyHF/ZS/XkborU+3qg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkd0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:45:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5762782c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791197121; x=1791801921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=CZlx5fVZQOb8klRHJpYygdeOtfJOKx0ERSWeJYcVq7mazinsfn4aUusLTjlZrz720d
         w5mLSyN7RhEzMxXmT6IV19brnqUlQD235p5d/lX7vNwelZ/uSOax7Q3CsZwEhhaZRIHS
         mGEafWqaygMrpPD+953jSZJD63893pj/cPlDs+ZsEkuzWAUZ/4kZwM6LsxQo9QXJ7ZMy
         oN0YGuBLuz1z8o8Gm1LY2w0ehl3bEWIZ/kIj0aMBc5ahyyBWLEXRgVp/pGuSabNfEqiJ
         fyWGWqWE4wjrHq6O3tEWiy8OlAoFDi0og3eLCc0J7Fzmqk05d786xCFoolYG2PTGCzvJ
         D0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197121; x=1791801921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=dq3ZKyqzAKsc+17fR3jN2nrrcRbiuHwsHT7/vn/D5pZPdPNNWAtlBXHioHcZfC5KwJ
         hS4nOOvWfmna0sKdtFyQ4fjZbP1NxS0mURW+kxPpegkaalGuABFbw24AGAb50F8584HQ
         Hh+b5rlm+9M4BgvcqmkrsIRiF5nqcTU1Vro0vSfgNl03ZbhWanBBNMo7PsvjSep22tvn
         YSFHU4TmMkb9UD4pcheDQvWR0BY9YrIEh5DU2+67Pk2SgADO7WK2bNAyxzksInez8RzX
         BEUYPB9qVUYTYeQeDZDA/KuwQTT6KEqHDNA4g4HKQG+fZx7Bxlr2/uIht6NA3W8e+X0V
         KZxA==
X-Forwarded-Encrypted: i=1; AKwUvBwC164EL8PyBLG2at8Wm2xOeXHFm62FHxO0QC4ZyoByp2X2roz2RfqruCRnTHPgUsiPAqS4bUZ1qIbtehQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nKytmYYV698NxQJj/nqxPTUULlQT7J3IuzzpUIPSYFI5FNu3LZ
	o7739dvaRvADSmlFFRHRC7ZckPR0R4gSlZEc/Ya9h1tEPbonQATWuT+18SCp5RcKYWBruKR3XFW
	7JMojmxeGsc4e1JVtCmpo2f9bPzZJpcdNlwRz0mi5nPnQTEjzj5kszzcI2EcePly9LbU=
X-Gm-Gg: AYBFou1SfqfEgd8jCCMtG64mnlCPMUMebhh4hVO+IVVuD6YeIz9h4jXz+0IdkXHAmQY
	aAB1p7zQ3SO+ULRkPhKus8+ZTczxn0/IJoyLf3KYXya7+HOO4AlxwLk0qel/UPdZYJKRDfcqSZA
	Gsz73vJqKNlDoxIvhzB4Sq0Qfu//uTB7WViiTFs386EYulfPiyJJHbuZf7FJJlrQEl7D9WPwEIG
	J9C37yP3F5TxmR24x+xGtymII5CejPdB6DUTV8+qTJEU3N783o31JvOgKmU4h/JXrxxVrihSZ+E
	5PUXX483QYmZGQ72p911QXOinqzqhOlMiagU768ToazFPolq09938Vy6K6Q12igzXVe8N9QrCGD
	QmUPClBtxbE/CzoKj0fBvDS8x209fbiavNqNxS5Oy1vwPaIqw76rv9v90K1LpK65MGOp8SsYJ/h
	6WZdx9G+j3epb72pukNIQAfiQCMxhCNQ==
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694215c88.43.1791197120983;
        Mon, 05 Oct 2026 03:45:20 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694186c88.43.1791197120458;
        Mon, 05 Oct 2026 03:45:20 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc3992b6sm24328004c88.6.2026.10.05.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:45:19 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:15:12 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
X-Proofpoint-ORIG-GUID: LPOHw9yRboU92f_pYCNbrtrV8SSBKCXF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX4TR6WqEJua0W
 McNml2aAN6rZCWdLofm6oAQ7y8bXqkXsH1x9+fqgA7GXZ9U8AaqXmTcUUH9Q4aN1VlC+2TNYJ9X
 Lja4wgZPpsnm0vJazDm790Ih6WT+3tg=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac37fc2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3-y4kEJGFriZeApEiEQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: LPOHw9yRboU92f_pYCNbrtrV8SSBKCXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX6ynXZNEMMSUU
 ZvkPtfMMjUk+QatODdGkv8FAkc6nEDg6BiwSJfb1xYiTfL5c3afePEYB1qZlUgddnZTHZ7iyxGf
 6+49vcgiNoWh4V8rZmNTfyBonNLrvdVGhBkBN2zuqTKq4PQim/89BpAnjo8fy3NvKy7WiNrbdhK
 JeSV2NQQwUoTW1gFGT3qhML2Tzd17Feg+kvNZMPecSAGPGxQ3TGAkirrDuL3Njts0QwHGN9NQuy
 kALMUpYc2SIQRz0vkdGh9yA9nRsVH9vJI0+kTDCagNH0uydkXqnpDDkWinskU12knisvbtFME+y
 rxHTTTQZYkEwDBckmNqNffDpgP2rouD5eVMF86VdazxNn39hMHgWVMyJ/D6sOVmoWNH+gvgdHha
 8O1PRFa0Dv4wamDko15qLNmbWaLtEEhdsZR6b1YEU05KtYO3QCIOe051iW6ifE2VYn5Ypdm88Pp
 5VOxxVjcB+/anFsYpCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050041

On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > on this SoC require a dedicated init sequence and override parameters
> > before they can be enabled.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index b6bbf2b570c7..8957f208bc51 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -29,12 +29,15 @@
> >
> >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> >  #define POR					BIT(1)
> > +#define ATERESET				BIT(0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> >  #define SIDDQ					BIT(2)
> >  #define RETENABLEN				BIT(3)
> >  #define FSEL_MASK				GENMASK(6, 4)
> >  #define FSEL_DEFAULT				(0x3 << 4)
> > +#define FSEL_24MHZ				(0x2 << 4)
>
> Use FIELD_PREP, please.

Not able to use FIELD_PREP, getting this compilation error.

  CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
  449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
      |                                                            ^
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
   39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
      |                                                 ^
./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
  136 |         ({                                                              \
      |         ^

Thanks
Varada

>
> > +#define VATESTENB_MASK				GENMASK(1, 0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> >  #define VBUSVLDEXTSEL0				BIT(4)
>
> --
> With best wishes
> Dmitry
