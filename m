Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794050922;
	b=lWaeyjdCiIUemPwzWDeBEfnZgUgyclMtuZ//WNnYI4RRYlaQeBH/Xkx8OhB9P/H/KAoT
	 jKQoTZ+bGWiQC92m6vs/k1sc7RjdgY1RUf0U+JwtwNsP/4hvAgtcfdlTDEEP3G6dnn/dD
	 hdNqzFk4Zm0/Cqva1v7+WoYlbyel5FwCm/1WAKB2MpdfBhdOrCt9J6g4VHBNYW868QIdn
	 RsAbdkXa9mRKedsbs0vmHDDn2S5hbUcfNBj37/IQtmrMg91OccJPeiEg11MRuhmU4/FGg
	 DnuVMo30tL+/RmRwBn/VKg1cXCl1o3/gn3gzX13T7+cBtbT/15L0YehTbJPdZdero2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050922;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=bMN0xS1Qi4Mi2/UjeD6b+wbFGalwU2FaKJ15RqzEwTM=;
	b=gIULib1p6zPgKAAQSF/RwRkpmZyrxbxHWOuMUdTU8cQa/WnVzvowKSoXnR8AebV3hvJz
	 upfHw9+9bsyaDtcLnL+d0O7W4xln4i/I9lS3npTEtEY/zTY/QYytkJXMeR4+GiGYsZcCR
	 YEBA2YYO0DzdOBv4+aP9Joxq6lRzFT4ca5EEm/FzDxCc/SrpZAwg5nbnU9nEcT4A+9nHY
	 6Y4VwGWXEGvsHUy2fjSq0sSVevvTHdZHrx0GCpKfCrULagxWWXEAhY3gvEoFXLh5ZgqWa
	 FGNadALRcg8+nE3Ixy9LohhYp2kBWIwBVvb7rKMM2ZDYG57Ar2F45ROZMuOXYUZ1eKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShaTXXRg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF50606A326;
	Sat,  7 Nov 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShaTXXRg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794050921;
	b=uKDXMkehNQVzeUZClpyOUhT+XXS5BNJ6v75c0wqdz0BvPejH6S2zTN1mV/LNBSZQAdAA
	 VR0qtRwXlbpuvWFWZW+YWEMAFnkjHkAmQfr7Oo++WY4yP5DUt4mGn9+/BHyEUYiH+XCKx
	 jUmPEJlSDLahPx1ge5S3B0KYF65h6NhvbhNbHVmD/wp3VfumRag/jxnDIr0SOjFfrVr5N
	 16lzmAIk7nH+CwWWlZq1DIaTgyybWYNFfb+ywsBC16w9yg+wwTdShwphaH7jvQuMRRwsB
	 33p/ZCSsAXOMF7oVCBzimYZfLEKlsggzUtWddb/yDB2ZMxGZPLzxc9ktu6vHplHibxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050921;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=bMN0xS1Qi4Mi2/UjeD6b+wbFGalwU2FaKJ15RqzEwTM=;
	b=UcS8C6X5EKggQ8KfRuHGpsgXG4CfB3U59/UMCNRQX8DwR/UtewHvE3C8zyp+OJWVG14S
	 6wZxcnJTE0b7AxlhW2wcQIabiIb41qNsbtGpV1DW15+y1mRjLKULSKa2Hi52IE8hQUQa8
	 BQv/S+SiGNjw3QYlDp4vFhPyTUvYj3Yv2RAbmdJLgc3uHI0RsbQmT4cNk7mAGXunrc3wo
	 d705922D9TExFSdSn9O1wkd7+r9gOKhA3h6BKLzvUMQaVcLBE1ifgEE1byKlPHXPj7taW
	 8IciW1/LQ69TVi9oHYRbAYQ7rI9QYcw5KnFjI2xgw+14SFNABjjEuhkcNcCnCF4plQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 759A31F008A1;
	Sat,  7 Nov 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050921;
	bh=bMN0xS1Qi4Mi2/UjeD6b+wbFGalwU2FaKJ15RqzEwTM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ShaTXXRgJsBKfOBeOQlF/tHfkDh1x+tAu7W4qNlIMtOWYMkaFaYKCVy2r/pUV5vJY
	 NGOxJrm9GZ9TR79BDCAP+vg/B6EPx53eYSQiY/k4hjOBkUNk793gcRhjWQ/KGjuYMb
	 f2wy0caX4BWDKVMnBvyyUZQzJuyY3WRB/xjtfxnCxXCJlNcbeNrdXdcxF+ysaOLCJx
	 lZTBw/nxCuU8t97C+c8H7L3GcYRjiGHQIHaxgBUPxAJbXCWNZQuxWpJeVQGiYdh2tg
	 xkd/eSe0XiM2YFQ19kNYKJSs0Z/9RW1wsRO8e85HyiC+yoC2r8gJ9/JK39ONSs9t+I
	 +J054QmvMJkug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E886447BB9;
	Sat,  7 Nov 2026 11:28:40 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH 0/2] staging: octeon: cleanups and safety fixes in
 ethernet-tx.c
Date: Sat, 07 Nov 2026 05:28:39 -0600
Message-Id: <20261107-octeon-tx-fixes-v1-0-db03f73a6e6f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtQg4SuEi1Kx5qNhkoI4t2Tl
 o/Pb5ApMWVYRYNEL2eOYUBNAux9hIuQ3TBoqRelpMFoC8WApaLnShlPb6Sjw9jZSRjXk+gPY9r
 23j8TyfwQYQAAAA==
X-Change-ID: 20261107-octeon-tx-fixes-bf70dea7c3d0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794050920; l=1114;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=lcykt2LPE/WQKcgUfJaa7HPuicjvt716I0sbmIoXVzE=;
 b=Am/7jX6++4pD5tvnaGcE0vNJ7RNe7xi8YPnF8TVpfCMDO3Z4CTjnLJ2lLSE1g8d3YpBVBsNYz
 r8hGAV5qIvMDyUKUVw/D5/bzeNgcnpouxLrnv30jlNq3+7MSrKHSkP4
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

This series fixes memory safety and API correctness issues found in
drivers/staging/octeon/ethernet-tx.c during static analysis:

1. Fix return types in cvm_oct_xmit_pow() to use NETDEV_TX_OK instead of
   naked integer '0', and change pointers to u8 * to avoid non-standard
   void pointer arithmetic warnings.
2. Add packet length validation to avoid a buffer overflow when copying
   into the FPA packet pool, and bound WQE data memcpys with min_t() to
   prevent out-of-bounds reads on short/malformed frames.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (2):
      staging: octeon: fix return type and void arithmetic in cvm_oct_xmit_pow()
      staging: octeon: prevent buffer overflow in cvm_oct_xmit_pow()

 drivers/staging/octeon/ethernet-tx.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-tx-fixes-bf70dea7c3d0

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


