Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0047C0F3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629712; cv=none; b=tTcIns+vQcrfMVmGliK2hvzkf/5N/0HTACZ+s5kzu+poLI7QPHv/gPO0f3m9G+tuYAJR5yZ4o6aNC2lKBdZaJe4ogL+/Ux5CbWvpydiRMWf9RqBbgZA3xrDGu/DNFz6sBYOsfVmgGRsJTW7hiyDVjkXh26AY8yzzzg7n/VcqVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629712; c=relaxed/simple;
	bh=ahqybF+CoaWqNQIXOXeC+d4xKPdMtQTjWz8cWmIIvKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3xhRQ3nH3nOKB9NGSoryiKV1zp9CM7doAnkQJWjx46Wa+rr1+9Rt9r6rUW47EfCHHzJLn+Xe6CChR6jWaQmTPa5kFNJhadXAfWSc0K10cC8XyvbRwcHDETe9JzxWCHDm/u7kHHz5ESKTJb1GYisrbbDSzFFBS03muQm6ACmCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XspYJKGI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XspYJKGI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so3690985e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789629706; x=1790234506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHmeCv/axEn0FU2l0O8zLPSyxFYmbwsqUmNzB3nLknA=;
        b=XspYJKGIc/4/1Lkgf3QrN+ZBqvmA2p+NMVTK6bZzqiI5POkKcd28ey5ocYfF/RYZvy
         NP+kAQYBPT5F1z9g+iAPPM78hm79gEzPC5EMzCNISRR2sDxxCAG/Aln3UQJV66Q8Uxkl
         w5tn/J506E5SFWP4bGqatzjE6EmgQ5R5vwmYDsg87fObkbdpOZ8haRRExpf/GsmaxRlw
         grlfIW8BqMq60Q/MuVmrq0xfL0AD+v9WnRCBkwNizqMGMIigL4v+LWUKO4a1A7Zj58WV
         qIOt/DRWl/1q82RzYLfNW4VyCiCAbrFn58pQcDzBoX0uwbY9HIhoZ0VlRBfqqQCo3uaV
         t3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629706; x=1790234506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHmeCv/axEn0FU2l0O8zLPSyxFYmbwsqUmNzB3nLknA=;
        b=y5WRzcD5M0EY0R1yFnSZzQ9Wr8Ql5U2NKZVt0Xx1Bh8Cg+q1dKbxH9DYimUjJDpy43
         TOqERU2A6bx3mXy4jnS75g5px+pf0RM9gAKa2RrVFRW2PV2WjuHmRh/BV67+nwyet10l
         b7X4i1RjLjxNPSA9FZlaGmExK8LcBlrkk8EnzJwgWl0x03n8Sm7AjvPYy13megI/giBV
         VU4CGB2+1A8skiN7GI8ZPn62JJ8b36LSwBHwCHCm72HOTh5RppB72GcvBWJqCMsxuFC1
         mdTt847U9F+aMzOhxCjWONhgMtPoJmWkmnFayuP1k1cAonj6//5sG5O0H+Ykrhnvv+fn
         +/Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwP7e/6hQaB6Cd+kBSzCj4G9bG/02inqHCkvivYnuCLw9q5g4U0PHzl9nISsZ9nk52Ae8368cKS+nzpzdU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpr5k0OEgF1n/YNRm8TUvPmrJXgT4aZlnEX44Y38eRNWQ7bGwz
	FjaWKqSsWQDGiiKI3STMi7JyNC0erOt7SrcmbwTR1rEBxAEQ8dDULFl3sGVb/Ps1
