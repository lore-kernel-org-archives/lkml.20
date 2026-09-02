Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3844078FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339681; cv=none; b=GU4Jxjeo9KPWFg7hivNuB3YXD6+kdEkDkbz7xqlu1yeCrqMqF2ql9bC3LA1TXyfFnW13BKNCb96HVbe3S2yjjdnvjHA92DU65D53RYbgIwXV68+PGgpizdbnYc+YEiLFwvkYU1ZMxy4b/4P2Bi1S0Y56NAZxJP7+lzdfEPvmwlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339681; c=relaxed/simple;
	bh=Atq4pB3YGZ4lFAEE0+lnM2Mik4PShDbyqyPa7jARmoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMqC7zz5P48qJpgxED7dlzp2e3lJwwKhVweHsgarJlPDeWpId3loBb9mx5zCVQeW+KLxuzHe63OfuRpHC5VEhpGFWeN5ECSR/hmHsOHrEO4nazT4MyhpNKsPivMSSX4TtpvmUKB+0ZdahdnU9QvJJ3JNar3GySCOF83WCYjLgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0CDjcU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ4AsGlU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0CDjcU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ4AsGlU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VVcY1859288
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQbyCK8hb1C0dq/eCYljQc9X
	nj9duFCu694HFTDiHCc=; b=G0CDjcU0Z33uC/+1pPkUPpTkEdsh6cwkhIIBDNuG
	m5bnV9QrSeZxZM7sO0qUxMrZ5mwBp3IlzLTyttKxaW3xa9aYCD3PmoNLEtziQPh3
	BEgDf3lwo5HG8kNtSiT6VXudYGieSg8GURzkWnrPaJu7P9EI8AigTdUf/ViUDeG/
	WZLdSBjlEg8rLS78DWPLsb4jPJAkkSlic5ld2IFdaVtH4WuvDNDj2v18DxwaGVfn
	wMx8+/Xqj1HxCV/io9qcG32g9ZCkdV1mhWuwDnqcGqodXUTfLrTeA+64UItad1g0
	lptcR9pbVPxbnoaYgnPyZnYnjNSLB6JAh+Kd2fmItWrPZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhqb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:01:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso145068285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339678; x=1788944478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=EJ4AsGlUe9vZmEtfTTPB0daXdNVbiFGpGjyCdHatQHKs/kOGtgHDeeSun6G9o7+hXg
         BB1uxUS+QufBP3clMfqeXCF4ZsyZRPP+msozEKcm+ewcETaSuEowdIn0TZUG3DD5cPxr
         Zafxw8c1nqcBE0402AT7V3ir0NJQOylSgXWsvQb3cD3vGGFPzfukCcf6FtvLFMN+vvsl
         QTGPA53ni0LhyxaJuGFW2xiLytKq3ucSU8dDf9WQZarC55/pOEndKBtyhh3VCZaVJary
         KlRdXwplnizQ5plt156I+8X84LQxcnB0f4DtCOG/zbbTvbe/DcbZkBGO2cyurKT8CzB8
         CGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339678; x=1788944478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=rzqh4OCzlCe7w0C9b9hQ2mYnQAb78OCygS79qwIp863VkTPlzPkF4sQ2q0kDuTcjo1
         Mx+vVNsREbWUjhxgHMyx+a3vywazW+fWFUh9l9CpfEZPAfRE8JqSlJ2uA3LP1azAxzgM
         PtPIwd3C3rTR98Eb3JEG6NCPD9lHyNTI1T9ir+uBFGHclttNjhGauyZGZ4T6mK7w2wW/
         eM+Y16G7kHaHc2kXm/SKl79K57zVAuhXhL/lD3D/Slix7CE5pWs+yZBcdZs44Jg2WZvC
         kT6agU0qPuUb1cJML2PIew03ucwTd8fBpeamP0ZX0Mx6s8vz2qG3ZoocaIr+8PJ7XG3E
         vwVg==
