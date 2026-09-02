Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5B23EDADC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338815; cv=none; b=M2RiWGNHz8NXkoKIuU5s6pGdvDXJEvhYDdJN4XKFBBz01wC8SOHgq8opeYin60Iy6+zuQbKLTr6KQOhFpKVUFDNkQGtxcJC/Fw60OSHh5d4hDQo005sLipu4hPmPgRVWiHSPd5mvW7Stg0oXqn2ZpAwWqGFMfVc+Xp3m8LcENxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338815; c=relaxed/simple;
	bh=pjKHKY/7dk+MEWJF4cjV5fozlLxg++kp+foLwZ0lEFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjcjLgBMwQiMKASVaPgHiGWEmaCtZKjCpIcTC2mawLosyu7zit47LLVJpTG/JYAneqwuNgsbAjPvA+jSBDbiSfzkdbNIx8tfFkoRqcm2NlwnUcAUYmaFWP2kzKq96rQl+XfXwfg3Hbjp4IS+K7NTgMP58Ag3tESZ0qbt4vlUzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te7QxGIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OokDcnJs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te7QxGIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OokDcnJs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WBOT588379
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=; b=Te7QxGIqeNWN0nZg
	ujfTMcuJSwyxPGFhWkUXvtcudiwoeVuA1XrXm9X6EloA9hx819tM1mw6Wxr2O2LG
	RdM5e5soQZTKO9DVl4+zY1u8JV2sU3S/c1SEEbm+E/GeyAkus6haAep0i2ZLXocj
	prTkwKqEjGo01Q8kfdsW+kP9R+jmFOS07MUdpqrMuXy97+7CDWVdvR3nnrv+uML9
	qkR96BXCf8/+IPXjhK2roUI4AtRj+GbihDDkqgwoAOFhKSuXuCpPV3wMQjGVykmj
	X/J53yQkvdxyzpz4IAt7VIj2S298BWyafnFxs1E/kFAWnrrjlY9TpNMbrf8H+KL1
	p6N1UA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435trfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:46:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so20074785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338811; x=1788943611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=OokDcnJsZB28dehqsZ9CQnVvDV83z1d1nCDq0SEta+8dnoTxQDvPyH8zSwjU6Iedux
         9qyDmo63vRmrm5NShja6m1UUhjv3yMjOAQMO9DrzY7lFDb3fd4L7KtuJ5XJgBZ3C4PZB
         uh1+nxVOiQQ5uzeyPS/3i7YFxtV37uA02eq5xaGpnf1EdHcJP29cGIBDr+BPypYRucyI
         EzG4OvL7QmkLWSDEpkYtSbpGSVLAxEJuXIhoi0uKI71jFasldv18UC8lsOzXgI6y38tD
         amDI+6IUBetOLoH+/37ASwWgwDKuHeUdRtDBpb7Kvy0/8G215UElPfFFFli5iAQssDsu
         /uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338811; x=1788943611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=lcUQOSvYteE2xzQluM6jzpvJz6YwFyH5FsDsSPYOzPPbjEkl6zXLrHj+a+a04gwrQl
         Jati4mcSP9Bk1766GHhQCdloxNG5/s0okSjRegPmwt2OIknVk16EYGGSq11+pMv1szNZ
         avTe+icBgEfcdvfdDrE4yT6a+zL+SOmp4glEtzsyfs28AigApJCl9FKWEaAIoPPXhzIe
         SQwpDYxurBb9qziwUxwN7fDhFembYmvTXw+w3z4X0l9L1qYTASayiNVLq/3XUGUilJ3o
         x5Z8TNzTcJTKy8fprKzj4zZ8UHV7sRVcFGl33vR9YMBvGN4lJIBjeTfwyxKU9OP3ZhkM
         UR1g==
X-Forwarded-Encrypted: i=1; AHgh+RpAvcgUJrMs/Nj8ovZSi40JA5Sp8OLgP8lDAHXR7mQvByWQ1wCWB+1JkIMKcjhxuDtPfqlBTlzb6pAjKJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mvG4IfrL7SVJlwdQN0k22kqYQ4PmU5u3CgPVSewhvpaD6h6p3/
	P7vTG+UTdSzuz68tqC2gVZo+xmvv5qTiMW/cqETEzjnE93sljQRs3SmXOmbgUNuGyBNLrRnT/n2
	8/sfKVr5VR/pfuuZj+KFgdy67eRUCVNUl7zkhhByl7/YvM0e3ZoVV1Y2MPTW7J5s5vw8=
