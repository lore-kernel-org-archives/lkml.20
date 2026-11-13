Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556540;
	b=qn3rO1zmIcSNy1kNcV6UYEZH8FsWUULMk8cme6HcSt5XouV8h9YVBEQHU3EW6ZZzWDOL
	 wB0zqIiJD3cJxG+B3yN4BqtcaSY/o1XFx8XcpSnIFFfAbzVYEu8kQe5V+XMIGI/1MtcT0
	 PiG6qwkevCFkte5Un9QChWEx4G18q5rY/+qapAuweks6tUa3fKORLnSPfslPggagZpxir
	 T5mEQeifWIkqWybmP3DQ+5k4LOm3IWUp7CdaBsrP1NKY2n+TphfxdS5ObZrsCiTJyy9pu
	 BEx8hpCYIplxDcnOP0K1+kJmsBdrraZsPTmKI3sH3hakPbjmUerv2V6Y8JOEiaUdzMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8fAN0LPrvCkIBySJ+GpS3PyK6iPMP1IYcq62tXaOVOM=;
	b=s3ufFWg+2IbAbOphI3ImAptb7W9v/rIpschqQ/BxEradcZxYvVataNnTef5cvGO42WKw
	 wWf0AI+gxGw0B0fAPfuYpw/KKUaCz+XBp/DaE3nRNbwVog/j0Rkg+t9gSlwHJHJSMpmKh
	 RWHsORTPQClJdMlVPIA3aW+jRfEuJfFFy8ncHUCOMX+icGfUUd/FQraEVjOTe0kjhrT/Q
	 5ke/Uy3Q8owriHbF/kabH1BFQNFdDxBIdZcr1vVl3zFAnSoi/aR95UZlbkonRELW9m+Ss
	 kayEG+6MXjiYzky/BEK+m653S4BnaPYdTNr9b2ZALXpwnWCg6KA9srobvU7ZchzY7Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opOIAFlW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSkb85+F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91F606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E91F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opOIAFlW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSkb85+F
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Ban3283391
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fAN0LPrvCkIBySJ+GpS3PyK6iPMP1IYcq62tXaOVOM=; b=opOIAFlW9eVcrp2r
	1/BbTLHR3YrSYS6e0WFJ+UbGosdkHE2m3G7mdyjMD+lDuk+DUVHLlCsxlSivpMsE
	viH8H65QdKE3N4r1xByKx9doHKnsgSsXHNgtT7hUVI0ziHFtshLWgKEmuHKIRz8V
	hpW86L9KFsrQaaPjyrHenzlEjg2N7oISQNPGpymKAKlKZtMBe1CKIn/9cnzjuiBq
	HpS58Wu1pSTVqsWBn+QIr/a5LdTWZIU60L1CzIB+DExfa5CZie3sbafu8n+aFfgD
	BdcWNI4cgXBqfr0QNBSdC9BTleoF5M3DK0+NpVGqXsYdNEVt/9h3CLvZ8AVxS4l4
	K/cYSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gjwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:55:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a4540f2so117985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556538; x=1795161338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fAN0LPrvCkIBySJ+GpS3PyK6iPMP1IYcq62tXaOVOM=;
        b=XSkb85+FMYV98bGPm+q8X7J/8QiJsPLBd3CJC2mSsR4n4P2iwisyhK+0Ibp7LSPDVI
         ssrI4sFgmME0vXLR5ega+TJyBFLxO9W2EXZi3A3D4EYO1jx3Y3HDv0iYeDMQqoaMaEmL
         FkFOLIMMz0fk07MPweVv/HcozLtD1/sgpppie0VDjLCSVBEQYXnzzPgw7hRYAFkQus+R
         zBl1AU6kD2F9dqWIo59JFJDovVXfwOGt+4Y0IVvabMUuOIZQLt+V8w6wH7NJI+GEsrQo
         /ApSOQ4+rjdDzmHlxv07bYbGRbTX0VZISny7z6v+qh9VYAUjE+9uZmoXF9y573+LqIau
         NjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556538; x=1795161338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fAN0LPrvCkIBySJ+GpS3PyK6iPMP1IYcq62tXaOVOM=;
        b=qrIeNkpqMzlIdSE8wysu9lacUa1b/gBgdvuku0lDRpmROCJiBgoJ6gqoeY+EpYpz/K
         EY7Pe8mmNbr3ZYIMP2yUtzNDphNwwJ9o3lmes1+LH1eyuLOzZ+WG7ROR9UkrW4JWMihG
         gqIRninXlHCmgOAqcQH2qjA5h87bLmDJuIyoLL12c6EzO/xT2tiaOPkWAsRI6DnGrdO6
         2NcQ3vjEfjLQMHclShOM92O1l5Xe9O3b0Xu98dG28AgAKaczHo39itwucGN/4uzZhCnX
         cmGsf2i1w3LNjFVoMpr4fED/16KXONgygX3eSWOSYKPnQClT6WA6y73jFJBImSFEaJcI
         qwTQ==
