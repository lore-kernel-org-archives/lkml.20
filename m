Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49BA522699
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763636; cv=none; b=eod3i+uxlOQ9jzqRrVqb8QFtzoNLoVpYLqn6lgD/Dft21/Oou06YhKCjWt0UA4tOvwkPTud+Z/IMmLRcBcJgg0eyLiT0l45ztdsFJZ8u4gbnci07GyeFEGgeyuDAafEO0/UrCM80h16ygG2xUwUEcAQoonOORL0uDhtSF1RAGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763636; c=relaxed/simple;
	bh=nyQjs6qGtq5QNA/EbyRHoqdZ70kqIUrdwHJqjIjPaf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QtJMmwFV3qxXK+v7id1OtnF1x4XeqgaiWz+I0e32wpQE9vT1tZ/6BhvHWxITy8ADZcr37BfMtLqW0Vf6Lj34eNXB0wdUGlGD8MAT2eI/5oBT6q9k+pq58EJ5bRV9voC/2ljE3mp83lDySpC1dgooOLC6ooRilIkGhgfW8jrrxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBx4w/Wz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBx4w/Wz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so806043f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789763633; x=1790368433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAJIejnvtde5v61mIPnWt2m5isbDctpD+89Zywxo9UU=;
        b=LBx4w/WzX+sUzZKqAJBEizN7vza/Hy7kkZcV3Jd5Nmde2RojpD8AY79MHUTGQ7Kh9+
         OSbfeFxJ/OMkuG1Tj6i3b4HoIV2m3KRWcMqm6B90hFrkBzkQgdw22EzXftpYR+7q72wl
         5fL0brWTRjcWLzjbXujqd/lYlo4b4WVAQvwzCni/c7DuJnEkSwLFanIYjbOLVo8fHQLe
         udTl4WUrfW9Pf62Nzrmdz0wGyFXgaeqMUh3kCOW1FQM+cqGk64QvirGrfdup9pxvxL3U
         PoNJMLrdNVxjIFqngRRVu9vES3qjH6hCKU2RaxWf3zzr1yWYehfSv3lwaLIeu+4UDjhJ
         zKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763633; x=1790368433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAJIejnvtde5v61mIPnWt2m5isbDctpD+89Zywxo9UU=;
        b=JcH83fTaDB0lhMUEKZbU+GJf0oHWcZ4UnYtIcHPaFMfDB3dRT/ntSjGWEfAxneWIUM
         9H8PCeqqfvW7bAsL5BT0HJ2g/ZY+9wn+CnpFLFeJfytY9U4X8pxNUdLvLbLMz55CSHcx
         OQegVeACTlokJfMYUwOvFBvbHF2PywxIhWqiFuWL1GMmhBU+IY2aZnRHXNv+Dk9aNcCl
         zGFXzjMxU2cTRxFLpi2VAh9+p5lxxUaN4zbqaKQV/0XsTObukeWyYJKxabf77eLKHE7y
         zx7iMkbkKTQHeR0fRcHdFVwjp4GEMGOLzycxEDLuyYD5wHMkup4rIOWA+EVt4sSIaFep
         MLOg==
X-Forwarded-Encrypted: i=1; AKwUvBw+5/UJaQmmXyf86Hr871doer3bAJwj7tw+5Xy6DGL4vbQPfLu88VSChgTyRBMwjetDUQM1nFEc26lu7os=@vger.kernel.org
X-Gm-Message-State: AFuF++mYH5CNvYx7E+PkF2WwdJU+2R1BVdRxkzgWXtPXfAn4BQkkUjM6
	Y37XK6FHse3s1YPaDb/xTGXdjnGeaKd2e1iDVhKQ91gzbSZWp/fzef1g
X-Gm-Gg: AYBFou1cHcvFEORSiLmF3QiFnCqUTTxkgGSASJ18OlrfvmvQ0NpgyK7LJlyA8jhlvl+
	bZo/8tY/KggEPPrv4jCWyn16bM7JuIJqf1IDTY/6hWBHwX0zoK4bQWzUSlz9qsM2RE9W6okJ9vz
	jgY5CHFXmX0/lLvuWNK0AP6hvZAdbpomuO4f6M+HxN/AWedvfpavkFg57tCJ8YNaCMg+koDupZU
	ZJrjmz+hW+eAMW2lpYxfSExAWvHx9pJHcm5J+3+zYhjIur87QLT8ThY9H1elaJ6wzmbJOZzQvsF
	wDvbNhPDU/RaZQ/cawORK2ElHV7ugyNrhEsFOOAi13lNrIjHuzqUh5QeivsEl8qEp4L/XSWGxiJ
	vO7Lgj6YgOHMM6vkGr0FBdEoRxHS4CCylpGGXjX/rFmjUJfSFRlM+RmtzOwNmKrNsoODpx7vjd+
	Cf1J+rn40/5pE7BfDm1w6X5WNaUIU5FGZpS0Tn1eDs+pDLUa8d2RjQ3WVykwt3IAfkNHMi1kdDG
	ONzi5nwLg80xmuMEy7B8J6qP6Qlb44bghkZaLo6mN10nwqFyCSbSEzHYPEPKzyZ8on4
