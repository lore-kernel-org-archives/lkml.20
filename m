Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672143815FD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184217; cv=none; b=ITXYxzGfjvrtp6lHsic17+6qjfoeaiz+X+r5yWtM1cx2NdlFucKdEoyNL4QJKdSlYhJqbi6/grSNrsizz3vM5uLmiWpM0GnwyDzvp4K5LPlOmutlGnlTLA4h0t9j8A+CUKVUon58iISM0GaIjkKRgkIShqYGGfo7kl4IqcMSDFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184217; c=relaxed/simple;
	bh=1safN3GRZqc6aPrQj4LJpCTgwlsNWsgMoAcYEcFfNd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0zTntlIy7dlACbGTU/xAwzGvTVycK3YBxM6A6i9zKOH5VWBab4u1RSj9UjdQkNWQIRLU1Dfe3Jd/XE12MjPnsXr/PFFKYqADXFF/nvC+YF7JRBexxT2tBA/9TQUi69205l3bmBKfBRB2MdcOnMw5Bgfbnw+cdigAQ/q4JwTyao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=haw2UZOi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wTXGVO6y; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="haw2UZOi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wTXGVO6y"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 873791400140;
	Wed, 23 Sep 2026 13:23:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 23 Sep 2026 13:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790184214; x=
	1790270614; bh=HBY4HPF+vQfyFxx3H/SDvF3xkXyFwgp1v5OH/yHITpY=; b=h
	aw2UZOiAjUyghnG2kiClVlEWdBb+S4md9GdK2yOzdO/n2YPJDC4M6YD9Tv/YrZr7
	DUOkHq2XKX57ZxbZSGfT7ZcCrdIAZ/BIbGr6vMcF0w+UH9ztiV2uCq3HAhiX5rjs
	gpF7hsO+Kr34cXXPtvcHZUp0wnuoHy1sZlOhTh0yNKKyxsX/wc26wRpWK2DIPoIK
	WcJJ5IarM77KlLrQ+AgrQEA9HaqW/VOCqrWheo27agIxVKy4pSQ1rOvqPLa1d4zY
	Gw8HA838ixQe71u4wMU8P+oSoEiz8RR6J54mj9LMi7P1hjysFGD9dq5UPgJkN0+u
	0ytJOAMTdxVLUEaJzQnfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790184214; x=1790270614; bh=H
	BY4HPF+vQfyFxx3H/SDvF3xkXyFwgp1v5OH/yHITpY=; b=wTXGVO6yU6B8WFQTE
	rXNsD/K9nGUu4jXA+c+lZOB5VL5GABIsCvHH29S0xhP1e/liSQLsJ1GsjJ3Lmnpl
	CV7nJxWPLjnqfYTChcy1Wg4BcUkILEzXp2WOaruqxQ+b7Sq9aCHM5Zyc5/66TUoa
	MXvZlMTeKGB2rLQhgrjAomsD162iNH+c309GGo6qdcMduKe3FyOZ8P1zhfOoFcYk
	y1ma75ut9cjtUMLbWkmv/rHuHlAbBgxivyo/pWCO5QM+6x3blr8GVpllazOGLf+B
	pUnPxCAmexFSdU74KnduNPYHlsI1WARGd5h157KcF9/Dkn9DfqkncziQpFDhJj1A
	qP7Cw==
X-ME-Sender: <xms:Fgu0ar1zfbXVjszQLg_0uVqyW9rLMAe_GVGvCFkg6r4AR2ABNF3Dqw>
    <xme:Fgu0ah2ZbH04B8iIMXdg1s4h5Q_IRxX2VIadEUdekz3OESHoKcHTaFVMRBmp-pPQU
    8iaoTSMwX2jnk0rv9iXKnrqk9x7FYbACvJk42-S8SGIowEDc3AIRxI>
