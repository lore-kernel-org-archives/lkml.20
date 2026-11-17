Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899005;
	b=YT0U3SiE3JGKN5VUQbsRqJp7cUZvYTY0sbofXl9x95nxfopc9weZahH2A2l42pP+y5EL
	 ndmt8W09b8CskhrbljfN6clKB6l3gMXBhssy+ZKbXD8QN9pe9XXMkZXbDAUqC/E/a+pAM
	 1LfJaan354BG2J0moyOPNH0ZjwGj4kEieFQZPhezXG3QKqQIhyrFwgcnJ8T1g2++MfMHs
	 ORWhnC+IjQHzXF7fbPs/tYBYqc06ChDLlHPG/qm5bhpEcQNZCy5YWYFriYeiliYScTT70
	 NLfTlczrOfH8rJZIBxFV9ygXfYsXKIfCHmn5cb7kexAaWERSVDXZSkvHfekSjxawgjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
	b=Yp4Gi3r0vsRpG2sk8cuPRkkMDGGnIaHNt58Cf+NL3ixySHw4FGb+d/aktLAcTuOJwd98
	 Sud0WYh+FmtD1moz6jLHr7MgfDCtZaYWuAbkZq6bubnicBxQW/3HL+9wuNT4e+xr9DDEQ
	 pp25gbD8tsfletSb1UBqUKfHmmDRZ1WbjqngT2kuq0FoiX1kPHM6mO9NDA5gXC0fwyZkL
	 l09K7VFQay9FVgyMTaSENgkSiVAzWYskwYplex/Mcl4HYh90o2flEGUODNaHeJuSdXN/H
	 dLbVF63pRslNfLxahH+emGzAndc4Ylm1s+hNX535HXFj9xC2WQsKlGAIBpd4R2V74Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YOfgiqYX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q3h38kFL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YOfgiqYX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q3h38kFL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LmAF3980749
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lBwQtKsaWDkw06NQG+ONWSv2
	LveE3CT9fBPJlpwloXo=; b=YOfgiqYX2aKuJDkVKIDfbOa1ABub0VL951BIfu5K
	a7zBtsdygFyn49hTn6Wja2iMQ9XFDLBdJXUO+H5c0k7qkw2mW/qGNYyo2XUVSFcU
	zBEDVv/TKQYNXqGUkan0yzzQa7hluVC3v1pM9hfQ1Ufu0ncJB1B4V/TVZHyaJFVz
	pjcexW15AhzALuUjKE/hqSrPFay+MFn/8nfKn8eq5YCyrG9pBaxz9AHOawGAl0cp
	XCjryMi1G5URPMu4bTPVh8FKu8ZjQH5DbjUFUjsxZ5Ts9k9DBWgb78YB3CH8YE9I
	nYuyVVCc4TM3D1RjOGJVB+LfusFEXe9aTildqnlDSlOmyA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd04ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:03:23 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8615bdcc5cfso5249792a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794899003; x=1795503803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
        b=Q3h38kFLb7tgsSHzmvkmDPezrBMHJyfeOag+oUqD4JKyBMIqNKviAZXHmh4CmukBUH
         gVjOnasYOlDPefsp+MEA9UegMnKIIJLQ1x3StuhRq9EPlUu2JJXzcX+gL5MiwTV22BzO
         IuYWKDbMYiyrMGrkW85w1eIt5Y3L6XAb00UEqfnLS1bJGbBLh7Zt14sR728mhu6zsTxP
         0dOklm4Q4CtLlAullhySd2yMOCXP33bDG6B/w4rywDZ00BlpuognTLDdByELjcu6KcSy
         BSOvLOKK7ga08cHaw5rg12axZLLvh0goN3WaSLD+jqkMf5CD8nGpmUjvJFdfSYpA+RPY
         5b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899003; x=1795503803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
        b=dXbMjYwjQZZIgb2UvrPVkd+3S3jbEKS6xhWLdqm4lQAQIw95cYKXiHfDvfP9qXTAPv
         7a0U1pN8VOJfuEpLXxsw1FzdYpu9y6ykSvTB9weAdFyLo5BXmZkww2ggDG+DgzHXq+VM
         soiVKgw1vjgNiHOLqiweC39aFHLmm5tB3GUyvAr9PjkiSonToXIRL6z1uYHDVgRQ1S/W
         +e0MZa/XrePgRBN8rupyRHvqR5EewQJlIJ/rUC56/4JotRDND2Z7ryLjn3kO88AEqP+q
         piiM2ShTDRtIw9pPsO8k71Vdda/VUvHwEpsN2+IIapU0sH/LYjWTeBIH7hl5PqDoL7ef
         xCSA==
X-Forwarded-Encrypted: i=1; AL+hErFydwOsZhHjztg3QEuepV3HomOiih+3RVHpPR/tSherEz4mZXn1fDsa8Ef510MSUZVPMu/bo1z7UDdKPCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hp4I/apz934bNiekaKI1/zNfkmLQVqb43+MekZphuMmf34tF4
	bQBVggMOUpBDvD6CGOVYmTj+CX1XcCyL9Z9+q2ak0IuWq0G4P1G6TjU+2egHuhB9C3VxNKz7ASQ
	tOqKnWpOTyVAuyZIeSIlWL+mTfzQ3eewsf/4KMVQ2MaOHbeAhCHwI1f7Q7BD1kAeGiOE=
