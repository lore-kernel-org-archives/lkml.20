Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292880;
	b=zpOqoIPls7/vpLFMYSNHunDAgg5yLYinZU9F4c9FF0leRkFFkOraxVtSRZQep/thNDGV
	 scEkVcW19KQVJNSQaKaWitYwVDX2o11v0l+ANT7hlg9Y1sy34dsfhiblznixiqyUWE1T8
	 G+TwWvViH/kRDIINoKWz+BNLGmnucqesPJBkTWF1+tuH5eVcwwRXO7l6lTHXzxKXSkXG9
	 wqugFOEB36KfNRMjOWwExngUMLaL6IUONBPojrUFOxDerj0DWi5oRH+tujHVnCAMmfai9
	 5OhnFYxPzrgCzGMBSVMy/X9rjsNlbnRUwXJEeoQKQLzXnVePUobH2OQuixgDRR3JPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=08m/CEG1mSZXuOS69/J904h6YS+BrRhpMZj5iyz/fEQ=;
	b=DEpwd4uyreL40gr+CcOF5pRHsrBKxoMrJkK5zayXAO5pWTWkLSTlXt4AXvPhV6lXMUWm
	 XVmvPJgYFeS6QSW6cHTOd5M2I2+QSiNNJnpgElCE4IMANIgsHEYp3oKqrnKxLaijzLY6m
	 11MP6DoOlFd+fXMjOgc1nVYXtYxMCddSOJy4C3xez/Tqa1TOf5prThiTK7YaWu27aBLGR
	 7TPSqVxV7oaeTsa2s6U9mZDBIIB+A2XeHguzOwwHdAQ45xkNAaKsPBHNFZ2hC3MCCo2TV
	 RuBv+XEdtsi9csvtYM6iAh9ItLqraEOYJC1H14luKAmqglWbA0LSdcl6UPVkrvsEQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AI2mj5ak;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C6D60A2603;
	Tue, 10 Nov 2026 06:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C6D60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AI2mj5ak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AI2mj5akiKuKYNjkiiwBzxqhXvWfzF8eufsPl6C6tDiSA+NV0ljzolM30lElHTmlbaVyFCvGnpoeD
	 0lObH771o43RknN3u2F7cvnxKZ6rG6c8h+FFQUNIZTBMw7sW3DadNxP+Z5f3HmemM6rSRa+FSqy0rt
	 vZRxXfmiBlmcDjnw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2bc8c83e-6b654;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2ee46af2bc8c83e-6b654
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa119;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa119
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/22] usb: image: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:55 +0000
Message-ID: <20261110064105.20335-13-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/image/mdc800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index f7caa1c5cbb7..72cab4bfe01b 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -59,7 +59,7 @@
  * has been removed.
  *
  * version 0.6.0
- * Rewrite of this driver: The Emulation of the rs232 protocoll
+ * Rewrite of this driver: The Emulation of the rs232 protocol
  * has been removed from the driver. A special executeCommand function
  * for this driver is included to gphoto.
  * The driver supports two kind of communication to bulk endpoints.
-- 
2.53.0



