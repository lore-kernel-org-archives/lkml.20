Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720473;
	b=fbsgKvKE7+HFSepbCxQudC3nlPcQgREWj2EFYPitpjiIHsQrqHiqqUBAgkE0L50QANwK
	 fQKqqwK1MSsXM9TrO3tjmZALssmq7x6RixZdYqILJqI4409okccDT0SOHwe7nPi7H1mQF
	 ia6EQGB4F6gfZrOfol27CxQb0bWLsbK2vS/CYkDHBHFO8+XPVUHVLVIbmx1Ggio42/ELR
	 3PFKuftOhMD31SCeBIGHlUizp4mqrYYhFosCaUqlBj4Wu5Vtvy7GZ/+tkqICcIITMZf8a
	 SkdcHKYUSeFOP55gJeC1en+H+Yj1jxz25zYY6GaXU+gL0skmWMTFvkOR9Rnq0RU8FRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EG9dwL8Ly2m2dvAdlIUrStHBH/C6i5YMZ6NWfvKb4Mg=;
	b=JbGul0L5kfIYpAmcwC5z5DFqK3F1ae857ZCpIee89sboQHuWolBGyi/9Cz29hqO1/KN8
	 66SyCysTGl7aZYFJIc3FoaIvC+RRa32zGXExiwa9M7fWEgYqlhdzDIciIBRmoeh6SdpJv
	 G1riADj8F8OPZwpLhVDCzZmCUYCYdma3sGdpbxeOtwgWWqu6O7SW2z6Ha5yjpFutO696r
	 dgAHbtoQM2PZI5qm7TOevW1CoawkQAidNBb8DvE82gL7f2rCADV58cMTRQj1HJV7p1WYo
	 YgNROmvOxWEHvBzfWnFW5io0C8ryMk7WIdyTKYgXHFHm1tDaqCgQ8pdckEyN0P035Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXB8Fhrh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y6JxqLX4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE4606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCE4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXB8Fhrh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y6JxqLX4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3FVGRV2300244
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EG9dwL8Ly2m2dvAdlIUrSt
	HBH/C6i5YMZ6NWfvKb4Mg=; b=eXB8FhrhQLB4AHbk++n7DOG4C4jWkBty4K6LnH
	5T5SLmlBkYs+Bclm/nE6ztQbTsZly3yzFFWXII7GCpjFnBOC+vHncBZ58QwbcFAI
	6w3VQ6mMYtg3sE3pl0tQna5WhZfboTrxUVLbzK4UaJUbE8S4O+vlMWAHY+6zt9eL
	zh00nfLUSw3pLuaP1sIpU2ES9+3L8qM7uC/EtQoyxbBK/X841Zv4tiaXrh49T/th
	d7Lk5l+iQ7/D0ML1xqa3umwaajT/Yb2d6CbJR8d8wOTLPQMbiPnEb98ja9UltZ3O
	Ei8VWkency87TFRTc/udO+HP4CzSIspXYf5G/yHJTCHWrzDw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2brduj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso7812998c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720471; x=1794325271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EG9dwL8Ly2m2dvAdlIUrStHBH/C6i5YMZ6NWfvKb4Mg=;
        b=Y6JxqLX4wBZnj2FPC6oOzLYCMATT/2TeLU0H9yYC+3Qvd/isAtvSklwqtuLnt1xQ2e
         2Lybho/DqtdVndwWWOyCaqWSbamaQ6DgexdE9oNc9nMnCp4ThOMS+9l2syo9Nv8Z4bn0
         nssNOPuGP0Ii0mR3p+xuFyujYwjlrcxoGhO28JWt78polu4sIyAD4xG0be0D1P+zRGWt
         p8ZeB2Yoh0arSmLKy2KdPjdG2RUL7IQWnmENI8QE5oldRR0WTeUlavUBwtgHAwfA9PY7
         Ma03xMNtbdAmdwHMfYrQmEYW8XvLTdEIjhYefxA4KG80jAFEsCjKFgx4EtjSFNUH6c3Y
         aOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720471; x=1794325271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EG9dwL8Ly2m2dvAdlIUrStHBH/C6i5YMZ6NWfvKb4Mg=;
        b=BH0O03wu48s+5F5VEmE83Zn87ZjrTvonufnmBJsfl8pbHIZOcyYTTukYfslS8ZZuHp
         ib64u8qYTZas0K/JtAxvGsYb+0A66hW1XZL9o56MCWZVp14NkNPG3RWMPO5N32sGkUoX
         DmWZLWr0kV/WsBP90fXAgcxe0AT6p8iS9HR/8HzzeVGiTRXAOtuVbpg+Cks2ewjx3M54
         v5YBqGZThN6Hnkr3ZtI9d3+M52Arhju7jRFoFI6MFQZQ/i1aK/b9vnrIAKOmHoRCL0SS
         U7N3xDsF/ouaxJ6tG8rJbHiJf+Ckj9swqzsDKNoHEuZY1mbTwA1/3dscrPrb+OMmQqBi
         IxFQ==
