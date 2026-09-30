Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901F3546FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761238; cv=pass; b=agLdpw1DTWX/iqslanb6WoPSFytx5bAVgx5hi5+VhTJSvBHMbCFNb1wTtlIH5UVoLKL/8sBDtoVIZtDoxs7wPSnav+1No7nCBZOtpTWW/RxJ3+02xvOn//2fvKCqciQRxlN0FMN15aBrbISbuyzsM8UlO20aquEMZuYGP06do2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761238; c=relaxed/simple;
	bh=wFuX1r4Y7eDqGdmym8I60OlUlx3AqSTMX8iIAdniMwk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=pf3Vf1lR1ALkkigFYo7Iz4rt+K1hIt3z45tbqGycUZKyXszZBc5zqY4lgaIjmveUr4onG2pwBE5lbm17V7ES2dBTvE95QRTwAKKuUfFu30ax38OYlCoA8dI3J01DP/FtP+W84ON9WQ13ShFKf43vKO9jujBe1ud9ZjE1UV5P+Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSzG1He0; arc=pass smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSzG1He0"
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d4ea61c057so679536e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761236; cv=none;
        d=google.com; s=arc-20260327;
        b=slANxpmKZsYKFtF/GFhLSbOjNuAKMzNq2KSu5/y1a2o5F/7U7k4oHHYJiQxdpwM1Hg
         Rfit126ITdzoMGFFRpx8WUZGiHHqeao6nCX62+1x9rBnOYTZMfbRR8g0qnXTWI7qjTde
         VGorRYV7vbUrUHBxSQtBykMaMFAj76PDRKW61AHi6bWWEYVYGTFcSqZgInmquHOWvMuU
         VkpBRaE33pAgbM7UnG0MGSi9+hd8yN4HcQwkmG+BNpvEYSjiUJANPuRqZGS4g3BtCeYY
         hcL+JPagP2RRWp65veJVzwf7y7uXhEuWiLjRDS7eJsT2ri05Dqi1BNgTwT2R4lYB5gjc
         3MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        fh=egphjEoaGZbHk7IfSnEAmOaCgPZAVMM9/ZWP+YkAWpM=;
        b=EMh/Slt54lg/CIaWKVMQT3yzfL26W/kwIS+g4XW/93azoJGvIDo/TfNEEDqSlQilwB
         GPSI5KGPODe8Oz0E17vzlqxFLn+QUl8kLaKwNKEoklzASssvDwIpJw46M84+X5imVaLQ
         E/jw5mfPRrtzU5GZr3Pcvn5FhGZjJ1jMIV0rIkFKqxR0w+jv7dWITY8BmXrSk5c8NJJ3
         2F+hjChcBEZ7kWHkjZ0jXe6F5yEtzGgx+YQed8FqBCFYcW/YLdo+uNlZI5VK4F6fVfMp
         B5ZmPPDfA51aNyxGqrbEYDGLP3ctL6ZsHblQumqCHxgT+ZASoFVjs+C6zKjxf20XpGJ+
         iChQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761236; x=1791366036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        b=MSzG1He0jMY7fTHn6rOXuCgCFGongt3w3MMwXkE5UlTzYxp7ZJ82+qakiTXc8TRlzn
         onyEzrwvGPwmOGxFV07Rf24X5r1W7/DRknCmraK2b/L++HAmZy3hk+Ri0ATT3oE2w8eK
         8dkTTX8qtvRtxKD9+UMN7dXQBPMvDOilPqm3BFb65tWvP6mJ+baMyWTe6v7+fFdgHimy
         K9ooo1r0LtBGkw0xXFqY0Nbq5xC5zSwY6UzQqazGEdA6Jm19UPCyj+bh5SPg3LczNivz
         sL5oQKmofIIM7aKWGUBiMYRnq17nTmxH75ybhT+m8TmaKf23Z/xswDYrf7zggTeN5jFD
         d9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761236; x=1791366036;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        b=0Bx1CZTkXB681V56u/JfKzauCd2NhOwp0fX/8Z+kNytlc8KFfA728f6YFjY/QFLIzd
         eZXu82KbTuTRiQaXdsOH+kBAf2tugXaF31AFeELx1Q38Ulo3emNiZCl5wQme0jHTdHKu
         iieRWMm29//87FbeEa/tPb/8aU6fU8Zu25wkHadXjpfn9rUHHgBTkNg7n7sJdcxY8PmO
         0PsrhliGpCq+wjxjgVOSSN87F8+SDrRSgYXGmvKu2J0RlHHZLhm/5ztHb5otHQHBHFjj
         Thq/1M1IvS9j3fQWqvkkllU9rH0Aj6pCwafDH8OWFyQe3j9JF7a0dZKYAGjrt7cREJKq
         ffKw==
