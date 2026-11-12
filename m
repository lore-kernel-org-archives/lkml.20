Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454210;
	b=hXvo3ZIOXR8zo4ICFgI8L6YrBqkrHAv5qgv5xvVSJW9EspsW8bgiDiWXoh8qj0bsiaS5
	 XD2S+e1b701Kydupt13HYieSVKkYm1pAB4Cr+N+aCumG2JwGbxQ8iPYQDxyidW2Jyg3rZ
	 Dymh6M+xsAfPyGFasWmQ5XKvaThQ8ANjbjqW7Hp2F5utAOCEkLP3Hp45qL76QKJyvglVY
	 s735urSEzQGgfwcrqKdXm531m0LFYhhq9pVIc5r74TwUjBB4cWDG4jm8oNxwfuWpPdghP
	 6pyWfvjEfkLs1uwubK1wUe+nnOLNB6QIP2/lIy5vdfoPixFcYH48mNX/H07n8wZ/yeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454210;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	b=N7k8H9MuK7in2mkX6/OXrK5+hYiz+0WrwBpOYQcfC/j4SvpMRO/KUeDcQ9Q8D7KXTyl5
	 5zy82/3SVrtD9/atGKcIF5WdqWKJtHVz39hN7FD4sa1ermxobrkrHAZ91Tpn/uoDzozMC
	 sUFGwQaoJ5dTIHc3EBO8Oy2YCLZohBz5KZiFoMfRjDK+zV0WateyXEdy8khtL05hLvIhK
	 ZtlgMUI0kJ8VoRaubRVGr3khWsk/k+m18mCE3PWgQi1KjIv2rd5r6NheiTDFnTiMRqKSE
	 +8hfG4Z96OUeNpPJgViIE1cV57IZL+MUVnYONf2I2vowt16JnRu8w1BBXFHYNdwHdbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7bNK6uO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AB606A31C;
	Thu, 12 Nov 2026 03:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7bNK6uO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794454210;
	b=2Iao//C/lS+18Byq201Ln1ZUBM1XcOp0GGLSXmBYf1SD3IBoZX8nztpE2y4Tm9RuuoCQ
	 1BMIFZ1icfE3ubkw8V8Tz94en3XT4tUZmr61rJLOQDp7MhZotcwVmRXL/51HNBvDgf/au
	 EUokJzvpOmQZ0r6j7KhQAVpWPItGth0gB/P9i3kNPZrDXexxM1GBu1254+MfiaaVCjXYs
	 x1V3sWpMkDUvp0YKVKsdRnTjxFlnMe5Lc1itz9pGevA+lioDfVPeX/zsQtZtcJY/wrxgX
	 6OPcLx/zfV2+bdbPAFjS9Or0dj08GolYhYT+win13yx9lyxfEd7izbxHv7ti3SHKgeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794454210;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	b=3faDDC/9N7H5U3W5MKx/MSnX/cvUVFmgKfk6puZq9NHyjYo1tOqhI+VR1XgnDsAAkArK
	 MGxnf+GVZNoPluS3uOcpoyN1m9A2NcBTzO7rLsjnjOWZHTElvJ8xWIy5YTYm39oIvRZN6
	 KxZHh9kYtQff+TNUBiKJZ2rDXY94RNJScpUf+JfUk9WM+lUUwRbyJT2cBQPCWTH2i7EnS
	 Ue93FjEL7hwoObGU9GGTj2DOCjKlxvf5fcQv/GBJKC3y69WlPhindAwSVrfUqClK6WNce
	 Z8ciSLpJWot8XAoLI02tg4VlSXtu8ePLRPz+CdYdQVyjMWWimvowwoydtoiBWLv0anw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADFB71F00A07;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794454210;
	bh=3GgvPJagE+zuLdLjBExn5vDk3lJnEMFjBQK/8H8lWUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b7bNK6uOYtgG8uR2DnO1KBYi288HwLBNQOsj82fEmTXTYwagtOeRgtUjahM2+TpBd
	 rSDPWnbWqPuU7f5EBGL0u0mH2kLonasmhlglanPZNGe1axCxEDzjcZS+tIOpn4aPvr
	 CEkS1EMwVUPIgVGOguT77ThldD6G2R7dIQrmBThhI6EFFQpitfQAsH9VcFfb1vG4Tg
	 AZlBQYJ90HUSJ1id8Zh0VEb1PZJBd/bikH0d1XkXmCRYae7R/Nk1zT0SOvH2qWneoi
	 9sqTKZ0VLnleIgYYyrlXoNrDYsdXnUp2VQrcKSi6mIUeUgTP3viIyAOHXNqxSaJCCg
	 3RvgUxh1FtTOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 21F9A49244;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:29:57 -0600
Subject: [PATCH v3 1/2] staging: octeon: disable PKO before device removal
 in probe error path
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
Message-Id: <20261111-octeon-init-pipeline-v1-v3-1-e5581974fae4@gmail.com>
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794454208; l=895;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=VKtuoP+mIA1EKBGbewR+SjFHAmuHlZPHPWfuOFozPpc=;
 b=FuGbkZ/TvBP+Zo/UtEFGpfgkoU5e0byqbOTKIc8AXUZK6bw52HzwEEeE1229xXvthNdCJ9CKx
 afLJOhu8BMRDOx51pgDlC8ShG/E18VnPkwJCP0auywX4nnsjjXZKgsx
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_remove() calls cvmx_pko_disable() before removing devices and
shutting down PKO. The err_tx error path in cvm_oct_probe() omits this
call.

Add cvmx_pko_disable() to the probe error path to match cvm_oct_remove().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..c77678cb351f 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -959,6 +959,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
 
+	cvmx_pko_disable();
+
 	/* Free the ethernet devices */
 	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
 		cvm_oct_remove_device(port);

-- 
2.56.0


