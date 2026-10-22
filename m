Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677008;
	b=B98a6e2cARLSrLC5clcb06Z3+YVyyZPALOaBif2Wi2pGUeAUbKCB0lkb2vRRB0Sj7N4H
	 +g4W4QEkZ2ehH2UnsQLeOosbIsb9ibSFbuZVOGDBW+BdmGn6amj/XAUicGeQ8U0d81yH9
	 CCK3w6LpGExAzDE9U9vZXiZnwf/0HBRpRcZ5D+ZChueX4/HCZcjYwZSv1kCSvaB4sNaXY
	 KSoZlYzI1KzVGEc1GRh/W0gW1NGqJ3OCvzpa3vYb6f3z/2XIFRnqmvoeMpC4zPftqI5Xj
	 NyjqvuMQmEX3X6AxNGG1O5j6eDModa6OOx046zl5PT+rtTaGzvaLAIGIXsHkljiMjBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677008;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=p4EAUH5+wKS7RKX2hJH8PUg8FImMtmWSRGw0eMoplYQ=;
	b=5kfMcgxQ5ua/yZyN1rRDKe4wT4yhOP/JFJuWpBHz5GKcanW5WHxdOLpLgLGxBvBPcjrA
	 sFuwFsPbmoFMKUeeKCJJa+Wp92kOgXjsHIPsFxjQkWPbSEs1TOrTK2eNUfzjeRW2r9JUB
	 uXl5znz4vlEE5DRbrBGDAYzFtGHDRoqNwBHS+tyLlFvYwpxoigslA2C5ST6NbT0Z+PcjM
	 TQ0gXAyPqdE6FKE89Cgrk6uGWfjMv6pqkhm064HrRuYMk4zc5k+5mYMyY/P4GU/Jn0PM7
	 Qe7XY057LmHld/zPMinnlYeeIHbyNHzX3bBnA1Iaelyx+P5ict0UVuvhQiUhZgi4+ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=wE5iZ+Dq;
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4660A6F72
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F4660A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=wE5iZ+Dq
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 22 Oct 2026 15:50:04 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: gregkh@linuxfoundation.org,
	andrzej.p@samsung.com,
	jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com,
	zzzccc427@gmail.com,
	bigeasy@linutronix.de,
	nab@linux-iscsi.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH 3/3] usb: gadget: f_tcm: don't hold dep_lock across unregister_gadget_item()
Date: Thu, 22 Oct 2026 15:49:26 +0200
Message-ID: <20261022134926.1125473-3-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022134926.1125473-1-sst@poczta.fm>
References: <20261022134926.1125473-1-sst@poczta.fm>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1792677005; bh=p4EAUH5+wKS7RKX2hJH8PUg8FImMtmWSRGw0eMoplYQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=wE5iZ+Dq0ZsqXKwXGwzLrGHxOoPaYiboGxpgiDMILyl8RueOyAjxyiPKoCAjuCLQt
	 MHaq84tyZJIKWp3yVIaqypzWJIvrKodo4s7b76pm6WVjI8mGOvYW1yEpbWceDdjmbN
	 yyAWPI7d+H3iVfOr04jDB8Z4Cc4BkUeOHxPxcwcc=

tcm_unregister_callback() runs when a TPG is disabled and unbinds the
configfs gadget via unregister_gadget_item() while holding
opts->dep_lock. unregister_gadget_item() takes gi->lock.

The opposite order is taken when a UDC is assigned to the gadget:
gadget_dev_desc_UDC_store() holds gi->lock across
usb_gadget_register_driver(), which binds the configuration and ends
up in tcm_bind(), which takes opts->dep_lock:

  CPU0: echo 0 > .../tpgt_N/enable    CPU1: echo <udc> > .../UDC
  tcm_unregister_callback()           gadget_dev_desc_UDC_store()
    mutex_lock(&opts->dep_lock)         mutex_lock(&gi->lock)
                                        ...
                                          tcm_bind()
                                            mutex_lock(&opts->dep_lock)
    unregister_gadget_item()
      mutex_lock(&gi->lock)

Disabling a TPG while a UDC is being assigned can therefore deadlock.

Here dep_lock only needs to cover the can_attach update, so clear
can_attach under the lock and call unregister_gadget_item() after
dropping it. Once can_attach is false, any later tcm_bind() fails with
-ENODEV, and a bind that already passed the check is undone by the
unregister that follows. The function item, and with it the gadget
item reached via ci_parent, stays alive because the TPG still holds a
configfs dependency on it.

Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/usb/gadget/function/f_tcm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index bcf11f4405ae..d4bb7ad3f1ae 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2648,10 +2648,11 @@ static void tcm_unregister_callback(struct usb_function_instance *f)
 	struct f_tcm_opts *opts = container_of(f, struct f_tcm_opts, func_inst);
 
 	mutex_lock(&opts->dep_lock);
-	unregister_gadget_item(opts->
-		func_inst.group.cg_item.ci_parent->ci_parent);
 	opts->can_attach = false;
 	mutex_unlock(&opts->dep_lock);
+
+	/* Takes gi->lock; UDC_store holds gi->lock while tcm_bind() takes dep_lock. */
+	unregister_gadget_item(opts->func_inst.group.cg_item.ci_parent->ci_parent);
 }
 
 static int usbg_attach(struct usbg_tpg *tpg)
-- 
2.56.0

