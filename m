Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613911;
	b=aYgsjwpC8gzsJbwxboyKNP21Iyn8S/AKC8ab/j0cvWhlO3VKbfdOJKtaxzY0cP0ifcKd
	 cm/4AsLwzv1UbFjH1vl7lLMHEA+y2TC2JoFOCCjH8YwwphLkl743WTfCLs6RUKrUT89m/
	 /Vdeo0DfR09FiU7oFsmO7XpwOqX9fubykBDwh14I6Tvl86jdHINGLUhCE+Da0RIVSAkb6
	 jKpHhpSg71/5EU44Gwz7Ee+NxBjTMhOEwgx2+sApYaJnmJypXz46wrigtQ5cF1fgCG+j+
	 qukZWjZd4h1op/Nb9kUabPVqsFwKqjQfWMj/6u+4nMwIWp89gzvFqyQ1cyn9WS/7G5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613911;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GR7UashLX+13F5upKQIzi9GqHllM5K/s5VQnjcq4Ab4=;
	b=B7NcH8BzUigqpkZWv0+TkE9y7uJhM7EzDm7kZPJxJAXLRCQRuzq5gIdXdwPN06xk/kgm
	 bA0GZSmcBp5EAVHwJjSHuhJyiOgtWwMF2/sdAP26+XA8zl5SgjfMB0YBFARj03bnmO+NH
	 E/t1QE/FE0yAW2Q/VyVct4QzH4AKDi1Tt+lUyNQh05SJBOaGk1NTxoiQzX8fojxVFQPvh
	 KCFntk1ExBqgPTpdf9Yulds5Jqh5W8fMPtDpxeQcCvgZdwlZESMMxdAHXJJk5uMeCf6V5
	 YkUTnaEBUf9ZZVuJCNXUjwqa8FikB/NKWMpDHbWkFScQeckNTg4Id7Q6VbOfo7kjBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CxCQ3sIA;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC90606A326;
	Mon,  2 Nov 2026 10:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC90606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CxCQ3sIA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CxCQ3sIA2c3HEr5WglJjgVc7ramAphQcCVjj7BifbvkUGUnF9mpP9txEKYW1IbJPtZ7U4KUXb1ow0
	 R6Jeewz89vM7DdWT3ROyCWcUZST2bGwnUjj/XLRd4LpLIJfKhpcDYeyvl9pf8OwT+QzYhcmgH9NUjx
	 r6UHXXJlHX40alp8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae8604911d-6508e;
	Mon, 02 Nov 2026 18:04:58 +0800 (CST)
X-RM-TRANSID:2ee16ae8604911d-6508e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae860489aa-ce4bd;
	Mon, 02 Nov 2026 18:04:58 +0800 (CST)
X-RM-TRANSID:2ee76ae860489aa-ce4bd
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
Date: Mon,  2 Nov 2026 18:04:54 +0800
Message-ID: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
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

On on-chip configurations r8a66597_clock_enable() enables the clock
with clk_prepare_enable() but ignores its return value, and if the
subsequent register access times out the function returns -ENXIO
without disabling the clock again. The caller r8a66597_probe() then
only does a clk_put(), so the clock is left prepared and enabled.

Check the return value of clk_prepare_enable() and disable the clock
on the error path.

Fixes: 9b547a882e9f ("usb: r8a66597-hcd: Convert to clk_prepare/unprepare")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/usb/host/r8a66597-hcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 0a26489a4..e3325df05 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -79,14 +79,18 @@ static int r8a66597_clock_enable(struct r8a66597 *r8a66597)
 {
 	u16 tmp;
 	int i = 0;
+	int ret;
 
 	if (r8a66597->pdata->on_chip) {
-		clk_prepare_enable(r8a66597->clk);
+		ret = clk_prepare_enable(r8a66597->clk);
+		if (ret)
+			return ret;
 		do {
 			r8a66597_write(r8a66597, SCKE, SYSCFG0);
 			tmp = r8a66597_read(r8a66597, SYSCFG0);
 			if (i++ > 1000) {
 				printk(KERN_ERR "r8a66597: reg access fail.\n");
+				clk_disable_unprepare(r8a66597->clk);
 				return -ENXIO;
 			}
 		} while ((tmp & SCKE) != SCKE);


