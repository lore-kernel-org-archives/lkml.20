Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD304F4746
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416164; cv=none; b=B3UegtdTKVivZ7UYLn2jsfdeVuBERxXTnaWh5RKO7omGlkawFVt1B4jlkXSB+DivD7KuqMKeXKD0B/YbKWG7qES1HtWyQhks1x4sTtNNGRUDjlhw5bKzEe6yyxfkpa+S2vcTaSqAKDQUFSl2D80hDpyyBwvz89f/kTNXfC/inDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416164; c=relaxed/simple;
	bh=gEiszJiirzAt9qeKtDLc/VTN4jjj1ECNWRKraM+op/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYcGi8nl4PSt/meE8gkev4bbzmhF9mFEH/9K4cDW95C7/ziNQ2e7YVFMz1QJxGYNsLyPBkyTjSG/z6rr29ZCLSF4W4qvJEKLr5ZrB2zj0G5wl/61SWer1FdKXjJPZDk/XNrnkzKlreDn7PCXopzyahhuXNXa2cF3wcW5qksWC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X80xj8Fp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZvi9YA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X80xj8Fp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZvi9YA1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtnQ2752271
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5x
	IhvRRlhM=; b=X80xj8FpnJWFucRBJ/6hZQS/FT7Y0PkiV8cbqIVcJUu4ZhSWI1k
	S02S8T3p1YvZQ6uTf6EdkHzwF77f3sGUKgtl5LPcC8DPQb2LPsHy1x3O7eJkMt1O
	93Gw8SKDg08dzXbcBvtB2x3rsBo0Lc3W1vwmbUyykONFf/VOFpxfAwmhpDaUzELk
	MFGbmO7VQK26JTlM3i1u7RJumrwgTsHeAMgJEZHS7/thMb4jkvuxJN6PYqaDBjyg
	9f9wdbZJJFXXevU6FDxWB0At51UCveKgrqE7xeDFb3AunzZH/LPMOxfLl+sG2juJ
	M+lwB5rhABLMkywN+6EgZRDZlzEsZV11NJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48h855-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so453258585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416161; x=1793020961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5xIhvRRlhM=;
        b=CZvi9YA1+Vr/LHTJ8GYUa852+5APqDZD25+ZIb+ncsjs1PIy3xuEOWT92DeNoyDfO8
         6WjmAQ5k8qjI1cZ8rQAbMjPqsJvB7/b7QRe8wm1j0Ud/c7kMYAw44+q7I1QZ1byxTANd
         etyDzOqgyTSmDfzeebhagK1asTlHbpkOxZG3sK4lvcYFmmmtc/pVYVrtyWOohBsb6KEC
         l47dPJ30jKpApJUqXjMXLwtob776S5Kv3dhF+t6fr3PaJ/314Lt+kUCj6WW8VjsyIRjZ
         VA8aCW8cTaP7vh8o9xmWojTkse5h97aM+PrKRPQq7A8kb6+6PHTQe4OGtM6Ugbl7brQO
         ej5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416161; x=1793020961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5xIhvRRlhM=;
        b=l4gkgJf9ayrCPFV6802jCVbru8Ivfzp/n4jfM2P2mKkALXnh6fWgzym9I9mdd/Cx56
         zNyRPJMS1xx7acCkeyia8zumlxDcCqT/giCo10dZrkiQyttnERn7I+/S8JsB3THJ5US7
         a24M+ApINRgeDh8sCypP3JuDhHsV/JS4AHY9ZFQ/p1tk12RQChWHRaDSGd7F80+7SUu7
         cE5Yu5lXYs2mi4RxkNpY5R1GLmwG9FPMLTWDA/UepLng8V99dqFumTxhbvsr53U9yKjA
         ZyTlIS4NWP25x07JVpii+zBLxkUwZX9V4IckHi7gVVm5Vb3M1LFhCtgXL5RQUqJWPvFg
         cVyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXhZTNSvmLTCJwRY/2Lubw//UcxxJEG1tCIQX4ZSi0duEAqLTw+SydjOZ+CcNUAvlrvZ2JzRTPPx53s5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1c2QXz8TGVEHA7KSQpR+WGGe6yEypXCZZjSBE7ZtEPUaqRwS7
	wYuQdM+S58RmBmF83Yu4j6UX3O9fmgW3gcUDlURfGHj65ieUqzeKSKVqhCNSbheczK30xrxtsoI
	K7cDmCgOmnp1OWEh/IsSpBcYAgHSkXiYd5rYuF9zPXupv6reu5IKZA0ndSjzzdl09gRs9BsLBH8
	c=
