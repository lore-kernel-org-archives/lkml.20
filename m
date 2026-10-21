Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578908;
	b=VGcUzGVgu2OwTiMs8uhIYCcvsY7sPshGYbYhqaWaTLCKxW/azP04HVinICRDEqGR8Sj6
	 vv/f6axkr22AsKmbySGzqr8Kel1iItYkp42znhyh6+zMOy52s/2xgYHCWA62yZAPT1ffD
	 3C9tkshwi2y8rIxp6MW5pkYQwXSIzc5K7IbX4FXkQRxcGJLPgCDKb/S5yOj+GM3UEThVy
	 WHcj+977Hi/av63nmaRrcwHyWaPh/Y3dZKB6b+8+ep3JQXcTyErRVtuponqmnhb2x0GdK
	 +vVQ80qgAFvdNlygZiefE300qtMq6UWP2MVU87JnhiO1ISaFPLDK2lE+9Z8r6iNvL8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
	b=KCaxTmF6U0Y12u8glRWo/nXfj24h+mJneC2x5ViLdfKtT6bbqCYLDsCsRoheewi28jk0
	 CQHNCtJcAo2n8pp1+X8agrDHg+dTVEFtHfG6TczuVYQ2TYdQONJGF7cnki4ORY5sg4aQX
	 yyp/YqP0fwsepc8aljNxkibcmvgMHPhjr7iq1yNnenaCm5YilXSSoMgdvuSDP68Ei9NNz
	 V1owhLYE1OPWRqYEu1Q+SmTWSAk1rWoDkoFLN3B5jFwZzeOCXSkHfm19hI5u/U5oTE4/j
	 bDgLCnBadoC+37fs8/7bIXw6LZi79I8GmnkT6lrDwumrFlUVO+YTGxEqprLb1I1X2Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bL6ph9CU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRnMKTp2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bL6ph9CU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRnMKTp2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5XTe335069
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=; b=bL6ph9CUm1kadnCo
	jss1z55EW/pdqxJcTXajq0aPpwZRRyDUXw5TLiBJ+MzWUHSYayJsQC9aTtwrERBm
	84hylA/dv04uC//3FPxvauvVZjxTP66amQSgvQjlrvYZklzF4xWprryYwEHxG2L6
	4AxjqxOtg74iUSBvOS9lTNWT+Bjz/wV3cwpuETXKKE6JiZEJ28sYxQhshstao5DT
	ZcSMz+8MJXMfDLdm+hIno27dvphFjfEvMxBW9khvGLK+jOTVb+bHdWt2jwkibax/
	bNTEQ6j8Gqm87UD+FLsGnAisQ7BS9GHd5Y/pTGZI7lh+EOoNQnu+yrBlc9pgqOhB
	pvuBuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj489x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso8858885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578905; x=1793183705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=SRnMKTp2kLJje4tGPbhU6d8rjST87RlIqCRx6DKkgc0krtYOrPq+gKGRt8zuI3D1e5
         cfqDLnbs7xiiZdNaY5pdtXXxvZQt1+AuHHJz1qSTgpmZcGKwlYP+WJ8ukR8HeMqUKMqB
         MNVX4WYucxPGX7EPAfLxywgKJn1UZ45UJD19mlIeGkgjWZ9S7iGrJYEkEh4t8EALmm0t
         Fzu1CbQ5tmThzUXfZzzYPGOD6990Yd2sffQFc9jqeGVwNsrmksTp5IKNvbKbJsltRp+E
         UGsBhOwMSdyTZmL1Twbf6vlx8utxma34d3v7BHX8wgFBTAiUKfP/Wghc+4WnRFBr0414
         KbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578905; x=1793183705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=BJQpf8khsYZaqngJ+cShAmQIBWZZ+CibUT7FjTATGuS8Qv/vbVNmdzm8g4wwIpZ942
         zVJGPJ6EnJo2MQ5O2Ux5lV2d/i2feqweDEuN36InFLxXdbfN8l9Hx5x4RuHj7/2mrhZ8
         N6puZOEK+qJPY/Zl1I0iz2ytXWIHSyJo2x5Vyuqfn33tftPFHx/1rjW5i8kCKhKkRdg8
         kslnBCYAwd5D7bS3N742HRsmV0Kd25xF6dV8kxkztqFk9OrK2ioINi3S8mWCLLj8KCnj
         damQL3c2rB9zyrl+L/c2y3ES6BOa/FzOGiK/Rdu6p/RA78JsURQw6thOgwlKtu3LfFwY
         oh1A==
