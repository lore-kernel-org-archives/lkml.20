Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564802;
	b=hGecouim7T0Lhg1gduYZLjwJDdOnOCUuhN4ok0QV/Y+DDES7vZTaNioEmTU5DpdSaSdX
	 EvmhKplOXwMtL+bLkU/+itGP0nl4YkkYI7P12wdWXJjDCSgd3J6WC3SoXn/GIK/ZLi4PF
	 V47yBv2olmkZBMn1imEIqs173pH7gy+iQhNda0k3oDCI4kokkQJG6T9+da4o1S1h35h3m
	 RlDuIQJREcM2KleXJ/BI1QqNaVW34U08dx5gTgD5OPQlYM0MC0rERHroggNMyzDv+nzgE
	 4AE5JtF+HWWI5AyLIFHIjDVzzmIumQxtoVwakShDXNT5iqSU+2Ks9+/iEXG+ZEOIoQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
	b=JWgykRKPYvKi2LuBpKpgIe8N//i2xv/mM6g4UdvnovNeOAGrj5eGmmH/dOSE1Dyl6VLu
	 RoODuXT1+c7sAcE9Ta6SzuiutpGihjwfxWNMrW3xi/aSLxzvqgbbfl5FYLO68DqTaSQa+
	 OKqFYgLAlCbePnd6s5CdHeCLIOAZwVyomHnm6jA5ceLoFNZ9FnyPwkPLdpj8jdt+aa7vw
	 wIM/dD6r3fRa6HOd1CvZwFHApqPO4J1jDa1Ww9dc3DeY8I5eGY0Nle9nzWc7UsubJEC5F
	 VXSf4h2XZCOyX5bi1PwLOe0PddTE4yAX3HV/f1FYw+Fv6sbHhfVsI95wmq2O1QZW4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IWNUfv/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E92606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWNUfv/s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLNr2848592
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Go5/h6FVonbcrlXkL4gMku
	Nu7d2LqHDLKl45lEDPQ6U=; b=IWNUfv/s7L0Xbv8mDtAt7iV0x60ZltrkcK0mRw
	ykwrWpYMfshPknfyU/05WonEVlWILfhh3m4sVpkM0DqPXGwCS4LVQzQV+a74yOjg
	K6uNtn38nVpu2be43MnhL3fTzmq2khnYHPelByNe9XSk//8B24UZ/YAPQyqs0F7S
	HvN/FvkozdilSF6Q3/ATqp8pHvAb+ALfZb+A5HlfmJGkYHXjyof1H88VmDVmX6I6
	BJYxW0c9mv84h1tQ0WzioTP04g0e0zT8GNAcpmwNO3yy59/Ai3bko9DHQ/Ge4EYI
	eLJYbABbI6flJ3m+7BS0YkS2etZWQQQQplnq/g4wlQg+9t4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9a5er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso492528a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564798; x=1793169598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=FlDdU22WMSHx/t0NRsDkdDxsD/BAEpR7XcYRL1QEY+AJ88x2vV/9a9+7lSupyIXdzP
         jgMfwktu2P91t4xNhCqLlywA5bWhaEnWDENBmJDIR/PtgxwumFAOv+1OF/oI8OhRvLXg
         bSlXMOaTWAdZq7PA9utcXO//pg4E/xXwxSQwQzYfFxPM9ymvKjlVhPWmB9AvEuuemGW1
         pLXyafBLi5XV5yqkridZrV22X4fFVelG3D/HguRCcPHZQLqJFNFXTo4Okha/NWDYnuC/
         ftRfdrZD3HL7EXCpntO2mc9FmBTiM7H0jvX/IqqrZJKr1Keo1GN/P/udYehIBdOoRgkI
         ba2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564798; x=1793169598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=KlSQUdNotwko57BFMePqMW30iVUljX3GQWcpiF6goQBMdLBmeucXcv5i38JGJubBkW
         YedNK9V802GAKNpFsu1iZL895gy+JoqHBJA7iQvKSu7P/g+x8mEk5Sbn27AMu6U1jRlE
         mRwVyU43cEFM15BWXyvnccFegHnoQ94/w2vmm6vekCekC25rn3ux6vWWetziqtPv4jT+
         wJbtV0LcN5nIINg3vhvdj4xSF3uetSXfWJkc8diH7fuvBKcNpyQaTZnfKO7/XhDVwQbf
         xMrRE+V9BrnwnDrrQOsXtzvyu5LfJygt9NrA/ZU63WwktLtF19o/zRqvUAMGmHvhe0ng
         /bNw==
X-Forwarded-Encrypted: i=1; AKwUvBwjeSrV4iP41JgJqJGBFFFM49DSbS8JBFF8I3I5v84//FYNBovrDzT5urj6SFjT7X2vIieGfdsRyA5JLKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VNcnijPnLN5KzodmX2FvqBA1jFBtgQPX24SUhos/FbXBCVB7
	8BLoK/MGKR/Egfvrixvk67YcRhCjw1qxlQbvDiznEBuvVqTYVCe2Buz0xwHZ9dNSrdPZ9pfxKR4
	qlxxyQ1pOx0bMzoPaQvaLLMXyq6mu35kZeFzPcrgkGXECCnugeHTdU1gSPEeaz4dNHR4=
