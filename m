Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363422;
	b=Kq+GFoHev39LRdHsHuzdU4QTgtWCjjPBrg9g/NvlzHV5H8egzt1y2p22tRg4ld5dydZc
	 FbSNxUQUwyKdR7u1iYdZ7aTRG1a+KS0XvImUh/eLOPtJ2kI2GLhHH4FsugkvPSYuPe7Si
	 N9RGpnQMYz7oJs7GYOxNw8Bo4TS8Jg5CNYHecYb8NOdYcjwms/P1QW3nXQGjEpOnySreg
	 PGuWwRJwfjlY56blVgik2NoRUjHDv86XHSjOzMuSGlEF6SeLHVOd2ZEOLiUUjr5Fl3vtR
	 jKf0cXenPjjxV2VlDztSjy+ixDUPnI9o3UbPLYotfnH2+m3LBIPmpYdVj9yge+jnEjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363422;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f5cVNylaFfjtu1R/qkyAz8KkF/Z2FfUM2VSWawwc4C8=;
	b=RO6L+CECpLDdV6oZdv0/4heH3pdMmmreskeeAGKMH/lW++NqrpKa6UqFzAPFKHGp93uj
	 /XQWP4zjt3wvXBlYTzNgAnubB09BhMKiOrcre9nMa6uOikGc7qHROrRDcGqFXXKV1ChvW
	 wQYR2xpKZINhpriyqkY7VBOJ0sa2qpTBgPrVbaEPc0lb8lBbSf8s8TEnfNu3tHI4NV2PR
	 UX7PijSL7cG+vUvWcVJ5MPAnDZ6Qwc1W0//RVo/spY34qn+vyQkuarCpm3F2JBsGuWKTD
	 JKj7Tq8NC6+VGSPUWUulAA9L0miacDYAf25SWLPXy7RKHeSQxvusJ2rTiA3+ineLq6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="SD/Si7+t";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00877606A321;
	Wed, 11 Nov 2026 02:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00877606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SD/Si7+t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=SD/Si7+tQZVErnbe6BtcF4mx0rzCH3AkG8I7fWwo4pH4PNz8OmatC7Rd9o5pGE9d4h/NFAh/Avusu
	 jyyVRTZ/u/q+2DSQetjJ6kYcKUDNGGXunUJhHpA4YR5zcj2HE56EfTcOr1L2RPnO2G53L30rj3mXfk
	 3lY3tFQBpOtOPADM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af3d018caa-72b1f;
	Wed, 11 Nov 2026 10:16:57 +0800 (CST)
X-RM-TRANSID:2ee46af3d018caa-72b1f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af3d01737a-ca708;
	Wed, 11 Nov 2026 10:16:57 +0800 (CST)
X-RM-TRANSID:2ee56af3d01737a-ca708
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: gadget: f_hid: three GET_REPORT fixes
Date: Wed, 11 Nov 2026 02:16:52 +0000
Message-ID: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
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

Cover-letter:

Hi Greg,

I found these three bugs while looking into the Sashiko AI review
report of a patch series of mine that touched f_hid.c [1]: it
flagged a data race in the GET_REPORT userspace ioctl code, and
digging into it revealed two more issues in the same feature
(a139c98f760e, v6.11):

  1. sleep-in-atomic-context: the second copy_from_user() in
     f_hidg_get_report() runs under spin_lock_irqsave(); a page
     fault on the user buffer deadlocks the scheduler.

  2. memory leak: report_list entries allocated by the ioctl are
     never freed in hidg_release().

  3. data race: the GET_REPORT response is served by pointing
     get_req->buf directly at a report_list entry's data; the
     request completes asynchronously after the spinlock is
     dropped, so a concurrent ioctl updating the same entry
     corrupts the data on the wire (a torn write).

All three were introduced by the same commit and are fixable
deterministically from the code.  The series is on top of v7.4-rc1
and applies cleanly to usb.git testing.

[1] Sashiko review: https://sashiko.dev/ (patchset 20261110064105.20335-1)

Shunbo Shi (3):
  usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
  usb: gadget: f_hid: fix report_list entries leak
  usb: gadget: f_hid: fix race between userspace report update and
  GET_REPORT response

 drivers/usb/gadget/function/f_hid.c | 42 ++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

--
2.53.0


