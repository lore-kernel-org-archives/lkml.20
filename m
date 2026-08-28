Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA03BFE2A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944258; cv=none; b=oGSh9suKeh0mAxqIFzBtpRIz+n9mkSzfK18bQknfmfojWCeS0wZCLvcfWx77mKwsTmRXbkT3Ccj16C/7YQBowEbO9/STI7d1uakLVx3YBCnvGVqgEXRi5mAkwdGPQBE0WCrjCMYV8ulkm5Jb2f0QCg5HN0tlohMyvKRMm3dp8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944258; c=relaxed/simple;
	bh=36nLVAjVnyXQ9NM1V1+VNywtVenoPVkoSYIpnXSwhjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7vno4DND0rN0mHFBn3gjgEbHNvAmOQb2z6NHk3pxL5tThYUyv5ywbNRsazlbRWnw2DDfwyGBN3Dzv0u2pA0WDkjdFZIN9E/STTBQkq8Yuitii3+bDV1ggRIQTkFgbKJQnShiP9hbQRU5fLS4wP+LFmzwFsF4DgSXcft8LymNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOubuykF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOubuykF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so12994695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787944254; x=1788549054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoUMcMxZ4jSXfVyBbNxTOmQ0cjlOeDjZWBJ+hZQ/vkM=;
        b=KOubuykFkd/Zm10i9hogf8FcNAJnnLoy2MEc4DWGfjmPO+8lhatipPJOMJIW3+iTcf
         AvFim3g0WPe+sFbPouMhjh9VvWPx35rtQ5MVkZua442Ci9D3XJ0auOJoGlt5j4eG9Esm
         aGbKctCOhTe+Iaba8d4koR+J3GB0/sIEDqFo5xU+OwZOh73Z8YoXGY+zTbv/edq0aR96
         1D7hv2VvTGyoOlN6mJ4R32Fk4xfYHQooHhaqGCIaH5Ch3YoK3HynfLh8FWTeUWIpCqSq
         IBUFnVjK8jf9e1WwjrhOeOGXAUgKVjz1QzP6JsvdGa87IXbtuwZrM+5S6bm5W2OK8Ly3
         d1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944254; x=1788549054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoUMcMxZ4jSXfVyBbNxTOmQ0cjlOeDjZWBJ+hZQ/vkM=;
        b=YBx8ByXDienHPB2Fx7Krq2GmZSSLAgYw1smgDEpqpBOAvwAU3AEyLa6hU2iwoOUvPq
         j2SJ8StlrAOp++mSrfyaBkC5/jq090hxG4dm4h8U8DY7KErivkn+XQYftjBHKq228+Oh
         aFPOhqr4fgXSgNe1ASR4//I59EUZRv9QCF6wffluSdDyTXeEAiOgIJRHPM0tl8csgFSZ
         CRdP6c1HqRzcn/Glxgi9X+1cSytfH6aB5jIkM5T4l7mu4CyEO0goAzj6ZW+GHhLQJOxx
         +IVkPHt7Po+HR/V3fP0VngEC5EOZWK3Uv486ivz/IkJ5PvUwCVnVyP8zAyymczVDT/2I
         084w==
X-Forwarded-Encrypted: i=1; AHgh+Rr0nCaq7JzM7f/BNnsRpWUG5GOEfZllJIFQvF8TDCYfIU7pJrKsGDyR9+r8L1HqecQ6KI9muVMNDXqNf9g=@vger.kernel.org
X-Gm-Message-State: AFuF++ljIXiScmYwlBtaDGzr68QfA34yUxXSHODY0Nc2bpgGVTO5OHsk
	JxkKP+5qg6JfxgTao7uzJOnQbsTCqSsJCpjDvWprzohlxaEYTTdgq2zQ
X-Gm-Gg: AR+sD10tXvbLgeX1mwsu5WHrUvD53ENp7cACNz/uJTfHRTM+1S3eyUTdKNkAPMUjBt2
	KLo+q37nzSePuxEFy1MWYhS+1/pbVA8SJkNp1vU3yCuXfy3H3leDJMqM+KzJ7aeynId6tTXevPc
	1lDYtWsCLEVoc1rZg6FsXg0Jp5qgQfY9mKQrkcW9Rb7ktCKA2zIMFi+cGr8KYp8xrKZhqrz4Hzp
	ek2S/xxIia7UVDU/ElHuf48KH8CuH80uMb832WxjkqQGzgqucbh23YZ3wjl0ix+o08BI85e1900
	ZbX/ioY1BYD/YvARIfAACH9zhWICdPsqd9H/FrmO27AGnh1jjGa5mpU15RRarJyRIMds+ANhnN4
	5B60/0okqxrAqpMe0eqtnzo712oCD5qDYDdCosjAttDkrrnw9ZsrjDbfVzr9p790mCWYxcLyJxu
	6HQcJTFsQ9dez7J+P3n0hm4dQSpJNMR8TvpgfynlBQH/BK1zKXqh2KHCcfarH7HMdeiB/iVxaYd
	Aw1
