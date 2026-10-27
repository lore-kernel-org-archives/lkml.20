Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106758;
	b=1QJGuNkRHgkO0HMXULdVilduMBTpuu5fkvFfqUSM19PnPivKuR+hYRIh7o5PuHEqsW/k
	 5a9o8w+uAPfPfNNcKOQlgKFy0rbjM3G0LyX5hOg67u4mapPWj2AZDpHoy2r7p/GjDTGco
	 sTDHvo0WesinfDVrt+zo8h0ZJw0vaD0YybzYYwSTMpx1eX7WCVOoB6iCKHpco3NDUhfgz
	 O82H5K6vUUgwrZov8iYvSl2lQeSTM+0mcGZf3fbL36ntxcFd9/dRytgs5QS/gbYs93kR4
	 Xi7fqTpfw1tWg0BunmrqO6V6WQXewhjYFe1RNE1Bd86+yEFLqiC/TLVxVYT3aAsvxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
	b=i/StkIAhXgnKxVnSI9REloyybnv69+w/4VZDgsV6sTg3/j4aKzWCEWXVcnfQi95Tgruu
	 IbxxMq6Gk36kWi/vfHnGgyi2STACzs8iNCd5ZdoXoI02NCVeY/64zCZL35W97/zKs6d+a
	 rbM1a5dKMvqawc4NTmP0HA9mJB2bTv6XM7BpHkmbN+WaAFCKU+3OXfaWWctQaNuT8b3nC
	 krviXknymyodwm3FJ3dliKvm6ALRpGg29bUXSqXJSNuXkC9k1B4vtatG62MGrAxxqu6nq
	 FoPCBD5zmELGjXINVfmcKFUqlqEKsXN7STpNmZrvrc+80uN/b5DejNhQypMMJwTuxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqtSX67V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgbPH6U9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F140606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F140606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqtSX67V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgbPH6U9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBPr3011975
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7CPyHB0PycX09hhRl0EtJf
	UyTlgtNRaedU8gXCm4IuE=; b=dqtSX67VOxPgfEiyDDPG3frfOnqYKsK6jplLSX
	urY3NnlFg4fAH3nQiEe/QGFAHqteb9SezZIF2c5caoM62aRaA4yVxL9YJtPM7B95
	r57tc+PkwubQWlsXyx56ZtUFkUddUi+PPryQXJm5nktHzh9ZXPm5x0X+YcfaIOPe
	Vtu1EfLL0lotWw/mnGsr3mcg+VFJccykpJj5f7cJ/7ShE8BPO0XrgRPSH9iec4tM
	o2X2ZMcgcbfjEuf6P7BLcRvtt07GomwPgnrH+SRRFC6HvNjcaLwFKfFOTDEhYsZS
	BDFoF897ELwV8YhHHVcBUiyKVq8XZO3exVfR5T2EGBYHtkOA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db5xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ace1d95f5eso69296767b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106756; x=1793711556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=NgbPH6U9vTnKAJgr21XPe95ujVHVFvmNFrjFPydvJ9tWqYebG999VYTUI7jLFkSdIf
         I8mDMLu5oCivPxxwzBFk6aCZ0TMHNHiifpWUK1Z+BnrJ6pfUuvp6HQmwiOZY/1oCUMjt
         LRt60Wi6UZuCJ+BR6IyQw3FrAcF/OYQzjrDz7GCtnJMXEvexq4GAr1ty/VyQnDqKpHdX
         Hy+PXF3C0sVH3CQ8VRpqtiFxkpzve9bj6gleQRqIJ0UQMq2plSDlovxVT5V/otyhDl5X
         /U5epFXfpZEiU+wfxY2B1foK8x5UQgDKgylcK0nYFaLNn7X/RTt452vzOqqohrrAx40S
         u0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106756; x=1793711556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=NutOWRiaBtWvYEuts0pimp7UTfsj4ofnKmX2eY7J8/pvUn6A3BStd04ia48tLQXcV0
         8TQFSJoYDtKiVdMWBGRYS0unBZTo61o37OFXvBtEGhImApwp81i1W7SAbuuFQXKeSljI
         hgYht8EP2/17Qt0WqNUXGr58To7zMOXfRp7R8UrUHkVHwLQISkMUOtWM8QKqeGRLan/t
         iZOONl49s2MCjG/RlmqMLVHLnuUniPIWpBblADh7UlvbA5AwQ7M2SV1VjKSxgTcFx1RL
         aDKBnGe35oqTE9wNkhxQRLdaKYg23IUqslYmYhzawVl/gJB/sIP73tnOxbCuosF+0yRV
         LcRw==
