Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297240;
	b=Mnd5c+YpYaDG8jEQwWrQedWsoZfliixpTObjSYeKaVWJB4W45mBtpwbELAkjP/v+kpqV
	 sh/znMl2r6ERooF9dLZ4dzFQZZSCVPTLPJpODiOXTgc1tW+BakcziLFjyjhOrdPrgsZ/p
	 VlxBQyI8Y8jGJM59buXNcnuC9rS6zqrz9yTyc6Isl4XhTP+ZJsbc5lhI7upqmm1mY+RDf
	 sB1VtLEN7jtvwN9ZYd3sKvTegGBVLGmesOoGxWdQrH/jAGwwitwBfJD04OjHNAXqEO8bO
	 CuCMCDsrx9o5hfeYqCucpw+4O/Bfx40E8aVT97ounIcXlcENHTMAm4OBx3a8l8nWXSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
	b=LRFFar2JK7Sq5BMwTlvqESsOWlAN3c5iNlAsAr47cPr0WMukwDLQWq588pIvgEhyBn3x
	 hEaEVpVaXaUI+W73FhTRewomCMyqReteXrwRmpNjWLa35vi63b4kOdglV0VNmS9Qm+mUi
	 WFr5vH2L4gzORn3/3KFyxTZCMgpsF9IgTsGBPEVvuLHPAnrU9LRlLx99/twMAgnlkKN5+
	 W9jcZyF6HlnByXsOU4SQxC5RhjVrbp2xZ+9yq4cTYI0LYaFZZl9Ha0nvUvNpJeZy7SFYB
	 Of03iAsDWx6TK6wDPO3Pg9+fTyk4VJyM5Vj2mQlW8e48KoaOj/HqgFA6+bmIcWfAlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FB606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16FB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kgw22779714
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k40nDh/DlGtTF2XbNI2TG8kn
	C7Im/kFKhYdaLoOlitg=; b=VDj1jSP6Kx57MAyoqGynoI6DZIi1eMpV4I3D5PCT
	Y8OrPUOmNfA7IYtea0LpZf0cEdIq0RlZBDmBKI0uyVkPlON6WnPpLYW/xrzd4FLK
	P9L70rL+NplPFkyaccPVHpf/CSQWIv9mLJBoKAZSZeTu9pv3GZFbak1yebUZ1YoD
	vSQziQzMhn0HTPTv/cS/QsGpSllOKPNglnRfW8dlEtvuWEeaquMnmPjjKKOZv1U/
	s4t0/e2SGPTd0hd5PLmafOz6SKBv8mfseWU1PL059TUanlLrqXiLDavzeJJ/HlQA
	TCbmPiqRaY9Jr9jLceGVskvzhMaP/jPpSAUWKGw7SUhhpQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8126-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:53:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1401074c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297238; x=1794902038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=QposB1QjII3lL3fzvW6h4wIEP+05RkZ4QSU0mdx+ymeq/4PRw6t+oJhe9DJY69ZxfU
         48wtFImqGKLrJvNs39fPvcqYWmVqpWdaKrJWgbbighTYM4nwAxNfaV66yD4KFwCYB5t0
         7jQvDUxMVKy72GIZFVgviE0XItKeUJ/czqqPnlx1Y5WkJqxSzL2czgnoaFliTuldKf72
         Ogxno8iBdGwIlBmXBnCZOUzsHrDktsRGfPkl9QCgsfVUKex+sdeH9KLIg8gk8vOTzhmS
         sp+T/QtLm6zQ1b4r44SeqLC9mxkTDEjIE4kxJ7W5+j2cSFeESjrsgFu58a0P1WWhi0wT
         AEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297238; x=1794902038;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=jMbkLkODpIgnN08NwEzmBDGBsJ7z4rQFDHGn7MtSEu4c7Bq1o3U/t4/bCe1XGipmek
         I9midPylURxIzYazl2BePXlbzG4TvwuanIHs3ckM5c/SKlM3q+XxB+2NYz/AazzT7Nzd
         18Aa3JRgBSeX0kLk/eUG40lYXluOF+y8deGTPP7vZHC2RcMNpQx1l2huDqWfw3QoYnqf
         EQarA2bJBKCtddKLu6tXmKcdOSpAHkiW7m8EalxWL6kd4ydqE5fSoB6lsty1xBRmtEA6
         LqI09vk6XoE2h8wForKdtIRVPnd5s/+ciVM15Fe4PLUiN1Qdrn2Y8iLbZ48IqZNBlCXs
         2KgA==
X-Forwarded-Encrypted: i=1; AL+hErF5kqlk5otgtK6M52QSSshXHoT68Cd//AZmctp/g9Aa/ZZ+TI/xMIdYZmQ64e3JPpcG29wrbQEHye7wuzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FBiPwU3ez6/Yx2htf8jXvdevpl6CxOwrdl2ZKEgXVNAaNclDV
	qRIAxOqi9lBVn1OckGy50eORc5Ze1ANBb0kQ4Zma3o2N1YUYnukpbsRkd/STRt1e5m+OKcVW1sd
	o1QU2Ua2Lr9tETnQCcN/xY9n+ZbzHROIYQr9/xaq2gqktLsSkGT8NkhNo5rUbZM1QodU=
