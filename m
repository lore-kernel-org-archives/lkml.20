Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261779;
	b=zHQ8BD3/fuimoraINRZlsPEa4WDd3RMyzltqhXYhiMgLO3iU7O9NM/RT0izZ3y7kPs6b
	 3k2qMJj9KuijuKSR27gWhqluSY9KFJczTTprE+ZaUcEPL+DAug9a/nSbCTBhTs2HWg9EL
	 DjRseSNzItWo/2g1qbQC2O+xBWkCEpaJR/WtptvbTXJnWD2+dRry0k/MjdseDW+ud5J0a
	 IA1P8LdfDaHvKiOf/LIWJbDRuWPrUBjG0G5UmAj279t97qPsIp7z0IYUuvzXuM5E1kYam
	 dWFrZ9tqYLPysX2mSy5+tOXTsG+9+9vTtwfWsZwlN4+9Fq94toWzI+uVJ3X22P0mEJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
	b=obSkl4Vc3mWlrDkyZjE62lz+1mfZBRWrU/BJEQas9Ax9/Mq+lX7kg0ipaNRPBWBpw54n
	 Tiwlz053SO5JkO9wQwM/fpJBfLDZgjpTJGvVD1c629pBCtWCxvfND/X8FW/9W/zb6fTJG
	 mzWoGOu9fu5JlU/1PKyQkhrsGRr5OB6Y8JmOrTSgFpikYTh+5aQdpRqv2LUvwE60l1zCT
	 RPImTK0fKVGOTOqfIF4Kp9XWFcAkkalRDKFozNiJw70B76dTlMJAHNYFTg/vTq+gUOjog
	 XKeOwipQ4timCe2XmWCbiB229eQ4TNrnAIhNtPwZAOnHjO61mXP66kcEEhJCbXZu79A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BA606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1BA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA29r2018848
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 22:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AD5fB8OYC8HR6TpcbWLlkKIK
	ZuUu5fuArtYqdnpv+5o=; b=JiF17yliFGrBffx23Bs8PotLT983x4SWY/TK0qrN
	iBZOZ8JpCAq7Iql5wQt4ScXtv5fHXk1Q5ve3RUz0KmYYH375IJwId7BUNwGePw2E
	po+iTMaF9lQmuvgs0bFRt2VVeqzvAnvasVGkhud3WdFZPtnFfvrR8wyMxH5yFuch
	maZsfPLO0JlsnBlPqPRC1Ay8cBIK64ZQRHwDncJa1qJEONRE8MJFDOZl1HEzKnGn
	FnBDhZMlmpSLjsTKAIwruz5D4Anv83eCY+Mc7tGwGTh83eYC+JZSzIPQxiHHO6Le
	5vrwcoyxv0obwy//+vU8/S5Xl31YlnroC1O2y9wygy0eCA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0ep6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:02:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso478191e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261777; x=1794866577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=OCK4JOX5AQuIMfmo6ZhNfcqpK5eHnWguZzoVm6Ej3Tp6K/DPF2fWKs6tD65mkwsTZt
         tQoz8F0/j8SeaArJemrkLlSiyratZpsCiv91Zgg7miCu/iqcUqBB3PJZ5p5ru/j1yR3K
         kZ2fP/rYxc21NIGniyzFZIj5GAIS0AEdBwuIooj46UeOpfBs2o7wDZrmFh+Evvwhvya/
         DVKuJSziP+DnztXWdmddxqB4mM3inlQqWpRZKY0qxXXwmPbAXVUhki2SNdUmiWtq0JkM
         5fnMOsgygUWRJPafc9VJayj4MW82ldZPJWBAVALBF9WGFiQ5hF5bduLR2Jyd/hIcLNQW
         TdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261777; x=1794866577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=lJud1fwuE4Nlzat66gJtE7846Iw5xyOE9zSksC5nTblUmC/59eZrxhztMkKCQ5kmPR
         axgXwYrG3qni2zsVfU96O0xKxlzgmZeJDYqSROD7GOlDIn1nbA1WOHPMS7TR7C9ijUUH
         I3BsDKgDK7QI19ZbAycQKV4Qe/tv524UWeyFNCirZckVFK6/bU5uTn7MLXpiZlY0IcKG
         E8sSeELxEuBPt4FRMlRNB9gc2rd1FjSb0Vq+qIhkQGEVnyyv52O7/elVyh+T+iyqybEW
         GoSgHnp9dRMemM+7yqtXqr30LB83rY7Ll0XKNpRYfaGlp4zp5pI3FWYb9sn3XwYK0evD
         OWVQ==
