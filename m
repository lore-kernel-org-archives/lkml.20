Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D31D435F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349442; cv=none; b=lETgaduYngyXn3XwKJv796qjLNAmGYVQnV8Kp9VuK7LKfv03/eGaO3Qmd6TFP0GwUOXeYzo6nM9ReENulCmKd45xsGm0JppOksfMibyyYY6wEyNYeX5mVgvmpPt83HRKTt/ps+6AEVzTgkqc093+erAXR98W+G/B0YzBGPNrCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349442; c=relaxed/simple;
	bh=x2YSwtGWkoi8vtL/lIbsZM8/SJRylBmyWKVvTPqiEoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FU08Tju/hxBJBKpxbNJaCY0fUeXYs7y0ubcG9WaeZA/OVogTKH13KyfQbrv1C54LJIHWKe5HTiS642DplALOtpktmfX5Hk7svg+IbJMJX1vAXaF7GmWJeAjPebAUjCzXKCeqliDVlY3HSccA0+QQfeVjfHoYhkn2ZctPsl/uX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K45z+sqc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K45z+sqc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1473100a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789349440; x=1789954240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcnz/anIni8O7yQ67/BZn3naBRVhXN1aoBOwdzqDEUo=;
        b=K45z+sqcnBgA4toaafwf1ghtkPFEUT4NJRBIV90JSd3LrXPgdR7EAO5cQIPET2bHU5
         3/IAhEf7gCo7SzS9yCoKFvK65K4EqRJWod37JEr73kR9rqj5pSdLqflAhzLGXLBFenkN
         jQzsqYgZk12W/YZLGwvXEQNyed0StvB2EvImotyRhhn2f9k5bwNELnMuR6WAaPFMUksz
         FlFM682OA/RpV5UUzsSmvrHTAc6e5nu1jFULTH253OXTPtZM9fdD8oU57dlbYUngsKXO
         w0mQXmF/mupTxZ5FDsU88hexv3VMDiRWO36g5FsowchfhopdZtJuSsuV04uKeI1dyyhM
         FfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349440; x=1789954240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcnz/anIni8O7yQ67/BZn3naBRVhXN1aoBOwdzqDEUo=;
        b=dLn5qgf5NqZAD12RDO5qNOWfGqBa5L1j13EytonAdH0uyoSbfANsFIHdfLK6GJs4XZ
         P2rS3plMf5jYHlJJRLl3k/N7nByP9xbCl+GrWgk1tZ3iNh7RBhoXKX4RbtzsLXl+TMBZ
         N1MBvxmB+ixuZJjf8a3MAAr3G7QSnxGqyC32VRCZoz4CO1PS6xFXpPVDHoghcuH4mkNG
         eAnJcOFouOUXEBneJD627JxlG4LZi6Lvkg3OM2XHc7rMjYsqco72qfgPm2T9XH3/EPnT
         94DZ+ATGdERQyTrrvF57VdCs3XwPs9arvLP98Bja0+eDrozVEgvM0Xr0/iqKSMNkj3pu
         hVRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/T+2HgwGlKvDepKkqBQxNhvtdHGZ3XVmoKFOlmUjMDQCykFzXKCrrjK12rqHBFarav640HgW9JW070FM=@vger.kernel.org
X-Gm-Message-State: AFuF++lIII4cpIYFnHdVDvx6zb3qOXjrQQlhTsZDIM/LB4BvRZIAdGrC
	DCVi000mB7mc3VZpU/D+95yu6wn03r5O3A/nY7K99PWCjX9MI+PpP+LO
X-Gm-Gg: AYBFou1XTtND9wbVRv8EbrCFqVMLLty6dRZm4lEgUJUVmdOvPtbY14Og+nFvlriMJRM
	Ac++w7q8YQUgRKo+x3TFmQG7zQQNFB8AaKG2V5mL6ZwYGRDKPRdUYi7liUo/51Noz6PnlWtlhPU
	+fDfZ9hY9cHHLASh+OKdOwJyVrleqtdE5uV7M8DOGWvftufbl5/IRnh5JYgTycvhdQWJFwvejSu
	W6GGjrJSx/fjgFVVOuYbXyQxTsFPNDf2dYLUCdR+Lf4Jmfe2w9T/A3oZGWURqPh3KgpI0Qeejrx
	+DyNt9v4FEpj0BYjkCiHJI6gfWceRvTpcb1Dgm9abC3v0aZNBVmFDvN5iqvOkwahYF98p5VnJRv
	Vy2QA44XFmlSbv1RhQu7VB5W9pVtYGYB+EPrHpwoDs0BTfDjauK7ufSx2I5dmyd5rWs/W/+eWgZ
	+CO4OrPQmX3qA0FUExW3Y8vLNeDepM+IjGFuB0jGRG4kjFHilzG5PQCyx09s2Vo340A5ITcQ1xT
	fxZJ5dLDuSSTNyUAybcUYwr2wxru3wO+TdvjXvkaMYsTupahnZ9Sy+UrRSC6ofXfNFJo78wk5cp
	5oM=
X-Received: by 2002:a17:90b:1d4e:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39debfa4b03mr1210528a91.10.1789349440495;
        Sun, 13 Sep 2026 18:30:40 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm39627135ad.3.2026.09.13.18.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:30:40 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Date: Mon, 14 Sep 2026 09:30:33 +0800
Message-Id: <20260914013033.3938-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
the device is connected through an Etron xHCI host:

[   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
[   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
[   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
[   58.592967] uvcvideo: Failed to initialize the device (-5).

Testing shows that at least 125 us between control transfers is required
to avoid the timeout. Limit the workaround to the affected Etron host and
USB device combination to avoid changing control-transfer timing for other
devices.

Perform the delay before taking xhci->lock so the existing state validation
and TD queueing remain in the same critical section. Use udelay() because
urb_enqueue() may be called from atomic context and cannot use a sleeping
delay.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/usb/host/xhci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5c759ad..925716a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1648,6 +1648,16 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	trace_xhci_urb_enqueue(urb);
 
+	/*
+	 * This camera needs at least 125 us between control transfers
+	 * when used with an Etron xHCI host.
+	 */
+	if ((xhci->quirks & XHCI_ETRON_HOST) &&
+	    usb_endpoint_xfer_control(&urb->ep->desc) &&
+	    le16_to_cpu(urb->dev->descriptor.idVendor) == 0x2bdf &&
+	    le16_to_cpu(urb->dev->descriptor.idProduct) == 0x0280)
+		udelay(125);
+
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	ret = xhci_check_args(hcd, urb->dev, urb->ep,
-- 
2.25.1

