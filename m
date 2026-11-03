Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729968;
	b=QdrO3vNTS8NG4he4edmsdFjxoaMAOHBGElWxELKsP97bMnhrgpFgPg8OtrfcOKWZaPjc
	 nanLD92kiWOLgjf7qpwd7IIlBmm6KkvqsoyFvBz75hEEj6doc1QIqRI/yqm2+tmAuxTZ2
	 GMyREXoYEhMSGy63oWzJ1TLgUVskWQKHnwzSR7xbFWbgYAHiUQJgII24Ldb69cto6RXH0
	 RhhoWDmY3eImFTFsxizun0p2gjsIxPoMi1L8Gq/hyG3jroCIFNEE6bi7XtdcVrJXPTURJ
	 vvCSKy/j7ki8VioHQFpv2bs0xHIHqOQ/KuVNnXuOSK/k5JfdDl4nR9hiGqxvg6X5D+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729968;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3KbP6qAK/EhHIofDfFegwnkBwYgeXvEQlgbW5GWBZok=;
	b=Cz1sIMsqsfwMwttFclHJ4az36RqHVfTNMdw3nWCPvWOdi1+mxT+M2LJv0u6Nockpr5E4
	 PzgKvNsY1EE4E17SHpdV15c6ojXY5CTqYtPfvvY1JQUila4tXDVKKGrTn1Rz9kXZ2dvB+
	 gtuESgMr7juUBdtWnxb5FiP1Ekf64gDcDEojhEjqSeulBJAtUtM30v9Tv/gcAQoRAs7iV
	 p6WQ+y16vDH0302HPgRntedlaLTBwSdAOuIkyhIsh+C4jDdi64ewGP5c66yHMaS9teaSG
	 crlZkvsLtuLnwytHtyiatR8vlpfdX3p+HE3rKFlOWBWtzlHHKKE73dUL+2tHPVTTI9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=daRhlLg7;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9B606EEB9;
	Tue,  3 Nov 2026 18:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B9B606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=daRhlLg7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3KbP6qAK/EhHIofDfFegwnkBwYgeXvEQlgbW5GWBZok=; b=daRhlLg7ipCg5aIvkcT78l5mF2
	epPsPO11AY3N/H6YvZy0GQTotRlC5Z3DSAt/CM98wC1pfVTeXQCix23kQkdZeHX5RlxGYT3S/LQa3
	Qsk3zEitndrhJBMqCeZI4K6IehJxiwzhXHQy9WpohPeEDIC/3oOVjJyejgitBZPnHcmAqXfsf1WXv
	xpgbkdhQ3vIT6L/FFxHT0jfM8XJvf/ioKByh0Ltv5wU0QSgPVfOied1vtMkwEPcSRrgg9J1UW1JDq
	RPIM7wpVMMpPvWr8mUpu3I1DO9itoY2M88V58s45HMtCT7M0489lYIw17F0dwoYVQzH5Z247n+kcn
	pWJT58SQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ6U-00000003Orx-49L1;
	Tue, 03 Nov 2026 18:19:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] USB: ohci: ohci_pdriver.h: fix missing kernel-doc comments
Date: Tue,  3 Nov 2026 10:19:26 -0800
Message-ID: <20261103181926.2838476-1-rdunlap@infradead.org>
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
Content-Transfer-Encoding: 8bit

Convert comments to kernel-doc format to avoid kernel-doc warnings:

Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
 not described in 'usb_ohci_pdata'
Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
 not described in 'usb_ohci_pdata'
Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
 not described in 'usb_ohci_pdata'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
v2: move all kernel-doc comments to before the struct instead of
    having them inline insidet the struct. (Alan)
v3: add Alan's Ack;
    indent the struct member descriptions with tabs just as the ones
    above these are indented (Alan)

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 include/linux/usb/ohci_pdriver.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20261102.orig/include/linux/usb/ohci_pdriver.h
+++ linux-next-20261102/include/linux/usb/ohci_pdriver.h
@@ -13,6 +13,10 @@
  * @big_endian_mmio:	BE registers
  * @no_big_frame_no:	no big endian frame_no shift
  * @num_ports:		number of ports
+ * @power_on:		Turn on all power and clocks
+ * @power_off:		Turn off all power and clocks
+ * @power_suspend:	Turn on only VBUS suspend power and hotplug
+ *			detection, turn off everything else
  *
  * These are general configuration options for the OHCI controller. All of
  * these options are activating more or less workarounds for some hardware.
@@ -23,12 +27,8 @@ struct usb_ohci_pdata {
 	unsigned	no_big_frame_no:1;
 	unsigned int	num_ports;
 
-	/* Turn on all power and clocks */
 	int (*power_on)(struct platform_device *pdev);
-	/* Turn off all power and clocks */
 	void (*power_off)(struct platform_device *pdev);
-	/* Turn on only VBUS suspend power and hotplug detection,
-	 * turn off everything else */
 	void (*power_suspend)(struct platform_device *pdev);
 };
 
