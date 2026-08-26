Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DC63BD657
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749551; cv=none; b=OowlnISAWtKov186vdQeeYaWyjPpuUftjTCTimFHPvLZOmOJIxPXNDER0gQm0yJhYVgbiMb6U8vpjM7Pwn6XvmirAaT32azKCoBkaTEYHas6Ezbt2onVOEH/VhbH53TZ3N8nt6drcRRorVnlTve78SbNXU1UbRLQiTYLXRYidys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749551; c=relaxed/simple;
	bh=LijM8Pfb9EoXv1mU9m4EvRD4WSkKzNtw7DC+krWTGj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rdj5eX5RA94NhJNPq8tYqXOAtky7rfbdzPmfASY6Kx4FxS7bDGz9YVbfKO4JoAMYhB4Hj4ntG7eb6jwPqwTeyjmRkquH7avAmQgC3BqdOIm0gnFjpsYXLnWWq//jBOP3Obzmp5viQvP/l693Scn/cq37phWxUr/mILj2aE9ntLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NA6VaN8O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBXo8B+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NA6VaN8O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBXo8B+M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCG3n1223082
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lZQSfth91J4kyFwj8xgnIzOpPdRb9+wGlLaKarABNo=; b=NA6VaN8Osl2+nh6Q
	r7rCkOgZ3SepqkK7AocvjjmSPt56mfx+UjH97ddBECTcSIOAJaIGhSJdL/YYWbwG
	U7WBAtbCrTsOMC44gTxfTgWlRsMl/mZR6XR10/rnFdf3w++o2P7JbtpU8dLY/78T
	6/Gf0I/854vZ90XWovcv/hNxa3/M3nZk0N+y3+rlJx4LvZ+skR8HonVmWuThkrxK
	SZW5H7HSXQk/KIbP66KgESp3uqIk35Dk1A6AakJW4YIZaqsVAoxw+VUuZ5uD0DRi
	BO12e45IeGtkIEe7oSiJlKzcgeuvEau5ccxPsyw6lCQovoXdVIjasw8CwLk07r/z
	qUGaUg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gj59n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:05:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso11544241.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749548; x=1788354348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lZQSfth91J4kyFwj8xgnIzOpPdRb9+wGlLaKarABNo=;
        b=bBXo8B+MIvZ2HHDp5FXKDV357LAn96U9gcCfidpwYQCyxonpiGRj2+JPTd4yikRzVi
         hStyNmr8h9ov17pjFJWNNolefyha01l7m9NMubGECxwpfb28lI7ruOdLRYyqiMmIXd5H
         +uIcD8JZad8dZKAmVh/8c/qJbeAtNcO14A9MJtuY19XedH3o0UdshMoc82/HeRrNQqYg
         O+cfpLdLUFOYNbtgD4yoGEuA+jffc1SsscszJt+aV/ZlMvDSyyLPYdZXr/EGyTEYz1ng
         qIY849EhJ3nTXuTAjlhEN1ilybDre85BCV4qMU0TPlHvTulXJiTEInTfcT5Plc8QGFWH
         rRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749548; x=1788354348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lZQSfth91J4kyFwj8xgnIzOpPdRb9+wGlLaKarABNo=;
        b=QET1wvbQ02naXEG/slvn8QnOULd6xSHk8ytcoWTCzuo0D+iMH3gJ74fkvUAmu4rEVg
         eKa4legwz+rWfgE3+RnhuK5ZDKTSzx2wtdi7mupqHYHiaWwD8WZ/mvx/rGJb2qrnA911
         6OLgbFBMjTol2lw5ZezUJIvmzbkpebHCnVhYR3JGxVRNoE+/REvwPNk5kpqFb4ngy+Px
         VGQFpKZ6Ocd6pNtjRKnMhZE94RnlcgaWuLjNegRIu6V0zAM596H4xNSHJxP0j/SesQVU
         pvO9ELbg1GGSog1EzGllURou4r0x3dORUPJqjYAlEXbceyYSBQOOfwQ6+2Z3Rx0IyuBz
         QOCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0GpPSopA13jCmLsg78yr/mWfPhOPYfl6AouUB4RAYSkv+cKGCMEryp11XXcXjW07dqGsXl1h5+YaUDEw=@vger.kernel.org
X-Gm-Message-State: AFuF++mo6j4b1nuy9jXGPYNfAPc89eaX9OWHemcqWDFgS0r4SynW0Tf0
	Ku7BVscqsNik/E1X8qK9hXMEkTdTs4ekBipheBRDGTW8OJYkwccjF/Vyimn2OdsmvxAC9zXb9XW
	g+JPQfjwiGRdCClt+998aZq9JBu/+wixWBBnRky/a1Dn0MSQBiUZYdsehmTfylLFR1iI=
