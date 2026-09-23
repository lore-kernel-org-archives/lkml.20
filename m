Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2AC48CD43
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165289; cv=none; b=s2rK0CHGkKDbTisKVN16DuGBvWT74sCrHttvCsVFXAZ9cVr3P0d8uMfcpRjR4eGJ/gecTzaDhzbj9CSyr7trIGiAmVbcOpo4VQZnQliaidZRzO/DPsBiLUhKedOV5Dl+aB1K0dU3YNe4AP8O9LaKQmA3BV3Uga6AIhli8MZJcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165289; c=relaxed/simple;
	bh=TVBPHusqWEoACQtsD+GQYAuJBrAiFhUzMO+9HIlBFmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWAiZdJnpwghwCUO4gaN0t7/YNpxqqfFQ2f2j0EjZ3UgTPLu7AnwY7y5t447huKHquzSIuwYYjPYcwUKnSnmJcozvMDLS4p0wj8Eg4BU4ROja4Irz3TjzbJrIRHtw0C094eZeTt5/qIbZuehxmO6eqQ+4zViBMTFKbVc3E2dKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQxNHb51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVw0hs1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQxNHb51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVw0hs1g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbbL72466695
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ac58Jf4AuIL7xTX8YhJBJrNt
	Eq92ktj3IzHp7Ff100E=; b=LQxNHb51KzzyrL7Hwrn/kFxOeNAHRyMGTx3ose4S
	vvSP4sScMmWmoH4zPqWFaI/VRPeO7x1+n9f33L/5P8U/GKaB673VFH9hXhznsO33
	ED0/zm2P90pskLe0eFSo5l2RrT666+PjL5sYAbezKjej8Rk3+h2hng4s/cA0JoAH
	yjo00Cf24sYLP6eGm9+vTOQxqErEDtfBH7Sa7U7aLq93iAfZ5jfVyeQVwRR+6F5E
	ZnqrzdQP2kqaoF+ge8LCPvhGnst/bJUviNIcCd3gFaj4ESL/yWaTnBy4280OTDSw
	Vwoui6WsjoRxUzN+1hE0fRp/zp1EGsR7LxNaA0LBZs2drw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3w9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:08:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so109417241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165285; x=1790770085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ac58Jf4AuIL7xTX8YhJBJrNtEq92ktj3IzHp7Ff100E=;
        b=dVw0hs1gm3jslVDgzbGSSi3nteFv6vnJ0M0nTfcZJyslrotRq8BMXDD+gDSIHL5NO6
         XnqM+gGqRnx4EakIizoh3EesztQnyaSFLTdV619VdJ2pzbITbSir4H1DT3MPjYXSTJHS
         MaMVRqNlxubeZAAgB1bgcGyAeyXEqncGQ+YDUs4kBGuJUSV8d0HFIvvY5V/GDskeZMMk
         e6X4FXRRVE7T0XM03V/bbowSuoju/Vlk8YDklomjAk9HgmmKZS0wHMV+9mdpmSFmFMyK
         8FkzjogMBOR6C5PS+AjWx9ewHVlGJlWeRdcWiMzDMMWp36S7+LDJZHjIQ7H89csI2dzS
         +Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165285; x=1790770085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ac58Jf4AuIL7xTX8YhJBJrNtEq92ktj3IzHp7Ff100E=;
        b=dd3Iiri2io3tPdUVdTCObIWuSWPTDRfFeTthhOAppWJi6dv3X5yDep51IfQSuq+Z1e
         pxdeWw71yFvUZOZ0JiZlAjRcHq60Ka17mlCKnDdgjy5UX7ptPtMzBr5CViOHqyul/ZpC
         1nG0G8QmqDL/qWi42LeAP/vHHud8Taju7VrgxzNyR1JZ9BYHeXSWid3wG4rfJCUEwb09
         4ncoBgBWvdgIJudoCbpUdo7msB6TUmR8tKY8moG4NfG8W8x1dU9hwI2Zafs0ORxsbH4J
         01Lcmvh3kt4t1xZ35n+iMzPRgQKd2Zai0vjieuAzoJmHXU/DR82sAYjvxGs1ek0UnfX8
         vj4A==
X-Forwarded-Encrypted: i=1; AKwUvBzO3MFUe6SNFQ2nhrdtNJ/o6jWHeebA07uZAMEpiSNIISkYsayQTFo84dbylcgxLew9MN8L7rCgJh2mg2w=@vger.kernel.org
X-Gm-Message-State: AFuF++kQzNhd5xstGbPkEtX7ZSvGAxk/uZFaqRh11Jv7VgHuopXk4wAA
	TRXYVfr68D39lcblAlXoBQwquxI7ECOtU6qUaewSJvrcFVcs0fgTfQuws3wpqLzIe0thyg3IvdZ
	8TNPvL1/+CoXt+/EbVuXR4wGTpjYwK8PjPiyRHe3tsdb4TjJRpuEGUmqYpMQxJ6fBqIM=
