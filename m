Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562A13ACA5C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092871; cv=none; b=OwFebhre05PpMuO461uPYHoz04042pSC90uXJWhkaEX0R84NcEAj/PKMWXtxb7npx0ozArl/3CrD6gXCczC691aB7LMXRy5pwiWAEFq/S++CrYdByDAIskQzmnjxezwF+fXMdilk4X6XZ2kZWAz2nhAGpVoqbwtGoqbtUmSmVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092871; c=relaxed/simple;
	bh=LHDUfK5CwJ8lI9grWRG7EQmwkF5ujcavl1cQEzZTRu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clEbMgNyXnVyb66ooYX09Pmx0QJmiSUTIrhH3ovTF/QC1xxzKg8e1EiKVbuDgqszZuODKs7kszozf6lChhkW3Rc7C9voc2THUmbHdVuCBDT6t1qzN/CWrX8AY0gUdIvjDIpRildLPg/h0QRnbjD5z4uIN2mEqjDBdRWRJ35E0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+P9tur5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6OSGLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+P9tur5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6OSGLK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEikxY3924145
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=; b=g+P9tur5DcPeVXU1
	J/qxk7tS6vpW+LpaqIZgoV6OsWFqu+2NxYqnnsdLI6mW1cx3VKGG8SJm/0uF/RaH
	G/mGn++EQ+U2oA/9gnjpqjPM9jofVKRzAJDrqv8zmIdrTOjPlyhGk6ekhX9LvCDk
	Nw++VREeVpC3cEE9TUQLGN4XSN9d3svo2dJa7BamXRPvlqR3cEoz3qRe3qj/O3YB
	EZJEe7OUMobU9lEtDtnaOnnawZn74eHElJVtfa3GsJPnQE5rvo/WDHFuq2OyHOoN
	n3zAINhb+kxqhATK3AZHWtPqABhUM8wi9evV8ji9wA1reYgNB6FnilvZvO9la+IH
	7S54ZA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0g5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451b3cca625so8478fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=OJ6OSGLKwgmrR2609CwYN85dvPyrBkAkKq5UlIw7ElQyg1/uLkAA4FJi6JP4tvZZ8z
         Pmw4w8woSA1ndcmkkXDsBv2A3FIxcLMtqvw978yLh1TWB2RBiVFOBNJBxY86kcgog7Ge
         Jk2Dx0ocRIGiRLQyPnzfMFxYDd1fWznWxmPajlvO1MACxxe1YDegvqMtl3dLMtUxRJl+
         05CHKk7Vi2p8WVGz/Nw/xb6bfUbUnpy9An8n2vkXDSFr0HqAuza0aFu8GJPy53MFDRtE
         xTkNq03RrF151CLvZMysh23W8iYoBKvy1qh9mAuFstftQOnc8DN1n9HfMS/FOD6ZZ37A
         S5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=yhbQ2c1TAw4KGpEmHJLZa1bWVhL4RL8MxGQO6k21nuROIRhGbSBemiaHSvtiqG1Pb5
         yf//dJimtTjXidGSaf3P4hPztDyI03EI8NUneydN++mS8O4gklQXCRdR6Y+hkoM9M26Z
         KJWKNSsX0UgNZ+j4MFWWjalcZUihMSY5guj5aLBZLoS5RZ7AoeN5/09qZ8lCEKDpxVrG
         Cfq016cPCf6O8Yx9X4NP6pKgGQoG9bUxiueJ+3dHzWZQNp6gP/XgEHyKfmra/bnPCNDm
         /62mYo+q1XX13Knf3WLEFjYPiZrEIXeyD9vUfwwqE69XJufF8OzuZV1Z2sOOcnVKnaxq
         re3A==
X-Forwarded-Encrypted: i=1; AKwUvBy/R7s/6enMec3v5Hc33mTT+eMJ0zbAYdtAHxEcuVQT+Pge7sGJN44X0/fFMGZvUt6psfgiL4AJ6JTtpD4=@vger.kernel.org
X-Gm-Message-State: AFuF++m9A6fNb7j4cGcgIDDvrdPFnNlzYF8WUA1/ORm3PXthWKE8cNSx
	GUhefEy3HuSiGpaamKZexhQB6plOV/DByQDh2a3gycCd1jOxRLasSexCwhbJGoWCi43o6r3FpMx
	6oFjGmQdII7UI+f9NA1tE2xUXN6pYaGjTbSjRldKa9NMdCuBE1Zd7nZTJUERyFEL3p3U=
X-Gm-Gg: AYBFou1rJsr9Q7/XDL+u0Vk50B/8xNZoWYVPxKeYyP8P/OFr9gMC+tNMQKDm6VWLJYQ
	w4lEUp/jlj8fpvLULRwsgmKoTQK2Oh6ZHposwISYACQEDPKmbbo68C0/ZUxEiBNTQpA01nx6D+f
	qIzvowDTzUpRWH2Q48N43SlZ9rYcTMAtjO/Pqo5GnFUM3DHpTpo+wFPRVrb6WPzkt/ZtfZA/P1p
	naC1fAQ7y7Dmg7Q2RklvkwvHDry9q62WMuV5ea1VhnIRlVXcciV00bvusLG1BQaLBgqn/kltj88
	eiMgPXny7zlKGfrKtLOMgV7CcH7rf97erP0QsV0m7DAY48Bznnqs0/u4FawOENH5XziHNcdXbiN
	LjfFIxjaW/Wd7e/aWossMbw==
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165033eaf.2.1790092866633;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165001eaf.2.1790092866108;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c430a09sm110972866b.5.2026.09.22.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:05 -0700 (PDT)
Message-ID: <03f5dc64-c631-41c1-9ab3-d28a867aadb2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:01:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: shikra: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX9K613p5UPiZ/
 rw2Rn03XOqxeqcoBdGujj88lCxgB0171Vz3L+1qc+3LDiLhS0huwFH7dL6ZofBV7WalSVFkTBsx
 m9G7CRfeglUCckzLEAYBdKhu1ImSmVORDjnYHaZQMI4Z+HKemy8iZ+QGIDCd3Px1LagcBPi4Wr5
 TEcVI+XWr8GaNJbEQZ3kdQLxe2nwI+PRlc/TYsmqdU/A1okUn08B/pC1JUKXWRUFQ+RxTSW4ePZ
 45c0/FwgiY2jQWGjzsZJekAwgHktjiFlsQhtfWeCPbe14ZOyRpbezii8rMB+t3LQW6VXqN1xx1W
 NWs0vJQwV3vB1b5NMPZlV+jhVbnkD68vYfyy8EgHjZZYGB+83vQOz0qHXuUXiVHtcERBF5qBlPu
 NEgVCaziWcu951G4mGA4D8mST86o0A==
X-Proofpoint-ORIG-GUID: _gkMLyPYCY9gWO-JGEvifrXfHjBP8Mbh
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r52As28OqXcKNvlaLHgA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: _gkMLyPYCY9gWO-JGEvifrXfHjBP8Mbh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXzCiMllQ/tEhL
 3v+MUCzm5kLCOBxaLN5Afq1DvcQJE1Ha9z+g2rofNA8EBcw//KeCVdqlyhwy4uPxKoh7lyUnyRB
 bncfIR/q5EZRg0q7sfi5+trAjjECYqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add GPR (Generic Packet Router) node along with APM (Audio Process
> Manager) and PRM (Proxy Resource Manager) audio services.
> 
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
