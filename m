Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717490;
	b=kXYkDeKehyrdOjjNKeUTy8xsPZVybNEAqawe68gdnn/oezt3hw4PoI1q+awk+vzwu3VT
	 atfbOq7ByhrufVFXLsVoooXliB4FtqzLl/lWUsctecNCbzb/E9uuzMqnngDQVS27ntQc3
	 VG51+KakFlkqNe9H9Gwb3FPE057sRPhT0e2uXXlAA1Lt4Ev83n/1VECARDe7MbaXiHgYi
	 O7X3Gj1MPOoDgtCB1UrT6Ma4uzV+1bJ7wBUNCXncyPQbzlelkeCuL3ZU+oDlVtksUY0kB
	 nyORuIGcggnxO4qDvLYuWGwmff05w37URibfmo8uDYPvuFvdZBXDgQ1Sphwtn5jwNzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=;
	b=dekz73Pe6YlDZp5Z2mWGUyy0NzfMxyVVKl0wJhzjITwI2qoSuzPdU14g2Etr3oigFdT3
	 dVque7t+lmdGlC047FET3VB8eTVxraxkoIQd8W5I78Hm9cgoMUiv2dNDiLXUxTeHJnhzF
	 lL3Z9RcC++yKsM32ioXfEYMpvdImaFS2K2H5yPepA+3KczG+y5D6VvEHPS6lXd4ugeUY2
	 1vQNVsq08IqDMkDentW5Lr8+3IlLNVGX9hDa/7rnpj3sLVhqQlw2jrkcS3K027Y0zy1ZW
	 1KCBsRtT+eBYGay6ysbfYvk82IcPu5NvpeNKSx5MtwTtPD23Mw2fsQuUd7Jbow3K3bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AKxvzUaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B8606A33E;
	Tue,  3 Nov 2026 14:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964B8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AKxvzUaM
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 85DFE20282F;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=;
	b=AKxvzUaMon+g0eGzCnebblLH0CQcxu8Mo/fFmm8bfgtmnb02+x1Vy5RY1vosc/Dw6PLVz0
	iRKifvYEPlj5/s7iWFg1uVg/oUekVa6FeN8gSMs2n7hniuC8liZ/LCHiE1Wayt8dKd+xC/
	0HWs26UU6iYCS/AuSEj8Craj6vU+On1yXrQ0YBdoPrSO4fA8n9o8nX4Fc4/3f9hHBDNBDf
	8+cZj+HpHZHxmGBd8cISMMjBkY2RFlLvZupD3w7qL8BQC845KA4iQLM0RGwfABSaMyZ6J5
	n7gODCunrVoOj24Xg23eiZo6dtn6YfFYG4eNG16MN0XA4aesJAR+xn89xIT2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=;
	b=J1YgoWoR056rCWe9m7gmbluw3/CwDa8OIITK8tjGD2eFfT7dUXhwOEyeIzKBDBbiVb10qu
	LXbERBF3J09rvwzzJrcRwU3I+6y7pxSysu2RCSgU/MmBjduzbNSuaeqUApW9iUtA9P1CYe
	a7EEvwH3mCR/3DMV6uqGyE0iyxRODSLcNpDxJPUY4hod4qkj3ZgaeZYpGjfenWIUybOUQs
	1HRNdsOa0DOm/sRcF7/WyZGp0XupTHtswpxzFMfpM9VET3UYEICYB8hfasa/Zv7ElBAnEw
	2ykIAIkl2V+d1zgGBxaHKCG0HtPZ4ceq9mgR4HWFgtFRwjXH7gKnymwshWYhJQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=FlBlrPWLFpbVGtVUDlo+TNRTijjaKFBomt6Ys7PgXV8sXb/txPBFgyoAcFHzNBCb2O89lZ
	Wi+mJiMIQVCmECccsrtmnvXai0v73WrvlemN2YdULLu8ZZ/cjONxI3GMTIST/HTnwlml0+
	ougMKkF+V0D3D4fJTCNUMcFmU9/3GFRpLNq4rV/OD0gOyyKTwsuueAy1ckCSDjxgJF4V2B
	aWBR65LqU8FwHC/+T+tato3U1QfM9PtfLAoUCvLnAeBiaBLXnNyPb8VkfpuaHYDmHXdh5d
	2BOyqE56pn2OjATD86azrqrGYzQnNR8Ll03qkn96TMoGLWfC5m3eLJwCNgJMNg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-1V;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/8] reset: Use regmap_test_bits to simplify status
 callbacks
Date: Tue, 03 Nov 2026 15:51:20 +0100
Message-Id: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAOj06WoC/yXMwQrCMBCE4Vcpe3YhidJWX0U8JHHarmAt2VWE0
 nc36mXgO8y/kqIIlE7NSgUvUXnMFX7XUJ7iPILlWk3BhdZ7t+cChdUd73FhgxonMWXf5RRSPPY
 HN1A9LwWDvH/h8+VvfaYbsn1rtG0fG+lJgXoAAAA=
X-Change-ID: 20261103-reset-regmap-test-bits-17cb2ba9840f
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

A lot of the regmap reset controller drivers open-code a variant
of regmap_test_bits() in their status callback function. Simplify
them by calling regmap_test_bits() instead.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (8):
      reset: a10sr: Use regmap_test_bits in a10sr_reset_status
      reset: reset-intel-gw: Use regmap_reset_bits in intel_reset_status
      reset: k210: Use regmap_test_bits in k210_rst_status
      reset: lantiq: Use regmap_test_bits in lantiq_rcu_reset_status
      reset: mpfs: Use regmap_test_bits in mpfs_status
      reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
      reset: zynq: Use regmap_test_bits in zynq_reset_status
      reset: tn48m: Use regmap_test_bits in tn48m_control_status

 drivers/reset/reset-a10sr.c         | 8 +-------
 drivers/reset/reset-intel-gw.c      | 9 ++-------
 drivers/reset/reset-k210.c          | 8 +-------
 drivers/reset/reset-lantiq.c        | 8 +-------
 drivers/reset/reset-mpfs.c          | 9 +--------
 drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
 drivers/reset/reset-tn48m.c         | 8 ++------
 drivers/reset/reset-zynq.c          | 8 +-------
 8 files changed, 11 insertions(+), 53 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-reset-regmap-test-bits-17cb2ba9840f

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

