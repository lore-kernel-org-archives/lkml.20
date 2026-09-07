Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9E3F1ABF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753975; cv=none; b=Oyu8v6HHmKUt2H7kP+OLPPwjv/uq6bnb9bkdIxkjrrseGwAoZU19fJYdpsOq5+C519W7DCBfmYHN4MDF9uxEIkQSBgZzUVx+aZfwQqt3dvCEtciPhHcre6EAqBmNrLAsE8qauBPnDb4RiPbEoWtlJksiih0mHBYaQjzaIFSysYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753975; c=relaxed/simple;
	bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyR9JABXo2b58LuZVizemZMHhXtAN4GIKK1xrgsTHE6TVdJs5muGzucQHUmiaAB4DCxFRJkuyxxUpZi004ANpcCh3K4Nli8UyRwIHBnRf/VpoZEVQKoeLxSxc0e7krSYznIvjSEzsWC9e8s10lPfjBw4M0CpaaHFf1niubudaY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKXU1pl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0tY+toU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKXU1pl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0tY+toU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l47N2820800
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 04:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rH1aIPieBsj/Nd4+aNKiR1Bo
	k0SetKXp/h3famtzCNQ=; b=VKXU1pl3f3oJnygHRfy5/zI1H1lGWcQI9A3aaMlM
	AQ33hb1OanlXpvXv7XVTKJqdsV2M1Bhs02mjLb50dBcCCwBaMmgGF88iaPGzLOJ8
	g+qGBJTpR9ItqET0ROQKDv0/dRazKtThyxQ6og7q059OCROQIWSkM6PhxDeyejWO
	eFbCgLY17anTMw2TeMUSnOT7YsP/Yt7RcYCwYCjS19OAgj+z6PnI0Ge3QhaBrCbU
	sPex3n2e1uuBK/hitm/jMkrUDvwnTFaY+fzVkjzz/s0DpLAfTZTtQrPhQ6J39oXP
	oOlkF9iePmncw4EdpEnYxS9HGr+pRo394cA9UH7Ne5k36A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhmxrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:06:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso3727347a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753971; x=1789358771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=f0tY+toU0lLtFDKTVQ2DzRhpzGP+p3cBOv2GsTIC1S/oROy2sX3PmUprovZk80qMCw
         3Hx8TqriaImFcPTENPEgQRD4neaABwHfr5VqeqIYoHIuUL1G5uns1SKxvWMo+TXOX05F
         jL0pKTidaRFYXPdXqcl2gOCg+Iny45qSSO8oFXogv47y+zpYaMOpNnJ296N+wmxdV9LP
         7K166U1FvjvRlM2iTJjTJiXhHL+5oFxbYLaeITHWHov/rwFODUQRMen3HNb8Cp3vMwdy
         rgXyvjZJQbiBwUUJAOpFgCd6fZlmGexVjeaTwryNKTbZTHvbVoSeLkpl6ecwQZl5j3Xg
         H4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753971; x=1789358771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=MJdzpgLhrWwHyoOPMGYX1v+rTfHV9CAosArM6B1z6jNaK++s5GHQF1mbCJFMw/Zl64
         mYtTBpso3OdkbG8oERJgvyPyd4FRdYOWJbm0RSsT5sVn+Sc+mSlCn7VFN3Kiw96Ex7Qc
         El0uChseYb9oZ5kKxRY5YcBYZzsG1Qjo0eNB0Z/s1rikDOqz3f6GOWqdOdYt1GvUB0Ff
         J+N0bdjJCyzSpSCdJrdvgHrSVfwKsAPaAo3yF/HscPbg7xb8FLyqWRxUO3wY+eeuBO6F
         bs35mj/2K1XUXLlT/1Bsya8UqJUJFwGGoYaJLPDDEguim1v1aWi9+FnJTOO36AjVNhZb
         L6Pw==
