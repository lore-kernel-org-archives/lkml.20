Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627977;
	b=xc1FRKhcL1zPOefFzgb98j12W+sEWaiGlzHGwZBtQZn4vDC7emvtDdpWvXNiEjMEgML5
	 7gROVovFYx3HJT0sJH8yZslIGtNZzi1MEXbdXD+u2dJ/8GEITOWM+zmuESE7Bm3zO4NBq
	 yg/ztJ3svo92iskukdPXH0Hhp3D9f2jaffwnyxrTGpwssluz6WFKL4qfr9IvcPM5NMl4q
	 jqAa8aOInZhdtLs8lz86wxLfVorcxhJSTvQWOG8neW+gcc7yIuJJtTv6yBEUgQen3FwWE
	 3W9X7zweE6qK1DlvxPCL7ewX7pspTHpOTcwSf4n/Yc9EGUzD2wN/qVS0Q87ZOHUdptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627977;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5D+sICZvhFnCjFfCw1VmJULsIsceti0DLUKwMTNcXyw=;
	b=tpXH1vlNP4ZYCldGxI9OWoa2UXWuPPgybIWNGk1fUzrMV+boUufa5EM1Ik7+4iKL8lmh
	 muNaBfGr4U7YbgWQL2YYQb7WU68M+cFoveWlnMB8FauuOb179qChRj2h3bRGOE01xo7qt
	 0XpMWjFq5XZJbxN6UGcmzu/BsHu61fKHqW5sSbrucwgZs5ecdeY81mE5F/257g8jelHrP
	 7ytyyrxgCxipETTXUgYNoID/ybpjnROETjUtcX3iAs0k2mF19rICRfRoobgGhpDK6Su4G
	 1L3UN55eIzbFK4rHPUAOShbjCnIdgiBLfHhyJ45vDuyUPqgPlR52Ca8LS5aIEHxzSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Dzj/uu64";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F7460A3819;
	Mon,  2 Nov 2026 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dzj/uu64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC3D1F00A16;
	Mon,  2 Nov 2026 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627975;
	bh=5D+sICZvhFnCjFfCw1VmJULsIsceti0DLUKwMTNcXyw=;
	h=From:Subject:Date:To:Cc;
	b=Dzj/uu64jL9b7TkhbTE0JiUIe3j29Gnwt/BWDvw/QF2MyCEEzkuNM1XLWdekkm2da
	 mzPke2g5/TPgLpqEIjxKxN3CiIAsOIQKDwUxLCRUktWFw+y6vzkYHD5+290FTtrJfv
	 pl5GYQSVgeBHe/NmMPgXdw0HjBr7+n21qld0k6apbSCq2Vlq9S6HtIeiK1VP449vku
	 YdLOJGxu7aWTATuP6UIj87ZJ2V4fx2xpUX7MdmLPs8IZjzlYyBdUs+M1l/J7QHX9lB
	 zwCXdFqHlNGTbrReO8KPcTatEIOwiCADxHQSQi4wgC0OMWDWmtuaO81aibnyXnGsLa
	 VCU3df1R9knig==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Fix up AON clamps on qmp-combo-phy
Date: Mon, 02 Nov 2026 14:59:31 +0100
Message-Id: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBvIBA3Yq5QiMY46pSZpoiKId
 zfV5Vv8v0OiyJTgWewQaeXE3mXgowA7GjeQ4C4blFQaUSox+8BW/KbQGO8a+zVTEKhJ15XsSpQ
 achki9bxd19f7dlraD9n5v4LjOAHNbkqfdwAAAA==
X-Change-ID: 20261102-topic-qmp_aon_clamp-16e6950d4106
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627973; l=936;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ef1OmLeK2CMWnQe+G8q55VFeGP3F1KeLA44wMqE/CMs=;
 b=e7VQOZt/RzSULLFP0ACSRjmBbDU2FKMI2UU8p3rBagRUqn/EKrMjznTfjGGqb/NloR3uMmvlL
 m22ikmlFmfCDho3uI6DUZFIOD2tAV1ttbXN1fhJt0Gu6QDPpz59hZaH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Various platforms have apparently not had the AON clamp writes end up
at the desired registers. This fixes that up, based on the robot's
findings.

Depends on (reviewed and ready to be picked up):
https://lore.kernel.org/linux-arm-msm/20261023123512.1912-1-26rote@gmail.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      phy: qcom: qmp-combo: Separate PCS misc clamp mapping
      phy: qcom: qmp-combo: Make v4/v5 targets use the right clamp
      phy: qcom: qmp-combo: Use V6 offsets for PCS-AON clamps

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c  | 30 +++++++++++++++++++-----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h |  1 +
 2 files changed, 20 insertions(+), 11 deletions(-)
---
base-commit: 63ad76011c4162b0e0e516e5eb76acc554683cae
change-id: 20261102-topic-qmp_aon_clamp-16e6950d4106

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

