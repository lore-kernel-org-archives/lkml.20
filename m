Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777277;
	b=T90oMMqVluogPm9maG5iGHjV5w+GnrtIPRwCQueYKFJ3yECVDc9OMGZDfRKH2r33nJG8
	 Se8D6sB/so1QzEK6yC1eSSHIzQXlBny3N3aFS+V0vVa/HNdjfdU6hFYgPxnBWJZveoT9N
	 91vU2UvrEypN4FKlmlsmghxFopVlTvuEDwcR9PexaMgYfxbdMPFCv9m2UxiVPnj6IFwwS
	 1xuCitpfYWOaSsMESksO2CpYJvoenTtEBw7H2DpVXDPvffSlBG7DlrYNAM+3rG8QRvDrs
	 GrGpsuaNsoEWk5NyebomThbCHY4lo748qNC0V3COU/t2bwiG9++x9HVQWAmWQl/YnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
	b=LlhxY17IeIcYv0uwUF4fBACl2iQqtGTsHmU3B6LUtcznPj0ofouO0MhGNdsSc+EX1cPn
	 NY25tn4SnlYgz/tqmeT4+cIT3Tnd7l7aL09VMXWIr22mhIr6YcBc3tRQjBGacIcGEp5LM
	 W/a4jfGGm6EoiVvttg4GDTKdEZ/5QzUbP/DOkGNFSVWbMecePAXHUuv9HJnmtGutSAM/c
	 UEKBRWsoJreSddsjD41smnLBMohImQmoPHw2KudIBad0Ad+IVboHbluTC26JLqnrX3fxf
	 kCL34xNMKmcvMkijs2St7LfFeJoUuxqAkvjhZ1pOpGhXqWF06/oDGpAV8ULN+aLuNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwq7HXJ3;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD71606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD71606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwq7HXJ3
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1057957e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777275; x=1793382075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
        b=fwq7HXJ3055YN84gik4gwErUSx/7NlBw6Abzp7HJ7SZ23AouCbTUXRGUqc2YRPxA5D
         Q/qIsx0eCtwq71y6UROQO0s94tvRyE+o74UOkoy+20GzDVNrwSXdjg87lmRwDEvBYiug
         tHGiLyCKPP/3PH9Sw4QYDFCiSlRfzjIG8RfHuw6EbRyNcPLrA+BfIyKrfH98Gy8gXqvl
         wk6jHPWeSSETItc++bdi9NftMuVAfrgCRxT0lLWpK3WofE4YWnKwVh72sTQ5mabdAMbQ
         PbBH97IAH5Z5WQGB+BKC76trV8vqsUTa4inKJA6J/sz04L/tAO872COL+f9CDA8AnLje
         8EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777275; x=1793382075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
        b=2hgAsk08DwxZxrEbXKTRs+o3D6kRWTztkEdxIWao0vHvR1V1gIkA3iBVvY1qQoGHYg
         z2EqXRiEPc9U83EcvTx+fkvrP4fRLj8qESIDn24bJNQdPLxwoeXhUvOXZez9hSR56XGq
         6ejz1Nk5f2IZg6s7iczGW4/466pXuoEG59E71GTmvqaQu0RwWbJh4MkMjrhk4Ek3U+rG
         MFSiq780Mb/ilWi1LwL+pVCkJ6Qmqb4cM4kFER6SeCXnny412jxU3ZkbIejkn7J77R+1
         0B4COITSCfq0CdrciMLfUj7QvqBh9Z3EwrV/Ijhtr2SN5+Bh4FYiGayNF02kEcSG4S15
         jlqg==
X-Forwarded-Encrypted: i=1; AKwUvBxuQv0GDLOswZvoRUlIQ8UAxqf7wXfeVDk09u1DgswUvFpNo3/DgbESZI1gqm8TX33Mi9GF2bozCse3CZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1HUEf6+DsjyUl/7RhJ985yza8wm1f4N0DKWJI712lELr8bXgE
	y12TDQSNb9RnoAg/RKH235Fc7wwpxXHDK0Iy3uBcsoPey/cVTCvAtJ6r
X-Gm-Gg: AYBFou3osh+swPdPsHgqesRWcv1GvJiUuW+Qs7UouDcoRE2aEFyS+bXWciuHHZ3y42E
	TFDFM6bH7yXISdXNQFm5mLRUOFRuMmRBFj86O8Aekt0g5tCMqQqoWY4otzcTu0AujeIDd2YfgRF
	UN4U3MCmCyvKc6o9OnzJTGo5+3rsHuuj81BNzBavUU05NbZ48Wo2AELNkJkIk+td00PVVlYGReG
	5VO0XeiXlhZ9LbYrALFtn8lk8koJO6ndUud0T00pVgc2u7azNvFCyUaVPUmkcTNAqL/fn+8Xx2Q
	AU4GwDmbx6jMydeZCy5sBWHlWkOqAX+r4GHb5PHQC53mQYObPnSadWoLCYBdY5e5LL6xOCFuUzZ
	KrchckhteG0oCdslG6lZQ2OAJAUMH5BWVzSsGeOgVF18xCDqHFi4hB7RCI+0OZ/UW4SPVD6IG+0
	tJNlbzPjD8QAPVkvvpPS/FaNZhpRa6v63JspyjHTXLhI+BuMEyqVC0RoQ2XmSufwNRKQobwMKjI
	AZZq8IHsHMP+7C32i9pgUpQ6UAQJ2q6RhCCGWPKWJ6pEVgGYsqidW/bVhyg7Eq7I41o78NdRxHA
	QMEtlfCoiKYJSSHmKLszwnEvV3MGIV1JlGW2eQQpKaX6F7Dfwg23ETvZUiXtNVn9Wbmg4u4AUKT
	D7M4xuw==
X-Received: by 2002:a05:6512:3984:b0:5be:32b8:e32c with SMTP id 2adb3069b0e04-5bfb0b3e2c7mr1148573e87.35.1792777275127;
        Fri, 23 Oct 2026 10:41:15 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb670e8acsm59975e87.15.2026.10.23.10.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:41:14 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: [PATCH] usb: core: hcd: cancel giveback work synchronously on stop
Date: Fri, 23 Oct 2026 20:40:15 +0300
Message-ID: <20261023174015.54793-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
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
on another CPU after __usb_hcd_giveback_urb() finishes.

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure after it has been freed,
triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd()
by calling cancel_work_sync() on both high and low priority BHs.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..0b7d30900f7a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2787,6 +2787,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	cancel_work_sync(&hcd->high_prio_bh.bh);
+	cancel_work_sync(&hcd->low_prio_bh.bh);
 }
 
 /**
-- 
2.47.3