X-ME-Received: <xmr:Fgu0au-66q9rpdsJeyd7obSPP77caUmyyVOrUroCyXjI7OwXdApyH09-04O_Q5kz3T31DhH3fWLvbi_Z4ggvNuQ2iXlIWfgTNCcKkLK0Bp4C>
X-ME-Proxy-Cause: dmFkZTFOSPiV9S4Tym9ufogoWa+BoZ59lx2mKns53WukYdMm/vQLVUZ2Udve0Uu55Bdgrm
    4B0QZM7RJLORxjeR58nDPzDGrIQs6R+n18otjxXbNmmTgY/+cm4nBRdd5XH5nR9WiBSWfr
    8Z1OBAS8prrW1R8mkcUlKW0Lz/MQNKuR1vQnHzNaTfVAJZem0E9nuWUdIC6VwUQbfStAYp
    juMLekbBnyAtw2UWTAkTZmBLmE2Cj3C9muNuCFzO50IlVCqOn/ZEa795gmuyLb6wb/1bMQ
    NyfP9QiEblhLIv/CUCQ4MKmt5enqeDzJ3uWRCLWsjBeB0m/e67o1V/OPBuYFexTzI1jIMy
    CJkwmE8xYtQ4D/k47Q25gsJ3JevwUG3FvfPlUUDRhEyV8Cw0WnWpLIfEcGu6sBkRYTnqzo
    JX5XR76p2P0sYKHXD535JuSwGcjAYywKKjRzS+dp2Hv53Af35ih5hPLFUU0fFUqfqROoIL
    jbJyMGjr4tZjzDLe2Lly6Sp1rdAOrr1Z4I4/MRi0ACU3/YbSfqlGtO56cJgLRlZxr77Ha1
    wUI5X4EsS2VdSWA4wsumq9/iSMOhb7/79OJkARO7g9Kikw+5ysR3Rh9mgsJq60sqQKsyN+
    ualWwbPnJJSuwDZvWgyNxDHJ0mjv2nCly0MYYHOqMHc7XiKh8vhfOE24UZCw
X-ME-Proxy: <xmx:Fgu0au3SyWtzpsM4a5T6Ao5eEmWKOr1NGgsGDFyo-Qj2ozjNXLZ60Q>
    <xmx:Fgu0ar_Gvp7z_usmJmDfo5Ni-STzk5Xl1fgFG1Cc-HoeyTIXqH6Qdw>
    <xmx:Fgu0auv5DDsedKCVDDCVFpVaVjkBO7CPS34SCcgvU0aoIGryNKs2Ng>
    <xmx:Fgu0auCYnWmRhmQBCXKeDW1h-KNdO9EOy89Ii_8DoxpkggrW5ZpPuQ>
    <xmx:Fgu0alCzG--eb1zlvsj1W5Sytzen2S6hx6UYxt8wu4_Lu4HkWS0ScM1T>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Sep 2026 13:23:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: dingiso.kernel@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: cdev: hold client reference for fw_iso_resource_auto lifetime
Date: Thu, 24 Sep 2026 02:23:27 +0900
Message-ID: <20260923172328.277232-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
References: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fw_iso_resource_auto object can outlive the operation that created
it since hte main operation for it is done in a work item. This work and
release paths access members of the client structure, therefore the
client structure must remain valid for the lifetime of an
fw_iso_resource_auto object.

Hold a reference to the client structure for the lifetime of the
fw_iso_resource_auto object.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 50419f10b04f..9964c66f2989 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1406,6 +1406,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 			// xarray and prepare for deletion, unless the client is shutting down.
 			scoped_guard(spinlock_irq,  &client->lock) {
 				if (!client->in_shutdown && xa_erase(&client->resource_xa, index)) {
+					// For the incrementation by add_client_resource().
 					client_put(client);
 					free = true;
 				}
@@ -1445,6 +1446,9 @@ static void iso_resource_auto_work(struct work_struct *work)
 		kfree(r->e_alloc);
 		kfree(r->e_dealloc);
 		kfree(r);
+
+		// For the incrementation by ioctl_allocate_iso_resource().
+		client_put(client);
 	}
  out:
 	client_put(client);
@@ -1491,6 +1495,7 @@ static int ioctl_allocate_iso_resource(struct client *client, union ioctl_arg *a
 	if (err < 0)
 		return err;
 	request->handle = r->resource.handle;
+	client_get(client);
 
 	retain_and_null_ptr(e1);
 	retain_and_null_ptr(e2);
-- 
2.53.0

