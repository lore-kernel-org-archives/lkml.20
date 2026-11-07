Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064740;
	b=IESf4gFahOUkVnnKb6sAHuh08A11oxc9lSVz1D8wjobY9Evlw+EDc5+7l/X8t8WArEPe
	 8yQzypQnyLisWPh23A/yEcJ3saq5BIhCbgENltTjBzpjYLz2TnsssH+HRI6ONjXQxviff
	 /FfUdibgIzj9l/F6Zp3w7PqmqsV+APjMNIuE4tj3qPe3L81hi9OelwM6KCsHDYGWp5jYX
	 w+7zSpgCM9g1+kk8Qfy8qK9YhdZY7sVVL5KZm0cfNpGzEctgFlrhwOmUqjCd1R0xmHIF7
	 8+bJtqHmAPFza75N6H8USrv7ibjZ//b4IjMzzpz0SMDDy4YUWUakJB9P0DGvdelyr7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
	b=q5MOUvhjjAeOCqGzog94qHyboSSRdkT430WRuV6Uf4XDwCsBk1FyuN3lOHPuVoF9CFsQ
	 Z5ZwAFMw0oFwv7P7hdpYpbfW01reZp9TWCtBaOrcOdyes8XyGuHug+SYlpJrKLRtx4wsA
	 CVR7S4Lk5xdi5wj7X9Z6o6PegtElTjCr5qpe1f5ExOVG1ccMpMyc9+XCNhdzuGD6UXRDv
	 l0HS/9dkB3LtdHu397Kw+yo7g6Ic5o8yjvS9F/+//0MsLgY+papSIkruVr95gnHfKT14+
	 nTU/2if0+KXa/HpfIVoVk5FSQxg7iPKEAuo6ASlKiqTtIh7AxLKTFgbtEQBMZ49LT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWbKXYbx;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE8606D81C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BE8606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWbKXYbx
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so132687eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064738; x=1794669538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
        b=TWbKXYbx7w/Wom34yDTrCrj66CgMASixb1QRY5kDrAsLcQ+8GeRlWZbp8QjFk2HMXr
         8xPcv5OfkRP5wOz7qON0ZaB1RVFi1MEInGfO/7IfI/7JctuED/yIOd/G2ft83jl9h42M
         VDx7pxhGLdebmulu9qy+mLr0C8dmbB3vvKhc9uKrjNP9XToGBkUYlOJ/gy0eaWp5Tl0h
         bNtJkwjUWsuUTOofmv5qnNYpn2fPy0SfabTHOY4alEGj16k5cMdABmT3dvuzZkvIpXhv
         55DdxZqMXdUwM0v1YTco9INseeLN1gfvEq8Y8TFC0zNYMt30qeghkT8Fq/xrprEf3Qeo
         1IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064738; x=1794669538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
        b=UqlwNSkoBMkLa+uXR1tX3tNGHuWNLvJTaUxacgclLNHMjqQQ8YKnL35I6PuPJTuCIW
         8qNCE738Ea8lwPq/FjMZbXK/vD27OyGYqzTQPLZW2yKkKt5TbhtKx7ixFXiwKZ8YDjap
         MEd2QxrWUA+NMkJPYN3nK8rT2MoLSE1cWYCl0hsLJsUMa4NfNTgtoDzGq2nAOmp/O5yp
         XRlV1aJ79caMtvyhl7ETk+xKuIJ4crA40lo451o/05o6O4Mi3N1XHeoiomIPwBQoYBzJ
         MjIhiaChw36/NNX1JDsme6G3+lO4acLd7Y/11vGqrDKLMkWJjvOlLbXlqKHEig5O1hHQ
         H7Jg==
X-Forwarded-Encrypted: i=1; AL+hErEixgWZvM+6qb8AVBoxhCU4EMu1Ag+RKscLmyhBWfOadXnAMw7gnY7TbSEnexytXVzgCjxAhDBezI42K3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yeeQpyDS5C/gzPmdBYNOoSCq+CpKFJGtJZ5zaVP0k19nLZYEa
	2WvFZAXM5UfYJHlnNvFLkfbAFrWyGtLtA41feWLgHphrhsaufpzFVWMu
