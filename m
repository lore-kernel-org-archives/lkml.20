Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421F4C2240
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547864; cv=none; b=VIxzgVj0C2cEFsEeSOSVj71oA3H47MZeJfW5JOaQUuby1iProZ1h5+Sgo2pPrJEThbkU+2XhmgxFVEcZSEcedOiouXuMk2lLuv4ptEjB5S82Urr6OwvFHuD6dUjUvAoTFEKM6Tej4muaB940u5y7OLToGw+7j3AjrNyEqjM8jb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547864; c=relaxed/simple;
	bh=48l1YgFYeKXOz/sTOLbf7iit23nQ8/zlAFBYDfidJdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxRfLtljsVrNxVVLnL7DYpw2/DQ7jsDFMk/pkByvOPH+wbJr35av2UCPKAGgUhbO0FexEYXpsXgx8UOUhV0zBEKPq4O8ZMOkoh6fQfuaQvhdruxopMgyAibFQmXLBicLfihS7R1V9ImM2t+6nRugNrhvRuoIWjophGEzqtgqUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ZQEHOJUk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OCCsMtcU; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ZQEHOJUk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OCCsMtcU"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 0A22AEC09D4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 09 Oct 2026 08:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791547857; x=
	1791634257; bh=f1IVdFbHdnXwbvOZE93do7gE7+K5oEaUX+cysS8xcqI=; b=Z
	QEHOJUkLLxffKwDzstGQ5Q+j6iYR2jANUI2BpNeu4XBU1S3BkYdl/gYyvbcP0fVp
	wIDzJMmgmK3ZpaZxO9C9pwAlAvg5ivblxS1zEce0jahfIj6Z8dX0tCIhGKOcwZfz
	M0SbGLALlvEHhvckn+oflH82cusyewiDybAQTTPQh35klXkLErwcFJ9UL56DBU5R
	yZz6mCkH77eS7SWSgHZyR40Ow2wnh/+6jJ9BievYFvTtibfHapcAnqvUwoOR/iGN
	mNajBpNbigUvG/lwpJ8rLxFwBZOrlMmc0RdkiSuPUhd34mXjs10RjMvtwrbcCxcr
	H7gf8RmOiOxu/xYPldpTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791547857; x=1791634257; bh=f
	1IVdFbHdnXwbvOZE93do7gE7+K5oEaUX+cysS8xcqI=; b=OCCsMtcUTPesDDSFA
	WDJrwp4Jmg3+R3/vNz4Z2+n31j9xdL3wN01GnJzq7HmnpfyeR4ihR0RV1JxhPOdh
	/UsgWfZk20/NU4RheEtJkWyW/wpkuJ6sqdujY2wAVgZjZa6GlTrKTEtL168lK0OB
	KNtjd1a+SrEHQj9yqNKGeLcY5iKvSKw/XUq6yReH73YGgnxJI7GfkVyx6ctboMKI
	T2ibCIJ38k9JJ0RFjj7ML9pLmjhWYzSn89dKNpNdH5QBIHbZB8Ng7mwvcg8mqsfs
	6d15LQdxPMPXGdGWFQOb6nXplHYyI7vYw/81Abl7DkqhFPwak9XIwfcdkyE8Vepn
	zyeCA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547857; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:sIun7qbe/9DzYRfNvk4VPmk+w/YMTiUcccMZ3ADRHcCIbVx
	y/wNaHgtIw3MsMJbgOchzaoHqq7zH9a/x1oLcsT8zY1IDAb1onCskB8Z9Wt8kVLv
	GMezfCCLtKwrcumxSBiZwIypS1QCBKoCYnstS95q+GLZS6tR45iBbkVX1C64flew
	mOpllAWevXUp6+fQtoDjbNPBcXHMTSHRZMj6tG7rnVm0TJVTgE1/lgmiPeAupUhf
	qZahV0UpA2vrqAcyPlfORyS3F1pJFFfPAFzPs8+paflk1XOJ00vf9o1XLN4kax4x
	emvo6SVHStyHesS2+/opx2oH/6lFujgu0uCzt8A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1v0bMIK5mCi1aOcmkvsIDqSd8uI2ETpz6lfpMmvNhZE=:48l1YgFYeKXOz/sTOLbf7iit23nQ8/zlAFBYDfidJdo=;
