Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098758;
	b=wATdSRPl3DRWhS9jULghpROlbEsiI7d6cx6g5Tyw9QQmyBPPLtzB8N4UIfY01S0wAN7q
	 o+tTrPacF45qLxzflGvwD/4UsE1B8iMG6A6kDxb/FG5RDNC1hxZUg7C8R8hzt0HOjD7PW
	 CHbAGKMcFZq5TH7VI8L//4bGp/tTKrfiP1KH/plnNxQmqtPMf6DK3IeBGyyGJif2zEVB1
	 cqJENHdZiVIbHjho6eUorME53fNxz7QuMkkBemndV175Yx5+aKlmOp2aVN9klWPqushgx
	 gEvUUziNAdtKQ+FRO9RyX/x5HRp/EG3j0CUu436IGHZhAP/SVDNpFV1cpVEI15YKhkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
	b=2syu+vGYWLQlwLtngYXictnWaCGgQyeWZ8nS2dcCyfnByevZU7xXLHQ1X42TT90/RdXK
	 EybSDF4GF/XywoF4RT5ORIYuop2oqDwJZ6X8de5xsUBqFZpwOZw1UMjY2ERTdpWlTn0TK
	 EBx+lI3eGsf363HaxKazOroHcsMkfhTZ06BS2IV59OaRfyy4O2dI2lEb8vkPUyqH8Dx8O
	 SdeK4wDwGQCEQT3nF61EwL51kzY+kxkZnbgmqA8s6MToA4FjMjFB37U9RISlmkeyb4XDe
	 QuU3QzOAPzFMlGsAw+WAxnga3f2WaLANM5qQjwLPwKA538ZVOVa28PcwFNmZOUYFD8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B3606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeTHU1428073
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=; b=g2NsaQReJ36rM/Hw
	ANtKXnFgPvPjpLlr1QmogjS42TTmdSuN5EMeyL4OMzU1NqjBitT0xlH1SYJUO8gs
	rY/P+vC15kNgOHSXXkigaUL+sWgqFwFtNLoG+KzKeal1HYp9Ar7kR+xksi9atzNN
	2krbgZUxVuLT8z9RZ4kv/FzEb1kL9QoTvu8DciIqEvVZB6Is8zLJkODgwn7lxNj9
	ei50p2n9LxI+s3TE3IstWDSg3lTBBuh3K/G/yaHUDJxw0FCganS8N+c/HWno3nE3
	amgBCr5HTRqhEiDmjMAIzIytndhN5fF50tWADHyiC6Og5O5yaPSPosAIaOAfvoEG
	qOhSOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb7rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so119559685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098755; x=1793703555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=RWOcz0YCAQ5klaOesGNOW8t3k/YC98NFY4jWZ1cQ8PA9um8fx3MhAVSv6T6Q9WjEV4
         r4QX59QSBJs0jcGEe/8iCJQPDyAFNDN8s3P4c2w+Wg0UHCSGtqUfRdcaSFMa9wfxNEZ5
         AOHFZ2lMd9uOwvGfg2+cyvdSufnogMYAk/LW2lkV7JmImW4cn6yj3cSIA4jAm/8sjI7O
         lwM5T0rqrENnjZl18E4RgEEmf4U9T/IRwk6YSruS0Qjx5BbI2A0MuZXpcH/9d3GJyIoH
         0XOTDxJE600/sW8WX7D39pBu7eqRsiqZb4Pd0N+LSRpinH7S5HHHS274uuNZb/6E1pEA
         Prjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098755; x=1793703555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=zYot/Ct0ynB1kbQqyeyjnYrTytLNvhtATYEpKOYMN7trrhzYzC1r5xxvwX9Vuzvum0
         UmuG/Dm8NmGErEkvHMEmGrX7Pujn6MDTLZ+VsKSxVs8C+2Sn0lzCP0YftEKZka6oSiEy
         jVOxls/bsXGN6+TupJ3uY4odaEpomjIu5VddfscTzyg19kYAl7ha4L8IUfUv9+IqEbJJ
         vY4YPuOW0Uws+Ga5GO014S9sEdefHEA7kNRP+9FW/UTCFGnIwd2U0R5PT2ypTmjfQXrJ
         BVwO3dsrSPZ9tYon0ckzzkatyDRR8igXod80bdK8dCuNYcQIG/j/ilK7osLG3Uv8nnoV
         7bYg==
