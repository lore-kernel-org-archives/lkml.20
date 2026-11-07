Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794033590;
	b=u7I7REdXGX8adu8VbDTFR3sNGVwczF2KSNln66rrCJ9MkTCw/nEf4l0y32OZK4jle6Uy
	 QlqmycZVvVcWsNGcZ7PqLOrTQNj7v5BGTtaZYUN1BXaDF5k3EqdAVRvh1VukB9vyFL3Iq
	 pRmg7ZPcsPdvOgp1KLCdJeey3Hs1OVDTnlUy2xP2HaRroquyt/S6vstQZyHTC6jDQVJ+S
	 jyhudgLwXGTRjRx6Sgj0eps/wTLGXvfcglAExuomEI6c8XcZ8pW4AtEQnwTeqS7Wa8gX1
	 qJsEUZvdQOlJn8o5BkZXb83mAHePPuvBfW4ry7252F2PQDnX0ff31cYTk54krJN6+6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033590;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ShDXm4uGbxBrT17O19lJkSloCrUtaC0uPtaqAxYQhhM=;
	b=NCyArcDufWmz+Dw+C6jQhQAZ+5oo/MFiqdlvirhFSIpe3cD5LczJnLatUFIOrfskHhju
	 m41mFnd+mPJTU52XF7V9oXkRQhse0BwHfCcohddguytKmvDMHVMoCLDixS8trsItdBa6J
	 npD7JNMwioPTEuO8wfpvB/sGJhyYV7Iiltz80P3bu+/XwCAHCi4PQTCjXB6MnIj3cL/kk
	 qI39L2i6ahhuJUgmrzcO/A3eyseQeum0c2WlRh6yr41AoA42XgKGyAcZpw7TxP1VZ2aYT
	 y90HTmIPYY1gWbUkP5yOLmNusuT4aWS9sp1Lyxt0NuA4SWPzbIQ1iPvmVB7WbXYZi3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GifCJ0ZY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DA606A326;
	Sat,  7 Nov 2026 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GifCJ0ZY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794033589;
	b=rxw/ivtSpTvVv//cua0kfKqoOwKj3HFVJDdfHT/YT24c9D4ETUycSkht+tswOzT3vBSS
	 5dyEI7i7DAR9cqpHiHllJbNHOm6e/IR9ow6kXRE8N10OfZqk58bBXBTezEWcJfLgfSZWE
	 WeHmX6ufzcg+hkVI9vZVi6eoUZutI7NxcNS+bo3p4jB/AX4Uu7BsVNPfxEwSU/v6fD67N
	 oTOMbs3S/5lNsX83rqbQwKJsaRjOwxswSpraIMStFuJaWGprQxvuA/Mr9zRwV97hxo4Ws
	 lWN8aMYEyJn13bQYSPcbxWOWUOdFVZAUsHsztZLilxeR1RG9WBiQ1+1My1ZM6HUgN5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794033589;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ShDXm4uGbxBrT17O19lJkSloCrUtaC0uPtaqAxYQhhM=;
	b=nOH1swnEKY41fbD3y8CxhoRhGNqhv3xchhHGfW8k0T4DPJusk4UhxRB9oCsXHizzuMuG
	 NKzUJMaSl57JKMc9NiGBMqgcA6adL90ITrxtMH1q5lNH9YIG958tj9Ag+XC43K0vPetV1
	 KMrTpnBKrUdmYjuXntaHwgMjTJFS2WXCADH6ywxM54trKn1bhrjRU1lTLYV6+1rzcv09D
	 FnUVDPJz8FQLY+mS6teHLwOpzni/AlhHszkTZsFtq7DRPT3GwYGNhh0VcwJZ11joRGIGw
	 lDa9byXXFF02IpwG5qXZT6KpsJ0HjvxtW0Y70/yryloqe1IWNifZAK4amvCmoWW1rqg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7F651F0089F;
	Sat,  7 Nov 2026 06:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794033589;
	bh=ShDXm4uGbxBrT17O19lJkSloCrUtaC0uPtaqAxYQhhM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=GifCJ0ZYivD01lugBvR9ouX9YKvhebsUAXNwYr5TqDqmML3Yalj1HgXKMOy/MiI5w
	 /Mgq0eY96Trok+Nje0PBuxAb2y+2DSJmUEzEc/xWFePxXOyMO9xsru37I42IPfIWt6
	 g0svS4mPHJy/oL3B0WcEHzQ7ygvEPsKBe+f9jONe+RItKsZxcT33dbJTB02k4mJI1j
	 6Y/1NSLYiJ15kyRqsRvPlUt+UEp7+XlVBLzwUmTxl9D8HUxlZscNGX0ttIXmSl1G9P
	 dpavfoykEgG57HHvwEk9bvjn0BBsxvJXBwn1NsFu7F8i44lrBbGAwt8sCrjJcyPO/P
	 EUNueNoYAqWDQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56B8F47AE5;
	Sat,  7 Nov 2026 06:39:48 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 00:39:47 -0600
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
Message-Id: <20261107-octeon-fpa-pool-fix-v1-1-1c87ab050a2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkENUvpKdLBaayFc0Ygg+nvSc
 QZmHiiUmQoMzQOZLi4ssYJuG1h2HzdCXiuDUabXWlmU5SSJGJLHJHJg4BvXeXbWG9WFzkEtU6a
 q/+s4ve8HiJnCMGUAAAA=
X-Change-ID: 20261107-octeon-fpa-pool-fix-dbb87a203f38
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794033587; l=2396;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=jfYK6mu4CymzOqkHn43J/TUYukLoXz0XWFvyyqJ4PXI=;
 b=iWqfh3jt+pJDZzI6sXfPmTV874QAs/4gWGseyD+GrXOhKpSR+UdB1tmWdNVE1N6FWGKq20DJm
 dN6pjIadwiwCVcOM9au+IG4NwOi1+kU2fVEgcEjAJVKqEaVfhiQqzoP
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
change-id: 20261107-octeon-fpa-pool-fix-dbb87a203f38

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


