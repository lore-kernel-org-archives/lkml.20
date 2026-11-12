Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445776;
	b=KXZZ4FhECEk+QezopL1wrbmwZ1lf7y4y/iXXbbvEha0XrFJewpnyCN/s6tSMjRygapKq
	 Uvi6zxEkAKURz/1+X5LYuHkXyXK7td17J79yfYQQdfDIvUDQ7DKf9rOTOSWwKLNi8R214
	 bIcX4kzjbunJ6nMvqCTdbJJK45IIghvxpAsn8ZDP7QP3BvkLT3ooTMK3jM40t6WrC+ERp
	 tQ7SkyfC5rYb9v2UvJBGCe/EtMJyv9GOb/EYh4fYtqVwqYsbDCk/IPzED0QxZ3MDGeUT2
	 tRC5jGlHKbU2VKyl0QVXBZRWOBAfS+U8ibpXCd9J7vYbYZ/b1oY8Ru8IZ2ZGMI2Rdig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445776;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pf8HqYSPTYyKboxc4dL4PB/2t78zaL89AV/uuWWONAE=;
	b=qGH/PCOyx8hEQjMECFW1H8XNfaBkJF5uef6aGH6leeJi7hqNfI6OOJ+4miJSmut0Qn0U
	 EPif+JxgNGIKSy6yLEYfTOWi1c8uWc66YFQGu4v4EAkHTOBiuMbGjQzaZSokiYWqGRkOd
	 jBkWaGEnljQzL+zITpXXjWTUJLcW4Uus5bGBt0LUMMO9P9DlIavTnrlZedIWcbdkUrqkw
	 VwsPkq+u+963Y3M0rMXcMGI40zBuGckKjNBLWs+6KJOsQ/uv2B453lplNXg/N8Jcce13k
	 I8QSZU9c9lgiSU8/MdfqsHaiJ1cfnX1Ci+5SUomoJ9fRN0lj92IwrslY53AycPhOeKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=z9A+J2lR;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B790B606A324;
	Thu, 12 Nov 2026 01:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B790B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=z9A+J2lR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=z9A+J2lR6hO/Q+PROF5gSi9Z0BfHt7zllF8RamaBEdve6f2zNgeFP8v+n9srs4UWsibRzDgy1iJgH
	 LdUEsujSyzuhLJdzPSnXU7dKT0UvpezeHSLTXElS6wM/B+asV+FKNKzXSsHmxloi/J1silWRKTa4ri
	 ZGBnZLFBltu5MTqs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af511c9259-7b4b3;
	Thu, 12 Nov 2026 09:09:31 +0800 (CST)
X-RM-TRANSID:2ee86af511c9259-7b4b3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af511c8154-ec505;
	Thu, 12 Nov 2026 09:09:30 +0800 (CST)
X-RM-TRANSID:2eea6af511c8154-ec505
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] usb: gadget: f_hid: three GET_REPORT fixes
Date: Thu, 12 Nov 2026 01:09:24 +0000
Message-ID: <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
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

v3 of this series.  The only change from v2 is in patch 3: the
dedicated GET_REPORT response buffer is now allocated in
hidg_alloc() and freed in hidg_release() instead of being managed
across bind/unbind.  This eliminates the use-after-free window on
unbind that the Sashiko AI review found in v2 (the buffer can
no longer be freed while a request is still queued on ep0), and
it also removes the need for buffer cleanup on the bind() error
paths.  Patches 1, 2 and 4 are unchanged.

Original description:

While reviewing the f_hid GET_REPORT userspace ioctl feature
(a139c98f760e, v6.11) I found these bugs in it:

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

  4. memory leak: get_req is leaked when usb_gstrings_attach()
     fails in hidg_bind().

All four were introduced by the same commit and are fixable
deterministically from the code.

Shunbo Shi (4):
  usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
  usb: gadget: f_hid: fix report_list entries leak
  usb: gadget: f_hid: fix race between userspace report update and
  GET_REPORT response
  usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails

 drivers/usb/gadget/function/f_hid.c | 61 +++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 13 deletions(-)

--
2.53.0


