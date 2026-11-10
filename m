Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.203.187.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312442;
	b=Z1fco7KxQgLL3lPFWSbN6S468hyauCkGXePv2jJKs73UuDKZ6pWF+YOO8EHLPA0fFvrQ
	 OlTDpo9Xw6WrfxDU4kCckpmmZWzxFP3vutomGDB+ki1RBHya3RNQ9QW78+AUKOByU0K69
	 nyKcP9WjyAZvn+EyodxRZdB3lxis9rgeUKkpO97EHflVyuzbIqV4CAf8jFSrxl7mNfnRN
	 oGdnYCOOcg76TwbACjFIVzFDtK+yVghTqQqcfearyngSxwE9dZhdqsIT/Eb4OZ/eMHRV9
	 BVGJqkNOolmfc/N0TYesxkVeqFF8/b5o/uN2LQyvVPENPsbVECvfma/GSpGzw25Y7TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312442;
	h=DMARC-Filter:DKIM-Signature:X-Auth-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Classification-ID;
	bh=6aiR1vIkCxbzfHNzuErjg5ZUJXIQFFMjZEsnjDlk2UE=;
	b=UZHN6DYYTlpA0jCtSYtdbrF4gu0jaAew2MhHN8WL99P/EFAJ0A9/MRFyKZZMAdfS1Nlz
	 drkjmSlR+vC3bzcyJ4T5ku4aUSoQ3XMXd8UJoCUgcUG+zRgf6+nt1sCcxUALXnNUABVl8
	 dOpg8rBbG/4EcZGJre8u2uIZgLbBQgDSBuBuYMvdzjQyEDOsELmAZA82p8RjyGo1Liqna
	 osziaIrbG/yjtl5b1Q7gFphEKmUKCbBRBw9rlbV3LXTFrdHajE0ghsWXd8WJNSVbpqv3G
	 fcWqIf81TmHFCrYxGxW2xOvGCePhJXzwtaRj/kmkinzJNOq28YwZ3Fv+/hqI5fQfrMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=X8IXBBpN;
	arc=none smtp.remote-ip=173.203.187.113
Received: from smtp113.iad3a.emailsrvr.com (smtp113.iad3a.emailsrvr.com [173.203.187.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D31606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=X8IXBBpN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1794312435;
	bh=sr2t1d6qViZq+3a9O1q2Fm7fkgKR2o+8ed35HkdXOkI=;
	h=From:To:Subject:Date:From;
	b=X8IXBBpNW1ES88lRFskf+FSiSShdhKClfJH2+8zs+Iy8E0OyfGD6yaQf0OS0I1xB/
	 LuT/UcSsFaCARdIMCY7wulZlRfCWm8JoHcq+QcJG+/qKrylMglBEczxTYmbE+j01T2
	 oRnOKoi/4H8CSOTieO4OaCoN7FNRmmonMnfiGtmQ=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp7.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 5F04F50CF;
	Tue, 10 Nov 2026 07:07:14 -0500 (EST)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Subject: [PATCH] comedi: amplc_pci230: Correct driver comment for AI EXT_TRIG support
Date: Tue, 10 Nov 2026 12:06:59 +0000
Message-ID: <20261110120659.9307-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.53.0
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
X-Classification-ID: 85dcf8ce-64bc-4bd2-b3ed-306dd4d0b1ed-1-1

Correct "Note 2" for "AI Commands" in the driver description comment
block.  It is the PCI260 that does not support scan_begin_src ==
TRIG_EXT, not the PCI230.  (The PCI260+ also supports it.)  This matches
the comment in pci230_ai_cmdtest().

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers/amplc_pci230.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/amplc_pci230.c b/drivers/comedi/drivers/amplc_pci230.c
index aa9c502b94293..4064209b1232f 100644
--- a/drivers/comedi/drivers/amplc_pci230.c
+++ b/drivers/comedi/drivers/amplc_pci230.c
@@ -15,7 +15,7 @@
  * Author: Allan Willcox <allanwillcox@ozemail.com.au>,
  *   Steve D Sharples <steve.sharples@nottingham.ac.uk>,
  *   Ian Abbott <abbotti@mev.co.uk>
- * Updated: Mon, 01 Sep 2014 10:09:16 +0000
+ * Updated: Tue, 10 Nov 2026 11:46:50 +0000
  * Devices: [Amplicon] PCI230 (amplc_pci230), PCI230+, PCI260, PCI260+
  * Status: works
  *
@@ -87,7 +87,7 @@
  *   Note 2: For PCI230 and PCI230+, scan_begin_src == TRIG_EXT uses
  *           DIO channel 16 (pin 49) which will need to be configured as
  *           a digital input.  For PCI260+, the EXTTRIG/EXTCONVCLK input
- *           (pin 17) is used instead.  For PCI230, scan_begin_src ==
+ *           (pin 17) is used instead.  For PCI260, scan_begin_src ==
  *           TRIG_EXT is not supported.  The trigger is a rising edge
  *           on the input.
  *
-- 
2.53.0

