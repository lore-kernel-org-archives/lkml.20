Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.130.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831373;
	b=ds0TZIuX0Yp6kSFedur6qHX+MDgYzP2BJNqWbPA/385xm/lh17CsZulZ/T+QCPFsb24C
	 snbzc8XC+DrG5wED0ejblPc/JZih4fM/y/tjtvMEf7zKwGSDyrGCHR8lOQ9S7QfVzBOPE
	 Uye6NHYGqGQTnuLpvT32uq/NLxoRAoIPsRrWwrZH2IDerKq8jrvQFVSykBz8vx90Cz09f
	 Tp0/K8XnicPjayvhvD+9hXjm6lGTj9px4DXk53wRbsPKiqmVWBLhVBg1pbmld1YMM2Ei/
	 2ocbEP5OmnSD7m6UO28H0NvENkfaSAlCQipOapLfwf8S/jBJ6rT8jx2hNbbJoo5UYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831373;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=bBojCw3PGWuhixTVRZwWSNFJr20HWw9KtfyittN+QcQ=;
	b=OmtQUEDWuAe0QochQDkX+KnmAiURCsGjV1DTuXpZdok03lI1wrL7o8ZCtX9tT8zd6pC1
	 xVj5z2M6Zoe8cD8FLILWDz56aTxfiBkVYo0QZgPbiA1SjoD7OJnz+XNY/ZTy5U+sQcHh5
	 w3yTi/s/cTdohdncbf4MYDktUkIvtt/sbooBEf5NDbC820ZtLV7E/PNjEI7+8p3YkJnZJ
	 p2/SffLeV9+CVAeBOQo3Fm8YCW0r9Ys8HPCO9oe4bW5GUjdLL0/mIk438YqbUVg++erZn
	 6cDwLC6+eRy5Iwsnpu2eK60Xb40qXhCEzIRrBCYq/bUlp27PxVz/1LmJMU8Xo+J5AlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=RXcpHjsG;
	arc=none smtp.remote-ip=74.6.130.41
