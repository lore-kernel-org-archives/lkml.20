Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562116;
	b=Ka1wJlJsHIGXgiiJ+fKrtEy1pP2mjhZYP9OOWhMhvvJ8OvQQlqQvBMT9R+rROWj0mV28
	 Os+lDVVvYoUZlqnfMp+8TKb5TnbOW6Jx89nay/R56Omw8JCbaQXXndfTCBu9QCdSy/K8H
	 F6R4v3u7FmeidnulimMCdgbXaWjtEAaqIJNVTDWAuqQNVSsoN4l4rGBy09iuosvvs0ppN
	 Z2YdTEgzHtv5vGswvNjj824fZM+HOsulBByUru+UHBl6wuBO8jspeQ9BCJ0wGRospBhg/
	 Wkr+DoGQZz3MdiXj9knjXf4M/j0b3AMI0utB8fKSHfYQHEQ3iuaA2Yy1NUg2sITcjkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
	b=RYPL9Lvk65SJXHQf0uuD3+G3Kpg+SHKSSLSXhVBUZbSg6304s8wNLEWp29OmsoHWkV4B
	 mIfndW4XZMzBswR4bgE2cd7/rsshHhI+Ezg6xidKORN12NPr8JG/EW4VsySi3xGmcnnvR
	 +IlulWlTmLH0VHHxQUtrCkhZ7SlhwQPgpBSaqXZ96JRFiICpTiK9rC3wnhKL4T0rhqTe5
	 jqEsiE3zYIYGnhg06lSj0FfoKmL2iFJRHhBT3OVu3aMaFwJhLtc1mmwwgSVFT3p6ynMle
	 t2AfYXdfxde6wvGfr1qoP+GRPMuGX9aQf0n/NIXDGzHjOOd5AvEdNDcYxXOVCqMj2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=P2HeMCNd;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA92606A8B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA92606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=P2HeMCNd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7003525e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562114; x=1795166914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
        b=P2HeMCNdvDtiFce9CYWTnJeK/AIFiFF4pnAIkWEx6kpOTTk197ga4kqUNkV35Sa8kV
         8AFFjYASh9ibxDEPz2XEBbxkcPKvWq6Rm9Hnc8awFH1YCOoR8v9P2zh4/EZsBKhsx6gO
         aWlmXEK9es9BvsHhO4Bg+/OTLD4s339AaE7xSCha5mXwMtoO6Uwfva6Ku/TVnReW9LKi
         bG/YKEMRn8KTAqa18lsAyjGOk2CUORnUKmYVuk7tvsqd7aPyY2doDvSfM5+rnB6v0nuU
         ucr9nD5xD/sJAnL9qEc+3owZk8BZbn7pAeOoKZVIoHKevOgMcUBGHZIvH8bTD+vn3Sg4
         5xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562114; x=1795166914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
        b=SvmnEl59F60seQJ+HRIsyW4usSyty9wxyQXvgZ1XdXknG4R1QkaGZS2QmdaehKyh4x
         b4PCF8N3PzMmFCoZ17ys3gliW1UG3x8lFZBzSVqqTMShnfgVOnaqd/AVSf0URRX20uVt
         RyGsdV+WHa5IVA0WMyWrYc+X7k0FUwHxNzpCCbpfh+gXI2/inPzrhqQW6d1QOKzjAuex
         lsOuMXHsiDS5EUy4QESq0JR4vw0J7z689q5FWSJzo3CHDjBGACDZ4LN7dTDyH+Ec7Lux
         e+EKrEPrYVNIi92meiy+AXkKybXOJ5HNIi6uxtCuFxJ8C+SlIll8EEN+qshu35mM22o6
         JldA==
X-Forwarded-Encrypted: i=1; AL+hErHOY+esg0slbHPBx0u+v4QK4ygIfqzYDTgUe6nsB6eBeIUiw310ahog40pNmESmbiDE1V2EySBd1B4cB9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8APzLW6YTPJvw9WB8xPs0UUvaCaWMhgI1lg6UonWW2mRdtkpq3
	rVh6KVrxMAy/8yBkMc1YRDN0dzEFMK8MW1LJWRMWLVlXU0OnqNWum9Vnt86IrnpRLe0=
X-Gm-Gg: AYBFou0S/4HJijIGiq6mXH1klqufjnmg6UTQbv7Q0xbG7F8+4d5L8wGX3HH6P5gDFl9
	Nfv/z1vt4Ca1Jt1ytCL03F6A54kk5wUWIoRldAaDg3hg6nTWzyiBa34u/tA6gg4rcwejP7i2EdZ
	nhPh1ZkYrU4lJ843xftoVMOzkQlbQrpyF/QR7Tq7Fz3vF82CXQm5aG1eSIosdbPHrWyd1V7e8oR
	k8yrC/Pd92I3ZQ8VFkraZ3jf0yrGP9Fm24iGLBrueKF2qi1OeIn3wnqB9bOyiECUpGGELC6A7/6
	ploCPFqtaoml0mToAZQU9j6pv5yx78LPz1yM9TmFXaVs+Sc/Frs3dqoqr2PiCVt38BSFlOa3XC4
	/cW4wwJNdQf+anXILrdBnojv/dL95y6ge+0hlUuuQgAZj4uvWHwNkrnlEUO+2VWNwyRkxOKtMsm
	+fRbpwwrwvJU/NQfu4S8UjA6CISk35Fe7kFmeFTUpIcVOWnVJ6t4CT0+dyhS38T7G2f/SGbVgSn
	QL7tnGnuFdt/HbGoOg0We4VFwJCpN5TcNnD7okBX8I2W9zANQI+nWPIAE7gXXXvxhETKVTtbeIl
	1o6egTfcqd/zCTMaEv8thSPxrFx49eYK4q4IG7MC/3cu38jPhXqYhHCQlGKf+SABaKoEjvpzX+3
	/UrzfQNiM
X-Received: by 2002:a05:600c:3acf:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb55a70e39mr41567045e9.8.1794562114447;
        Fri, 13 Nov 2026 01:28:34 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:33 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:18 +0400
Subject: [PATCH v2 3/4] usb: gadget: configfs: Leave resetting the
 deactivation to the UDC core
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-udc-connect-v2-3-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=alchark@flipper.net;
 h=from:subject:message-id; bh=rXH60RggZj0TEsglu29QbUJgdLk7jMtayvCxqYDmcpU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2FRWfMidlvh9b+R79qm/fe25UvhK4k9sXXr25NWO
 1yFWvdodkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV5+czMnxdssH9e0RZ2kQJk9Vr+JxecDKUC26frfNgsd4Tj+0bcmIZGT4oBLT
 mCoS8lY79XveM/fXz8rWqaUK3WiczpL0J4oppYQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Commit bf95c4d4630c ("usb: gadget: configfs: clear deactivation flag in
configfs_composite_unbind()") made configfs reset gadget->deactivated on
unbind, so that a rebound gadget could connect again. The UDC core now
does that for every gadget driver, under connect_lock, which guards the
flag everywhere else.

Drop the unlocked write from configfs_composite_unbind().

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/configfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..c0f9e6625b64 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	spin_lock_irqsave(&gi->spinlock, flags);
 	cdev->gadget = NULL;
 	cdev->deactivations = 0;
-	gadget->deactivated = false;
 	set_gadget_data(gadget, NULL);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }

-- 
2.56.0