X-Received: by 2002:a05:600c:c493:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49b91c20914mr137793525e9.3.1787944253452;
        Fri, 28 Aug 2026 12:10:53 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm165049015e9.6.2026.08.28.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:10:52 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v3] wifi: rtw88: usb: route bmc frames via the high queue only for DTIM delivery
Date: Fri, 28 Aug 2026 21:10:51 +0200
Message-ID: <20260828191051.178481-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814053426.2473247-1-mehmet.fide@gmail.com>
References: <20260814053426.2473247-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke, Bitterblue,

thanks for the ack on this one. It has not been applied yet, and before
I post anything on top of it I would like your opinion, because I now
have a case where the same lockup comes back with this patch in place.

What happens
============

The patch made the after-DTIM routing conditional, but nothing bounds
that path. mac80211 sets IEEE80211_TX_CTL_SEND_AFTER_DTIM on every bmc
frame while a single station is dozing, so one client in power save is
enough to put all broadcast and multicast traffic back on the high
queue. The chip drains that queue at beacon pace while the frames
occupy the shared TX page pool, so ordinary chatter such as mDNS
exhausts the pool and with it every other transmit, including the auth
and assoc responses other clients need. The AP still beacons and looks
alive, but nothing can join until the device is rebooted. That is what
our field report looked like.

Measured on an AM62 based AP with an RTL8822BU, one associated client
in power save, and 40 broadcast frames per second generated on the AP
itself. Free page count at 0x240:

  t=0     1803
  t=30s   1148
  t=60s    716
  t=90s     16   <- 0.9 % left
  ...       16   pinned for as long as the traffic runs

and at that point dmesg starts printing "error beacon valid" and
"failed to download drv rsvd page". When the client wakes or the
traffic stops the pool recovers; in the field both conditions persist,
so the AP stays dead.

How to reproduce
================

  - any rtw88 USB device as an AP, one client associated
  - put the client into power save (a phone with the screen off will
    do; on Windows set "Wireless Adapter Settings -> Power Saving Mode"
    to maximum and reconnect)
  - from the AP itself send roughly 40 multicast or broadcast packets
    per second, for example in a loop:
      socat -u - UDP4-DATAGRAM:224.0.0.251:5353,ttl=1
  - watch the free page count:
      echo "0x240 4" > /sys/kernel/debug/ieee80211/phyX/rtw88/read_reg
      cat /sys/kernel/debug/ieee80211/phyX/rtw88/read_reg

Do not ping the client while watching. That wakes it, mac80211 flushes
the queue and the pool recovers, which is what hid the problem from me
in the first run.

What I would like to do
=======================

Mirror the vendor driver. It never lets chatter into the hardware high
queue: xmitframe_hiq_filter() in core/rtw_xmit.c admits only ARP, EAPOL
and DHCP (CONFIG_RTW_HIQ_FILTER, default "allow special"), everything
else leaves on its access category queue. With the same rule in rtw88
the pool stays at 1803 in the test above, a DHCP flood still takes the
after-DTIM path, so the filter is selective rather than a blanket
disable, and plain join/ping cycling without power save is unchanged
(10/10 here).

The trade-off is that a dozing station can miss non-special multicast,
since we do not buffer it in software the way the vendor does.

Before I post a patch:

  1. Is such a filter acceptable as the fix, or would you rather see a
     hard bound on how many bmc frames may sit on the high queue, which
     would also cover an ARP or DHCP broadcast storm?

  2. Or both, filter first and bound on top?

  3. Is there a way to learn the DTIM boundary on USB that I have
     missed? With one the driver could hand the chip a single burst per
     DTIM and the pool could not run dry at all.

The patch is ready in either shape and I can post it as soon as you
tell me which one you prefer.

Thanks,
Mehmet
