Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE13BE17E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383665; cv=none; b=I73NVpDuHzjqsoBfLNv8Cqaphi9FmZXKDLPCx3syRX+q/jm9XUvXurus4qtxnD85yRiOQqCbNqIwZ4ZaIfo+ZOsV8Dry0iOJ/CYU0Osse19AWsFgEAXJZrH44Gk/RjQfDCd6t0gTENnG7oymUGiB8xpEdIAHM/mhUAhjxnJCGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383665; c=relaxed/simple;
	bh=99AvjImape4FlYCaQosf9u1laFEzTnvjo0pR4t5IDPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjQYWdn8CIjfFDjKfTiJC9uJt8d09VIzH3UmxUmpRPMlkUtVyBZVskmI+/tPG/+ZmRtzgEr3doYZtq9PCsMmJy/1wcENj1caFT0SAaCctlcKKGlrFXMlY3K57L6eJTVR6CkBN8io0NOOGok3i+mk2YrdwZ1JhwMNvV/WV6tOMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaRPhCbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVKCCCO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaRPhCbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVKCCCO9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8Wl531013
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=; b=WaRPhCbGKOmI9/JS
	xodI7wE4EQAmRD/s9VAGw1HTtFF3bvoerOhpJNC4AehgpMxSQmtJlQce7sj/e1CR
	OU7qNSLARs2ZuucZCKSw68FROqcf4LEAnp2IRzeGCLaknj7E0JzGD3TN/I5BKYX7
	X+AX5mLP8XzwuCzx6rEyN2jAzR3t2ZujP9QP8IwpWhIKpEaleEkNRYA+8Hj73jXH
	Q3gNB5ytrnNOpIwsuVsOWVvI1/yN7L0n9LXkwtl8YgISfPQfyNJ2dJY0BZ/l4i6l
	Rk/A3M1LM0t4+22x/xgDJ5E5uMVag1dF4MgLNY65sfBJbt5fMue9b/cDT3nxHmEK
	nPPuZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst40a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:00:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso39539685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383658; x=1789988458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=EVKCCCO97p4mmDg+bfro2NU/MuEoCDbLEU3sUs8B0Crp8k4mLR6fTxTZxNt4eW2M2h
         OP7YSjpFqgVqrg2sQiIKxwWS/UqBkqbtT5iTi3sVdyc4cCEVBg3EAhjEMJtGuHifNh5C
         1oMXjnb1GKd6QQBHWl/C7d8+pp0qBqjGO34FNkVZMGJgNv1YFRW0lIyIZbttkjyDQY6T
         vjdtfX7t7MpzboO1T4Uq3CIjONr2+TpfgzK0MFadTS67OsvIVeZibVysbHCRBAf8DPdr
         yoyvaxmT4Itp7g1t8PWOFIXHlEkr1zMsH4cmFvm94AGuY85HJCs5B85FXe9aEA1TweNk
         lJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383658; x=1789988458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=inOn1gG77BMdrgSntjs5wDIYGdZ3dlaXp5MXrorXvTiB5fS9fKoQTWz8PhF/ujDbAN
         89u434rUe8qA5MfViRWvhEcymtOE0zFQA+F2CDagiwCRpPpHkWIMnx2ZwAhFLRuGae5N
         tZnAe1zbq3PuxnNJitq37ztRK/YCpunvaS/mBS3hk+ixE4U9E/Vw67qxXL40sR53VZoH
         FBd1iYJBhfKas6OS3Sq1SYRWvozQPKVKzC942gBT1kayI6c2o8RV3CsQMwhJsbQHdU53
         foVl+oo9RwBWqaxMvg2Af4UiA+JyGBQLlhldcNEA+2OYbQx4wTTmldaZWIdSi168kMy+
         UIAw==
X-Forwarded-Encrypted: i=1; AKwUvByo3Awzm9MS7IPWmpMAIbYP11Xp3T2LLbo+NTjKa8QSLXVKI+clYHRFzk5avvWi+nDWHo8ofygLBlvdifA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUh4DecJWhvfwIWUJwDht/6791z+pgU17eG2UiQ/JBMTKX2ihI
	N3uh7HbJrUFHYAf3rZXHcHUSCdl8gSpvIRm8FQmRgYwa/QFiTKhEiZS7MvGn1/qdXrMe9/XrweB
	70wPg6Xv6yWa73pnLnAdlQoBybcSFVdqlTaQN72bEDJm8OUx3bhcJwbfTo9dKUlaWO5w=
X-Gm-Gg: AYBFou3/DyWYurOtBrRELcHuTcAMl+VzM2A+ygawIea4HRQKQVdapOGekDU/BGSPBL3
	T9BEdXi794Zw5woeEeSsIWQ93kHknq+Lp0BE7zO3ebWWVYO76EidTRlzgwUbOpjCQB4EPXSD2Wo
	9GxRjd011Lhp7smmTDBzExnWkEHnGVS+Z58ExPzOAyEyXuZMiEqfcShCZTOcSpd/xv/RcdvbPb0
	gpHBqJlZSN1Fyfo6kjTkzostU+F1ft8gd94+m6f5R45/IR4uhiNZb0l5V7cbqD3z4P3H0+j2BSM
	PbkzpmGmDxkmoobALUeFDXctY0p+C3oDpYhnMeRpsMR4l+oZKuz+Yu+cuoNDPmUFkMp14t0p287
	i4bRtMVtcVOY3YkLbdWgW1A==
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263325685a.6.1789383658005;
        Mon, 14 Sep 2026 04:00:58 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263318485a.6.1789383657547;
        Mon, 14 Sep 2026 04:00:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm407548066b.18.2026.09.14.04.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:56 -0700 (PDT)
Message-ID: <036480ca-6308-4e36-88ef-3af743a85f28@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/34] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move
 PCIe phy and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXx39Qp7M+NgNw
 maZuvM9hPkKrWKTxfGNFXWczD+EuidhNPkSMYQ2B3J8WZGxRj3x5AthD61rsYKKLzARbPkLfI9J
 lNCZL+PooH++ICso7gkFndv/MuJEEhVQon3WjGVFDuVpeuFHNWCih4cRdmXjgwu+PhN6au17cKk
 OtyHJkoXCNwixEnORwZhx5FpaN1xaeWuHxyTNLFxVcYEYXycU3kHyZk6V9Q4f6J8qp3OHXOJHwf
 beIAi7I91KoIi/2SE/PyVY34wWH3ECbnrAPoasmZpPjCTES20BK04sTlgNewrhCOvK5opK/84Xv
 6spEdwPIpvf1VO62p6Mq74TVrRY3aiRFopI0kfW+abI6hE7nAqFm78/s0Qm37f49yVvegO35HRp
 0uWmtWXPgwkut41HNYDtZCcwGKZa1qGu4G3xXFh+knpSY430CnvBx0jkh3FVODPGanIK9j7cCmy
 XC4e9hoBpnV+M/3eSAw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d3ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IG1prCH3_L_Y_n8aNHp5kRUs2zhKwKOr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX+aUidjDQLhRC
 TWmhCr813N18l/RNlKAILIXgbrwzFZ3MzjTEl129lWAh6MLERFgLvRuOa2lSfILTAPRcxBlFSrw
 yNscJoSoBxrf50L+kOqjMpBVCjI4AG0=
X-Proofpoint-ORIG-GUID: IG1prCH3_L_Y_n8aNHp5kRUs2zhKwKOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
