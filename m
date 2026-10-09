Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC039EF2E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517371; cv=none; b=u5i4yf0sB4bjmUaJZrwhp+MM5V2D6uR7eSkbD/MbzjzkJ73iBxpGZDmLMPhMN43GB3qR6oQhe6i47dtd9IUiTopFpdiKSo7rgxozZoBq/dE3CgEyW+xFNRqqCim2v9RNTb5eGmw2ytAD2XtqRBVuh16/EnjK3nODaefy4S8LxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517371; c=relaxed/simple;
	bh=oMmbNnz932x0fDcbEC3ogsWJcritc4/OIAiDDCwdyVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqAtUja+O8bkfXgioUBAJIOUh+gdgOEKtmJCt6oeSeH3GQyTM83Q/mB1OVo/1sinoMgI41Ns8hhUEZ8rc+FXg798jQOZMfEjC6YdPrsjN9JFf+nXJqz8h+fUaCHpnyyLB8Roy6OzoHCc0FTXbkmL1o69irN/ih1RTJVlaoNxCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5KBbTJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0y8PikE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5KBbTJR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0y8PikE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLis966514
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 03:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=; b=E5KBbTJRdB/IPv5L
	HPEJG1sGFDtiA8Ok8DX7DysczMA7y/EvzCmu9GobIIJShNphngiMCcgHBCMvSxCQ
	zI8UET9o3q9qLtpnwJvBrP30Oa5eE7zZIDmOtPYUM30HMOvCZ87eWWkAzfnm/H1p
	Pta8NHDJFoVR51mIbqn1fl2e2FN6dRoRO0CENgkTqyJwSw2Qlt+E+GsYAHoMT7RC
	O+9n/DzRb1Pp0bEJVwdgbaFQLeYoWp2jWpfN6ltAVQH+TN4rfoHv4gcuWHzsqb0n
	5EcWPKSwqV1TwdxcmAGuMws4LLoQ4PQmUjeAkogsMkOBz843AqH6qPsQh1iS4UOM
	KTtcWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj1pc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:42:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1295735a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791517361; x=1792122161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=h0y8PikEJRfd/tlSt9uvx8MRehvGxtY5XzIJMeP60YR5sipv6P1aGvgwSPVclo4Rh2
         AmfsB3gsUmDsCgN3yP1QnlF5WMaUcZ4wke0qdMfcm2k/+NWlEweGKnzR61bfWX4ZPiRC
         PJqRdBIOXAs7h4TE9LGpt8IvnxIXix0XOY9jUgB1agLfG28Xx3tr2TUulm3Z86oJ2qbl
         3Wx/Fjto1ipK49161pfr4lrJEDz1KAHMKaVCwYhYMeM36Y2lffIRGReRfxzSQpvP/Lae
         mv0wOOmry0Cg4Be0teiOu1a0ib/yB7txZ0x5dlaYCJN6Xiez2rFeYwjmhcqTevX9bLJx
         0dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791517361; x=1792122161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=WCP23TJPnKj3BIGcqTs8iP3dxL4x9uIBo8AvgW6tF5NwVGePfTLLaa/e7/gvoVy2Pq
         VhYLfVbkJ/wABtO8y/dt0a/dgWP1yRYBrvMBXlGx9BrfLZ0tSx6Tch9uhx58dsDiazR3
         SqJ3GMfH4loFh96kVyQkNwrMVUD0d4NaaI2qmOaw0QfZt+HqY1AuYSwCYh5GICLD47zp
         N7FmYrW7uO24TMleHs6Wfhe2xdoO9b9MZucpzU5ehu867BgIFGFqw5ePZ6GVym4h6bdf
         GKw3f7QdtUo8oQdpOXhokz9rVR1XYLGdwq55l+wSOBHc0uGx6GAdDXljAGr7lIqfA4x4
         HtQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrO31WhSr3NmawXlwtAJ9LT7siEHs4LUEt2jYiTbtOq3Qqx3t2GWKgR77+dt+9TdHJtgWhybT5wtBkEoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3IFe3k3PJ5QyBVpmM127wjd9LD0Q/WNRm96m9+1b4kqROcKNE
	iT0g2AXoL79UVnT5o4fck9INPCCIBS07IQ+ryX9oSEdALbV0vIIY2YdDnYHGDS7Kzxa023NjX3A
	1F5s2F5OSC2Z2fSyRnT+8UQTHY5wCSseL+iF69LOlqKyWx43RaS1L9JUdv9bS+puTCAM=