X-Gm-Gg: AYBFou3DgYsmSB7oV4rAxNg5Tr73Lv4dW1jloXUbpFWrSitH6jxP/Dzky0MmyRXeAC6
	JKmQ/wy2bwfL73kDZhGuMBE0x47qA04h9imS54Rg0eR/oBztELYcxjZm+Vcl88gXjWGONKIqwit
	T8HUkrsSyRdhc9yjVzFJPHkqAfTCoWoGlNwYnY+n8qN694NWqyOsewaNaszLtq4HoazTnrR8EHW
	q5C2zUqg5OD9ogzIQUtmNMie3b5VVUBhYLer4xB8g+jYcCNdd7+RBtuoRo+0NyjlU7Ux17FEr1M
	M1w0mY3TLv0lsttsFpcWN1+cgz4NnWJr8SiVAAj7ftPw/+zxXkfuMFmBvFhNbk0K4tTbfdBLYH+
	Otw2BENT3UdvzP+5ScAcbgtgBoh1bVuJS99s1LFlLn3qO7os6hspRCtAymg==
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1103391085a.72.1792416161057;
        Mon, 19 Oct 2026 06:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1103385785a.72.1792416160450;
        Mon, 19 Oct 2026 06:22:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4806sm365767366b.44.2026.10.19.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:39 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci/pm_qos updates for v7.4
Date: Mon, 19 Oct 2026 15:22:37 +0200
Message-ID: <20261019132237.29631-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfXyWzZHFQzdgFE
 Chn/DWZez6F9olq33sICkuflETJ9tbkyV1TGIHHnxBA1qOeQKpEwO9CxDZONe3GvpOaGCWkeBPN
 wtWgqpkY4zE9GlNMLbRyFcKVDwvNWdUSFLn6YX5tG6tBL7t5+F4MTiQWgto0K5BEZ6MMsoOyI+C
 LMSL6U+qVm1Yrx2FPB1tqKYac8wBSkW7ZhDIEi87g8ath04Mx64D4Um6cfEl72qb6SRwWsxCujG
 hOQMCpJyXmAT96b9kqMubO4NdfDKE8JGgACSzN1sz4JRd9bAUWPajRmTHTyhZ2dw3YM0ynznNzV
 m7mDM/Tp80W41dfyOzdhkn9z9yq+WIyvsWEiMs8GwwA0efRRB3I13HC+8ZdZfgS0+EwrccuiJy9
 MVdSt1iw+3LzexxhPrg/EXIU1B96KfWleugbTt+St1TIZTZ02hlDUzBWuUzt8/obbv/5KT52kmr
 VpnNCvmtli14j2aHYpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX3Bz92Tjn9TmM
 DLshPwibMTINiDDCp0r+vy6oBW21ETWxlLlKIKUXbzbTYJq9k2wMl1WBx4BctQiS3lPpMJ+bkFZ
 90R90hOdgBwvWSlhvVHQgmFW5KtRe9Q=
X-Proofpoint-ORIG-GUID: DaEFz2rU5QWWCLn5zzA84I4WGjzknkM0
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad619a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=rMlJiCOZsNZ2U4sv3q8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DaEFz2rU5QWWCLn5zzA84I4WGjzknkM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190053

Hi Linus,

Here's the pull-request with pmdomain and cpuidle-psci updates for v7.4.
Note that, this time there are a couple updates for pm qos included as well.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 4c66c423593e26273ea0d644906ed007630c6f6d:

  pmdomain: rockchip: don't ignore clock lookup errors on attach (2026-09-28 15:36:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.4

for you to fetch changes up to 6d318db9ffcb611f9b3b6b3201c963690541a943:

  pmdomain: Merge branch dt into next (2026-10-09 16:31:42 +0200)

----------------------------------------------------------------
pmdomain core:
 - Add a genpd config to support unknown initial status
 - Add support system wide resume latency constraints
 - Enable a non-CPU device in a CPU PM domain to do power on
 - Fall back to use device node name for domain idle states

pmdomain providers:
 - cpuidle-psci: Initialize the PM domains in powered off state for OSI
 - cpuidle-psci: Move initialization a bit earlier in the boot sequence
 - qcom: Add NMXC power domain for Nord
 - qcom: Add support for SM7250, Kuno and MSM8952 power domains
 - renesas: Add support for r8a774a3 SYSC power domains
 - renesas: Fix lockdep false positive for r8a78000
 - riscv: Add RPMI device power service
 - st: Add the actual power domains on U8500
 - st: Convert Ux500 PM domains to schema

pm qos:
 - Add a flag for system wide latency constraints
 - Add lockless read for flags

----------------------------------------------------------------
Anurag Pateriya (2):
      dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
      pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord

Ayman Chaudhry (4):
      pmdomain: renesas: rcar-sysc: Update description of chan_offs, chan_bit, isr_bit
      dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header paths
      dt-bindings: power: Add r8a774a3 SYSC power domain definitions
      pmdomain: renesas: rcar-sys: Add r8a774a3 support

