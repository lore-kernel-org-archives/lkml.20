Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875360;
	b=kcZdbvhMc9PHxvO0MjpG7OpBB92V/sKANTdOjMTE0eNBB/YxLS9AUreseuAVRkRiPG6j
	 VUysaZiaKIkcsl7rthR9nL7HTwSH7qg8hOs5KtTpUMkEE56Y0nBvrTtdxVmGgrGQM5ppc
	 OWC/7bobK67O559UMmbOItm8b7cadWaJ0k4/aKeo2QUpu8V8UuL3T/TkT3+c51UfUM6RX
	 UxLcSCs3GEVE7ZtHJkxKJ4eVDMCQK6fKAHNrDFT87C6fJyJCzjTHqDBkBeuX19yB0Ow3/
	 TVAz9tWuGh0Eucj9eOm8kFs0dYJGIz/o2zt+ilLGLonynRxzoEsB74HawxMPMYwAXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RtvncIFsq/HT0jaZfObAVDtccQW79JWO7vjbeDJaK5M=;
	b=cwjZKo6Bcs65SUUNgSghEJFiwKD7rrq10AI+Hu84FXl89/WQtg/pIS6fEaMVGewQ11jG
	 t6GtA+wnpjJ4br0IjMV9asRg3pnnndgx3Q2lwb2Z6iOxVPB+P0v9gERR6a1MByLXfijt3
	 Xk6FvbNJNQsX/c6as/MbgmLIjGN0glct4hZyNgLxeF828NOX0t24ev+RU7W3loSthEYFS
	 oD+qP31VwsdOzLj90JWqREIS+5H9R/IaNwzhxSFo6fKTcqoN5Sz/WDnJw9rAld0p2enDC
	 ELa72h2ud/YzuGz/YOZMsTuyTfC48QRbXaqx4vlRsJjWWP05wkf7/8pQilU0fwgD+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Je1UjuMl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V40Tt5tv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7340606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7340606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Je1UjuMl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V40Tt5tv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tSfF433397
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RtvncIFsq/HT0jaZfObAVD
	tccQW79JWO7vjbeDJaK5M=; b=Je1UjuMlRBKGyx2x8gp+g/xnUmUvggC1eqxsXj
	YqsCwUTQLhc3B2JodHxmBjM+UT27+/yQUM0riCdKXlPJRB+sZZ2nFl6kj9jvN0Q6
	bnl+vKBETcbEnZDWawDEE90cjot0VJREJeIFtM2eND5OCk7mTOfcTuXMNHuMKNxQ
	YxhCdkr9uQF1qzoHlEiRFyGx1ScE3CRttCIdD2hDIucTfHiUJKPY1gVFa1Zws8IU
	LEvKIzHtZJxdc10JYl3hKYYopFzxo1Iu7cREqStiRcD/1XTUzJyEjBmlXitf6CbL
	AV76rl8oUUmkjMdmy5eJROjc9hhDdHtuUN8N9j3ZFrwrnqqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd91ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:42:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so2382580a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875358; x=1794480158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RtvncIFsq/HT0jaZfObAVDtccQW79JWO7vjbeDJaK5M=;
        b=V40Tt5tvY1jhk5Py/5925FkI4SIjdtfRE34kCYeAqClsQFfxwvQttTbxkIlwXbprmL
         zJv5cqRrfmszQFmZqZcXwkFMMBPvAccLtjPOcDVhvAFpNZ5RZ5ecMduFK26hYsxYfli3
         2eFwA5jtV8NndygcOWeTNzqgXcweJJCbfB76YHsKCcxOWg9h/TNdUQgLpHdUXZPtaRG+
         0DTm4kzsDLlG1LFbvr3NwAdqQ72BietX+P9mr9U92H8IIJr0gpESij2F9WKwgFcmf+tR
         aezyZENRNW02O/LJiX9vXZH4qtgoJotim9NUNT+RQ2CDV9KBAkJfpz0XqWERPXk9B2vi
         AACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875358; x=1794480158;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RtvncIFsq/HT0jaZfObAVDtccQW79JWO7vjbeDJaK5M=;
        b=iaEmzguTz/opmsgJzPlU2OyFXsxWSilMGrcWcDTdSKSTW72ij8YnCud8rGYkxdwcNn
         kWAvNkNg8BB4P5Kz7Q3CVWAhx/tIPwcV+hkd/4QN4xnLWa5a3r/uc7nqaloneIvbu6Kn
         qUASvNnHN5gcYKDuE6ItHtmHfgMFGr2Y7LcUiCyupPUfJRogAWmsgeLVRZUrkceWVGbm
         M1N3EVzb1XekSRcp19WMFJ4u73hXow0Jogcr8mx3mwtcOzpkhvnBX0IRGlLVQaqI8oJ8
         WtzfxQVtCsPRwHICAlzf5mQYY4xB8l8Zbithi0z2m6thd38+CA2hbsE40y9szqGA/jBi
         fROg==
X-Forwarded-Encrypted: i=1; AKwUvByXaAk5t/V8Dh/z/b80/kvwHwmYyxL4ihklIf1cFHnyv8Ek+NwL5YlmDhmjUwX4ES1vuB19y2hLLvptTMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yMqV6rT0y0yKbBMcX2JpHH/gIdislgLHZa8JJ0qiz8aOhpTqy
	gbPoU5712KgJgbgKiye8i4BNCrFp8ZE5ccRRpGm3QcaB7lCr/x3xh5pQETbnvMU/oyJl+ctWEn1
	+oaE72kOkb+iICiH/emDWKH1Age/oH0yCSJJrvBigZye4MqskW1W7C/AzwyUcGxv690M=
