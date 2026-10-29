Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268410;
	b=JQFM+AVOgCQZ4YXgBl8GjS7wAvD6xsJ/zuTJ+/s/aWnI64nEechyaj+5lz5W+13I7F8m
	 mZvifcDvYK6V6MoTUGQIaGuTo88fl93aiSKFuctBgthlj3mqtu2xm5dlSVjVkRdxvm5C5
	 wYBLHlYaAJYpclrEVo2BJb54wk920AhrD9jbWsBOfJc0LbKHA3B/aKUxuKPNY3uftIEUP
	 DxcUm2zmZcLQ+hyK5qbSZ6Hvn+2d7ouxKe09YICD9kpA0VEbjO3mlCNauIrhRHHrdNj+8
	 Ny7T1g4e8d+V0ZJzweDPyjcX0PMS0+XPxjd+CGfncBZxJQlNMNnXw0xhH19dGJA8/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=;
	b=gEsA3WFxl989uZ6SdbGBpT8z9SiwIMXUoBdtL+hgl1nXlzuVNARjAOC2/7k8cDxdYHNi
	 nyVFlnMjtsV4lVABH9jqiVGUU+wSgWeqERy4L2KrY+GRVNij7UV3wPN7iNuD9/Zf9vQE3
	 PDx1zP5zwaPWvCvC+tC9dHAv6Tday9AWECCuOMVjE3UGdxfBOiR5Dk69TTK2clUb2W9Za
	 UPjtgwXpxMu5Qc7REuHevA817Yb2Pg4EvqSFQ9kq0qZSSwPqkiU4v8GA2S4v1wdtnpMyJ
	 lTjdELg06/hVuGfH2FPHa/jjTwCmHXpPY5fhGrnIsde1im7gmLwdzSIWOb5toHMtTPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pszdm4fP;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333F5606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 333F5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pszdm4fP
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20edd106so1498795f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268408; x=1793873208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=;
        b=Pszdm4fPwGA6z3/h856xxp3nG0CoeMLpKCnNm93Kve5JOa0nPOeF74RJv2oYNtcNZR
         ozCESFFGve7AzGRPZXZEEQOxAwZBxiDlwTZCe/iFU9yMsVG5eQexLV+2KElgyEoheCZr
         y8BTz61Yv8RzXisIss7+bk/o3LkX7T5WlIIDxt9l86L0f+iz3YN0I+m7c94q6EaXd1+6
         k1aZlxk4jv0oW6dgJIvT+nljT4xqCnPWvPs+3DvuAQLKYJc3j7q2mtlVi4yYW0KtgSUs
         ysZMk5hbO2SlhHBgjNdGJ7j/5IciDZQthP6Dm/Lzt+L065agamsUS6wtRefn/NXfrQp1
         ECqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268408; x=1793873208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=;
        b=wC/O3WfhcpbQEaEJyYvUiyGHFcB6mbdh1NnLtFl2Ptcz04B5W180WLYHBFaZ6Bid34
         NjpOfY8RwbUuFv/oWu+frgSRog2AIgpTMZXBdOB9VVkdrqpqhIKJKfUlxgVwAJ7J9IEl
         cjWrVJrF98gPcskTVToP7gp2vSo0h/MpyNcoBkMvbuK82KFRZi349c2pJiUc4GNuZQNt
         bHk0X/gCjvAbANLiYb+5mtr8AH2L3q4h7qrKmwSQVoTd6GX42PONZrU6LVcY+4fpPQpC
         tYsnUhbiQUltVF28RoeNioxpcnYcmOKhrawyhOS+u8Vmg23zIlnKGj6ITgsZmDZHhJYS
         qkaA==
X-Forwarded-Encrypted: i=1; AKwUvBwfsv+v48+2bYT2fv6YfzqddX0OzdDTFV6R6YEuf7X6LgCO+IwBIQBypcWw4BSGSxmPbUnSXyGMaHM1zb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrdlpkfA6HHZZJLlhbZQtut8pmlO+3/7efQGBYLjNurTORPY0Z
	PEb0fvmEjUPR6GQbtb6t7spr62HsCkFgiczwD75qTVIY4Kf9uv8o5tau
X-Gm-Gg: AYBFou0+pH/3qd8uXaZr7XLEPVyExX6AGGvOubPyQ17I6kQ3bRbLfactTb6MhA4g/kh
	dpcZC6N9cBNzdbHDkkIfwrAQmi6S97VAkkK/fSVZETntwymJRRzqjiTm7yy5yqHKh6ZtXA/Tnj4
	Rw4jvJ897epeFN2WnBfFxn5cfEX/joMdl3vIMW9iSnoiMUlavpw+/big2LjWglBn802f0Cw8lI1
	+DP5pawdnCKRcY8Qhu+0sqCntmkl9+F6QjoKgg4NnVTCIAss4Ygb3AjkPK+4M0xu9WHtoz2/spT
	xzsY+uFrHLlgXF8YRawuXMYdY7jjjJyHeFFPgOeptS5vRz0LBAm5LUG4KcXyKqzgfikAUXVvrMT
	jpqNrvrkJ3pFMmb7L5/6XKBbUN1cyFGzpnlcrvmiVMXQ4EJ0ae3M/yZPOuRS2hrqjjKof4/le59
	Kh4O1OX3ERpJcqpUpRLjToRELJN14KGgnrihNUwoOz+3AYicroG8PJtnqWmF8QoQqczRACwabdi
	a68o9xT8dgwA+JHQ7maujymua9TeV10t0JCsWdv7H3w42Z5XedJbfWYvyBUVWYUVWSUsiOUqDEv
	MPc4DSflO7EG3hbaYLprF+OY0CMS9zfPMFYtWfB3F48fPMSa4YZ9+fYgF8bur3VLSvF8TxHQK12
	vwC6LLLhp
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr117257515e9.10.1793268407430;
        Thu, 29 Oct 2026 03:06:47 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:46 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Subject: [PATCH 0/4] Suspend-to-RAM fixes for RK3588 + SPI-connected RK806
 PMIC, enable PMIC sleep on RK3588 Tiger
