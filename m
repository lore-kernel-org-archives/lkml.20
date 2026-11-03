Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695778;
	b=0hw//plRfUcOvlLF0FBP+6aWENOjsn8EHOMljSYQPUrgBoV6uvMyvhSWKcLsxOfL+AvI
	 5LXZ6+rtNCJuZF13JOC8bHvibHmg+/XKF+hAM9DFwQyMWGqwvLje8E42xsM4XyZUfypPv
	 dDmnwNFjI+QnVwYXCsMGLAOu7/ninQQUsS5T4DP0VuZjqzd9BXOPHfn6U4wcL3g1RQQ4F
	 lQb/A3GrGr4WpgAn4+72W+xRPx5LkzObLMAzRJ09CfTB0WDYnbYXJv4moBeEIBJ2JRMfG
	 DQ66pRP9QFrC8K2Qz7snbEbWeXGMB+qJuHW0i36KXYMkSqpcoPUFgN2m2cerC/RYPVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695778;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yGT4gnoTr/m1A1XEiS0S3UY5LeCHkKhSuJJJVlqKjmA=;
	b=oByBrAgp4nxRXKHapWw/r5J9mw1IKOnAnx+LrB5aFB9Cyu0X/IbwHPjeOCMRkwNRRl+l
	 AO/Z6hBnBIrTDYBC2R7oAIdo/EkVO0RhwrQxOj2kOulIlfWyR4mWwh5nNPlGShNrzumjP
	 f62ZG0PZYJ6/fEw80IoOm/Y5QuFJwc1j2rnvqbrG6JJkCcZrcRue1mHr6uZm6xdWRdCev
	 GwpgjtdNpXkNLWt3R2dDSISuwNWujCMsvpxWo9s+X+n+2Qt2pdYlLC7dAZrAWBNEyD5pa
	 OaQWdC+AkAMKyUm065MvFiJG4644GAuSPxP2zXAQ5sG1UU8aI7cgEx1a0tu0cuxibmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oBTnmWl9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BEC606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BEC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oBTnmWl9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EAEA21A1360;
	Tue,  3 Nov 2026 08:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B81686046C;
	Tue,  3 Nov 2026 08:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D25810328ED0;
	Tue,  3 Nov 2026 09:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793695774; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=yGT4gnoTr/m1A1XEiS0S3UY5LeCHkKhSuJJJVlqKjmA=;
	b=oBTnmWl9af13vZBlfaeG1iArN6MubXIcl1IywJhX9v9U2qx64VzMuYUx2TyddG8BiPZ1Q+
	rIUJDIC+9Rd2vy75A4V/EyRCitMDwG3Ouvk7wgvBGUpaGwmIas9mb79jXeXZLz9vYdBt3V
	Rb5/wm4tAgGnb8uD3zcfTcW/krPh5M3433rRUTSYnOnxs0aGMiFS76IPZT1ZQfbHW7RWKG
	vhMqFhz44l75PL1wjQXEtTp8RVCiLuI5BPxBWx4kD/Ke3VQSCBxsVQkvixMx2XZlQCFY60
	yZ3M9LmLn9WF1b9eEx5g5L61/vD5Ji8zZ5xfSr3OjCGziCEIHXl9qmrLfg98NQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH] clkdev: Improve clock discovery with clk_find()
Date: Tue,  3 Nov 2026 09:49:15 +0100
Message-ID: <20261103084915.8405-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

With a setup where a clock provider registers a clock with a device name
"mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
not actually return any match.

Update the code so that we can support this while maintaining the
existing behaviour:

- clk_find("dev", "con") matches in order of priority ("dev", "con"),
  ("dev", *) and (*, "con");
- clk_find(NULL, "con") matches (*, "con");
- clk_find("dev", NULL) matches the first case of ("dev", *).
  Note that in that case we don't handle wildcards for the device name
  or it would end up matching everything.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/clk/clkdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 919fc680ae4d..ee6c0afd6ec0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, const char *con_id)
 			match += 2;
 		}
 		if (p->con_id) {
-			if (!con_id || strcmp(p->con_id, con_id))
+			if (!con_id && !p->dev_id)
+				continue;
+			if (con_id && strcmp(p->con_id, con_id))
 				continue;
 			match += 1;
 		}
-- 
2.47.3

