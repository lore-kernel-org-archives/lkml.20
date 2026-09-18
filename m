Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A551991F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750367; cv=none; b=AP2L7t95BC4sxhXuki4KdjHEp1I1wJPVoTEKC8NA5QHJ2ZZ5vFmZaYr//NDLHOkUdNWkrIkIaSpb2m2BYZXa0VXk+iMTKaURs0L+4AxMKESFNGNsm6YRTgw1xdNNHVreIwacRTH2TcuAET3Ym/qd2oxi4dmebnHZ6+nf3f310UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750367; c=relaxed/simple;
	bh=im7bHLtGYT9Yz0ql8qKBFhgsMiDZmM4stEa2+3CQjmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inWJrYdsbkxptzlQoA389LvXyTjtkKVpH3RX1SHvC1LvYgIaX3pbiMJYtPJx38+APKc2EcQkQOgjKE+gfhrea5ePYkSQUybMFzBxxPjsQHsDdJAHxk2ZYngZMAeTDCP0UCS4yRZ/ixjTLGkjrcZV7BiMHHqVn8wUHl8O0pz1HRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=K3bTltgi; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="K3bTltgi"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeb0so80824785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750358; x=1790355158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=K3bTltgij+YGsuW8NBaMUplLapyFfvvlGqIe2hFCNzdFwnw0Dj2uMDuHJP5av5L7Mt
         GgSqVNn1H3J3eFwjnNjqAbjvKH7XlekR/s51bFgHeYzmsY/3grrdZrfRYtybBhZuwA2I
         lRf7zXLMIL5PbsN9OVcKeaGqHY6vGWf896uwEnPyYY2qdLZfdQkWzLHErbreweevaFQy
         r1Y4etaFcrp8p1f9Fpb6PBDN8WFc+LtMgBB/cXhdLC9gaRyf+T+49IziLnZVwGwJVJ3l
         PglLQjQy49HWbSBR8RvpQi6KiwnZFA3SCd6E1ds19hjz0FyLAPvQu6QTAv0eMC9uMrXV
         8Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750358; x=1790355158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=zwRbvHVaugggSsbJVC1hrdLaLGj0gY+Dh08hdhU8H625ZGuB+V2ONLwtlNFzGa3FBi
         Npv8OJHgqZHOt/vJDGH5YDVT/wW1GJ9rROECqVlpwTLq7zUVFbCk0T1gj0QjHzS8wmSO
         e1YOBhxFhp2vejOHd6KHYDAiu530qDyw1UzYEcHrzOwSI00jBH3H+R/eY0w5VKj+dIge
         aBizXTrdYSALmPHj48pe8aJv8j5jy3VTgDD+oYPTUXIWgCGFeO+aKxd95Mem/zxCEjTI
         g8fMmp3vXOSVh/MGm7CBwZocntw+Tf2IElbsFB3Yx180Zi2UffNCbdOnkxt/njB+WHs5
         mlgA==
X-Forwarded-Encrypted: i=1; AKwUvBwR4J9IuApTwFKVRgnrWPK84MHxr2FL4BZLuCWT0b4yAbok7ZbhJ7b+p9xHy31ze6X3DF5GhRfK4jI0Sig=@vger.kernel.org
X-Gm-Message-State: AFuF++kRZcq3XgTslTUeDzN4NTcTVdPSr5M9wwqyGmzgpldaTzItD0Rk
	RYLlD3yfQ0o+WYzw0tUAkOz1EdiwVZPI9XcMo4TCh96Eyg9OwIR6HKPQkLKnS2Qvqxk=
X-Gm-Gg: AYBFou1fOKahb4qXEDmWawUBmSr4I8XU4E7REAhxvaijiNs9IYaqM+6vmNLwvnpJehi
	q16sxRheQdlGtwGrCH9j4ATk9wCN2uRuu/Hi5b99xPqSrrdRshYl+ShKJqKFOmVQKPaNEfMTPsC
	itggetUwc5He4UHDFhWbOAsqanNuYTjan1LNTAA8Bxsg54bRhsz5KbKCe+NMto/BnpRbszlMgx/
	R5FXYraUxcqXgi6ahluE+Xmc2WwJHX1pTJwdSYdDeX9ZPMYoYHOeQfQnHSPqVN2U/BKgo4zi334
	WPCbyQ8wbz6499giBWxyy2YFYutuo5CfPjzpSAIDbN6v8Ds2CCi5Wj6UWZtAE/TRgjikBv9iEFe
	TetgEi/ZcpqVjQqTFUT2++7DXjHTEE3as0UsTU9eEYaQ+HSYlt6xKRrhyDi4g4YAlu0nGYC59Lv
	XDT+6ljSFkqsfetG4Lf6ktByuICbak93TWrq+nDk3+8YG/Owa9Ic3ynvqvPUe2Qyq8lBIjGx3pl
	Q0=
X-Received: by 2002:a05:620a:a0da:20b0:93b:e412:8cee with SMTP id af79cd13be357-93be412aa37mr210118885a.73.1789750357966;
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: introduce TC9564 clock and reset
Date: Fri, 18 Sep 2026 11:52:29 -0500
Message-ID: <20260918165234.687224-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock and reset controller present
within the TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both of these PCI functions provides access
to the registers that enable or disable a number of clock signals,
and assert or deassert a set of reset lines.

The TC9564 PCI functions provide PCI endpoint buses via devicetree.
This allows a PCI function to use devicetree to define subordinate
devices accessible using one or more of the function's BARs.  The
clock/reset driver binds with a device defined this way.  Only one
of the two PCI functions is permitted to define the clock/reset
device node.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/


Alex Elder (4):
  dt-bindings: mfd: introduce the TC9564 config syscon
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock and reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  64 +++
 .../bindings/mfd/toshiba,tc9564.yaml          |  56 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  11 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 366 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  54 +++
 8 files changed, 582 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 79d34e34e9ab629be19e588ec2eb7e1855d6dc46
-- 
2.53.0

