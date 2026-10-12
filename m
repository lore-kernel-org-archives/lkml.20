Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5532D7C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784428; cv=none; b=f7Eh6DUP/EgL1BTI8SToZQTmdRg0vqhugnp5txv3SpPgHt5GOPY/OiGUkUv05/HGVq2NILHlvN2TvR9JxOqXPC9SMX1qIhJCDRq7YCaok/uZp1IFqM5005a7R9v+9NT+P0ZOGx3Ho/HDbc78jgpnS6w9d6lst9eCQkr4vL0H1ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784428; c=relaxed/simple;
	bh=qswfbpQeqcrPhyuB29KsZjVoIGAnB+lHjaZ3nFk7l10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RH2sIVajRJ75pHjQYjal5ucnSJC3anwUQ9MhhKHxHhoOyo+NmJcigYlkpcSHAQLSbIE6ZecAM4AMot0XHr4bTqIO+mD4XFOfTzh0p3eU9R5m5KwyKYOTC/PcTDSapVIaz9gTPZxHN59KXw8cScUt7LaBp7qrlTA5hNuv3k7I0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOVA2eQQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOVA2eQQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so9561865e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784425; x=1792389225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PothssnYOQBqU06oPmf6jtHUTyL9DrHCtzHqtSv9s2A=;
        b=fOVA2eQQN7BXC+t8TrO2PzmNbOiGSK9HvjILQkpSPQH+HfOqemTdtjS9oMVCNWVneK
         0peP0bMmBO2nnXic28jT/veYHgEghgpxaZbWw2pvoemE/2CvS3oiD1OqqbzD8mbtZxIo
         wiMUutDm6bi3LtQlh+uMNKV0caE7aQesl8CeFrFjQQTbzfPNVMtdT8OQ6u6CsiHGr2hs
         ZonUvQ9KBdh85lJBBkXNgXMG3ZJ5RS9itPfoRZSJq12UmR2Bd6GqsSIBCHKcV2Ae1VxU
         sCidaWwgQB89t9r2EO6n/Rtz4ofyhsMqlywBHR8GAwzUvBsC3IgDKUAAsMMNrVy2QkHI
         ilgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784425; x=1792389225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PothssnYOQBqU06oPmf6jtHUTyL9DrHCtzHqtSv9s2A=;
        b=Isvz3qfnssw5c+n4jFaF9Tb4d2TOyaFET7h3NuM+dk0cv56CG6dTAeY0OxuQQdAIL2
         wC6SH3wVAres0OpT4vHhR5W/OEVsaQa9FFfTXFPDLMAKKV7lHn0qTRggcG8n4thyDgG3
         7MURBYBr5bYqgRDfOW2t8TM43yzMuSN0THD0BG8FmFyk79wHgPMlELw373YMFGAx6KMF
         xaKfA//ZBq1avHaJ5YKeb6cKMgZRcsUvXVc9PpzVQ/0SrAaIejOtmC0OZZbawP1uUAXo
         VBfUy79kRTKpNo7UFjnLHvlX7/lAwFlBctjFYOOEsxxMFT7gaTq+xU589Qev2modWmNr
         1gJg==
X-Forwarded-Encrypted: i=1; AKwUvBwbwNJal1vG1ZY0OKl0O6NNUiI+kOzBtQWIABA04unfKQun4yFGVi+AO7yxUdIBMyfrrMK/mBKDjgwTHwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrCCrppDaFxy0l/1Z4dEGHQu+LmsFEM/4HiwcDV2LQdkLXmeyG
	8ksH010VzjsHqZzFYoF+rm8h504ukaqkETEumHVlfslbYHkC5zy4a8ll
X-Gm-Gg: AYBFou036dIlGSvYpX7TCblvdrwZAgXVixy4SER/l/qLThv6oNysjxj3pIWdml8ys8f
	YPeKlP+ijIcvW7WEQZSp683dEkf8hHEsH5Q0KN95/EWX6KskeAAOfoS+zHjQM9v3ZfR5LgPAlsJ
	Tp8BP2xW/VPA0OuvaWeOEwJohAVeP0zBYHe4LsswINggI7rXBPz39QwQlVoAvLQbBeb7H/0OMFt
	oBPwYMYqoaSJR1GI9NHR8upHudzYVa3fyUe7N6bPvBpXLkEU0UFiauoBVGCA9+r+Rm7yI5sqnS0
	q7X6HrAMMRFy9y9AXsy9cLE5fafshW9eLPqKJ+Q+7l276U5nRM2+TU+gdL2170bVghTpfo8EGXT
	U31j5HQdspEv6kUaVdN0EV5iISofj6ChJ4HmJpbcIV9Y12AyKJhrhHI7fPd1knKCyCKH9GV0gkY
	h1PBayZ4ZRejoA6wlrvhzO5FWMqx8V56+b4nDzrJCjhK80a1Y9VG4GNOkghA6M2UuiOwflfXtC2
	4IDVLjyXDRZRNM0MegWVEsjXrzl+wm5uu5sAwXRWl58MCjUxMY5Qc9XF6SXbx0VC/hLfHfAhlPE
	y8qzUuYO6b4yW8jqdkkIM7QCvcRyTEwO3xLQbT+aok+hK/qkT/1vWbwxwpQdnKGx/kMSUNGRJwo
	=
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr150789045e9.18.1791784424879;
        Sun, 11 Oct 2026 22:53:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm417935035e9.4.2026.10.11.22.53.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:53:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: ma35d1: Do not force-enable an unselected console
Date: Mon, 12 Oct 2026 07:53:40 +0200
Message-Id: <20261012055340.16719-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When another console is selected and there is no matching ttyNVT console
argument, the core accepts the MA35D1 console without calling its setup
function because it has CON_ENABLED set before registration.  Its index
remains -1 and printk repeatedly reports an invalid port, flooding the
console and preventing boot.

Let the console core enable it after successful setup.

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/ma35d1_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 0809655f4395..3be30fb05513 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -639,7 +639,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
-- 
2.53.0

