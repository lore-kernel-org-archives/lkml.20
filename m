Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CE3E2ADA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367257; cv=none; b=f7ojbUe6A/GOjubNt53mFusC6ZCvu+NbcxZSTmlKfNqdXYgUeoGyTOS+5h9n3dmRh7uUGOA7jQh/bbPTtT2NnxtvY+PxRTxiu7XvciCcjei/OinfmJOdeQtZVakvhMt2hEHW1ROK0nF5abdhWMy/ObRCeIRdI4gXKnX7afuA/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367257; c=relaxed/simple;
	bh=m2pGNyAkt0sHCFp0OE5GdjRCa+vF4RD5tiEKNbfZNoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nij6LNT2mxeHenbANQ/OHK2xzC5s2sxIRR8z9oqQ/Nx3vkxuhffAwOdQoOKXktVTrJYeyOmtExYUT0VjlSvq7DGUv6rNFv1r+tiByxo9Swt2LM9jDOuNCOKIahHbsKeoO+AOqk+KJyUMaOQTyXiIHCRMqf1wNQU203R8Qa/jKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc0+M67Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bT9kzVAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc0+M67Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bT9kzVAA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jVAF3198077
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QsuntrjKLFHd22P/SFBPNWD2
	bJBputtaqFI6pr+2kDo=; b=Xc0+M67QHx4APD/UcoFAIypMtycfl+D6GfO4vLAu
	C1gITVuZGKgNjssM1uvS5Dx+qqLRfNXcEn60yE1K7+w9+AmMeVYUXgRhpN1qA/9d
	0v1EUq75mvwEisvNMIzMLTsuwYTvYJEr5ScCWkP18jHTgP13rOVL0XgDyo4AYrc3
	XgFt5mPvJ08/1H3o9hoSnp7u0f/2Tz0ZW5KcvamYWHGvgMYUtakl4sDEPHthWTvJ
	5Ft6ZW+Fz0pSl90j5Pksc0nZY0JqAAtknj6WtlqI0SabZosljCAoONTEJ2/OjqHs
	je+uIKuBOBrppr/U0watIZte86SU1uPl80qQrylRqxGZJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cd9vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:27:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so5225440a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789367245; x=1789972045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsuntrjKLFHd22P/SFBPNWD2bJBputtaqFI6pr+2kDo=;
        b=bT9kzVAAk2fSfWAVy1EEVFG8jTY9Zgf18AYWYdktg97Sn8XANe18iqcTznl83R3F+d
         CA7Jiftm3r7BWB40aDqeVlyGlhOU+YGVXog+t3n/S380yA4DGkREUZn/TanZ58r/gBZs
         I42mj8KBsBtdzuCsBQzvqBEVCyRgQHwC7sp90krAl/N7roDoROKootdfhjfTEp7p4u3N
         RqZoDMml5azc25T86FIJVlrJxEQI2pBCUAx74JQiibJYTYC60X4yluwH+HbXWAyTch12
         VZeILHFR4EpeVXR07Jfncf11MDz5kbyvjc8mWLM/xk+jzWhbFmcJowdL/5CX30UWTJe0
         9rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367245; x=1789972045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsuntrjKLFHd22P/SFBPNWD2bJBputtaqFI6pr+2kDo=;
        b=WidyM8rK/t3dxc4aEprOeZFvpF6FJlyWZTuFswYtv8ayQdQQ8Fs6GaKeyIk0WDXYFj
         Sb+N/5vjlAwLYbldQIksDyn0P+w0PeltKaFhZUOOBwbOrGjYyTFNePtXI3A+vTEdhE14
         wvZoi9ZLZmwCtRBD0l+fVg3K0CQQ4njhFV/RJ5V74z7vQy/b8rvSWPLyCJhl//vnvua7
         DynPxBNww+H85jk6cuRN5LLh89MJzvVZ55AhmjaYPQumoEfelxyye2cCqvsRunEmduxy
         edzXmZSE4Yn000uKHINwDLCHw4Fr3FVilpJoKFxr5NFBGl4NckXEqq5aBWSDmKRgKN5i
         NB4w==
