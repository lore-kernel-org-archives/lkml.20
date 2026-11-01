Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516821;
	b=Lq0mqnuV4KfqBSmsdyWV74ne9z1KlScH1rcyZD0tF5KyiHdcunC+A0UIShaYVZZkcGmH
	 mr/d4O31GRXkNr4NOjpMbVuclSuS0zoRUVvFCi8SEVu6d2aU4T74oPqjSfh5/qqQZoXH4
	 RlDsd/9i35pt3L765uvaCaPBknVzHlODfUbPLnrL88x1HQMDG5B4fqk5QU9Fkcp/vjNI0
	 gfGynqQOS8t+jj9c8XSa0BwwN+LM7KjivO8o3dj5sz6SFXtYHSg254eDuN2lcBbBOgHzg
	 SulgyaClv4R+2hriCE6lbdgIIdD4GaczBmbiog5UjZT2CoBMuIYtFWpIIUre34PJKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
	b=fYYiZuAueYET6DbcC25UzZdt6nn0foRipT2W/zde9MdDyqsF9Km1HJXplC81KJdYN6T/
	 /v403H2JpWFpBVt5O3Br7bJZTNy9DGO8Vz67rfILfQE7f3pUuxa59t5ASaeBNv1ay9lsg
	 AQqC4pFfNepTFg9l0QbodpX3omrp3kvI7U75m/+8ywckX2NaYUJ7l12eRuGPivfgIP5Fy
	 djrhjH+/Lc32y16BpoiUC77PSK6Ts7ZaeFAR86B6EGto1g50BMHFgFEjdv2R+nA7YFTdQ
	 vA3s4VYVaipz+K5MHuoERoL38YXyvnHQarLsAbuQ9A+A1WjW/iVO/GxkpbP2kLIeJLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrP3Z5c0;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A0606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8A0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrP3Z5c0
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2695696eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516820; x=1794121620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
        b=WrP3Z5c0WIDja8/FWc2pYZbtMRealbAkM4qt9EbzKfKVucEkvBTDGnalr9uCuCY3lk
         paNq8B9Ypp5XHuPTzr3Z+5NPI3msLEGzO6viDsh5+HNLuligNmwFeZuZFC+NrRu5fwYt
         OXBzNtQ/pqYdIKsWEb+vzpru3HkcVnpoP2Hi1e0mRzANd79H5+l2DUi16LTAli/MH8AS
         MJyqVzl+0BnYq37dxhkE0jM47LTtsbQMpO52KJpDwyIkW2p6hCJGbL5wMd2AXVs8iaxz
         JizN4nwgc7prvmXFnUhBr3ZV7PbO5lrQ15bXBcBHub8VAF22OxqYPEa5RW2ZPYazL+g/
         eWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516820; x=1794121620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
        b=dk2G+UAs952SjyDYRjQMr9uZucwI82FDKjY1cS6hw8+YNt4SVM4L+idyECDxMmevsg
         gv7y1vCCndkfBxZdac+22qV5jQKRhVfaYhNDhelp5fG+KDkawv6ddC3ZWbaTfEF1RiIR
         g5YulUFYF2L9HkFpVc2LQydsjKIGl+fTOfn7aNar0b44bMmxLDOlKMEZPP0F9CMq4T5C
         IJWfA5UCESgpq0waNgDrrPR0WOnmqwulex5o/MzVS7br2VMQYv3/nhLBk1PhWcp3qFFW
         pxAVeraHlxY3P/ePVugese7fa3f5epOtJ/KzJ/oGDviZDHh4Q4flCSClYZd4Ayb3bsNi
         KT7A==
X-Forwarded-Encrypted: i=1; AKwUvByu9HfQPjUR+5subdqiw4x2LRyrLi4B7HF+XsBwXZEhf9Snb5bv+4GOkwBXNsgL5kwN6j786HaPQVdsUFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ISZkzAuqRkk8VCeS0e24QACFiWiFE1uDNVMo76W2TwpwSNigi
	JKp97Jnk8n5nWpvMtyT62WHyju+Q1VLxSWH2r4DACR/O7i6XM4O+U0w2
