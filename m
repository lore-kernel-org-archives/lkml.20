Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2F36654F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700322; cv=none; b=jMPJ7r5Y+/l30nBa5FqKfFwHv24S1zSQgx7f+jFLu4kbOab8kiNmvNYC5A6fGnZ0fJ8RHb+OE1wzUVdD1Gw7ajhX5VIDj17E7R1ehZlZ0vfznTqE+fdFbGZ+rKDho1OQdzb7UebbihtpBIEFcSDa0VaZCp3gnaoiOSS+njuDgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700322; c=relaxed/simple;
	bh=OgV40XUP+Snn/jIWAtL569XB0VXuvzNmOfmBJgtjMc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ1uDklGnClhGfXCgN9PxZKCNG2uRG5KhyC3cRNF8ytxCYod+LBTgGHk9T/bGJOCKGZd2F9d7gAyvaAFK08UTDPJunpkhoeO844Zm1vyme0Jwq1WZdNt8NrK+tpz4UOK1sJBoLcx1ltnvfDns1RfhpXLC1QyGqYzRZVvidTF2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=T8eE25wc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D316FXrz; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="T8eE25wc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D316FXrz"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4162514000E5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 Oct 2026 02:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700316; x=
	1791786716; bh=RYACkoRa3z6j/g+Fl1YF9dpcgpltM9lLJ1ibxu1ITng=; b=T
	8eE25wcUdvjg1DjDFFetnaehdGOKbVWAREbFd1tEfym2tA1Tfg9qD4KCaxeALD1u
	ggGCnN50pu9K4J8okRs/mCn33UUBdi6vj0qsQy35LwSUfMvPTSlsQCaXgfXsij+x
	F9fla3Eq4eBEH7U6GnGGFOY4fP56pHUxla+aVRzvcHNlRO3XI9QBfCxHIxJtwbeI
	3hJATu51XGWudoSWY2pkj8wZZvkqSK1rDa3hXb6YrkK7u6P9bU4RG4WROwJ2dX5U
	eXIE4JMvzwM8WlUqOJSnfDHoIon7vQ8NNh3eBAhlofUyh0UQ0SI8WTpvig99YKu1
	FVdSZ6fnxtlidgFZOLRHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700316; x=1791786716; bh=R
	YACkoRa3z6j/g+Fl1YF9dpcgpltM9lLJ1ibxu1ITng=; b=D316FXrzv3/YxGDvk
	j6WkFm3KSZgZDrmurQi+qx4YTC8PmMWHRXx96CpklH9K1UZIYxLrBRBPhE8xGArK
	KnhjgQmurqUnS5EhVIqnnZMLntQoMiCk+FxdP/il1b0+ypI0rBoCorNpHDXMC0ob
	n0we3OQ38zUY8k/xYlI5u69SLgN/hHsb63c68+Vn7t5btCDCrOwl9Nv4wY32gyu0
	rPK1O3r8sV9HWwyDmA51eESKhK3188+dqiyyD2GUlBBktkadCCfKWCv/0g7HPKY0
	EWaEbcZ2sCO68IsRDZXXuZctljjvA422hfhKLMLY/qWbrSSdXmsKoWNaxHWHD2o2
	UNv0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700316; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:UpnI8AwLewhgkWq1GjWOlUs+wjPheCEN2BjYF8vnYwUl3fL
	gKL5tmNiQNYOXeHOLItZfd58llgY8MVOxYOZC110Q2EmFDIo8MyUXr98e71GUu2c
	hqlyc241c/WyjrJky9EBpYFqWkyAOAbQ1aXMcz7hmPwp9lVkutTCo6lckTojHaWl
	wnJGKie4gE196G7TArDj8EeTNwwZwmpMm5EK+w1joGxFW3KgUMi2oOaley3BBPXl
	BYD3zLFBxvV60hMQ67bjb2NdVuQKGQ3vuNT1f6itKcg8OBnq63hLqwIFjbwoPpeH
	HeJUnSuBpyahOMJWUWdxauQuBKHSk0Ltc0+2gpQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OzAapU7T/CbEDV84E3RWx7qJ0FO677Xvr9BhvPombZY=:OgV40XUP+Snn/jIWAtL569XB0VXuvzNmOfmBJgtjMc0=;
X-ME-Sender: <xms:XC3LavjbeLJBRjGOXtgbUEjsxASzmlNnwN4sJVdkj0T9qpLqaA9EBw>
    <xme:XC3Lap_BkJOVdbpvItpxTzwH-Lldbv5icW5l3t_jb2PZ5sQaCDSuAnM6HbqF4kuFs
    BaQBVf98tewqlUB60zQHczbKVIkTXwSL8KKdiJGHkpb38RMMwYyUWJl>