Received: from sonic308-2.consmr.mail.bf2.yahoo.com (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A032606AB14
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A032606AB14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=RXcpHjsG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793831371; bh=bBojCw3PGWuhixTVRZwWSNFJr20HWw9KtfyittN+QcQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=RXcpHjsG6efaiIcOe8MOvjhuQjnVmBM7sKLoUbU7Z3c+novs8Lt7nO4Ju+WyV0E3u3Wanmk4gN+Vke8sz+spnva23LW+n1Tb640G5k0POEqpMk4wg64GKfvKZJwqnrDVw0MTBgAkR73FmQtg2ciMVUzAcWOzSMvn3mY2X/VTRIvtTEPInVQ7TYia/dtlIKQsclljiyxATX08SpLv6ax1d0qaBCaBjtImjH8mNNYG2/JHX/IxZe2xi9sETvp17DK68l4aTpwX6orV3xTVfccjjkEvQKNeIuffYkLTG8gQhxpCiZMlTE9D9Si0IuOtAtT+fuCYw9tYHfGtixsFgOW98Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793831371; bh=pZNVIUeMCnItnC8EBiXQoMOiWVfpPAFkMEev/pf4Jiw=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Eq7xpukqBHd3Kfgb/sRmQaAjT62j7EMlCoeIUb3VNIhM38jeiQz1PT/Fnr5Cq3ULWAwmRz60knvFfPbDhN22X8fYIlBgw4dM2zlyhYaPHBmDu7UbrDnPnTEQXHb5xARl73V9TwYS3vYF2LdB/2dFzuZeEo+LqUyS5+XgbO0OX/Q1/nR5az3R0O+bEgYahD3198+VbGybh2Hmwlvhvm/qS27LrwQ8VSsG+/O1yTeM6Wdzg6K2afnNNl+tKAlZowqXvZvUEKliToFRBOumB8TqvpXy4PlCwEWyCFTFSHRum8x3cVqL81JM1j+n/FPLOX+r2DofweZ1pe0Rg0Cg40kjGA==
X-YMail-OSG: QFXUqrYVM1mUq8W9BIgFLrYzJSR9rwz7atsrpjHKvvQwadU6N1aNmvV63nKfuYG
 QeLoQUfoxXNwBRYi5l0KGHEBsnIBJXTXiGcOBY5cEk.bdhnmRNoykl7KBV2JJxtqR8QlYt21CQW1
 _69nZ.z6LrVN5_o1lbKrHdrFVZqAI2im34HLtFBMniSG_1xfCvQNxYyYy7BBK0lZjJ5KjAgoEczk
 AK5oPWH1FA96AhT5nQO9Qn6_S1vtZ3dxMODSxvw31iHnsoNHi72.r6gkrcNd5D24sqJZLAZHVofc
 YizJzvg14B948M9LvO0vjdl_5tWo8mmbycNMeUsKPwGQCManAuizkSjwcGWO5qD_E.LcCiupOY6I
 EUhSjMSgbtXo3pppxdZ6rn8a476tKA5.34Wu10vb1pMPURuzBmrBJG1TRU6LLdXs474r1WxMC3_1
 GFank42qCDHXyxb127E4R5uIIdi4Pq5BY7FjNUPNNBbFuSkm0EtcgW33SQA.54OywTp1vOxb1W9.
 Lb0yLfmSyX2PnUcJiCAOsWrLKeM34_lQs.JwGNP90Je7JYzsho9uWo0aMNRVU9o91WD_tI.HPybd
 nsimhFIYhHg1tFkBYfPr_sdiAyT4oi4ocd_rG9m5torbpcIChdauYHk63Ys8Jdu6iPW8_8sk495p
 hkqtiQuph7XQD55.KoP.insYNXqPLpbqOGFYtra_UfUjDk4JYIoLqGu6dl_bqqOYaPiD0VKUbQWN
 bRCTUmtozwBObe6vNVtuHGs5cKf4KL_HHJXKjp.VeO6TJ2zdYBzT58NH0RO5SBdmIbDD44oODctP
 7p8ggBjMZfr90jfXEc7EYhbhZSf59C4DEmLC.GTDqBEGFcVMH_zisJ2_6RMFZJTs1HXoJhvYs7iR
 BqywzJuGEdSlZPC0I9UsE3Q6.rlz4cs6SspEvo1KaMv1bnvNHHYlQ7pFFhbVEab3xsVY_Et87dc4
 vWH.3pI2ndOOLPnReVBbbc3Vx74ev_eRjCfemkJywftvXlbg5ALGoD9.FDHb5Plc411B7W9ID9Uk
 sKzsROuJYQWHY7cNNypTedFavN_TZwsjoiLDrOHxggCCWS00RWT6fnqnS24kIm6bTaXimS8i4N8w
 UpvPT4kudmjvvn6qhusWfvlMQs_B0v8JuJgTeGbOm7SNwCH2jmCoIJ6CZ8wbUpRcAPcKado1lJEt
 lMnSwtvHwKlA73ck8nSAH19JujhKSufYWGZfczPVT58Yq88ThF79eNXiRkNmaBJX3BYJD4AwIVZR
 hDRsM8LpTzMhr6ch92AURMMwJNlVX_SqWSzwoZnzo5wLm5uOvby3q90NP3VZqTii7G6Iw_tlsw2h
 yg.Zp02TCyatq1nthX1uYxj18pENmdK0tFxGWyMcQ5UvfNCrXp9MFcmWVPTqwyTWADuoeTv9up1z
 .ei_RgoJlzk1j29CK2D3Sw5s7_j748JpCg68Yo4i_K5FS7rAudb4eveqSvLO0eXRcG0b4WCpqZIC
 1vR6dhvff95gnGwzbIs4uyFUUyAiz1GWwhooDJeykkGyQbanjKIB0uO5R5lerI6p3B1dBXsAFZrP
 joH4jYhkyXA4HOamWfK2RfDgm1ClWgLUumWLtlvsZ8jp5JTCSWUtAz9yZS._epdDCl6cEzaMn6fc
 YG9i90pZt0vDRyfkwoApK77cm7UsyEcev3xaZnkcVvld5o4gjLm1SB5aG7g7HqLu2jUo2a5K8K.C
 xPgWyfPHSwqEvphc5bufZ86l1gBFzXPprg.qC8sPm9yZMgYK1eMjyybxyVDK4y39AQ6Thfz77vRR
 dmHeAEbwdsuiBRibBpRYK5QqQL2aV4PZ3OL9tJe94H8BpZ.YLMguCGrdKGZF5N931NsAKXpzbfV7
 TZ90Untumg0QbrA3I77PaBZlHf1uhUSxYRVPNk7otMMIQ0QuCFjQ5MDaSTTrZdFo8kFZ3bBrIiAY
 XIvaDlZIcLMLG4TUb6ODxFMr_15isPb_yISiIcQtxlWJGF7IKaazS2vfOWc4mbnMWZwyiZ.4GOxC
 27qlB_t2f994f1Z6KTIc29x1gxzQPIASgNbBbwF63Qc774jE8CtbRf0TeUZ_Qj0mDDWvU7PziChe
 PyUlSqIfdot5DdCWUz_u3bAeDRRI9c1XYoqIDhKrAMndHhd1XXvFVt38.mHVFsPZDh7mWzDAcYYI
 ZV4eVPU_gxlgTSkK5jBtuK9qPlHmfQnxAHKzt_6ffMhWiAF3y813o1IrTRF6QO.n6ALk8lcSZzap
 57YmNHDpWkkciw9dGd_vI4SmMpDvFvwH9_sILsW5DMlOkodHChvN99_XZMjfOIvEi7gMBP9YyrRH
 HPY5K1KI.CWuhK9YvJFS0tnMqp1YP5yT4dGvVkGM9Alnq
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: a09a1010-862c-499e-aa65-927325cbad5c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Wed, 4 Nov 2026 22:29:31 +0000
Received: by hermes--production-ir2-5dd9bf4598-ztwl7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3b8d832006b22c7ea24550ecffa8253d;
          Wed, 04 Nov 2026 22:29:27 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurian Iacob <laurian.iacob@yahoo.com>
Subject: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry loop in buttress
Date: Thu,  5 Nov 2026 00:28:32 +0200
Message-ID: <20261104222832.32471-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>

Use scope-based guard(mutex) from linux/cleanup.h in
ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
error handling and remove redundant goto unlock paths.

Additionally, replace the backward goto retry label in
ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
control flow readability.

Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>
---
 drivers/staging/media/ipu7/ipu7-buttress.c | 56 ++++++++++------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index 40c6c8473357..7ec8290c4432 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -6,6 +6,7 @@
 #include <asm/cpu_device_id.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -229,39 +230,39 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 	u32 val;
 	int ret;
 
-	mutex_lock(&b->ipc_mutex);
+	guard(mutex)(&b->ipc_mutex);
 
 	ret = ipu_buttress_ipc_validity_open(isp, ipc);
 	if (ret) {
 		dev_err(dev, "IPC validity open failed\n");
-		goto out;
+		return ret;
 	}
 
 	tx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_TX_TIMEOUT_MS);
 	rx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_RX_TIMEOUT_MS);
 
