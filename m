Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866077;
	b=ugtKPOh061g1HcHF2wYZF8PauF29Ufl+J3HRe6TSRbnBRhX/drIfHGtdUtGQzto7vcY+
	 RrOokxIqX2f12IrhN9XlZKVh43ejtCVNMPNFTiU18dHDQLhjS2uuPOVHUtra+7dDMJHvg
	 QEq7HDzivWlprexCknnPuj9yf/8I9BxXjWKWrhMpRWVBzOmvNyR3OKBDrLfy9i2WYu6DZ
	 zvg9ucyuDbV5ogPxDmTRBEc7cT84wRHszAoVyjvLYAso5EOBrJgbHWD5psgCzOk44/nDR
	 FdJZeZ6LOolh5zK6nFSemfGhtmw9LQmsbP9nu4lexnMNqcBzVoLch7O778uh1dOX1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
	b=4OhAFiatSgp9KMk87fog3gfn7OAsisVNkNW/TNCvjN4udRHAfU5e3x3LK3SMRm2q+7bZ
	 HrDkIIhK4f/EF5V8gixls9xyCXyXfZKwf6pnAXAFzICCZMYf7QndX7g6DX/B8IXYkYkpo
	 8Gh/6DwVjKMGrowUgJ/suTNEdpVwV7pyal8M/0KLhed0xgMbdJyWXHYbnRK3XYUFHCBj3
	 5Zsv59Zjmk5TIOrosLTiaRXEd21ErxObkfTxb0bEDnqZepBv+2Q27mNrrIMv59OoDWmD4
	 nBQoJqXAoV8V3pKKF9IBTesVEBy65/bIt8/L6EYU7ucpOQDe9AOCav20pF9tVMWtLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3611606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3611606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UGT44179338
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=; b=OzQDKC7CxAHiLMut
	iSdFiHG8IFC3eQGM0ZWd75RncmWLuW+xyVeW1uJBPYMdmyvXPqC6gX5TYF9Q4GNC
	0mSWiVWqV6IF2Yl7XkVhhpuE179UZCBKgXkpVT14+fzxC8bRDh6DML76K++sai3m
	JKNawe4sK8cWyGGB/0v1mYLD51kfDi8nIkRnlwJdlPXJtsYeTVO2koc3RZe6l+pl
	uJ0nOxWDhUpozvuN/DwVGR30B/QMVtgBntMQ+X/LBVMLT9v1bG0M+jDWnXLGRQgX
	JFZx7LIhsnrX9TTn1f7usIieUsy2I8XYc7WIcJqeLWAGKbX4NRuOzJ07VI2zJOz+
	9vjNfA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4jqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:07:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so9372e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866075; x=1794470875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=PzZcaNCVUN6WoqFdqwAvSQwqwEQvdgBKxjRfpxHtvea6whNOaMU99v4AfsGcpx6nGC
         1G2yd5Ac721TqyJ9+kFuntIJ30bIbRfWLfpAxaPgZrL/B2rs3YAe86kyndw0x9Ho17X5
         JpWptze+Tjivz73XCs1GFtpfkm9QJ88fBa8e1zeM8DlDH+ppreG3PZGiAEX+hmAIGJl7
         o4gTxyecLDLyDg/ULxEcluGZddLdnapcB2AZOpUilavH2sSC8Qvag27Di7qFF/kd6liv
         9UQAsG3GOdVV5TY/xD20V3Na71DAPFyQmM2gi2sIS+b3FQLDjpO21VdleLMXOgQRmx2w
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866075; x=1794470875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=aTbKCbSDqnc9+qdQRtSA++nSBdbt9bsRwuVOhxMnnAs7F0SoxaXMeQekB3MW9dPvie
         uvbSSIa6X64u+Fe6u39CGkdZaq5k3cb0TeLPV4amdfdbmv5YYJ4KBA5XWc1dxg5gepSV
         8Y5O8b5SFReEo8cBmYhIdjnStJiXYzGlb8PoSX3fBG6vXpWTQvPS6j36E0Ybfl/w8Paa
         dL0Au10OF1+N/Iky8AYw6iaROWQcRbEUANo98tt4AvGzvcF1XjHDAXv359cgrePNsIFC
         mw2Ki6Z04tuSIeB9SnJYN8H6+6RHbEUZOzV2KxnUS5Ew0WQ7jQnwPmUcboybhc77SmKJ
         s2pg==