X-Gm-Message-State: AFq9FYKjhf3XDeqWCFoXMKF4ZFq5EYYOByCnxOYK1issNk/FA6mhcK5p
	sKPO9TrygKouaDlLFzVsNr7DWfxUthCbLSRhlpn1gBEsNeaQXk0c5hi1nbPSrsXJ2WL/vThk5yF
	J8b72N2r7VrJN+47AKPbHs9EVyQ3KX/w=
X-Gm-Gg: AYBFou1mUnxnHibVFow3HYldT2P/JzXbC7NztQDzFToerfKUPYaiVoXc79k7J+lPktx
	9rphKIPMX9/hfCJDOY9G7Smftg+FM1pwKb6GCHmh7jgrYZlqoVIz4X/29AoXiLTDy3QSx9AeASu
	kBQBJlHiPeyZwG++DaE4Eory/hO6/1iJZCT7ONFOHKU41UzwnZgcV8Wf9Iu6wyqx4/ajSfuq2Jl
	b5Ix8+DEu3a0uJCheZWbAghR+3rI5FU3GOto9BtFUpYx/IDjSMGodBCZTdhEISmo2z92dfr7KPo
	zyPkdop1W4zgfkE2ll4ZSA//dTjebzGDpGMb02aX9WjBUC64U4746XwFVhAd7xNbiDr3zTHAUTA
	UDXdpdp9xuS6dpltWIzXk4VqmMk0dLNLoz9NQZQnnq1FPEKme8fDXUh4lXP6mK8nFEvrzPpQ=
X-Received: by 2002:a05:6122:1998:b0:5c6:8480:35c8 with SMTP id
 71dfb90a1353d-5d67b7552b7mr142766e0c.8.1790761236462; Wed, 30 Sep 2026
 02:40:36 -0700 (PDT)
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 02:40:34 -0700
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 02:40:34 -0700
From: David Pieters <davidpieters1978@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 02:40:34 -0700
X-Gm-Features: AclHuK_GQfg0iT4xKk2tKp-2KAyN4MTRhJfMh3s8BkX8U4dZY7fQFIYirkLp0yE
Message-ID: <CAJ3h-bO00mynmttgf3UxVtqM=S8Q=Tf56Ts8SEqmPEM9dc4czg@mail.gmail.com>
Subject: [PATCH] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro TrackBall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
(056e:0132) and its wired counterpart (056e:0131) fail to handle USB
Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
enumeration on modern USB host controllers. When LPM negotiation occurs
at boot, the device stalls and fails to register any input events until
it is physically unplugged and replugged.

Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
to initialize properly at system boot.

Signed-off-by: David Pieters <davidpieters1978@gmail.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 1234567..89abcdef 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -350,6 +350,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Corsair Strafe RGB */
 	{ USB_DEVICE(0x1b1c, 0x1b20), .driver_info = USB_QUIRK_DELAY_INIT },

+	/* ELECOM DEFT Pro TrackBall (fails on USB Link Power Management) */
+	{ USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },
+
 	{ }  /* terminating entry must be last */
 };

-- 
2.43.0