X-Gm-Gg: AYBFou22dUcY956l9NdVMQcUdWx8IhpLMRBJqwDOJSzLMyknLtnNjzezWKWpvtQMLO4
	6CG1Ag8ftq3XJ1zUCUCkJ4JEC2/V3OSvezi/37L7DXarpPcAjFBr+0SJxWp/ryVNdNmJIbW+afe
	3ubzHGCpa9R09DvS805OUb5QzGgLYQIWTltjyKiHrpC0P469bH+3IfZ2pzNawOEIW+1ha6zAhO/
	AWelSOPJjE45brur3iQuh+dXwQFqQM8+2TdVgQ2C6vHZ7dSXERoiQEsywkVsNrWmCCXr58zoPvO
	la9aqMjBmYUNvN7AaP9hvPPMdlM4hUphYtzmZj5C+gbFYaX8TJH4V66LaJzXZV7NP86WL8O6VBU
	ar0XzsBfIXtHzPNY2btl1
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403446a91.38.1791517361045;
        Thu, 08 Oct 2026 20:42:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403427a91.38.1791517360547;
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Received: from [10.92.18.229] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm1351959a91.7.2026.10.08.20.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Message-ID: <4272947d-a9df-4cf2-b890-c2b2392800e5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <179147126645.2527009.13829110581548714861@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179147126645.2527009.13829110581548714861@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac862b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=wfrYX8O7EWgUh0Dss7UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: lTg_fjWOd2BxDWJw15y_QyiS47s8q8I9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX0cR4wLuor+vW
 O4mKaZvPql9BYIvMFFkkISLnd1qWNjVMhCsUkQCMmNSgVnEeXn2Lq7dZMd8xUbmTXUiPI9iQS4m
 KHlU4TgS4+woaN72Z13LXrVJ+nXIfQaMHdcJbZSB/0IvyYhjgGMyfMHz+vUL5ZTqLk/0ve1bHpy
 U4WMoYJ3sHPTNYs44UYzzrEt5MctTLK6VCqBke5CONpnBxrKomtmHwlq0d90UApTjbD/BYcmSvP
 nSfu39yfLjS5X7oflUlkDKjug0oEMHEewPkwZs1RPg+WlTd2Rsb5yabwOeI/QkQnJiMvvgNr9Qb
 w8Efw+TDXUsn6BquhlwwzYvYuhaYJiPCKWyj5/ukWL94mQqBdmqm3mPL32UR36bqcfOJp+njDNu
 PoFU1nfFRFmoe3Iej3Xq8XI12yhk53Tqm167fxGW0HMbfBYWGNZXaySplQifPuNtod+lv2L39tS
 W+xVFetIiuG6xM3VHpQ==
X-Proofpoint-GUID: lTg_fjWOd2BxDWJw15y_QyiS47s8q8I9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX3Gd6SaPlh5UX
 AZpfc9+F7CsfgxrpwVX5pxJCzHCKEQ314on4l0kmcZfe0mHryNP1d9KBAOXvRn3/gx54RzobsBI
 IPnKyvQNQotzpiIa0WtPfAd7skk7qUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090014



On 10/8/2026 10:54 PM, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Both issues are theoretical. Neither was hit in production or reported
by users.

Patch 1 (dt-bindings: Split EDMA reset into sys and apb): [found by
manual code inspection while developing the IPQ524 PPE driver]. EDMA
driver is not upstream yet, and no in-tree device tree uses the
ethernet-dma node, so the issue cannot be triggered today.

Patch 2 (ppe: Fix multicast queue config table index): found by the code
inspection. It was not seen as a crash or an error message; [the
multicast queue thresholds are left unconfigured without any visible
failure].

The series was tested on the Qualcomm IPQ9574 RDP433 and IPQ5424 RDP466
boards.