Date: Thu, 29 Oct 2026 11:06:22 +0100
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
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
X-B4-Tracking: v=1; b=H4sIAKAa42oC/z2NQQrCMBREr1L+2oEk1lq8iriwyVj/JpZ8DULp3
 Q0KLt/MY2YVY1GanLpVCquaPnIDv+sk3q95JjQ1luDC4F0YkVjx1JkF9YgeSyH+3S+3ly3MCVM
 Pv58GRjemEA/SJpt90/f37nzZtg9J1T2zfgAAAA==
X-Change-ID: 20261028-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-13b6ec08d2c5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=4078;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=whpYEratljGVTl7QjkhsaCvIr2bv7FesbGf4wTNyJws=;
 b=Yjo1Vrkco613l9dyLnzMqeGxox5caUTel5ElHqC2L6eZEKaikGN7q43RGAGZwNloLUj1zWdDJ
 d8fDrN+nWEGBzxgvmtwK4wP6dL1VSzL/h4dTP33hHfLhLImeky8gg6B
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

This series, together with a few out-of-tree patches (see below), makes
suspend-to-RAM on RK3588-Tiger work, down to a power consumption of
about 0.4 W. Patches 1-3 apply to all boards with an RK806 PMIC
connected via SPI, which includes most RK3588 boards.

Patch 1 ("Input: rk805-pwrkey - enable the wakeup interrupt during system suspend")
arms the power key interrupt as a wakeup source, so that the
power key can wake up the system. This is done in the regular suspend
phase, because the SPI bus to the PMIC can no longer be used in the
noirq phase.

Patch 2 ("mfd: rk8xx-core: keep the PMIC interrupt disabled during system suspend")
keeps the PMIC interrupt disabled across system suspend, so that its
handler does not run before the bus to the PMIC has resumed.

Patch 3 ("mfd: rk8xx-spi: add system sleep PM ops")
hooks up the existing rk8xx suspend/resume callbacks for the SPI
variant, which so far lacked them.

Patch 4 ("arm64: dts: rockchip: put the PMIC into sleep mode in suspend on RK3588 Tiger")
configures the RK806 PWRCTRL1 pin on RK3588 Tiger for its sleep
function, so that the regulator suspend states take effect. This lowers
the module's power consumption in suspend-to-RAM from 1.09 W to 0.43 W.

The patches do not depend on each other and can be applied through
their respective trees.

Testing
-------

Tested on RK3588-Tiger on the Haikou baseboard, on top of the v7.4 merge
window (a8530b69fc4dd): 30 consecutive suspend-to-RAM cycles, each woken
up by the PMIC power key, all resumed without errors in the kernel log.
USB devices (a SuperSpeed hub with an Ethernet adapter, and its
High-Speed part) stayed connected across suspend.

Out-of-tree patches
-------------------

To test this series, out-of-tree patches were needed and used:

1) Upstream TF-A does not complete suspend-to-RAM on this board yet, so the
tests used Rockchip's BL31 (rkbin v1.47), configured through a small
out-of-tree driver. The plan is to get suspend working in TF-A instead.

2) The inno-usb2 PHY has to be resumed when its 480 MHz clock is enabled,
otherwise EHCI/OHCI resume hangs. This is addressed by Sebastian
Reichel's inno-usb2 series [1].

3) The GPU and NPU domain supplies were kept always-on. genpd powers
these domains on in the noirq resume phase, when their regulators (on
I2C/SPI) cannot be reached yet. I'm not sure what to do here, yet.

[1] https://lore.kernel.org/linux-phy/20261001-phy-rockchip-inno-usb2-clock-fix-v2-4-e01bf509359e@collabora.com/

Known issues
------------

PCIe devices do not survive resume; this depends on system PM
support in pcie-dw-rockchip [2].

[2] https://lore.kernel.org/r/20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com

Tool use
--------

These patches were developed with an LLM-based coding assistant (Claude
Code). It ran the suspend/resume tests on the hardware, analysed the
kernel logs to find the causes of the failures, and drafted the code
changes and commit messages. I reviewed all changes and tested them as
described above.

Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
Jakob Unterwurzacher (4):
      Input: rk805-pwrkey - enable the wakeup interrupt during system suspend
      mfd: rk8xx-core: keep the PMIC interrupt disabled during system suspend
      mfd: rk8xx-spi: add system sleep PM ops
      arm64: dts: rockchip: put the PMIC into sleep mode in suspend on RK3588 Tiger

 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi |  6 ++--
 drivers/input/misc/rk805-pwrkey.c              | 42 +++++++++++++++++++++++++-
 drivers/mfd/rk8xx-core.c                       | 19 +++++++++++-
 drivers/mfd/rk8xx-spi.c                        |  3 ++
 include/linux/mfd/rk808.h                      |  1 +
 5 files changed, 66 insertions(+), 5 deletions(-)
---
base-commit: 8f6620b65ae2458c36cbc9569a26fc2d777593a3
change-id: 20261028-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-13b6ec08d2c5

Best regards,
--  
Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

