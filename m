Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557363;
	b=bds2BPi2oJss0S03mwTaeTD75afl7XzBYA6G1VGV7/DT/4Rlq+QE8+/FAyY4YnREB5a0
	 MAr8C1ZSPT7VByXEAqJUVYOXhqK4YlqgNw28iORXXptjLSOlY3XemCmaj+bCXP3YygwsX
	 gi+9uUGO4Q40DuiWuvRGOMax+B2eA8SE2j7WK0nxcZGiMo3SrESdOYPXWlcntAZc38dkZ
	 KC45I8z1M5htH41pEu+gLgy71ltkT+yg87c/y0sKFRqsbYzPtuTER4cw3Cindh1cThbua
	 KHCHEPVsJCXLOVQPGrP7xnVxx/1sSvZFYp8nxdVhkNqiCYB7btBc7lg5CmudRnzueCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
	b=l4Od1uRGvNYwRv7xgwlad300JlwL74Tzl2VBFrYvZrYyFoMbz6vhCNW6kAP5ZF9aySSZ
	 Z9yXx0Ks0uZOQMvePKKHzjMLXHuEKf10YJm5bcvgQ8yfj2fcc5doA1rVBfDgHxUdH65is
	 i2mOD/Ebg84Dw3+2MUsoa2cJ20EgVnEkbMxoFBcM7SzMHKLeMP3i2/9fCaRRk/H90mm2g
	 5UlGfQdDhViMdBPShN4qQrN0Gvo97NpkS/Qb7lURCVgBTxsP+8LbP0EHZ/Pgse+JdcR31
	 yNP4ThNqpENt7HInbjL7ryxYVjB5LnHRgdZrKBSyQz0b0C24kS5qzsTOacqUzc1FxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B288606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B288606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576BB073413
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=; b=J40ukahTnNUfzPEW
	lPnaRydEpZizw1sO4rxBOD7piY17oGk39Xe4h6sIXD8bOGNulJcsyLFUnnuP5YVb
	dWwSMmjOiPg/omFAeLPVPAGvPYYbKBUljs/+EkDebCv5Px9Yph7njtds81LeuG6O
	kgqsKaMhA/g8jqhzVmJ5feKwpU6yT2D/KE5XVmRuAVNL5LGM3KOikJbDoW4P1FQQ
	sfEemdhfF4oWGTAWX/pU59p8XDoQaxqikIL3FIG6IqtG+OFJPUcVMiANzeIZpzmO
	m2c2IO486Wri4vpCYWnsF+yKiS5gmbm3HEawl5vou6I3fF9+EhEVa49qfB31GL3F
	ZC2J3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs044rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:09:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so17808085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557361; x=1795162161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=aSfLprN0bqRXbClMHpP6CaNBc7BmtlflbD1cx0a8wrK8ufYXJh7tOWd1DIdb0BS9fg
         124eaav558J64bSDmDOAvwD+mOo91VDYxLnnNbxIUpH3nJFOIpW13FwVLqJ+y109KvFQ
         dnv+MK4KIadET1JGGfA8fP3ZNRyrFNXwpyj/BN4OCB4hs8JQXHsu5Q5fkMoJjiQ7/Pr9
         x+K9a5NefQsGOZ2myMWU8dXOcWWGpRB12e3C6IgIGReREtMKro6dXuphg8w5PEjJnqpX
         5L2laftDi2uC+F6owkw+hPKtx9klqsBO9GOKAtFPdnQTow7sTMjocOkEfwvG4aeo9qjh
         cfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557361; x=1795162161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=sJmt3jq2o5vFiCnw8FXG4oOvxF/VyjT+KZ8V4WwitqIjclh/IeyA1YR0L3DgwYvNzS
         CK/iSixugGL9cah5zAyhSnIokvGQudUKsQCTjjIsOwNjMtFhVQsz0kPjvmGvvTY/4ATU
         bUxKkQ1n7L88xSqGN8CT+XWrFuC7kNFPYrTjdwYPvaJdTtOQM9i4LCnuLqL/R804b1Mr
         bn4AMtPkastGbqeJkEZVkOc+x0nR88TEHBQ32c/Bl+UVIq0EvQ9fe1d2QrRvt+ckRmyG
         5TVaKSACak8Mip4U4S+1vP+nE3DIw7/OVEP5rGyNr2BQqPv7/yjEX2wclIf1q5/HLSx5
         FpSQ==
