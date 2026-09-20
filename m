Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B93B38A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873380; cv=none; b=MEBFhFZ/MeA44g/b21EhQRBU1gZsokaFc2SKT8zp5NVAvOcolZCK7CwuI6msSz5vWP477xuRnkMfD6l6Xe0UwkUlydAm6ElxXxY0zWy082D8DNiA2YJg1xIlV8jq2tetc8jtOf+8Wu5IPAqX9u+o9U/wYjs6/zvDQb0lRoQFa7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873380; c=relaxed/simple;
	bh=hz9Ctc2ahIdeJe+JCeEwApQ5wfB2ODpknCf4i7+x4A8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qwdSRGWUxCYdMF9mX07LTQ8fGjwGxjbRsVoXNy1mIZh/BgnX3GoaiGdoOyfx74nDppcikLN9Uhen2U43eQtooc7yvl7tD7ng9MlTk2PX4pn0wE8q25c5IjkxuI+fRUimA1vJxCs6FsBLHt/lnAZ4fIJgFpmMPhHoUeYgBwyH3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqsUxiCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lw+K6FHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqsUxiCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lw+K6FHs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mbk71213904
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EERGLL66mFtZUXuUVelbsL
	e0GnEECNulfppZ7VW17Qw=; b=ZqsUxiCpNjBaHoVQiNnkfshFBoY085a0gdPA+I
	HUeA5c5MMDBw5C8cGEiHi1HBV+BvdnGvj40MFLWGFT7XCjzDm6BDHYYwFsU22+EV
	ecUkMeuFIeeCODk3ip0vyvCt5iAJYF4KozEZrubIM5hr7YjKZe4SoUFRwYjMoyjH
	eeS6ytv1wrYCfoyNEKzB1wETVOeyh+1l7GOAuDV6PYpByT1gvtUujWoIsAR4EcIT
	bNoGxeXb8SD7lE978+pj2frHSal5g6v71lzMvVJSCezs0I4hyRNHww9lmdXp5P3c
	cr6p6Ke+YXwrcMonLt14NyTPW0BtkxZshHNu2zWh46dQswIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm3241n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:02:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so2516511a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789873377; x=1790478177; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EERGLL66mFtZUXuUVelbsLe0GnEECNulfppZ7VW17Qw=;
        b=Lw+K6FHs62l539Mnu7DN7YTOXkqMaT2GSTv5RIOArtDVbyieFhGoW/BMfWlD4BWw5Y
         u8X0CTPR4jetoUDXbf4y+WGxFDQ04DfDc8f8G9rtYEtiFvl95k2Yd7d8g2QRNEQBgiOh
         u38RaXSRNvXTNNPAvYbfwPSxg1byf+AmBw7X6/dE8LqKrDZuHTqSd91GsLWRJfod7wrM
         GaAHy8TkgcgK2Bl2E6Bq2AaorVXkvtzxmzHpVMbWqRDYsWtUfTSNkK6njhTM/Zsen1T5
         zF7SIvhfaNQYhLKv+FK+mLGt2tMXiEuGloWNWugU42nwYYQcX2h2j++CBeXWzwjr+63E
         rovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789873377; x=1790478177;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EERGLL66mFtZUXuUVelbsLe0GnEECNulfppZ7VW17Qw=;
        b=d1GZ+0AXFX3eXMo+lfCxKaXAzGr/DmTbX6krLUAmAeMt6vAYhTK7SIfZoCglpdV2aU
         26pE0OVpqQvjyFnTwGZIasV+9/NdsAjWqTzhPPD8B839dcFeiBoVbBQqLN0XZ1grAnHH
         txZpzb6rtqPZh/Vb12k263bgT8NQwbQt289iL/dmUDZazVXG7mxklqTihptxvp/uAYtY
         7O0jGwF0MnDR4TK7JCLO5Sg9jSYMqXnCW6zE8Fue5w3QLG8plJI4gGS4NRe+oFQA9Msa
         paOB9pZ2XdAhfIcTBvo+G0E1aKRn1viCtuRZmROH4CsZAD+ifi9GQburdW555/nQ/3wR
         kTug==
X-Forwarded-Encrypted: i=1; AKwUvBwVyFY3X3pzdTfeqCv1ql+OF7MdwIVWBpNdL0zYDWgd6pPbN6ONmos+L+SlyaTn2lVUPYAyBD8GrrmJq2c=@vger.kernel.org
X-Gm-Message-State: AFuF++ntXROrUPS1cSFXKg+kmw/C55VF3LTIY8KaauBEtH3792fNyrGg
	wNbUXuwZr6IDbzPHJpYEviFSS0chrTFOij4REv34zeoT/C93bRWdG6/1sn4fxGAu5az0Pk14lnZ
	9+5qzH4jiazDVyN8n3sEEfGsbTTwQMWhWtqhLhfjtoZJ/534xf4/XckjmJCg51AvJ0NY=