X-Forwarded-Encrypted: i=1; AKwUvBzDe1tzki4whgOEiLDTaLQ+S8IXmdQpl1jFysHpvwz69i6x0ZCjLVuj5m1m1M9pR+JRcciegsZs/124ONE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUCyOnMH8w/N/WbDixjwAYylgd7rrZYtzPFkGNN/5dN40xatrY
	ilF49+UQndS87wg71NPvIkVYLkgev/15X2weHtruSZRaXEB362QZIEKotbqgr0butN8Jl4sjfw5
	CnjA4ponB3sTCez5OAraMYUnanMPDEI+az0lqkQgV0KfhAHYDBCYWGe1mvj2mLbG0Ufc=
X-Gm-Gg: AYBFou3RMW8tWM9mvqAnnRGEDuEauKIp6Dvgo/xdW9xFhXEY81/Sz0EVfl6aqTCxBzl
	4ngfZEXZtjTw7WgqxN6nQ5rWzm7HLGZQ6otwyzW3uMFJ2LYuSDM7R3oq+gUyvM6LOZQxt8rj8GQ
	NmWWXUcOiQLyotc4euEU6Fpbyy8N1W2rOhvAy6Vloqw4RglM/7brC7+nPLvQOcsAPjSs42eVOa1
	j1HU6get6cSpCOwMvFS/5BHupCP4lthIEGcDwVP5GQ+ovDs3NOEqMirntXLEsDnkA1gsBXgyLMS
	8YXOObVkusAG0b4vzoeZMocx09XxPfL0UWrANW8TX9tJw8Dqhmg9Fm5QR1YOGOjlmP66+YP7G9j
	tTA48NRYCP/nLFYlcDSw6Y/dNqFW521yunJoQ1eJIsJyIgoU=
X-Received: by 2002:a17:90b:1844:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39dd570c057mr7002699a91.26.1789367244530;
        Sun, 13 Sep 2026 23:27:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39dd570c057mr7002665a91.26.1789367244028;
        Sun, 13 Sep 2026 23:27:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm23888008eec.14.2026.09.13.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:27:23 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:27:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: qcom: Block accesses to downstream devices on
 link down
Message-ID: <aqeTyRnmsEcChW8G@hu-qianyu-lv.qualcomm.com>
References: <ienbx5wjdzhgtdtbmuqcc76ovzy5d4wid7x4nhq5e4bco6u4il@264db3obw2qq>
 <20260911171807.GA402207@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911171807.GA402207@bhelgaas>
X-Proofpoint-GUID: dc0K2DK4LgBatF5QbQ9DYWJEqnlmRk-2
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa793cd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mQlHuAPmx7t5lgBK5VUA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfX5Y+UhJw1Rg92
 zkPWduxNNBsf+wn9qablSP0BsmsMkFotN3WJH8YOf6/SsEnTSq2AfHTBIZP9jIUKpGYEGWKXVir
 N9DDjpMYWgOPzU1eTYHkXKSVwUlRmAM=
X-Proofpoint-ORIG-GUID: dc0K2DK4LgBatF5QbQ9DYWJEqnlmRk-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfXzaZug1kZ/3iz
 EZcys+JVacRD9jW7Ryd9OBDkpnonKo4YWd6PJi1B1x7fa11hYaW3eUAA76DAGYyts9Yw08idl14
 jk2m3g7HrV/FFoQLVc8psXd8T4zj6PM5xpc1ZXRjcEfn0ocvFMGDdNpOu8UgVkAtgOUg9r1YpfX
 ynQgxinlwhyOvR6vLKsvurrpkxiMro3FrQG5Gid5bLzW/wM8TIzN9BYbOFZ06dPbLeZ+tMnCuB+
 ODK11rtRI5JYIcWjpuDMZngofKzdZcPVUP+uUfIbijFerQci2pjzZP1qF8IleyhDOcqV2XAc6Vo
 UktcZ5dwubpPRbMM3+uka4G/WtbbpSD5HUSGsL5TRFkRe/t8VJKgEv0y1/plrrxMMOPn3rnYWK4
 6DIGm7J2nODGGtVoCGjAyimt4EoTjH883SN6l9W8suw2nDrv4xkCPfZIt/dHYbvL1gPJVdpF/iM
 Rh/VMMibEt8C+KuZ97w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140089

