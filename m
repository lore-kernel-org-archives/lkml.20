Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883144;
	b=dNooeUS+C1jHt7kLiCzQTPyUYrSPpGCeuj93XTQ+GpZmV4/tOQBEa5osL2Yco5Sl0PRD
	 UTr78wssecuUpf6+oOzQpA5tK3D1kaYIy5qrNAxqb9N1S6W0g252feReQEyPWfVpzkrI5
	 HNJATZwrgmsoAdxx1KmiXW2OxiaLO2X+ESWpbQrU8yLUQ33n4sA+Ee+qadA6yAXD5hMrb
	 GMU+HAGj7BTiaurTSN50jes76DXGqjPnVAy4UGCsr6Aq9Ih+HntMEMqL2IrKXfp0d7Pw9
	 MpZWSDlP9Ecgt2rq/Ez+3Hfb1juVRO2LCGmQytF3bRIiWTKDXySvnWuLcrYBIEnIhAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
	b=hy/LjitvQIkAsmYa+8pw7owc8dq/d3hdgW4Jq/ksHDADhJYVs89ujQb6Tz6843Uc24Vn
	 M4m9ADIP5GnVguOHYTL42JWstW2jcJC38Vx3J87/Se4jGKrdHHgIN4NN/oJvgt/V5RVE4
	 Il0vEOlFWRsTqQUTUfxkwOGVTq8cD0NkviAcXUfL8Tensf8UA1J+WFFYZqW4iWx2Raymq
	 UKthmBfSsRS/DpDxvKlNX0KiXJY8BMz3lri22L2yv/PISKweHr+b4SgevNTGIRD+4C4Oh
	 QFyJpoH+X5fGCU8kvm8LGc4vLzKDxIKqZEKQovmmJI8+mOaBsD5Dw0A4h9QCUJysSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OD9T7S7h;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A96B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OD9T7S7h
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3712b6d9843so3428714eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883144; x=1795487944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
        b=OD9T7S7hJOK2PPTs4+UDjk213M8qL9EOXcUHEhvQZCjY/aKK5URT0HaA8Wvoo+WdC0
         CuH/7hog0J6sPGsVM9tdLW0IRfA46XlcAT3AkJnLuikmSYcpdOCmMU9OHaTq3OMpS8/R
         /3U+6Zhvm7mdbhV6K4qm7QfKqG7cIUFRq5Ldp+FQzNWXH4TJWlfpVheI7Kel+JoGdirA
         wWqh3sL0ahYu8lHd4sSoj89Lbw1WELTJ2h4HaIt0T6a2tBzD2KGQ41gxf1xDKagdOD0C
         +eYaf6k5VVsX6JcDDzGEPyHBmvar8tdlPlut7O0C3JhSLc155qr0CUVPhbPMaSYwc5Z0
         0agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883144; x=1795487944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
        b=mDWMZXC5VSKFFiMWCzec7WCyiDYNJCG8hKyAXibnyokmLWTJNX+zT/gpM0kRoSFgdM
         9fUsykN98sgH53Bs/fbTWLFWazrI4e1tJInDLyxIPU1CdMxUD7ZreLUkS/xWlUi1cGT3
         ncZT9WDbw+dOIgx/Nps1swA4kY8BUc1PzLoNqRawSYCePoVJliBGZEa/+4e78YNOvT6X
         QhidRZGlMSrnYrnMp+BtVlVAm+0GL3rXkzx0fNPshcSPB4w2E3CBISFES+MZ9bwYgEJl
         pHS344HiYbt1KP+xW3sGV1SnWt5ADwg0kGMcKzgocDVtBgD6cYiU0S2kdOeVTiQZAdM9
         RjuA==
X-Forwarded-Encrypted: i=1; AL+hErH+08JgHMh7+7rGi+XO5dmFM3Ovvi0L1ZJCkQ0Oe018/aNQzNfgQpFKg5PAyVYGNIJ4eBDMOwczCnGTYR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cZhU2w2/SSv344hjpXbAjDQrmUsFu2Nq8/Bh2wsWSU1B3YwP/
	wyXFdikN0ymlJs+XN507nPSKPsR+iQYwaoZ9Jag+8+Nw5jyBHgiVg2XMt6Zq600k
X-Gm-Gg: AZFdTZcyYxRPIdOdhA1z28+deq4mRITUr5YEGqdSG+IfffCPyHrNk4VjUY9SOUpfgfa
	MnoMu5xMoppsGyUnOFv3G5Vh2S4IWUwFPs1ULVJU5PxOy5xix8ZDtqaFloDWjgdXeYDDiNV/ZlA
	sj2zUYSXpjACOsi8Xto/PPp/f4aFXctM7T1mb+fbkeLiWENbc9MkQQi59iFabungGxILn5qmcSV
	8Le45UtI+TsqTPSFT8N+S1uGJAiE4gqXXqlhT6D5LbxiJQJLNqu6H5GCZpNoq4LA54sPm6rV+ro
	XYVQ4UKVlphJ1oTLzVEMzA/bSsUUrLC+YrNwrTbsTqz9Uj7KXxWVJJUPFp6nbn65jVluuJs1qRa
	xOdiLG69Mnfpc2lRXnkOS+sfLiloev+RTB3rZmQD+mphc+HhSnVM+ykaet4F5eOyHNJCNRlVLBe
	PjSAUiKtA+yuxYxVMvbi+Pw3LSKeEqdTre2v4eIKnIj/BX78vhJGN1I8donieY/mP9AozeS3DYW
	txf7jvl792/U3RBt8Dcy3gJecKNmjIGZRtlA7uFb5CBpx0Zkfc9Q9NYenrinsd1P4gJZEqHP0nO
	u7pCPX3l7OfOHihAftEBnBikOPc+HdZ1UwSSCfF/TX7WfC1UzwI4WfiFAq2djX1nEub7
X-Received: by 2002:a05:7301:92b:b0:37c:6001:8757 with SMTP id 5a478bee46e88-37c60018931mr6407784eec.4.1794883143534;
        Mon, 16 Nov 2026 18:39:03 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm40651048eec.28.2026.11.16.18.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:39:02 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: usbfs: reject SETINTERFACE while suspend is allowed
Date: Mon, 16 Nov 2026 18:38:58 -0800
Message-Id: <20261117023858.467683-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com> <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu> <20261116060549.370140-1-teel4res@gmail.com> <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
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

After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
reference and the device can be runtime suspended. When it is resumed
through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
before usb_reset_and_verify_device() restores the altsettings. The
restore loop also runs when a driver bound to another interface calls
usb_reset_device() from its resume handler. The resume path does not
take the device lock, so a SETINTERFACE issued in that window passes
checkintf() and its usb_set_interface() runs concurrently with the
usb_set_interface() calls of the restore loop.

Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
first, which resumes the device and keeps it from suspending until the
file allows suspend again.

Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Move the check before copy_from_user() and add a comment (Alan).

v1: https://lore.kernel.org/linux-usb/20261116060549.370140-1-teel4res@gmail.com/

 drivers/usb/core/devio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..8a032f4b547b 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1531,6 +1531,13 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
 	struct usbdevfs_setinterface setintf;
 	int ret;
 
+	/*
+	 * Avoid racing with a reset during device resume, which restores
+	 * the altsettings without holding the device lock. The device can
+	 * only be suspended while suspend is allowed.
+	 */
+	if (ps->suspend_allowed)
+		return -EHOSTUNREACH;
 	if (copy_from_user(&setintf, arg, sizeof(setintf)))
 		return -EFAULT;
 	ret = checkintf(ps, setintf.interface);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

