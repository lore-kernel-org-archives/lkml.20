Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC2D443C28;
	Thu,  1 Oct 2026 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833909; cv=none; b=qnOR+tz9RT0XPiGMCq+daneZdeSWIcYHSNs8c2Td25wXysdohHHJ5/larhg1YJxe4WU7L5sume7f/2Is1DmFHri81nlk7XBkfE5854GpfSQyPiHZJJHCwHP1jRXkT6Cs0wfcgC9ROedYI3IrfUF3M40vjpiVCp1HaTDCTvPuOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833909; c=relaxed/simple;
	bh=ElSsC2B0eZI/IeLTLfLCgftCt9rze4Nuq105uFAKiKc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KWdALOgRS50Azh3jW6+HyQZ0/9ENuopNhPcHLLzEr2snEUkuiRQFKuVfCO1036PoQBMILh8d+ST81C4cDbJBA8YqpQRI581D0Jm2ydSct5d6Q/fz8+n7ZEVaGrumI4kD4FfvSdJMrM2LkbpikImD7+vhCC6OBgE3wCfIVgl/QQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mfgLBwzw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PoBSDO/s; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mfgLBwzw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PoBSDO/s"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790833900; bh=l2j1jyjoIXYtKyNd5RwcnBH
	rdwgZUembyWJL72rxe4E=; b=mfgLBwzwZsUbEwwj0G2QbdSgKWZUVG8oLF3Kk75GdrbZ7Bg5OO
	EKaqZEYo9V5o2BryXaZUStbh5QdCOnd8Yg6HozMSb/Nb3NLt7qcGwsnKHH8V51f4GxW44XGssVh
	W4V2FnwkCUEtrdue6UStZYElsmvxKKCxCPMr6XDjzOZEmUXFME5oQYoWU75oyHriJFSSWC0LmJQ
	F/1zkd5HP33JqCYMRFppdY/h3RvEZlsyeZr6D4+Y6Yqyg7adYFRwSAGiFYtlzUtjgvaRk1zk48d
	tTj3kqcZKmz48mHwKXKrSkSkYeL1YtyXTNnNZPjPchfJ+CoE337lZnriE0g7zy6zfUw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790833900; bh=l2j1jyjoIXYtKyNd5RwcnBH
	rdwgZUembyWJL72rxe4E=; b=PoBSDO/sw8lxke+QulsBStr+2VswHyGqO79EMbGTfbD+Bj+X73
	k93pBBb8VsvST9CsOYW0lL8BrWjUMwjmAJBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/3] MSM8917/MSM8937/MSM8953 fix prng
Date: Thu, 01 Oct 2026 07:51:37 +0200
Message-Id: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5AMBAE0F+RPWuyJSr8ijgUq9ahpEUkTf9dc
 XyTmQngyTF5aLMAji72vNkEmWcwLtoaEjwlQ4GFkohS7M4aMfMtqlIpjdWkmxoh1XdHKf6uuv6
 3P4eVxuPdQ4wPCuEM+mwAAAA=
X-Change-ID: 20261001-prng-fix-5366a05da970
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Dang Huynh <danct12@riseup.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790833899; l=1302;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ElSsC2B0eZI/IeLTLfLCgftCt9rze4Nuq105uFAKiKc=;
 b=UlakbsmDfoDFjsFwuqFiEFDLavlXcEaSxIw3TvmYg7Sn14otoxc5xuOr/EJD0PlGCWlOc8dbx
 K+TZGWHJKipD7UMo3kqYMeSUPuLbCTBgoOtagZbYaYqa4LyNd2Myf3C
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8917/MSM8937/MSM8953 HW QRNG is configured by TZ.
qcom-rng driver will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Compatbile changes are fixing this issue:
Call trace:
 qcom_rng_init+0x6c/0xe8 [qcom_rng] (P)
 crypto_create_tfm_node+0x154/0x198
 crypto_alloc_tfm_node+0xa4/0x1b4
 crypto_alloc_rng+0x34/0x48
 rng_bind+0x60/0xa8 [algif_rng]
 alg_bind+0x15c/0x1f4 [af_alg]
 __arm64_sys_bind+0xb8/0x120
 invoke_syscall+0x6c/0x11c
 el0_svc_common+0x98/0xe8
 do_el0_svc+0x2c/0x3c
 el0_svc+0x40/0x9c
 el0t_64_sync_handler+0x88/0x134
 el0t_64_sync+0x1a0/0x1a4

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (3):
      arm64: dts: qcom: msm8917: change prng compatible
      arm64: dts: qcom: msm8937: change prng compatible
      arm64: dts: qcom: msm8953: change prng compatible

 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-prng-fix-5366a05da970

Best regards,
--  
Barnabás Czémán <barnabas.czeman@mainlining.org>

