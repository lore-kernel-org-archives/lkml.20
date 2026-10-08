Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69C48E0D5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503087; cv=none; b=ir7NWzOP2QYs4c2ePOTYIP+jWspZioBZ+2I6gseJEWJss6rdH/iZNx5mjeQaDesZw0rgzNJqewIBtS/EuvgbtTqsDf5BIMdmc2g2rOcKnRUhtn3/vPljLxeZIwI7tyTnOzGxXunRa4jjGljR/54bmhBboziwP09dBivDQC5eLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503087; c=relaxed/simple;
	bh=E0rzPDO07fCB+989aujQx38idDPyKjNuG/vKYoc6g6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8OkaSmc9FN0uts2WlHQ+55xiM6cxl9tN7diEXbmpqxOAzZnU9ihtl0kozVg7FceCyEL8yyYnadRmmoNb9FiHeD3LwXvyWYGqxI3P7c9fybdXEtpiUihQmz/FDHlAw3dEcqsBFf/fD6Jvx9O3XjcbcmC3bfgH/Lxlp7DACCl1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=WENYVARk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G5e916N+; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="WENYVARk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G5e916N+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4660D7A0078
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 08 Oct 2026 19:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503084; x=
	1791589484; bh=ZIgWNVvLAWrnzcxsX4WL83qKjyDWvkXOBwvQub86Ucc=; b=W
	ENYVARk4Lm9Njyuige3zK0oY6ZQP8tSiPdBtc85SwjnxLCkAuaHT+yOxMP+bEM//
	yySnmbM9dN2orkxBrSPid7F6LR4dt6ZH+MMHeOhfSRRyU7UJyg5QJkKMikFkdr4H
	1BarRX2PF0SRtiDtOUbx7MnVmbjBZZKAFVtbmA11DJ99r9lC3D6IieD1mQUVlQ5Y
	IMLJEJiqfSNbeeHW6WwjEuMHq/sV9LP3z9vmBd4JBZ/KUX27oaMM/MJ4JaHxwwlh
	aSmxsFHxHITTE5beYlqX2KFCMxEaG8PTL05aGRADpYL9lQ3deOR7IoytiX+clBQB
	5FU/5gQxM8mJqQXsIVjkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503084; x=1791589484; bh=Z
	IgWNVvLAWrnzcxsX4WL83qKjyDWvkXOBwvQub86Ucc=; b=G5e916N+UA8PjK8tG
	PuQNIN7jwbH2obrE1Vp6ivzjYujv2DKArHlsUCNYmv5bL6eEuT44scb2LaCbpgnR
	Z08D4bdjwtgrMECyWiPbsKU1LwT7S7nvIx6oT6GBwiNMTOa0ZsofQNMy7Y4qTTKM
	dYs9N0e1q6UWXH/f6Qwd9/bh6y7gi2hNHrGIrlW7WTWdj0WHyeAcRabw6yD4Lzy0
	XgKPdFFZ5x/tCVam0yfdBwdaUYbNlKYanhBrOUx2Cg354eYv87KcuJR2VxYUujAW
	99zQ0kUelsoziBt6axAVy61mAEYBFzFuVMKQbmYdF26at78D5Gug/+cY1SxAlUjr
	d7FrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503084; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:NH0f8hiVJE7kKkv5c+HkB85Y+99EnJU8c77sw2Cf8/S7SKa
	ZouSJW0eES/RvkO8rygG4df7Q0dRcRgCM7xN1+70DyqKJikxandyLaMhJ8zSVlDO
	U1FvnSGdOAedM//GOMEfVsESKlxmhYWj+Q2XT/Yg5W/SUb+PDw/omr/+vyATweUO
	k/KqxmOJTBHYfWCR8dr0xUl+yNVfqX8KkbRnlV1OjTT8EJ0bxjGVP8/xHVHGCT74
	zooq9P3cFGeEdHhTW6ihpbN6oV27Hqn/fVawZWz01urR9mhrGNlF2db4RylKSvq0
	KRzZ69SEhpgJA7PGWL/S3F3xw5XGX91N3CAceeA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:g8uQGoMI47ESZ2MtA8ZL65W3Vb31auvKlRwHjRJC+ww=:E0rzPDO07fCB+989aujQx38idDPyKjNuG/vKYoc6g6I=;
