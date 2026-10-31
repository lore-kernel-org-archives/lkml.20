Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448439;
	b=Hz0KR15ynbAGovDwVH77K66sFw4YDS3vPuGI5GUs501vDFzGZacUN1IFDhGkda+HdBUJ
	 /m1g9BMbWLAve+wSjxbU8fFkm5Sn8DZhKrtYRfmj04d/UuDZtp9mXo7JucdDZcBsNDDR6
	 qmJRjwxEiAFtGRbIifFKo8jRppFdWmDRX/js/LtYaa7aD4RML7TNDQbSoPZEbdxIhOd1Q
	 E5jTJYQ/HTqo33Ocge8Hu87sqN0Y6Zzd1fkYe0RYSSX2rtgbaJ85Y3KCnTIMpVBY6lAvh
	 1WbljtmiB3MjC/Pd2wTxZbuOW4/+SLDR7s1zh1ezrAz7z/MMmBUHQltO7081Asgu+iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SHiodlaN/47Q9sQElac/FcGmKIxlHSOhqHHn7r3qETE=;
	b=T60naNWixPvzw4N9E/sxRYZs5TIAOAO+0AndaOLDsI+eaInABtIx3nclakClMg3WW0SX
	 FIZrm9xxrqSo3PgMKrxP5TR5N8aNyonCdZtYchnP51JOVwyUsVzNg3ANi80fstbHyDkRL
	 Rp5KldAZXuyc/b/nxecnU2SvJ7z2WRX0stX4XRmGwDqc5OI7OtzC5c+QHACr5GIlQ6lZf
	 V8Fw4CcLiO8OtaLUMDG2RbTlpt+MhAmKUtw+q7KVOH6LgL8SCoBkyJctB9GkFPni3njib
	 yquTT43pb4XPQ5EpvTenlkuCWTYfmZhwH9gdZLLvXg+zglDhZOX2V77h9VkEOd5wc9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=UijhQ10l;
	arc=none smtp.remote-ip=185.67.36.65
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A34606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=UijhQ10l
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EDF7224002B
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448431;
	bh=SHiodlaN/47Q9sQElac/FcGmKIxlHSOhqHHn7r3qETE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=UijhQ10laMoUf4LsQw+gAJUuE8i27pdC3giLUsej6UjDnfT125vfP1vv3HjTDzdti
	 zj4a7jZ/bQ4PnAnLZnE1kmq5RO58mluNbVDzE2c3bhWQfkJ919VQ7ZjhJ1m5yyK6XM
	 JuXcm+Ue1QTvaI6XFUqCdvC7sspZDHBOG/gNKYMqhVZ8iwe0jRginrPN3Pe2meYdRs
	 AfD+mnXou47bdRWYB9OnvNI6bg7Yccqa/pynJW5Wy77/qyt65iYnODsCGLnQFtDmFO
	 mXOKBSvS3C8D6TUqrIIZDsLbrgMuu+jBqTdKQApwyOrMryY86acXYszwH6Vr5N6M7b
	 8JCNMmCJmLa+w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxXt00Ntz6v1B;
	Sat, 31 Oct 2026 13:07:09 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] mmc: mmci: do not count a data CRC error as a complete transfer
Date: Sat, 31 Oct 2026 12:07:11 +0000
Message-ID: <20261031120700.42576-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
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

With datacnt_useless (STM32 variants) success is 0 on a data error and
a CRC error subtracts one from it. bytes_xfered becomes 0xfffffe00 and
mmc_blk completes the whole request as successful, although the
controller stopped at the failing block. Reads return stale data and
writes are lost without any error.

Tested on the STM32MP257F-DK eMMC in HS200 with a forced bad tuning:
without this change 5 of 14 reads returned zeros, with it all 10 reads
were correct.

Fixes: b79220b3e0af ("mmc: mmci: add variant property to not read datacnt")
Cc: stable@vger.kernel.org
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 drivers/mmc/host/mmci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 416bdb184ed4..10eb0439fc52 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1422,8 +1422,9 @@ mmci_data_irq(struct mmci_host *host, struct mmc_data *data,
 		dev_dbg(mmc_dev(host->mmc), "MCI ERROR IRQ, status 0x%08x at 0x%08x\n",
 			status_err, success);
 		if (status_err & MCI_DATACRCFAIL) {
-			/* Last block was not successful */
-			success -= 1;
+			/* Last block was not successful, nothing counted when DATACNT is useless */
+			if (success)
+				success -= 1;
 			data->error = -EILSEQ;
 		} else if (status_err & MCI_DATATIMEOUT) {
 			data->error = -ETIMEDOUT;
-- 
2.56.0