X-Gm-Gg: AR+sD11N1S2lnJfNh4ZlAKPLse1L079ATBbQ4ecqjWvyhzDlUkp3PIuT2BLC7Iqse2Z
	DsHZBfo0EvJ6fkjqx/hKQ2hreZ3Gz2D65nCFWKsfPZ5c1SlUBsa/aQQ842YDw7DsQPwDCr1/C5F
	XonnCD/597QORh5m01HUqtOPRGrpqduQ6FiJ5KfsG9w8knXTacq1mMEt/XYgVXVOA/96ns8XOEs
	UJRu/5m3dOC2odrnqeLjK7u3GSXxwhJ1NvnOGZOaHAH3H65dT3c37d3LJbPlVetYYJopw1fofdk
	CWg0Y1wosIzCLdCauIKShgWV19NdChxFBJ6kNwEbaQeH3G79wnMZ5wPAL7FAdfUUBAq2pQ9rDZg
	360SXX0N3NKjdG6QQzppdmAdl
X-Received: by 2002:a05:6122:8497:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c66c2ca6f1mr71828e0c.0.1787749547925;
        Wed, 26 Aug 2026 06:05:47 -0700 (PDT)
X-Received: by 2002:a05:6122:8497:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c66c2ca6f1mr71785e0c.0.1787749547145;
        Wed, 26 Aug 2026 06:05:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm450943766b.13.2026.08.26.06.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:05:45 -0700 (PDT)
Message-ID: <6cf9db07-e46b-4037-b7f0-03874b62b36b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
 <41af9695-44f2-48cb-b5f2-8e779f7366cc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <41af9695-44f2-48cb-b5f2-8e779f7366cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eDAt-XaITGf0pt1vsa7U4AL-PuUwYuyG
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ee4ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-uBuh7dnxZ-1HGoY8H8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXwBqHR+xYanZZ
 JqrjUakVR3D62e8S+C+GdUmsvsBT/lK0jkMPrilsgMAK6M8xPFrKzZZ4dQBO5Kx/wVyHkasAU6K
 ZXDpWX7ltiDwQVP2R57f85LgFStkQio=
X-Proofpoint-ORIG-GUID: eDAt-XaITGf0pt1vsa7U4AL-PuUwYuyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXxwcSVtwDv2PO
 sYAxb5B3sixC7zzCokBQSbIruMTglIBLBiTNlEnGuOsRvDsqGncCLgV9GbERd7dwAh9tLl+Kj0i
 USP+QhBNfGAAMPqMcK6C048FeOOK4bQ5WAKPYDOmaKK6Atu4U8dNOuadRfkn5aWMdXnGUxN8joF
 IsH+7wR51Ce2ddVEN9Vpv5euPBNJNiZTAd6f7F4CFYK0+Jv2mU1FbzHm1EaHzNZynM7by81W8LD
 UJycci7dpv3a/wPQYciwwCqG7EmBKbPVm2hbW1e6L4Pdayo1WX3OJCkhdZVRCjjRXoYFJYEAaM+
 N9EH3MaG+Qoa+47cHc+lLqFbqBVCY8mCcUkW1X/GWVRSuRUgVhLxgPqU76kMMv7ebFsCn7h616w
 ejwoqAAfbS7y4BtAmOLWp+yPdriYGIq58sHMIAMGMOL01UWYXeIV1wFyShx0Zo5fkQFwMT9cHcV
 CtYO3WP7H6sLb6W5dSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260108

On 8/26/26 2:52 PM, Viken Dadhaniya wrote:
> 
> 
> On 8/25/2026 3:11 PM, Konrad Dybcio wrote:
>> On 8/13/26 5:52 PM, Viken Dadhaniya wrote:
>>> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
>>> controller that operates exclusively in target mode. The existing
>>> Qualcomm I2C controller drivers (GENI, QUP) are master-only and cannot
>>> serve systems where the SoC must respond as an I2C target on the bus.
>>
>> [...]
>>
>>> +	ret = clk_prepare_enable(target->xo_clk);
>>> +	if (ret)
>>> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
>>> +
>>> +	ret = clk_prepare_enable(target->ahb_clk);
>>> +	if (ret) {
>>> +		clk_disable_unprepare(target->xo_clk);
>>> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
>>> +	}
>>
>> Does this need an OPP table? Presumably we need a power vote for each bus
>> frequency
> 
> The xo and ahb are simple gate clocks with no rate states —
> xo runs at a fixed 19.2 MHz and the ahb rate is fabric-managed.
> Since this is a target-only controller the master drives bus speed,
> so there is nothing for us to scale. OPP is not needed here

OK, thanks for confirming.

Konrad