X-Forwarded-Encrypted: i=1; AKwUvBw67W5A9oeHGTNdLo/aCqvjHy3OwH/Qbc4yvFkWh/cfjWg2sjHXPVBIzuLeK3kkB8paPz8ol7u/FHKB9sg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCzwoMDb6F4N/zsHBTxPvQCcvV/h6xUDH7y1TBuFz6LpaO0QKZ
	mFnWmoteZCqGU+2MOATmcSq7BzowJglQab25ywkWw7dXJv2CP4U/nzAhtm4DXj4JtVH/lWDVfoW
	/FnMVoHO0hOQMGo1daXUHIy0IPPBV7oRR2Z7gSext/HzzeI9o/Vjo2KpS8fr1lPNtFrA=
X-Gm-Gg: AYBFou0ze3Xf1vhFdk3O6Dj1PfUjAJj8lsBtX8dHLBNFXCxyorNwLa1zX90JGEsEYdK
	+lsfb1CXV30f/0O8bTT7gOznAi1o5HVlRif+ejz9NrduHn/UPJ6VuOkvkP8E5dR3T9VfoVtCz0+
	oTTfFAe+ge6erISxA2NBdhomy7TIrfMpxH4mwWwZLjPKj3Xt+4cTGaVlEHKFO/7FFLG1WsgEVIE
	xCXlzyIMgR9PO+p+JxLz7gpnsU/v5M3Ta/K4Rujp/V9rklgRJXwF0gvHkYG7l/Tyy6TXLEIXZqB
	5/Zmcn30qVmcoiqtaTxVu4GJWSx5P13OPFgnaFb1pOhG/ZZpVhN6ABW8mpIprE5cJvSLZL23OcG
	8sibZANRlLswXF3hb31qIzg==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731205585a.4.1793098755351;
        Tue, 27 Oct 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731203185a.4.1793098754937;
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm431186966b.87.2026.10.27.03.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Message-ID: <3351a7c6-6dee-403d-a8be-57714397144c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:11 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXwC04NNtQ+SV6
 ddpkCUx/Tm5SZpP6OJIHa3qGP2278DG1pz8tdfGT9h/36E7xcSZW7E4gMfVKIJpi4AncmLnus96
 3PtCPVrqB8SECUEjV+QZjbmBKCjEMU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX/llbxPwn8E8M
 /DAOwEb0gj2QBfG/ZHxfDsKo8mde8pyYLC3W8i3VHvSvsBcJHmXn/BQErrtWUAUKl7+gXfWaiS6
 HF+2ja6iQQbXUz07RSSFyzDESAH6ffIP75eF8PndcIdEtzXTKTMqMFDRwwyVLz4wRqwdQENcsm1
 JEQP8FLN2PevAcBe4hz2+f2jpOm+2VXLWTHJljEwJOsGfCICcDDkSdioXFqEQyH07VqQBZZ05SI
 3PhcChmMwURMuZlv7YGfutocwNsrP519DDVUXuGQc6n51K1sKuBj6HyPN11LoTAeUGE3HdMHyK6
 Su+96q+ZyVfhKh8KhDMs5z4c2ZwGk+xxqki0Bj+JnP6UiXswIT+4o18v6I11xgVZx7esU/Kq8Kc
 7+FgrbK+D166T1mjkAmuT3Kn+qTwdfAs8f3dyhGNx5xl0pvs8Cu5YaO2tpj6lJCfTZJNkEdIocH
 BE7pzkEqiY3dEP/EeVQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae08404 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oPNFLItuUPTHsqlAT3AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sOeCdz2BNBIsMkp77J2rteKsaPDEjI4g
X-Proofpoint-GUID: sOeCdz2BNBIsMkp77J2rteKsaPDEjI4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
