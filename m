Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F1535FA3;
	Wed, 23 Sep 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174688; cv=none; b=UQC+R8QgwvSLKnksypTSlIBNBLig78c9C2iPbWfYh/OXsI5zr4iWXWqqCzWi9m8Sf2/hFhUotVxYHiXXUjGDIOngLw1a98FTKtQQis3wme7ijRI+5kbuw97fiKiQjLwX3sM3tESn7DJEqA7BkVJhmLU3vTwK9p3TcZQRMs7tew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174688; c=relaxed/simple;
	bh=LAwoB+hDKL1vHcuI1FkBdXq7Kr2Aj3tq2Adr+dI1mAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QRhhtK2hq/moPESh2dsRujvJRA1Oq0qQFEshzqgU3vr8Lj/BBRJIa/Kw53FUzLJzWlMjgpZB3GHIM/j1UFVtkS4hUASnrH54t32k6tDIpkjNhFwwC76/FqNoufRJRbEqhyfqUBWxkyyaN5khm68qUdsvmdNjG73SU8hR4IV/wDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=m9go9OTM; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="m9go9OTM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9CFD3EE2C;
	Wed, 23 Sep 2026 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1790174678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5u1+zM4KfuVHjxj92oAK2uBOgFJlHkQK0cTCn8jPASU=;
	b=m9go9OTM2DIK5jqDLhWW1Lmt5s6/SjJwiifG8sBMk9FLltkDrRQPy5VSFA+GAkZIPR7ApW
	PPUxRv904YLuQ6nK8+unRywL0cXRoVUKhh7xgnpnBMUJnCO9lCgKRRxUjgfknG5CF8+ihY
	a5/H/IQKR6APXLk7szXDb0FCpShNYW2l635VOdOaWa2oQcOYHZ0omz0F3iV/WOLwZZAYsK
	1VrAUcCLkIx2ut8GdwN8H+Tp7lbnNRx1/PIZceDirxQdVDxKnR5wMm/uxYa0cQw25EnMXs
	sA7dHWWcPjufiHi1LHnRmuuQnTstG1rCWDkAmq4YvbX+xLxH4BphmA6WEVCbww==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Subject: [PATCH v5 0/2] usb: gadget: f_hid: allow setting different
 interval for each speed
Date: Wed, 23 Sep 2026 16:44:14 +0200
Message-Id: <20260923-usb_hid_interval-v5-0-7e0e2879ba8b@marmottus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7ls2oC/32PQW7DIBBFrxKxLhYzgIGsco+qirAhNVVjR4BRq
 8h3j0kWiVSry//13xvNlSQfg09kv7uS6EtIYRrXIN92pB/s+OlpcGsmyLBlmgk6p+44BHcMY/a
 x2G/KnDaotRIaW7Jil+hP4eeufP945DR3X77P1VMXQ0h5ir/3mwXq7qFX0IIQBqEBqIWkQG3Mw
 xwPZxvPU85zakafSdUWfAFRgUTFZKMM1+JfjD+xzXcKX3GjpDUn36NT3ZZEvEg4bEgEZbRlhhs
 BjLv+j2RZlhsO/gWHewEAAA==
X-Change-ID: 20260804-usb_hid_interval-0d8928874826
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGbrVzVQ6Oq8lVeHfcQGwoxt/trbjb9wOx1YNFER9V3QVTrOqGIqra8DnhBgr/EFGjL6mpG9DHHY2hfwC90eldABeXPuNkkUvsA9huCuQRJ0Fo8Mu0Yh35Hn5+4i+2/6iCHxOcSuqwqw4eSfEHeXjWgqU9XPIdBQS1GQYjMZSnLs4ZoJbGVS1RHS6uqKUfzuBQCIZlWE9dxqGuAfi89FrUdsBafNQz4lCl8gDN1iAyrpBarXo1ZPWkGqQ0/VOphJWPyPk5G+mLzNW2krGr1eVCMZNLRJfd6nM0HcOh+bz7CSHe/SbGQxfnWyiX7hXHdK3WSCZHjnWPxvuW/uxuQuqxNNVX9VQhOLf9HHog64eu7nlfD+qvJNq+lk9Z/leiEMtZ+sU3EFVEXpPTe6xeRKVcaSmhOGhab9gf9yxGx8O4vDVyDiYyj1WJkRymkJfyKP2/u4BrMnoVfG3xMnTaXxrbsEVSpjm/cNnWBjIkgrwvsOVtQZLJrxP+EP2+YAF2MWBcXRbhkSpYe0aqD8jxMKkEbj8R0zaa5K+YdWc/3V8ZQchTk4MubR48ZDOnlF1KoBLZe6uSzuBXw8AvBNRHRSaVAf6KJI3xSxPFuUBYwFA+W90yVQV0PgflA6b6I4vqbIX28F6P2ZNOPKGg4SmoZGx5ssDZZEtvr9Bvzl5h9kLKJDA

Hi,

I am using the HID USB gadget on a system that can be plugged in to
different machines with different USB speeds (high or full).

Since the HID polling interval unit depends on the USB speed:
 - Full speed: bInterval is linear, in milliseconds (1 to 255)
 - High/Super speed: bInterval is logarithmic, encoding the interval
   as 2^(bInterval-1) * 125us (microframes)

Exposing directly the bInterval means that the user needs to know
which speed is currently in use and has to convert it accordingly.

I propose a solution to to expose the interval for each speed:
 - interval_fs: bInterval for full-speed
 - interval_hs: bInterval for high-speed
 - interval_ss: bInterval for super-speed
 - interval: legacy bInterval that overwrites the per-speed bInterval
   to keep backward compatibility

When the user sets the legacy interval attribute, all the other
per-speed interval attributes are set to this value. That way backward
compatibility is ensured.

Thank you for your reviews!

Arthur Crepin Leblond

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
v4 -> v5:
- Got rid of the f_hid_opt_interval and user_set
- Put the new attributes in the same documentation block
- Reword the bInterval differences between speeds
- Link to v4: https://patch.msgid.link/20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net

v3 -> v4:
- Update documentation against 7.4
- Removed unused struct f_hidg::interval
- Edit cover letter
- Link to v3: https://patch.msgid.link/20260804-usb_hid_interval-v3-1-975a9fec2d7b@marmottus.net

v2 -> v3:
- Use sysfs_emit
- Link to v2: https://patch.msgid.link/20260727152705.79384-1-arthur@marmottus.net

v1 -> v2:
- Expose a specific interval attribute per USB speed
- Use a define for the default values
- Update ABI documentation
- Link to v1: https://patch.msgid.link/20260716144921.1120265-1-arthur@marmottus.net

---
Arthur Crepin Leblond (2):
      usb: gadget: f_hid: allow setting different interval for each speed
      docs: ABI: testing: document hid interval attributes

 Documentation/ABI/testing/configfs-usb-gadget-hid |   8 ++
 drivers/usb/gadget/function/f_hid.c               | 140 ++++++++++------------
 drivers/usb/gadget/function/u_hid.h               |   4 +-
 3 files changed, 74 insertions(+), 78 deletions(-)
---
base-commit: d58dffe9ee2c8883193959ff4ef995ec07932874
change-id: 20260804-usb_hid_interval-0d8928874826

