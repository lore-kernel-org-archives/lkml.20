Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304254D9554
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580100; cv=none; b=kkipDiOF3f7cLFbttUWTcPxe683OUNnesXalNPgBtw1RVogspH9nuoL+VbNCGpKwJMjA3xUTsLYU3AUvbaaYZLJgWlxKndLBZPSADjpWjfL6W2g9BJvrXBHWCiKH2Anz1UQ1M+NJsY8KwUHPE7ZfXoixJAXqRN/F/kTNkLmhESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580100; c=relaxed/simple;
	bh=pbWiPxiQInKuj5bTFtORq9m72QKi4BBFkW3huAQwTGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXWA+ptBd98mcWqm7BBti2gRDHwF9OicE/KNABSoHJHvVUVSTr9BrodHqJm13gOF/yMTJPBaPL98qUfrFh8QcB/VuVHyM5BeAfotcIueEQdMXFk5m3mzoCm2gFu9ZjzCxGMNbLJhltqOSMFc1XVYpqERjR6aHlgZvp5R8O90TKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+jigOvX; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+jigOvX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so513478f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580077; x=1790184877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TP9Q4QkeKPg/kRB9zan/QUnpnRo0dK+31LaOT3R+N7Y=;
        b=X+jigOvXb844rOIp9scXQCgpo2sYfoGdYGKyoBITcAaSxkqNBmIhgbKckmNFeldTRf
         uH8IvjsqxgxJ4kHelFL9HDOqZT7xFGpLlEFLnJodlCTd6Yy33Wa5OD+DqyV59VxD+FzA
         0HtyRpkNHrQdvKE4y17u7K9iMIH6ChwWpYaYkPG0wiiHQCHiMiFyBO86RdoxDWNFoM2L
         MIPLH3JeJrFqU9fR6pVBUbbluYHIPq2rMBzveycCCxjryRQHUyf9e+G1ZLuYilzceDF2
         WwAwVfDDFlfeC0s2su0eehePEi/XzLYhZwpM1u1iG3n8UBzD5Nv4n/beVTwtGM/vByj3
         osnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580077; x=1790184877;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP9Q4QkeKPg/kRB9zan/QUnpnRo0dK+31LaOT3R+N7Y=;
        b=FRRmYphpQh1DspBJTeJ4VXonEBccroeSG6l+l89fS/bh+reCjtb6CZgRas6EQLK2GY
         kUGUI5h3SWtLxPvtlTftbDciFcoUe97sJ8SfgMtjUIuaj4wLWBCItPepW08garUeCsRx
         MaxknXFOXawVshPhkli6AaDH8gw3jPf/rERXM+tr+jV4sxBNyATXRxZldx2qWY6PqU1P
         DPWdHlBzV1i6ruddVjlYxOAGGFwDcHSSBlEG4DwPp0wEgMeLPiMZqjd3CkrYM3ulkmC2
         zwY6matFC1Px3HorUKUwWCOaD3ObVrwoAtRMQB2Dgdea7idbKDRUiM2CxwWqO/fJ8m0S
         V5lg==
X-Forwarded-Encrypted: i=1; AKwUvByH/spYYXgpC3BgcXiWrsHZqlD4mDDA9PxhGIPf5Y6/E59x31m4sjnM0L+0EWrsr0TrK11g7D/72IwkYdY=@vger.kernel.org
X-Gm-Message-State: AFuF++mCjWr/6zbSKhSU6jOnL4EKXqqOV7OK6KA6r/z4pD9e558cqkFA
	NcdyHZNYTTi014uH9K0V3sxyll5hQ3rsUf2uTMyzCvIFO2sg5p0FCmI=
X-Gm-Gg: AYBFou3tSMZ2pWR5BTzetugjpe1jZcBwke2UoisZ5GPz70qv5CcKB83Wo+cZJ9w3ZNT
	hgaAKIf7XbyEDmwOGoFWtpJXJ/kz6B2scasNCq7/6AFTXgIfQk4qw8mq5j9Prqw6uKIqFmAoSDJ
	rizp5POrRf5t1UCh5Ty3HyFpnQb6k+tnoc77tAEwHJJSbC11Eo1FVrhG0hnLMOlfUGN3gefgSS1
	9SzsMbIzFSoeJiUmpIH1h81V+cPp9phiHxGtcFkheMtARooK/ksUoo0MOosFq5BqtYzib/E2EFz
	KnDw2/1aPaOESrI4yTqxYYPdwOCg8mMdPAfEttr88Nvxn6pheXzJkguxY1rzxteDucH+RIhzpaM
	OhwtK0r3iYgaELNrBGUafqF4TdqDXQQSJF3WgKCE9I4A7nw20ThXCUvti54CvfQBs/F3fZIOSyH
	OIh/1u1feLR8Fpu4K4Jxe00E6v29MIyuIph9EasnT+zMol7bQ8X11vcOw1M1mPI/tDJ35wq/tX+
	Z+u3sVueEPNP4SWygGA3KavZVPnphE5q3mZkkFB3YR48RBShsNWFcW2CRqhPRbL/N13gXRNiIYH
	P7GjoGLWqdZjSP8=
X-Received: by 2002:a05:600c:3e0a:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49eac46392fmr43178425e9.3.1789580077291;
        Wed, 16 Sep 2026 10:34:37 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:f23c:f0c3:c09d:d6d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm8987544f8f.20.2026.09.16.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:34:36 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"John W . Linville" <linville@tuxdriver.com>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-next v4 3/8] wifi: ath9k_htc: refuse a command that fills whole USB packets
Date: Wed, 16 Sep 2026 20:34:24 +0300
Message-ID: <20260916173429.403889-4-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
References: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The firmware ends a command on the interrupt OUT endpoint only on a
short packet, so a command whose length is a multiple of the packet
size is never delivered and the device stops answering WMI. The
previous patch removes the one such command; nothing prevents the next.

Refuse such a command in hif_usb_send_regout(), where the packet size
is known, with a warning.

Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/hif_usb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index d3491ff08e6e..4b57cc2f3d6c 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -99,10 +99,17 @@ static void hif_usb_regout_cb(struct urb *urb)
 static int hif_usb_send_regout(struct hif_device_usb *hif_dev,
 			       struct sk_buff *skb)
 {
+	u16 maxpacket = usb_maxpacket(hif_dev->udev,
+				      usb_sndintpipe(hif_dev->udev,
+						     USB_REG_OUT_PIPE));
 	struct urb *urb;
 	struct cmd_buf *cmd;
 	int ret = 0;
 
+	if (WARN_ONCE(maxpacket && skb->len % maxpacket == 0,
+		      "%u-byte command fills whole USB packets\n", skb->len))
+		return -EMSGSIZE;
+
 	urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (urb == NULL)
 		return -ENOMEM;
-- 
2.55.0