X-Forwarded-Encrypted: i=1; AHgh+RoFt75M7UeSPcg6m0EY2yFweUk3WruH9AmXC96l/x6rUH63z8QWpXUIK4nx40ZWoVg4CASUAD48f8RM57M=@vger.kernel.org
X-Gm-Message-State: AFuF++lf3w9ntscqEPbG8Z1WnVzzCgrVPK9NdkFdo2HssvuADM1yLV2B
	zJNwt5VmTYrOdonGxUNQIzAhrh/GMee/gvlZwidqBaShrXV4yO0tgsDSVgiY1QITbJGqO2Ft/yA
	VBUWrglajxtyZllBiKW1NjCev54bCXRYE6l9kC2BO0ofN9f9elNdsRiuBZI0tl4GLjD0=
X-Gm-Gg: AR+sD10C2TNzhBvWpigPLMOBNwuWE8nuDjjBiuyLqED9pYRun8i+QxAx/TDZrubvSU4
	36JmHCzX134VLuHdZPxAsp/R/kjtfAXQuAVcIl/Dbn89xEVJhvLigW+4Ofj/FJUeS6fnXmY+k+Z
	6yqYVUlYTfa5Y3JQ2X1XWOzfav18fSnHw6MMak8C/olIyjpcoqMedAOsV/JXnUPQHT4smK5nBQi
	MKRa64ja/HwT8FMcaJJMWgg5oCe3snmrAxisjCgQO5lBuERqQK9TndU8Raspz9R6IdpKxJyI62I
	cdDFnBxgIeyyT9TEAkxZJwc/eM0yU6E8HOFmdrMoWFl/6utXxJsi4ZnxfNudS4gcKxlwd4QEVSB
	A3nJj4Ks2hWIhNQ==
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141498985a.9.1788339678428;
        Wed, 02 Sep 2026 02:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141490185a.9.1788339677868;
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm155172055e9.15.2026.09.02.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Message-ID: <yhbjhnmuwwqqbjlhpo4ppwtmehxnkiuqagzigf2nieqxqpiako@c4tfpqbizd2w>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97e5df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=siMggkYB9rnzUccrDQUA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 38Nem5cryNOtlXg53TMWlgh8HmEI_tT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX1sDwbfy4KtiZ
 xyNba9yvVaMb6UH2QdQe2vd8QbS93zIF13dHT2gnkOgU8L8Q8tTJFFrdMAHPfq/U9M5SaeF/Hyz
 NrNrjiHNZYqCxbjVbqm/Xz9MzyipvEthSwKYCu/E5ZG3jNBrlbxc2TPbx3x0PnFuvVxZCJNSVYr
 s8w+94AmehNFAVFVs3L848lCpyWZOsXCTTrRrnMwLbeQeyELCgGQINAOoMhhikSx3A+RF+l9K7D
 q4TFOS0mzPOaHBMvAvQEKr3it70iCt6v9u4N07HUu3qJuazlk+V6Cc6hak476m5uc/iXIWXv7uR
 qwcqyStCdPmFVl7Ercf4FqVSkIql4e53UzJX38uQqp/sVKDyPkmIcGAj9p4QypzD6g4+QB1zz23
 J1Mw6tvILgSE6aHhNLPAYB61VVR9b07SeY/nXteiUAw4mSqwcsuFBgVQ3vFlisCBYbvWom+3odZ
 DBf4BFFp67dkun2w2ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXw2iHD1okPe6a
 Gkp91X1x6ZcuZQCjZbSA3uivX0D0gXhx9jAYJnIPdm90CpuEcXWaVfkyJYbLCCs3t3LhKo5rUcD
 11s3v2JRbxDIxznFGqCHIDMSd2kW9bk=
X-Proofpoint-GUID: 38Nem5cryNOtlXg53TMWlgh8HmEI_tT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-09-01 10:58:57, Luca Weiss wrote:
> The supply names for the PM6350 regulators were skipped during initial
> bringup. Add them.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
