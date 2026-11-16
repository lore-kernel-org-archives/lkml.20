Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837159;
	b=XUkAjUgwA3uqGOjups5bGxm6i7QmSMwmD1E1MZv6AevRxxQ8jp253K7PklmFgIr3qkbn
	 AV+qMha18QPUOnNLFPNs1e23qSppBk0hdvbJmvTg0+nJDmCyantq9kkOvjqTtHdOsz0Y3
	 8IJ1UHCBHQWLTl2AWm+cxUiht1nWqsp/j3NW1cc/sh/IhFizZraL9RxbE0uSnVRE/HZ4K
	 2432ORyFJG3lFGo+qe0g8A+Kk0dWmS9Yst2ax8aFA9oPX7bUZhC6tARK0IWtT59woWLH/
	 mOmC/MRc+l761SoweyC8ZYUtt4UsNYTrA/D1Bsvs5yS/rFQ+AnmN/UKuf38nzTsXWSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837159;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Io1BI6qoNCZuXyB0hpVKaDQ4e+kSz3Jj0EHD4cdk5bI=;
	b=kvx1MPO0uJBu+DNsc5QCP98iSDX8NnJz9PwF76L4fue9xYVjBfTUQH7DEz2BpuMnm8Ka
	 c+6gbaWdFVCxJHPR6wrKRgyhQwBztmGymDPu0aa55qJZqgSNF8Sq8CjvjSaeg28f+6lHI
	 B6AX3F4OUatllpPqkUk4vT9iNBP+nOWX7KY1wYX6k1UKX2sOzoWssd9uY7Fw0N4lRZIOV
	 L7pHo+ewlbkpkoljNmYRl/1E6LXVTMuMI6uDOFeqb/hlUQCY1P9v9pRQQr3SvgCZAQzrj
	 QGDKkfovY3aP5zNg5Zjg3KJZtNXlvZB9y5hsyenStPGvONufmOqmq53fqNUb8PlVZxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uTzXgKX7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193FF606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193FF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uTzXgKX7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E51B91A168D;
	Mon, 16 Nov 2026 13:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45B26023F;
	Mon, 16 Nov 2026 13:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7814D11BC0465;
	Mon, 16 Nov 2026 14:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837155; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Io1BI6qoNCZuXyB0hpVKaDQ4e+kSz3Jj0EHD4cdk5bI=;
	b=uTzXgKX7TZ5HexcBNzk+bN4X/4RHGFmVz7b7qxT4jii4fbopEUoC9Mv2zUCyQ8NT7CEFYH
	p6Q4yVi0RnR2wv+HC5VGmn2Z+Dtv6P239jvLZWQ3Tgu9k8n+nshgcD5o0Cf5pQf3Yuyu5Y
	ElKLGT8JOuQEvLk1sKwSBN4LD1Fc3B87JBteLSb5OlhcZxKmu+iydgkoH739pOza4Q6gQ9
	kaUAcRFeRglYg9GIhgcE5TBVp0xdRmH8nhHK3HqbNM3bZ4bBxtrN3bcJYMnwo2858qThjp
	kdcp04d9jxkzoxwHPbcsTYdX/hHWaFddmQ1l9ieYbMtx003M7bv9Hcgff7lQ4w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 1/2] clkdev: Improve clock discovery with clk_find()
Date: Mon, 16 Nov 2026 14:52:16 +0100
Message-ID: <20261116135217.37038-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116135217.37038-1-paul.cercueil@bootlin.com>
References: <20261116135217.37038-1-paul.cercueil@bootlin.com>
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

v3: New patch. Imported from
    https://lore.kernel.org/linux-arm-kernel/20261103084915.8405-1-paul.cercueil@bootlin.com/T/

    Originally sent separately to go through different trees, but the
    context was lost which didn't help reviewing.
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