X-Forwarded-Encrypted: i=1; AKwUvBzoykpGCtPG/c+i+fj6LwAus10HV0IaepdU8RRjhq36F76sCqfcBmh2x1mrK9ufM5xCvy9HIZoih9MgZEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWd0/z9MCwaMTVPfPT8MhEJqA6VeQEzdbM48yVsw5G89rKakf/
	rUMtSHVmI665bUVBdnInFx4wykfLAlUfnQlfw8cbpPgrPT4kTkO1bDKU/SbfU8eJaBInYa09cyv
	u4yepZxLUbKxszc57XHPQK8lqXuCu9861iq7Ze0ghfi9jwnwWUTQBwrJUdiDaW02RVuA=
X-Gm-Gg: AYBFou1Hx4rw5q2q3MnzAIoqaGhEg699mFMwpbi+QgiNiBtSQdHepyg3nE9sJDNKapW
	u4dZBZkAM9IUBWNgLJRCZeIRhzcA6lqt2Q6UHfQhpOdPOPdqZfs+7A33d5iWsfPTzC/Lihpsymr
	MTZeTLtgs0VaD3qEZ1Ucru1dC2iKjtdrcswN+cJLcZK172b3/u3gxC80ERt7Mfy28oD6KJM5ZLZ
	wdiLS9KBV3IgsynpGHMRfc31Tnk7kSk1BY7ehEj5px4AkhFz9EIclgKAByYEHc7dsgTJdT2qvZe
	auW2amGo1uBR56/ZzDLgeT/Uo88B5/USgalMn73IQWkA7D2Kad59L83BasCA79KkbSPGihlceZq
	PZpigXMhqt1J6NDge3yVENu8+JceJ
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998357b3.48.1793106756007;
        Tue, 27 Oct 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998167b3.48.1793106755356;
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Tue, 27 Oct 2026 18:41:08 +0530
Message-Id: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOyi4GoC/3XNyQ6CMBQF0F8hXVvSgaG68j+MIR2lESi22GgI/
 27BxJVsXnJvcs+bQdDe6gBO2Qy8jjZYN6RADxmQLR9uGlqVMiCIVKjCNRQFDK29e950Y99wpey
 UJrDgRyEZEdxoDdJ49NrY1wZfrim3NkzOv7c/Ea/tl6wx3SMjhghSxUqmDJFCmLMLIX88eSdd3
 +fpgFWO5KdhhMtdjSSNy9pgjlRZUfZHW5blA6AQbLQRAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=3131;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=dVjgtspMHCfwvvtmrSjG/EOepUcFqgdmazLjIBANgoA=;
 b=y94OO4abN6gpgnWCw4Zq9jfs820vIQuUECd0oY9D+Gp69WkEXrz7LytSRldQWzTV5qgWqKa5C
 qgX8fz/A8XXBiEEj8jWhhy0Zi+JFaFhTIwRCYV/w1u2iyNc36fuuOhA
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX35DBieiiLaS2
 VRDq1u54YTjgSZ/9mfkG+xMuQ2sEuP4vZqywqvc7rWZ0HaniYwRMThYReV/DpWAuqOz4GwoXrNL
 l5KbgxBfEAPQh6+MIE60jRPqrQNQ7vA=
X-Proofpoint-GUID: zignO-yJ0v5JkaD8i7SU4aWUMefCyJut
X-Proofpoint-ORIG-GUID: zignO-yJ0v5JkaD8i7SU4aWUMefCyJut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXziuzEghXIyx+
 MJt73h+kgws9kwzhhoExoV6/VHGDQ3WtXv2wpbHSLGIqGSrkEXhf/8pQRSHQIOfYMRyEcj+puzZ
 4eRt0WtUs2ekBeXxBO1IvWOSjOVqkjfRQBSpB0/pmNAWQE6XhD/JhtAOsX6JjODsFwk48vgbvsX
 dxczUw+EXEdLMUk9ZTBc946+S846b76aRLDbzF7ykeEQopZ9bPY79pJql4X1W83gSL3gVPiGd9T
 uCnAx2vo8lm1Hgmd1EMMQiMhDFGZ2YtS6NCGddGenHLw5JtmXr9/QS7ITlKd7PW6pN97/WWC9Se
 AM8mtmlFGvY5D8gJGVm6ddFXz50p6RqwBPIMU4bthN6hu7qiBfZngSkeZZmISkQFeg0s5+PxTUP
 KNGNcS2fR5Yifmpg1oOleC43Lfv8UYuPkOHF4YFuR9rGOzDyAmepcMBT1NCPJUFlbIihmW760aR
 1t5F3Z+wbbtwg/Jchxw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0a345 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052

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

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 ++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 104 ++++++++++++++++++++++++++---------
 2 files changed, 170 insertions(+), 27 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

