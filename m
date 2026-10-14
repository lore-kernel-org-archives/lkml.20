Received: from smtp112.iad3b.emailsrvr.com (smtp112.iad3b.emailsrvr.com [146.20.161.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0B4E80BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982053; cv=none; b=gwT4WqDuQCELPxsuI4NymPK0xrmJ+WG2mOjj1/7phe8mnn/n8SRStN/iUiiNFjkwAcC8R705ZaJOwgcjs7vCwgwJEc1TWiq3jk6ZRqKrehSlobqnAwNDnf43TM6G+rH4xWkD8CokKaSbYWBiwZUT1NsjGOoLCPT9CJ+tAcL10uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982053; c=relaxed/simple;
	bh=8g5vmbfnEkQi9moPlnXNO9PpwCDIUC2VNirC8zYO/gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeKkWAqBszkeEg/tV+TE7Z6cgqmJMRjZnd8AlXVInDQnBux1e0sy1AsWXvJVMb91c3oiz++HBDyfYFHwlz/H3K0E9EuyPTFAmHpgz19UCzWN+dteqqHYqfybXxJq18r9EocL4Mql0I8tyVXCR9jMNZdKUnCrentQcfpgTH2Mkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=xasH2hAs; arc=none smtp.client-ip=146.20.161.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="xasH2hAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1791973111;
	bh=8g5vmbfnEkQi9moPlnXNO9PpwCDIUC2VNirC8zYO/gU=;
	h=From:To:Subject:Date:From;
	b=xasH2hAs2ycWXJzU3nyTcBAPkz5f2RMHpZBuh65ZiZuiaDXfDz1YlZNuMdI554l4O
	 eaH3Im89M6SnWE40NRcU2eFKagI+xNtrsyTXGNjXelbie45p7KEoY+i+Q+4X6jK7Yv
	 L/IR3nS+g2hjzpfFloz+pG1zAXxN/oxep7pC+Qjs=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp7.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 70DB760309;
	Wed, 14 Oct 2026 06:18:30 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Yang Zi <2959243019@qq.com>,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v2] comedi: addi_apci_3xxx: fix subdevice count underallocation
Date: Wed, 14 Oct 2026 11:11:42 +0100
Message-ID: <20261014101803.11036-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_BC89ED84AE795F9D75CCF0A65E679B78490A@qq.com>
References: <tencent_BC89ED84AE795F9D75CCF0A65E679B78490A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Classification-ID: ffb6a035-ebd2-475d-a22d-b4337d124c8e-1-1

From: Yang Zi <2959243019@qq.com>

In apci3xxx_auto_attach(), the number of subdevices is computed with

    n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao + ...

The ternary is inverted: when the board has analog input channels
(ai_n_chan != 0), it counts 0 instead of 1, so the AI subdevice that is
actually created is not accounted for. As a result
comedi_alloc_subdevices() allocates one entry too few, and the later
subdevice initialization (notably the TTL Digital I/O subdevice, which
is populated last) writes past the end of the allocated array, causing a
slab out-of-bounds write.

Flip the ternary to count 1 when ai_n_chan is non-zero and 0 otherwise,
matching the subdevice creation order in the function.

Signed-off-by: Yang Zi <2959243019@qq.com>
---
 drivers/comedi/drivers/addi_apci_3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
v2: Decorrupted patch in original email and appended my "Reviewed-by"
line. -- Ian Abbott

diff --git a/drivers/comedi/drivers/addi_apci_3xxx.c b/drivers/comedi/drivers/addi_apci_3xxx.c
index 695cce1031779..1dcda82d95032 100644
--- a/drivers/comedi/drivers/addi_apci_3xxx.c
+++ b/drivers/comedi/drivers/addi_apci_3xxx.c
@@ -787,7 +787,7 @@ static int apci3xxx_auto_attach(struct comedi_device *dev,
 			dev->irq = pcidev->irq;
 	}
 
-	n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao +
+	n_subdevices = (board->ai_n_chan ? 1 : 0) + board->has_ao +
 		       board->has_dig_in + board->has_dig_out +
 		       board->has_ttl_io;
 	ret = comedi_alloc_subdevices(dev, n_subdevices);
-- 
2.53.0

