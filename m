Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659955;
	b=XoooPztDW1AdS8OmCR9Ok8RLYAiCXQ64b4xzl+OeEeKqvcWTBvX8xGNI18Gqvu1q8MFO
	 XDdOn7VXSN7YA3/TSkyhritmKeVNKtAcBRXMAEaOgJy+QiGVhNqCBKOukJRU40ltrMBnz
	 a8olmJLFU+9HXC8YEGDimMzrt2kp+whj3vmwhV9mofHH3UZCOILRNvjuD8j1b8Et2D5wM
	 O4RzctOB/+B2AyT8WF17+GymfVrN34htYXb8MTG6f/m4vWaZxhcNAn3enh0YhyFVcM/wm
	 W8QkX9T0t60a5NWlxjF/Xyly+5QtrnNduMExtTXRJJVx7krvRhUHI+2Vj/J8bSyC9Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
	b=di4y2z4dZpDjf56a1WSEXzfzdMtHvwjT/iVD5xFfYJlR9EEO/+wf9haw416qJjVRtbSW
	 sEqlnGw5KaWxwMmzmzJuz4qEVhhOjpQBEFkIm13VJTHF7sAQ1A1f4D7iTMmyt4Rq6rsz7
	 RhxzGhPRlhCZgKuFa2HN2WzHz5ynXiSTF5fOj5Qdkl7S8jeafUfSPFew980Et7AUbjPUg
	 4daHq9UoroHJ0xVKn7bDgPT1dvxYh/U5HYTDMJp3pM8SoO0xAYZNlRrywNJZiuv4rawDz
	 azLyJ6as4p4zxZcx4caWZrZW+YITnNAtvmA//OPrhhM7ApDeTFljuaFmqc9kFsxzkeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A95606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70SXo4113275
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=; b=liVqCkreZmk/rJxZ
	bvPqMCoh2XwrtRWPRKpDCbxgPz1oHtOvIFzl9Kx3RVMLTIFPlLaXTFOYr2eDG9NJ
	dNHcWMR5Hv3ti6aBvJc9IUqP64tEZTkPMZ1xtMysbOC8JRL40ZmiecCe3Lg0kgXo
	uX7NWPGVrxTPTym82ehyZsgVurN+zMCsEtsK1sCyDtIhsT2sUGjLCw6qYll1lOme
	h+KbouQO6D9U1NtBzEFgfrtfntTNbtvMCgW4zo+PKumPmJR9xDQNtAUgJ1L6n3sG
	PXQ5ZHE/OFB5agtBUTOMGxw8yeB7KNbBZ1spYfBB4ZEzoXy6NVvf9Op3tGCQStLZ
	4sZqjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91795e52969so4382256d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659953; x=1793264753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=H2d4Ur0HLY/OpwYtUQF7x67o0xPAj8uMqnIdFSbMLXHU5lSfDS+ATwZF+sLEZyvhUx
         NcouU7CdlJtarFxKXdN8PHdTq+ZJchFhogyhn4Y8batvYuCMyltgUTYVeuj5rg/WE8i5
         7U4soUHVIget/zS05qYG/tRaxY2+ekrZQHEqtt13d81Pzvarlw9NDnECg36aLvPXkbe/
         2yowN3zWwH0VeQayH46mz8pb1WAIV9rJKkB7lhIBkCn43YK1ppAuLZVTWy+lPO8lt7mq
         KlEdoyi0IOMY5lI2mZEboqGIFkrjtDhlPZqbuPAqWq8HO+r6SUHeQ+TW0C/kBdpSBy2E
         /11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659953; x=1793264753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=j+nGEXSBqK8MYepaXBYAHD22j7RA08K7zq3nTyVzuawsFaI7VswDbGzgUIWfQq0hL/
         U1MS64zZXFlcIZkDIxw9qJZ9lY0nOl0UGrVyBr4HuStBLQ3x9hG1Y3kOBvVC5/wlYeY4
         Qg9eXDyofO+KuOYTwmsupniQdQ8rJlY0hfVe3cDw6ImcMLCn4UwOqA2vC2UnM1o5YJXs
         3wrNzWnzC4gDikO+WyLPbpbj9EUraOWonxcfu0tlf243iHc+FUPm2F3y9LeTkBNYfArM
         XP3ErmKrtobZ8Jy7sLUt9a8cR59Hv5QCu2uTYjgayjfVdRM55GYMfXo/X1t/cMpugRO0
         GuwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIWfrvXEcbfwaYdys7NWdqdd9brZ9ovPjCZnLhhzXBbo37OsYNfVaLMkCpGMH/+e4hJqxs6EyAoP2Orbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYImt+DXKA3VqCE1hyZV4/uVBJF7vNgvwNXHUuKaXjw1yYZLqUr+
	/4o8cL9wa46sL5nIgyeTwzOUfdGBBlSw1sloOecBFGdj7SPsmF/PDllvv1wZhGXJ6xw5JFFjHuz
	L7f1DQzLcooTlGkUwCzWvvYjj5DEYR2ZpeQXt6d3qtVxB1eAZJYNFSUXoUFdWOBa5TOs=
