Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575412;
	b=juo0bSO1d8WosrXQpwExlpJV2PpkZlgRp6+4sZPAv/G61jLWdSFjwi7uX0TPBQTKkU1Q
	 8hiZdzBHo95Qw1TtXatt2MeqVGcvX7lqXL3rRtb3eVM9NOaPRtP+RT3dxGOTw6b8EXoj9
	 o2vpL1KYX1deZHl4OzgRRUjhxLNxq1XViRUM/Aph2LqQQOcfbhINR40V9rAgwFK3SiIgQ
	 cXoSY7pveI07ceFNRWMjCnJnbRfmpUY+mH5bmaBlRW0SguQyGHJUkiLEXgk6gKnFm3ovT
	 +aRSZT2XugV+RxIFYX5Y22lbvdi0be3CstRXbdn4dWNaXfFlKwytgVYHmlFsVTdWMkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
	b=vBbOLABUZGvfSc49/A8oxZdyiM+rk3/AMxs4AcPQ8WwtDTKydPvu2DD+XbMKo2A9unFs
	 RuLXclTGgNeCtUz5ThZY3ky/PbVm84hilfKDUL22pvscpTSOrLeKfFuX5Uw5QlaY56UZV
	 GtBd8FCdSBfLzREe9ZH9U6XG0j0FsDye3Qxa5TmxitrodfgB1OKwclArU0sB8eGlZvVrV
	 JYmHtKBWsw9X/Vih4hTZ1GZNUKoB35bgag+2O2fICbqvEPyiZVfIucoReS2znfgmY29xI
	 tVmXqeSokKferu+yyDv0WsxIb6ao0Wi+hiwugv0+iNPzPSxlU//s4JFuaaQeD8xvg0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE310606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE310606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcv4058844
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=; b=SQZEuSZ7/wGLKUxh
	SZQafe4FKG169IlGo5w2z5LX2QhGIOIambc41mKtHex1LIldaOimJFyoDqEMriAd
	1fwZQnuIc8aTSa740MiCIvO9X0N5M0wCHPjDupl/80QPEMSOrkkzhosQHAviy5dc
	mFxZB8cYlzWfDg43f9HAaM8JWZnI5CppA1JmvN7rlCuwOj6x22NK0Hzysox6dfgN
	igJ45io14zaZwgQDWfPaxpRT5XbkhekdxvdvNJYSa8DLQKlZs8C3jAbNqhnLVTLQ
	R1kO3B/Sj7jr686oS1akO7kAS2ji0+1fMGEgtaYJyKc15Z91AdJgwyzHe3hGZe9p
	wv5euA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwb4ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so724087a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575410; cv=none;
        d=google.com; s=arc-20260327;
        b=bsfBt5/27BUypY1iXi3LmTck1BQj14lyMfXtKiH0aA7G7skq3fOYf5gCU11is6qz4s
         GfdEBx/mXVqwCyd+zu98G8lt4v/wWZInOwZdGwjrh37mElNQblo6uhINbzv8hwFyaSTD
         3gyI/EVZmE5zoHAT/E4eeSzz8BKmPP1wEs+BbAab/bfrNIvkUYMmCP6MheaLEr8DfS5e
         OZLi9SvXDpSS191hJQKwEKeBBrPlVWSBjNZqn8nF+QGDiqqQTwkuxcygLaOjApw4ljcZ
         VvFf52k0muEUIl6h2mG4V9r64t8FA3LqDYSrLCKQYgtpuz5qpwOjGnMC88wjVQGJ5NDJ
         bGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        fh=2kp8/LM0Rhva7W6oStMPNsdCYvTlW0+iE86qBG4sU0s=;
        b=WFEmDdYP29y/ZkRvIO5joTznb1cNFrXmzurRBVaUM2j1vd6JGZF33QSTPkMtB4VB0m
         zDGM4y/Au+rI4VHQUUWbCgCTTY4Zw8Ru0bVqFYeoFQjBPylsvoIL/UrBfgu1KH5cHWE3
         bWQxk7MjCzxwhnfr1ggk4p8MehUo57usyOrSbCUZXrxrI8dsXqkahWPOF1JFunrF+7aT
         HbfS4dTF6v+Aps+dI7yCfZAzLipCMDoGzp6jynyX8n0rvIyi/+1ervGiObmaK5/r5n+s
         jezhjTLD/oPYaK0CtjzsJCp1V9VPRfpjfC/gXuWmHwLiNrgvZgeLBRPvlGp9bu3F/e9N
         yXvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575410; x=1795180210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=FHGCVubFmUzYHITtw/8v/jAj1vRj8VZZ7EFvT47bna43R8aeFAuUDykqPRR0lBo8ZN
         rAukflUV6vljEk10jmN4oQm6GdC2lYSW6cn1iCkKchMrS0+cm/xkNmx1kD7SoyCriMMt
         O8c3fl82wUS0BYwxQIq/06aQwFo1u+pvsGInk9VaDalb80yvuuB2GhOWYxWeIA0hHClB
         4zZLYyaF+UQXCIUx+H4qAFKYs/qfwOsz2gAJq6qEAiw4AVQJuwkSqnWs0c8o8HqLa8UA
         cPFIasqyb9vAPfFLZZm48xjmo7a9lUJ2MYF2RY6Kf1/4F8C2XEzfnfwe0nbzN9AXml3y
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575410; x=1795180210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=hWwd7HL9xsqa2PehB0leQ8UFTBczg/pqdOeUUpMmWfjjGSddbtm8cEyHWkyylxmeh/
         AXzrxZIfmRCYElTuPy7W+xqKykU+P1hARD1g5IKMC9Nnd+oi7387tkxASS1pU0Kdo0c5
         w5dToCDyIY9hrUW2f39A7qr0rqWAedQpe8zc7URzI8ai+404hptDsWxfey3KVXNFryOD
         xmOA9yikl2a4zXdulasZCEI/hHGQF9jdVJm0bcwpYbzuXKvAvBoNTnfgOLqfCU/xXRrL
         evb7qVHMhUwypLwYPQIFy9+t3Bvb+rfyrVZCbjjuyJU11UIKtCvmgv9rr1pHHPcMW3XT
         /fpg==
