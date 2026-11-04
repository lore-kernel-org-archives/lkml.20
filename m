Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785907;
	b=LWfmC40DSy2on+wUk6OvJ+ncJwLXvHHgG7M/i1c5dKiz+5gZUF9djDldUmRp4x/Gxl6Z
	 8GHp7i5z09wwJFA5Ur+YVNpRBd+QuhuGh/htbOOjPstx9Z60FwFeUhRSCed/DE5Vo/ANk
	 E/MvTUqX/Xy/96kNo/PdLgio4f+g2hLpNk890GwJ06jzmHFVHrFdO04/0iqaLM7tjKvjF
	 ZDkaLL95eMvHS1HeKmmPYE0vl4UH54GpdfPmZN8C5pQxc1ybto0r4EpW2MuF0CcfLi0Rv
	 QCgCV82GZe7QvN9PnCsb/1z/Np3qkzJVHzkJfaqG6z15SpdKJS42DpbW3eJj4be1pYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
	b=sqfH0agbBG7tFQkQA/G14cRfOFY4gYt5DE9yaKHnAzYKJm6qdjv+Mgi+QRUJh46jhOBO
	 46LLJNXOfnVCOD2WRpztZhS3avd6UoajDQ/NQ7lVOBtsYzo5CCXHWFtzdgPbS0BNVqn0t
	 eIhIAb2Fi2Dc8GD2HjSvb6QzAsGM5qNC+dRMIvGkdgXF4w5Ri6YA6Ek6cPS3BIdUzC04m
	 eLddf5qukRF9Kf6u2mlQfSK5mOmpHwGR0AlhBaaDXuv08kG8zqi42pZ6Zhb6Gc4bEaFZg
	 1fkb0+UBF5KgvS0CRbgaGfSnyGws0wlK+hAj4+DDHA0QRjHSSNksnTY7lljkCGd21Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvzAi1k2;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1979606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1979606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvzAi1k2
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so917489c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785906; x=1794390706; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
        b=DvzAi1k2XvBMsf8SAbcekaQNAsxBrdwwVvAUCPoqFhD8kyZ/3yIpeiWwIwZCUke8Ox
         cAKXVq94JjFzYEMN/wT681fVcm2XmEn6WPZrcqxQO8SHuv1Xpz2dMQgkJppuPhBtgvAv
         Vj+DEJktSrAtpRNh1H25LQvBOgt6VhCXwRuXHMyrl/pMJGsp/LPuXxz3bK0V6dd+6XM0
         1J6ZWC9g8jSR0EE7QBmcR/p2INFRW6p9CkL17Q8oHcfoXul0el+wLV3xJPhV0ZSuFjey
         tPds4gZiP0f98je3sd8U4R+a2s+3IuraTonHATGqi3mnxAGN9cZXTFVdOL5kVb1xW1TO
         LCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785906; x=1794390706;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
        b=SAVU79eev9K/VMMMbPxjPy0Mtm0+FKg69ZPxUHABPU5N0CGM1JofQN3uXLXeglZ04j
         f23M6ExCq7l9XzqQr/4l6qa0fQOSf/eUSzLNKRodkTsiRAiGd3V5aaay0HwgKWIRU9wY
         wkC4NoBzdEvX6adw1E6XAB9FPTZakBNzL8el9mzlxnfsOhb4/i/HJ0kDV8XOI6Dcw4QT
         MnKqujksmjfqLwvCD9hx+AEz4PExl5C5FW30ZIkYeNhVSLkBEoWTeyXS+NqC51bS1k63
         dIyDAZIyv6CwkNgP3qgXCkKFBxEdjpVYPnFPXbVIKd235mhQuVmQIQufSelpwegwlC10
         0IFw==
X-Forwarded-Encrypted: i=1; AKwUvBytXWCg6e65QixwSAw0zwQGkdzwG1cXlOdSGIcqN4i1wmQZRmi85i0XR8PenjVlIOgFsfhPpATGfCjUo3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4QR+whCQBXtC6fW+1kZtprh719807wf0mpvaZ9SCsERHeBMl
	Ju+prqe0mCQlWYLTlPVvSE1nhBdmqBrsV4jM43vYCfHzU02AEuGHyUco2e0m3vTBW9jax4r4
X-Gm-Gg: AYBFou2SwIXmhbmjjAvX3UiDpgoY+lVRnxqGZLE3WPz8Iwu5295l5qHQJ6eNJAcA0q0
	fporLJWEmLNa8V6DF1ZGCkIZdYGn7y0xscQ4Ce97RETuTcMl9rRW9n97Q8DkPqpkxM4kHWDGOJ8
	0DmBtT50uSpg0f6JIeWVJ5IzLkXJ40M74hx5Kqh259EO+6fMXMAWawkJraj/EdBpdZMZM6aJhKK
	mcd0wvos6149Qt0Hzmkk6o+Zc2OGjC6tABsqwr1jZB5yld1cMJbt9W84s4cTnwJeEbZasHz073L
	0vWEC3hZx4K8i6lNZbh2cxIeqGMnu/riCfTFvu4EhWzdYiCmoXisZLu0ab62i1H2mVE51psECaZ
	5T4pFTQxikeQxOS0qP1HqKAOJbustnEi3cRUV128TVXFrgvjtYhfK9V2Az3R3yJBQMRJUZ75aO4
	1aHNaF36WyA3Th6oH3yigRZGTq2JlM0S10HFJ+bbd6dblk5RfxfdrZ9Rdehks7s3Ib9IrYRYuFc
	tP9ddZEO5kppVPYuak5fJPiqTX6VxseJUAjcp7WZGDTc4eBO7DlotlkPTpcL4W3MleVrL9+yzQ3
	CTNQHwAWdcHfnYhUAtCpdF06prVboeIki0jEaUfCB1KEzS8NUbfN1E1UTuaay/4TAB8=
X-Received: by 2002:a05:7022:ea86:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1ac55774fc7mr23215496c88.1.1793785905823;
        Wed, 04 Nov 2026 01:51:45 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm6044757c88.19.2026.11.04.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:51:45 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:51:32 +0800
Subject: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM port
Message-ID: <179378589227.74015.8259496684787732118@gmail.com>
To: badhri@google.com, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org
Cc:
 linux@roeck-us.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tcpci_remove() unregisters the TCPM port before the managed threaded
IRQ has been released. The IRQ handler can still queue work on the
TCPM port worker after unregister has destroyed that worker, causing
a use-after-free.

Free and synchronize the managed IRQ before calling
tcpci_unregister_port(). This ensures no new alert callback can
queue work after the TCPM worker has been torn down.

A KASAN test using a simulated I2C TCPCI device reproduced the
race while unregistering the port. The corresponding teardown
sequence produced no report after the change.

Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..580dd5256d0a3 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -993,6 +993,15 @@ static void tcpci_remove(struct i2c_client *client)
 	if (err < 0)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
 
+	/*
+	 * The port's kthread worker is freed by tcpci_unregister_port()
+	 * below, and the threaded IRQ handler queues work on it without
+	 * any port-registered check. Free the IRQ (which also waits for
+	 * an in-flight handler) before the port is unregistered: the devm
+	 * cleanup would only run after .remove() has returned.
+	 */
+	devm_free_irq(&client->dev, client->irq, chip);
+
 	tcpci_unregister_port(chip->tcpci);
 }
 
-- 
2.34.1