X-Gm-Gg: AYBFou1dd2ycay1UeXFRPHuslG5Kgqw02rAKYZFJuJ7mgX2b67xX7wDbZb/ReRK5pL3
	HeSSsqT4CLIjF6Lc67JduBXYGQnihh1ldBiOVGfHPppcWkgrsy9qu897RwaZ+BSg1k6R4ynss52
	7Ks6oQ71NrlC4L2y2+sIzjbvvp5C8p8c9mH8SF1GeMn6HR5HoaioWJ7h1B38o/TvdRgH1F4DQZL
	FcoZfNB9ti24wIYbEpbeG1JNURim7vO9BzIgwPPNh9jR2FZ1qutKuU/ijPWTc01Lb0EH74fVxIX
	aBtimE58tTb83dgzNbyLfNq/HBes5FNNjZ2WIg7dNWVdgy5HcLYWz48CJ0wE8KlxcVrSDmyGdQA
	/T0wqgRF3QboFrFO34+/gdA==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988867285a.0.1792659952790;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988863085a.0.1792659952237;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316698esm1638748a12.33.2026.10.22.02.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:05:50 -0700 (PDT)
Message-ID: <741e2f4a-c49f-4a4a-a376-8e986a609bf8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:05:47 +0200
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2SNHOgjSUv+f
 UDc9agayAZA9/eqECWs+h8Ea1ilXHO9q8Fh8jvLQ0odZmp0P8lGQOMOO8w1Qm9SGAnhSyZSWUuf
 WrNBrGOM0ED7wwWY5L1ISTdK7SBODRODF8xdiAbG8gETKe1sE6GkLaXRvmlsF8EhEZpnZkIM7A1
 oCUrJKnE+tSZ+L5atbPR1CGbeWSnWeEDEwtdNZiiHA3/J8JkkPyYDJXE8/bqdnSYuzsVDC0zRi6
 kGAr3api7yD62HmefunTpnd0j/PHdVPl2eXD2WovGP3Arg50NB4W8dEwHsXxCWYuEtLOFIhkPYh
 Scrr1u3X3FC1VhTjqH0PFyOtLRyiEmV1g20iLmN4YFGl5QdxPftPptCtVt4348PAMNJdxf+uhzg
 b/FkB7/K5E7Bq6v7303H7QEvE/L0SWTKNIw2ESnmLp6nztIIr8kT8exCBCUu+OOfUerQCop4XLL
 NDUcrSBV7qlM+1/BCaw==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d1f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ix1rd1RWtsmLIZAbYf0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: obRORVjGpnqPIl5L0SB_cQx8rHkTCm5h
X-Proofpoint-GUID: obRORVjGpnqPIl5L0SB_cQx8rHkTCm5h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX07WYxsLI17uf
 cVEKZHGvpTJWiPvujf89SWt25L8NwSduqtdZpEMxloFOw7ML0lAUdsCxVUWH6Hp0ZSF52oPvo3Z
 EAIh6CQVh6fr9LwiWf5Sk1m35JvAus8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/13/26 1:34 PM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