X-Forwarded-Encrypted: i=1; AKwUvByV3mLhpxirqfdS+3OJxHv9kDijKPIpjKofaTNedjRHLxMIu5BF7Q1Sn2FbNbAtniaZ4us0fdzo917b/LY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ySjXuEEUxaHAps61mMuHAUOB3tRjbzc5agzV6HNzXxtxkchit
	bcrIDfh2Y40r92WW/dtisVv87G2lm0tJPYbaIQvqiaKVjsPLXxGTN4sYWh9R+20WoeNzIoTtSlQ
	Le8jvkDXuyTd0kE3+JXKVUfVragC+tDFJ/FDV4qz3vqCMNQ2ZtS65omiNAWr3lPhMit6wgtTnQs
	w=
X-Gm-Gg: AYBFou2/NfHDkbnT1vqF0klu3RS0sIsLYYTng3Ft5AOdaWpyfS7eSXXYm5qf6Ow3XBK
	Vkt5c0Z9AFlr+HMYVteVU54iXwxKKYkq6Sa2PHtmD54Rbnb4eG9vg3R9dZgyvBk7NHTfqN66OJ9
	gK5NzdcFkNdiO5uayl72Xx6wO7r3KBTTdD2SaY/CBvQDOQAWGnh8UNzLkitjY4ZR/MW5HFlxMlr
	IpcTTp4ybouYcVtF9OELx2JEEtMz9ceAYPjNop9LY8f6utbHn+mg8NI0q/S0QviZ8oeCckABbOQ
	Eg8V2WsHHLgzLoW3MQjZMrJn/wibpRPJlZXj9xAtopC7An2Wp810AKbHfMLMVvGKaouQGOh5Qlz
	wr4iBJ2krjWwQVlY4P632aNJIaM+/E5wuRWtD/cYn1GpCNsun75NOIBJAns3U4jUNjIR9zG8mq/
	5Y9Ro60rk5
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr13313563c88.38.1793720470660;
        Tue, 03 Nov 2026 07:41:10 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr13313496c88.38.1793720469910;
        Tue, 03 Nov 2026 07:41:09 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:09 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v6 00/12] media: iris: Migrate iommus to iris sub nodes
Date: Tue, 03 Nov 2026 21:10:31 +0530
Message-Id: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8A6moC/22OUYuDMBCE/4rk+bbsuhqNlOP+RyklmrUXqNomV
 Qql//2ivbe7l4EZZr/Zp4oSvETVZE8VZPHRT2My+iNT3bcdzwLeJa9yzDVWSLBc55OfhmHVxZ5
 Sx138eIay1GK0sdRTp9L1NUjvHxv5cHz7ILc5DdzfoRokRrsNNNl+5RMhg3Xulx/W+QiLBgTW1
 LPJyRLz1xTj7jbbS5dquySf695fGlIFPvgI248C89j60cFCiVfVaKiopTXY/89rbRRYE39vslx
 z1TrpsOTS5lgUnasZpbXGVoY165KcwYLV8fX6ASqA48pTAQAA
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=8136;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zb6mcxK2f56tadHINIiExyxisEAW+UBVwzaiOKzDrY8=;
 b=jRmoxl9QWAysKatLSpC077jmG0P0ouxUQYCa94qJ1evFKKgoeIXS4F3MXyJwUIq3nFAWzu6lu
 KgULXKoOvYLB6Z7zcc8Q9s1AHANY2bgMMU3k+crodQdrTDoXi/je+U9
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX8hS0G5rk9+PY
 dn6NMOSE76+AAnAM6rFI8ICvNqtFEY5dRBxeCna/wYv6DSANvMVJhxUY6bfiHpZtz1/+0Y7n2kZ
 C+sY6mtFr6wLnW1/5/r0/s3hH0G/1Yg=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea0097 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=clIEwUPuL9h61AhfT48A:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fHhc4VpfWVxhUTgF7KKOLYnhxixD_0ze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1iXkWl+f/o90
 zAIJfvx9qvyt+fjAK7PX5wAsjrGFn4RtKnus7B3Ha/xWjYbYp+Ngj5rj7iza0cW+9HuCjxoBTIX
 bZGd7+1yn0qYHjJ9CbAzE1MOIHJI/lOLvUgNfOf7/GV9yoibubLOYg61REMqAf2T7ffwhdByXSL
 uqRHEuf9B8fcqrFeKZg5vrxsYdor/eefvFgn+MzRwHQ3PYlpJZPCZafK4o5Iymghyuv7mDci/OF
 o2kFPaVzyqKtamIUFtJm9QPlXhtMSxAxa287HyqvN+6n3eYnGHTpU+mgv230mBqyLc/fOMq8uMo
 58WbzEbyeP1P8Ni2tamqi+DKjhbar/0G8YAw0fNkGePf346WuBtO8FnjCnBKzJTSnoWaHmGCVMA
 rYa73JB/Ade6r/QJnAeVfM09QttMlvGiLrAg8GjPr+hB2fq2HcHJlPapFKiFpgNf4yNOfxyxmvH
 iFh6mIZT8ogndc9X/7A==
