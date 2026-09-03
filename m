Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86243636B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421478; cv=none; b=LS9fEOxAlx+csyZyHigOLbhqZeUHjNosd/Hehd2XZpKgOYnWtVmzVdfn/pab8NZ5Vp0Cj4c96evvITHZaJQDh4shbHY9kMICz/Q7+sr7/A7SpLXNtspFigSYyiHGgeojAdOpwHdOJ1FYJMtpHIC+FGgUAfgJc/TsWScANBBi77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421478; c=relaxed/simple;
	bh=ucF2EVxtrIYoxtwjlkqVyNBpVkby+vfh+VGNmzhPjeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGWyD42sd+wy6uJnEvw+cFymuTUs2DhjLXAtmg+9XLSkIL1aBg/JwR4E8WuffQV8qy0jmVhWWX6ro7+BcxhMikuPTOzWDONEQjdRyUj2gxeR+uditTDlQjmXdM1nfSKNsyed+9ey+uXlqHmLtHTlFFM1tuXmteDXA247bwP8aX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9GxE2bY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK9cirYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9GxE2bY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CK9cirYm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lg4o4023736
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=; b=d9GxE2bYbIoV9J6n
	3vAdo8cRpuhlBJpyQyad7H+FU7PYcbijJP1ETlOhTt4xdJ0Xl0ej/Axf4Ez2yfzo
	7SzmhzSuhOM2tpH4P18CCBXOockXvXOnlGxZdEiY9hmek4iyeFvT4jNQnzkHImRS
	0XyUQsYVqLkFHQnhKdnAnIu0F55XT2M9HlSJz1UiRZthqx/YS6IwmiM3TDW+Pj9y
	YjCehQ7iDz7IEJPhgNjTEvimqCGkZtVVvGf8AkB86Jbk06arLz0XgLN6lbGnap3V
	KSAFy9tjCo8618qpilFxAa30JMpECeNKIVi1Iowkaj2wT0DuT8XnSHTp4pXP0SjN
	xKp56w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc1pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:44:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so40802685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421475; x=1789026275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=;
        b=CK9cirYmE3+WIsYZTc81HX7wDDVK7s4Rz2BNcPlYlaCso6wwmceuS5v5xs/l4WeyjX
         Z1ccAPZ8QiGri01U7lny/beAD2CIhEr3hVqFXX0daqjjf1t7ADdGxFYfN2T08fC5gMoq
         U6k5hH1CnlW1ETHFep+IH7usxBe/2DvYlikHjrAHOeZ7OMo/LziXVOS4m4dJEqzPjHDL
         Du2/lhUMU4svjuDWFI3UcaDx7llk8Td7jEeMj97wo875gOq3TINBshkD71qhX0JoiVNn
         LNY1zfabalUScpxgDybHy4HF1VsIHfSUyqkzc/ob6R/Rjx9CiubgM/ZHWNgjPm/b3rtE
         6/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421475; x=1789026275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=;
        b=WMonpgF59wH4PNPvNHBlhRXx7PG2WXVgGxg4O2DxZQSI8rP2Z/wErSQtZn87cJBZfe
         nYWWqWwTG8D0ScCvrSgwwV8GyvVZyVgAh8bQkAwtaem1B5ELT1j9x8EEo9QPDoYbEs18
         L66M5UmhfRiBSgXZ6RlOS03vYeQYK12xmnkMTetQKm2+BocBr+aPqDHKQBeOzNRLJiHx
         nGSGMlgJ+Iu7kH2A14F3xpoSfU4TToni21nbF2QNxwJHhUBb1CyMGcn28JFESYrfhLsP
         roNjfj3ANiEZZ9dMj/SrtbRIcu1nmmzna7FvTdVAILwofHxZIU1QWx/GsQylQ7+4k9uZ
         T+Zg==
X-Forwarded-Encrypted: i=1; AKwUvByhbSYDhnEcGJUyG/tx8hFMTKKcTChqdn4lQKRx7qphnZhwIe2U5mv2CNQSyGD+K3QvGLuqUKSDdea8ZHA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjnHlgHnk0nM9fFGYikaIQVE6yLDhMaTD9U/m9fj90WsQ4GqPT
	v44K4ALA+MKhq6E18q7dmw5PRLvQ7wcytDkf5VD51UDnQQ9Zp1fsaPxCnJX17m1+DeY604xQzTQ
	1j7NXp8Y6Mo+kdacy+QzxKyqxXBi/zGf6oxfpjnjBX2nIj4K80WPNFOA+2kWNCqXwfqo=
