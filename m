Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB04B7147;
	Mon, 31 Aug 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184685; cv=none; b=fDzIz1Ln9YmKtouR3i5UR9P6iu+/BqZ70EZ83VyWzSZDvj3ZSb4YnesOEjaVBKM6YaMvlJ+pgJ1GFGaQuhywqq8xQsZgMC8QkQdajsM40Tvf7z/pRRMeBdL/gspyooKtQeCh++jd+aaFEnz6jqoNQCfjl/s/s/XBySj1UmPfHfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184685; c=relaxed/simple;
	bh=iObjopHkeYEi25tSzD4CmCFw1z+jSJNYt1jhj6zWhM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qbE/bY2StWUqLh07mUP9oSHgpC3/mD/tyJcFV27oiIz+800fqTG3rZEn4se6Qyuiy9vQHnW9drDR2PmX8XGClofZcqKClsMx2gM6mtuo2CevC445wEPYPv/MeOUBsHU4yFTb3CTeRvMC06v6xLMoqaWxTEt6Xp01kg7zfJrcCdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=GuBK8OL3; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="GuBK8OL3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BEF33ECD8;
	Mon, 31 Aug 2026 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1788184675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FTamnStOcGAtkUbsP5ZHfIdrQ0T8nrAJCsCYWpi2/bY=;
	b=GuBK8OL3Ab/mtzao+dpjseW3KLvr8dLj6UAa01u9D9X1zthm2TgD/zx6SiKGPisjyNfgDY
	7qebpYYPwQsl2z7y+VH5A79OZ3jyMwdIVlzyZMtgVzjQa4UgQCQN8k+5SqCDgRwrmwqyYl
	b4locwkXzktp1ZkNO6aQHaRubl1qSPRsUk2C4DffDe23khGIJ6Gz2nbEDoUhVgDx1GTQL0
	3RFsSK72ELf+gBQf13j+vXFDF+Rc8jP5EOucQCheknEzjBgHbGov1AYfWN0KHEBe36DLy1
	TxnCh+dbL0xCxEeOIONya65FL87Xm31xZ+NqUaPpzOYj7aoZxTWRCqxKmmwPOQ==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Subject: [PATCH v4 0/2] usb: gadget: f_hid: allow setting different
 interval for each speed
Date: Mon, 31 Aug 2026 15:57:21 +0200
Message-Id: <20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGIlWoC/32PQQ6CMBBFr2K6tqQdCm1deQ9jTIFRahRMWxoN4
 e5SXGiMcfl//nuTGYlHZ9GTzWokDqP1tu/mINYrUremOyG1zZwJMCiZYoIOvjq0tjnYLqCL5kJ
 ZozQoJYWCkszYzeHR3hflbv/KfqjOWIfkSYvW+tC7x3Iz8rR76SUvuRAaeMZ5KgrKqXGhHdz2a
 ty1D2HwWYeBJG2EDxAkL0CyIpM6V+Ivlr+xn+/EfMa1LIw+Yg2NrL4l0zQ9AWrxKs82AQAA
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
X-GND-Cause: dmFkZTEhjPaIeqHWngbTOBdeig8xNSsVmyAyVQ2cncjqlIUuF4fHhw7vkk1dIwTst4ABfxbZhqkJkfv7fGyPXtDxttK1dKhDcG5KJUzOvP8qf8Ye5L7tCf/RdoK2ihArSAAL1OrxD1Ud2GEnVvDZoxOwHvBS+nW2jQXKkjB7O86uQZ0InAGPFvilM/3rRMgFLtbRbo2DbQsUYRAEz08+0oEtdfRsZRsw+J4rigXWKb1m9OHrAhRrEXvVwOJNJcv9PEO/N4hp7H5NS4SAWapYPE3udE3/3+J2itnzfCt9kTVxHe+FSNNJw3CuCZU9zHk/3fViD+Zk76MdfmhLQJF6y3iRxVnYIWn+43nAnA8POCq/K4SWvha90B1Ng+NYTULdNwi84j0JYsJuSuGneC9c4RF7Hs9A0RVINLgvb9ceI9cY/QZIN5VbIWvbmYZaYqi7S3j2EwFpLTimhUTlB2FwZHi2cUD/5fJsfnfXqabGCggTDRDvTByjKPmKM8Rd0QLLBv0Y7k7eTaGR99kpnmBfc5gLe6ZFWjlAMaq2rvvzvHJajCkWhEsaVCdvHM2fGWaFTX6cZu33LQtIKrxziaccHHo5a999BsgFNu11csyLCuf13oxH5ygkqMK5xl3SC5/BEDUwCzli3JUZ39N74TBvw7eJIBP5zmBmtf6WHqmeSaB18XOJ/Q

Hi,

I am using the HID USB gadget on a system that can be plugged in to
different machines with different USB speeds (high or full).

Since the HID polling interval unit depends on the USB speed:
 - Full speed: the units are in milliseconds
 - High/Super speed: the units are in micro-frames of 0.125ms

Exposing directly the bInterval means that I would need to know
which speed is currently in use and have to convert it accordingly.

I propose a solution to to expose the interval for each speed:
 - interval_fs: bInterval for full-speed
 - interval_hs: bInterval for high-speed
 - interval_ss: bInterval for super-speed
 - interval: legacy attribute that takes precedence over the per-speed
attributes and sets the same bInterval for each speed to keep backward
compatibility.

Thank you for your reviews!

Arthur Crepin Leblond

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
Changes in v4:
- Update documentation against 7.4
- Removed unused struct f_hidg::interval
- Edit cover letter
- Link to v3: https://patch.msgid.link/20260804-usb_hid_interval-v3-1-975a9fec2d7b@marmottus.net

Changes in v3:
- Use sysfs_emit
- Link to v2: https://patch.msgid.link/20260727152705.79384-1-arthur@marmottus.net

Changes in v2:
- Expose a specific interval attribute per USB speed
- Use a define for the default values
- Update ABI documentation
- Link to v1: https://patch.msgid.link/20260716144921.1120265-1-arthur@marmottus.net
---
Arthur Crepin Leblond (2):
      usb: gadget: f_hid: allow setting different interval for each speed
      docs: ABI: testing: document hid interval attributes

 Documentation/ABI/testing/configfs-usb-gadget-hid |  18 ++
 drivers/usb/gadget/function/f_hid.c               | 194 +++++++++++++---------
 drivers/usb/gadget/function/u_hid.h               |   9 +-
 3 files changed, 143 insertions(+), 78 deletions(-)

