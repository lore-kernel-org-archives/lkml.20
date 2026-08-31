Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536073D9DAD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165022; cv=none; b=gHQjiNMwpV83CDsR9TXnFVs9UX12BcbPm0oWkVGLKhDE/AJx/PD5xqWgK/lrdsdKZBNt8aek1G1DQn006elBNPYUh62L6V62eiqRGy3q4dzyX3SpHHjAg8vwd4jgkb6lIAd2MFDhf8opCin8H3ec+BoZPOQMiCDKgh1P86uBNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165022; c=relaxed/simple;
	bh=xXuiXykzbiX2ZCjda/3ugCHu8+1Zib/04d77OyEGtjA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=Fxy9qWPOxIcXmx9FGKfCX0WkPiNLEWZu9m0ecphVCOxMKFW66KG6pNAPVB3F7s+uVA1gjietvg/bL3/GknGoXMM+dboyNYxysisIRX5z+UUDf6UAUeo/yxySdYXjEk1behfXd2ThVj63e51Cahh6zcxBQTfbmhq2E8XVZXT2+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=LkD1Z5Vs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="LkD1Z5Vs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so459765066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788165017; x=1788769817; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+LA2dlyJszs30Yo28AUl/hqCeTsIfAPbCfIyYRq1U0=;
        b=LkD1Z5Vs+6w970hihIZZCEXdn/lX1aiVxhm4ejS7lP8IPd1n1eTXWXRdztP47VtktV
         7E4TpHh+5yhxPwpUYZ1zzF1Rn8w3ARZ7lK2ctjuO3pCVLBOjjVkhFIPX47QArmgHK6ux
         k85QFbZADbsMaDUoNYIadwwPRRT/WAO6cnoVUCEtk+pegbsTz87djgRrQt9ukjS0gjnW
         42fTyCWXAZ2mqUSBCBGkVV0ngCBUkZGJ++pswBMERkrcTGEcV9Rqomd5zTDPFx27THtW
         YIETeP2fxmLznifPxFPum1kalOVhS/1yHjFIv+OEwfAKn2D5DeR4Lfn2eR/vXIFAgOQ5
         S04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165017; x=1788769817;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+LA2dlyJszs30Yo28AUl/hqCeTsIfAPbCfIyYRq1U0=;
        b=OkZrAIu9FSfYcuypvnovPnPcm52Mv1kGwymX8hISn7T0EI7XgdOC71HIx2NdkCTtJx
         PH4P8Y95+kntWw5t8Qx5iApNZrsS/fhxxVFmaHyUfXXg6FT9vg/t3iaTc/Fp8YpHRa81
         GNxvpkpjLxx+zM0n/daKE5wy0uvFXEL8EqV73G875oOQcKsqT+/CRqc1lszOJWYGSRZ3
         ehTK1LVcz0cGXSGTfzMh+vGZaY8hebiJgbXdiSqgig83aO3BpCnLuIcgKCh1aKxcsRFm
         +jcTXMF9ook6hshoGnzwhDDUDDtJvZZgd/JHK/y3M4/WutzWFEAFVjA109+lLwxB/hst
         zi0g==
X-Forwarded-Encrypted: i=1; AHgh+RpF5/Z2McQuHwht++lx7nuoyJJipaYkcyZwjDGCw6joZ5A02pc6GLpX447kY7SK4euhDmpBgqyp8ibYfXM=@vger.kernel.org
X-Gm-Message-State: AFuF++kh+MBtgwhxJjbvjKyyA7dVsHAVMlWNmU8ioJ1jfhz9ZbKfza5m
	3ilCuFd2IuNCXjstwru7mMm4DUInPaQs3kYVYhYqf948tttGY9/kuFldy+mvh9CGPno/CZTn0Kk
	bTC8DuQlB4w==
