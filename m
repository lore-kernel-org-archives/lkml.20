Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D850370ACA;
	Mon,  5 Oct 2026 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229691; cv=none; b=t8/I6lTvLZqMWcaXqeHXl7K6QTejPgKFde+W7URTZntfd3BryN0EO54RudlHbY+jmDVZ/mV/KpZwogZXA9VU1uSTq3cWGaAM0vgKBtuSxXtMNuJ74zivqau8qpLKt6aX/SDorP7tyPalT+Y9FBBbig3FqyZVlBy6v66hP3b3DFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229691; c=relaxed/simple;
	bh=yM4g8grKQbeO3RP64WLPxJBmi2Bcmyi/gzRWrchE2d8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uhijOn+uykifEDudLZa+iK4thuPEDE1hY1uEN/0iOEWmEhPNhoyY7oaHWw38jumPKZjlYY0KRb2OkXG5yqgNjq8HlTRThhUo3VgWhGAlFo14bK7xYQN3BwsvFLC5aOeIPvrn/0L+t0LlYqhHh9NJkv2KHiTxrgVwOFcpjsd0jMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngobLUZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngobLUZV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1366FC2BCC7;
	Mon,  5 Oct 2026 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791229691;
	bh=yM4g8grKQbeO3RP64WLPxJBmi2Bcmyi/gzRWrchE2d8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ngobLUZV7DUNHjlcx2cghpPpE+DpA2yiaqXPZG10RM9pVCMjB55+vJjOoa8L3BTR0
	 4YNwuWnHbyGNk0h+h9R9C7F7IEXc5dtw64GQ3eXzI0CW2PfRNFkdrTW7DM5VjVb53a
	 LGbQsdsOt9pdD17RJ0v2r29tsD7OD8MMH6KdMAbpVOsl9/vHGacD8z4GV3/iv/RhDh
	 i6+TwDjI9Yid6Kd2SFQuCIl5C2NhdJczWcTMtvY0LlB6t5HkBqviqEVhtAclb2uSby
	 ZVecomelurqghBdfM2xX0TrLSLKMJ5VH09LthHtYSGLI4oxEgmn5pmaO2o5vD+7daN
	 lMdwfzdlgeZ8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE70CA5FF0;
	Mon,  5 Oct 2026 19:48:10 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Subject: [PATCH v2 0/2] Add Samsung Galaxy Tab S9 Wi-Fi (SM-X710) support
Date: Mon, 05 Oct 2026 21:47:35 +0200
Message-Id: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0sxYDiNa68h6mC8IM7STaNkCwp
 uHuYvcu/5e8b4NIgSnCrdkgUObI81RDHxpwo50GEoy1QUt9UVIaMaTYvdmzwBQFatNqunZnfTJ
 QL0sgz+vOPfraI8c0h8+uZ/Vb/0BZCSmUl9gimpaMveOKL8vPo3PQl1K+u7rgSKkAAAA=
X-Change-ID: 20261004-gts9wifi-dts-d2472e895234
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791229689; l=1512;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=yM4g8grKQbeO3RP64WLPxJBmi2Bcmyi/gzRWrchE2d8=;
 b=JWS8jJS2/tuKNZM8ZZOC/XFPwHDGD6EbzVJ1Vm76f3YmL7hZqhdgl6o4yS4iyd6Z2rJ6FpBEl
 UOhZaJIj420ALmRtGoCMWlDigulxPgEb6e8BYP3Za4xDnVzQPfJi+cH
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

Add devicetree support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710),
an SM8550 tablet. Two patches: the qcom.yaml board entry and the board
DTS describing UFS, microSD, USB 2.0 peripheral via eUSB2 with an NXP
PTN3222 repeater, keys, GPU, video decoder, ADSP and the CS35L45/VA-macro
audio path.

Tested on hardware on top of linux-next next-20261002 (boots to a shell
through U-Boot): storage, USB gadget, framebuffer console, keys including
the book-cover switch, CPU frequency scaling, GPU firmware and render
node, video decoder node, and the ADSP/audio probe chain. The microSD
slot is described but not yet tested, and audio playback/capture was not
exercised. The wireless module needs additional power sequencing and
follows as a separate series.

---
Changes in v2:
- Use my name for author and Signed-off-by (Conor)
- Link to v1: https://lore.kernel.org/r/20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc

---
Nizat Mikayilli (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 664 +++++++++++++++++++++
 3 files changed, 666 insertions(+)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261004-gts9wifi-dts-d2472e895234

Best regards,
-- 
Nizat Mikayilli <nacht@dxdmail.cc>


