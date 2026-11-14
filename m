Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652508;
	b=aM8VigFj3qLkJEKsdJg1i8M7bEj4Peh9wiiX95KtrYBAehghVPD8lehlpB8uTuZGrs7E
	 +33Z0QgCMx+2FhEdN7aDVoSI+TFzcNzkYL5JNrcWMPVGUKEtGXbqt7mDcCZv+YuMmXJAb
	 VeaV1pxnFKwTP9Of8ZzUbzjURllWtOf/wIknkQs/6PVz8ZH0BKRautkYWoYSLUyJ+7PHW
	 mZK2F/aCx76J1I5Mf4gMlrIHxvhvk5HCgSDcA+hcJ9f3lDB3pxjeexEcRqKLldwJ1xlQi
	 n/6MM123kPLIIFcWvHQ84Cgw6Ac4hind3tRUu99VkGW7GpgGp8bYFCk43TnLNeNc+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652508;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rIeGr1ZfHqgP5C0CTq+IjubXxO1HLLI0c0lBMd1W29c=;
	b=ztVuT80mlEn4JLfJNMJ+fWDVzXfUNrWRpHys5T8SB0wKh13uE8R3t4Rp/Oe3vFaqq0LU
	 xn7dDDfYsDSYEWcxZHb+O4938ek2JXKizb7bokfjHntuNBaaj8Zus5cvywlnPKRoNFaVA
	 mTVBFqW7CynUNmwS4iRZ6ZUeyMwc5O4U6DoC5hDTL696WW2VIOdoUtHo+HZ1Rz1OtpLHm
	 gN0p1e8l7KRWTo+4McS97rCKWRAXscyfjEkeH3Tkp6LUVebFhQ9Il9Odk2KhiBRlyOpiH
	 4voDZbtdEWQ+JaYmmV16TFbvFYnd67m+Qjuyuqh50YeDZtqAZspA4/voW5ObHcX1L7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CYZX7uef;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411DC606A333;
	Sat, 14 Nov 2026 10:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411DC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CYZX7uef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CYZX7uefb6it+jNZqwbPLU3dltX9Gpz40G5CwyIQm6ijKJl1qWxvDd+fB7hKcbfwp0UwYi0Asgylf
	 S2jBZ6+tvCK2i3LwWpbvG6N7pfmjArqx+A3zXwcE5Z9kSPXYrjQgDCP/wDvIxAX9gPiPGrt55G3kxK
	 VUCKTUS5TMAo7zYo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af8394c1b8-ee994;
	Sat, 14 Nov 2026 18:34:55 +0800 (CST)
X-RM-TRANSID:2ee56af8394c1b8-ee994
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af8394d13d-41ce7;
	Sat, 14 Nov 2026 18:34:55 +0800 (CST)
X-RM-TRANSID:2ee86af8394d13d-41ce7
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: netcp: fix queue name buffer size
Date: Sat, 14 Nov 2026 18:34:52 +0800
Message-ID: <20261114103452.943-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

netcp_txpipe_open() and netcp_setup_navigator_resources() format a queue
or pool name into a 16 byte stack buffer.  The longest of these names is
"rx-fdq-<devname>-<n>": 7 characters of prefix, IFNAMSIZ - 1 (15)
characters of device name, a dash and the queue index, so it needs up to
35 bytes.

Building the driver with W=1 reports a -Wformat-truncation warning for
each snprintf() that formats ndev->name, e.g. for "rx-pool-%s" the
compiler warns that the %s directive may write up to 15 bytes into a
region of size 8.

netcp_txpipe_open() formats dev_name(dev), which is not bounded by
IFNAMSIZ either, so size that buffer the same way.

The names are only used for knav debugfs entries and for dev_dbg() and
dev_err() messages, so nothing changes apart from the names no longer
being cut short.

Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index f5e093dc9..a746b0348 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -1327,7 +1327,7 @@ int netcp_txpipe_open(struct netcp_tx_pipe *tx_pipe)
 	struct device *dev = tx_pipe->netcp_device->device;
 	struct knav_dma_cfg config;
 	int ret = 0;
-	u8 name[16];
+	u8 name[40];
 
 	memset(&config, 0, sizeof(config));
 	config.direction = DMA_MEM_TO_DEV;
@@ -1584,7 +1584,7 @@ static int netcp_setup_navigator_resources(struct net_device *ndev)
 	struct knav_queue_notify_config notify_cfg;
 	struct knav_dma_cfg config;
 	u32 last_fdq = 0;
-	u8 name[16];
+	u8 name[40];
 	int ret;
 	int i;
 


