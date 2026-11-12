Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794455324;
	b=iEvuQtuT13uRYLaHYfYOVwsJ+71OOQnFlrUAB0d6FSaEEMX7s2DD6LRBwPPMfFfkqWv4
	 tzhmvaDpHf65vjL2qJG97pX8CgblPVv53uwpgTLpJ+1iUOraP6p81BNv4vxDZQfELbtG8
	 biMLXZnw0P35x8n7pRTOJLwFwr5Fio3DqSCiPzQF/Yb64H0Dzlu1OVZfyK3VWCPFDPO4x
	 8YlLplrcOv1hjhnLlFUv3Ga0yxa7iMvcQzV5RcYMJygjUyNIMVU62HAPE2d37q1cZ3XbN
	 vKY4iyrzXemqFZsCSLmLwV1YTW7zYpTn9b8B2ewJoqXd12BJ3ukZLnfrDdV6HyBHgjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455324;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uClz2HfIq0EkJ04cssLdIs6ZH5vakTNOTg9TTr0zwWY=;
	b=akytZ3GFgtrKuuoO0NHdj+mQsxNrcIWTk/aORFcssD0koipytr8f0Ue7t2h4JrrQAP4y
	 dYHMa2xCImwRiOc5JSjq2624FccGvxb2nIsBtRrJXNfgHuU2igCoJcerWGcziqqfK+wkJ
	 D9qa8hZY+fTKmobijsYfgBwjby+iQhZ9vpsZoEQVy++Sow3tge4Nxbl9MSeK4Dd9QGDYw
	 iXJiq/YQZykgb2SIPZj1mIlScF7Nvjpz63iTFu5uQWR2b/ORjdm/qIq8re6AbwicDo8qA
	 OZqOlWyHq2PuUKlXzidhXqAzUkR5MZEEsO0Y+4B91cKrRl7PprZ5//CRTRV4eMgRL4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG9PRfXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C5606A332;
	Thu, 12 Nov 2026 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG9PRfXZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794455324;
	b=dpuVB4tcgejVI0k9RkCOe1YOYCsayS7JKgNAizgSK7D6+UBAiUEcBYD/9Jej0GVeJ1PF
	 wm625tftTaBK2a+qeZrI3cu7Nn0HfnE87JVUCT8kCpPDS0gGi0BeXiBQKx4vKZM6aXYey
	 r5UOWLRiYFYvqXM6C+QCcOPPpUFOyatxvhiC3bL4PExJBXs0spnjgihHh3n8jiuSNGWrd
	 ZQMI7IZ7c3jrZYUWonz0Nq5G15PKc3iQPGLyzgIOHOMqrK4792fvajXCcCJUDlX9E4m2B
	 36Y9ETLBfyKNjVb1LZpjXtDz1WOxpQXoxlAmZKisd6njYSnjfsnXcq4hn8cUrRFhdxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794455324;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uClz2HfIq0EkJ04cssLdIs6ZH5vakTNOTg9TTr0zwWY=;
	b=rTTx99JU8M2sDgSNAKX6PpKUqJO63j18Kx/s4iAwRgzSA0o5W6y2SyGKLFTVyMFIu482
	 jZev3Lz0upKdO1pMUdQl0DeOOEWJz9rKRhXzAtYTjmsbAA7ASONsdviXjrOa5orICd/2P
	 r0D1twNiiWAhe87mteOeV6PwE4VTFlnN7goKxXmKrx9FNNjWF5uW3yZKGHa+hET9mDnME
	 gR3f9pN9XQKqdgNcnOPXYjrnw1SiwIm/YM9L0q1Ybmq//3EltgdeFKDrSjCGJ7ZTAxRVP
	 fiVSXLFEkJh6hajJI+9bkFmVZIqr+Tdryrnid89UZMnmG9nqLQqMUQcrxnbEmkH9jvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA39E1F00A06;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794455324;
	bh=uClz2HfIq0EkJ04cssLdIs6ZH5vakTNOTg9TTr0zwWY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZG9PRfXZT8XSOJuzoa1x9g3NIvoLwHC3oHXm5FPrghY6ZFXndiPJAiCttjgv+to8e
	 BAOkM/Lhz0nWtl3jR4bWhI4Q6g/SWkfFmEiZeWihiTu/j/AROJDpmlHX0jNYmI8dd4
	 zScYTGGxIgKgOUS9h25ZoNXe3KgI0deI1mjohoiKV2l2quJIrbbwQ2+6KJG+ZQGvg6
	 Xus51MbDgoWQJAF8q5CmvPc9R8yNCFtiK0UbeS1WjxaxiHL5oKhHwZRcSBTmxMAxm8
	 jpGLV2X4Hddn+r1FtclBx3WmI1tOtS6oN+xaDWaCVn0uwvxEnDDAGp+STkMehHsCmo
	 heL9bv3hvL57Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2DEAB49261;
	Thu, 12 Nov 2026 03:48:42 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
Date: Wed, 11 Nov 2026 21:48:31 -0600
Message-Id: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNwQqDMAyA4VeRnNdha1vtTnuPsYProgZcK62UD
 fHdVz15GYNc/kC+LBAxEEa4FAsETBTJuxzyVIAdWtcjo2duEKXQnJcN83ZG7xg5mtlEE47kkCX
 OUCi0WnbSYAX5egrY0XuXb/fcA8XZh8/+KPFt+9/MUzJ8CKutUVrU5tq/WhrP1r9gM1N1cDj/7
 VSbo1TDTS27FuXRWdf1CzsENboGAQAA
X-Change-ID: 20261108-octeon-init-pipeline-v1-e25ec64f49e3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794455321; l=1217;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=pfWq9ciDcNTGRqmqjjmBm1Xv8yHjO6TCvax7c9j/9Ic=;
 b=/dqSCqxog6vMel5jfAcPKvMGn2qelPeRikBEBJDEhqQKuyLWo5BUM++uzPbZEP6q26FW0J4u+
 sgU5qXdMn9GAbDR8v3kDJleOFHHjH+zxBXfERnnlKiWX1uuUll0PlX8
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

Fixed two bugs in drivers/staging/octeon/ethernet.c:

1. Call cvmx_pko_disable() in the cvm_oct_probe() error path to match the
   teardown sequence in cvm_oct_remove().
2. Split pow_send_list on commas using strsep() instead of matching
   substrings with strstr().

Oscar Alejandro Sánchez Lucero (2):
  staging: octeon: disable PKO before device removal in probe error path
  staging: octeon: match exact interface names in pow_send_list

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Changes in v4:
- Build tested on mips64 (cavium_octeon_defconfig) with W=1.
- Link to v3: https://lore.kernel.org/r/20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com

---
Oscar Alejandro Sánchez Lucero (2):
      staging: octeon: disable PKO before device removal in probe error path
      staging: octeon: match exact interface names in pow_send_list

 drivers/staging/octeon/ethernet.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-init-pipeline-v1-e25ec64f49e3

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


