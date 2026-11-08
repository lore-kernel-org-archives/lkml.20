Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140644;
	b=rt2vaoU+n+ODpsHabs/nJSmOzgO9plQaS3DE9P30c+uLb/HXXeXcIMLv30IKHAtrTotD
	 wUJ98G70rRx8rFSxdhytiecfnrF4cl/dOtLA4bZzpBF3qzENdmug08UCq7HdBHt4wpqjh
	 19DXIMr8B2B1Cp5JSsiH7x5PgyUAPzLITL7xyPJpAT7T79CwmmKUKFkQqwDBQNzeDX7Lp
	 XFAQvOXOHO2XY4g1//bkmhEHgFdy3hp9nPtlGhMSl+x4UQKNUP6uMK1rr/6gvWod2bb92
	 +RIuYNyKuK3hVUMzIg0ds8x+q+wbbee6R6xPcy18j9TzHZBzJa2gnnEgNkSAU+w4oBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140644;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cyASq20VacEbqgSPtfwb4M6FLhNHJAnezEl66KfUn2M=;
	b=zcR7Tlf5bRErpFVWIyp3aCOibGivK3F4qeI2yWjT+G9TKPwt4SWnmLJaSLGag5fKqGT8
	 xHTh/qfdCbv3ZHUHygjtUJB0b5qmQRRAfPt4MGKCqoG9N0wMYTzF2hawjvYHObyAZ/FyH
	 L+kQPb7SRL67JdNEN+eDT8YindMdMuKjt5GsyC9ulUbKIca4uIohGLblfssStbcsyoycW
	 Xdor9LRf6JzThULZpH4yT2C4dxEbnRNBlQQZzoURvYoG8xg7jll+kymtluJbSe6gA6PLd
	 0adiIwP2WGRJYz0o12P3AdTqzCZmC2W3NoKApnk0WUPWt5KIfTjKOwS/6EwPbtLyv+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6ajiSkj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E9606A320;
	Sun,  8 Nov 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6ajiSkj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140644;
	b=Y53FJWNczbSDpep+BMNImKep39DG0HyKBvifnhpTJlqCuIp/Bz2F89EPwUgySFyR146V
	 VR074TdHUBe+eEBJ596gPKNjXJdBafKKqgdsDy5ulZUz94wN5QEi4AZUGyHZvcI3vhhGg
	 +h4YBDclFdRpmKtRKXRRDyj1dPqx3SgCwNUE4e2m0vfq8HebBCgj9sUoJzmdKPK7uIQqn
	 NEPmHH4QeYj6gwIHES4FS6uKR8LJq5VO34nqB4VNxJPDDJlfimvZTbUjHsi+tisZBkFTj
	 lfAkcnd85lluawUrJEIR2gm/0w2X/8Vnq7j5c2j6jDzt4+SGEXKCd8qaVHs4hQR6g5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140644;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cyASq20VacEbqgSPtfwb4M6FLhNHJAnezEl66KfUn2M=;
	b=pzYi3hQJAOMVUxuJiVITIyHFVuygigdBfG6/Za1dvspWlYXuqWJyPW0/0YJYDRo9c1Cz
	 N1Q1WIaWP31KjfUGiNkplsNLBmBH25p2/1CyZHWUh8wb8CnIUXfdYQxdYtAnf+zEMiHMQ
	 l9SOLmGJUNQHuVS7ghqHz0rFdDUlUDI0vVpu+H2Z/XvThfkQw4AuZubz97HVvXahOXab/
	 n3wyp9sm0UAVEwTIgpMQ4qBCRcXWKYARfYcwYUo1jZD7icQgIJR1cLlT5TbxMeYmhQQqQ
	 XY3nGwXFp+ZbExpdlNdHxh/tSI5J1eNXcxuA1dN5ANzJbYr6XUJKkKH0FIVt0udDDyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72AF31F0089F;
	Sun,  8 Nov 2026 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140643;
	bh=cyASq20VacEbqgSPtfwb4M6FLhNHJAnezEl66KfUn2M=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Q6ajiSkjNRiBwpEh0YaeU8LgNZS6nTGTcRRxF4yfprHY5QiJ9qnerOzFvZc+7mZsR
	 ia+5WxkQJ2IJ+8WdkzrOD1q+lL+QpA/rdPVoQjMUgfkHedY7KxMn4JGFrYKMgNjz6i
	 K+wljm166FYKI95/LXX6d8gKhW9/3dGrn9d1vXkUMic1iCzeuLJtSVb+k2PjAjBeWV
	 MRKINlBA53dHj0kWiT7GfNrO74WCvTqiuxdzfD2tibvXbyOkw1W5ZEsQSTv13wkKUt
	 +fNsKXpxDzzoJDub+NASUQFrnrMG/OmbyPuHzm/qD9P+zJgm521CMu3w9c/ReNJJ2B
	 sr3wS+6+FhOAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E211F47F31;
	Sun,  8 Nov 2026 12:24:02 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 06:24:02 -0600
