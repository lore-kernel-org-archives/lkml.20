Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670432;
	b=F8nsFMfNjAyoUCMSKZlUwAklkmk18Vly/IVE4LoxeNQjzpJALDgaOHaCnSJhSNpD0ZXe
	 k4EXMIvO7FCz1zOWEyN5DqLs7wnNBugJTmWGCtUG8idwr5SbHtKdX9Q9VyO6zmmPEOT4M
	 Y1po+pli0LTnk9yYLZKLU38wFGsYW7hPUb3EI8ktJu8KRKaeQAf42wvlyhhU5ve1hLPlw
	 ftOTunD5SGYeSWlEgRwvk3hpc/b4ooPLl7/pwMfXur6kbZyhNa0A3w6E6s1D/Gptd1anR
	 LD+kFP8+F94aRyyJfTB4Sw/9gBc7E813StCnl4GOUFcBiSghOjKhPpODHfqhtCqnSqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670432;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=L2Ry9DtAWGth3srw95D6TtkIqcZsjt4qT1W7W95a7t0=;
	b=Glf1Y6m2LSiThO16D5O514znGg3e0JahEi7FFP4MSkeLDMn4PCuhNzUZYYCom5E2AaYr
	 Qn8AiNZjcJldbeqNtawImzqRKLFkl7YEeK+5qC1HUO33APgW/SbSFNV45Szu3tcA/DJFf
	 JQ++w5UhlKBN37bwjKPVovtQXTrnrByxfynCASJ2uS++e2uIe3rfrRSecwti7hsYfY18e
	 lRHgmMNfLJp5uK4b0M9/c8XThWxRdnOeW2U94heniuLSvQn6XGPwgvp2QCoVYOWA64BMP
	 P+9T1Dpda97NZ5pLDndNw+tbgh4kTBO2TGlW557JB4obira+ajPgBk98t6dTsWREVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ydpyiiph;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87130606A324;
	Tue,  3 Nov 2026 01:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87130606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ydpyiiph
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=L2Ry9DtAWGth3srw95D6TtkIqcZsjt4qT1W7W95a7t0=; b=YdpyiiphHPYn8KfABytE/jowME
	hGt3+3rKWCyeZ2cfXUHN+zmYW4EqOLki0xhhfA40sXNUWW7YvErxlCYWBHk54p1pCsbhjVgc/a2MY
	P7hOYC8t+wOx+MRAH4X35rgV3r+q52i1OrNeXXKOPzRL4NOQ0AVaVr3e2daYtl19u4uX/P9LuOXtE
	1mn994G9L0aZkwCEUtrZmrY6yazTGBANcR/JfEnOIeqjfph83peZiuyRn3rNmxyFucXLyjwsCsIyJ
	KUKpo4cLBQdRx/nk4Ad3bDplb1oQOfX/s9BnGjWxhqXv+qR4GGMBti9EbgxFEHePy3mPqP7jY6D4t
	hPu2t2iA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3cE-00000000ovW-2x2E;
	Tue, 03 Nov 2026 01:47:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] USB: ohci: ohci_pdriver.h: fix missing kernel-doc comments
Date: Mon,  2 Nov 2026 17:47:10 -0800
Message-ID: <20261103014710.2451967-1-rdunlap@infradead.org>
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
---
v2: move all kernel-doc comments to before the struct instead of
    having them inline insidet the struct. (Alan)

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
+ * @power_on: Turn on all power and clocks
+ * @power_off: Turn off all power and clocks
+ * @power_suspend: Turn on only VBUS suspend power and hotplug
+ *                 detection, turn off everything else
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
 
