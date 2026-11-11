Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436573;
	b=e1gzwsBiccCvaPOiCLdKpe13Dj5O7RdXerarDFsN7NULO7SUrSxiyF+WusifuQkOUgcz
	 Ltk/RhvXiEtA+FsnLQqYtjOtimPX7eztoTdCeWTGLuaN91ROBHN40Xq4oFOqM5fe5oAvs
	 eby7W9agNOHiHEl6z+rLMT+cp1o7Qt7N+xyTNybfHwmPxXx49URQ0mXHnmz3bLkn6N+e9
	 Fj06+HH1zrZLtpE30HTmce07gCrihQTIbz5wymxdujo1AJnjU/lLpHs0cQMCxGe+zC7eU
	 LS//OcGHmBzXZVimVQzyz1NCy8kSe+1iU7Z88toAggEqSsvrzvKjlB/3pm9Zd0dkF4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436573;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1ZawJBPyuBDiML0n+1bmU5TYwAzwZ5CqAMTW269qMUo=;
	b=gDHab5KuDKlY7lBYjlsDO+ebGPQ9OWHIUGRT3kkj/U2jBnvDHtavY7vTD0YZvlFR000D
	 Px1MQiwM17D68Ih6JySRN5ndqQW5SNuMmbtlnSH5Pz3wvfdefib+RRgevJiobNCtjRKM5
	 L/D9jXFnvyUCYn70MWCQNqn6myGZwFqplOfoFuB2vkShE+FNH+59Sk1Cep/iUu0cNGmPQ
	 lpPFgO9em6EOQ482vwp6qI21K7DlQTCf4LQRLoHlG5c3jY+UEtNyf/P9YabnGKVrmlT8y
	 tuoNXZ42CwsdLcvk/uSRKs8BRKa9c74GZWpfzMerhWXQWomzzVqyYqlYJFHe9uZDkSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kd0kXE5A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA40606A321;
	Wed, 11 Nov 2026 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kd0kXE5A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794436572;
	b=vUv64cBvH8+IsJ1/MWTHCqJwQIDMg1/dAazIYMTD6FsZe2Wxh4cDKQhPpZarKwy0vn25
	 rpmJPE69iwjzjipG9pZTWbMH/uJunFONFte6cZUOipk8PrzXgYT/ao99H3z7/UxQJbBPa
	 qSXVOqktNTBzoIwAoJ7r4e6Ej5aADkdOeTdJOF3o0msTFtBHRI2z7+DXLtKXO20oq9mKg
	 bgWvJvgOS75FIwwLTO8hy9gLs15hisPZZ0qh8hk/N50r/JcikK7x5meaWn3X4XwSrNFHY
	 viGBJnPwxma4/G4YCztVtzhjGYvtgkGF6NkpuAwksIxxicKCkFrFtSwuWNmOV6L75NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794436572;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1ZawJBPyuBDiML0n+1bmU5TYwAzwZ5CqAMTW269qMUo=;
	b=QBgfLYECdnueApss31l+3nCDW3c5+LLpwPkeDLYgteDBvpPbSem7VBDaWzPbCJIANGJy
	 RGFOdp3UukXYAJwvBrbUiZ9JOuCduMrZ1PPv62GhqIv+2YHJZHmcKXx7/HdMxeWhbVYn3
	 1eE3K3wXbTsXRwMKUCOMR/1yQYGBTrzhrYfIJzYfQ1cBppSRH14ri8Dls3P9QVAicPmDy
	 3PD6yqIqW8Y+0V8kHfbyYq+j3xsVOvKk+UBWZdzem5R5tkp0cD0SDQq7AmrBAuxwaDqjz
	 u4p5bzKXvQ6afJoLagkqtSlG3AYG2Cik6ddpvplyuSZmNFsunQmd0hhG7Cxh4aM4VvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D842F1F00A05;
	Wed, 11 Nov 2026 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436572;
	bh=1ZawJBPyuBDiML0n+1bmU5TYwAzwZ5CqAMTW269qMUo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kd0kXE5AhTl8HM8OEbb5QiCfybCSMpCqxWiXRjM2I6ZeryVcSn7tj4cwOAtId2PBr
	 aGrr8uajNyCfXK8AlqDhcxF8GWnl5dMR1fbfLA6jbLwIuT0Yc3yW8cQX9YEeFTOiMf
	 O50xdAN0K7f+rN0+N2Wsb2Lwzy4RgSkKGxv6sCQNLYDAUiIb6ZMIoHw144D9PQqPP8
	 f9uCNqKgomzbVZFCddu8sTr/3ii5lFnLjkXECqZCIvlExCv00Zqns2LBYZyAZDQ33z
	 g2fT389cQWxGoWDHFr0PacE/hxvGplo4yYnHd0ULc7H4SzOLDhniqf11+tyQ2SFPLr
	 06lSAS8bxMDtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64CA449145;
	Wed, 11 Nov 2026 22:36:11 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 16:36:11 -0600
Subject: [PATCH v3] staging: octeon: fix FPA output buffer pool leak on
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
Message-Id: <20261111-octeon-fpa-leak-fix-v1-v3-1-17a3bd578f76@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQqDMBBEf0X23C1uFI099T+KhzSuulSNJCItk
 n9v6g8U5vJmmJkDAnvhALfsAM+7BHFLguKSgR3NMjBKlxhUriqiXKOzG7sF+9XgxOaFvbxxJzT
 UFcRNra1WkMqr55Scw4828Shhc/5z/uz0c/9OJhFqNuWzbOqKc3UfZiPT1boZ2hjjFxj1wjS8A
 AAA
X-Change-ID: 20261108-octeon-fpa-leak-fix-v1-a1d31e978c82
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794436571; l=2498;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=VsRJsJ5u/AeZd4M/f4kMGa+p6KbxKOVR4bmA4sspaeo=;
 b=FkRMy4Coc2K/wSuYzU3NxfRtZMrUSizT1i/oaecJONEppMZYrctq5AYVw7Lr4Er+HAApXep7P
 R0VPTcgJ7J3Cn+wVT1/vKfgen06NzscdWWuU5Rwf7/8kVnzhkxl4aYI
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_configure_common_hw() fills CVMX_FPA_OUTPUT_BUFFER_POOL with
1024 buffers, but cvm_oct_probe() and cvm_oct_remove() only empty 128
buffers, leaking the remaining 896.

Introduce OCTEON_NUM_OUTPUT_BUFFERS to fill and empty all 1024 buffers
consistently.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: fix FPA output buffer pool leak on teardown
---
Changes in v3:
- Clarify commit message.
- Validate cross-compilation for MIPS64.
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


