Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297519;
	b=aYQyrmk0LZyDFsxQaEd3woWnn3e+vioHyg6WQwuHzt1vX9us0U2xYK0zNFaG5PbKTS79
	 MBRAKzhM8fSmwLdnkU8jEMYKR/9qlCxQzwrDdttUMhw1CJiLVzfW2dQFh/a2PSPk13Ry1
	 8fL4Z0XqyWNg40xtC4HtcOOWsIfd6+6nK6KcR7Xomc1DA5Y4SPBALnpYpUWKgLjt/U5hV
	 hUP2sHwbt16E5A2C6YgfwxAHwQpjpSHBMZLFL0z0d0v7JgBMImrYlbPXP7UCBsgYYWMfn
	 fDVnveHgdmL33tFdM6m3E6FYkBBJYDR2v5y6Ut4HLT1PEIlU/ZOJthuqtLjKkpHm8lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297519;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MIkKETPDKopSj2qx633NwzZl1BsL9LyD65cxss5a3yQ=;
	b=KCsnvA6JhnD2WhIB2bYr1sGC65jbvXydqJzD1QVLxW128wT40dLSF9qR5o0BqukLPyD2
	 aKIAE4dYJ79oyD3LOclsElC3rkSZiTze7ufoK3mTD0lN4PBrmZiUW6XaHa+FLQ5jgLJip
	 n/uvZWSroV8c9g3gLMgwaND6/N1I2yR6HaPjQph+nfWdqDghxV0GwvAc0vsqipdIus0B3
	 nMWOKHDupW4K0ZTKBmnluoRN5QeD14qSwl74Fub9DzaxLQ6iuG5I8/DSraBZ38ruACvH4
	 k7ASGwd684NNoIYEtfreQ0AwMznJhRyqSc1Zu6AausHQqKHTOFjtK1RVGFRyh3mBLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rSbCE8nV;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D9760A6F45;
	Tue, 10 Nov 2026 07:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D9760A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rSbCE8nV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rSbCE8nVhgyOdT7lYQOP6bE6MVkuIYhRd45/FKJ4GB5pN5IjCnOyLHNpC75yUfaaupf6tzsYds1Nf
	 8+jlgVTdxD0gcFUajMFGa6IINjMpTcVWNNrKltp+lR1eSxVQVg1RQbIueTckrzy6x0pM2e6BLVHye6
	 5dw7WxHcSUgYrL+w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2ceada31-08805;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee26af2ceada31-08805
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdeb;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdeb
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/22] usb: roles: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:21 +0000
Message-ID: <20261110075825.24946-19-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/roles/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139b68b5..8ea703e63ffb 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -414,7 +414,7 @@ usb_role_switch_register(struct device *parent,
 EXPORT_SYMBOL_GPL(usb_role_switch_register);
 
 /**
- * usb_role_switch_unregister - Unregsiter USB Role Switch
+ * usb_role_switch_unregister - Unregister USB Role Switch
  * @sw: USB Role Switch
  *
  * Unregister switch that was registered with usb_role_switch_register().
-- 
2.53.0



