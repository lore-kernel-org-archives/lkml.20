Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364513B7742
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831408; cv=none; b=uyhmuSU0XR4yarQSKdYbzVkihBubOH7ZPyGyNoeWIzxkOxIu/errvmXDhggQQEXYdRSEmonS9KtQuC7GmVthNhUugwKrlytOPAdE25NvFoLBlOuia7O5N6SrusSmdIF9fXku4H7UNRty+fVM/6M1hzFmLu2M8xVMYDeKi24MJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831408; c=relaxed/simple;
	bh=+64KFNSGBX7Vz/6dKUW4q2vsU2SoIR16uU37yUrhX3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbSInjNIi/etGFJcJyLXJeDZ+/yKv205rWmrGAk81zz5nQ3p9moY8KrwPd67lEIJZtEWbAsIhIrzTOlcnIvPHRncP+QdWNvrlB6vR2gbmF6aWxm8/IdthjN2mpfP3B19q3YvjNDGHU35hyqGEJsgJ0R49KoVF2SRrp2NkOA/G3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRqmmG10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXT9JdyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRqmmG10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXT9JdyS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHujKT3040341
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOEKkonEgbkbhRs6JRGz2EJ1
	ry/BUCqhg/c2vYmmoyw=; b=PRqmmG10IpnegtQtDCWy7NlbwqG4C02FXCkOjm29
	bP0zi3zxx3LzXRNxaOYU3hZzhplZctalnjV4yBhP55plnhPViHQ+ytNv5pbGHoke
	rFo7luCURR4B7jvLXXt4jxmPtJdtUsCJ80cJjxQJq1cwJR88dIBDy04trbmBQbI3
	GoUfCzFHZT6ClFC+Nc9laB1xAW7LYUii6P1x00Qirtem1Y7Aq7PhS9xITbdDjkcG
	f9TBiT8rrL9vGunvsAUYYXsPpgDbP/7+aZ1CilBAOhsXLGvMJ3T4FMJsJAxYNKqs
	g3YaAcA9e8sYl4JtajGxa6LJPRo/djTP013nbYqMVotzkQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjrvr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:56:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so6211795eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791831405; x=1792436205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=KXT9JdySQM4OTCyrX7kQhrBj2Hu+uEHGNNxTcJawZhdQZhZ0jC5grQCbd5m9dw0kTv
         GUKYb2aKbk1C9o5T7mTw9rIPEoVZbxgj874YYWlS60QmMp4DQenbLVYY5J4lQF4IvSnP
         kerEQqnUUcO+o4fmCYPPfgkXRvWr8AvpCD1TViu52tyC3gc3uY6LW5rxpApAz9FM0BCK
         DHAWerFW5285eX8YSPhqUegwlbBoiLoK4XT6wYqCEiC2Zs9LnnjYC3gk1eyjuTDArol6
         wr/rLiDFcL8MfAOw29PuAeQqEAiFkuYvZ96taOn5sa7cSzIp1I5j4Jp4Jlj5KadtRsaL
         cuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831405; x=1792436205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=EDJwlBJIHDZyF3eHrl6Ip80PSwTDYqEZ3qFapzJCZ6bKm4Ps9kFWpvRd8fQ62rKfRc
         KyuHbNa+rj3F8z4rCQWRA/rErO8xCxO5DDFDKaPpEmR4ekLkInTmI3RSNPd9tspWslz6
         Fze7p0b0NZLoMMOr5viogFhZBaHNU/rM+lBzyBqXDEYFQucu3U4ulMH5hFBmkDERK1y/
         LE5Q1VnSpU36xb6ntKhVWTcxFTKtnIdU4CoYafpEnZyp67UupXq/Y5sRoxeWbHBb9pgm
         fSOHBY0akihUy9x3tJ8JVtG6jEnDr7fpiUzNPDXNaygFSgnU44IoULmFPke78R8xnWUo
         HBhg==