X-Gm-Gg: AYBFou2XOZ9WZopqUL08GDGajlrZLpV3jJeA1byFzwFTdlLXHY6m9fJ4raZbWFoSdkW
	MtnJKMS5+tOJEP0iqizC3lOupMTQPvWU4H+OXPr51ZktzHOr626xYbhd2ukyKHEptZU8cVWn2jB
	R4qNPU74TmOGnj5TN3DsCbpucnAniPWc16nCkHzi7OCprYWNIzSb3gmGGv/QyfQLHmcqHTU15Iu
	IR+FrWgmwr7S1PpBwkshrjH5FM3tZ0cUXejFWc3ilLsVgicCLaRobtmcuVEeSuNYv+mO+mozJnM
	o7+KEwSD+03teiMgJSg6U7ynXocVWpokYrERi8cdnTrdNhK2RTmv7cAAtAZCX8KmPD5OiWqnH/Y
	P5g/cC2dcvnHr1150bxOn/g==
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr745788185a.2.1788421470490;
        Thu, 03 Sep 2026 00:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr745785285a.2.1788421469895;
        Thu, 03 Sep 2026 00:44:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm46285266b.35.2026.09.03.00.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:44:29 -0700 (PDT)
Message-ID: <e4338457-dd40-40c0-b250-b13246e8215f@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:44:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Add multi-port USB-C
 power supply support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TwU80Dyn95wLAe80_MuPZgj0EJ2r2zYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfXzfBhddiGYYxT
 nuXwVfu5MAGRlScYo2/kx5tLxyP+V5kfnUYer7oG/lbB9H+xQ6GG2bARdeEHfL9CYAllzspHXh6
 s2vm+dZ9vfGGNlk4J4GBTtV2HOzAjwTevhJih0ugIohmeXPDIN5vu40I4Wm16YTn8yq5T60KSV7
 tBKPLZM2LAbQDzGajJBY/qrcCOP8Ep+p2t7qMxBNTosPXqwtn4UV3zJNImDjq+f+dEkh0oMX2TL
 /ndsXyl9VM+IQIClIVtJyszzJrY/ailIaZgX44yVWtEczUpqeOf0xSYuyD3OyuyhmIUYs/ByW6l
 I7IT32Y8NY58mdKuYj5pZ3WXvj4x+2gfjH4fAAsIgf/Qs0pW6vMuDjjIkuHGjnLwKVgvpvSqKE/
 S0A90qaopZffDmEuyPMU6QtspCG76WkTwuHgJgkOzk5R5nb1uhUFr7iu2sLwMW55eLuYeZFVmcY
 GxBerdazsxSOs72lOtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfXxK3q49+suMjW
 kAx1VvAG9PN04TSc8UR5zdJFzakuuPNF0YhZDhNize927dWXnpW7pEzrSr5qIUCLLh6JZX2FQQc
 YN0uv9d5MThX7A88trsI3enaGTn03GE=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a992564 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=katsNAF8sUe2rKcHUFUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TwU80Dyn95wLAe80_MuPZgj0EJ2r2zYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On 8/6/26 5:06 PM, Kamal Wadhwa wrote:
> Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
> USB-C power supply ports on the X1E80100 & Glymur platform, which
> exposes more than one charger port to firmware.
> 
> At firmware-enable time, query USB_NUM_PORTS over the existing
> BATTMGR_USB_PROPERTY_GET opcode to discover how many ports the
> firmware actually reports, and register the additional
> "qcom-battmgr-usb2"/"qcom-battmgr-usb3" power supplies only when the
> firmware confirms a second/third port. Each additional port is polled
> independently via new BATTMGR_USB2_PROPERTY_GET/SET (0xC0/0xC1) and
> BATTMGR_USB3_PROPERTY_GET/SET (0xC2/0xC3) opcodes so its properties
> are not aliased to the primary port's state.
> 
> X1E80100 ports report their USB-C adapter type on USB_ADAP_TYPE
> rather than the SM8350/SC8280XP USB_TYPE property, so add a dedicated
> x1e80100_usb_prop_map[] mapping POWER_SUPPLY_PROP_USB_TYPE to
> USB_ADAP_TYPE, and use it for all three X1E80100 USB ports.
> 
> Give the primary X1E80100 USB port its own update/get_property
> callback (qcom_battmgr_usb_x1e80100_update()/
> qcom_battmgr_usb_x1e80100_get_property()) instead of routing it
> through the SC8280XP battery-status update path, mirroring the
> pattern already used for the usb2/usb3 ports.
> 
> Also add the POWER_SUPPLY_PROP_CAPACITY entry to x1e80100_bat_props[].

This should be a (easily backportable) separate bugfix

Konrad