X-Forwarded-Encrypted: i=1; AL+hErFmTJfcHyaNfMXXufXFiuP1Dn7xQH2wqW4p+kP9PRL5Qi+gGhDvXJme9LeVr68jp26JUjbC3BG90W3J4P8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ftv2VR8KEe2nx1l1I60QsYchwv+n4Dugb9Ic17P0PMxw68W8V
	H6ws2ZJUyX/P72WXkFuVuhI7FF5fWoTiFQTWnN4vYJPYnxPXXoY5JXsv4meg+mfBo6k4AXea9gs
	mpHByI2fDvjQmzIQXwhsc6+Vzq1Gh3JI2+rV1w/EWz/h3a2cbgPajiPqdJ+Uxwju40s8=
X-Gm-Gg: AYBFou1apXJYiFV9PzdA6JzOw0F/xQk/frsCt7k1jmrzYcp3trbuF/PEs2E2gzpzHZT
	3w34fnh5deL4iHipYp2QyMXHK4imKAxALO6MHu2C/8gSoaO1xkx9zK5RFH+RRVPSajgAQVfPXZd
	qz7T7avN1zDH97FU7rtv8XNGdb4ZvS2cI/+i65gH1+fU4CaKQnmzwGMc1zeQ6a7IAFnr8T6pdaR
	InRJN390i8DWWxm2uT2RGos3IEpUhP85yGWXDtchtGq4bJsSyiSqMES8+lw1XLrPJZ+FOK0ULZA
	tIIyXmvDeWmsK79jXtAi35Yodwt9wrJCVXaEFw03woyYgMgHeqGmMcmyJ+4U1oC6hKL70yOT9S6
	tqTLC9TwJqzshf8MR+tLj42RK7PCp8GCLZIsHB9pjY+Q35inkef684KwJybGNz5ZLD5ZhUDY=
X-Received: by 2002:a05:620a:a8cd:20b0:939:c7d1:7471 with SMTP id af79cd13be357-9494bc27e55mr267373685a.4.1794556537755;
        Thu, 12 Nov 2026 23:55:37 -0800 (PST)
X-Received: by 2002:a05:620a:a8cd:20b0:939:c7d1:7471 with SMTP id af79cd13be357-9494bc27e55mr267372285a.4.1794556537335;
        Thu, 12 Nov 2026 23:55:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79d19sm62519066b.71.2026.11.12.23.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:55:36 -0800 (PST)
Message-ID: <c879f18f-fcb6-4545-b390-5d11399b95b8@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:55:33 +0100
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
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>, yzddMr6 <yzddmr6@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
 <20261112173523.1474-1-tvlad744@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112173523.1474-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX251PgJ/hn8Oc
 fWZgFyoT3pgXRSLXq5umBu2yB5+atRUPo9uDHIdBhQ6OCDdy5+fl9hP5uVV5XiXzv/ecd5ubqtF
 Q2jM1gCZtIoE1DFJf/1y3HItT26C0X4=
