Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292881;
	b=XvBRhLYV94lpH/gqnsUdfdNFQi3zNFpvmgzv57IjMI3nmc8aEFARfTlFtb0ykX41dpAx
	 TkRzjc/iyBA9HZrdIdGiwnSMstrTc5ZW2WVauMF6I8KPQDP+4zZ5BEuzRWsNA/NePc1jO
	 XGR1QxZkwVRM1CAJLOc1aTaBgrEknupmz2YyTQ6RpGe/GkEeJgnZJ39U8RPHhtcCV91r1
	 VDe2jI3waAl/U2la5ubObgpqXmZcEoBxmQatEDfk7GZstQsPMcGlr4FXGK+NW6BUy9LIh
	 npRmjxTnOcRArkEiCXNE6WaQCIMIz/7tuS+KJ8HnqB5zFUnbSI9uvGavY0oEtZOgpkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292881;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZcbuoKcmoM0xdN/PZYv5Je38NiolC63gdCP770nQ4GE=;
	b=dG9PR6DmvyrVpqYdlE2mWGewmKf3MzgkDdZDgXL7ihxUxoVbSE05mfhSAaLECsaKi1NG
	 +tnieq2/SPjd+mM878TFwZG0QTXNzCqoeHJ/K5JBbhYK4d9Yo3/WqBa7E49CUO4fj/eXq
	 ehr0Ifa3wZYuQrMSespCpMl6UCrilVrZS17zNjA7Ekv4Hcx9f8MGX1u3fV5ErMu72yhx3
	 8Quj7EFlYacDF+hV2VhObH+3GAn1Ok6mEeVl2hN0+edvQU/g9v4E3Z9/OYSxsz/sRwMGa
	 Md5n3d8lbNs//nPeBApxNED2xkXF6I4NAvUWA2rRS46KUv2+MuEsmCwzWQVmFWSLsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V7b9AxUo;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C74660A262E;
	Tue, 10 Nov 2026 06:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C74660A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V7b9AxUo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V7b9AxUotAwouXNq6RbQ51Cu9yMlv4xUIVpQ3W7QovuDd16SnhN1+Phb8CkCTwdPAl0Axw/t2lSGA
	 xoETIyYkziVo58LsJaKUDet8EUJNhlIQa4u/aET+xEZbrdcVdj/P+N0t4sp2urWYBc3avai3mYMVnG
	 4zvLjrgnXr87GJJo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2bc8c1f9-a75ec;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2ee16af2bc8c1f9-a75ec
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa120;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa120
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/22] usb: musb: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:58 +0000
Message-ID: <20261110064105.20335-16-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/musb/musb_host.c | 2 +-
 drivers/usb/musb/tusb6010.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 31b061248991..b8a502d2b08b 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -65,7 +65,7 @@
  * (Yes, bulk _could_ use more of the endpoints than that, and would even
  * benefit from it.)
  *
- * INTERUPPT and ISOCHRONOUS transfers are scheduled to the other endpoints.
+ * INTERRUPT and ISOCHRONOUS transfers are scheduled to the other endpoints.
  * So far that scheduling is both dumb and optimistic:  the endpoint will be
  * "claimed" until its software queue is no longer refilled.  No multiplexing
  * of transfers between endpoints, or anything clever.
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 1d9571f24a56..6a86bebc24ca 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -941,7 +941,7 @@ static void tusb_musb_enable(struct musb *musb)
 	musb_writel(tbase, TUSB_DMA_INT_MASK, 0x7fffffff);
 	musb_writel(tbase, TUSB_GPIO_INT_MASK, 0x1ff);
 
-	/* Clear all subsystem interrups */
+	/* Clear all subsystem interrupts */
 	musb_writel(tbase, TUSB_USBIP_INT_CLEAR, 0x7fffffff);
 	musb_writel(tbase, TUSB_DMA_INT_CLEAR, 0x7fffffff);
 	musb_writel(tbase, TUSB_GPIO_INT_CLEAR, 0x1ff);
-- 
2.53.0