X-Received: by 2002:a05:6000:4021:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-4871e3941f5mr9789385f8f.28.1789763632871;
        Fri, 18 Sep 2026 13:33:52 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm1239936f8f.8.2026.09.18.13.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:33:52 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+3caf6a60e5f9be12de08@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: ttusb-budget: check the endpoints before using them
Date: Fri, 18 Sep 2026 21:33:46 +0100
Message-Id: <20260918203350.48218-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ttusb_setup_interfaces() decides on the endpoint numbers and their
transfer types up front and never looks at what the device actually
offered:

	usb_set_interface(ttusb->dev, 1, 1);

	ttusb->bulk_out_pipe = usb_sndbulkpipe(ttusb->dev, 1);
	ttusb->bulk_in_pipe = usb_rcvbulkpipe(ttusb->dev, 1);
	ttusb->isoc_in_pipe = usb_rcvisocpipe(ttusb->dev, 2);

Give it a descriptor where endpoint 2 is an interrupt endpoint and it
still builds an isochronous pipe for it. ttusb_start_iso_xfer() later
submits an URB on that pipe with URB_ISO_ASAP set, and usb_submit_urb()
notices:

  usb 1-1: BOGUS urb xfer, pipe 0 != type 1
  usb 1-1: BOGUS urb flags, 202 --> 200
  WARNING: drivers/usb/core/urb.c:532 at usb_submit_urb+0x863/0x1870
   ttusb_start_feed+0x819/0xc20
   dmx_ts_feed_start_filtering+0xf6/0x220
   dvb_dmxdev_start_feed+0x27c/0x400
   dvb_dmxdev_filter_start+0x1b9/0xe10
   dvb_demux_do_ioctl+0xadd/0x13d0

The URB is refused, so nothing is transferred, but the warning alone is
enough to take down a machine running panic_on_warn, and attaching a USB
device is not a privileged operation.

So check first: usb_check_bulk_endpoints() covers the two bulk ones, and
since there is no isochronous equivalent the altsetting is walked here
to find the isochronous IN endpoint. Bail out with -ENODEV if either is
missing. This has to happen after usb_set_interface(), as the endpoints
we care about are in altsetting 1.

ttusb_probe() was throwing the return value away, so it needs to start
checking it too, otherwise none of the above makes any difference.

Reported-by: syzbot+3caf6a60e5f9be12de08@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3caf6a60e5f9be12de08
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 7a4d28cc3242..9d6e0dfecf56 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -915,7 +915,42 @@ static int ttusb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 static int ttusb_setup_interfaces(struct ttusb *ttusb)
 {
-	usb_set_interface(ttusb->dev, 1, 1);
+	static const u8 bulk_ep_addrs[] = { 0x01, 0x81, 0 };
+	struct usb_host_interface *alt;
+	struct usb_interface *intf;
+	bool have_isoc_in = false;
+	int i, ret;
+
+	ret = usb_set_interface(ttusb->dev, 1, 1);
+	if (ret < 0)
+		return ret;
+
+	intf = usb_ifnum_to_if(ttusb->dev, 1);
+	if (!intf)
+		return -ENODEV;
+
+	/*
+	 * The pipes below hardcode endpoint numbers and transfer types, so
+	 * make sure the device actually has what we are about to assume it
+	 * has. Otherwise an isochronous URB ends up aimed at, say, an
+	 * interrupt endpoint and usb_submit_urb() WARNs about it.
+	 */
+	if (!usb_check_bulk_endpoints(intf, bulk_ep_addrs))
+		return -ENODEV;
+
+	/* no usb_check_isoc_endpoints() to call, so look for it by hand */
+	alt = intf->cur_altsetting;
+	for (i = 0; i < alt->desc.bNumEndpoints; i++) {
+		struct usb_endpoint_descriptor *desc = &alt->endpoint[i].desc;
+
+		if (usb_endpoint_is_isoc_in(desc) &&
+		    usb_endpoint_num(desc) == 2) {
+			have_isoc_in = true;
+			break;
+		}
+	}
+	if (!have_isoc_in)
+		return -ENODEV;
 
 	ttusb->bulk_out_pipe = usb_sndbulkpipe(ttusb->dev, 1);
 	ttusb->bulk_in_pipe = usb_rcvbulkpipe(ttusb->dev, 1);
@@ -1618,7 +1653,13 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	mutex_init(&ttusb->semusb);
 
-	ttusb_setup_interfaces(ttusb);
+	result = ttusb_setup_interfaces(ttusb);
+	if (result < 0) {
+		dprintk("ttusb_setup_interfaces - failed\n");
+		mutex_unlock(&ttusb->semi2c);
+		kfree(ttusb);
+		return result;
+	}
 
 	result = ttusb_alloc_iso_urbs(ttusb);
 	if (result < 0) {
-- 
2.34.1