X-Forwarded-Encrypted: i=1; AL+hErG0qTVomb8AS0kOcCWDeOGLXYm7+8rxrGrrK7XcgaG8yDUvuvsB7E56gfu2KSFDRFyRhfYae861HXhRKvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZVj0UHcpqr2Gds8wECvw0O9EnihombASBzTJv8Z/OyQR48fKo
	DgXnbT1/F8LkMJp2PwS4BNIyYLwjV/EOByKUuERttMQnDPaj/EeGlNa/UQb6KjtWcdi5h66+yI0
	EPHIXQ29Spbk0b/+dfkwUmaTl7vYKU0M3iwRfNp06a4/LBzRAQ+krY8FvEd6+emkFm1g=
X-Gm-Gg: AYBFou1GTLv215l5bXY30u2A2EmnsZvivuRlcgxvWA6LxWadHQb0f4vP+3Sw4zPLlc6
	egXdBo8pqX33hz/R8k5qupkL4aCCPX6tWltFnXeSPjsY9oTCgV0wqC3yIN5K8vdvtwBXYTu8mlo
	Vzp+9RzUjYsAKvV12iB/V+Hhwj5kjT3B4VxOLZnRl6L4pYHytuEtycbVorPEodeYxqI7t0kZOAi
	8Inof1XOYU/moW/aRPI4lnMjgc2uF5mvkM5iNRNdIt+Tz1r+pGMaUeqpxI94Lf9nYjhF8jFEsHg
	wRYDA8n1TMRwRu48ApaOiHvU6esU35q7f+QTybhIcKTesrmETc3HcQAJaQIq4abVysubnHmx0An
	qka7cvKl1BVXjmlG+By1quQtXEQJyKRcETsFK0FgzqfUwBKUb3CwFlbjnyIVmXMlp
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181661e0c.20.1794261776741;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181629e0c.20.1794261776020;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c835fcsm1162965f8f.59.2026.11.09.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:02:54 -0800 (PST)
Date: Tue, 10 Nov 2026 00:02:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
Message-ID: <hhmszf223l4uz2x76rqlu5quefgigaowwsuesmfmuzsdl7epe6@hssfeonsacru>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
 <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
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
In-Reply-To: <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX+uSjToqs5FxZ
 FuL2TvbAliDjQtHZuxSSPj6sstpmCUZV9RQit68zJDSyCCroHnCJEYTQFcvc4e8fJNTvXzWLc3M
 GdVUEMjq+AApmM+zYRJH5xKtd2r+L6/0Z8R/fBgVFXY7HfJSxqY0OtCPYMDTyOeWCdBYEu+2fZf
 Trzc6NaQI0zBxIDATkyrYC5PaGkQGrHhG3XE6nqK4sudW89Iif4vc5TxNIbLV3+src6W20/qvyY
 5ajO49ZVyGo00PLA62VtiF+nrZdylepaqrv6a5SOjgrL0lmbTJSBEISlJp7FVPdaU0LMqUUJkUA
 iV9xo2n98cofFhRCfLBNNYd46SjwQNm1+c1ujH5FKlRpP/6JijzFEVItXdfPn6kilyb4co1Df87
 7DO1Ms7ifijKfp5gGs35osTo6Ur76+8fgMRI4ibwROFTGTl72/YiuNBOxkzOE9OVCLMFvXZ8jK6
 dRIvQAhgPyW1StQpy1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX1TwOW5gzdhGH
 BxV+Fbaetw15Mub3N46x3fuVzJO2KS6+y+wq9U54d5BwHq3awmUKCigQ7PTlEVnkGosV+me4hF/
 QTcwtE2kJuQDQPr4iV+DnypQt80M7qc=
X-Proofpoint-GUID: TC3m8fzDU8wh0TRh0ZhAAVmFJLoMb0xX
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af24311 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YC2Dopf-cczdmvoT8fEA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: TC3m8fzDU8wh0TRh0ZhAAVmFJLoMb0xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On 26-11-09 16:14:57, Hans de Goede wrote:
> Hi Abel,
> 
> On 9-Nov-26 15:52, Hans de Goede wrote:
> 
> <snip>
> 
> > For easier review by you I've split the improvements into 4 patches (attached):
> 
> <snip>
> 
> > 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> > really just checks for the original (gen6) support vs gen7 support
> > drop the bools and directly check which variant ec->variant points
> > at instead.
> 
> I accidentally left some debug code in patch 4, attached is a new version.
> 
> 
> <snip>
> 
> > So about these differences:
> > 
> > 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> > with a LED idx/id of 15 for the spk mute LED and that also works.
> > 
> > I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> > the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> > on some windows driver to handle this.
> > 
> > How did you find that REG_AUD still works, did you just try the gen 6
> > method ?
> > 
> > 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> > and does not access the EC itself at all.
> > 
> > How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?
> 
> One more remark about the kbd-backlight the new mode which reports itself
> as brightness 3 is an auto mode with brightness 2, but it turns off
> the backlight after not using the keyboard for a while (and back on again
> on the next keypress).

Thanks for the pointer. I'll keep it clamped to 2 for now.

Abel