-try:
-	reinit_completion(&ipc->send_complete);
-	if (msg->require_resp)
-		reinit_completion(&ipc->recv_complete);
+	for (;;) {
+		reinit_completion(&ipc->send_complete);
+		if (msg->require_resp)
+			reinit_completion(&ipc->recv_complete);
 
-	dev_dbg(dev, "IPC command: 0x%x\n", msg->cmd);
-	writel(msg->cmd, isp->base + ipc->data0_out);
-	val = BUTTRESS_IU2CSEDB0_BUSY | msg->cmd_size;
-	writel(val, isp->base + ipc->db0_out);
+		dev_dbg(dev, "IPC command: 0x%x\n", msg->cmd);
+		writel(msg->cmd, isp->base + ipc->data0_out);
+		val = BUTTRESS_IU2CSEDB0_BUSY | msg->cmd_size;
+		writel(val, isp->base + ipc->db0_out);
 
-	tout = wait_for_completion_timeout(&ipc->send_complete,
-					   tx_timeout_jiffies);
-	if (!tout) {
+		tout = wait_for_completion_timeout(&ipc->send_complete,
+						   tx_timeout_jiffies);
+		if (tout)
+			break;
 		dev_err(dev, "send IPC response timeout\n");
-		if (!retry--) {
+		if (retry-- == 0) {
 			ret = -ETIMEDOUT;
 			goto out;
 		}
 
 		/* Try again if CSE is not responding on first try */
 		writel(0, isp->base + ipc->db0_out);
-		goto try;
 	}
 
 	if (!msg->require_resp) {
@@ -852,11 +853,11 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 		return 0;
 	}
 
-	mutex_lock(&b->auth_mutex);
+	guard(mutex)(&b->auth_mutex);
 
 	if (ipu_buttress_auth_done(isp)) {
 		ret = 0;
-		goto out_unlock;
+		return 0;
 	}
 
 	/*
@@ -879,7 +880,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				    BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
 	if (ret) {
 		dev_err(dev, "CSE boot_load failed\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
@@ -891,13 +892,12 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "CSE boot_load timeout\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	if ((data & mask) == fail) {
 		dev_err(dev, "CSE auth failed\n");
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	ret = readl_poll_timeout(isp->base + BOOTLOADER_STATUS_OFFSET,
@@ -905,7 +905,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "Unexpected magic number 0x%x\n", data);
-		goto out_unlock;
+		return ret;
 	}
 
 	/*
@@ -919,7 +919,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				    BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
 	if (ret) {
 		dev_err(dev, "CSE authenticate_run failed\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
@@ -929,21 +929,17 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "CSE authenticate timeout\n");
-		goto out_unlock;
+		return ret;
 	}
 
 	if ((data & mask) == fail) {
 		dev_err(dev, "CSE boot_load failed\n");
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	dev_info(dev, "CSE authenticate_run done\n");
 
-out_unlock:
-	mutex_unlock(&b->auth_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int ipu_buttress_send_tsc_request(struct ipu7_device *isp)
-- 
2.43.0

