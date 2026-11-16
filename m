Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854550;
	b=X+vbk4BDy/qOHckMx+Bg32D/xBLS/yni/k4nFYr0WaBX52wyonKm6xi0LmGxLL0s4UCW
	 K2R5WBJrOjn3QHOP7zaR1d7POCwggGNI54yZQW03oPymshBWIprslUmCQI5L/qab+rTGP
	 v1QbyjYPW038pX+7VoqP2WqEUcSl+F8gSVBw8AuQ7C7ODW3EFiA48oco3J2ESLx9/AbGQ
	 sKNnyw4MYqAUfBU62eqrxRJnAnWkt+8glnZ5TfdvkX1kTd/u/I8XRcD4nenvzsLxgPCMd
	 c7RsnVN4C2YbW2ZwX4vW3+pjdKu+cY2KXXigxqPklOZVTZcj812qTCzHAbDifudyIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854550;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=mAPZ2ABkS3wwZkajNWaNlZyPRST/bSpQmiNaCbexNCw=;
	b=f6UyudtvIaI58X/AWQRVVbD6j8ZKWSygLUv+iXLfXZoCWpw6uXATB5tvPwshOg0MT/pJ
	 r0mSsjs8c1x0yeGZaZ5c+1trK4cMx3sAFsN32LMISEC+VF/ORYK9XBvVXMFZTDdcvttOr
	 lxiN7/NzwKTUEn5WGSEFybitekhAVIukwLahVtcW4k5Q3zFznvJeMhOjA+cjgtu7g57oD
	 dDKt2AF2x2O/BPOUXholWXQOtD83vG9MNicp2o+Xd7RsuJdsIuTjfGi3Fy6J4+LIT5poI
	 AL3LxbE/AJcVHQWM5m/KQDtuv5HMv91OfENloEVyXGOur2TfHriTKnUj/SJeQHq7+aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=hB49LBFU;
	arc=none smtp.remote-ip=198.54.127.131
Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F705606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F705606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=hB49LBFU
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxY72k1Lz2x9D;
	Mon, 16 Nov 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854526;
	bh=mAPZ2ABkS3wwZkajNWaNlZyPRST/bSpQmiNaCbexNCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hB49LBFUW2+3UktnL1aAIlPw0HvJKlNJrDM62LsCOjcOdzPTxQO/N2DaclotLqR7A
	 fBc4iPFdBzTp1RyIFNMfx+Yd4EwDeQB8f+oBpVDv5xKUq4wMKeof339be8GMJoI7Cl
	 2145xrGLrZEDpxNPwarkZi7PziyUjMqTXIKc1L2VmuRtIy4GfD5VXuKx//g1eM5fpZ
	 /YNuUvmowgu8TKfgGPQ/PaynKZ8/DzvD45Lc8sbA58RMSPtFd6SBwJEVBNitZP9nHn
	 /ojy7eEbChiwSnEVudd0uNbyItNALmN6HgZriqCRF/3peN35yiANllbmEoUzxJ0kNF
	 e6zyhslzFJkcQ==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	francesco@valla.it,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Mon, 16 Nov 2026 21:41:44 +0300
Message-ID: <20261116184146.1897281-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116184146.1897281-1-dev@chrispinetinega.com>
References: <20261116184146.1897281-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
but k3_rproc_mbox_callback() only logs it. The remoteproc core never
learns of the crash, so its recovery never runs, the crash is not
counted, and the core stays halted with every rpmsg channel to it dead.

Call rproc_report_crash(), which may be called from atomic context. The
core then moves to RPROC_CRASHED and the crash is counted. Where the
driver leaves recovery enabled, recovery stops the core and boots it
again. Where recovery is disabled, the core can still be stopped and
started again through sysfs.

Recovery on its own cannot yet restart an R5F: the reset the R5F needs
before it starts again is applied in its unprepare() op, which sysfs
stop calls and recovery does not. The R5F driver keeps recovery
disabled, so this does not change what happens there.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v2:
- Drop the dev_err(). rproc_report_crash() already logs the crash
  and names the core. (Francesco)
- Say in the commit message that recovery cannot yet restart an R5F.
  (Francesco)

 drivers/remoteproc/ti_k3_common.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4b6da3363..43a7a21fd 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -60,11 +60,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 
 	switch (msg) {
 	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
-		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", rproc->name);
-- 
2.53.0

