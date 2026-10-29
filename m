Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274496;
	b=3TCZ08Zd1Yp93T0xjdjCulNludDP+7IBKROrW9mNPGcyoQpd/qpsjD36xj9s+zfInNy6
	 A90/12KwyNKZtwVefg0t+5goSKHzceWt/v+Y+VNOW4OhOcK2XE3VRLd0XNqy5ykB8smS7
	 eNTPsMpbUA6SlPuncmxOdXptt+0Y07+t/15uuMK4F87Ju+AAbLsjctLz0uHAdbcPH/wvg
	 570Di4Nu4c+Mzcvn7z6Ct+rOC0B/TQDMrUi0qCmZaozY3k1oi6uCVcldsRRxi1u8h3PNk
	 KAlHa1+uYWCHJqJVlWKAEwBrtXI74id6Ew4ZlMIdG0hPFwdxZ5wZVRqC5sKzNCt6YZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
	b=LOD/84YIlN6ffsYIvQZFSihoc0jbFBI5jukaOl+XE+mzc6CRRbx104Elda1BdHicwyFX
	 bn5HabYxVPE31KC2CVhD3ay5Q5rz2+N1MKsl/je/jir856QEoiJZ1KOHIOYDeWHQU48YM
	 i6XI73lPPoPnh7cXsdXGu0jA4sTL6h9ZsBxRhqmO5+bPWUFWAz2hiR4SZhCdodQKLoh64
	 xOwWNxIBr6DCGnXQZLTeKuLbhEWwBdIclu9naI/VJ7LQhF5MV34Ef0wZw+OBxQ0YP7Eza
	 MTqGYn9KtD1ciWVcvjk4JKeVoERwWbK8T1WglrGRujRtkV+BSq2kchpCbpbaMDN+4mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=banifaK0;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514CC606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514CC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=banifaK0
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2507909e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793274494; x=1793879294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
        b=banifaK0UFfcrUjrBbyfYtcH1M62FJc3B7U3lonNdqtbMRiWEu14G06UtrHq0WP8zZ
         cyqoaLkXbVlJIrWv/7faWMtAfWmsNaOic5nUQ3pvRuEsYUPouLMlBSIKYJS9xv8w9jcK
         YVbw2CyJo77JqycvfM0j8GkWrdPCqw5hjaJitlHPdqaZARbw0Rj9DSAGNWOeBj2jKL3g
         bmqKUxDSJkyqrAqQr7RE1MB/SOnVQ+01O0GF5X/jP5ZmyaiVcD9kQTlHNtOgz5wL7RUY
         rP2Bimr4tZOtsaHMfegFjYjeq4kQLkhC//gWF9CFX3X8rw+b94JsO3qsgTkI6pZiHR5x
         IUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274494; x=1793879294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
        b=M5PNswvONBOr1XaoTOQAGVSRaLM1WkX8LNEdJHgm2hnVGE53NepWiP97t6rWPDe5L4
         mbgm5FX2Ar2OH3OR0Ma2ohb7kiPExz+qrxX3NFOF4GGOMIKz8i5heD64+w2CFvRSnBQI
         84YsYue3QEDD7p0c01glfWLzYGLAl8rOuK/je2mNXOoiIEARIUx2PWs16XaPP/JYG50H
         stjcKs5azge+TCxrHdFFby9PXensTd0jx950/8dKucNSlGq8m34/eDzsxr8M+uxgF+3l
         AVvLsFjbDMNZpQQyf1UEKxXdblJzjgFPJIe4ZI9QnyKBBjTEs8c32N/NaXMB6sz5cCxj
         wUPw==
X-Forwarded-Encrypted: i=1; AKwUvBwymeE5OFy5H1D/rWG67EZvGscZ7G2XZS14+fMFXfWAL6ntP6dmOIBGcCRU5xNenuHou3pzEuIHzv7roEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDQ/OPCtXLqORu1Y92ozI30eAuXZHvMYKSut07V9c4C45EMZ1r
	9crdx6Kx5q8mxvCV/pV+kaML4qfmCJOzcxhwpKv5nU2CaQQ/dv/DI12R+v/7ocM6BlfFTg==