X-ME-Sender: <xms:7CrIaoQ-hsZmnCXgwC-QXjY1i1t6E13pzAyG0B4qQwlhUGZQ4IXclA>
    <xme:7CrIajt_3WQ3EbWtYXynvVnXPWlo-Id3Aug-3R1wePHzCn1eokvl6OHNboI3R9Tqa
    8C8d0jhUl6Bi4K6DjOMwDBSACBjO3FOt3DzJSwWmiVPcfKpjJHwRHdk>
X-ME-Received: <xmr:7CrIataryFC4aCtDrFbYyCel4AWiJWmCfn2chGr6RgcQRvXRklnrewKENNx4SKT38lfbh6N0G7iqyUNxBYZ_nuV0apJ4rszGLY08fXx7Zjd8wg>
X-ME-Proxy-Cause: dmFkZTFXiP3ByqRhi+bwfuEeoAus3yLRLtXhJHCwP6MTIYwZlCSl48rCsY0UEii+0QwUS9
    xSx1ysA4oMb5BPpT1i5hTXOpWF8kB0fBm+jF7w8IjL9KNqD52nb/FIROI28s5WcMn/Sm3C
    bb0rs+G4cgc9GOF7iMufmCeAHYWWbaMdrGiimryatdAJwvTko+Yk8d0JfUesu/g9kjRbuM
    GszrLhc+YMK9NFdZ55jRsRqoU5n5N2Gk9DnvUfk5ZZ82Ux4K7iAVHDrwSBl0tF19iwVNWg
    vr0npOA1jDggXakKdKRzmShW3vvNSVNQ1/A69o/HOmrHHA8oLUp1XCgW9uD0Czwoo/VLRn
    ztlEnLB87OIwukjf79kaUxf9KspgEh2fbH/kte17tmwuulVLs9WYcyYmGIFVh2GYrPW5s5
    qZXmH7vQAyZ4KAaKje00FtZlAGA56jpFj9HVYJXdjWU0+qvmMJyWPXia3CsrrRBACRPAXR
    0Q9201KGcRJPGUUboD1x60nl15u/tp7nihVYzXpEMSOfT2BE8WDdPF2kW61JSDf2QV+kay
    G20UcPteIux5l5q7R69irO20MICmbYzhHIifnqpZiB5+YZ0Slxq9LfwYF1TT8o7V8RqiRc
    0Zq5NhHD06lfMiId3dhE6jNLfpVkVJi6W6xBt5mBtS6avgNX0LYFFPo0Hx4g
X-ME-Proxy: <xmx:7CrIaotZs0q9fCfNMyVqPI_ecdcBBt_dHPAoke2KDyJ2UPKpsi1-sw>
    <xmx:7CrIavG0iOJ87ZIc_HMfKvkCbVcbtRurcatMPcQr6GYeXewJjNN0lw>
    <xmx:7CrIajyIw8TAJVrB5Kxf_hZykPyYu7BAqQURo-06a6TBgVRiHuB1yQ>
    <xmx:7CrIaujxdEcO5Cy6ZGyDp6JEofaFXxeRZWHNNVZ3Gplx_544e-wtFg>
    <xmx:7CrIakEWHwOnk3886tGi3cwPbGWqfP-MXVxtNZMMGvJBUqHuI4ACNa_w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] firewire: core: use sparse annotations and lockdep checks for split timeout lock
Date: Fri,  9 Oct 2026 08:44:31 +0900
Message-ID: <20261008234432.251412-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects parameters related to split transaction timeouts.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 4dec03340ae6..7d512defdeb3 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -200,11 +200,13 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->split_timeout.lock)
 __must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->split_timeout.lock);
 	lockdep_assert_not_held(&card->transactions.lock);
 
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
@@ -878,11 +880,14 @@ __must_hold(&card->split_timeout.lock)
 
 static struct fw_request *allocate_request(struct fw_card *card,
 					   struct fw_packet *p)
+__must_not_hold(&card->split_timeout.lock)
 {
 	struct fw_request *request;
 	u32 *data, length;
 	int request_tcode;
 
+	lockdep_assert_not_held(&card->split_timeout.lock);
+
 	request_tcode = async_header_get_tcode(p->header);
 	switch (request_tcode) {
 	case TCODE_WRITE_QUADLET_REQUEST:
@@ -1301,6 +1306,8 @@ __must_hold(&card->split_timeout.lock)
 {
 	unsigned int cycles;
 
+	lockdep_assert_held(&card->split_timeout.lock);
+
 	cycles = card->split_timeout.hi * 8000 + (card->split_timeout.lo >> 19);
 
 	/* minimum per IEEE 1394, maximum which doesn't overflow OHCI */
-- 
2.53.0