Geert Uytterhoeven (2):
      pmdomain: renesas: rcar: Make area arrays const
      pmdomain: renesas: r8a78000: Fix lockdep false positive

Hardeep Sharma (2):
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno

Hemanth Selam (1):
      pmdomain: fix typo "releated" in comment

Joshua Yeong (3):
      dt-bindings: power: Add RPMI device power service
      pmdomain: riscv: Add RPMI device power service
      MAINTAINERS: Add RISC-V RPMI device power driver

Kevin Hilman (TI) (4):
      PM / QoS: add flag to indicate latency applies system-wide
      PM / QoS: add lockless read for flags
      pmdomain: core: add genpd_for_each_child() helper
      pmdomain: core: add support system-wide resume latency constraints

Linus Walleij (3):
      dt-bindings: power: Convert Ux500 PM domains to schema
      dt-bindings: arm: ux500: Drop NR_DOMAINS
      dt-bindings: arm: Add the actual power domains on U8500

Maulik Shah (1):
      pmdomain: core: Fall back to node name for idle states

Muzaffer Kadir (1):
      dt-bindings: power: rpmpd: Add MSM8952 power domains

Pengpeng Hou (1):
      pmdomain: imx: Propagate SCU provider registration failures

Sergey Shtylyov (1):
      pmdomain: rockchip: Fix domain check in rockchip_pm_add_one_domain()

Shawn Lin (1):
      pmdomain: rockchip: drop duplicated errno from supply failure message

Sreeshankar K (2):
      dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
      pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250

Ulf Hansson (12):
      pmdomain: Merge branch dt into next
      pmdomain: core: Rename genpd_status_on()
      pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
      pmdomain: core: Add a genpd config to support unknown initial status
      cpuidle: psci: Initialize the PM domains in powered off state for OSI
      cpuidle: psci: Move initialization a bit earlier in the boot sequence
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next

bui duc phuc (3):
      pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
      pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
      pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()

 .../devicetree/bindings/arm/ux500/power_domain.txt |  35 --
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   7 +-
 .../bindings/power/riscv,rpmi-device-power.yaml    |  65 +++
 .../power/riscv,rpmi-mpxy-device-power.yaml        |  65 +++
 .../power/stericsson,ux500-pm-domains.yaml         |  41 ++
 MAINTAINERS                                        |   9 +
 drivers/cpuidle/cpuidle-psci-domain.c              |   7 +-
 drivers/cpuidle/cpuidle-psci.c                     |   2 +-
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/core.c                            | 163 ++++++-
 drivers/pmdomain/core.h                            |  18 +
 drivers/pmdomain/governor.c                        |  45 ++
 drivers/pmdomain/imx/gpcv2.c                       |  16 +-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |  15 +-
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |   3 +-
 drivers/pmdomain/imx/scu-pd.c                      |  10 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  41 ++
 drivers/pmdomain/renesas/Kconfig                   |   4 +
 drivers/pmdomain/renesas/Makefile                  |   1 +
 drivers/pmdomain/renesas/r8a774a3-sysc.c           |  45 ++
 drivers/pmdomain/renesas/r8a7795-sysc.c            |   2 +-
 drivers/pmdomain/renesas/r8a779a0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779f0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779g0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779h0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a78000-mdlc.c           |   6 +-
 drivers/pmdomain/renesas/rcar-sysc.c               |   3 +
 drivers/pmdomain/renesas/rcar-sysc.h               |  13 +-
 drivers/pmdomain/riscv/Kconfig                     |  15 +
 drivers/pmdomain/riscv/Makefile                    |   3 +
 drivers/pmdomain/riscv/riscv-rpmi-device-power.c   | 485 +++++++++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c             |   4 +-
 drivers/pmdomain/st/ste-ux500-pm-domain.c          |   2 +
 include/dt-bindings/arm/ux500_pm_domains.h         |  17 +-
 include/dt-bindings/power/qcom,rpmhpd.h            |   1 +
 include/dt-bindings/power/renesas,r8a774a3-sysc.h  |  30 ++
 include/linux/mailbox/riscv-rpmi-message.h         |  11 +
 include/linux/pm_domain.h                          |   9 +
 include/linux/pm_qos.h                             |   9 +
 kernel/power/qos.c                                 |   4 +-
 42 files changed, 1113 insertions(+), 106 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/ux500/power_domain.txt
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
 create mode 100644 drivers/pmdomain/core.h
 create mode 100644 drivers/pmdomain/renesas/r8a774a3-sysc.c
 create mode 100644 drivers/pmdomain/riscv/Kconfig
 create mode 100644 drivers/pmdomain/riscv/Makefile
 create mode 100644 drivers/pmdomain/riscv/riscv-rpmi-device-power.c
 create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h