X-ME-Sender: <xms:0NnIalWlssVxC6j22YBq1WQwsXItowVe5EqUh8SKF6sRdYNLXZEWqQ>
    <xme:0NnIajgM0fW6i3PvlLk81jWe60sS919V35nM2UYBDWD_pCQ97KPDqou5WI-YdeCCn
    -BMoA-btM1s50vQjFnfG5wjsSDRE6IrZbqJN0QXt5gyXzo4Pt0ItSBf>
X-ME-Received: <xmr:0NnIao8BYzjDS3ZSwpjSNepUky88iQT82hhPDXsKg-DXlW69-3yNGJhXSkya7KRTZTb1InQYv8-q7dOtkIZ9f4kJFkMYunkcMLX2mi6TBq_y1g>
X-ME-Proxy-Cause: dmFkZTEebFEt+pFrP9koh+qFAZ0KFxcdRzYXR8D5//vpTuK4xUtd7uNM16Xh6kh4X+VLKf
    3KZsS0L+nnqf77o9X/1Ewtl2JmxmA2WTTBVlDyew2mwxgoE8jdNIO/UGqgVZ5lP0sPzu5e
    DbozLadpVApv65vXrE5zskhqqIgaoR1M6k3wdcSczgsOVHbDF3x4xzN1TEJ2zaVroB4qii
    63DxsZI/GYx0hq1DmoL13O8njYH1HlaSVb43jFWlg4HtP0sqOO+cEAaTvm8o3t3LM9W1zF
    7GHBEWwMxkAHSY82lr09+EGLevqCE+dCO4p5nfIncXrfWvxQ8KPMlWwOAyobRGHaOd4WAh
    5qhqzy0pAqq4oqks16iF2ut7EQib3vpt/BXQPxRr7uCriaqpet6ohZEx5wLlM5A1qcg9fJ
    Im5EItPPS3T29n9nPgB9RK87v2E0Re4kXTLOMUeSAyuauWt5XQKJA0XiquMPpKV+6VXVqU
    8e6YkaNCTcuaEVhDSrafwFIUYYelxqfyFhu4etOE/ArgIqXrsYj3vedtBk8DYB5Tc1nPUN
    Z0lacnll2IHVif6ZVMJeyTOlQ/+FCYBPnIv98sDx3dDtTZUBsgMnU3hQUEVYrUcFQCb7Xs
    Rb3FOEe3MoF3yKtvoeLUAzdtiOLzZGb9iaSvL5ZGXVsruYJEP94Ejf77I82w
X-ME-Proxy: <xmx:0NnIalAP-gTWxmmoS8jBCom0zOiSdcYnUNo-4Q3SburUDYCKYHv-iw>
    <xmx:0NnIatIXjyH0Uht3Y2XK07PxDy36BwOOZrbiel2UGSWDIIzS9LTm2Q>
    <xmx:0NnIagnIvZy6RYQLuETAfLuGAtsusRo6LEUDy-zFRHZmZezRMpJO0w>
    <xmx:0NnIajFKUKk0j8-Za3s6aIPGNIHtCXmJWF8jyb5CBIMgqNO1bIMKZA>
    <xmx:0dnIalqyN9pM4d3PH-RZJxdz8fwgOqNrSm3Efc3cjNt9-Y2HZDbnTga8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] firewire: core: use sparse annotations and lockdep checks for topology map lock
Date: Fri,  9 Oct 2026 21:10:46 +0900
Message-ID: <20261009121048.282982-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
References: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects the topology map from concurrent access.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-topology.c    | 3 +++
 drivers/firewire/core-transaction.c | 3 +++
 2 files changed, 6 insertions(+)

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
index 2692e875b00a..e7cff597855b 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -1280,9 +1280,12 @@ static void handle_topology_map(struct fw_card *card, struct fw_request *request
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
-- 
2.53.0

