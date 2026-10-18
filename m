Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A84BFE83
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330202; cv=none; b=YMx053Oe5sPg6YhiJ4aRmTTKFMPDS87OGE/OozmKtDtNSrQAWRCR0sZZIqhlCR/f2sKz/tuQYwiDzzOGL5xdxQo6ofMs6KGe9h8peFXjkY4MkjMV/wG7fSUDQ/c7JsjKbTsevP6G2ve3NCHSVU2PxSn+FJ6ysHllXZ0iw/E0Jsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330202; c=relaxed/simple;
	bh=TzWImeYte1o/3MujRJvJO/bTLhnL7S9LBtIICvbnFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfP4cyPIyzpgBZOFUHjOz+tkWOR3/PodnNcByKErlIvY2cVjq4Gbg3q4GEBsCQOCmo0GQptoQGDewpc5XtsQ1NgAxbpK5RdEopSPaSk2DLqNO/0VMQ0Sr5rNMPhZUQWSUcy2nFsh2yOkF8Kwx1H6JBJBxKDNdw+9c8lWA2m8aBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=UWH6yQ6G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cftq7Jzx; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="UWH6yQ6G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cftq7Jzx"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5C888EC0102
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:30:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 18 Oct 2026 09:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792330200; x=
	1792416600; bh=scEtk0jUDOCStzqDTcdoiu8yTAIeeG91AG1icn3VunU=; b=U
	WH6yQ6G/vda3EWYqaxNX86BTWHQ6yKDp9MYFFArWG90SzrDacTpAkDbqvS2g6OLv
	xBbmaaS8paG+kJBIvyTj3ZwQoo3/VJ1u7cZlWARPhsvWTVqLh1H1JUEuoIQHHOhH
	N6zI5G08p0DBN1m+Pho5dJLANWx26SHzhpm3jt0FFRhFpR7UW1U80uAvnGp8MeCE
	wzE1BBvT5leQZZ6+/o0kN2K5Crp3AAEVmuvnUqkBd0xJ9liujRPwUsjxYg2HAGvw
	/vr1hB3BQmkNYu3TdxEJc1b01fkGWxOpLLerkvrmr/uu1xPpSnqk8Emdk0qUqwTQ
	uoKcaje4gkDevesuOanpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792330200; x=1792416600; bh=s
	cEtk0jUDOCStzqDTcdoiu8yTAIeeG91AG1icn3VunU=; b=cftq7JzxAYKHY3ISY
	8kWRRTqvZpKwpu+dFvGHHdIQ7QMCxYdvs2+1JaiSR42xlnNMY2U1vVjuMCF+ySWM
	95P2jNQezSwhh02t9Z8IiT5Ha8HOEJNm0woWCUVd8jo2jQiJlU6qJqlbzzw7n1l9
	pgGBeOgSRf3/28fybIcLPLIKyTsSa3OwAszNolGcSxnPNiaWgA15qQ2EDtzyoGbt
	Iv/CqRlIBECihoXYwp6yEw7v4XILXLgMJ3PU+kZE+Rj9au/1VP2ZfzgwiGM6iH/U
	TsFtNJ5uS0+04gASC7K1wxcYShdqBNDrjvpkA111Wf12wfTvG0wQWNHo+5fd8yDF
	9vqpQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792330200; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:i8hZLaOzXPf5XFx0vkFm2Qw/6KeUu2kYv5UWx9osY6MBth4
	JVzj+xmv3LckYcyO1y6kxoXD05zUozpyYzrBMCqmS58huH2av49PLofzHXGFTZRH
	uvDPlqlp2wZvVDe2sBJiMB7JiPqPXVujKuNPHIlAbhMxaPfC4cxpxl4172e1tfrF
	3AET6K5Ce0wjFX2rdoRbsXvMuWfuawcVTiIFg/CozBrR+TRYfIq+yoxiNfZUeLTP
	giuq1eKd/fftI9ockrU/V4sCTBlIWV8r+ccbYrsmzVxdp11g+AudzVBqwcBC3Qns
	8klOpdPMAj0G4q1JBzD4Uc6bGCv1WLl6KPObekQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nXUIeNM8mBdWOX+zzPn1xyY0yvo1IK6TYHIIZ1pmrbs=:TzWImeYte1o/3MujRJvJO/bTLhnL7S9LBtIICvbnFvg=;
X-ME-Sender: <xms:2MnUalUr8P-Tm6cOMPJCVnySVSvzImr9fWkJ541wRcTHj2VvSrU51w>
    <xme:2MnUajgaZ5CQ3sEDWt-1ArpQRRbW_GguIahtTMiU9jY4s8fXLyl9D4uqNwf6n1btP
    iKXi9327Z8G68QUuo5NENaf3lbv6FZeNrQ5s7NCE6otNBZ5KQBU0A>