X-Gm-Gg: AYBFou2R5ZPz0iuON/W9TfxRU93ZK5NTxKrJMhvGas3QGpv7auNcRKqfB+RUnA/LfYA
	L7cBFiY1oFqZBDe0jMo0Op8XoVQ5e4Cvn0GRc5LNaIwMyq23H7je7QJlChIBfwUlqnFgT563PuP
	BG0I1LCiVxXqYhf8DFAHzp0LXGYCIxtBJ6FUF6QTzKyRfXNbO7DuLi2m9cNWRRY2Z/CjauFsaD8
	KOjvMmQyWEH2GdSaxjBF1rtmQzwL5lQoP24/pjaGFyManJkvvFz4dWfuEMsx/AY0wvGnII4HRn3
	ohy13qtgbzQmhC8UnSBx5v6kcWqDIoLOYxgSrWxGj+eG40JiZN5+Kq69M0uDxunpXCLnalvc9mh
	/Bhf7a5D7QvhwhoicMvJPdkvLBXf/HTaFBALxg8Kfa2BAoVKHwSq8xTrzUE9qZfyOv1z2oZ3/SV
	WyRc4NBPGqDQ==
X-Received: by 2002:a17:90b:51c7:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3ae89819925mr16870819a91.42.1793875357644;
        Thu, 05 Nov 2026 02:42:37 -0800 (PST)
X-Received: by 2002:a17:90b:51c7:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3ae89819925mr16870801a91.42.1793875357220;
        Thu, 05 Nov 2026 02:42:37 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm3266934a91.5.2026.11.05.02.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:42:36 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v5 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Thu, 05 Nov 2026 16:12:27 +0530
Message-Id: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJNd7GoC/4XPwW7DIAwG4FepOM8VhjSEnfYe0w4UzIo0kjWkK
 FOVd5+Xw3oZ2sWS5Z/P5i4KzYmKeD7cxUw1lTSN3JyeDsJf3PhOkAL3QknVS4MdXP2U4ewyhHx
 boeYUgNYFglWDDWeN0qPgx58zxbTu8KsYaYGRU+KNJ5dUlmn+2jdW3Of/4RVBgo7KBme8d6Z/m
 Uo5Xm/ug/P5yGWXq3poVsmmplijePJOoRm0GRqa/tVQKmxqmjVPIWDsB+RkQ+seGkrd1Lqfn/Z
 Wes/3yRj+0LZt+wYJcOuctwEAAA==
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
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793875351; l=3475;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=rZHB61+U1enCoVgD3Wfz8apEgkCU8t6fCPzBoMzY3sc=;
 b=/kNEKecvuQY9s7+H78k/PUYmxSYX4p6AyTQx8mGfbCT51OgDpuaeJBGNgyrexX6Q2+BB8mn7P
 vkrB22Ib9ReBXlf9z+NSRm0dQo9vrMZwPA6UYQIE5m4ZBRpJ9/iIymG
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec5d9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u9u05p8RAF7SMS7wY-sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UyQL80D209Oap5_0KblwHAalflrTCHw_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfXwiizkcF3ib8C
 mftlUBYr4gsRC0grdYw8jDqMAorlLVtf9gQLhYMX9vBH6E0QzJn8tPuKNAwY9c1EaugXR3IalQ7
 /wnM5HsvlDYimdd+wzzatqj2KIqC/Uo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX8Y2xEOqFhATD
 3KS8PrdyGX2B3oMZj9axU/DN7rWwEElK+3R+ipmfdfpzWYqx9gYon55EPLUZrcmvlJvoTXwJ7Jd
 kCTmhTsOvm7Pc1IkEIXlp5galEip1AsZ8WRe1hDiClHOdReF25hJBG2cPLSkzWOpOF8NSXfecwd
 gkwP/AdMrr+yTFRzE8/Zp4IXv7FUVKH+tndKDchDBIkffKXtZBNkCPaHCVjr5YYR7/UBuHtUpnZ
 uMSJlaSzedjDFXCBruhRvPYq4jBTJ6WrJrki1lgesbkC+8fQbPjYK7aygX4W9U8Ix9QR2W70ce/
 uHjvGeTlV+3pWt0mqS2ywrY1nqAezTThAHSlLUDnOJpW02V1q0D5FYvh3CQmhjsAufhyVjdbsO9
 nfJGR9zUx6uyY4/fw+Q7W96XoVUh5Mjxl+XTKIIdmd142zzFDwOQhBuz9lOZPcQSGDqOVP3cCkB
 DAwgdeve9hYnxNfAepg==
X-Proofpoint-ORIG-GUID: UyQL80D209Oap5_0KblwHAalflrTCHw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050042

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
Changes in v5:
- Drop the redundant restricted-dma-pool compatible check, since
  is_swiotlb_for_alloc() already covers it (Loic)
- Link to v4: https://lore.kernel.org/r/20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com

Changes in v4:
- Decide the pool reclaim on the remote power vote after disabling the
  PC IRQ (Sashiko)
- Link to v3: https://lore.kernel.org/r/20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com

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
 drivers/net/wwan/qcom_bam_dmux.c                   | 108 ++++++++++++++++++++-
 3 files changed, 142 insertions(+), 3 deletions(-)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

