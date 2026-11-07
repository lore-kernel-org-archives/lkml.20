Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049607;
	b=mW1X8Q6U78i9fbpSv1RsYD4No5lNNH58VyrnBYqu/0vnJwVSHZqD/xfbkDfAnwAdig6m
	 xinNsSVx00rsUqCim8lVBd6BdPAhtfRRLQ93ZMcWYS88TDr0n4/ZQV7QPfkVe25S5z/Qy
	 HbJkJNOaFDZ36UnMVpVaRtcqgLwwlH5oRWMZvzUq9s4Lu7lMQJiIAwF8H/5eiBvDd+py5
	 6HAaP+05BomSoE/THfu8Ye52zaLoZQuyJo618TenVVVIGS7T3hmsL2gu+8w6bKcyFNPZp
	 /QOEp0iJEMQpjTcIp1l0zB+8gMyVe0Jqz8CYQEaxQ8rpUjJrHCxdAGrT8Xz5TI1HSGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049607;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=iMP2YyuMe7UktcyF/sciQvPwaIqucF+auYLHeoLrpR0=;
	b=CGfNc7Yvb1wxw2Tq2FGkD+LdCTOMYwurczvKmsWl80xKKlLqWMWU3va7NDzmgM1Gi3vc
	 Wog6iMvrrpZ+OqaKQdhkw9rr0gzAlLbdZ8ExmJvTzuPnrRHvE0vgL3+Lgj1OabUbGAvzg
	 B122OUsSsdDe96Zb4cHOCUR5Vrxh32Yc8KERF8dM1Lcsus8FKgPesWMVrHmeB/6EEquvk
	 qifz1MxblldSRbJuY+zb6VNvqzOrowgILp3/Ufbw3fF2jz6VBI+FbUqS+xps3NCDtHZox
	 dHlMIeZeTrJMmT7QBIqVjahqMaPcsojK1hlBV0XD9MeEmSfPdPfALjn5ukf/Dlcx8AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sbggn1q/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E979606A338;
	Sat,  7 Nov 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sbggn1q/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794049606;
	b=rKEuQp+SKUqUZvMjA4u/TdxumSr3PKf3IlJ7XjiKV+8J5FDbp30EGnMWm5c3xkpwFeW1
	 DsMEgHvXtsrigpioigBuWt1rLaVqC7hwmW7gpuBsGoHxSejTnSkWCxhPhv/7XGAY3xyfs
	 6JPr8UP/w+F9keG0d4+0movxC/TP0N7G4A4+rS8FXAxqzUmtN7/olmJhycT54hx13YOIY
	 EIBYW6M9MSUa9BSl6ejgq7NPcI+3+NzkE0J0vTiIarohhkR1UVibZk4EEjsCAV+M5dQ0R
	 ehD5zjd1lYupuYvpgm2GQ/I3zf+UU/NfxjjefoSuVbSFonSm8qef3/sLe4SaIsPzpNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049606;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=iMP2YyuMe7UktcyF/sciQvPwaIqucF+auYLHeoLrpR0=;
	b=gl1jqd3XlWumGZGUN4AZyaa0CctsWLqvobkroieurh44IfpS75hhhHBJjFzooocurMZK
	 AGsK6T4vZp56EP4a5A96n0O2VI+WSFIVN6rCA8TPZ8fEgr4UJXs2OA7wzF/BasK9VS4UK
	 mLbYQuuYmrjKdgcaKYXzxgpI64dPCq9SCHtRyLVAWkDqX0d1g9DkeTCRJOyi+ojhE4kp4
	 2kHKBvb87FJasw0IYiXqUukBnZdKI2CnW9bAdNQalzZK6sa/mj3uTIQhMjySvO2BtKeMo
	 bww7YAcxM/EYe7bIuQw6/6p977bp4y+gKDrdhh7lprhIvz64grqXAphVQ+kJuv6K7Zg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 681801F0089F;
	Sat,  7 Nov 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049606;
	bh=iMP2YyuMe7UktcyF/sciQvPwaIqucF+auYLHeoLrpR0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Sbggn1q/MgrB2v2fLzgmFbL3eJi4aECGtiIomwmFg1MjEmqUVhMLUHozGdmQPp01H
	 bil28XEZ7I67Kjy3nxQSiw6C1+FKBLkX9+zXJ+KjzdU9U1W+lXhwPhRvt+aNsvyTNX
	 QZ8XqJjT8etpURsr3qbVgDYT42F/CbXyjk/xC3uRxJHEEKPk1UtDRJ2163PzMYP08P
	 u4V38qCbuam+gAeqVnhCwLc/ShyqdfMHEUN3UM3fzHVyQ9Q15Pdm0Y41iO822UMZ27
	 BOJU2pi/enT79hRNf2CWoG7TBJiercAVJXflNCZo6CZoqaola81e8K/WaCKk6UEHP6
	 EtnaJgkyvXXAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8EC147B6F;
	Sat,  7 Nov 2026 11:06:45 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH 0/2] staging: octeon: cleanups and error handling fixes in
 ethernet-rx.c
Date: Sat, 07 Nov 2026 05:06:43 -0600
Message-Id: <20261107-octeon-rx-fixes-v1-0-f5a21907c8af@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LSwqAMAwA0atI1gasaP1cRVxIGzWbVlKRQvHuB
 pfDYwokEqYEc1VA6OHEMWiYugJ3buEgZK8NbdNaY5oBo7spBpSMO2dK6Ds/WNV+dBPodQn9oNO
 yvu8H51ZF42EAAAA=
X-Change-ID: 20261107-octeon-rx-fixes-d4d7620258c9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049605; l=1019;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=D5d2ygIHv0epXdIMouTlsArAE5BONbBw3JoOcji/dCg=;
 b=hV4x2eerX2c4xC+Zhauxt2hWbBfMDcy8r0HLBMkbIZai01KEPQthaiicNiXHOaUuxw/8125R4
 opd8RYziaRMDLl1RSP1Ctssj5mGtZBVCYZYt/EYeWnit03xSkVA7691
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

This series fixes a couple of issues found during code review and static
analysis of drivers/staging/octeon/ethernet-rx.c:

1. Avoid non-standard GCC pointer arithmetic on void * in cvm_oct_poll()
   by casting to u8 * first.
2. Add a proper error rollback path in cvm_oct_rx_initialize() so that
   NAPI instances, interrupts, and POW/SSO registers from previous loop
   iterations are properly cleaned up if request_irq() fails.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (2):
      staging: octeon: avoid void pointer arithmetic in ethernet-rx.c
      staging: octeon: fix error handling rollback in cvm_oct_rx_initialize()

 drivers/staging/octeon/ethernet-rx.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-rx-fixes-d4d7620258c9

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