X-Gm-Gg: AYBFou2uklymOOfgjslBp7i7H+ev2M3MG0oQSzgPFTwmYuMV97nsiYYTzhAtbVlg/oP
	ZhIhXoCZ+QPMaZp4UvM3KxFmgiuYDI3CxUYgToswFG0tuRTJHivPnQny+sr+Q+i1q5wXAe3Br0V
	+XwKgiNDazXS0Aerue82B9PnP2G7G+KjGEPR0RjjYm/lXoe6ZJFj9td+S2ltKFnPbkCloms/Ms4
	EEq0z6VsVJAT8FiSW8LrYjseg7EzmpBlIof+NcrmxzHxlD3eUoY/mUwBNZGnSHsQsqt4nZIfBw4
	bucoInbdk1iVUZQiPqcRHsARHwrh8EuifCTFOmSsS0Vy9XBAle992or/qLzUx+7mTsJZdj/6jYZ
	zwoqf0VP/5xAUVPLHPGENZbcaXuWrhPX3pwfcs/AQXDXWAGwypq8B5WRI5FErcMwLVbo/1VpfdP
	25vCb4VgsdCMtrRxSkvtktxeQ5nQQBSWQkdJt8TsWJiTA9aGT0Hr8s0XSFvwd8JOj1cCaaO+rnF
	GNzk6T9QJB5JNXV5Un/qAGp8lHi4iXYJmAeGqQVloYn+pdO8QVMuREEV/21YUE5p6V0y2Cr4R3e
	5aGOKx3/qwn+KXHTEEWnYn/PObRrGGII1iQzhu25kfksdfOb
X-Received: by 2002:a05:7300:dd05:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-36f76e0ff40mr8378888eec.34.1794064737923;
        Sat, 07 Nov 2026 07:18:57 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm22259736eec.10.2026.11.07.07.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:18:57 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free
Date: Sun,  8 Nov 2026 00:18:46 +0900
Message-ID: <20261107151847.3754846-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

sl811h_hub_control() arms sl811->timer (sl811h_timer) with mod_timer()
for port reset/resume timing; the timer callback dereferences the
hcd-private struct sl811 (sl811->ctrl1, sl811->lock, sl811->port1, and
register I/O via sl811).

sl811h_stop() deletes only the USB core's root-hub timer
(hcd->rh_timer); it never deletes sl811->timer, and nothing else does
either. struct sl811 lives in the HCD private area and is freed by
usb_put_hcd() after sl811h_remove() calls usb_remove_hcd(). If
sl811->timer is still pending when the controller is stopped and the HCD
is freed, sl811h_timer() runs against the freed struct sl811
(use-after-free).

Delete sl811->timer at the start of sl811h_stop(), next to the existing
hcd->rh_timer teardown and before port_power(sl811, 0) halts the
controller, so any pending sl811h_timer() is drained before the hardware
is halted and cannot re-enable it afterwards. usb_remove_hcd() has
already stopped root-hub activity before sl811h_stop() runs, so the timer
cannot be re-armed, and sl811h_timer() does not re-arm itself, so a
single timer_delete_sync() drains it.

Found by static analysis and code review; not tested on real hardware
(needs an SL811HS USB host controller).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: delete sl811->timer BEFORE port_power(sl811, 0) (top of sl811h_stop(),
    next to hcd->rh_timer) instead of after it, so a pending sl811h_timer()
    is drained before the controller is halted and cannot re-enable it in
    the window after the lock is dropped. Corrected the log: only
    sl811h_hub_control() arms sl811->timer (not the transfer scheduler).
    Both per Sashiko AI review.

 drivers/usb/host/sl811-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index b044977..b667732 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1516,6 +1516,7 @@ sl811h_stop(struct usb_hcd *hcd)
 	unsigned long	flags;
 
 	timer_delete_sync(&hcd->rh_timer);
+	timer_delete_sync(&sl811->timer);
 
 	spin_lock_irqsave(&sl811->lock, flags);
 	port_power(sl811, 0);
-- 
2.43.0

