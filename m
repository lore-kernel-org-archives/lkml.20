Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918068;
	b=Ru0/LA+GoUSf4+mlBJ8v4npI6Hg5OKk/n85KgETiorAoRwzylGuRgRPsek3FTH6Rx9XZ
	 X0wX/1E5NRbxq99qra/tM7meEsERCCYXZ3JFOVhd7xK/coTaIZFsEifwaOygzgiwBz/oI
	 Ax06Y3xh5NIHBGlYufMCjOxb8lKx8dLzsE/dD92Elg1GtVIo/nk92SBAmRDwK+/b41w1S
	 ZlZdXP1GT9yCVpGa7qnw7tHuYHeq2VDSMcBNRDTEG2mvHqDytuTIXvpQ0zItww1xeY5dl
	 wtrsQ10mgDIPrS5rVGTy9AZmACB6Px6drKzcS6/j9omJzCDRWA8srVXanWmaQiPEpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918068;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=79uHJ8ZCxEjX3Q9dAac97eiJ3y7h4HXgB24A6lnJl+k=;
	b=1MRBdl5rBrKwMI4X1wtQyCwBmQCXRzTg30JhLSXprD0cBF5+HqP/vjA5ALZqB5x5QyKA
	 OWfXVcGbsQO1rstIYEyOUVAAEA2YlQYlvopxRdSjNajCUSJDC+2F6UZKhVsKzXsxZBtye
	 p+5l4BAkt6ouacgriQTNodOKa0QXaIHu61tIUt6hkmnz3r1f5SBbjtSetmYTbl1YnFz+i
	 ilFY/Ud9SxGhONqIKJ8zpTzT+X33tqWZq2RcfSERcTf61F3ef5n9GgBzzTxDmi7XsP+SJ
	 D3lgBKax7eWJ35ltDh5Iexe/o6QB2hZ4pKhz/nBVdIdhA77Xjx0RSLKWL+W+du1l6RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IEz+b/MV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496F606A326;
	Thu,  5 Nov 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEz+b/MV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0BC1F0089F;
	Thu,  5 Nov 2026 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918068;
	bh=79uHJ8ZCxEjX3Q9dAac97eiJ3y7h4HXgB24A6lnJl+k=;
	h=From:Subject:Date:To:Cc;
	b=IEz+b/MVF5XZesrMeI3b/J/eDfZkVvdLpox3VH5vXAUu9elqCIOj9OEOddiDlZnh4
	 Gshj294kL3EKJyhpgyiWSqHwqgZmEWTTWVGuY+bg3Z4OoTF9V2fCTmBI57Gl+StJEb
	 XwSGm46iIMJMFwszRNa6wYljLvZ5TRmErqzsGFz6t2zECqvTDzTP52D+Lhot4fSI9P
	 lozNCJKIVRjkGTXJ/MlRx3FL3q8R0iCdy60SMBWgshqrZODE+n8J+/zCcyXcGdsoIF
	 5kCqVLiu81FF/HcNO/FwjOhgv4oq4EhccMTq2KysHroS+ItyiKiFYOB4PCk9TQlyYM
	 lP/mZ34gXeXsQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Date: Thu, 05 Nov 2026 16:34:13 -0600
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQBAEvyJzzoCrUcSvhBzctdXxoGFHRRD/7
 hhvXRTVBymiQKlODorYRGWeDNwroTA0Uw+W1piyNCudSwtuF96w/yJUbSt3skO5qULw+du7DgV
 Za/4vLP18H9bVjwjLfUbneQF6Dp8oeQAAAA==
X-Change-ID: 20261105-dt-vexpress-dts-fixes-a8ccb34b1fe5
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd 
boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is 
included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch 
2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For 
32-bit boards, this cuts the remaining warnings in ~half.

I verified the config-bus devices still probe after moving 'mcc' node 
with arm/vexpress-v2p-ca15-tc1.dts on QEMU.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (7):
      dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
      ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
      ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
      ARM: dts: arm: Use standard node names
      ARM: dts: arm: Add missing "#dma-cells"
      ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
      ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level

 .../devicetree/bindings/arm/vexpress-sysreg.yaml   |   8 +
 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi      |  20 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   8 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   8 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |  10 +-
 arch/arm/boot/dts/arm/integrator.dtsi              |   2 +-
 arch/arm/boot/dts/arm/integratorap-im-pd1.dts      |   2 +-
 arch/arm/boot/dts/arm/integratorap.dts             |   2 +-
 arch/arm/boot/dts/arm/integratorcp.dts             |   4 +-
 arch/arm/boot/dts/arm/mps2-an385.dts               |   2 +-
 arch/arm/boot/dts/arm/mps2-an399.dts               |   2 +-
 arch/arm/boot/dts/arm/mps2.dtsi                    |   4 +-
 arch/arm/boot/dts/arm/versatile-ab.dts             |  11 +-
 arch/arm/boot/dts/arm/versatile-pb.dts             |   4 +-
 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        | 146 +++++-----
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi            | 322 ++++++++++-----------
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts    |   9 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   9 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts        |   4 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts         |   2 +-
 21 files changed, 298 insertions(+), 287 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-dt-vexpress-dts-fixes-a8ccb34b1fe5

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