X-Gm-Gg: AYBFou2zpaLhokbgT6sy1yyvjygIyOaGZ7rT0XeWhRApmWEsEcGJOJDfrXs8GvBWKXL
	SYYbZwM5ZTQJg9pfocfirgbwHcq4PT+vRUIitn49S/c3LdCoAaQZ+tCW6713C00X17sKswiQBc/
	lKq3yLEL/Ju8xRdkHCfGOr2r4lpRBDgh3enNTDRWK2f8+9UeNd5B5Ry29IG0pFRzkUvOmJjZn1S
	1ke2l4IRztyclcVNfeMpCmsq95lP0kBZI/Urci+AU+cbBbEyev4cIo2yH1439V1kDbIvDPfp3lU
	Acv9CZuzGNNMaVi1LjUpRs/0m19FoxOoj5Xy129S1RXjjwO6v3b95SOPhwDcbr/y/PizyU3pPw2
	GwLdqZGqCk1dqfEjF9ZQ8ntxYghDYwTrYm1Yxq1TE/iHRzyv0nzdToo4gPwvYBcou4BQ6KFP46S
	f7Bg9XWwMBcwW+XSUnrohlP+CApHeEhmVJIE9/iEIn4Cuf17okjX3PW0jMJPZLtyTs4zLi8hqKw
	pFEF9bZpS4F8QYXrq7RGmIJ9othcT79g7M/eHDHDPipNSJVmA5hpcYhHk5pmLo/ycJLrgiW3z8F
	H7LISsRssYo8O10hiA==
X-Received: by 2002:a05:600c:3b9c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49eb732e48cmr85513555e9.17.1789629705483;
        Thu, 17 Sep 2026 00:21:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204c1asm50915035e9.4.2026.09.17.00.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:21:45 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: octeon-hcd: release the USB block when initialization fails
Date: Thu, 17 Sep 2026 07:21:44 +0000
Message-ID: <20260917072144.438023-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_initialize() gets as far as selecting the reference clock,
enabling USBN_CLK_CTL and taking the PHY out of reset (steps 2b-2e)
before anything can go wrong, and its only caller frees the HCD and
returns without touching the hardware. Both of its error returns
therefore leave the USB block clocked and out of reset on a failed
probe.

Release it on the way out with cvmx_usb_shutdown(), which is the undo
the retry path a few lines above already uses. It cannot refuse with
-EBUSY here: the pipe lists it checks are initialised by
octeon_usb_probe() before cvmx_usb_initialize() is called, and no pipe
can have been opened yet.

Fixes: 22bce6d2b3fd ("usb: octeon-hcd: fail the probe when the USB core does not respond")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

The -EAGAIN return predates that commit; it has the same problem and is
fixed here as well.

Found by the Sashiko review bot on the v2 posting of the series that
added the -ENODEV path.

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -708,6 +708,7 @@
 	int channel;
 	int divisor;
 	int retries = 0;
+	int status;
 	union cvmx_usbcx_hcfg usbcx_hcfg;
 	union cvmx_usbnx_clk_ctl usbn_clk_ctl;
 	union cvmx_usbcx_gintsts usbc_gintsts;
@@ -872,7 +873,8 @@
 	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
 		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
 			usbcx_gahbcfg.u32);
-		return -ENODEV;
+		status = -ENODEV;
+		goto err_shutdown;
 	}
 
 	usbcx_gahbcfg.u32 = 0;
@@ -961,14 +963,27 @@
 	dev_dbg(dev, "gintsts after reset: 0x%x\n", (int)usbc_gintsts.u32);
 	if (!usbc_gintsts.s.disconnint && !usbc_gintsts.s.prtint)
 		return 0;
-	if (retries++ >= 5)
-		return -EAGAIN;
+	if (retries++ >= 5) {
+		status = -EAGAIN;
+		goto err_shutdown;
+	}
 	dev_info(dev, "controller reset failed (gintsts=0x%x) - retrying\n",
 		 (int)usbc_gintsts.u32);
 	msleep(50);
 	cvmx_usb_shutdown(usb);
 	msleep(50);
 	goto retry;
+
+err_shutdown:
+	/*
+	 * Steps 2b-2e above selected the reference clock, enabled
+	 * USBN_CLK_CTL and took the PHY out of reset, and the caller only
+	 * frees the HCD, so hand the block back before giving up. The pipe
+	 * lists cvmx_usb_shutdown() checks are initialised by the caller
+	 * before it gets here, so it cannot refuse with -EBUSY.
+	 */
+	cvmx_usb_shutdown(usb);
+	return status;
 }
 
 /**
-- 
2.47.0