X-ME-Received: <xmr:2MnUao_32sJpUm2z99vk6icuBpe35cfOl1cvMkvj--Ep_Er-SSHh_jQCbEpV-2PDjfrIzRSRjRzKxtHcADrKowkqtXMZ_Os4klFUt88OMWYQ>
X-ME-Proxy-Cause: dmFkZTFuVtQfZijF06Q5pTDla1VOBZPLPgOwTxkWh5hEBbqIlfpEg6UG5yJBRwl+R8AFld
    2gou1CayE3O/XCQA8d13Px96m3MgSvYVwWcPvZmFToHdwhgRUStaGhm3D6ESRXyrbaLfQU
    alVB3w7PTntvTPviZdZYnmr8iqH02LNToTACTnoJgIKb4rnJMi2ozxgdmuga1ypMHzdPNH
    upYbIQ1bigC0eormcjIkK+qGUuQs4rmA/Q/l7ljxE1Sd/LU7mW2ovMiZFNsnvjwdLX2A2v
    H7HFxltDx74js+D0bBBCE8uhVBMlNBY4zHsJF3pqp9S1+b4s/FOb30WSFyCFh5MHx9guiZ
    W6hzl7+0/Vk3GtZvRZgnruFo9uDjeNpAgNhBfWASJN4NA70bVuX0NfSi4B//gnJfVi0t9I
    K2Z150nA9LWnFnb5Ua8DxjPieg6Gv05H4s6csSjgLeksqFkJOD1UMPYWpKXVcMBR4jk8sa
    lLpGR9DlsxlhALFVBWbN35bNKM+0QxQ0ueNbI09ip0XayzpDnrnja9JAjAtx1g16HWI/Aq
    PecJKJCospDs0QOS3CdTdVcLS36cVdL/cEerAoKTBP5JzpBNR+Pu75IPqgeArzcg2lMLl4
    l9+f/WfBaovj0Y8z8gokfZsZNMGHxt55OiI2N/tLTajW3JVOG7Z/vFs3ubEg
X-ME-Proxy: <xmx:2MnUalDNEYlkz-KngefJJHqLGB0oTwDtBXWizOqN7ZAGW-rxVszh2w>
    <xmx:2MnUatL9XtyaOMt4mKQUZ9oL_qjV97NRJE8qFDY-OVrsEUJF-rIeYA>
    <xmx:2MnUagm25vesMURoKtaVFjQrcLlC-31XBhr0DaWpJvqhf7elIbeUYA>
    <xmx:2MnUajGgkafHB7mH5fMWX4jsH_gLN-PoQwU-f44ZiZm3YC5M-icJ5w>
    <xmx:2MnUalroEQ3LEcUNq87dhOHynb2vlF_olPZ0LR_-Q_xpI3bPx2qhHGRu>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 09:29:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] firewire: core: use designated initializer for dummy driver on card removal
Date: Sun, 18 Oct 2026 22:29:54 +0900
Message-ID: <20261018132955.391090-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
References: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dummy driver used during card removal contains mutable variables.
Use a designated initializer instead of a static constant assignment.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index a43fc3a278f2..83be100a1f4b 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -763,23 +763,6 @@ static int dummy_flush_iso_completions(struct fw_iso_context *ctx)
 	return -ENODEV;
 }
 
-static const struct fw_card_driver dummy_driver_template = {
-	.read_phy_reg		= dummy_read_phy_reg,
-	.update_phy_reg		= dummy_update_phy_reg,
-	.send_request		= dummy_send_request,
-	.send_response		= dummy_send_response,
-	.cancel_packet		= dummy_cancel_packet,
-	.enable_phys_dma	= dummy_enable_phys_dma,
-	.read_csr		= dummy_read_csr,
-	.write_csr		= dummy_write_csr,
-	.allocate_iso_context	= dummy_allocate_iso_context,
-	.start_iso		= dummy_start_iso,
-	.set_iso_channels	= dummy_set_iso_channels,
-	.queue_iso		= dummy_queue_iso,
-	.flush_queue_iso	= dummy_flush_queue_iso,
-	.flush_iso_completions	= dummy_flush_iso_completions,
-};
-
 void fw_card_release(struct kref *kref)
 {
 	struct fw_card *card = container_of(kref, struct fw_card, kref);
@@ -790,7 +773,28 @@ EXPORT_SYMBOL_GPL(fw_card_release);
 
 void fw_core_remove_card(struct fw_card *card)
 {
-	struct fw_card_driver dummy_driver = dummy_driver_template;
+	// Switch off most of the card driver interface.
+	const struct fw_card_driver dummy_driver = {
+		.enable			= NULL,
+		.disable		= card->driver->disable,
+		.read_phy_reg		= dummy_read_phy_reg,
+		.update_phy_reg		= dummy_update_phy_reg,
+		.set_config_rom		= NULL,
+		.send_request		= dummy_send_request,
+		.send_response		= dummy_send_response,
+		.cancel_packet		= dummy_cancel_packet,
+		.enable_phys_dma	= dummy_enable_phys_dma,
+		.read_csr		= dummy_read_csr,
+		.write_csr		= dummy_write_csr,
+		.allocate_iso_context	= dummy_allocate_iso_context,
+		.free_iso_context	= card->driver->free_iso_context,
+		.start_iso		= dummy_start_iso,
+		.set_iso_channels	= dummy_set_iso_channels,
+		.queue_iso		= dummy_queue_iso,
+		.flush_queue_iso	= dummy_flush_queue_iso,
+		.flush_iso_completions	= dummy_flush_iso_completions,
+		.stop_iso		= card->driver->stop_iso,
+	};
 
 	might_sleep();
 
@@ -801,10 +805,6 @@ void fw_core_remove_card(struct fw_card *card)
 	scoped_guard(mutex, &card_mutex)
 		list_del_init(&card->link);
 
-	/* Switch off most of the card driver interface. */
-	dummy_driver.free_iso_context	= card->driver->free_iso_context;
-	dummy_driver.stop_iso		= card->driver->stop_iso;
-	dummy_driver.disable		= card->driver->disable;
 	// Ensure the entire contents of the driver are visible to other CPUs.
 	smp_store_release(&card->driver, &dummy_driver);
 
-- 
2.53.0