X-Forwarded-Encrypted: i=1; AKwUvBwOBbwgYbuMXKX4fbzmhpl6Ydvfb7tSwq6j82YBHMqxsvX03umQBdFNyeT+L7JwZa7fCFRtB/V3wtVb2o8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ85bZqi6reyR0GFC7Lv/fgiKP0+Ik4FH/4GLxMDsA7EAhzR03a
	Bloy00CNMC+fNaBkWD/+UzdGZ3EH8rRp9DFrQqOOrdnmnLN6rpGBT+UKcuqpkUIaY4axHI1GGKw
	JVHK4dTFSgosxGix8vG5GfDA86023+q/aUc7SHqboZTkE3Ebd8Di7yB+vpFaQztqGRh0=
X-Gm-Gg: AYBFou1vwMdY7os+nb0Hw/GaGCPLUpdCR4tc+AWahTndZD/CHVg8TsZOC9EHW4I2mWk
	jcvRSXYJU0g2cBFVNGZLDK19lSVpQRE45YQjL83Wh6NwVHz5QMoCWxjp0BQA6VONrg8XyjswqEJ
	ATksxYq9+m0DKGwgDMe8rINuQLnsKaUV5Rk1QIeQJQTQUKssh6+hR4DJJkwHmlyF0Ch+23Jhe5r
	G4QLxs5AKzF9c38DwjECK6WoTvxgqwx2QTjaORf3JFfFAouUeobHJcrKuPiqDMV/uBUVEpyDz4G
	JTQx27AyaR7p6QtBhLUYCl6HgAD82hbMMaRcUYKPEFlt3S7qs2/vCCWAWxVlDV366y0+yWQejsu
	Ixe85sU0Wu4Gb+5wS4VWhSw==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366239285a.6.1792578905249;
        Wed, 21 Oct 2026 03:35:05 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366236185a.6.1792578904793;
        Wed, 21 Oct 2026 03:35:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403132037sm647584a12.26.2026.10.21.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:03 -0700 (PDT)
Message-ID: <26d4788b-fa4f-4f37-bd9d-ded731fb1e0a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:00 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2S7jwf6ABI1cVLFMbyxCGFeP6LeOyhJh
X-Proofpoint-GUID: 2S7jwf6ABI1cVLFMbyxCGFeP6LeOyhJh
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8955a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=J5tutDk3-wnuWQUDz_8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXzZj07BFMkI6l
 3UTnjGrfRT471IoNOZryys0PrKfu3FfHuJz5CeCnSSmBbrvM8FG1nRIuMg4NDRNW9nuGZEPv+y8
 crJH7eSyaFvV7+ywOAfQ3kEtpugfrUXSvy795EZBr3IP4wmEWOpVzlwQ5j99mfWTGKGJz0HmECt
 zNeMTA2mh1+iAXpTx/wIvoN4nqmD8OxjUBGo1Phy6i7a/+ZC7pgWVj1A5JDpJODo6ljvf50/bNE
 21yUUfgx0b+fRXKlPXYs1p/V3cdd8F7EEl/TtUX/xXyUu9Ag8KLbPSOsy9hQrs15P8poprInSWH
 kBb78zvH3y7ySbT0yw6g/3cktMWDSeeqvRDFcxbEiTS8TlfsruH5NLfohvZzbIewUxVqq/xwjI7
 V3wdloaaSZCx6mgL8iGCXtRVgxpqZxvSurpcw77XB74/i99XnwyA2xNZTwul0efbon+0COT0UsD
 clO8v5fKyofikTYsDBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2SMuogXSA8C3
 MhPcijoWKbDzghrQmFSK9wNKuqOO1BqDhrERVlbEsXrfoomGvrYhG8G320dQrSXnWvD16xbA7+0
 Ry5mLrp5WCvySInZIcA/Vi5wP7WvfE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
> OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
> probe of psci-cpuidle-domain is aborted:
> 
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
> 
> Skip the mode switch on these platforms and continue with the topology
> that was already built.
> 
> This is expected to be safe since it matches the downstream kernel
> behavior, which manages the cluster power level in addition to the CPU
> power level, just like Linux does when OSI is supported.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

