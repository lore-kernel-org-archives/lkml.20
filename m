Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723467;
	b=CabHvwrXMg38P43jR4eau4kmwLu8jKQG3g5kXWL5r7vjpu4Qr6YB/jWPCQ4Mydvw3zmo
	 IgAWwJeNdZVHWPMPC5COhjLZr0grjLnoFNgk+B2UMK7ij48gNuSCXuwM7v0yz4TVgJP/7
	 WvGmVLqltPPOKX/QiN9mLiQBDVmZe2ASpT7L4IIKTOQGf/cwX87RNICZ/GlUAo1zdajAm
	 WHRJE0hwAGXOhprINkm7Ixi5ESHE89sgP9A3UnpsQHRicwkqIOw+7w5KbbdVEV34beeFp
	 3En6GT9E7tQGpxrZ/teVlKGGygYZDHFxjb52dlQFUPJYjncAowWIUvoxXiBJtv5a0lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=saAz69dB7scZwVRL0Yalw8vwS4GVZnSids2QJDnG3Z4=;
	b=ofJmhr+eZTxGpriTXn3Ub5K4FgTzrjRh/DjBheCkWUMpWr4veSU2fT1D+zlgsf1y7r0M
	 +BKjfIMxFeVqZ0rt6HUtiGIW3sqlA214ZE+9pH/MW+caTYcoizLG6WZQN1k02KIwPavC0
	 sBuL7/WXaDBd13wlBkyeOt2/Ssm+bW1Zsp0KFYQZq5i32aROXaj+BUr4k2UEH4+OzEuOM
	 SEl367D1Aeyac2c79VXR51aj8NwP7iZSP9IzqzY8qGjrbhI9971q8+IRxMUfHNsSiR2Df
	 TSJ8AgKIvXQEJBd5BBtDZ7SCeDheKpDmNImEpUwceLC5cJcJs2CX0cq4S7qsPwQozOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD7+UlPa;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56287606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56287606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD7+UlPa
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c210c66672eso563666666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723466; x=1794328266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saAz69dB7scZwVRL0Yalw8vwS4GVZnSids2QJDnG3Z4=;
        b=hD7+UlPahOYbvqzRaB574vfJ/bX+Td8L0TUv+s1CEaBmALDsuV1eE58pK8V6i90tAz
         XzzX62P1Z3PScjnYgqjrL0G/LwcWDRCue7lhpbaoB+BxxtzHE+sETeg6tMFxyly+lgB+
         jT7kRwronhtmosh/PeEZruVsYVRNgC+G1xPxK4HIFzNP6jjCiu0Kzj5eWZW+ce8YzY60
         Tg+J2Oer3J3xVOkYxuRT8dj++Z8TYnAkvL3K8+KExabuxmrYrvTz6kNkEu4IiIvTAkCP
         eRu3zYwWsou77utLbNozCm+Vji5cONRL55XO+T+NUiHoCAsaq4MVTvML+d/i6DYFoXBh
         fz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723466; x=1794328266;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saAz69dB7scZwVRL0Yalw8vwS4GVZnSids2QJDnG3Z4=;
        b=EyR1R7j/Q02PABDmVcCbVKzL5geOCmX5OB5M3qkQTadeKHhA6VqVRk44tLNpxttwhk
         iwN0xevIEWN1H8+ChDgFDN3H5vKP3EIAtT0VWe+o9AVTQju4ov4X1jnzodLMzseNl2rk
         KmXQCDKUXms8g7Y8TfcWR7YsidHi7het+NjM3Rqm+xt0Td/VeiCJycTIgWxQcDklAFtO
         s/+pza/cjiYLch1P/M2FCMor178fCrdQsfX4vRdAjKf9EW1M84gJ8P8gqU82aw0vZwEh
         U19wafGWqqqh81iYYvF2uIdIQLx10JDW19y6FyCXc2JOQgoDyh0YI5PF6DxJ9pkGNMs4
         Dw1A==
X-Forwarded-Encrypted: i=1; AKwUvByHPsxs3g0P8gArzJz9eE/VS0ezntukSai+ieWjSvKbaEic0KI6zcu2vuRC0oPlygq67zvG9KHgUhgsZK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z805WMR0VYVb20c8JxrmKG7Q1+r17JHd+S7n02yfuAzkRDtUdtf
	bkIYmpNRcqEXyqKk4m1YcQfE+nSyaXa1KirfRBfYvEScluhpvWmU7JFwxWgKD1ROWtglYlHaJxg
	aslhzI8IojYsVCHprRr7yow==
X-Received: from ejsh15.prod.google.com ([2002:a17:906:584f:b0:c49:af9f:aaed])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8e12:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c4ca7a4e646mr1054401266b.11.1793723465485;
 Tue, 03 Nov 2026 08:31:05 -0800 (PST)
Date: Tue,  3 Nov 2026 16:30:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103163101.1696520-1-mclapinski@google.com>
Subject: [PATCH v2 0/2] PCI/DOE: Speed up mailbox polling
From: Michal Clapinski <mclapinski@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

The DOE code waits for mailbox responses by sleeping
PCI_DOE_POLL_INTERVAL (7 ms at HZ=1000, 4 ms at HZ=250) between status
reads. Every DOE-capable endpoint goes through several such exchanges
during enumeration: an abort when the mailbox is created and one
discovery exchange per supported feature. Each pays at least one
interval, even though devices typically respond within about a hundred
microseconds.

Patch 1 fixes PCI_DOE_POLL_INTERVAL being 0 when HZ < 128, which makes
the polling loops spin for up to a second instead of sleeping.

Patch 2 replaces the fixed sleep with an exponential backoff that
busy-waits briefly while high resolution timers are not yet enabled, as
is the case during enumeration at boot. Time spent in pci_device_add()
for an NVIDIA B200 GPU drops from 45.9 ms to 6.4 ms.

Changes in v2:
- New patch 1, fixing busy-polling when HZ < 128.
- Patch 2: share the fast poll with pci_doe_abort() by moving it into
  pci_doe_wait().
- Patch 2: replace the fixed ~2 ms fast-polling window with an
  exponential backoff that busy-waits for its first ~255 us, but only
  until high resolution timers are enabled.

Michal Clapinski (2):
  PCI/DOE: Don't busy-poll the mailbox when HZ < 128
  PCI/DOE: Poll briefly for a response before sleeping

 drivers/pci/doe.c | 49 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

