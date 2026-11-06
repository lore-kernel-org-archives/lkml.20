Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990909;
	b=4oxpp9k8g8y1+jMgFjPRirUCm3y77crX2Xaa/ockgkeBVgb6DF8c4cJytoFQWPenZ/ac
	 Cqbkuod9ilZhDNmrIfzSjU4HSt6hThVTYljh6JSIJyGYMrD0clPu+qkoig7rBUN8uhmdA
	 puWfHC+THh8hRBWU3Cwn6TsybChmFwA93a4KZc95hbjQV/pEk0YvZdNZwDb8Dr6wR3v7J
	 OaFa8jDlXC/VWY5jlDT97+yc8D8OMIASGcnP0wGIs1RTFkLoiE3RdWHvAPZsn3EEbet1C
	 fTZAHpwHA4BXS0g0pdzBBAP8wfIPc/FXXwYZZO4UwEniK0aNE0xhJi0YHw5JCJ0E7SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990909;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=;
	b=XSHMsqiYXPqh/cnDUZSJgmCTci+653ubQ1uv7pLr0VoSnzyPVEXhubkurpDl8R7xEM3q
	 rP6Vl0QSjyNrbxCQqKQRWEQtuWUCYdLiAPAGKqdDVZSINchzteupq0bBC/HiW7htk4Z3U
	 z4YsmOrz2pkyHQXX3Mi3v07qFeIpHaNTD4NayDUBHuJi9JA5WMZaQJi0OluKqfATgwuAG
	 tN8XfsIL2DfGyvMgbpI2tQFhu0845UiJunGJY4vifB95YS6lgQj2C99Gx+31+QzWuDfR/
	 KWdxbH5A9WSYsrPEokW0yV47ER4D7qcj7aJRSVaqlw/3OcveaYwSgSiG6D1X5yVhPVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kw+Rgow6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C17606A32C;
	Fri,  6 Nov 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kw+Rgow6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793990908;
	b=y+IogmuWLaPqhhPqI9B0utXxyKmpr/VVL6GHYtBGtGm5mTs7Nx6SjR9vM81n1mF4S1CM
	 ONfVnmRFx90GY9Mpygy9YmHSXi54YzZNi0tq19jmiHkuXby1YQSwNDLyqXu7ULlkskutc
	 LCga1WyWnsRQaKF5QB0tjEQMLzpKCzUdfhanXtHEEG1/n3d3VcivWZvAVNdP7lE/yuqA/
	 veEJnwnoieyRnQ/bwRAmY3bZO3zvO/IMBWA4+ZXKqPHf7pWay6P6sUMXEPjbB7NlmBHH1
	 6iKv0uLZSot6H1gNfFj1zUzJUSV5mILIa/H0EKqOvYIBrn0L/eYq3/XMtUKwftCopDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793990908;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=;
	b=vxgcE1wH9xt/SCqx+9LDzqupn0LXa8aADYX1bPUIqWQw4RJse/Fj9WRsU2LJU0waL9k2
	 z7RbI3eutEPzZbIks/QRPpBLW7o6g0Q7c9eSnBgHkXdojJej8BzxgV/Okq7fxDb2Zp8Sd
	 hcSb+BDSYOfWR/v0kpvcTVNSnw01g23Iz1MsKNbL21F3W0xyHwIXBLEqpFnR47rkje+wG
	 9JK5F0ppkd3Oowd26/GusJRFFVI1MNUJ1T0Jzdpyblc8EDmbpQeDHtcpUz3MzaWp2xW/M
	 LegKf91qz6IquCCGpZxYB0ojp8Uv/Ne0de5RO4CQpK5R2uxwhV5eNGOCQiBqD0d4FVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 706B81F0089F;
	Fri,  6 Nov 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990908;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kw+Rgow6TAmBOgFw4OkZObZp/+GLwafJF04M0Igdrg60hRihqPD9dlSeMwgmHU04a
	 GLEhO5wxyzfPks7/ZopehQCPyPLDVSn5UJha79mON7apb8U4RknogQ4t8fPlAJYJ8V
	 k+WWL9jNIV5jY87nbPsNbRWO3lTkLm3h3ySw1eDn2BYsG3BgZpYoxFq4QrVsZhD+2U
	 YxnCO97qRpFtmArHxmcNf76CdixMnLY+0LUff7xUjpC3FzrO8TODgEq6NsnNMz1v0Q
	 5LtnUiOwysUV0uCveYxXDEurUU6QPhB1x7C43avXEkt37GOznv4a/yf+zt5EujGbHl
	 McGeGFMGMf6dQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C61B347819;
	Fri,  6 Nov 2026 18:48:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH 0/2] wifi: ath: simplify copying a peer's PPE thresholds
Date: Fri, 06 Nov 2026 12:48:25 -0600
Message-Id: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPkg7moC/yXMQQrCMBBG4auUWTvQBAziVcRFG3/NiDTDTBSh9
 O5GXX6L91ZymMDpOKxkeIlLXTrCbqBcpuUGlks3xTGmEMbEUyusgLEquBWD86NW5Yx9jnNEOiB
 Qr9VwlffvfDr/7c/5jty+O9q2Dx44q7l7AAAA
X-Change-ID: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793990906; l=1038;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=BZ5UT6GcKMGhEPdLdsmXEAyHHHroZPYfl6Q6xV+s1sk=;
 b=I6tQcvhYxaQai7bBUx4Hd+v1uXiA6kOGJUQgRMMpWBIRVkLVvt251Nq2uCFN4vH9ElbRhmOM8
 5QePBEhVxl3COlRvD5hSjzIlnM2C7oZ6fQS/vxMx3JlHAe6lXx9a2/W
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

The patches, this letter and the equivalence test were written with
Claude, an AI coding assistant.

[1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/

---
Christopher Griffin (2):
      wifi: ath11k: simplify copying a peer's PPE thresholds
      wifi: ath12k: simplify copying a peer's PPE thresholds

 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>


