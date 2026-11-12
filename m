Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489554;
	b=ivZUzegB9enq+SbXwcQxCSI/4ozEb0V3T1gSNPNOH5iUp+zlNwnSlxZKSsIRjRnAtKFP
	 dzEm6U++FURf8HzKNuPhDO98zXG4+1GQr2/hmdA4gDcMY92Ah4sPLJll4niPmUoiKkWKH
	 59LSSnO+wL6wF6ZiTJnAo8fJb21pSY5/AVTtoO8PtYglSjdxGzQvHnBkBPPWLVf1MW1eb
	 EPHq1mJ2P7WcyWkXhUdPMq4+r52SQVwYe5kcIM8MX8hu6nTuDUBsp57x+OJ3WCVRtvNzY
	 3WFXDXtUA5oBTbPEqxAe1vtaJe/XR/0BoyD6Ra3KM8eJEplPtmciiBsB2jNgMhuVigA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
	b=KxF9sHjXFHQtSLBgvahY6ugNwk4hp1F1SBSEVNHYLOyNighjcn3WSxEqUNl1Dm5wyCU+
	 j4ZWkRObY6FwvaUmATIYJzaGMQR7yViNrLjbtUBe7nw7I1XPaGlZD+CwrSYRf8Fyk2spC
	 BC/zdYQ5cEK3D5OdOA39dzB2ihM9WkMlIcixACFHJtVb6FHy21zQ2GdvQoe/gvJY53x23
	 qoCqOMhwczz6PaTNDeC1IJ5PTjp+ng+yPcehWQm9HZlVdouEelpUcchFXtFKuO6Uvi/Cz
	 7UR0YQ6txrzZFS+U0uc2Nctqg2D4pAwTsecTA6q1Xqak+jES6LUdK7gvkZMP59kCYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lZ/otIYg";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732DA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZ/otIYg
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4c9abc1824so600895066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489553; x=1795094353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=lZ/otIYgy8swYzUCNzfqXiyQGMS1Iq4ut93ebgQEOQ4zpt/EWBbolzUlT9Rv0HrHTC
         VqeM/mt31B2MFwC8NIbsu2wkVp3h3Vs5kJ7a947VCVrZFA/6LWaPKw+9vJUrfPpGmK50
         fztZzCQ5azFMSkUMsaiqxLC9ezJZMP9EjnLfyVCTMBCxPONxFfoCdD4KxKUv0hP5cLBb
         5rK59OOYRy/mw9SF97n3ITUDZ0YB/Q2ZBBefGGIYvkA3EbJCWslWO+U/jkkonVinVgX4
         EqwMPVjD4sz9xh5QGSVklVRYqnxkzPNgbZs6qq3whI+MefP+FZ+kry6CWYUKeXQlOhbN
         2WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489553; x=1795094353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=XV+CuRznCrLu2hTPJXqBCieayg+ElJRavrSSH45FYCG06vZ0r3U1ene9JQzbpVJs1M
         XWyWiL8LxspbjDVie2MWKp3eIe2V66fNRV7XkqK7CR/sEt3cQZzSwQ2ave1Ueofjscpp
         ASORyJBRSKNZr7iv7pz5o72pWOKf11I6SRXTrvEbVdHe32qtS2pW5+XFGN1XPzwUu25l
         2a5xbV5w8n/MgkAaXSeft//mgrHBRakBJL0Q6SrG9zCivBRHXSh1LCXGkm3fmzW+4XUB
         pEojxZQaHLFhyXp2ouatbZqI4hBBGJvtyqgkkNxicS5dvoremgU7LCTRSgfB5vOijS7Y
         z8Og==
X-Forwarded-Encrypted: i=1; AL+hErG8Q488QttX8iSriZDZtzGYiPvha4xaiQppgcG2TdWeyu1sAe1CSc0C2AOiHFbzeqbxsgVWY4Al5/84mXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4nyHCGpJQq3bar5rEwXWVt8n7aD8cmEmfkdng9/CHnObHKjqo
	8IS5peqbOxAtj7xRbZJoIDrzbWg9yUNtooRxX9HxsA4kgxyqiJbVxL/33JXVRYSG
X-Gm-Gg: AYBFou0iPvCKyq1uUWcQRoEceRepcQ3HA6dyRmJ5GzOiljtEaxcThT6yClMH/ZawrKc
	/hbdq2LxGbiS3quucbkULiEX5LAf31lvq6wnB2kF72fbTkGHzOa9bPvtci/nj9xPdzndvVtuZ8J
	GgU59Aym2KS+setZXWCJprjh2BkqVmwq/8FDoChxs6BWuRGrFrKfjsmL5fMlweqDx7Wcq3ZORtL
	gwWLgcwhE1451c6K4aARfIHESqyy0ctJ9c1CCSSpiLFkjLS+jIyD1n3kTnbv52CimQpChbZlopE
	V0p++TEMYcZ4eIiKBX4xrZoq3Owg2QRXRmIj+V3SlpZE4IanchQE6181CWLsadPBoxr7DsguQHY
	33Ye5UkOM3qyvO21vn5D6ii/BWvzyOF+uAzGYOYa//JkC2zUOGJnII5AvOpa/cHBkL40PHW0VW4
	LzP57UlCXSP0Ntac8DC03I3Gk29v9QqOYFHj9YY5JBlUALK8t1uXNN0q4y5ehLK0biliKAGs3Nh
	qtIwHHtyDzfRq8L/eIxuTIH5qa08IsDQzLRP2TWuHox5j5vK6Zap8qCP0U3c+95D6Mtfaw+gO56
	U8A8471qfTGaXIFwl+HVo82xBdMT7hVNSTKTvye6Uf/NLXyW9qJ7KAA=
X-Received: by 2002:a17:907:9811:b0:c46:8b51:c17c with SMTP id a640c23a62f3a-c5066a83305mr467351966b.17.1794489552581;
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6dc3sm350140366b.6.2026.11.12.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 14:18:59 +0100
Message-ID: <20261112131859.339060-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195559.160650-1-kudzo51@gmail.com>
References: <20261111195559.160650-1-kudzo51@gmail.com>
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

Hi Andre,

I have now run it on a BCM43684 (firmware 17.10.188.75) as an access
point, with the logic of your 4/4 and this patch ported to my tree (its
tx status path is the BCA one, with the flowid and generation kept per
pktid), plus counters for the test. The AP sent a client a 150 Mbit/s
UDP stream while the client was deauthenticated 60 times.

In 62 flowring deletes, 2130 frames were out when the delete request was
sent. The tx status of every one of them came before the delete
response, none came after it, and outstanding_tx never went below zero.
Here too the host saw every status before the delete response, as in
your BCM4377 trace, and the generation check did not trigger.

To see the case itself, I then held back the tx status of a flowring
being deleted for 3 s in the driver, so the host handled the delete
response first and the new flowring of the reconnected client got the
same flowid. With the generation check, all 531 such statuses came for
a reused flowid and left its counter alone: at each of the 15 deletes it
matched the frames still out. With the generation check turned off, the
counter of the new flowring was wrong at 14 of 15 deletes, by 787 frames
in total, and went below zero.

One wording fix in the patch: "This happens whatever order the firmware
sends the two messages in" is too strong, it should say "This can
happen". Without holding a status back I have not seen it.

Kordian
