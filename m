Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBA31194C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291069; cv=none; b=M4fBxq6p65ClBZuy9DzPqwNkBy1Tq0z+KIsSzH97ntZ90yFrhKuXdbMM0PDCgXMLNZwJFlDjuAHLfqgdiGChLRe7AmMH5cIAdSX5SmtLhKjRCl6VDLqGjPx2j4KatAZ57mMXs0EUdsZtLBLKPNR6SQoAQ65MOMTc83QO/k6S8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291069; c=relaxed/simple;
	bh=U3cg2HZXuMvptHjkBFTYt5bfXW88OFJuT/0Bf1xnlX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDOwphrktKUvyVw6td7OnDmFXQmau08+0MGPbOKtP/tFOYsZ8OUv4Rgb8Od90OUy4zBDx/FknvykUlqJRff9Vyxc+fc292Hhq73UyDFRDiaopTKQgTnG3xB4YUoEfoxO5j/Q4uZ+++dS/x0wK0pBQaeRsa2RMs2mF/SId/8GbxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1bvlaze; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1bvlaze"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso1251725e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291067; x=1788895867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQGtLovN51OKFL0wAwiQ9djvDcePQibjWbjxoUKoFt0=;
        b=F1bvlaze4fUDcyxrNAXR5kgD4XWHmni+LnDjWrkGAKVuKo0J2ErgvAe7FFicUnfTL8
         pCWZXyn66o38v8+svAEqWBqhaXm77bjOkcftR1NA1AdojrGw5DDOqPGZG8R8F416NZq3
         MBAIiowQgs7RA8FiIWz776V58zneSmekASV8qE6zS1+zYWhkUT/8hiGiIc3RrsIymu4p
         WepdEw3vMJ10k1fzKL+MVBtNZA0iw458m1jRvBvUjECcCzDfYQvh5tJJvseA0CBvi6Jo
         4bdqxxLKuQJGZFlxX6MWQiE50JNgCwRcDALfhuZ1qjxzcCSs7wEWruTOOSB2XEjw4EBI
         ne/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291067; x=1788895867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQGtLovN51OKFL0wAwiQ9djvDcePQibjWbjxoUKoFt0=;
        b=KU/BJREJrqjQ8/dNgmNxNfyW0YL6QaMgh4kY1tEAKeuu/whoGZDY8lsMd2B7D6pL+4
         9vb90floJ+1xQW9ReGjHOm6tESSElgczE6Sy+jFCWddH9DB+V09SlXMcdfr+nH3ZO6sg
         GDH3PVJ8pZfjf2y4T2FJveWdjF8/6Q27dGwill3HYz+CTdHRPgga3iQ9ulTEhS3m7HUx
         U6Mp+A4M1u1fT6huts1v4IDHzWhBxNnjd4fcvDKN9cnStJpUJvlYCcNY66IiEa1G/k2b
         t6wgzQOKiHMP39e+OXFYjxZmxuiUOn6bAmLb1hhV8YorsKi1kwJMKIAtqj6tLXY9GAS3
         fGHg==
X-Forwarded-Encrypted: i=1; AKwUvBz8N/XLh0Uf9XAE996rOINMc06/c6IfV7ScvmW8W/is/9ZK/+GIWIJPW4nkhbPGAArPvZkCDmI7hOlkW6k=@vger.kernel.org
X-Gm-Message-State: AFuF++n0za62rXC/Wft3zmANW2M0zWCTMR2dpWyRXn4QRE4WFEPFAYvp
	6JaV3xJ+DG/BGqNzBr+V8oK58Q1uyUPjF2JSEaxvACIKCr6z+JJnhb1l
X-Gm-Gg: AYBFou1BtqN/1R1G9YVYURsmWW0iRfC5Y58+XtbHUqgdqMw9EndgEGp4g60qQQC7BxG
	Djd42lV6+CLRXI3Xxh1CX/6gwp/fKizAaaLrR0wQwn1JBPLGLM58E8FoLoLmgqmOO7I0yITXuDG
	28FzlgzYnbtQxJgoLFkfDVGFTbe3cHK6aihSEXXXLubbgT5juiG3/2NbqRxiaQk9NZJCjtuUeeJ
	NqP0bujabH5gxix4HXFCmkN3H8F+aC0eC600gt621HKz3Nyb/QzxKAjM53qE8QkAIGwKScNvjZp
	Km7ke0I5GAzcEDPvjw/qF0A8gru8XepZEcfoIUNoVkFrGBWTiitakkPDnWZ4Mpu3ruucRfZPJYP
	UN3IBoCYVxki9dM2NPh75qHQGoDcnwwBPsH6PfYPS5AFdzRo7A/7QZR2L/ikp9hMtbJdl+5CUSJ
	3quMc0e7y75LGCQ/5AN9Nn079OoaZgCSdsixqIAbF9qQ9lcVDvh2iOdleuR4OBsrYwqbLKsYyhX
	M32IniM9dt3PXMnVOZl5WhezdhRtrrPrNncVQLwdwElcjA8MoZrL+lAm0PnybOHk05PZCtOfxKr
	i0YWCCCjRainhA0m
X-Received: by 2002:a05:6000:220d:b0:484:3d1b:7871 with SMTP id ffacd0b85a97d-48449f367eemr962710f8f.19.1788291066529;
        Tue, 01 Sep 2026 12:31:06 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:05 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] usb: octeon-hcd: fix the FIFO-flush timeout computation
Date: Tue,  1 Sep 2026 19:30:27 +0000
Message-ID: <20260901193100.1352110-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_wait_tx_rx() computes its 100us deadline from
(u64)octeon_get_clock_rate - the address of the function, not its
return value; the parentheses have been missing since the
CVMX_WAIT_FOR_FIELD32 macro became a function. The cast makes it
compile silently, and the resulting deadline is effectively infinite.

On a healthy controller the flush bit clears on the first read and
nothing is noticed. On a controller whose PHY did not come up (for
example when the reference-clock configuration is wrong for the board),
txfflsh/rxfflsh never clear and probe spins forever in __delay() -
observed as a hard hang with a soft-lockup splat on a CN5020 board,
where the board watchdog then resets the system with no console output.

Call the function, restoring the 100us timeout the code always
intended.

Fixes: 3e195a80e096 ("Staging: octeon-usb: Replaces CVMX_WAIT_FOR_FIELD32 macro with a function")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: no code change; added the Assisted-by tag for the AI assistance used
    (Documentation/process/coding-assistants.rst).

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -578,7 +578,7 @@
 	int result;
 	u64 address = CVMX_USBCX_GRSTCTL(usb->index);
 	u64 done = cvmx_get_cycle() + 100 *
-		   (u64)octeon_get_clock_rate / 1000000;
+		   (u64)octeon_get_clock_rate() / 1000000;
 	union cvmx_usbcx_grstctl c;
 
 	while (1) {
-- 
2.47.0
