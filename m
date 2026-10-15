Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B3045040A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090594; cv=none; b=icRcDzY5H13auIsKBJWN48IYkeZm8WgDWJvfNbe2I08XdFPrG9R5wwCSH2+hcdmH/EBE3mrSi91mlDkmdmUSSNE+eArIgxSC4kWrGGXAx1tWCscFeProJCh30ol+sWdUd74OwxyZotQKac5OHEZiMNfcx50/gtn6jqA5oAcVkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090594; c=relaxed/simple;
	bh=WfTIScce4+xOI3ZOn4jbGBOjmSx07uEqCRWoRnAARnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L2v/M41nJp8rae9MKtQuMaLSJaj/kg8MRyK1tyqhEDflwb6T6NdiDGGOri9aN1NoUJI7nisyUmWYkG7OMp8fyHSthRCcxwlSCB+bpxCzaWdOPgLyYeZKr9pEdrC/Iy4hZA+gvnPcMbEJit5L7z2snHjIPITqn53HpPUxlfUSGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyYwR5kB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyYwR5kB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a17baef589so22315015e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090589; x=1792695389; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=hyYwR5kB+Pph+oFCrPXfSDzxwVTdyKdVqXoqwO7C+hXKAm1uEZ/k8DZQYTGqCC1y6T
         KVR7Pe21zAL3q3rAtBc+ky1EgvuayuvWfcIgl0sEhkk5B7d6caGxezFXGSkYPwWvoShT
         zajggHd8VHhx3YA1OMDtJNSFjI76hcqvF3aLu7VRru25vq833t8d+C+GApC665ovGsSl
         ZUjS6SmK+I0CMDsAt0dsAq1tiWAIG8lmXvVNjPAc1xx/wfT2/J/93IfPcW5wo5sZMNFk
         SK95Au1bdxFQ2G/BHZIvbefRqx77D3VH2trnmtYg0U4EYvWOFFG2QG3QxKlLU3Lhyxta
         svuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090589; x=1792695389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=2NlHSx55OiW42zgWqEbfbBPotyqvzVhv7TA+dPisNTOGRC3SUD39eTHb+WDNb9dqRe
         PmkjEhEjhtniXpk0yz9d6O5EU6/BNik9hBUBSkVUbeJPsBLkiaYxjRI4d6mz874QAfqo
         3Jp+H1JpO5egi56m+rxFePwnW1JRWYpF/5iyiLfs8ZuYdEQOlKBNSEC07Bds4x86j4yQ
         mNabTEeaEwZ+wJvVJVF5OLb5e3Bpq3URlXTuJY4RK2uLs3c8v79teBt10P/dqTXv/L3M
         qiYzV53SJP3HSAH+423ySj9vUXYlaI8buR02Yr/qckzkil2n7kbDs8lbsQuprR6ZpFxX
         atDg==
X-Forwarded-Encrypted: i=1; AKwUvBx3LVu3UVPfb66/ccyuvn10v6UuSGuWXSSMkowwcNSQhirl4ztirLN+uoLJR9bpQ+9MriZ2F2QbgyXb09Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVm19cDPPp2ISzQaL1ZnipK7LyPcA0BrxCC6vMbU4gDn+LCnce
	I56alQ/R8iJ3TtgAPAPrytQ7cG4xPEijokBVkrkSzZ/agYhzjefkEVF/
X-Gm-Gg: AYBFou1dj+eb+BRJZTGwp00SUkahx1+61PEyojVYySVns/z7W/AnRCLFWH/XwEVx2Fe
	MkQ650+4VoYTPGeTqmUm/QoE9viyazLSfVimTYwTlehEPhUbVZOKm6KW7S40froSGxooNO5K028
	voPbiATkYproqQm6zuDP5mirs0ZsVgDrUF6wFntieBSFTT1jvT3s9UHv+lZ9H2yis34wiAXR9/t
	QmaZzrKyMwAx/qd6mQ5KKI6/J/gjwMnqoBr2NLA0+sW3IhMh8CtZDNMzCpqUlc28dLtlffYJg75
	XO+T4aqNJtfK535SBfKL0PK/6ygUFh2r6AWJbQG1LvDsRTYNJ4o+d1eBe+xR/wdNjVUFNjhlQ3L
	NyjJVoU06IloboR+n3X2kIFhq0bdTeYskI0y+WseI8iIJgeTrWTh0OpbeLA+V7r6i6slPNOOlZ5
	LKr13P3EzPT0yzeXbwLFdY1kJtXmUMDNJULU73qsnY5qtrueDopFIcu5QvKRwH+vUbpYf7h5EbU
	2MhNeIvYZ22LkDcmApZ6wotp0NWeRHckdQT4jmKMQ==
X-Received: by 2002:a05:600c:3144:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a18e48d362mr400641705e9.15.1792090589045;
        Thu, 15 Oct 2026 11:56:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
Date: Thu, 15 Oct 2026 20:56:04 +0200
Message-Id: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3fwikGhBpm56QamugVGKhbFlipmpgVmaElBLQVFqWmYF2LhopSA
 3Z6XY2loAe3MpI2MAAAA=
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Enable the Imagination PowerVR Rogue GPU (BXE-2-32) on the SpacemiT K1
SoC for the OrangePi RV2 board.

This series depends on:
- Yixun Lan's power domain series [1], which provides the genpd-based
  GPU power domain driver required for proper power sequencing.
- Baihui Liang's dt-bindings patch [2], which adds the spacemit,k1-gpu
  compatible string to the img,powervr-rogue binding.

The GPU firmware is not yet available upstream. A copy can be found
at [3].

With this series applied on top of [1] and [2], the full GPU bring-up
path works end-to-end on hardware:
- Power domain: GPU power island on/off via APMU
- Clock: GPU clock enabled/gated through CCU
- Reset: GPU reset line deasserted
- Firmware: PowerVR RISC-V firmware loads and signals ready
- DMA: dma-ranges correctly maps CPU-to-GPU physical addresses
- DRM: kernel exposes /dev/dri/card0 and /dev/dri/renderD128
- IRQ: GPU interrupt registered, firmware watchdog running

Userspace rendering requires Mesa's PowerVR Vulkan driver
(imagination-experimental).

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (2):
      riscv: dts: spacemit: k1: add PowerVR GPU device node
      riscv: dts: spacemit: k1-orangepi-rv2: enable GPU

 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 7e986b457d43edf8dd3eb3f6c34e55e92cd545f3
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