X-Forwarded-Encrypted: i=1; AL+hErHO+QBOfo2P6vfsMu+NWkRMu8KnkHE2r07k1xC11QGZvci527Jq93qgQiGS6j8Ix134WhNm+idWAScV2Wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SH2eJIT9nJcOKtJripubuk+TXJT88B/gQdKJtClTrpmZxLHni
	Fr/D06HMXHyLmLpVVtKX4Heniggt9Vb3T9U9qLvl8CHKvrWGBMB9scdTS7NOH2EP3hRHKB4MO2w
	2tZX2Wc0NFqFbJjWolJXq1WRwLRivbGz8gvQb078O6PKr/9A39HbNq/29ll+yG7Yc0pIZ1BFCts
	RHAy8F89L8+FV2qelnVrn1Jkd12xo+ucHZaR4CsTc+Ag==
X-Gm-Gg: AYBFou0p+BCebQg8AtVczAruuS1CNUUD2COMc1+MakFWasYDp6tw2UNEHBGclCx0mom
	opOwPDViCDQGUiTmX5RxfLMKFrcc/RboLfuU1DTFs909H7HJ5u0HBg/1PzfRFfYcn6B3Wn5YSh3
	GtyQ0NPn5z9HSx0pUm/3wwU/v2xPa+k/3se/hHlirF2OuKDjwAD3024DBBvw==
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr1919416a91.52.1794575409640;
        Fri, 13 Nov 2026 05:10:09 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id
 98e67ed59e1d1-3b1b0b85d23mr1919378a91.52.1794575409140; Fri, 13 Nov 2026
 05:10:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:09:57 +0100
X-Gm-Features: AclHuK-XrooPPikBTcYU6ieoCi2hLf5EMDtx-gXhYpRfrFw3mVoiL0ydev7kJnM
Message-ID: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af70c32 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=E9o5ywDmFEx5B8TChakA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-ORIG-GUID: ZzDIsXog7loLeYZJpLYti_QDFlMYMSHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX/5t6BbUjNsic
 tIGlivKTD6opKLxVU8vGdh5kNoQN3ATd7go8t2sbqkGRmmBk308naezIxglyKVeK7srCd8AXLY7
 qyfi8qA9+NAUd3kVh5woi0H1WDrESz6uaMeui6WsRwnc+vBrblOdwea7AhXYjHU0f8GDRhfHhXC
 7ipa13v/pODq+1K8kYjglVDb0XKykfIgQkUK5okPwTMwC8SUmgJkOiBjzLGU6D5heMSlu+5zf9d
 PGf/XBMSx5rO8iZTXFBytiNoQbn82LRH+SXVleErbcKMV3Ul/ZXRLdFgKPJaVJc3PhOFAZ7gjwj
 LmIYdkU1Wn1hJOLy+tfw2OuYneYEsK8tS1nD2L0idJ32dPhO9FEXPV7A7H72XNyzhxGDSkCjOl0
 +tZg4W+S2U/uulBeGr3lL2ijVp3ue1aohjNiFiKKIUe8GLQJOFWOmRW02Uj0maZhWH9wB0YgYsD
 FsnAFxUm0jB4kV19UYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX0yc1tt4IvEt5
 Nt0uGSnCRdF0WmEjlJ8KZsExfoBoz9NnBc9QmWEDavHUxngPWNX1+JUDK4bLO6dPiRT0cVPp+aD
 dQVLK6q1PdvDAoczSdSIoBwFSuBbK3Y=
X-Proofpoint-GUID: ZzDIsXog7loLeYZJpLYti_QDFlMYMSHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052

+ Sudeep

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.
>
> PSCI provides no call to read back the current suspend mode, so the OS
> cannot tell which mode the firmware is operating in or why the switch
> is rejected.
>
> Add an optional flag that tells the OS not to issue
> PSCI_SET_SUSPEND_MODE on such firmware.

I think it would be nice to further clarify what's going on in the
PSCI FW. If I understand correctly, the only supported mode is the
PSCI OS-initiated mode, hence it's always running in this mode, right?

This is clearly a violation of the PSCI spec - and I guess updating
the FW isn't possible at this late state, or is it?

>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, rewrote the property description,
>  renamed the property]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 0d04389c81..2eee38d155 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,19 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>
> +  skip-suspend-mode-switch:

Maybe a more descriptive name can be found?

osi-mode-only or broken-suspend-mode-osi-only?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Do not issue PSCI_SET_SUSPEND_MODE.
> +
> +      Some firmware advertises support for OS-initiated mode but rejects
> +      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot re=
port
> +      the current mode, the OS cannot verify the state the firmware is i=
n.
> +
> +      This property is an assertion that the firmware works correctly wi=
thout
> +      a mode switch. This is a workaround for non-compliant firmware, on=
ly set
> +      it for devices that ship with firmware known to behave this way.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
>
> --
> 2.56.0
>

Kind regards
Uffe
