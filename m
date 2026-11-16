Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854550;
	b=es6L026fbiKheRTMegiWw/ykrQPAiLYT16KGTVdMFbbcYDh6XSXcRIot2J7vVxAsJTOO
	 aAqkpoKIFifkV+MiaMpQkeLR4n//2nSPX1suAAslmwuw/BfE8EevL7Z/wJ1ESrSiSz1gI
	 I9lslQLbcb7hP5zeZXkcQmMoOF6e6VeIf2l5pQiVZv2jeknZd9SSCcArf4H7oyqw4sF7O
	 viXj4Hr0Diqk0Gke4hmZ0j5f5S85NWKlDdIJr0wJcCs7F35eA5SxJEs43bxxAVKUPWRS0
	 WgCqWzMGjXBNJz3nLEmXWjV3XgqDFtpShzaJ1i8jCi7gZzbniYQa+MigC86V9zZkmkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854550;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=46iaTwH0JBiEX1Bu+TkRJey1CZt0Qpd5SlJUPBhFISw=;
	b=XcCHmmt075mRj6WzJd8zRJ+55OzR0rpBVX5FORVjLc4M1u+SR0wB3yWHliWHATHEebEb
	 nplKKGCyijeR6WOHQZJxujfCGpleXOY5/mr+VO3Zm0aRbxgPcg6LIs35/Zeve5ngd9+Fp
	 uh8Qq/6HsXime4HXjlhcXJdubn8YGTMyBi0+xFWJPzPnXeVekGGYDdYlpip3Bi5zRCmHK
	 0W4756osWNqwf4yBbT/IwG337W3PocuMqaEKylVf5hm0802+jHPDGoIisevza1UGixJ1+
	 fjMiHLNoqBkJPd+MEQaJ5ZWG0yeremHsc717e6pBTswG0xQwNXK/bj/glsPcRy4JAsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=qae3QguH;
	arc=none smtp.remote-ip=63.250.43.81
Received: from out-2uec-a81.jellyfish.systems (out-2uec-a81.jellyfish.systems [63.250.43.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D39F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=qae3QguH
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxYC46STz2x98;
	Mon, 16 Nov 2026 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854531;
	bh=46iaTwH0JBiEX1Bu+TkRJey1CZt0Qpd5SlJUPBhFISw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qae3QguHfvo8Iex2TVI5/EGBrSyyHa4oHG5TKNhYNwh+yg+zlL/Wt9NrDgeGpSlKx
	 f6GjoB5+OpmQALz/wkawBgEKjjM1VRk8mRg9WGT9n6YDe51cYKgKrE44PjEpNBvPFi
	 itY7EHzwi7mBe9lcjKF853nZ244crPdpABS+w5Oja9yuY/udH+BDP7X1pLjx0eR4ds
	 B19s3nk+UjRYIVeOsMOU9TXIfBplJoP6r9ERdsdKHwWC2q9AtqPk8vPyq1JBitENgl
	 Gc1KvCbSd+p4dOq64byRqBHY6BqZofqQ9in0jwk76qETn47/4ka+i2HR0Z8z27hMkQ
	 h8nRReb1DRXNw==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	francesco@valla.it,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 2/2] remoteproc: k3-m4: Enable crash recovery for a core Linux booted
Date: Mon, 16 Nov 2026 21:41:45 +0300
Message-ID: <20261116184146.1897281-3-dev@chrispinetinega.com>
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

The M4 driver disables recovery, but nothing reported a crash to the
remoteproc core, so there was nothing to recover from. Now that
RP_MBOX_CRASH reaches rproc_report_crash(), recovery resets the M4F and
boots its firmware again, while Linux keeps running. The stop is a
plain reset, so it does not need the crashed core's cooperation.

Enable recovery by default when Linux booted the M4F. Keep it disabled
in IPC-only mode, where Linux only attached: recovery boots
rproc->firmware from Linux, which need not be the firmware started
before Linux, and nothing would tell the user it was replaced.

Userspace can still change it through
/sys/class/remoteproc/remoteprocN/recovery.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v2:
- Keep recovery disabled in IPC-only mode, where Linux only attached
  and recovery could boot a different firmware unnoticed. (Francesco)
- Retitled from "remoteproc: k3-m4: Leave crash recovery enabled".

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4c46f4a25..b2a187ea4 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -56,7 +56,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc->has_iommu = false;
-	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
 	kproc->rproc = rproc;
@@ -105,6 +104,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	/* configure devices for either remoteproc or IPC-only mode */
 	if (p_state) {
 		rproc->state = RPROC_DETACHED;
+		/*
+		 * Recovery boots rproc->firmware, which is not necessarily what
+		 * was started before Linux attached.
+		 */
+		rproc->recovery_disabled = true;
 		dev_info(dev, "configured M4F for IPC-only mode\n");
 	} else {
 		dev_info(dev, "configured M4F for remoteproc mode\n");
-- 
2.53.0