X-Proofpoint-ORIG-GUID: nCgVPkp1iXdFkd6suDFyFn12w_Tv1w0o
X-Proofpoint-GUID: nCgVPkp1iXdFkd6suDFyFn12w_Tv1w0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXwiJSR9XFqBRv
 eHR1usIfgaLsrnbJACud8ZOW4QNRSnfp+OXjZoyluEv45VDY6DklVTffUm0JeTbHHFMD67QadnU
 CHGaJ+Q/UJEAlaRTdPZKQkfpy+WvrpiFt4KJOH2KYciCeCf8WRW2ojhcvBadMgZLJiSqHOGv7bI
 pk9aG7+abdbwQorrZYDQYCyt5NuPeZ4+Yo0Sx72/aLmNenDbZF3BoF2L6iswNDqv3OS6WF/7lwK
 vZ0XAVNdP5fHRGPpIHakCz4MtFsodnNoxAqVHkg5ZH9CTRnAxg4UoVMuhFXcmcu5YNxcx/3Ax2p
 fzjxF51kpbs2HEeHrOXj0xmMk5cHyTSvfRHSKq7/2wUBFkIPWh1vLWcUBO9fexYZDfUHgmp4PDQ
 no7ciOZ0xLzeGxjTmYtTKtxfmAnU59/zX4m6nJ3wQDyX/fMYp96rG/RiL/mpjxQd2cjOFF2Jgb3
 JJFxRcRerqWFcE9RvIg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c27a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HTm7TDF3VBb_-hOjTn8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130031

On 11/12/26 6:35 PM, Vladyslav Tymoshchuk wrote:
> On Wed, Nov 11, 2026 at 03:21:13PM +0800, yzddMr6 wrote:
>> With this table, system suspend can reset the SoC once nothing votes
>> for the LPASS core. On a Xiaomi Pad 8 Pro with the LPASS_HW_MACRO_VOTE
>> and LPASS_HW_DCODEC_VOTE votes released, 16 suspend attempts (15 with
>> s2idle, one with PSCI system suspend) ended in a reset. The PMIC PON log
>> shows only PS_HOLD-triggered resets and no PMIC fault.
> 
> I tried the patch on another SM8750 tablet, the OnePlus Pad 3, which has
> what looks like the same symptom: the SoC resets about a minute after
> s2idle entry, and the PMIC PON log shows a PS_HOLD warm reset followed
> by a PS_HOLD hard reset.
> 
> It does not cure the reset here. The tree is v7.3-rc5 with out-of-tree
> board support, without Ajay's series. Each run is one 60 s s2idle on
> battery with the USB cable disconnected:
> 
>   this patch, Wi-Fi WoWLAN enabled                    reset
>   this patch, Wi-Fi WoWLAN disabled                   reset
>   this patch, rpmhpd domains left at their highest
>     corner (rpmhpd sync_state callback removed)       reset
>   no patch, MC0 kept voted in the sleep set           resumes

This means something is accessing DDR as your platform sleeps
without voting for it. That indicates it's likely something that
Linux set up, as various subsystems (ADSP etc.) cast their own
votes. 

> The last line is a local workaround in the interconnect driver that
> keeps a minimal MC0 vote in the sleep bucket. It is the only thing that
> avoids the reset on this tablet so far, and with it cxsd, aosd and ddr
> in qcom_stats stay at 0. The first three runs are without it.
> 
>> Holding LPASS_HW_MACRO_VOTE or LPASS_HW_LPR_VOTE across suspend let one
>> s2idle cycle each resume, but cxsd did not increase in either case.
> 
> On this tree the two votes do not seem to be dropped: with all five
> macro codecs runtime suspended, clk_summary still shows LPASS_HW_MACRO
> and LPASS_HW_DCODEC with a prepare count of 6 (LPASS_HW_LPR_VOTE is 0).
> I read that on the workaround kernel while awake, not during suspend,
> and the codecs have no system sleep callbacks here. So the resets above
> most likely happened with both votes held, which is the state your
> tablet resumes in.
> 
>> All of these suspend tests were done with a USB cable connected.

I don't think ToT linux will let you get cxsd with a cable connected.

Konrad
