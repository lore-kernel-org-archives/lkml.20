Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C241D639
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202399; cv=none; b=RzFZnvOS6DsXXcWKQGt/vHF9f3AYlaEqctED9sQgYvWmsRav0SaHLTur8Vwe/xt2IjALEFLEzGpMlxUVywC8yzYLZ8OI0Gc7fg3bv5JOH3N/sQPfqKnyr/QENYv2epkllI0lOUD273TrY79l96ltQcWy+MIIAYuZBKLdtqWMDMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202399; c=relaxed/simple;
	bh=2DLMTSMHxcwnSNUgrjPtTxElhAxiYSnUsdfnLFpf+E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQ5gwNw3dFeea6Ji+l1OzV65RgfC/r2GSX2xdVZBnJFPZctPe0exQUOc9kPR3vwGeIv4BHVyNugb0Kuz9C3DjNIn7OgfWdFUOFyobTzXFFQs6IMkCPKWQqBLllNVQ3qOsMk1d0CvHPQsiEDxn/E6t83TmuTiWgoBQzlR6/rBzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlElIbGF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlElIbGF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so2252006b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789202397; x=1789807197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CU+0lwIWAY9yJrpwScpeW8QXWre3U4uXlIjmiMGRqr8=;
        b=XlElIbGFWlTro53S1sJdCauSadyUUNL2S1eO3SlgMUf+eLDlHMFTI+KUWgiL0VwFTp
         Vf3oDGamWgOCmhvroB1+B3HA+7OXZbwkHXsOuNUnhOTraMtKz03rDblVEagbg4NWUA8B
         v9H8is6T6xkFrN6BwmlN1Ve4Kgmwd1j7scBWGGgZ4PSydu7iTqac55hp/iGHeIu501ye
         PwTsrT857xdJuS7CpsCGu3nVF+F1NaIHo6ttdPkTXygNts5GZ9KhtAcQFjUHuAlebg/c
         8HaDoGgWrpuizzb8CinUHy6LsyXMSNN7vsMs4Y20+WseSCBk2z0RrOQFg8d2xVFLNpSj
         XdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789202397; x=1789807197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU+0lwIWAY9yJrpwScpeW8QXWre3U4uXlIjmiMGRqr8=;
        b=TaneAl33ImTe7ZdLFA6O+IcP+wPZmYhwOrSyTOLhwMNu1tAubLZRjNVcGmaVfSPsK0
         1i3NkwckC6TJ/AmOhRQhTqUsI5fOctIbfTroPDJhRUII9Z+OaS49B5pxDutaxjrOpVgo
         y11hyUTjtrK/D31gyq0O/J08xFCEipJnDzOVS6dUhaLtYBFnAxFxmQ6irBWzsfXUfRS4
         3By4jvb4qSciikyJ1dXx6xWzHTT+ni2k4SXMtP0+/fQ4XLlOJWHCr2kvUXH8kr9dIIrR
         Sfj+2lHh1vTva/FRFGxeQPpELr8A7h9NjgohkovdjmO3OT8+54WPVHrKK8uRNQlcR5Pw
         dk9w==
X-Forwarded-Encrypted: i=1; AKwUvBzkzJ3HYZ2BgivIk2gW4mDlVbPjRm+qFgk3D+xs9UFt9B6+lAXbiXxEn7YZG4BvvyOjY/RQT8btthAFswQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mcrzOygRAjrdbSp+q7ZJWU+jvP3UXYWyeBiHwZF+vCxsh6fDWg
	7buSUfOHhh17jYAmh+lUUpwuEWwVIsmSuTIwweH/2CWfHTL0rqnzapW0
X-Gm-Gg: AYBFou1c7tllT1bhwe5fYWJ1iBg9HmvaDutw8oPdgq7ehKsFJ/BUBjo/XU+ISbZbxsN
	M671X5ni0f/KVsDOEAgZzQ0tG4viVHPKuoNKVg0Cx68Rzn2TMuBiQkCpkx1+xp5PhKS/4AezbK9
	toblqg5uarvmMn5newFXlli+UivOi73P+LOFbqoFR/xkM01mLDO5mxYShr4LJF1Bb4tIXlrIpQE
	VEGjb/Lf2OSjPwM2iu44zaHDzbYFbg5rhZExCeE5Scpti1E/+7xheipC70ZK3H4apCbltplyR/Q
	g3xefJjL7TMlL4B5//XUAWYgJ5wvSquXR7MVXK7KfGXbu6CbZH1dJyrgp75KViMkhHgqQialmso
	f+5EjVMaENPach/d8wc7n4Bs6loRcXFJxgZlinIDgw9O/LRHdwPTNINdwBN0cxSjX2kIuO5VWad
	H2yp6Fq9wWQxOFgsL0So+zdcrRy3oHEjYIanmf7FRsKUMgNFVBlXeN4LqNULKbU5tPadeWSCmOP
	qY8t+kQsHbhpdLF2Nw3B0nLy6kHLWH+
X-Received: by 2002:a05:6a00:4c0a:b0:857:726d:270c with SMTP id d2e1a72fcca58-86b324ec7c3mr13256910b3a.24.1789202396854;
        Sat, 12 Sep 2026 01:39:56 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2c1542sm2128108b3a.55.2026.09.12.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:39:56 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suwan Kim <suwan.kim027@gmail.com>,
	co+66c3f58096d0bde8@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usbip: stub: keep URB array state consistent on errors
Date: Sat, 12 Sep 2026 16:39:26 +0800
Message-ID: <20260912083925.587987-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stub_priv_alloc() links a zeroed stub_priv to priv_init before the URB
array is allocated.  The error handler may therefore consume the object
after stub_recv_cmd_submit() reports SDEV_EVENT_ERROR_MALLOC.

Do not publish num_urbs until the array exists.  If a later URB allocation
fails, clear the freed array pointer and count before the event handler can
walk them.  This prevents a NULL dereference on array-allocation failure
and freed-array reads that can lead to invalid URB use or a double free on
later failures.

Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub driver")
Cc: stable@vger.kernel.org # 5.4+
Reported-by: co+66c3f58096d0bde8@bugs.sh
Closes: https://lore.kernel.org/all/J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7%40bugs.sh/
Assisted-by: Codex:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/usb/usbip/stub_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d9..33058fb05b2f4 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -534,10 +534,10 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	}
 
 	/* allocate urb array */
-	priv->num_urbs = num_urbs;
 	priv->urbs = kmalloc_objs(*priv->urbs, num_urbs);
 	if (!priv->urbs)
 		goto err_urbs;
+	priv->num_urbs = num_urbs;
 
 	/* setup a urb */
 	if (support_sg) {
@@ -641,6 +641,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 
 err_urb:
 	kfree(priv->urbs);
+	priv->urbs = NULL;
+	priv->num_urbs = 0;
 err_urbs:
 	kfree(buffer);
 	sgl_free(sgl);
-- 
2.55.0

