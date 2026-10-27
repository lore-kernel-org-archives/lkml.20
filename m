Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118547;
	b=V9CuEg2HS2k8tQMRAPF/zJSdSgeTxMYoHzR01BMilS/Bqey4rVp/bzajNyObWqSMRxGi
	 8OfTpkZ7ScM4GgkucB8uEbtG6Wf1pC6et3l/fZat54TAJmZVkHyBToOm4zixtBfq4fvt9
	 Zg2WRwGj4NgZ9sdohScBIkvg8lkQJd8aSMkRmUizN8khuu1FwuAH3OfE1mFzp0JKEOSWR
	 Puwj9eiUTllroY/m6F5UhvZT8/+Ri0RRjsTrHShNfhhfGRQ/+v6FzJwEDke4bsTN6Nlmx
	 eGLUL3TkwujKgGXg79dAt/JRdVHW2uNYPypUKi7vHXTuaFAx47Zi3FSkc7rpj3yOEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118547;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:Content-Type:
	 Content-Transfer-Encoding;
	bh=N7DaWZuwNR7U+Isl9V7dlYE6u1f8J3FLeM/+jDGgvHg=;
	b=soAd363+jWRetv18byUzR2B11XKA00A8pFekDd7CtBzlFLh3uKVJ/RngHlui7tx88HKo
	 j7ulbLtnyk7RjpTl3JXyKKjHXJPYqe+W67KRWouVH4NUPfPB212fQCPhmzD/DuEQMd3KO
	 cDMXgwt1pSYfCD84rn5SR9DWizHWudA6RWsbt4W17o8hjhWZKWHkmrtAtbFDQGuamZ53l
	 412Tr9ei6DIA8rJi7ZVmJmQIKo7NEbfEd5RVgSyFriDRcX6wkeP4URcbAQdwUn4QbmyDG
	 N6VQz9pZAgxfwLI4paO94cGORV0gVBVo9XU4XTn3dUT21XlzQ7nzUaSC0nYZK6SO1Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zlR7V3o6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D12606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zlR7V3o6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EAF1F01825;
	Tue, 27 Oct 2026 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793118546;
	bh=N7DaWZuwNR7U+Isl9V7dlYE6u1f8J3FLeM/+jDGgvHg=;
	h=From:To:Cc:Subject:Date;
	b=zlR7V3o6ST6I+yYgrjjINv8QcoI42uoE8ZAjXsntDZKkJhSvI+66U4p0pJvVXP2L3
	 DqT6VOevjsV+bj+CFRSVx+gud1XFoTNKP+wZsOoFZ5NdYNvfHqkjrI/aKf2HmHoskD
	 0+ibRCLmIbB+LxLVovbRlcoH6XcneFI67bd/sReM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dpenkler@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] gpib: tnt4882: set iobase for the ISA and PCMCIA boards
Date: Tue, 27 Oct 2026 17:29:03 +0100
Message-ID: <2026102704-deletion-handcart-ee29@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4261; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=vKdSMGihiwz2ohQazYZkhKrk5K35JnKtJ86qkNU92Bo=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPLgacNj3x6NjUtbflLz1KXLLL9pZIRY7I20s8UpN2V WjffXN8UkcsC4MgE4OsmCLLl208R/dXHFL0MrQ9DTOHlQlkCAMXpwBM5LktwzwtRQl2jVzeT4wH C1leya9bZhivV8+w4GbOY+mPvgsqN5R01iXb75DjYnoTCQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

The fix for the address space mixup split nec7210_priv.iobase, which was
used for port numbers and for __iomem cookies alike, into iobase and
mmiobase. In ni_isa_attach_common() and ni_pcmcia_attach() the result of
ioport_map() now goes to mmiobase, as it should, but nothing assigns iobase
any more. It stays 0, and three users still rely on it:

 - Both functions install nec7210_locking_ioport_read_byte() and
   nec7210_locking_ioport_write_byte() as the register accessors of the
   nec7210 library. They do inb() and outb() on iobase + register, that is
   on ports 0x00 to 0x0e, which belong to the first DMA controller.
 - Both detach functions call release_region() only if iobase is set. The
   region is never released, so the board cannot be put online a second
   time: request_region() fails with -EBUSY until the next boot.
 - Both detach functions reset the board only if iobase is set.