X-Forwarded-Encrypted: i=1; AL+hErHKUmoUj8np4gB/XV8/aQHmt3rVb1CwPUKeQoWiMrubhw+2hGm2+0r8JwxkQNMcgoiuk4IcvqdOD0iTchI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/UmSLhAXqAvrSHMD5NbUEhOVcsMU12wQMexf81UdOkb9l/80u
	GyRpyJRdSayB4T/Bnol7nvuTJpHEeICB13tu0LxpoDpdhOiNGwD2TBCmZfIWqdlGSHxTEqPc9gS
	eJbOtrKmM2VM17VKrwo+ho5M2RRXH6wjZIw2ljqi761/6G8GB2m//DIViXrGtqG78QTo=
X-Gm-Gg: AYBFou2uff8ec5zQN2V8RrLUNjhZl1U0wLv4WYVoZuQRZauE9buvbJ6EajmAAERBQ9Q
	vNMQ68hEE6hsQz1pgx9r9h98u8RmqxbeLteONM6Wg697pP0DkTHxwF21AcCY5VKKfmcTqO/k20J
	BCtyrHeN+V68sksmwxh41d2pzxKSAEsM2r1mmIncpqWjKP2/Eksk9yEP0qO+eNEpL8/ZtSwMS5w
	AW9v0Z/m24Bg7onH9GP6N+eG38mR2xi9tjk0KSWrzUNSVgjOZp6UJws/7VGk/Gp4z8kBtrqaPq9
	GnRuFJegqed2XtwTQySJgfBA9pAyUQ8wO3THxKWeeDQ+BPnFzlOt+6GmrqOqxIjNXteCfgdumYt
	bLufKN+92R6H5VU/2wYwZJaWXtnbjGMP5/prI1S0cUYj/jH5PECvyWiAvK0uM+/qqco8877s=
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293509085a.5.1794557361315;
        Fri, 13 Nov 2026 00:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293507385a.5.1794557360952;
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5eaesm646327a12.1.2026.11.13.00.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Message-ID: <afcb4a7a-1089-48e9-b42e-aab834547ce0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:09:16 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
 <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXzJxxBV3mub8o
 MR03G0NpC00VpqGJV2kBLEITFtSEbEEqirwJGkR0cGAPFrtQDjxVcklAeet6ONOJJaMyPFNhyIW
 SXZs+DQNv2sg4K7Lmx6OtAvSUg2H3J/9/p81FG6XWmYx3Z+MA+UV4PP69N51+7c8PLqgWdwkfLO
 IPhM6ODcQuyz3GHGet+rExWkHiPUyd984fZfH/VGG5iyAPfO+nVmoLQ2SGSTsPiopUG60eQHjlW
 V4X4dpgHwCg0EwhudZa70/FvkkKhWq3GVLfyiCu+rnXcZ9HoLe1f77hqUSswi3US8I5E9pEuUrm
 GdyiLKlHUQHYQoA6jJlJD/CZ54oISrC4k5CP6s5qLquhX527GHVyu1NFKaBHmzN5Tx492d3Olj/
 p4ukEm7slIw0EwXhQHjizP1I3zzeIYRR6dkGbTNypC5vlctpwE5W3Exuk3Q83bbdVqluGRgQ1Q/
 GNMrjcFsurq2iMUChoA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6c5b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=zf4sTP8QFhBXReTkVZsA:9 a=QEXdDO2ut3YA:10
 a=pwadHHMnZuEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX5QNTtcWZU3hl
 lBSTx9LdBhlCnShr2iJ3m2uA73eGYu5x5gPgTtw8IUOu1pWBuXRpBUFPnrp5ZUGWFLKhEr7VGa4
 z6lBBo5gNCUZEYjJ2kpOXaLMxXgaUgM=
X-Proofpoint-GUID: ZxksMHlRotul8EpPiPB0LAOdmSp1_lLV
X-Proofpoint-ORIG-GUID: ZxksMHlRotul8EpPiPB0LAOdmSp1_lLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 2:32 PM, Erikas Bitovtas wrote:
> Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
