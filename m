Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562114;
	b=CxnCSiCJqDiVW5Po32JGDlmRca5NrbNPe/rVyFkIuHyxEAxnZGJOy3UFVEGlrNK7+YYs
	 EJCyrmM0g24we0y2ZnA+7bwg+Vb+UqaM743oztDMIPYU9n0R8RsPvBWX+IYYeBJCBvi1l
	 drH0GPR5NssCindmY+j2PI70Wq5rTnti6npVOqV48vNwNoVK40vzoRvbeHNu9S9K17QCZ
	 PBaxjZgwCANQs8a/CbXu1/58+vmUvXbp1Zbi05I1tFiFaQu1QXsSv/3lX0jSL7A1duFK1
	 pz/Qp+3hlDZIuIaWiV0HkuaX/w8JlNrqpi9co/O3DwwuCy+NWMNb9jTG7rYlc+tyLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
	b=dQt0bobvp0AHVLXaLfH/R/wSsEOFTFtdlaM/AOm2qDCM864b9VxiHh6Q8I/NrXZgw+qA
	 s/ThDmj5JxxuGdV9L73KCWT4tlpsxP7JnJT5onnfwkqN0k8SKhCr6fu3Do9txUEfBG5rO
	 r3rJ1uzT1VOmSfkEzLbOuZ2AiYYUDZ5lSqoG6A2cO9Dj6NFgF/SwuTzYkIJ1WCw67+spb
	 qI2S2cMhf6NHZETt5zJe6d7cEzOZaiJKEY8+bsaGuL/XhOGUtfLt0t34ap7NerxML//Q+
	 EUBKvBuXCFu7lEg3aMJVSe2mSAYQjCNUXEdVoKvTBsfUb62TjbX04kqE4NpAFojOY/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q5Vt0trZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1D606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD1D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q5Vt0trZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so10544425e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562112; x=1795166912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
        b=q5Vt0trZfvLnmCAMy685XlMF8Sgzc8zIOdLenZ1/hP/etBFFcqhOdah0kewkqNk0NA
         7+UnoOybnDbu+L+Ie/ry5lLK7SOxg0NIMSmUB7C8oPoyZmoEEgEhGxq15hXPGqjR1m+g
         icP7UQ05syVb+njAUPB0q+6FQkYijC7JENjGPIeGyjRdtioZrHDKHuMItFMYiGLPFC49
         wo0JzVizW9+bWdCAJyTNx5MJ+Lcg41RtXJrmNHyLvayyig6lArwdcNd24MBreABX/OOv
         mQZVJYDf1mUTmk1+ECFahtklS23nsZqZhLNGU5SYLmSvxZKskUgNrOchmfkWdkSAKsav
         YSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562112; x=1795166912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
        b=uxDnI00QtaPlyYyV/oAVLHDenAm/49XPo1GhbnCx/q/crNmXMjfz5av/6jExbbuowU
         APRGjJUnR/sVxgl/ponUm4aMO1RL3rgHdR/w0Lq+noQDqFumdTSGEJF+LZzHs9j/rHgt
         TatA7rV/ObdI+e2uHAjMlO3IgbdooKwNUppFiSOZ56KYq3PR1zTCOe4U7GwcEAMnuGmc
         Dd7+jLGUMtFiaY2O1G6d/xN6N7csX0UdzgMP/8TbMGipsIXj+9Ze4vVn0mphfNwkmLNG
         y/ADraxSBHR+odL8Qh59g5MWGlsZRiUYmkZQAxyyKvLoed4u6oEpF55nYEZ2QK+FCi3Z
         ljLg==
X-Forwarded-Encrypted: i=1; AL+hErF90xUaPXA86pVbSlttxtnCLvdSt3sdBZn75FGVmLqvCVrL3yo0KfIm4X+ujyLyyvybrocP5YVxXqnoKUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/77dqcO1Wa19hfSC78z3S5/aeC5OBcMBxBCY51pxTXEshuR7v
	dKNN75kMrmj770A8uRb+YrcZhWLnXMamFMxB9iNYiK3HmGgaD+x2zZ5dCR3y+BnS1i4=
