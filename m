Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321474;
	b=OVNXLrF2mMdFkKG//DurJ6Y5JihqlqGXo5ZvFMESdRReFDQzIZR1Q7xJPhfalzCqV1dm
	 K/6O2XAjFPBCYcaY4+npOxouK5CZtGfC2G7uBMgHQbXuOk70bM16LteorDxVmgBl8AdW/
	 wIuupACV6TenJx+ZKAjl/ghfpT+G4XmChq6QC7nUSAdXbpbJjr7tsRT8Qsb5eyV54/iin
	 lZkl98q8C6yCO+DzvKW6j4zG/O3euYioXf2COmzhXsG29f8nTm2lmXWpsh0geUlMTX5xX
	 vm4ohdSpoYX+CygKVLrbwPuBXLTYBcg3f31o/xKB5HXoDXqwLHLeVUiYwoL/V0IuXRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321474;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=LUyE9s5YGUuhok8CXE4hPDmnkZbLFVYYtzl2hlt1myw=;
	b=h3D12hCK26JO2kkxl2GU/q8pQE8ZTfEVOxHUvMF/u3JqyRUArBj2X9B/XInqeJT6suoN
	 tFs32CuhkLGjEjn0cIiIzBN5H10tUVt/6Wsl64wvlzkalpSdOoBxV3dMiNulZxRmsOvTe
	 KxhDpCo7kQ0jOPWtZKBzbAtmcBiJxBRfSXWETwL34GRNp8QFK9HPBLkhIq4f+QBOuq2Kp
	 4yGCgj0civy7UnVeEWTupnzFSnL8bAr+PSe2LvVrXQB6lyPPiGp1SwmRzbYtnFzPaCCUr
	 DT72w0A75v/Pue6abloJLJJvqUe4Xh6VTR0y1tS4W/qwsBpSosTfV90EMt813Vcbw4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBna0z1d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56513606A31C;
	Tue, 10 Nov 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBna0z1d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794321473;
	b=E9XaPrSO/1mv8puQOSv+qOCKEQVzikcqnTs17sKU7pul91rl6eTlbv1Mjo9cUwbogDXS
	 rgTg67Yq1mmShPhB8x+WpmDi4EhAvRiJ+SZ9aXXXEUf9CDxq7z/xKPT3aDAjuAhFbWubD
	 1/9sSmvS/m3ltnzGoMSNGZ5XajjRV7Dpptr8MHjU1tCA+8PS1C8cey9/qmArKWPD/a8Nx
	 BG79ih0JVoex73ws3GiX8bQTKMVL/GD89Df9KckpHujwsxhinpVREfJgjISANfkxb8m+G
	 xpBbbT6tfQwozpgyTtkV7b9pFWT0K91Sd7/meELzmRquAgUSKoy+dhEPTkrbe6b6thg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794321473;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LUyE9s5YGUuhok8CXE4hPDmnkZbLFVYYtzl2hlt1myw=;
	b=W8lnubpx4Fd8NKo+1K6eW8SY8dco/+ixfoSXvIBzwHbuOqFjszKEIe2c1t4yYM/n0Dgj
	 y0n95B3GPOYLecp1R+LlZtCDXryg2Rc0y7ZedtuSwtW05ALRRqjOlOwg/St2cdrCUBWbw
	 d0IaF+i9NPWLc3TuLGIcqKGzzkcpesG8YFT58zUyHt9i4aY+cSDXaylvPIVS7fZOfQC+c
	 92am+/w+dxkVgpnFMKHkdckFjBejKnxZUI3oI16snMp79YFWgSpYpXRFeu/vU10v8ihRi
	 12IOzsEz6nMgmD7CH/c9lapFnSksk0YHsv2Qo7KgrSNMVE84ZzeB0ksUIr5Owxvaggw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 527FA1F0089F;
	Tue, 10 Nov 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321473;
	bh=LUyE9s5YGUuhok8CXE4hPDmnkZbLFVYYtzl2hlt1myw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=TBna0z1dMKDVwNi07HmT1iRwej4M0NSICGeGQMbWG8jjJlJkTk4lfaC4b0GzkBV1N
	 cGb9q5ffegn2lYLgztzKU6xtOBSZimYPmfE6vpOQZi8lnnJkLX6Sy0YhqgTfbm1LbP
	 Mw1Asz4APQ+j3Wk0piKesUaMPoazIwH2jEvy2U3ww/1NF6CPhnPVvZedzOJnhqBN0e
	 9NW0iD0dQyQDFtUT455eJSipbVSdz+iAYnsaT0j2EGB2XxIPJ6jsHj/LU6rjqpvlLX
	 /9vQInf2HZ00gx52XYvwLmXcwnOyXrfjpFEvsRfs/Kbl/x9Ytg4t8C/Cf2ni6VxOBO
	 VbsB/V5XSG6Mg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACA6148B98;
	Tue, 10 Nov 2026 14:37:52 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] wifi: ath: simplify copying a peer's PPE thresholds
Date: Tue, 10 Nov 2026 08:37:51 -0600
Message-Id: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEAs82oC/4WNQQ6CMBBFr0Jm7RhaQ6OuvIdhQeuUjgHatJVoS
 O8u4AFcvuT99xdIFJkSXKsFIs2c2E8ryEMFxnVTT8iPlUHWUglRK+yyw0AUMQTC7CIlHLwPaKg
 xUktSZxKwrkMky++9fG9/nF76SSZvuc1wnLKPn/16Fpv3/2UWWKNVWjeWLtbq060fOx6Oxo/Ql
 lK+7y0Yc9AAAAA=
X-Change-ID: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794321472; l=1569;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=vBZaf4TEYAxqUGlg0dDE1mpIQ9acO6vuybyJLRWS5LY=;
 b=K3soglbfb5eqqDMtq403mFJS21XB1PNr0p0+UHvGArEQGIwyy5Q0ExUHlR90T7sYQW/hT+d0v
 cEM9AiHHq3yCORTiPfc/yPhD+4WLjFX3VRYXP7sbvfUr8IkHKCoSkeq
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com

Rameshkumar suggested this while reviewing the PPE threshold bit-order
fix [1]: the loop that copies a peer's PPE thresholds into the WMI
layout shifts each bit in from the top, where it can put it in place.
ath11k and ath12k carry the same loop, so one patch each. No functional
change; the patches don't depend on the bit-order series.

Compile tested only (W=1, both drivers). A userspace copy of the old
and the new loop gives the same output for every 6-bit value in every
RU slot.

The patches, this letter and that test were written with Claude, an AI
coding assistant.

[1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/

---
Changes in v2:
- Dropped the paragraph about the equivalence test from both changelogs
  (Rameshkumar).
- Kept the one-line note on AI use in the changelogs:
  Documentation/process/generated-content.rst asks for it in changelogs
  and cover letters.
- Rebased on ath-next.
- Link to v1: https://patch.msgid.link/20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com

---
Christopher Griffin (2):
      wifi: ath11k: simplify copying a peer's PPE thresholds
      wifi: ath12k: simplify copying a peer's PPE thresholds

 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>