X-Gm-Gg: AR+sD12lE+huOb0goX01mYAlbSe1XGdLw8Idr8r5lgVHyvCk+Q9KPb0aP8IMJAbBj+3
	TinijvzhkUliVY3mEGm9/i0Hi3tnMPgteUneXgdFsWOdl03744pyuT+3DWqLLmSYQAWcblEkL+c
	xZ8U0S441tE52DjT3jjnpNcg4A2yx6HR4cfeDjKUzb1dJ7isv7R4ERQSpSGUr9yAb7OcD9ZSOtp
	78cNsWdl/cgAKcNzwENlOLTWs9NekJgXzocZld53MbcIr6Cz2ySpq+IfdCn6x5zn5AAVv+jsN44
	/y8eFpGedVcaRFXjF5gEbs3ZF1/CZMvyTBNDQ/1fOcUcaQjfz+FquIl2XmqIYSDHGEYzxUwQb9O
	lfCFJij4M5YqcS+OtxQA+ZA==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217655385a.6.1788338809659;
        Wed, 02 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217651485a.6.1788338809155;
        Wed, 02 Sep 2026 01:46:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc68a2sm92433266b.11.2026.09.02.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:46:48 -0700 (PDT)
Message-ID: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfXzkrEWsvO5oRM
 MXkINgzBzMb/8wm0Hvwwhs/A4KcoRC46NxlObIWZ8Hdnc2cMPsI9y2J9fA71nXFnv0Z+rBtna6N
 iOq6eaLf+C5q1WbZRBMZZiYetTEFS0KO3G13tKaEfNBbjINVikyWMK2LfPmbdAI3qS2w+unFJEp
 2jHipc3cPPILXEQ3R/NdodTF0qqD8lUllTYEUfmVPPnhO4undt2x/egvkQSX2JtHZaR9coo+j9/
 uKT4h/yXr8Tm/PsaE1/baOOrsSiKJvUSaJl86uzAnLwNz44QRQpYAneqP6abW5xL38z1qBWHDuX
 YgeVVbpggFDpfmMSomf08JfMJZDgx1WP9g11KN54DJZi/linkHGt4kNNxfey9lCUQ/xUeUGrA2T
 3LcgiP3haLGPrw3fYI+UN9VjUZKjvUuF7sqbSs8hdj4VtU3wAWuqJahGSLZRigxh92zBTee4dSz
 kKj4xkV1u4Gu9xEsuxA==
X-Proofpoint-GUID: NqrSWxZPH-_cNngKPmUIakVKpovio7Wk
X-Proofpoint-ORIG-GUID: NqrSWxZPH-_cNngKPmUIakVKpovio7Wk
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97e27c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x6ikuqDAs4aUxygX8wUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX07qvnyX6lcfB
 yfT1eE9f+1EMhiKrh0quNdoMUiAsMN7kqQT2JDNfXIUGb/i6I3KsZxitxQ6GO2nJy/tpLIdFfrP
 0nqXh9qAuPAWMLbq63QdKdMG0MNKXsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020076

On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
> Add PCIe support for Shikra target, by adding dt-bindings for phy,
> controller and corresponding phy & controller drivers/device-tree
> changes.
> 
> Shikra RC is connected to TC9563 PCIe switch on all three
> EVK variants: CQS, CQM and IQS. The individual downstream ports
> of TC9563 connect like below:
> 
> DSP1: M.2 B-Key for 5G Modem
> DSP2: M.2 M-Key for NVMe
> DSP3: Embedded ethernet device
> 
> Power and reset to M.2 B and M.2 M slot are controlled via
> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
> under active review, current series only contains basic PCIe
> enablement for the controller / PHY. TC9563 enablement changes
> would be posted as a separate series once the GPIO driver is
> ready.
> 
> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove TC9563 specific changes [Mani]
> - Fix commit descriptions/subjects [Bjorn Helgaas]
> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>   node.

You also silently adjusted the OPP levels in the DT patch:

< +                                     required-opps = <&rpmpd_opp_nom>;
---
> +                                     required-opps = <&rpmpd_opp_low_svs>;


is the lower one suitable?

Konrad
