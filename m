Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885424;
	b=OfmHExNXUSOnw0XX9aY8xLorEho8HkS0Vyc5ZKz69FnhtpkjU3ZlsPr/XVqB0n0D/q58
	 KW74Zj0l9unwVRE7BSi3HC2aTpjBE1jyAJmFlgrVmNBuNP03Bxb6vX5v6O6jsNGJq3V/n
	 opU9f/TD0DiR/KRMzv2MjXTyPKGAMCqVsGD/0v+qnwzaXJeXF2ouSIJRs0qS3UH1IAXrM
	 eeTEg21CctGrxdy3f+DT2k7TWg9PFkf8EiE1gnFH1mwz9ofXi9EGtTnbg8JO2eobPoBFL
	 C/Eg7kjGTf9Hsvo5ltCLfEpNXfnJN3B4RoHecbqubPoj0ljFaysWdvp5oWTBxrYUFfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885424;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QgfnoudeIak5HcJlOuxSHq2rJVdqm7W1+hkuv6nDG4U=;
	b=b1Pu4Ctp1LzUHFxPwAhVCdM+gOlbT7B84yBVdtmg3a7+NtRLEdeyc2GmvwRwa+1opQ+n
	 eAK1CYS1GoCws6FClkBCHL+1HrDFofT+9FklUEWv+pSsbpa4v60z6Oxmwc+UQSJ4c9UQf
	 SIXRImYNvE7wZd+wfsfGmX11I4OlhPpwJNivpJXj5ujTcIovcrV1jMiL5zdnfuWMGuUNN
	 65/FyPtxHhIhaVYXG4OpIbWXFJcNhvba3Wm0I20TXE/FrNM4C1yd7lauz70wvWujX8DBS
	 WeIaedpFWUTFPzvxR3fOoNnwAV2cfx5UussOgZKBkJyBoSURKlwhGIv+qbTHGFXOZog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlcKWq1x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58653606A32F;
	Thu,  5 Nov 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlcKWq1x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793885423;
	b=V1rga1vjSdiNGh4TasS/hxg5ecOqmgfyEHTUsA98ZnGgbQnb07DD2FQ3Kqx96Almwoys
	 M9H4dcAc+VICk8W/nwwC0pAY2G4P4laFDA7vPpX7IFGlWnA58S+aC5qnjA+SFKQaRdWwx
	 vKy9nIAcbtY9nqLhJTyjaYbmXiiEmbV8Z6iZNTYtV9eCuh2ez5XD6WiYkgnabHEyWNwZx
	 Vf1PhXRrImIDtFZnrF9U1guFeF6YoRx5nFYMYG1di7TCmU22h3MXOWrWdnD+4/XaPxVyz
	 I5++uXNilQSqGt1Qgf92BC0cDE/XHkWH7lqZP2JXF1+zFPt8bsSHLp3AQJA3Scn+SjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885423;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QgfnoudeIak5HcJlOuxSHq2rJVdqm7W1+hkuv6nDG4U=;
	b=TIge8flh2LxivQr17zKFl5DqrM9fWHfBtXWnH7S089854N2sTspNffq4zFCXX7rpPXJg
	 ZsT8lTg8/mnnzhEK6XLcXDaHzE4sFhdgKvgqM2pw81S1Kr4q+9GrPu0n4qEzRPwLb1pkN
	 EsNc/kO8hUAax5sEfyTg4OtrgJ/GKFnp4odK0S1a175ZKHKpJGiJYpa01na4fyCHAFWwq
	 eUb/w3o2T7zno3hUCYscWWTKAiuGndrxzvoeWExsB9ez8ELmRuLrscwI/hnMZtZ1kGcbn
	 jfC2roa0pASnCeipiTv5WhBxz0ru2XH8EKTRjqn6Q1OTiZbLMTMw3vkwqBE7apI3taw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A0671F00A18;
	Thu,  5 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885423;
	bh=QgfnoudeIak5HcJlOuxSHq2rJVdqm7W1+hkuv6nDG4U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IlcKWq1xAmOg9tdgep6SOGj7usBZ1Vgwx02OcRf1ga+PXmJbjLKbix9Ip14tH14AI
	 kyK0RF24OVxnKme/PXBRlmysS0txjZXBIXeAPNDGELGPb3KrSSXb5yPN2i7Zhx1N9d
	 33x+m+Oa0HfsK+eiMDg1ooebACUOZSG2d/ceOFgvcK7PygYBWKJAfkQohsWXS6ZUId
	 ZEs7sjwkI1JaCRX95M1Mq5e8eikt8OOajq/KMqZU0UJ8M73hkzJRSsd9L9lIWmOpUy
	 7JptkqNnXXDNRFp/c5EIedm7CR7Umj4+9OvxSRiAZlEuTTidKfOsC/oX0scSM8HR0V
	 79+rpALi24Ctg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9D17E47287;
	Thu,  5 Nov 2026 13:30:22 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Subject: [PATCH 0/5] SM8350 GPU: memory bandwidth vote and speed bins
Date: Thu, 05 Nov 2026 13:29:59 +0000
Message-Id: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3SQT3eJcC2NTA930glLd5ERLw+S0RMvERKM0JaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAMy1mwRxAAAA
X-Change-ID: 20261105-b4-sm8350-gpu-ca91cfa9aa2f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793885419; l=1797;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=D8VZFoCVME1aMQHvCdWPw5lNShSOUsROxlYF0NZDL6M=;
 b=7AfKYelxwTvmG/00jufz4oiz8vWvG22SyGOJ9LXr+Wuy0s6v8uyCf5WgNVLURRlYq4RxTi+si
 N919nvXLo0wCqQSA2Hcht8v7eNmhmGAbCYXMRglaWSy3pilzS4CGbve
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

Two things are missing for the SM8350 GPU in mainline.

First, the GPU never votes for DDR bandwidth (patch 1). This fix stands
alone and can be taken on its own.

Second, the GPU speed bins are not read, so every part runs up to
840 MHz: parts validated only up to 738 MHz run above their rating, and
parts that support 900 MHz never get it (patches 2-5).

The frequencies, voltage levels and bandwidths all come from Qualcomm's
GPU tables for SM8350.

Patch 5 needs patch 3: without the keepout regions, reading the nvmem
file resets the SoC. Patch 4 alone changes nothing until patch 5 adds
the speed bin cell, and patch 5 without patch 4 keeps every part at
speed bin 0 (up to 840 MHz, as today).

The keepout regions in patch 3 were measured on one device (Razer Edge
5G), one 32-bit word at a time; the 0x128-0x147 one matches SC7180 and
SC7280. If Qualcomm has the documented ranges, I'm happy to use them
instead.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
Demeter Barna (5):
      arm64: dts: qcom: sm8350: Vote the GPU memory bandwidth
      dt-bindings: nvmem: qfprom: Add SM8350 compatible
      nvmem: qfprom: Add the SM8350 keepout regions
      drm/msm/adreno: Add speedbins for A660 GPU
      arm64: dts: qcom: sm8350: Add the GPU speed bins

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 47 +++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  8 ++++
 drivers/nvmem/qfprom.c                             | 13 ++++++
 4 files changed, 68 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-b4-sm8350-gpu-ca91cfa9aa2f

Best regards,
--  
Demeter Barna <me@fromdisposition.org>


