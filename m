Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B5A48167D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283266; cv=none; b=SPMURLkVc6gAYOYMvGbb0tKEEeaN/mnRj9aRmYcXJre6zp+MMTk+v+ewqAydTMA5JP0Drc2s45FlrC1dtwkFIowrV8AYaFD9HegGXVwSQ2/4BIxHmHbu1Ss0RV/J3GJeTyJUCtsgXeMfpBuatr1mUohyfrwiOLgy2h7rCy7HAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283266; c=relaxed/simple;
	bh=cT4BBpHAqxNuLzOsErL2ZK2QNlhFAr9KUmL6LjbhLBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8mNTxebgPJIdp0RMbR1x+PFCXfKwv+KtCjD4iv+6uApL4gReQMORbupAiItd62mFkigTmkJI05jP3w4MZP1sk++Sa/ErUd9bm6fbCaeMiy8jQjPr7XBJ4juwvElnUtvhUNPAm+I/pcmoW/eQcFRgVNQc780Q2lY5Cq/RDiepOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=L3O5bEdw; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="L3O5bEdw"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52f9e79ed93so191041cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283262; x=1788888062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=L3O5bEdwGH21Ke2FJ43ymyG3L2mxGq985ZxmFo0AorcOwf/tz2Fn0rHpDxiScstRWA
         M0mPU6xkUoxiRGct+2JDbA3/pDfn11VEG3QEw5ibirbMq4VAldBvRzP6oykuVedubmrs
         +z10Unb0jawsgYgP7GpTPRwWg+Yvbfllgj1yRHUXp/SmmHE1dnNUHte7fIyLV7GCiZds
         8Iif2kj/3dkWkInlyoLub4v03z0+7/4IeA6qWTQQe465x+3tFxZGidTmd9R5sbk2I+kZ
         aKPNdl3CT2DUUAzel5H/vvZYUysxdcuc/Y3nZFQoiNuZxCqVMR6BMTylpKbnD5yiSiGO
         3jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283262; x=1788888062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=BvltbB3aHWdjI3eUZP7039GuC6eSLEyzf82g/Zpog6jbRPh+0Dzq4mx8XkbnUbUiVi
         jDApp5D2lNZ4WwvFqsaOPRCq0YszhiM8/g2bdUUCFrivWea+Ap+V/E/YwwXYC1unKdv4
         vhFauwgpJj0IYds+RB0sAOua4Bwl4MfyvDfqxBqy6kdN7I0603B4e59Y5CM2QsAC4ExQ
         kTTGnLcLb/yYcrE5wmCJz7lkbYx8AGu/uS5QwLohrS0yPYTQJL+HJjK/vj5fsVkNBbSw
         9wG1oHPqgy5Ogaec9MuMh8BFmQDLnEqdRwMfRVJEMmpAd3MERJVnMGWQtGT7cScVlseU
         Lzhw==
X-Forwarded-Encrypted: i=1; AHgh+RpoRrg5ZmRRXqTRUSJfQPFTutGNPfDQdA8Or1dC4dYszlNmrikPOB1OAbz5fJ9GQxvwYJedAQgWwhEVk54=@vger.kernel.org
X-Gm-Message-State: AFuF++ko5fIqpa9ItIO/PJafeewwZpvbJp+t3nWkolDfbna4cSLlCY55
	rlkl9XHKB00W52dbtbZMJ9KsYhww8jt+rhRetUYJpPDtj/LQ5OLSd6Cs9fZKnJrktE4=
X-Gm-Gg: AR+sD12236BfXfJ5K9VEL177rImxvti5pXgtwU/dndhQY5Dx9hMGzF8XESVPUFOjO5K
	068Urg3Dv8zJpK/NDGLYB6GAZzqxJZRyqQcZ3aVT2wlUlMsDobEX1cTXc4wxp3cAlzCPnFJ+2kz
	R5lLwhwd+FMcAqiJNBBAKA3k7pYiVk0yywCQcA1ANqcDL19HaMfyRWRenbdBYSZhdj/I5sIqP9r
	C2gzsaLOFXPUG9X+SyI6hLhIlcj4X00TxXpPMggU8Qn41y45Q3/gXywWd6xdOhStOSU9niYEVuV
	uOrfoSmVFZxtNznNB0wv3TWA4ZxBQjSKp+hHYi5wQO7pgd7caRSrkLpbcVddHe78k20USyq+toL
	Cjily+g9a2BiWq4T8Tfo/ieQpM1IjOnh1rNLIauFCLXEvnQAU8f6Ge1iGdFn0QFl2BRBdvvifcw
	dhIiKkjNon/kXSRY2aQYHQ/4kQWyE8WKmWC2U6KQEgHZQ2n4IIrL8+9TnHGszPYJJx
X-Received: by 2002:ac8:7e82:0:b0:51b:60f1:689a with SMTP id d75a77b69052e-52fb938d2c6mr424963111cf.7.1788283262313;
        Tue, 01 Sep 2026 10:21:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:52 -0500
Message-ID: <20260901172058.1512508-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The TC9564 includes a PCIe switch with one upstream port and two
downstream (external) ports, plus a third downstream port.  The
third port has an embedded PCIe endpoint with two functions, each
providing access to a 10 Gbps capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

This unfortunately changed the way the devicetree code treats the
nodes, because of_bus_pci_match() considers any node named pcie@
that has no device_type property to be a PCI bus.

The previous name "pci" matched such nodes as "default-flags" bus type
(defined in the of_busses[] array).  This series restores the previous
behavior for these endpoint nodes.

					-Alex

Alex Elder (5):
  arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for
    device nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device
    nodes

 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 4 ++--
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts              | 4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

