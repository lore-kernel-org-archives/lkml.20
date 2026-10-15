Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA251AECB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058141; cv=none; b=t/gWFdSDpWAhH/cKzD9OLLvo6FGj03+nl7lIWI6zUZB+rdmawK/68gem2DyyNXcNA113XwuZYibn/3+vJjvrNuZj6nwj5HWF9CsQLJxR0xwr1GmcVhZdZC55MTZYyC3qMnvC7teDDLTSLXNSwSINHC7Jnd2zA699cPbfZLu07qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058141; c=relaxed/simple;
	bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LxO2lzVS+h0vTbwEqoAiKBXSuXx/H16T63pzlqAPwdLiQiMoUO/MMkGVXDPMoOBh4NNBaRe8fYREYMSPVEHG7Uy2FWciUNN4pyN2xosFBMvZAUO3eePoWHaVAMFReXbo4+0xDezmhTtUJO++/zjamdvumqXoqd0ID0YFWaHXanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjuldHek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dth/qEBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjuldHek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dth/qEBF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOru2114144
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WyvZ8qBRw7K7we48lMPQ8H
	aYJ/8IJebU4K4q+EbfVCs=; b=CjuldHekRcv4/AMdaWpM6X8dp+Ef3pepSuvN6/
	piLKWiI1puXpU0TwZ7XLU7BSnVe8q2BwAHGiPWzhccsxHxVqR2HLXaUKhWSMMAri
	E3vt/zpLAKru1qTx4E2RYx+LgMb0SpxOPwMuqK8K6uEt7T2ZWyDDETNbmLsp6MUq
	dkVNsH3ImuRT/H/jBdij1ajJHjZ0IhCDgLUPGDawxFkBsWWuP/PgZFbrPeFzWLg9
	v+CjU5qp+vsp4L9siWAhMuByH1NCRs7/0aY2sAaFeLhRnnWB6VLkBpJq+N1K/HJR
	0qoY31BG33rRYg15D+eQuevIqUqFqoxdpMxeArRhVWJ4U7TQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyads5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so6516019c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058129; x=1792662929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=dth/qEBFwA5Xs/YYztHMQqzkx46y0EZWKGxFjXw3M+2fN0z2G6hTWe74sPLIj5of+H
         b1UqFUdy407hRcmPZn02V1rev4yk/SwF3OF1mD2tuhifkLGpj9QTzaJQEtJShS+O/ADf
         9bqwAflUOvFrNGi94iNHGYCaj7HvBApJ46l3glP1QZBFsZX9fHW0UCp/XE2wvk0Kk11v
         X3BegfVH9EKY0yN0wWtNeD2/+OquU9PdXoMqMSs1QsLAvzTqOxITnhtYnEX6LdzsPgEE
         JK5eT8PpJIKrXt11IQ4nuIN6t4nrhWP+1FMxLo+foRfbAdBBlZqTueYZUopiw4K1g7GX
         z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058129; x=1792662929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=tc2wOwE8k7594DxTeS1AW51/TjYLVvwjMiijT7gm6Culh+Htouq/QwAZDnqcRclLzr
         Puip5La6mZOESipSrtsFDGgiqGd5iCRKJzlDHJtMP4UZuTSQHl71X8GzCNDXrYV7Zzly
         mnu19Vy0lDZ675TMozJ896P+JfUHRanVSNBFpuzbNYmAzrXTQaudRImGlDSgUVCWD/la
         oEjIc4d4rH76YMth31/BdELXiBy9Iv1OZwiNn+9srmCCdMPwS7pxc7a4dsOOi8fKJL3T
         wGNrav5S8zUtNowIqUrqh5mXFPnBZwy+bCk9o6BUfJ03380Y69fEKYyVkfQPZ6J4UFp9
         8NJw==
X-Forwarded-Encrypted: i=1; AKwUvBz/wchmDtQvLE9yts5lpbZfuRw5QLQc/qwzYvVpKDsWyv/9P7JkZWRHxzBG70kG/dWgS2u/NOK3170IbX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjxwpT08TUmRw8B6ZxnPxWUAUIdiVulMsfhft6MvyL9wMygSvP
	7w8H4ryFc69Sv5c0Ctralvm2qnY84luu4gO0ZBxj5SXkQQqsNq/vUiZUxf9ZiVCLZoysCHJ3zzF
	v5VuSIkO+xhuQRIFbNN0x2ON2oCIgkT2auPIM0ejXjp/YiB5mBCCGeN7Gcto0VbyEAcw=