On Fri, Sep 11, 2026 at 12:18:07PM -0500, Bjorn Helgaas wrote:
> On Fri, Sep 11, 2026 at 08:17:29AM +0200, Manivannan Sadhasivam wrote:
> > On Tue, Sep 08, 2026 at 06:00:30PM -0500, Bjorn Helgaas wrote:
> > > On Wed, Aug 19, 2026 at 11:36:54PM -0700, Qiang Yu wrote:
> > > > After a PCIe link goes down, software may still access the BAR
> > > > (MMIO) space or configuration space of devices behind that link
> > > > before recovery has run. As the link is down, these accesses
> > > > never complete, resulting in a storm of Completion Timeout AERs.
> > > 
> > > What is special about qcom here?  It seems like the Completion
> > > Timeouts and AER interrupts should happen with every PCIe
> > > controller.
> > 
> > The special behavior which is common across many (not all) ARM SoCs
> > is that they don't synthesize all-one response for completion
> > timeouts, unlike RCs in x86 machines. Rather, they return AXI error
> > response, resulting in CPU treating them as SError, in-addition to
> > AER storm.
> > 
> > Commit message missed mentioning SError though.
> 
> I don't know how SError works, but this sounds like a pretty big open
> issue with respect to RAS.  I don't think we want a kernel panic
> because a device failed to respond to a config or MMIO access, e.g.,
> if a card or Thunderbolt cable got unplugged.
> 
> > > Is this mitigating an issue that will still happen on other
> > > controllers and should be solved elsewhere, e.g., by changing the
> > > software that accesses the BAR to look for the error responses it
> > > gets when the Completion Timeout happens?
> > 
> > That would be too late as we don't get a proper error response.
> > That's why this patch is used.
> > 
> > > The patch refers to the ECAM blocker (which I assume affects
> > > config accesses) and doesn't mention MMIO.  Is the SLV_AXI stuff
> > > for MMIO?
> > 
> > ECAM blocker is a Qcom's custom implementation which prevents the
> > config access to go out of the link and terminate the request
> > properly. And yes, it doesn't affect MMIO like BAR.
> 
> The commit log implies that the patch blocks both config and MMIO
> accesses: "software may access MMIO or config space ... Use ECAM
> blocker to drop these accesses."  If the ECAM blocker only affects
> config accesses, we need to reword that description.
>

This patch can block both config space and MMIO accesses.

> If this patch doesn't affect MMIO accesses, I assume they will still
> fail and lead to SError?  I'm a little dubious about the utility of
> this because I assume most runtime driver accesses will be to MMIO
> space, not config space.
> 
> I assume this is also racy: any config access that happens in the
> window between the link going down and the ECAM blocker being enabled
> will still fail and result in SError, right?
> 

Yes, there is a window between link going down and the ECAM blocker being
enabled, this is why I mentioned this patch can *reduce* the completion
timeout errors in commit msg.

- Qiang Yu
> > > Assume the root port leads to a switch, and the switch has two
> > > links to downstream devices.  If one of the switch downstream
> > > links goes down, is this going to kill the device on the other
> > > link that is still up?
> > 
> > ECAM blocker is only enabled when the PCIe link to the Root Port
> > goes down. We don't get LDn interrupt when the switch downstream
> > link goes down. In that case, the switch should synthesize the error
> > response if the CPU tries to access the unavailable device.
> 
> For config or MMIO reads targeting a device below a switch, if the
> link to the device is down, I think the switch will return an
> Unsupported Request completion without data (PCIe r7.0, sec 2.3.1.1).
> 
> The PCIe spec doesn't prescribe whether RC synthesizes data to
> complete the read, but x86 RCs typically synthesize ~0 data.  I guess
> some arm64 RCs assert SError instead of completing the read.
> 
> IIUC, if the link from the RP goes down, we'll take the LDn interrupt,
> enable ECAM blocker, and future config reads would return ~0.  But if
> a link below a switch goes down, there's no LDn interrupt and it
> sounds like future config reads would result in a UR Cpl and SError.