X-Gm-Gg: AYBFou1AQPD+EDWDFC92Mtq6jdABLN5mKYL53I8wKXKM3dJbFhNP+IA3wsuk7Go0HTK
	47+q85lrgi3kmey0aMICd/aTZh0UPyvWf5+tmF4Pf0rmTWJiBA8rK0GLkgNkgoH9gfqVu6an6SN
	FWO6OHfCTPUvfc2AYgLTPZKV7WkInKvdWkxxVI/VNgC8QQkZAIPvs6D3/sIbwe7FTwp5iz6OS8B
	40fAHY/CuyFuZO7lPPf8tMkcQuVQ9kA1EmmJSKFVOMXkjpGLBjuDvaVQ1u9Wpa1rYgCYqQmPHpa
	Q0ylxAEGLmOJLnQQVdBHJEKxHXOqGfSaIE/bIB3zteAKGlVLsc75E+XYsUsBwqH9A3kvNDOX2mO
	k6E16/HHwdHoJHIShE8X/GPPYS+pxO3M2IXin79FO4l0Kd8x/AZDYZew4KfTfFMrP9oG5h5Izga
	P+HT78oYOBgC+B0U/ndSg1YP56aQDXioLoV+Hwuddix0D82n2D6aBGdhxBleOUuQYgUK9GMkWoa
	hQdyHfLvcV4IZYojYWrNuZyTbkE0MnSXf5+/wjp7l8mb7QlB5nvlG/rxgOoiy4MSrTpYJDu+kwS
	+sqL/5byIhH5OVHqr3GXvN8rgmKhhAcYOljD8mW0i42AtZSlYwBvmV2wLyW8nfXNx2KkzaF3doD
	Ha8TcvJP9Wg==
X-Received: by 2002:a05:600c:4746:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb55a6a642mr39933945e9.11.1794562112021;
        Fri, 13 Nov 2026 01:28:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:31 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:17 +0400
Subject: [PATCH v2 2/4] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=alchark@flipper.net;
 h=from:subject:message-id; bh=jUSuOPZ5eP9kIS93BTpZx28qBcdcL0VZ+bTNcBWSaf8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2FxltH31pUmZzfFfrVPGX29IY9btkScfZk5ZceND
 4cCdVkOdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV0Z6MDP37DiR6x9dbRB1c48jxO6fQ4XPE22MvX+xoqa5Rubj0YAojw2mL6Dz
 t15VsZkoaDXd6DG1fOjVmT/r8ScQonv/Uo43LuAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A gadget driver deactivates the gadget through usb_gadget_deactivate()
until its functions are ready, so the deactivation means nothing to the
next driver. Yet the UDC core keeps gadget->deactivated set across
unbind. Only configfs resets it, from its own unbind callback and
without connect_lock, so a legacy gadget driver that unbinds while
deactivated leaves the next driver unable to connect.

Clear the flag under connect_lock once the driver has unbound, including
when the bind fails after the driver has deactivated the gadget.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 577bc15f61a1..84dc0820c2cb 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1647,6 +1647,13 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
 	return 1;
 }
 
+/* Forget the state that a gadget driver left behind, so the next starts afresh */
+static void usb_udc_forget_driver_locked(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	udc->gadget->deactivated = false;
+}
+
 static int gadget_bind_driver(struct device *dev)
 {
 	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
@@ -1705,6 +1712,11 @@ static int gadget_bind_driver(struct device *dev)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
+	/* The driver may have deactivated the gadget before failing */
+	mutex_lock(&udc->connect_lock);
+	usb_udc_forget_driver_locked(udc);
+	mutex_unlock(&udc->connect_lock);
+
 	mutex_lock(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
@@ -1734,6 +1746,7 @@ static void gadget_unbind_driver(struct device *dev)
 
 	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
+	usb_udc_forget_driver_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 
 	mutex_lock(&udc_lock);

-- 
2.56.0

