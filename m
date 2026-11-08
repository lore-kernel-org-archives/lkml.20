Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103680;
	b=5scZT+JE03AX7PIuGXgin6QUSpLf0S3UXvSErNrbGs3eYWbA/Lrd+XPx76ZmnLtAXjaA
	 GJSW3c+RR/f9uvbpSr2ar3qWY+mvnvRGv0Vcm0is+Cotb6ikpaTtwdYX8AXwaEK7e/z/n
	 PTlvlVkhNprr4+MqrHbqF4doOFffjk2AfC3xiB7RPAq6BvCxM5yTrDi3arFlxUL9yPdAs
	 Ept0a6evzgoQYteOIyj0VQpoLLxbMqnb/3DYAWLqi6cKwYA4twK8LquusfEr2FStYBmPq
	 W7KBJ9szVdelNaalt7IuhIQ7MobtyJk1fTZy7I32Q9A4DcxW60mGEo8RC3lgg5KlNVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103680;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WNOIrPh+dVcWOoxYW5/NAgs77q18RwOOFMz+Qz/t4yc=;
	b=kQ9n2UjCdTW+eG7goSFxOUgfw4zk9fCTE/z3ayba8oXRYPnonZVw8He8eK8nWAgwK3fA
	 Mg9RDZf4WtPMsXFEOyZJGsNx0I1l9/KQ2nTYz9w6y+3hdh/2YB3FDH+3bLqsZo4lqQ4BZ
	 coYK9lUSlIGzsEqAk7uOGyK05uEXvIi4XK49Fp8LZrrGJHIcY2HTrybopVObx1r9KxjR2
	 IZeO+e2BLWrgsE3cAn69joobPR8jF336A1SlBNerAYf+IRfPPCsASKpGDnk8jzY5HCsk8
	 s2ycPB52BW7hBUrpVGRreQK9r4cdIHdCZYJOPGKc9EAvpVJCukGK1xTHuY73SG0h0XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXLDi7I7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D968606A31A;
	Sun,  8 Nov 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXLDi7I7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794103678;
	b=x1sTGdud9AHVVlopLiRgkK52LQ2hVwlqPM4BmzV1NRbEMOjq81oG2FTKyLNWzsKtJhrA
	 G+ZjpauPv6bdI3ZUbK2RFZbxeL+pLs7QTPVjL86Ye/htNqRrKXMn6mgPD9FT/lOuw6bn/
	 6bMpYgIdYBq6SDLz/siFIjSe8Mho43f4Wom95e+4noiUIDPVkIc6qsFtwWeT0VupKpysA
	 /67e+04NoK2tIB4ZHpebekJ51i8pl5J9RGdPI/fK9Jnz+RJdY9EaF6RN7kHB5m4jLtlph
	 IO9+SPUcTh9zp33Mdt6MzbFKVgAnxzc8iX2NzhARwdE2HNCUcnNsmcqaO1Xk2rfwiQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794103678;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WNOIrPh+dVcWOoxYW5/NAgs77q18RwOOFMz+Qz/t4yc=;
	b=f7+0yuVJHf69IaQPyEnWwvmMZut0Pxyyo9Ot8VwUoS0S/9n7QQ9G/30Z/K7K1hm7kB/t
	 MHRTMrkDQ1PfQ/Im/HwJ6NrkqWH+0gjJiyY2RMw3N93qgjnKRsHUYlOYdu0ASj59FpGv+
	 1+3mfmt6TBYvpFshcnplLYpDFnx9OpFdUu8D8a3eot4aplA20sWed6Gt3RJy6ZXYNN+//
	 0UV09tq4wMv6wV0tp+Gx6CNkOuHArywfBWHbkLkhLQqhkkJQviYsFAXqII/QnaeO3xdY0
	 yQZhjhShucqI50ryRTI6LpD8UeLKZJcnNuHBrdzjvtIw+itQVK5Wr3vWVwovbP7dLiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4FB11F0089F;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794103678;
	bh=WNOIrPh+dVcWOoxYW5/NAgs77q18RwOOFMz+Qz/t4yc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=VXLDi7I7halqWPYd8D2L5v1SEXszo8KuyVVn5knr9Cejvz8kOQYYuLkQsbJ5p3ist
	 45jb04oSnzzIFeifg2m0dtZKVdPaBHGEHxkE337HnXgFUn1/MuqkuwJl85mBing26S
	 VkLWksJHQ64XFG98s4V0nam5+midBtGbwO9ybN0T89lmXz29witA1HFpon16o8Y61Y
	 HR9oZ91aR1e68FXkIwp4nzjgKdxBu6AW11klbE6H0N7t0bMRFpzavWKMjk3DG6fyOX
	 qas7kdqMyPFyLgdymtSMSseM8oYCmasJ0SSqeOqtkT7Lt4XD5arc5q31wLCvw7jmJ+
	 PNRu6h8oLYoIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4284047D9D;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH 0/4] Subject: [PATCH v2 0/4] staging: octeon: Clean up PHY
 interfaces and fix race conditions