X-Forwarded-Encrypted: i=1; AKwUvBz9NqDoiEm8DZSF4J9k+b1BcfsheqiRdUyrGvNN40Ouoj10CzC3c32SLKaYfaOEt+7GD+EC3l1P512FIGw=@vger.kernel.org
X-Gm-Message-State: AFuF++li+Vpdc3t4zdQYH0bqMGL+nvFTbO+kfU9WTEOgk+O2lUufhTln
	dTgLLKJmdizTJDcdg6dBD2uZjI7biJ4rPuvVW3IEDzXDK7uehJotpltH8tKk/tTL4y4PBWIExFf
	v0cIgK0X4VxEfAyfobj7wk2vj4Ob2kllN9jyvp4f7LB5ZhY+j6anX1SwpS0f77C2T1j1z1vtc2d
	k=
X-Gm-Gg: AYBFou2WByPxYiN5+cEye1Vc07pqtFyfiYxNIfZmG6Cywmlcm7vucBGyN6L1yVyTDGh
	uUjP2NeaLFYzDtxwsTOgsxAlII9OBh50eZbvSzi3h0B1eNY6vFgdp/NXtiz7Sm2EKUKfdRpWJLc
	vuE0mDfcqAvIXvwTj38jfLdr2z52dDDMAv0F6KLAL376etkuA6fMncNXWUcTAJDKEYI3PddPYkc
	HKnyL9V3vrPPaKVtM4GomJIHtmUOG0SuCWF0b86gQFSgSdGlS5k8QRrONKbgt0Wpm9oENSbT/EO
	iAfhlDoGGmFzK9LtTcOULgmFxDHduVbHe5fVyyyBG3fHXO31qwljJkzURviTAvHZ4cQfkcE8A00
	Fzv/n5K/Nc+yFKVoMXrfcDL4ix2V92i6al39PzqKVt8OJO3nlhcl7OPBcNPTsZYaHQKIMh39Rlv
	V3kmUqYXFIfCDMrCcxbP5nysSlZvyYhg==
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31468910637.2.1788753971160;
        Sun, 06 Sep 2026 21:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31468840637.2.1788753970728;
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm20112549c88.6.2026.09.06.21.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:36:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap44Ki0U+B2ctqeG@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
X-Proofpoint-ORIG-GUID: M_B7UeSJlH3qI5wGB4v-_8XPu5CT72fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfXxoQUJCrz9qCL
 H04AlYzMfsA8CzTYu/5yr9BhM4yn/pE+qTl+kGMpeZ68yu/E93AqB57KEv5pNg1hLU1+NWtHma4
 twAqkAoe52NTpWp8W13OLrUhZzmwzkrF80G6ekOhxz0N+OhHnCFXo7ft/FBj7QLCsTIDX04PXiq
 FGbAzRESmKUfcL+avEuB4KO43SoFD3BTcajNONg9rrLFZirAYeCKFYaeFjpDWdrMi4p2pa1t3lm
 596vofbu82S0QyWt01AD94qvCPXcW6lQ41X1nuWiM///v0DLMdiqSDuSZOulhJeJRjXF1btAnPj
 W94aLEzLJcl5AX0vHCyJpoPjk/GBgi36PIJFbafBFnfUlrnsl6ly86Pwe0f8FdIxDioL6JOVIjX
 oqZ2+ZUGPFMxPMYZupn7PAk+8P0T1jFt2SgaQjwZFVmAKKNRBycGCV4E9ygH+EJmEpHFe3jfZf9
 R/7u+i9hUxHSBzVLTFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX55h9CaLGFEJp
 QILng5Ly/wz7qOKcBXFzmFKOUWTnlJNAnTSkEN0nitFl1CwhqnbDvdcJFtyea9k3dCFN2PQYkYI
 VP5mjOwToRtfgNjDhiDYapIQdm6eci8=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e3834 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=JVfIVJ-FkFmCULzTX5EA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: M_B7UeSJlH3qI5wGB4v-_8XPu5CT72fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 08:46:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
