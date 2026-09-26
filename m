Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67A171BB;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412094; cv=none; b=sWV4jj6PZb8cQkxM3xi9E9nBDmo70nQz4QilrEPrSbSWC9YOm0xx6SLyHJ4TKReOWE3KVUP5PpgvRZKxXjT6Lo/eVMgl7B0yWfhyuUWMqeIRhflkCJIPSoUHqGnu2dFpYM1kpimH5McysOb2tB0w3jtEci+ZIvzH6zH7uI8aAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412094; c=relaxed/simple;
	bh=kbNYB6AwQiVWj7uPymDdVKanxCUYoEDfo1zBkhPJMiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cr0xulPXc3UEsFR8ikwGJQ1zLBuIh90RtrP+CtLAp0Ok0PqvIoepcMPB6li7NUO9h/7gIg5QQHvH/y/CSDyAZUi/uKww7RTCpmOoaDd3t1JEzc8SW/ysQkdAYb9i+VHYAG67JKIPv6NhP825GCuVNq5RMagD5n39sBNQKxxCtIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyF7AgLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyF7AgLj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD75EC2BCB8;
	Sat, 26 Sep 2026 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790412093;
	bh=kbNYB6AwQiVWj7uPymDdVKanxCUYoEDfo1zBkhPJMiE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XyF7AgLjwiQ74YQfMpq8S+JwHoAdRHIbcfoP91Dbo0khvlddP7lCSd+Q8aTyM9W00
	 0NZLQ+xLzXwASrlP1FmvYoziKEOCM1EWaSF66n3D+4WREMAh9Pfy9yq/LCCKHaLSup
	 qLdptMGQAoGBVeCYfZSQ2mDxz19mzfueG/oFFWEvkHSv7AzVB1notGvMC4371q2iGR
	 ouB8G5FkoYE95g6eJgPsp8Nu6wqjJg49Xokfb8iw3wpqwhP8uVbfJvCXREpRqXMrCz
	 qLoFXJTPMxJSQOVR1L4go/kzlp9GnyXcDvWEEhDj/hM7nl/obFL26oCVFC1Z/biaeb
	 pv3UPgL/5U3Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9450C9832A;
	Sat, 26 Sep 2026 08:41:33 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Subject: [PATCH v5 0/3] Add support and enable the debug UART in the Pixel
 3a and Pixel 3a XL
Date: Sat, 26 Sep 2026 18:41:31 +1000
Message-Id: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/53OzW6DMBAE4FdBPmcr478Cp75H1cPaXhK3Daa2Q
 UER716RVsqlOZTjjEb65soypUCZddWVJZpDDnFgXaUPFXMnHI4EwbOuYoILw6VoYET7GZe4xJA
 Lgic7HWHCVCAOkDw6XHCAgS4FTCueldSNo16xQ8XGRH243KzXt5+cJ/tOrmzA7yLR1xRyKPfZK
 eQS03J7ONdbu+fMXAMHbtH2ulHovH0ZYy5nTB9UYn6K6cg2bBa7AQEctETrW2+bnuMDQN4Bw+v
 /ABI4mN47b0wrjaIHgNoNKODgtNe1961xyP8A1nX9BpuTjkMzAgAA
X-Change-ID: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790412092; l=2823;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=kbNYB6AwQiVWj7uPymDdVKanxCUYoEDfo1zBkhPJMiE=;
 b=iCOLr0tjFHaWSubRSaoEj589H/CFuDCD/wqMSSWqEYsvnpeCT39UtpELc3Re2MhDFgVvdh3tI
 NHLM8r9r+R/BrjrEIhCQMWwyvEexHzVmWtjM2iCFVjlWKb2U6f2izey
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

In order to get logs through the SBU pins in Google Pixel devices, it is
necessary to add support to the devicetree, and enable the corresponding
UART. With this code and an USB-Cereal board, I was able to get full kernel
logs through serial.

The previous paragraph is Pablo's original cover letter. I (Sam) decided
to pick this series up and send this v5, since v4 has been sitting on
the list for a while now.

I've been using the v4 series on my Pixel 3a for a few months now. It
works fine, and the unnecessary RX pull-up didn't seem to cause any
issues in practice.

The v5 changes to patch 1 and 3 were authored and verified on device by
an LLM, hence the Assisted-by tag on those two.

The changes were validated with a USB-C breakout and a typical FT232R
USB-TTL dongle wired up to the SBU+GND pins.

The console was tested with and without the RX pull-up and no difference
was observed. However, I did not test a floating RX with nothing
connected. As Konrad pointed out in v4, the downstream sources do not
specify a pull-up (see link), so it was removed.

Link: https://android.googlesource.com/kernel/msm/+/ab4493f31457eea175568b18b8300d4d12aaeea8/arch/arm64/boot/dts/qcom/sdm670-pinctrl.dtsi#963
Signed-off-by: Sam Day <me@samcday.com>
---
Changes in v5:
- Picked up by Sam Day, retaining Pablo's authorship.
- 1/3: Drop the unused qup_uartN_tx/qup_uartN_rx subnode labels
- 1/3: Move default pin config to sdm670.dtsi
- 3/3: Drop board-level TX/RX pinconf, RX pull-up, stale Depends
  link, and v4 R-b tags.
- Link to v4: https://lore.kernel.org/r/20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org

Changes in v4:
- Picked Reviewed-by tags
- Link to v3: https://patch.msgid.link/20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org

Changes in v3:
- Drop dependency on already-picked patches
- Link to v2: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org

Changes in v2:
- Fix typo in (3/3) commit message
- Link to v1: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org

---
Pablo Correa Gómez (3):
      arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      arm64: dts: qcom: sdm670: add debug uart soc node
      arm64: dts: qcom: sdm670-google-common: enable debug uart

 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |   8 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 271 +++++++++++++++++++++
 2 files changed, 278 insertions(+), 1 deletion(-)
---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4

Best regards,
-- 
Sam Day <me@samcday.com>