X-Gm-Gg: AYBFou0VMNvVmQLh0Jtsav+skPBf7qHmcLt2DdIyZqRgMrSYTDtefUpUkTgUFCPRpVE
	tRUJYRZIEJyuIeFAkqgqJJsRbitS5jpAW+8LsTM+3BfJdSLK2xMN60+f/IvR3fGsjJRw3CoMl2l
	0Z2AxkmSsngeELeHTfkshZORwXe4Uu+1PUz0sCYoMwickiQByIrJq8RpFp4shDdNFRO0RpDmrsk
	fIQk+eyLJrA5vPUf3zQXNhkqZe+MeHxeku3IxQdcCgkRvwkfsj40VTxw5TRI0N/WTSWjKYIUi1s
	XUehEvzA7suJR1KUvW3wsmYyGNrp4+/2kak64gtlVm1Tt/i1fQxcs+t5hv8LVg9HYZoEmS/IbPH
	ZnNks3+O/e5a4Ji9vy1B/pFs+yC+myC6y8BqV5nuXZ0xYiBBXKaAY+PQ9M7Bp/4GjEPObHMj/98
	sNwxapgKPdu8z68mNamzke+RfifrGBZj9RzjfwMwo6kuk+ZnBkKqnGZPPQ94jkJ413cyAP5/Wj9
	XrHs+OXSr4OzAfvjUhGmaMrhpjNKcyUeR4dVLZSO0Pkwi/gsB1Jw+/3kGALN3z8e1ChWG+XY7b5
	SPKG4wPStwFCTPXzb+3uDB7zQANMkdrLokUCRc+0k7XMilbyu6WGQd68O0tuvO+/h98C
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15750922eec.22.1793516820039;
        Sun, 01 Nov 2026 00:07:00 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm25922591eec.3.2026.11.01.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:06:59 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Sung Byeongchan <tjdqudcks0424@naver.com>,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH v2] usb: usbfs: clamp actual_length to transfer_buffer_length
Date: Sun,  1 Nov 2026 00:06:51 -0700
Message-Id: <20261101070651.1846947-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

usbfs uses urb->actual_length from the host controller driver without
checking it against the buffer it allocated. For a completed
non-isochronous IN URB, processcompl() and processcompl_compat() copy
that many bytes to userspace and report the same value, and
async_completed() passes it to snoop_urb_data() when usbfs_snoop is
enabled.

With USB/IP, the value comes from the remote peer. If the peer returns
actual_length=88 for a 24-byte control-IN transfer, usbip_recv_xbuff()
rejects the length, but VHCI still gives back the URB with -EPROTO and
actual_length=88. usbfs copies data from failed URBs too, since they
can carry valid partial data, so reaping the URB reads past the buffer:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user
   copy_urb_data_to_user

With usbfs_snoop enabled, hex_dump_to_buffer() reads past the buffer
earlier, when the URB completes.

Clamp urb->actual_length in async_completed() while holding ps->lock,
before the completion is snooped or can be reaped. The copy, the
reported length and the snoop dump then stay within
transfer_buffer_length.

Tested on usb-linus e971f4f365ba with KASAN, using a synthetic USB/IP
peer that returns 88 bytes for a 24-byte control-IN transfer. Without
this change, reaping the URB hits the report above, and with
usbfs_snoop enabled the completion hits it in hex_dump_to_buffer().
With it, the URB is reaped with -EPROTO and actual_length=24 in both
cases. Full and short control-IN and control-OUT transfers through
usbfs still work.

Fixes: 0880aef49e40a ("USB: usbfs_snoop: add data logging back in")
Fixes: d4a4683ca054e ("USB: usbfs: only copy the actual data received")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Clamp urb->actual_length in async_completed() instead of only the
  copy length in copy_urb_data_to_user(), so the reported length and
  the snoop dump are bounded too, as pointed out in review [2].
- Fix the Fixes tags; v1 named a later scatter-gather refactor.
- Send separately. The USB/IP patch in v1 duplicates Sung Byeongchan's
  earlier submission [1], which covers only the VHCI receive-failure
  path, so usbfs still needs its own bound.

v1: https://lore.kernel.org/linux-usb/179328314074.648427.8187049654053191605@gmail.com/
[1]: https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/
[2]: https://lore.kernel.org/linux-usb/sashiko-outbox-189547@kernel.org/

 drivers/usb/core/devio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425..7319e8b98 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -633,6 +633,8 @@ static void async_completed(struct urb *urb)
 	spin_lock_irqsave(&ps->lock, flags);
 	list_move_tail(&as->asynclist, &ps->async_completed);
 	as->status = urb->status;
+	if (urb->actual_length > urb->transfer_buffer_length)
+		urb->actual_length = urb->transfer_buffer_length;
 	signr = as->signr;
 	if (signr) {
 		errno = as->status;

base-commit: e971f4f365bad51d01bc90db55b56fdb3124f963
-- 
2.34.1