X-Gm-Gg: AYBFou2Qa6garnwM+eDWM7t51UKF8uBQwp7jB8Q8IClQ8YXpb1akGH1ElrfTbCen6Vx
	G1N0wackDhIQaw9FbCCVxFxv7mQmHb++jqdYC0wKcFayU1CA2mQlzOIaVm2yj0Ilx+tQSSp6eYp
	5G8zF0Y4nr37GeMzSf24bHZiJN0CL8bzc+pYCTDkY0516TIysJ0+ZXAM7FajcNWJDeocmE8i/eM
	bLVdZcCk+Syy6sdi2Wq3z6K7cPXKITT4V1hMf+s7MUpBq36BD0hmhnnrqoevsVYyYd4Kg9Ib885
	xePpgDJk2sYT84SfoRmJVmJI3LMe6H2pkeuL9icVYvJbALcMWiYNpOM9NxGUleEVCSVj4qhO5gn
	h60oVFblqhGYmQIK25d1bCQ5DFDrn
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478714c88.24.1792058128749;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478673c88.24.1792058128170;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Add fallback method to handle RPM notification in
 MPM driver
Date: Thu, 15 Oct 2026 15:25:16 +0530
Message-Id: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASj0GoC/3WNyw6CMBREf4V0bQktCOjK/zCE9HErNwLFXiQaw
 r9bce1mkjPJnFkZQUAgdk5WFmBBQj9GkIeEmU6NN+BoIzOZyTIrRcV1wanDe1BtPw2tshbnOOG
 FOmlTS60cAIvjKYDD1y6+NpE7pNmH9/6ziG/7U1Yi/6dcBM94butjbZ00WruLJ0ofT9UbPwxpD
 NZs2/YBUE4ZIMMAAAA=
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3659;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
 b=WTrWPEBOlhihxP5STVHc3U/9SmT+/GsHtaqtSGhtK5ss4NjY4PwYW3OHGhtEapOyWneHym7vl
 VgOrUS5UeqmA5+3bw5BKAmxpZ/fDLIZXaGuUKDGttS66p9mNmd7mwxa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: A1_8HwLTL4p2abs3PvD3ekExnKv4hJkk
X-Proofpoint-ORIG-GUID: A1_8HwLTL4p2abs3PvD3ekExnKv4hJkk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXw8gFhWT0tL7/
 G33A17g/NiE9RZOILic6dFJTXF1evq0bGfGSaDghY4JfOr3rlfH792Hh74tlUMzR+d+/YQcVcl4
 5XH0TuixBfuYb9fyqOPXboaGVnbS61U=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0a312 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4PENRZUv3RJH
 d/JGyEJj/Vix9ReWCtcqEN6f3ZkqOHg+J+nI3tKRoIX0F/2oaIh29PaRVkXldukt4WOi/n5U4ts
 MSOCF7JobXkC88xio0k0hdV+aTBT+5IL9uRWvZrfqRspNmLnrG/Q3OI92wEoMBPDH/YWV1JPib7
 0i1zVisQAf1uiCfA4hY6PQ/TazJfhyW0diHj+tO9wusdahDKd0zHKZbiEiMFDdmi2Tfg1Me0rT9
 ziXgFR1TrRqv8KSu97kGnpYmmwP2kqDQwF9+uK0wcRDuJHHdq87fTyTF+vj6pVBW16DTaccqNPa
 5C4ugMmgVb9VYOXg0iVdFaQ87cjNmehDgzzOCRuc7c8wS19SktWYs/TkU8Zw8/0QJ5z0cz6yyxS
 u6T5pSgkU68PUkKeosbvIv6TG15zDKGvjAVfiYL3x9siOKnANk0lxWhZXEFuRZeJkmTFUFsNfMN
 qlPQnTSf1UbOpmgHNIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add support to program MPM wakeup timer when CPU cluster goes to power
collapse.

Enable CPU and CPU cluster LPMs for Shikra, and CPU cluster LPMs for
qrb2210-rb1 board.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (9):
      arm64: dts: qcom: shikra: Add CPU idle states
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: delay: Move USECS_TO_CYCLES() to generic header
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Do not mark MPM as a power domain provider
      arm64: dts: qcom: agatti: Do not mark MPM as power domain provider
      arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster low power mode
      arm64: dts: qcom: shikra: Do not mark MPM as power domain provider

 arch/arm64/boot/dts/qcom/agatti.dtsi     |   2 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi     |  93 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi     |   2 -
 arch/arm64/lib/delay.c                   |   8 --
 drivers/irqchip/irq-qcom-mpm.c           | 166 +++++++++++++++++++++++++------
 drivers/soc/qcom/rpmh-rsc.c              |   8 --
 include/linux/delay.h                    |   8 ++
 8 files changed, 236 insertions(+), 53 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

