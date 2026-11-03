Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699725;
	b=raeSSYqqhnpMqdKneGFZ/3g8asOohrhG0oH6umAWdU3R0zdYCwDkUo2AY9c0gNOUgGGz
	 RJZTdMQmERa8NFb+k75TuMIIrSV9RVdDpvT9nFbmzsFIJ1Y8OEYNMGH6pUrQXGdCsVl+3
	 daCQHSIyl/RXGhmQoZafG0F11SFVy9R5Y9B8QUt2gqv4sz6EJvSMbNq+emey3VJXaMMSs
	 oVbJjQjB3UeGq70p2iJl3BS5ipY2iUFhnDFPFih4+eygnL26bdPiY/skG8UHYyIJymLtg
	 PftKI2DJy18Va3sjNHw0Ea9m0aZWMAJ9xbofekhBrIeBDEV8agokVtIn5U765cfAbuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699725;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vNvV9tkP42FZZNTQ76y1Rw11MiMQPK9QAi7+IFKUCgQ=;
	b=hlO1wYpizlPGDjqxt1UYd97IUNGA2cWVfOYWUELIG9HXhabXD1V9l8hBJolagOkI72kp
	 S79YgSSa8qKeZ6CE99s+6xyTaCnPcNn95do5xYok3WiSL8B42C+943j2afEQZdQDoCM2/
	 jIRtahZz6diLqq6SpcaiAeFd08BAAUIxKik4nH8KT5fpXVcjMQN8wjNEZDp1taW2wUdX0
	 2lop8omjyg4CX1Y+VgXhAQ/RdwkUzgDs6k9aS68qt+z7fUpjT6TArtXY5aL7GWUKEu7rr
	 iaDvJd6tEmExIfAYznZmbP7R6JHi+b0oq707rYiamuoVNfOlCNFljRYG21zSS+0kV8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkjbSWoQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F52606D82A;
	Tue,  3 Nov 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkjbSWoQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539D81F00919;
	Tue,  3 Nov 2026 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699724;
	bh=vNvV9tkP42FZZNTQ76y1Rw11MiMQPK9QAi7+IFKUCgQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PkjbSWoQGJH6ETa6JEqoblEJy4QJfk0LxJL2TYtAeWdKaT9OeQ78q4me75iGfnldr
	 erIfdZVPuBWq8ilwKwwrtX2KJGtDJnelxW8WwgM/ps6FIsMgJh92BAdf0rRMOPPpmE
	 Zqe4BOfimqdXGyoY3MMvfNhmBcq+apssoiVdHmHzQPCfT90EyX2p9k5CY943F1amTR
	 POVLQxusm+9keY/ne1u8s+yGRJshTDNCdDdzH6NCfqWGf+JQpLQdKfJ4qsa7YzHo0f
	 MMx36CDSCdyYee8dDQQCtdiNiLze5nC343Hdr8ffPT6zlQYnEd6gyJGYPov4uqrkc+
	 yPWeV+lFaB/RA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
Date: Tue,  3 Nov 2026 09:53:49 +0000
Message-ID: <20261103095445.81414-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

intel_ace2x_bpt_open_stream() checks and assigns cdns->bus.bpt_stream
without holding cdns->bus.bus_lock.  Concurrent BPT open requests can
both observe a NULL cdns->bus.bpt_stream pointer, allocate separate
streams, and overwrite cdns->bus.bpt_stream, leaking the first stream.
In addition, failures after sdw_slave_bpt_stream_add() jump past
sdw_stream_remove_master(), leaving the master runtime allocated by
sdw_stream_add_slave() on the bus list.

Hold cdns->bus.bus_lock when checking, assigning, and clearing
cdns->bus.bpt_stream, and remove both slave and master stream runtimes
on open failure.

Closes: https://sashiko.dev/#/bug/linux-88535ed9-b7e9-4ede-93c7-59950c524c0b
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Replace cleanup.h guards with explicit mutex_lock() and mutex_unlock() in intel_ace2x_bpt_{open,close}_stream()
 - Drop Fixes and Stable tags

 drivers/soundwire/intel_ace2x.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 642b33ab5526..c964dd4a7c22 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -83,16 +83,21 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	int len;
 	int i;
 
+	mutex_lock(&cdns->bus.bus_lock);
 	if (cdns->bus.bpt_stream) {
+		mutex_unlock(&cdns->bus.bus_lock);
 		dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
 		return -EAGAIN;
 	}
 
 	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
-	if (!stream)
+	if (!stream) {
+		mutex_unlock(&cdns->bus.bus_lock);
 		return -ENOMEM;
+	}
 
 	cdns->bus.bpt_stream = stream;
+	mutex_unlock(&cdns->bus.bus_lock);
 
 	ret = sdw_slave_bpt_stream_add(slave, stream);
 	if (ret < 0)
@@ -105,7 +110,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi0) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi0);
@@ -117,7 +122,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi1) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi1);
@@ -136,7 +141,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	pconfig = kzalloc_objs(*pconfig, 2);
 	if (!pconfig) {
 		ret =  -ENOMEM;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	for (i = 0; i < 2 /* num_pdi */; i++) {
@@ -149,7 +154,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 
 	if (ret < 0) {
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
@@ -293,15 +298,16 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		dev_err(cdns->dev, "%s: remove master failed: %d\n",
 			__func__, ret1);
 
-remove_slave:
 	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
 	if (ret1 < 0)
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret1);
 
 release_stream:
+	mutex_lock(&cdns->bus.bus_lock);
 	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
+	mutex_unlock(&cdns->bus.bus_lock);
 
 	return ret;
 }
@@ -335,8 +341,10 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret);
 
+	mutex_lock(&cdns->bus.bus_lock);
 	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
+	mutex_unlock(&cdns->bus.bus_lock);
 }
 
 #define INTEL_BPT_MSG_BYTE_MIN 16
-- 
2.56.0.385.gac671c819a-goog