Date: Sat, 07 Nov 2026 20:07:54 -0600
Message-Id: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avIrBtQoYSuEi2yxpyNikYU0t2TW
 v7F+xUKZaYCo6iQ6eTCMbRQnYDVL2En5K01aKkHpaTBuB4UAyZ/40/x1OjI9tYsSm69g0ZTJsf
 Xt53m53kBR0ZPVGYAAAA=
X-Change-ID: 20261107-octeon-phy-series-v2-feb5b7a10d5f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794103676; l=2143;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=v1Ib2YX7z7cOuwFzAUWIynBIV1qydc12UgH8Jji2kcg=;
 b=UFT5vAyrlET82+eVIbq5Lj4REzY4pffvSd3SB95Ey75CjM87XHHqdiTcCAvwrNL+MkAcO/qdE
 4dRoOV8FaBXDw94teMoaX3/qXzYugR3B30wZ1BO6DMBBuxR8LPUlaid
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

This series provides a comprehensive clean-up, documentation alignment, and 
critical bug fixes for the Cavium Octeon staging ethernet PHY interfaces 
(SGMII, MDIO, RGMII, and SPI).

- v2: Consolidated the individual floating patches into a single 
  well-ordered patch series as requested by the maintainer.
- Investigation: Patches were identified through manual code analysis of the 
  staging driver directory, inspecting resource lifetimes on initialization 
  routines, checking error rollback pathways, and reviewing compliance with 
  kernel-doc scripting definitions.
- Testing: All patches in this series were successfully verified and built 
  via cross-compilation for the MIPS architecture using the mips64-linux-gnu- 
  toolchain with explicit W=1 compilation flags, ensuring zero compilation 
  warnings or errors. Style formatting was audited via scripts/checkpatch.pl --strict.

Oscar Alejandro Sánchez Lucero (4):
  staging: octeon: add kernel-doc to ethernet-sgmii.c functions
  staging: octeon: fix OF node leak and kernel-doc in ethernet-mdio.c
  staging: octeon: fix race condition and log macro in ethernet-rgmii.c
  staging: octeon: fix IRQ leak error path and remove dst.h from ethernet-spi.c

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (4):
      staging: octeon: add kernel-doc to ethernet-sgmii.c functions
      staging: octeon: fix OF node leak and kernel-doc in ethernet-mdio.c
      staging: octeon: fix race condition and log macro in ethernet-rgmii.c
      staging: octeon: fix IRQ leak error path and remove dst.h from ethernet-spi.c

 drivers/staging/octeon/ethernet-mdio.c  |  6 ++++--
 drivers/staging/octeon/ethernet-rgmii.c | 12 +++++-------
 drivers/staging/octeon/ethernet-sgmii.c | 12 ++++++++++++
 drivers/staging/octeon/ethernet-spi.c   | 10 ++++++++--
 4 files changed, 29 insertions(+), 11 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-phy-series-v2-feb5b7a10d5f

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