X-Gm-Gg: AYBFou27qTWutFNz2/D4HUfqYTcRyIAsPvUyJdpXhmY4OVSq1yJhQ/YXh0f90X8wUkX
	9ahll8iKuUtQ6WydMxs1EEogKzAq1W+BC+kYUeWCXdFXFqNiJh7HgyTbBmIRjVoBvJ7BsxshVAw
	YPkEyJdBr5BWTkOZjPR8/pWaXQq6/2vneZg0FvQhv7+wDirCPYFsckh4Cq0ynoP3IoQHjUL9XP9
	hZbO4JioWIH/KjoQ1E8M2XGU826fxHI+bKQV4lRaQDGx5rzqk7nwBZ9/bvqngTaI98cCn/EW+BN
	JgcqV38LdGBje8ATBo6f1WkUgKl1BrFA6+HJUIAPKHOfKIfpLegrflJOeV3Ho2bgrPuHB/YMkNr
	7Go0ca0t9dayJhey2YCg5IGaQo3kA4H+gTtA=
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005119a91.28.1792564798352;
        Tue, 20 Oct 2026 23:39:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005109a91.28.1792564797759;
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Wed, 21 Oct 2026 12:09:42 +0530
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC5e2GoC/4XNTQ7CIBAF4Ks0rJ2GHy2tK+9hXFCglkTAQktqm
 t5dwsaNxs0kL/Pmmw1FHYyO6FxtKOhkovEuB3aokByFu2swKmdEMW0wJ0eYpLfQCwvKLiskaxT
 odQbV0bZTPSNYEpSPn0EPZi3wFTk9g8stdMub0cTZh1f5mEjZ/8MTAQxsoJ0SXErBm4uPsZ4W8
 ch9W+dR5EQ/WkfxT41mTQ8nKSjhLePtF23f9zdNitNZGwEAAA==
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=3014;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=Wm437G/2TEyo8uw1Mal26euONCvxGzUjWUp+GjfVFiM=;
 b=M/CCaVJWr7jkoQByJ6f99qQqnw+PM+8ClscrF859MYpuCSFQk4sJdg8/ie3XKEiXGCeODGB/T
 AV44PtlB15lBJ6cIWOyHCONbd9BSecCHJuQeWKMkIxZTAWBhXey2229
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXwUXLw6IhZDJu
 N+u7djlgoNWRYqcc+9gbUGl3EHZskT3igMAg1IRjfRraxvgJOMMwWyPz4a4vP4IWukvnTZ20suX
 B9te5n8WFqt4qnD3d3swWHk/ht1MwSM=
X-Proofpoint-GUID: _LLOxoTOgINHJFPWjJXWv2UVTNdtHp2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXyU9VzN1wqrOu
 a+gTSQL9G5JnLKbvZOL3oo1ijtwh7mWJ16R8eq2PNtdWBiKL8RQMGotwVQ73UCZNme05jYA9R/3
 jrfKyGF3ZzJ9jMTdD1Wm+LhDaK9DOUHm/C17H5uKKLyJmZS4ZP3hVffhnnKuhWdj1YtZjJuQMy4
 sJJ5UhaUUpVgP3w0X2TlQw/4cvt2cv3jaHP4HKXOU+ymru871nfdlMrKhzHOg5SPxa9tv47o0ZO
 tftp18fJ4KbWnj1m/KXZAsHPA6wH8rbiHONZvR6E8w0r62NcV6FloNLsGR8jKWt/mqec5JDc00t
 dxlhAp/UPBZqB80Km5XlYIIB9p8L7vR3RtfkxvJk0F/Ngv7MnKUadJF53I8TKBftKpYJBLoPQGd
 vw9mzjXPiNDQid+zqWOTL4wpr8ZnKriEUlir5JaXQqPcVvkc1VvYutNNObBPBl+wJC/umEB9aVn
 0DA0R5T75MOdulGz9CQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad85e3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWlRu96VJg_J4rp9qAYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _LLOxoTOgINHJFPWjJXWv2UVTNdtHp2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

Add memory-region and qcom,vmid properties to the BAM-DMUX binding, and
a qcom,shikra-bam-dmux compatible that requires them. When qcom,vmid is
present, the driver SCM-assigns the entire restricted DMA pool to the
local and remote execution environments before requesting the DMA
channels.

The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
controller references the same pool, its descriptor FIFOs are covered by
the assignment as well.

A related binding change allows the BAM DMA controller to use the same
restricted pool for descriptor FIFO allocations:

https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/
("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v3:
- dt-bindings: Add qcom,shikra-bam-dmux, with qcom,bam-dmux as fallback,
  and require memory-region and qcom,vmid for it (Krzysztof)
- dt-bindings: Drop minItems from qcom,vmid (Krzysztof)
- dt-bindings: Drop the example changes (Krzysztof)
- dt-bindings: Drop the statement about the local VMID from the
  qcom,vmid description (Sashiko)
- Reuse remove() on late probe failure, since the PC IRQ may already
  have powered up the RX path (Sashiko)
- Skip the pool reclaim when the remote did not acknowledge the
  power-down (Sashiko)
- Fail probe if the restricted pool is not attached to the device
  (Sashiko)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com

Changes in v2:
- Replace the Shikra-specific compatible and coherent RX allocation with
  memory-region and qcom,vmid properties.
- Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
- SCM-assign the complete pool before requesting the DMA channels.
- Validate the remote VMID and restricted DMA pool configuration.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com

---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
      net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |  36 ++++++-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 119 ++++++++++++++++++++-
 3 files changed, 152 insertions(+), 4 deletions(-)
---
base-commit: 78974bac98eb0581f85aab56ccc0377cdcedb964
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