X-Gm-Gg: AYBFou2EKenOmIslwuC1K3I8lQfg0wa0+U1h3Vx/ArZ1wrqmI0XOYNY8IKiU49To+Nj
	D/9QFb2jmYQ8R1jf28zukMnXOLvZmKsgBq3xRwaSCu/A3yeVktSaVcB64DeQ+MiuTptcrTEZjI6
	/oUc9K0Pt9U+3y2/WNLda5krvJsQHaehC0yUD40CTpaAihDcckZI1rLEzJX+X2DSH9PKXJF3W+e
	zX6kKP5zaJxIHjTIPl4ksNjO4BtJvZbGg2O32XdwQFNykwf81tljzWSG2QWZuapnhLNqYX+gjjF
	RgHY1HaoovWqULtrfqaFWm8Jzz+qjvZiQnSAqB/l51ZtCOKvkOu+l9KIk+ZUhN1OZ9J2IvbTb0X
	RRKycm5/XVSop58kArbbvCvDhx245mMcnGSsS
X-Received: by 2002:a17:90b:1d05:b0:39e:6c68:1557 with SMTP id 98e67ed59e1d1-39e6c6832ffmr6405098a91.31.1789873377472;
        Sat, 19 Sep 2026 20:02:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1d05:b0:39e:6c68:1557 with SMTP id 98e67ed59e1d1-39e6c6832ffmr6405073a91.31.1789873377007;
        Sat, 19 Sep 2026 20:02:57 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm90012c88.7.2026.09.19.20.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:02:56 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Sun, 20 Sep 2026 08:32:28 +0530
Message-Id: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMRMr2oC/4WNQQ6DIBREr2L+ut8ANlq76j0aFwhYf1KgAhIb4
 91LvEA3k0zmzcwO0QQyEe7VDsFkiuRdMeJSgZqlexkkXTwIJlrW8SsuylscpUVt1w2zJY1mS6h
 7cev12HCmOJTyJ5iJtnP4Cc4kdIWCoSQzxeTD93zM/Mz/jWeODJtJ9Fp2SsmuffgY62WV78Lbu
 ggMx3H8AJf1fkzNAAAA
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789873371; l=2187;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=hz9Ctc2ahIdeJe+JCeEwApQ5wfB2ODpknCf4i7+x4A8=;
 b=lnHu6nDyjA/pzi6f3ac+zcjOoFWMc54ihFhK5vH5Mb4xxgpNw6C8Gb38DJUi1Br1kCZuXJyOW
 oBsJYMv3RRBAyzw7CXwVBM6NnhDv7epjhVEXoRGKkZpq3q2alAwRIq5
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: jIEzWSLC3k39jTxieA4Kc3HU0GhossQf
X-Proofpoint-GUID: jIEzWSLC3k39jTxieA4Kc3HU0GhossQf
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf4ce2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWlRu96VJg_J4rp9qAYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfX4hTPdx4YJA06
 09eCeP6WPMd9UaURtnpVKm2hRcESPuNmDKvu9tAplEbjzhYNckTlfz+ARGBmoZQrB/sE/3Z/9Sv
 Dd0PF2B2iANgoTp+teL2OXCKZEZcVTwszafzIYvifNXEc5i4M2Z5bZ+77efP4BzjO19//84S14d
 ceA3LYGE68jjFNlRSNaKTpbQDUiA4gHiR7DrhPgh/F4FM4qthqRfLNEddIj19De3MKn1r62sZYA
 ovfB5rLZtAgddCe+wqyzz//i53WByToDtMyFBIFFax8BQ1V+BsSoqXaSTMgM21crfxlfArRMqHB
 vbH4MXAvFeD5EFs25sZ2eL+TFcOwNn+PkqYz735mT2Ipav3WQsKzMmYQVlzcKC9DRhvYPOWUBbx
 aLgyunOXHmqzEkVpKU5tiAfvn7Yfee6Vu7+h6L8ihMOumtPNNATMOkl9ekWv3e9gN0jyz2l0+Vr
 o3vbzXjzOKwVlWw0N/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfX1ennp4aHTDOa
 K2xG195bGiVi7wvLoTMuoNnxZOKDj0vyGTdNDQ4oSs/pKDpILhC1TLVgsrHml1AZfYzlIaaPrLR
 RDc6ulZlZWcZUTJzGAfUm2fwQtUVo/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200039

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

Add memory-region and qcom,vmid properties to the BAM-DMUX binding.
When qcom,vmid is present, the driver SCM-assigns the entire restricted
DMA pool to the local and remote execution environments before requesting
the DMA channels.

The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
controller references the same pool, its descriptor FIFOs are covered by
the assignment as well.

A related binding change allows the BAM DMA controller to use the same
restricted pool for descriptor FIFO allocations:

https://lore.kernel.org/all/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com/
("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
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

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 +++++++++
 drivers/net/wwan/Kconfig                           |  1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 95 ++++++++++++++++++++++
 3 files changed, 134 insertions(+)
---
base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