X-Forwarded-Encrypted: i=1; AKwUvBwyJwqt9Krg7M0mS1OTPraKNDNWjQv6EchnshyOTmwm+z3U7Bas5ojHPR7HQxH9qtXHQBx3o31qC1TeY3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHQvAZ9OEtY1Juu3Q7/s0Lj4GcAULp6Ul8DFf9luzgi0l7J+7k
	DtNWcUHifX93tknxrSkhBLlpt0L44DViwaqq62vdnorfWrXAW10ETnulEx6jjfxyla5KoS1GbYS
	AZr7ORSI8xQuqADqQIg966ij5FqoWx5toCjuDr7iw2eVWAyh4YAZzaS0+C2ZtWEQnsk/mdI2a+D
	c=
X-Gm-Gg: AYBFou2+A3W9sRYhmEB8ead3aU/mJGyZF5DMEuCI1Pts1YalsxxrVjCajCnDyLcsnjY
	tY8UAme+9fpS4SMGClEiSmmvyjSBnxs/X05SCnTU59KA/d5o12GXGHHudeKNj1SckC2jxvKU1tV
	p2M64AupmKrrM22owxY0xkpKaTP3xP+keox+VBg+NvBtQo65H1UGERQV+Fgrau5HKQNNcQIKZnT
	HV5AlCXEvOUgR2yR7nX+Sw93vJ/yIBheNWw/4SQ8E/ISkq72BHsnol6Z8q7rGZgWdsiBdsnVc79
	XsAg4B05eREPVwwWprLiG2M7q9/uUMzwv53YWMA5dUkaR2SRai2gLdjNs0Xl/JMtpl3TYJitmMi
	0plr4FnlcXI9gT8xw6/J5hUpt
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126140c88.12.1791831404764;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126117c88.12.1791831404198;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm37485490c88.12.2026.10.12.11.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:56:43 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:26:36 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <as0tZM1OFsL5Lzld@hu-mdsor-hyd.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
 <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
X-Proofpoint-GUID: a1A1kuqYK_F4gDG-cH4Xr0jeHfBHDwE9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX08WUi4ooZI7a
 AzfAjnx+jBnCTdNXeyimL3o1vTKw0sN7/oTiDME4b9A8phc5zdGUCWkZ+uGFL/SnIpaXO9BZmx7
 xNA0Uy4y+xzzKon1zCr3EqCEy8Kg9PI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX6GO+itCibUal
 pgOBV2tyfTyAtUO/PHpWCHMmp0LB69wOT6pl31QS5QFx3n42KmbzGgsoD02jo4Yvw3KAefgaChk
 pUIt0VaWJNTqIF4BNgtqWafXpVJDVYjkD+HVPEFYVwm3F3/WyBHcDviUUOpWHUdydT7PGlIcArp
 UfjOyMBwq+l9NSnOmZdgHr/RX3/hjwSI0Whl+lV9kqHBBX4mVTT/fw3UG5rfAT5/zuw3KZ5YEle
 tfyjnD5m7U31o08diMN9v3z2Ci2yhoqkD3n3/VDmBrxR6uTUke3lvO0pQUxQu6Kx7fWPZ+DorsY
 JxTLZDgnrlIkVGeGIFqb2VdYTmJyTk2PXYBpEns3Bn2Cf7fJOIOM6JKv1o2ztOjLbfLX8zQ5apL
 rL4pz8Imdb2oo0lDq6UeYxg/PIEFwHhKA9TmV/0Et1NlA0SeBMvGzHUh+LA3nEBFe3XczLumPr2
 w5WHAKLL3j/4zD95L0g==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd2d6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9ZJ6AgzfprORt8VdnxIA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: a1A1kuqYK_F4gDG-cH4Xr0jeHfBHDwE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120075

On Fri, Oct 09, 2026 at 01:50:39PM +0200, Krzysztof Kozlowski wrote:
> On 07/10/2026 14:51, Mohit Dsor wrote:
> > Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> > This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> > board to provide HDMI output via the MDSS DSI interface.
> 
> Same feedback as v1. Why every second defconfig patch from Qualcomm
> completely ignores the fact that this is not a Qualcomm-only or
> Qualcomm-specific defconfig?
Sure, will change commit message accordingly.
> 
> Best regards,
> Krzysztof