X-Gm-Gg: AYBFou0pSojVsg/54HDLt3IdeEDV0uCKwLt5UHZYM39d5sXY0mo4wtYLZm3l9VDcygO
	fJQjrblq/h+aWlyk7VH1jpFqKnhOB7HnJfVR0Vqmtw+6LLxKMtF42KLsjz7Eo2ZrBGl6i9VyiAS
	/FCqqwnIAgkprOF+XTYviY2+0Bu+CUgA3d3pYiOk2SVRa6NUIC6hOck3wGqssA5bbB5MENLBoVE
	5nDsN6xBuUj2XLtDalFysM/Le+aoNdCRoc42lxThs+b49xL/Qxr56pzdTLso5MC+cpzq1CM37iJ
	VbLDHH//OsZ4WBTS9AjuCxPxorYWIWzQ7cTLKLeSe1qkCfUbaDQEYIQ74VJ+KwvSJBbWrgu0lLH
	Q6bBa2vLr1QpL9A6IhBERO8D19xIPUsWwOe5kvNgx/sH3CDrvNWEMYCdqJEEPJ4G6ccBAnqE8q1
	WarZWgWPP8AihL
X-Received: by 2002:a05:6102:b07:b0:7a8:1b8b:6d04 with SMTP id ada2fe7eead31-7ac1acd94a9mr2001374137.2.1790165285031;
        Wed, 23 Sep 2026 05:08:05 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:7a8:1b8b:6d04 with SMTP id ada2fe7eead31-7ac1acd94a9mr2001350137.2.1790165284492;
        Wed, 23 Sep 2026 05:08:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d85787c6sm542035e87.21.2026.09.23.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:08:03 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:08:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <e4uqn4dybttmo45gucxdxcgimfskuzlqvtdo7u43ixlyd3yn5v@aifg7nchvc6g>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
 <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
 <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
X-Proofpoint-GUID: p335UEBbBku5a_lhpUrRdVcTBL0HGI7j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX/yB5hQd+v3IJ
 CUnGGPkX6WIDCsIbvG1N/NLQ8vOeLSmORn/SX65Gc2qBrlcucbHRKdXqCTNWwAEEcExJ4WtMtNW
 GFBZzLG9vM3tBca4uGDATmHrlbRzUJo=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c125 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uvE_TNlm4U97XJhv640A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: p335UEBbBku5a_lhpUrRdVcTBL0HGI7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXxcRu+aREzm9F
 Ni3DVtKHeoY036UaO6Zv4Gc3hOGyTIdNLk9TsxJvhiCBLGbggmuSoeLOq5q0YOFf3wD585hs9Wt
 m+i0yTrt0LbWHZGOWKyOSCIA6m30dTXW4RBiA8hDWs5y9jTxsM+OxwPMPJD7WmwK4rTy1ltd0LM
 dA32dcO41G72P58h5MsoA/iOEL2wllzCKfii8K0CLoHsPimWEDUSlIitpeHRg472WOaFBbPNfUQ
 Ejklwn5z34LKiwemp58ctq12L6u953+6G9+C4kqyTAMcodjtbNwJpLz3NHNljPydQ+JKYXUitFJ
 dgsTRm4irhPEpScfleVn/rf+NlWsrS5Twp0o/dTKM1458KkVS3fF9wi+MpKbnJ7JrOPwCQJ+sLd
 xqzxXVckOWKXG9U5vyVvIY4833dbRAdAy/dt0C9m6Rq3475oCh5vX0rNhIzjLQfSnPCxY+58BUI
 NcVD1RZOgnEc4pH5xyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 04:16:21PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 9/22/2026 9:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
> >> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> >>
> >> Enable the Shikra MDSS display subsystem on the Qualcomm
> >> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
> >> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> >> for DSI PHY PLL stability.
> >>
> >> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> >> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
> >>  1 file changed, 118 insertions(+)
> >>
> >> +
> >> +&mdss_dsi0 {
> >> +	vdda-supply = <&pm4125_l5>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	panel@0 {
> >> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> >> +		reg = <0>;
> >> +
> >> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> >> +
> >> +		vddi-supply = <&pm4125_l15>;
> >> +		avdd-supply = <&vreg_disp_p>;
> >> +		avee-supply = <&vreg_disp_n>;
> >> +
> >> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
> > 
> > As far as I remember, your panel_bl_en enables an external regulator.
> > Why is it not described in this way?
> > 
> 
> panel_bl_en is a Qcom's daughter card specific platform signal , it does not feed into the panel.
> 
> It is a board-level GPIO on the CQM EVK daughter card used purely for
> platform power sequencing.
> 
> Adding panel_bl_en as an external regulator would be misleading and incorrect from a hardware perspective,
> as it is not directly going into the panel.

Well... Aren't VREG_WLED and WLED_SIN1 / SIN2 directly going to the
panel?

> 
> for the CQM EVK, the backlight is MIPI DCS driven and panel_bl_en is a
> platform-specific sequencing pin, making pinctrl states the
> appropriate binding here.
> 
> Could you please take a look at earlier discussion we had and let us know your thoughts ?
> 
> https://lore.kernel.org/all/29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com/

Exactly. The diagram there shows that GPIO 91 (panel_bl_en) is an enable
signal for the WLED regulator, whose output is then fed to the panel.

-- 
With best wishes
Dmitry