X-Gm-Gg: AYBFou3LO7LQNE9z1OkV750WEjHBhpMZRyIVpUCN5+zvA2iaXndIJf9iGSMsRXwb3qC
	cv6oDmMy27o7troYRMMd2HAmVbJ9+Hx2x8ddyW71ZWBOb3/2QkblNx7yifUjyMPfwJBL8paxC3S
	Jfl8jNKyzDWKRY/21B6RKkxLJbjVKZN9+b2qCz3VW4RBBeGE3Sw0c22XiI/C40zADDFVRp1HHPU
	UiQ/RfiLMU2KS9Z7awfEcQbVYxX8i7rWFE928vn74juKynjwOUPTRD/2B6sY6WsWc7fG2Jl170f
	7Iw/o8CXre2WaE+3liiBJzGQmoHY+heJxc5d+5bFjyRLEQMJS3XEFdB89/7UzVrVpgU4u4aj8Fe
	51jyVpv5onHEFzLCmf8RPDAaZ2fHrATdcs/RMMkKyNVyG7hURCmhgbpUpvjO69R6nnXZZCDt0bJ
	obkWrRvVDQwHNm9i4YJ6cIH2HLyexAYuaMX2Uhj18ySsPS/UiSgcqp1RPywZ+JQDNG/aCP2irQa
	mwTb+DM0a9qpKO88MVBJJOBZQEPJuLfqJl7xuZ0SnnG11u821GANreN0S2T/ZR4UysoCXKpDbEI
	rYvOKC+x7bZ2J2bHf0EOdxSrVBqiaLK5PChxWwGikO2+vlwuVwtmDg9plfYPGtygkxoBH+fZzoL
	mEC5PKMTLFbPWBIEJ71SvU0Tf3LtYpZvalQ==
X-Received: by 2002:a05:6512:3402:b0:5b8:f417:dbef with SMTP id 2adb3069b0e04-5bfcad3a1e6mr1998269e87.60.1793274494203;
        Thu, 29 Oct 2026 04:48:14 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c9ebdsm1144138e87.84.2026.10.29.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:48:12 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v4] usb: core: hcd: flush giveback work on stop
Date: Thu, 29 Oct 2026 14:47:33 +0300
Message-ID: <20261029114733.2688-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>
References: <20261024155614.2732-1-igorpetindev@gmail.com>
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

When an HCD is stopped/removed (either during module unload, driver
unbind, or an error path in probe), pending URBs are unlinked and
completed. However, for root hubs or HCDs with giveback done in BH
context, the work function usb_giveback_urb_bh() may still be executing
on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
and wakes up waiters in usb_kill_urb().

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
completing_ep or clearing the running flag) after the memory has been
freed, triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work has fully completed in usb_stop_hcd() by calling
flush_work() on both high and low priority BHs before deallocating.
Also remove the misleading comment in usb_remove_hcd() claiming
flush_work() is unneeded, and document the queue emptiness in the
usb_stop_hcd() kerneldoc.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v3 -> v4:
- Fix domain typo in Closes: tag URL (appspotmail.com -> appspot.com).
v2 -> v3:
- Remove obsolete comment in usb_remove_hcd() regarding flush_work().
- Add comment in usb_stop_hcd() explaining why flush_work() is needed.
- Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.
---
 drivers/usb/core/hcd.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f403795b17ba 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_hcd *hcd)
  * usb_stop_hcd - Halt the HCD
  * @hcd: the usb_hcd that has to be halted
  *
+ * The two giveback queues should be entirely empty when this runs.
+ *
  * Stop the root-hub polling timer and invoke the HCD's ->stop callback.
  */
 static void usb_stop_hcd(struct usb_hcd *hcd)
@@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	/*
+	 * Even though all URBs have been given back, the work routine itself
+	 * may still be finishing up and accessing the usb_hcd structure.
+	 */
+	flush_work(&hcd->high_prio_bh.bh);
+	flush_work(&hcd->low_prio_bh.bh);
 }
 
 /**
@@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
 	mutex_unlock(&usb_bus_idr_lock);
 
-	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
-	 */
-
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
 	 * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
-- 
2.47.3

