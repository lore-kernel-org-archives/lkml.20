Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868923;
	b=5tkeU6gScB6ZelFWFugV6sAgiRRAyMUEKBcoN61TeDcRC7ZNE2XzCMbSeagjDcvSVAJp
	 UjcVHYYYV6DBY8V7tqy/401+X/9QXWkVgWi/5f+0SYOHyYdaJOR3slPPtdCzVZvFXWraI
	 H0FA2zUEcDSKKPiqMnIpuR+fO2d4FCuiAylnPWFAkQPCIp1vWp7CTPitKEScBR9KuLD8R
	 DHfWNYl0h6LDf1g0lVQ7YgJizCopXD0IWv2OZraFu35Ww5Uax00JR5k7yYd5DjS+AuuFj
	 L9bi8wdv4c2lhNNCWNXSxSwjRHqFbJgwAYVqdJstY0vnqzf8w5svQGTj/DHsZiEYv/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
	b=ypzqnPN+BeoR/uaV2mkfT8GG/a7Ft4JijFeLEBc3Houl4pDFuSvyzFhwAH0r1HGC4REM
	 GvPdXJfKXihz4WNDfXlYb8dnjVlxL+43DfLO7vOHW9HVi/sABc8igUQk/UN0bm1r9KSeZ
	 6j8uL7dUowDj/G+1Dr8r4FvrfmRousrluwUjenibKGSUVS0C2r4mgQ8OJMhqo0PY3pvV/
	 UaeK5R7iePN0C1T+fCNqOhleX3YvICQg8AMalv1YlVU3U6xfqQJLnHTvW0Yzp4ofsPdIc
	 tpCIKNPaB0ww20h5qnduOG5aX0J52kI8OIoYds2+hhtmA3kYzlBMSDyzPXUPbkuANxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ps30KaC4;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36ED606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ps30KaC4
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a595487d43so13487471fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792868921; x=1793473721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
        b=ps30KaC4LcxN0pKtqOCXqtxdBEtVN+LYEc7sesWnBq0HahPnvdICoess/QzilKIaWQ
         kv/W2KKI9XeUEtnjm/QUpi843Cle5p5Z2IHNIbofhXz9HP9WYFiJ1cDDSRneQ/mNhPfQ
         GMa0BFA41d/aArBsJhdmFv+n5yMLKi5aIFZJuNuiWK5JUcejZW30YvevTt3R6aQQah36
         X4m8frfpsLK4QyjQe3ewstWfTPf722Kx0vofkJRx1IfEVYB6ym2wRUP7hfdfoOeqeOOQ
         Cxk5rQj3Rfy516yqU56pPDlvWR+wMx6vhiGOSkr7uWGS1JwrCpLvhT9W3UE+bYYJUS5B
         5QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792868921; x=1793473721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
        b=IznZf4bWxICBRCtq9kmp92xPN+HCbj4pVJcXpxh09Mp5hzjK5vLDLI3xlk/+DN+0qe
         Hfxl4+Kj9dpkYBQu6IlYtl82qBb//wXpFvf9uVyTJsvWF1RRajvFxFzoSHnAUfytdvYA
         yI4d8Bxht4BZ3qRCozsCLCl9//0/DJd91xclXZdhqKEnFkpIVGefTUFBEU++9ueBwdlA
         JSUTX1v4/Q6t/kde2oZkHDZ5cSoWSL4+nrbFlNY24LlXAnZcTqEmZQ7yFIrGSN/QMD7/
         b4HLfPBox8qZTAw66fS1xGbZiPN7KM5WcReVwzyiOkWjZbwMRudyOcG4TxPDUJ+9zJ2W
         pK+g==
X-Forwarded-Encrypted: i=1; AKwUvByNnDqloilxmM37mvy4vtLLOSgE6e94w5nJ3aT3i5cq0n9DMBlLFP5bXDydY/CiviBQUUBvc6g/FuJ+qZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM03xzGxIrQvxQuAFyp4GQ1kwTllzNVaRvZKYlYHNBm1B31TSB
	ypPec7xP34TryYA4VZtO6b00gy1x/Fi1d7YqFKZYs3dpClGWGamB5NJT
X-Gm-Gg: AYBFou15UUV9p3SwbNrDy4uXwys9EL3+UCyHPg9lz8w9W/YxR62kxYQNRXSw3G08Krs
	pYLLEVwMUkQDd1cPV2kZQ/hbjHwIbJk8AO7z+1DBKdMbkBJNUOKXDXcucaz8TO7UHSeyOiLPKQ5
	SYylWRUiXqWHgEAqQPJLaN/qm8m/OzFxzIki8dfQfEUruJc5BlkxRg87kFATPzLJ6N/hREIf0lt
	Kyhomy/TR4BC2BOznQ1WSlbViVy6J8NjxCRooWDIa1IlBy8GNgjTINKL4WX7U3eKmeaE1julmPW
	3ol5tD7tkBn02MrE1cnawm8hg6VB/FpENi58GRDFj8oGwy8fG9WOs2Sf97SIwoAdN2lb6NoAJ5Z
	4lypHuFdoiRGJkQI+EkAUVp7OFYNKhBef8VtpcQCbTGurWA5qGotrlAxubmlr52hsywFleylWzx
	KRQ0qg8zOefmsBz71pJgy/weDSL4qTcBHsWo7zNzwZVbJqNcE2ONUKAtxXLvFv7XfWe7pRFKybx
	kXSC4HFRInk/nV9Quq2lbaYQaCdEVpwRP7SfCZkQ6+95RZGiiR1XQAh+/1PNZ18/TbRu3xJ7EQZ
	Qn13CsRHmh+gWc1yLFUhv8yBPek77vVgvb8XuVkC08LVsYYOZTP5gAKwM4v3