X-ME-Received: <xmr:XC3LamrI8Syv_O4OeWIF4nwP3YRUFHvYD42OUMbx2mVSLHlY47V71oaemVCNkelr-kCoBBIrq8-PxsLBDrs-tgufmEHG7bo0TIg1GPAfozCBAuI>
X-ME-Proxy-Cause: dmFkZTGFS8qHmcjxDPmSffJ0757mmHR0PWt6unCkY+ASghbes4WqIB6FPaCfTxKwLMI7bP
    gCfcUCfM60H2VvIoM3/Ep8flvN2ME7Eo/y/RdCOGk4eczoyzuX62BeXjK38ZURzw+TpIHs
    nB72xqFmF+8vw4Kr9HRSFqcqBLzhWNcd49DbeIcmvhlfINdI86s/gU+7BlN0PCLdd54CHs
    oCjNvDP6xf38ZXATlS+eJolPS0pUJxWE4Znok8eaqOqga6J8pEihhJjNbx2k9LoN6IzA/3
    3+/E4qm0uy+yIEK26jQy85s4xwUaWM9T3RkGIh1ewe6dv6CfQQpd1ehLGsOE2OIePwFadx
    c+ofj1f/irN1zWivVG8dnCulfnE5dbx5fwB6UN7mHCc+PzX7TGktniExxpF2LuBj9hHkcK
    apHr7sXl+NwKokCJahb0Ldolv5TL/bc32R9kxrkTvHhJb54rCs9cjkYRDAmHfh+WEArJc4
    g4Xij5OO9p5PuWIcWX82CLAuGIUx2rck3qse+d7PMw5OHqhk/UK6IKHJ+fkBxcu3THOEIB
    SXHQqRYEmmiLuHqrrOq/Y/DKJkamBe/OTO1PtQabGHlybh2q7glwlfVKyecXGZgEzpVNlq
    wfuQav7F3doqLqSx9dbvp9WkJzi99uMDKqEs8bJT+FsqIGS3t4WGnXTCzoSg
X-ME-Proxy: <xmx:XC3Lao98Uai0fmUotpJnWGXyi9NNBoV5sp6vuUcjJqOinY4tJxRtEQ>
    <xmx:XC3LaqU1A5JnJMqS9167O3DJbrU_KEOqj0f7ub1E0DSarwAuP4P_Yg>
    <xmx:XC3LauAMfknPeM46R_ajdOtdav7wZSpUlZju9Bl2jlglpHV9GJsN0w>
    <xmx:XC3LarzDOt0SZL_mMNXAX2c8IDZIgFC7O9cy6NsxwWjdj6-tGXSWww>
    <xmx:XC3LalWe_HxRUsB0AGPVu4EwaVKbjMiBSXPXT316XFjSaJfVUdAfXNfp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] firewire: core: use context analysis annotations and lockdep checks for topology map lock
Date: Sun, 11 Oct 2026 15:31:45 +0900
Message-ID: <20261011063146.497455-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
References: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects the topology map from concurrent access.

Add context analysis annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-topology.c    | 3 +++
 drivers/firewire/core-transaction.c | 3 +++
 include/linux/firewire.h            | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-topology.c b/drivers/firewire/core-topology.c
index ee6b54f89859..512b7e4473af 100644
--- a/drivers/firewire/core-topology.c
+++ b/drivers/firewire/core-topology.c
@@ -474,9 +474,12 @@ static void update_topology_map(__be32 *buffer, size_t buffer_size, int root_nod
 
 void fw_core_handle_bus_reset(struct fw_card *card, int node_id, int generation,
 			      int self_id_count, u32 *self_ids, bool bm_abdicate)
+__must_not_hold(&card->topology_map.lock)
 {
 	struct fw_node *local_node;
 
+	lockdep_assert_not_held(&card->topology_map.lock);
+
 	trace_bus_reset_handle(card->index, generation, node_id, bm_abdicate, self_ids, self_id_count);
 
 	scoped_guard(spinlock, &card->lock) {
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index bd6d28f9bc50..ec04bd82831c 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -1288,9 +1288,12 @@ static void handle_topology_map(struct fw_card *card, struct fw_request *request
 		int tcode, int destination, int source, int generation,
 		unsigned long long offset, void *payload, size_t length,
 		void *callback_data)
+__must_not_hold(&card->topology_map.lock)
 {
 	int start;
 
+	lockdep_assert_not_held(&card->topology_map.lock);
+
 	if (!tcode_is_read_request(tcode)) {
 		fw_send_response(card, request, RCODE_TYPE_ERROR);
 		return;
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index a3660ad1a1d4..b55c2fdd739d 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -139,7 +139,7 @@ struct fw_card {
 	u32 broadcast_channel;
 
 	struct {
-		__be32 buffer[(CSR_TOPOLOGY_MAP_END - CSR_TOPOLOGY_MAP) / 4];
+		__be32 buffer[(CSR_TOPOLOGY_MAP_END - CSR_TOPOLOGY_MAP) / 4] __guarded_by(&lock);
 		spinlock_t lock;
 	} topology_map;
 
-- 
2.53.0