X-Forwarded-Encrypted: i=1; AKwUvBxqKw4UhOMgIeIQnPOtQZhLw863P72khCGSiEPsZokFEJncw3X5TOO07JGfrp1rEgoRTfb8tNgdlMn+FiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c513lMciopsLa4dzXDLI3Xguu+ohYL5HuDiAkcljmwZNMiy/M
	AA6bLk9ZG6IQTU0jOwwqEJzSckdJfsUFex4Fi3DkPqDpgKiyKpez0QMVmEF+OoAAwhooLkwT9cj
	6DPUqv9x3Gd2S4ziaIrL6b39SoZYXzUaehVb0oCnDb3A2p8LXheFlnVZQwuvPs8HGLhs=
X-Gm-Gg: AYBFou0ORx7VOTqIW0PbqCQl6c5udRD7T5iPVsOh6y/37RHQVgYYq2cz4Je4GdUQbmL
	8/AOh+2dB2jqTipGFBM3GzsnH03lWoBfWDHv3P792aU4MGR37Im0qE/pw31mVO2i11f5vjWb7PD
	Sm03bv21xp+DJyECZhVfagCrMLWV9Ao2GqDb2gGEtVjGv0RvosdlfO6s7HZYdfYtJWZiCb4mh4V
	l4zJfHjO8oMi+E9/aCJlpUpjOhZxtjE2N9COqYgj1Fj3fVwP9maX8dcw57KAwc3VFjD2ubB77rk
	eiHByqLPaNqoEdsqNFScYL4Mi5JTT0iGtQqvclNHK+3XqZiFUEzXOQMi0f0m4BuRmLAOMkMraQY
	lcMolQBtUuj8u83p6uQ6PzOdQcqGjuusSB3V+YBA1Snc337G8M0EY/gzzkEQzkwS411oZ
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502448e0c.2.1793866074940;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502424e0c.2.1793866074496;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e1402c6sm151963566b.2.2026.11.05.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:07:53 -0800 (PST)
Message-ID: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:07:50 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXw7sFLQMtVoiK
 qYj9f8NvwkcNmMEdaKN0gcdggWby8ZNPvqx++FQhDmVLfZ1YFonyIy6MJYPx+7+XxjMv5AYGuer
 AyGUkEZGpt/jMwoprAzHNxUqqi9VxjBqXIGUFmAo8qcF9NCZDeanytWDda/On+c0/Ri6uJsHKMw
 e8uN/S62fhFeHnaZHbl+DDuwsnZ3GgrDb+ArvBywLFxN2/TEQ3ikDpGhBDiCHrt3dMRoaaSE1PU
 QZgyy6L8xXndMJbs2uPGgzbMDCEqyG22LB6gh2ZChaW95SbPfwovbz4TB6h4S8Pqlk6au0wSXut
 ITyIQCc73P5AQB/JaIe6SCa/M0/ooQb8pNsy0WpkR7GLUZMR0RCMoBqeMtc0ywy0UON8qVUaMNs
 qQCl9rr4EFMrJ8dHIdzEjtFvplIONzQF6TjUevmIlyGuTd7LEchO0MeBzQzIwYfgxjJ7+wZIhJJ
 qikD38KrYYhS6mu9fvg==
X-Proofpoint-GUID: zHuQjv5n-rJwrtj8pbm9_RVw3KoMmkou
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec395b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S5PwCt2dg2jEj5C25JAA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX67VbIWeVyiuZ
 mSEv5Y0Kc+f/vYOZPXsLyiXvbZP/OAwHQRNcSu46peZlldFneMTcCvGhgjkt7T6SOPX999c2Hi+
 FX30nCll+BWOk4OScYNvVpjlbh8oXGE=
X-Proofpoint-ORIG-GUID: zHuQjv5n-rJwrtj8pbm9_RVw3KoMmkou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> Interrupts property takes a number, not a phandle.  Passing the TLMM
> phandle made most likely the interrupt as broken, which could affect
> touch operation.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

fwiw

https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

Konrad