X-Gm-Gg: AR+sD12DNdri+iftye24En2EL0eK+g8XSB+vGPiIO6Pj8ShxSJvBPkEsK0i05huIUBL
	7ZHG3g2vo3L1EAV0F9j5EGJeuHdldGWZrwnoOuFr9Yr1AAySQPbzKyHvKMq7Kb9H0Mio9jqrK/L
	h8y2mzb3RGVR45DvzNyZgHaymQ1utjgJGnCZIE60EY4hHFAOYKdOITjBG6XrYpdGnkJH0btqU7M
	tA4qMn9PCPXCEfPqqhoMCGNqOVSFe1enkmm/Wl+b2rTCzOaQ/HnvZRZZeOTbmz1EKtOqIDRBW87
	/i2eLRmAPfK6tgdPDztRpOhXqP+gvvn3fzxHthQzLUXQhkVqnOGsPUx+nkvL31R35bkUXEKomaj
	+ld8z+0Rha9ubUY0Q5/ol1OtbPIWWLfYPnXtzN4rX7zK74h+iEgM+w8lKC+B1LbIS378iwNwPtY
	GFek8HtMZJ17uDqUYRSrbCDAlmtxsVW3x/LtfHaui2fu9FpEKDIVbQpLL9onJppUX/mSjPR5HTn
	6dUxi1oY14bUFnmS/oEkNokQCVX6R9qR1g8vm5iRXo=
X-Received: by 2002:a17:907:728b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c2557169784mr1500824566b.13.1788165017052;
        Mon, 31 Aug 2026 01:30:17 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee27b19sm390365766b.19.2026.08.31.01.30.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:30:16 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] can: isotp: take rtnl_lock() before leaving the notifier
 list 
Message-Id: <CEA6A38A-2646-4ADA-95B4-CBAE2F301A8E@doyensec.com>
Date: Mon, 31 Aug 2026 10:30:05 +0200
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-kernel@vger.kernel.org
To: linux-can@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

isotp_release() removes the socket from isotp_notifier_list before it
takes rtnl_lock(). The netdev notifier chain runs under RTNL, so a
socket that leaves the list in that window is skipped by isotp_notify()
and has to unregister its own CAN filters.

It cannot always do that. isotp_release() passes sock_net(sk) to
can_rx_unregister(), which returns early when that netns no longer
matches dev_net(dev), before the receiver list is searched and before
the "receive list entry not found" warning. Once the bound device has
been moved to another netns the filters are removed zero times, and
can_rx_register() stores rcv->sk without taking a reference, so the
receivers left in the device's dev_rcv_lists point at the freed socket
and travel with the device into the new netns.

  BUG: KASAN: use-after-free in isotp_rcv+0x1570/0x24d0
  Read of size 1 at addr ffff888118130552 by task isotp_ns_uaf/578
   can_rcv_filter+0x4af/0x8c0
   can_receive+0x28d/0x3c0
   can_rcv+0x2a9/0x310
   __netif_receive_skb_one_core+0x21a/0x260
   process_backlog+0x210/0x760

Take rtnl_lock() before removing the socket from the notifier list, so
that isotp_release() and isotp_notify() cannot both skip the removal.

Fixes: 20bab8b88baa ("can: isotp: fix use-after-free race with =
concurrent NETDEV_UNREGISTER")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
Reproducer available on request.

 net/can/isotp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/can/isotp.c b/net/can/isotp.c
index 155530aedce2..8ca75d30360c 100644
--- a/net/can/isotp.c
+++ b/net/can/isotp.c
@@ -1475,6 +1475,8 @@ static int isotp_release(struct socket *sock)
 	/* forced SHUTDOWN may have skipped IDLE (gave up on a signal) =
*/
 	wake_up_interruptible(&so->wait);
=20
+	rtnl_lock();
+
 	spin_lock(&isotp_notifier_lock);
 	while (isotp_busy_notifier =3D=3D so) {
 		spin_unlock(&isotp_notifier_lock);
@@ -1484,7 +1486,6 @@ static int isotp_release(struct socket *sock)
 	list_del(&so->notifier);
 	spin_unlock(&isotp_notifier_lock);
=20
-	rtnl_lock();
 	lock_sock(sk);
=20
 	/* remove current filters & unregister
--=20
2.55.0