Subject: [PATCH] staging: octeon: fix FPA output buffer pool leak on
 teardown
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
Message-Id: <20261108-octeon-fpa-leak-fix-v1-v1-1-8ea4b4976e02@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsE1KOsr0UFsraXQ0Igg+nvSc
 RhmHsichDMM1QOJL8kSQwGqK3CrDQujzIVBK90SKYPRnRwD+sPiznZDLzdehJbmhrjvjDMaSnw
 kLuYfj9P7fuEAGbRoAAAA
X-Change-ID: 20261108-octeon-fpa-leak-fix-v1-a1d31e978c82
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140642; l=2805;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=LVltFzv/eUf0u1BCcEuxVG63HkjPUMXDzQZFjGfzGhQ=;
 b=TqtPz1JVrjyTQ2MbX2MY/hdvNV49XlEw6KlxqwkgXn18sYVBPuYXxDC4s07aZCxwm/1DjCLIt
 Jc9iy7iCh9QBLt9XPza2JDUqd3pBg3l5FOyeGKU+dfRU9Ey9zVE0VPX
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_configure_common_hw() allocates 1024 buffers for
CVMX_FPA_OUTPUT_BUFFER_POOL, but both the probe error path and
cvm_oct_remove() only free 128 buffers when calling
cvm_oct_mem_empty_fpa(), leaking 896 buffers on driver teardown.

Define OCTEON_NUM_OUTPUT_BUFFERS as 1024 and use it consistently when
filling and emptying CVMX_FPA_OUTPUT_BUFFER_POOL.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
This patch resolves a resource management bug causing physical hardware buffer 
leaks upon driver failure rollbacks and module extraction.

1. Introduce OCTEON_NUM_OUTPUT_BUFFERS to consistently fill and empty 1024 
   buffers within CVMX_FPA_OUTPUT_BUFFER_POOL, avoiding an 896 buffer leak.

Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: fix FPA output buffer pool leak on teardown
---
 drivers/staging/octeon/ethernet.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..a74d122d9bb1 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -29,6 +29,7 @@
 #include "ethernet-util.h"
 
 #define OCTEON_MAX_MTU 65392
+#define OCTEON_NUM_OUTPUT_BUFFERS 1024
 
 static int num_packet_buffers = 1024;
 module_param(num_packet_buffers, int, 0444);
@@ -162,7 +163,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				     OCTEON_NUM_OUTPUT_BUFFERS);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -974,7 +976,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      OCTEON_NUM_OUTPUT_BUFFERS);
 
 	return ret;
 }
@@ -1009,7 +1012,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      OCTEON_NUM_OUTPUT_BUFFERS);
 }
 
 static const struct of_device_id cvm_oct_match[] = {

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-fpa-leak-fix-v1-a1d31e978c82

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