Store the port number. The reset uses mmiobase as well, so make it depend
on that one, and do it in ni_pcmcia_detach() before the interrupt is freed
and the ports are unmapped, as ni_isa_detach() does. The PCMCIA variant
requests the whole I/O window of the card but releases a fixed 32 bytes:
remember the size.

Fixes: baf8855c9160 ("staging: gpib: fix address space mixup")
Cc: stable <stable@kernel.org>
Cc: Dave Penkler <dpenkler@gmail.com>
Cc: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@protonmail.com>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpib/tnt4882/tnt4882_gpib.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpib/tnt4882/tnt4882_gpib.c b/drivers/gpib/tnt4882/tnt4882_gpib.c
index 3cd13f637ed4..3f30812866ca 100644
--- a/drivers/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/gpib/tnt4882/tnt4882_gpib.c
@@ -46,6 +46,7 @@ struct tnt4882_priv {
 	struct mite_struct *mite;
 	struct pnp_dev *pnp_dev;
 	unsigned int irq;
+	unsigned int iosize;	// size of the PCMCIA I/O window
 	unsigned short imr0_bits;
 	unsigned short imr3_bits;
 	unsigned short auxg_bits;	// bits written to auxiliary register G
@@ -1066,6 +1067,7 @@ static int ni_isa_attach_common(struct gpib_board *board, const struct gpib_boar
 	// allocate ioports
 	if (!request_region(iobase, atgpib_iosize, "atgpib"))
 		return -EBUSY;
+	nec_priv->iobase = iobase;
 
 	nec_priv->mmiobase = ioport_map(iobase, atgpib_iosize);
 	if (!nec_priv->mmiobase)
@@ -1106,7 +1108,7 @@ static void ni_isa_detach(struct gpib_board *board)
 
 	if (tnt_priv) {
 		nec_priv = &tnt_priv->nec7210_priv;
-		if (nec_priv->iobase)
+		if (nec_priv->mmiobase)
 			tnt4882_board_reset(tnt_priv, board);
 		if (tnt_priv->irq)
 			free_irq(tnt_priv->irq, board);
@@ -1708,8 +1710,6 @@ static void __exit exit_ni_gpib_cs(void)
 	pcmcia_unregister_driver(&ni_gpib_cs_driver);
 }
 
-static const int pcmcia_gpib_iosize = 32;
-
 static int ni_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct local_info_t *info;
@@ -1740,6 +1740,8 @@ static int ni_pcmcia_attach(struct gpib_board *board, const struct gpib_board_co
 	if (!request_region(curr_dev->resource[0]->start, resource_size(curr_dev->resource[0]),
 			    DRV_NAME))
 		return -ENOMEM;
+	nec_priv->iobase = curr_dev->resource[0]->start;
+	tnt_priv->iosize = resource_size(curr_dev->resource[0]);
 
 	nec_priv->mmiobase = ioport_map(curr_dev->resource[0]->start,
 					resource_size(curr_dev->resource[0]));
@@ -1766,14 +1768,14 @@ static void ni_pcmcia_detach(struct gpib_board *board)
 
 	if (tnt_priv) {
 		nec_priv = &tnt_priv->nec7210_priv;
+		if (nec_priv->mmiobase)
+			tnt4882_board_reset(tnt_priv, board);
 		if (tnt_priv->irq)
 			free_irq(tnt_priv->irq, board);
 		if (nec_priv->mmiobase)
 			ioport_unmap(nec_priv->mmiobase);
-		if (nec_priv->iobase) {
-			tnt4882_board_reset(tnt_priv, board);
-			release_region(nec_priv->iobase, pcmcia_gpib_iosize);
-		}
+		if (nec_priv->iobase)
+			release_region(nec_priv->iobase, tnt_priv->iosize);
 	}
 	tnt4882_free_private(board);
 }
-- 
2.56.0