X-Received: by 2002:a2e:bc05:0:b0:3aa:f72e:8ef5 with SMTP id 38308e7fff4ca-3ac6fd3cdacmr7038501fa.19.1792868920702;
        Sat, 24 Oct 2026 12:08:40 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993dddsm5764931fa.7.2026.10.24.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 12:08:40 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2] usb: raw-gadget: fix double-free race during UDC unbind and rebind
Date: Sat, 24 Oct 2026 22:07:58 +0300
Message-ID: <20261024190758.2526-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024183727.42339-1-igorpetindev@gmail.com>
References: <20261024183727.42339-1-igorpetindev@gmail.com>
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

raw-gadget defers endpoint disabling, request freeing, and descriptor
cleanup to dev_free(). However, dev_free() is only called after
dev->count drops to zero in raw_release(), which happens after
usb_gadget_unregister_driver() has already returned.

Once usb_gadget_unregister_driver() finishes, the UDC can be immediately
rebound by another raw_gadget instance. If that new instance enables an
endpoint, it assigns its newly allocated descriptor to ep->ep->desc on
the shared UDC endpoint. When dev_free() from the old instance runs
concurrently, it calls usb_ep_disable() and frees dev->eps[i].ep->desc,
which now belongs to the new instance. The new instance's usb_ep_enable()
subsequently fails with -ESHUTDOWN, and its error path frees the descriptor
again, causing a KASAN double-free.

Tear down active endpoints and requests synchronously in gadget_unbind()
before the UDC can be bound again. Keep the descriptor pointer inside
struct raw_ep and clear ep->ep->desc on error and disable paths so no
dangling pointers are left on the UDC endpoints.

Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b7534c9b380f81a3b4be
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v1 -> v2:
- Keep ep0 request handling in dev_free() to avoid any lock recursion.
- Synchronously disable and clean up active endpoints in gadget_unbind()
  to prevent use after UDC unbind.
- Update endpoint cleanup in dev_free() to free raw_ep->desc.
---
---
 drivers/usb/gadget/legacy/raw_gadget.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..a6b42679acc7 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -141,6 +141,7 @@ struct raw_ep {
 	enum ep_state		state;
 	struct usb_ep		*ep;
 	u8			addr;
+	struct usb_endpoint_descriptor *desc;
 	struct usb_request	*req;
 	bool			urb_queued;
 	bool			disabling;
@@ -223,7 +224,9 @@ static void dev_free(struct kref *kref)
 			continue;
 		usb_ep_disable(dev->eps[i].ep);
 		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-		kfree(dev->eps[i].ep->desc);
+		kfree(dev->eps[i].desc);
+		dev->eps[i].desc = NULL;
+		dev->eps[i].ep->desc = NULL;
 		dev->eps[i].state = STATE_EP_DISABLED;
 	}
 	kfree(dev);
@@ -328,6 +331,20 @@ static int gadget_bind(struct usb_gadget *gadget,
 static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
+	int i;
+
+	if (dev) {
+		for (i = 0; i < dev->eps_num; i++) {
+			if (dev->eps[i].state == STATE_EP_DISABLED)
+				continue;
+			usb_ep_disable(dev->eps[i].ep);
+			usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
+			kfree(dev->eps[i].desc);
+			dev->eps[i].desc = NULL;
+			dev->eps[i].ep->desc = NULL;
+			dev->eps[i].state = STATE_EP_DISABLED;
+		}
+	}
 
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
@@ -886,6 +903,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 		if (ret < 0) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_enable returned %d\n", ret);
+			ep->ep->desc = NULL;
 			goto out_free;
 		}
 		ep->req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
@@ -893,10 +911,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_alloc_request failed\n");
 			usb_ep_disable(ep->ep);
+			ep->ep->desc = NULL;
 			ret = -ENOMEM;
 			goto out_free;
 		}
 		ep->state = STATE_EP_ENABLED;
+		ep->desc = desc;
 		ep->ep->driver_data = ep;
 		ret = i;
 		goto out_unlock;
@@ -962,7 +982,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	kfree(dev->eps[i].ep->desc);
+	kfree(dev->eps[i].desc);
+	dev->eps[i].desc = NULL;
+	dev->eps[i].ep->desc = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
 	dev->eps[i].disabling = false;
 
@@ -1010,7 +1032,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
+	if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
 		dev_dbg(&dev->gadget->dev,
 				"fail, can't halt/wedge ISO endpoint\n");
 		ret = -EINVAL;
@@ -1096,7 +1118,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
-	if (in != usb_endpoint_dir_in(ep->ep->desc)) {
+	if (in != usb_endpoint_dir_in(ep->desc)) {
 		dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
 		ret = -EINVAL;
 		goto out_unlock;
-- 
2.47.3