X-Gm-Gg: AYBFou2x1jZmyznkSrJy35tfV373aXj4bHigIvP4/93JiZu4MSPUiD9mvGE5SLyN9/U
	7j3iGrL6L5Ve9YbAj0lDz0M7LdnHsDStaHEBCuM1Eg/jO84gJnR9DGsa157as2s5P6w15khrwBy
	EZKCtyRB8GAIVx/0MTGGIjFof+SsSwsMW08QB4/Hl6aGOKNhWU6yuo1caamIKTGaFDKpGF8p6eH
	43B8S2mCTcHFdjithK4NfAv7FpAbi2NlviGEBb916K9glV/b+Qp1Ckk4BieY2LR062quW7Sy+da
	WjHzZtZian/PBJbsNkYxGxlQCnmPj3K97MSYqouXPctCOKYDMkUAEXYC1qXmQCkuYHDhvciRUrI
	3VDeMiPC105jWBaY1qx2PNHLZW9dlEW6Cz93i+gLSB4F+suxZFdqJNC2VrM0lLkhXNhoAJBLYSN
	F1VSC57/Y1/mkdPRijwbWe
X-Received: by 2002:a05:6830:4c16:b0:862:af57:790 with SMTP id 46e09a7af769-862af57495emr9530807a34.16.1794899002983;
        Mon, 16 Nov 2026 23:03:22 -0800 (PST)
X-Received: by 2002:a05:6830:4c16:b0:862:af57:790 with SMTP id 46e09a7af769-862af57495emr9530792a34.16.1794899002579;
        Mon, 16 Nov 2026 23:03:22 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862a82c4625sm8601782a34.22.2026.11.16.23.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:03:21 -0800 (PST)
Date: Mon, 16 Nov 2026 23:03:19 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Message-ID: <avv8Nx/ikeIML9DE@hu-qianyu-lv.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
 <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
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
In-Reply-To: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbfc3b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ddo9B1qCPzyyS7SsBnQA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX8oAOhI0AdiIi
 FR/DXNh/X9nK4T1rSZLp0bsE15t3ntapvD+ZezRVbyf3iHB0Vg6n5diO+S2DmH2ytwvfk1jYgCM
 h74vrWEaXtnzAtdtoAXNPIbnly53oQE=
X-Proofpoint-GUID: q6KPxsmeHI6BAUMmxnT_qPhfq4E7SNqS
X-Proofpoint-ORIG-GUID: q6KPxsmeHI6BAUMmxnT_qPhfq4E7SNqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX26wIbQ1iMWR9
 SE5SN3nSD9OruJ8tuSkb2HkWGG5cDUaddfT4Uk7q/X0+Ahncz1ix0Opm3SlyiQiop9rehM5BRqF
 gSFyzOQdpGcwbFWTWPHzvKRyBu8m6PdmMBCbAoi7EsXqUKb63D7Dt0PtV+qBrAHPC9D385XJ4EA
 FEkXD/180opZ+KTTws/l4KSBQSZf2PG5F4CnebH2QT0am9dxF7BmuVndcAfnQ6OQIbMDe+xDQdj
 baNwVdVlVx9/YX0XQGc8o0irgWcxZ036aLOGhG7qssQs+I/Q0EQXK59iNAcm9h/5vvdDJIWLxoL
 Fk4kHaOP8qHOadEn5vo9d6JXOJIOzw2vlylBubL2vDNBrK03oR/EUZilfIkqUHmY0YNwZd4W9x/
 tgpbGLL//Qz2isfBxyggBMbj8WxP8jeVjcEweuJdqs+jUrm3sbpF+6Ijgd/M0IC7mhznivvJOnL
 caUWLhlf28Tb/MLWAUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170027

On Wed, Oct 28, 2026 at 03:37:40PM +0100, Konrad Dybcio wrote:
> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> > Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> > vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> > and SA8775p PCIe PHY configurations. This avoids modifying
> > sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> > 
> > These supplies were missing from the original driver, which was found
> > to be the root cause of occasional system crashes observed on QCS8300
> > and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> > lacks stable reference clock and voltage, so the PHY never becomes
> > ready and initialization times out:
> > 
> >   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
> >   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> > 
> > Note that due to a hardware issue, QREF actually depends on refgen3
> > rather than refgen2 as documented; refgen3 is therefore voted manually
> > via the refgen supply as a workaround.
> > 
> > Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> > Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> > Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index da83358c97ea..ab81c6e584a8 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
> >  	"vdda-phy", "vdda-pll", "vdda-qref",
> >  };
> >  
> > +static const char * const sa8775p_qmp_phy_vreg_l[] = {
> > +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> > +};
> 
> I think we could grab them unconditionally, as QREF/REFGEN appears
> on most/all SoCs (perhaps with regulator_optional_get so that we
> defer the correctness of this to dt-bindings for any specific
> platform)
>
Do you want to add "vdda-refgen0p9", "vdda-refgen1p2", "refgen" in
sm8550_qmp_phy_vreg_l?

What about this patch that adds "vdda-refgen0p9", "vdda-refgen1p2" for
glymur, https://lore.kernel.org/all/20261104-phyrefgen_1104-v4-2-ba508fc6ab40@oss.qualcomm.com/
Do I need to remove glymur_qmp_phy_vreg_l and add "vdda-refgen0p9",
"vdda-refgen1p2" in sm8550_qmp_phy_vreg_l?

- Qiang Yu
