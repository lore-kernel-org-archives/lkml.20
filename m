Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467899;
	b=oGkyMDIMEirDiu5A2XqGt7I/QXxLSVVwsDmCDS1HSyg/8Qxjs/Kmp4GCPy3BQ9XLVTuF
	 azoqkHzgT3iq4M+TzP5V6LBnwZ+R43SiMjpGxwvTwAxqSSKqVHAvDKo8m1JEwIgOifgo/
	 wv237ygC7iLxYncT8TlI34A4bgfJ36Ljiqqlix5L/EISWzT5VKFbYb0OMV9v3YYIebddh
	 vzqJuCsFSlZ1dZj4AZDpohzJJBsiYFRQA9L3OI3KEjDOzh90DXdzXHQjeN8w4gbKQveQh
	 95tLGo8DHU3InxtjoggCmhogwzvLRYkPwqEA6RDWs/jJS5DTlqvUH/yblAselHELv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467899;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H3E+mWHbu+cguQWMunb6sV0QWqoncJc4BDKUdNfiQcY=;
	b=nk5TOzyTh3sD3TP3nMLLMixy1vJ46Esz2kjU/YF7Pxk9dX0tv0Y2/Prq7FQkg9acD1Td
	 fD35OWc+3ktC3ceCbGXomiQXUnQm4V1ZqpD3lMQtouwRsMZxkIXoMIuISyqouZuYYVEcp
	 /yRLF9Rc3VsfeqsS8dL1VKFWFVIiRRrdAuSfxoFWgFT2JQDW27pRg2mvlWJLKmO4FItQB
	 C1CU0QQDylC08k6Ea9LJMXkQln4F5kwu2uLLuiJ+8tJZhqPkiyfoUQIba/qDsRFpop/my
	 BI1vMF+d6q5YG8dTxEX5Pm0tH+RCOhOkmXf+ZjjSfOSMHOEGcpxZbNutcGAIivMChsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=eRIipwcp;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBA9606A887;
	Thu, 12 Nov 2026 07:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBA9606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=eRIipwcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=eRIipwcp+KKq3hAZcJ1+Hq6/BdrV9Q4N0cfEatJ9onszC/349kU2YDHgjlsyhLlaOO8FX9J+c6M2Z
	 0RcVOjl8q1/P47Oy5zlW/DXAIudBLg9ZS4QvG3RHv5iICJC7g7zPZUIPmxb6LgyMbb4KK/YCI4GxES
	 xTIBti8OsseHW7d0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af56812a9e-ab441;
	Thu, 12 Nov 2026 15:17:38 +0800 (CST)
X-RM-TRANSID:2ee36af56812a9e-ab441
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af56810924-f6d4f;
	Thu, 12 Nov 2026 15:17:38 +0800 (CST)
X-RM-TRANSID:2ee76af56810924-f6d4f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: briannorris@chromium.org
Cc: francesco@dolcini.it,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] wifi: mwifiex: Report register write errors through debugfs
Date: Thu, 12 Nov 2026 15:17:37 +0800
Message-ID: <20261112071737.154599-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

mwifiex_regrdwr_read() can issue a register write for a debugfs
request. It overwrites the write result with the buffer-copy result,
so userspace receives a normal response even if the firmware command
failed.

Return through the existing buffer cleanup path on a write error,
before copying a success response or advancing the file position.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/net/wireless/marvell/mwifiex/debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/debugfs.c b/drivers/net/wireless/marvell/mwifiex/debugfs.c
index 573768b6ad91..6cb3cf5706c0 100644
--- a/drivers/net/wireless/marvell/mwifiex/debugfs.c
+++ b/drivers/net/wireless/marvell/mwifiex/debugfs.c
@@ -470,6 +470,8 @@ mwifiex_regrdwr_read(struct file *file, char __user *ubuf,
 	if (saved_reg_value != UINT_MAX) {
 		ret = mwifiex_reg_write(priv, saved_reg_type, saved_reg_offset,
 					saved_reg_value);
+		if (ret)
+			goto done;
 
 		pos += snprintf(buf, PAGE_SIZE, "%u 0x%x 0x%x\n",
 				saved_reg_type, saved_reg_offset,
-- 
2.51.0



