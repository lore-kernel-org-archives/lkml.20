Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5F3890F6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703363; cv=none; b=PTL3ZgAXZkh7i6n6/iW7HBWm9xFfwDlT+2dQAvFTpqbIkdv/hMXzoZre0OorsjFnisdGwJgEKI99RVxvcwiUWm8qwvHpqBWrHlJ7TSBc/fLuS8kn1jNtPUOtBWP9CyDD7NCB0NEYvabe0jSTOf9ShPB2O5PXouW/hj9rLa7pSV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703363; c=relaxed/simple;
	bh=7IaH1fDScdtUOjn5ISzYZXJrKHd6fpsN6hhLPO1szbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3MblG4ny/mXZ0IDq866TlZxYN+VULuJdVL7sj3fX+5JOUGRlRv8/+aSdWp0fBfwGknUy8acPrHk2vxmWDYvYi8h7mga+sEGZG3gXLTcIIhXVIoyTJVyX7w8OlkdT271LV7WRMqnM6oI4FvEbpCj8vbF2Yss3M3wQciNzKsvEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrPqZR33; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrPqZR33"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so9704785e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791703360; x=1792308160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRP7SN7vAPXBfK/XNlgDsuvSXkv2xgGrOBVOOO5dYUU=;
        b=YrPqZR33aYzzzaCtEODIvOOYGSaWhjMpNNPpHmffo3TcTS6pcHm6vNqLQ+Cqbsq6Dk
         QvVrxcFlELWqVdr07IVbXzPO8Ztwrm6NhzqrkkkqxY+/Lk3ABQwV8P7WMtIADVTaqcPD
         rFlFSzsoTRRM0sEC90RZtd5Qirp+VreifJkWcTG8S2qGEzAwPnDxSl4CDmiFfZDi3SWX
         I+EfSph3F7theBHjz0nNIF8hwlOdG99bbbSjwrqfqjMl1P246DlgzkV3mYNYGcz7mP5v
         Cv0Wy6HLyQLfWuJaMQDqJlcC0mi5Uw6LbRdPwra98UDMlc9hg5xgi2IwfthwfDaFK/9E
         b5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703360; x=1792308160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRP7SN7vAPXBfK/XNlgDsuvSXkv2xgGrOBVOOO5dYUU=;
        b=1l0jxzcUMjdK7Kb0Q1x/g74bLs6lEee5KlqFYYL79ezXZojDxNOC77M5jdWbIwp1EE
         tXEdRtYiRbwMYq2pz5xeAVSzKhng1AYfiFtVjbJoSFb4wrO3wmApa13gZbvuinYHu8ll
         TTLETEy1c7cshLKgcCGSKjfziCyaAs2XLHXmxF1CGgw03OyTESxaa0i9lQtEAo2jR64d
         5y2WKoy7MyQSngducDL/m4uow10ZVxJNoS0t8aeo5BmkdiTBBb+VohohkAr+msyvDyWS
         9FaZXh/fzr8pUOIfVEXzExWWNuSWgW0jXufLI4h00r34nAGg96DySFNM9Rk4MFH36lBj
         Pa7w==
X-Forwarded-Encrypted: i=1; AKwUvBwqErNi8yfaNumYAgrfSBMFzeUpd5xfTUkNE5cn/gCrL9XMli8eTbKSYCiBe3cj7wtnFulaRbwZhIMMZkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmJcI1mSkJU9am9sSC/Wm/0vIOlg4KIvm8gGtlzPHMbxr68eC/
	9zfBXCHkXqD72ciG7L/lsjd+rqi9Eq/X/YxMeofmsqesrxWOlRG4F8WW
X-Gm-Gg: AYBFou1QZLLomnZg1q2FMgKokjOvjZe2jshBmtBRCSiXDz9EALjVbPgJ5UNRmFmz7ZS
	0Grax3U2SG2vKsVJe8VXSqFj8Vnn/PjNALbFvyHcnLt5u5PQzfdYwnMbHK0Whx2+pwFKZUF0TWP
	BYd+u53ac1dwJrkm1Uqc8SX0wsUu/ggNvpr4Gz8Z+Dh7Z2NipUbak5L6OmrkobSM9F9F0A1302l
	B9J0DmCa2U+1hvANim4Lk6Dr9KSm9gKFx0qQoOh4FuM4JXNt3ETPal2J2lU6MqMT10HlxzMfHPY
	b5orSidskqfdn0qtIWtYn3Lyb0SfYn0X6S5qr6ZLv9oYmIEmZpRPg8xWwMzP5JjnnU4QKFtHVWI
	Xta3pVizrx8NMUf9Yo4h6p77LryIpwq4+/etVddf7UjyUy+UmINNy72zqO3CfTvHxGJfS1hn6w0
	oFJSIi7dSBAdKvNXzAGCmTBg70Jowd4aaWkMSOTTUoWRia/cYfikWeBdMyyw0LbJtpONatncyjP
	sqrVvKZBVOVPeRxz1DaO6kNWVRJ50lkbuz09SyR6OYsOQz5143+lnTbBpglbnBaVe+UOHvjkzyc
	XAhwjpKXlj+sKgCi
X-Received: by 2002:a05:600c:3b99:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a18e48eeb6mr149058375e9.17.1791703360044;
        Sun, 11 Oct 2026 00:22:40 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm12434423f8f.37.2026.10.11.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:22:39 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: octeon-hcd: release the USB block when initialization fails
Date: Sun, 11 Oct 2026 07:22:38 +0000
Message-ID: <20261011072238.2381564-1-orgads@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Resend of
https://lore.kernel.org/all/20260917072144.438023-1-orgads@gmail.com/
with no code change; the Assisted-by tag is now in the form
coding-assistants.rst documents.

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