X-Proofpoint-GUID: fHhc4VpfWVxhUTgF7KKOLYnhxixD_0ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does 
not restricts specific streams with specific addressable range. The 
non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
pixel stream can address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer inside the low 600 MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix was made in iris/venus driver to reserve the 0-600MB range and 
thereby prevent iova allocation from that range. 
https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com

Given that the address range restriction is for specific VPU stream, it 
should be ideally moved to that stream. To achieve the same, a subset 
of streams is now represented as subnodes, so that each can be 
associated with its respective addressable range.

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The maintainers agreed to proceed with the subnode approach to address
the VPU hardware limitation.

Reserving the iova address using "iommu-addresses" requires it to be 
placed in the reserved-memory node. But when "iommu-addresses" is the 
*only* property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong to 
reserved-memory node. A device IOVA range is very much specific to the 
way device own address space is mapped, and not a description of memory
shared across the system. Given this, "iommu-addresses" backed by a 
"reg", should be placed inside reserved-memory, otherwise, it should be 
defined within the device node. More info on this discussion can be 
found at
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

"iommu-addresses" property expects a phandle, which does not make sense 
when the same is defined within individual device node itself. 
Introduced a new property, "iommu-ranges", for the IOVA ranges required 
for DMA memory mapping to that device node and when there is no physical 
memory reservation.

"iommu-ranges" is defined with the schema PR
https://github.com/devicetree-org/dt-schema/pull/207

Patch #4 in v5 is now posted separately and not carried as part of this 
series.
https://lore.kernel.org/all/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com/

This series migrate vpu3x platforms to subnodes. All new SOC having 
iris3x or onwards(4x 5x..) should follow the subnode approach.
For VPU2x and AR50Lite SOCs, which are being migrated to iris, the 
subnode support would be added once the SOC is migrated away from venus 
to iris. There is no plan to upgrade venus enabled SOC to subnodes.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v6:
- Addressed sashiko comments.
- Rebased to linux next.
- Iommu patch #4 from this series is posted separately. This is done to 
get review feedback from iommu maintainers.
- Link to v5: https://lore.kernel.org/r/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com

Changes in v5:
- Addressed review comments in #4 which seems valid (Sashiko)
- Added RB tags.
- Link to v4: https://lore.kernel.org/r/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com

Changes in v4:
- Dropped Daniel tested by tag (Krzysztof)
- Removed depends-on info from the commit description ((Krzysztof)
- Dropped the soc {} in example (Dmitry)
- Addressed review comments which seems valid (Sashiko)
- Binding patches depends-on: https://github.com/devicetree-org/dt-schema/pull/207
- Link to v3: https://lore.kernel.org/r/20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com

Changes in v3:
- Drop iommu-addresses from reserved memory (Rob)
- Defined a new property iommu-ranges (Krzysztof, Dmitry)
- Moved the vpu specific context bank handling to common(Dmitry)
- Dropped fixes tag.
- Link to v2: https://lore.kernel.org/r/20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com

Changes in v2:
- Fixed sashiko issues.
- Moved subnodes into common schema (Dmitry)
- Kept the firmware name as the one defained earlier (Dmitry)
- Added dma-ranges to specify parent-child address translation
- Moved context bank hooks to VPU ops (Dmitry)
- Updated commit description.
- Link to v1: https://lore.kernel.org/r/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com

---
Vikash Garodia (12):
      dt-bindings: media: qcom,venus: Add context bank subnodes to common schema
      dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
      dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes
      media: iris: Add non-pixel and pixel context bank devices
      media: iris: Route buffers to the matching context bank device
      media: iris: Skip DMA mask setup when the core device has no IOMMU
      arm64: dts: qcom: hamoa: Add Iris context bank subnodes
      arm64: dts: qcom: sm8550: Add Iris context bank subnodes
      arm64: dts: qcom: lemans: Add Iris context bank subnodes
      arm64: dts: qcom: monaco: Add Iris context bank subnodes
      arm64: dts: qcom: sm8650: Add Iris context bank subnodes
      arm64: dts: qcom: sm8750: Add Iris context bank subnodes

 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,sm8550-iris.yaml           | 17 +++-
 .../bindings/media/qcom,sm8750-iris.yaml           | 16 +++-
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 15 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 16 +++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 15 +++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 16 ++--
 drivers/media/platform/qcom/iris/iris_probe.c      | 80 +++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.c  | 41 +++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  4 +-
 17 files changed, 340 insertions(+), 50 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c
prerequisite-message-id: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
prerequisite-patch-id: 5ca05ad34889c804b7ef5cab228c1b4706346d17
prerequisite-patch-id: 726db1aaa947b63f64dcf61151e34b912b7b827c
prerequisite-message-id: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
prerequisite-patch-id: ea985fc3b351931adea7940855e5219be3a2bed0
prerequisite-patch-id: 5b6c27159dcaa5c06b59ed92ad39824e002a9f93
prerequisite-patch-id: 470410ce6b6816931ec3c7751079504781859ab5

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

