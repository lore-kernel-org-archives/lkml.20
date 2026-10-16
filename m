Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB338B131;
	Fri, 16 Oct 2026 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123918; cv=none; b=LbxKFBl8TO2qaAZTiDxFZlioIEBlwWIaNogz1qAgu86P6r2GrTYaSeYC9ozM4CyJEeCvHYXDAESv2npDT5r/y0DledswjJPKQDow+oxIcrsVloZZI5y+ezi6coia2unWG7eiUI1MxOAp8ngumtd5xgOlPzC4eYkWwjJTLGs1s48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123918; c=relaxed/simple;
	bh=QCLkgjR5ZfVT1rHhf/fe8hETiXOVaUURgRdedNFpbE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d82pH9u+SwsMZlBddkqGiLC29MxpVw8RasAHyerRxrcsag/mdzn6iwUODFb5zkOs8LIOM/s3hykwDyNs2evbDvYXKEZOeJzmblM7IYs4Vl5TMljf4RLaVFE4z6+z84/jOsjvOdNbIMwo/QhtJXfLK9agU93zjV5okMc2DBhrjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=axPF+pU/; arc=none smtp.client-ip=115.124.28.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="axPF+pU/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1792123909; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=9H82xnim5rIe3/Fqf9hS9ZcilU6bJXZktfj2YiZLLzs=;
	b=axPF+pU/xXEqokTXxHfL/9nzl0x1cJzMPLPoA2KU1kFtlTPvTviN2vsGHy7WIIrjjWuLsuUCkdiElCD2U22HoHAdGIAYdg6DbDTF+KRy0nZJDL6OIAoe356Onl8T4EBVur/DlljN+NYNA73JgU25CvCUUHY8iMQ2ka8BCLNStsI=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09096676|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0287086-0.00058061-0.970711;FP=10156249902215839964|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.jft.kHR_1792123907;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jft.kHR_1792123907 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 16 Oct 2026 12:11:48 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_eem: use GFP_ATOMIC for echo response buffer
Date: Fri, 16 Oct 2026 12:11:47 +0800
Message-ID: <20261016041147.2293994-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

eem_unwrap() is invoked from the URB completion callback (rx_complete)
in softirq/atomic context. The EEM echo command path allocates the
response buffer with kmalloc(skb2->len, GFP_KERNEL), which may sleep
and trigger "scheduling while atomic" or a panic. A malicious host can
reach this path by sending a bulk OUT transfer carrying an EEM command
header with bmEEMCmd=0.

Allocate the echo response buffer with GFP_ATOMIC, consistent with the
other allocations in this path (skb_clone, usb_ep_alloc_request,
usb_ep_queue). The subsequent ctx allocation has the same problem and
is fixed the same way.

Reviewed-by: Guo Zihao <guozh23@xiaopeng.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/usb/gadget/function/f_eem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index edbbadad6..b42f25ffb 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -455,14 +455,14 @@ static int eem_unwrap(struct gether *port,
 					goto next;
 				}
 
-				req->buf = kmalloc(skb2->len, GFP_KERNEL);
+				req->buf = kmalloc(skb2->len, GFP_ATOMIC);
 				if (!req->buf) {
 					usb_ep_free_request(ep, req);
 					dev_kfree_skb_any(skb2);
 					goto next;
 				}
 
-				ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+				ctx = kmalloc(sizeof(*ctx), GFP_ATOMIC);
 				if (!ctx) {
 					kfree(req->buf);
 					usb_ep_free_request(ep, req);
--
2.50.1