X-Gm-Gg: AYBFou3dGIz6N5T78XWv6BYohaRNmbHHQbvnaHRtE00tCCCNkpbF6Xm7drf9SUMbljC
	rqHX+XtwJHUEqBrBS6NF6h+iQ+OLoeDYIDzmC569ND6GniaWXKxBXwvRO9M1IolyNq6E30+WbHZ
	Xx+wOnQXL4LJXqiqhgDHQ1us6/rqaQ3eNF3PosDndiS/tFlaHgTZTUdlc3xKOfdCjP+932iS3UP
	0wpqAkhRBtPtYju3hEgwpQ6QgTrm6pxzmvvUtAJKUHhsFN8iszmz3AEyIJjl7jD6gJOZPGui4Dm
	LdVtO9odl4dmV6ca4bN7czoMBm4KwCHU8HjrFqOZq7lWleefIEjxg05HmLQLRXF70dOrXwwbA3J
	iH8ssJK0Cl+e9QRLFvaSnnnpZ7eFqefXyrN4bE4RkPRAispVgZIHa8LvKVqxFEcIUtIOvpYaoOC
	sotReF2vfuTs9OFZqu9LC3JA==
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771603c88.23.1794297238053;
        Mon, 09 Nov 2026 23:53:58 -0800 (PST)
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771573c88.23.1794297237340;
        Mon, 09 Nov 2026 23:53:57 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm7259850c88.5.2026.11.09.23.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:53:56 -0800 (PST)
Date: Mon, 9 Nov 2026 23:53:53 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
Message-ID: <avLNkT-UPTsFeqsb@hu-petche-lv.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Proofpoint-GUID: LoNL8oJoI2NdE9lecR6twNiwro6hwoPv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX5EzL25SG1q2Q
 3O7hGzRT1NPbie3Tfw1ah6BRlQrAxUUxNGLBxkaerHa1HtyNPn0IsJnrdQ7Jivj+HPSfwEMfHKE
 k/8ln38zkEDM4HqWSR0nFG3f7LQwBBs=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af2cd96 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=8fdUJlHZo7_b61wjJHwA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: LoNL8oJoI2NdE9lecR6twNiwro6hwoPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX22hzTXVgUm/2
 6G7lOlwU0GJrpmcPoMYwbZDa23KEclIbuFW8laRK7VtPFlgFr34ycDT2vfy+uPFxsd/6xSyIBHB
 PbhjTrehOLLbrRht/zTDU3kmFwlMlOjSGM9cDJaICGcwyNeK9tkR9iwtF+iahHCB4M6KmuqP2ru
 jlulapNtTqhrq06cFbFQyi8Xp5UcOdT3CcpT7V3alz1QsRp17XXAHmYz9SWGwabV+LFo+MfMZPU
 MSXu8c7ZlLDIAR+s0IireuVcUnlkYBekepCWTXUPIC6DYPPfi6/hwBePo2XeF/FJ63nraLOeDTx
 krBH3wVS8h6Bgc0GYCoInghFLOvdOOOoDI2qwb2eGibPAnT95DRC6pxP2dZVAoefP/U7sff2QKG
 nwUVL8u2UCVT/x3XLvu8Z9M46EEqmpHErUWLzfKwpiz8Lmnbot0rCGNUmbsVGfV0j0QLLKmYDBf
 efS5THeUPSpCdG0bTZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100031

On 26-11-06 13:57:13, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. As a result, the comparison is always false and the PHY
> always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
> receiver-detect path, regardless of actual link state.
> 
> Add a dedicated qcom_usb_ss_state submode and carry it through the
> generic submode argument phy_set_mode_ext() already defines for this
> purpose, instead of adding more values to the already-overloaded
> phy_mode USB host/device submode list.
> 
> Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
> ABSENT) as the submode contract. Patch 2 makes
> phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
> makes dwc3-qcom.c sample live SuperSpeed child-device presence at
> suspend entry and pass it down.
> 
> The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
> it the same way for the gadget-side case in a follow-up series,
> without a second mechanism.
> 
> Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
> attached, suspended the system and then connected a SuperSpeed USB
> pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
> legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
> USB-OTG capable port with the same result. As a cross-check, repeated
> both suspend scenarios with a High-Speed-only pendrive attached, and
> again with nothing attached, and confirmed the PHY falls back to
> ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
> device is present.
> 
> This series spans both the generic PHY framework tree and the USB/DWC3
> tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
> drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
> drivers/usb/dwc3/. All three should be merged in order and ideally
> through the same tree (or with an immutable branch) to avoid a window
> where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
> yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
> is Cc'd on all three patches since it covers both directories.
> 

Is it really we need to do such complicated, why not just call phy_set_mode
before suspend according to existed downstream port speed under root hub,
it is normal requirement to finalize PHY setting according to connection speed.

Peter


> Tapas Rana (3):
>   phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
>   phy: qcom: qmp-combo: Select LFPS detect only when SS link is
>     confirmed present
>   usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
>  drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
>  include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
>  3 files changed, 76 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h
> 
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
