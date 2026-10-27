Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114692;
	b=v03pRG+13DiV1UMFX6CxzS8rDCQUcFMuQU5ZNMFNmL1Dh9POoTC75SCtad4xHJLSskzc
	 jw4OLrl2t42sKCiaf5z30QSrx33kbW22YYwsuRh7KotGVPds2T49MrqcBe6RBW6TAALE1
	 p9/fNAl0KB7CTg/I06oVteFRaFCW5EV2rCh74vXBaTAIDWwTBUnAB7qNDJz1CReOVFthW
	 1UAJN4seH+LO077zBtOK3bhGGJzbORWuxSKt6ZIFnInHbLaukNpacmqcd/htSCycufEYB
	 D/jwE6GsQDd2loCO1airKP55Nu8aNg0G2SVv3ohcZLbmC9IpbUnsrmcX4eHbOfm29ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
	b=t2/mYfITWDGrIxKImPXx7DSBC/ztGZuUcJdeU02NVHqq7Paglk1DP+RpupxXFw309ywB
	 D0W1YUoWzLdMN0RVQF9x3tEDT9cRtw0RnBR5Rq+8P9du8wq7rpO+9tw1kQNVHvvXZmOyc
	 FePqGjpzuD0Qw4WTeEgC2p+LZYrr5DQ6jBrzGaF996Aman/AEQtD2CLHre+fcoYCu1faF
	 nbWg077MPYkDvS8b/Wlvr/yuDAvkMCSuslSl92v/6a+AAC5psso14/jxV/1LAk3w8e3iA
	 twC0sIAMeMNIeN2aDIhDwiwvmFy0UrQLTvAqOMXmv76aMC+0RwyQkmpOta+KUq/HdFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkxHbJuy;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62674606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62674606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkxHbJuy
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso19322a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114691; x=1793719491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
        b=QkxHbJuy/qM/LhrbSPp2Kj7QYkqCAm8T1bDGfc7EsnVOJUWM5VcPkVLeRaEl2aJ1Kz
         YFC14qrLFM1/Kmzj9nG4tiqM2MZsTCb+tez5x8jl1QdiWjV1bwsxkHtOmvgf7TDElcix
         zoqx+OrTlpirSx44iD6L71T3XY5jgbJWXOcq645P70GZoiA/OpFasTlZE2sGdgK1r2IE
         /VFG4b6IVhfh6hF1ocLk6C5m4y3lmScpJ3yhsIM1VTgwIazm5LS7GI59vE/xgd5wVNU7
         jcTZsHYkYW2aaDuwweSDHcnqT2DiRPxKAoL8vDF+4B/wxa4YSwOV/KuGcud4zHzVcXTk
         06eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114691; x=1793719491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
        b=qxQ4Yfi08Ky+SbX7lFCVbiZFkCXjFnbzM48giWT+xHtU6PEElkpNfbAvXAqL11RXvn
         7sDrUOOTGikg6pJnrx04Arul56CzMpZ0LEnlGhLIrVp+KAVmtE2r8XQhHXjpvybOXqbp
         Y6SfEIM9ef5KyJTEMg/YlcI7ytXAt8lKIzpw1R5rEdNZJAnx4J11brXBLapHOYwj2SG5
         GS5QAxprqYla1/QVI3XKOoW5W+XaVl6UpPJLFlYfUa3eylhRaEOTU0ZDkiRmWNJV/4C6
         8wO5DOTXUUd5VsoPLXW12obH3eDc96LscHqolcbagnscrV4kWpiJurbURufkxfqwhrck
         6Seg==
X-Forwarded-Encrypted: i=1; AKwUvBwaaPkNxILIuNijKsWmHiLTvz0I1d0IHMLMz4esqdBvGj9DHOEyxDiBe9LiSgcM7xcPsbof3qYRFJSlLAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Db2KtMTt+QU8k0ulODlg4gh6Y5GohVghvAcWPfvX8UbTgWBP
	K29ZyIKW+hycNeJQSf55OEPDHZZGajUj5ayNpwelM6ttdg54o+mzUN3A
X-Gm-Gg: AYBFou2t32Fl8056X0jpieJ2uZnwa1+TDMyfiFLW60cIfTbElyYKRsPFzNAxuKaI5ON
	5QRaQSatnf5+CvGxx/nOfD2aC0z0OrNnz7XjEwuWk38RFDANT8mt9p77D6UUD5+DcL4BGcWCTnx
	V+h9Stmoe/jFFHJe5h7H+1PGwxwSp+3v3avi9Psb5EQzMCA6N1IvLolv6ZqGU1tN7FUZEmbBHnW
	53Wveh9hrN+sbAw3WqAl5pnUVt1NIUmsrRnsCY1AGxstJXwJCas/sBxJAceYIK24k0/LW/GKedB
	Ars5K/nJjm/nstCow54WQBX3cuWD3o9qr+kGRVz9OlYbZhuoVoz4b6TDK6V+dtRpPLWfAr8SU//
	bSYNPj3yegorj3WzIMQiwvWU6+BtNinrK6gfZH441SyxYuJiPz7kq5JOabGduMrPLhfsBBdc9KI
	yVVtIFQuJi+EUIiuTkKQQyaAtGyuekFzKx41WSVDisUl8UjJxZnxRQDC6zxRNQk/uSfnVwlgVE5
	gNsir1gHifEnegpVWNJTXV8/7xN60jOnNXX0UgmBAm8rYNn7nfMourBBu+m1dzzsHwwErDAnVzx
X-Received: by 2002:a17:907:9619:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c46bde828afmr1015997566b.35.1793114690459;
        Tue, 27 Oct 2026 08:24:50 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mfd: tps65910: Use modern API for poweroff and restart
Date: Tue, 27 Oct 2026 17:24:20 +0200
Message-ID: <20261027152423.194794-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Switch to modern way of registering poweroff call and add restart call.

---
Changes in v2:
- swapped to use dev_err_probe
- ddata is passed directly into handler
---

Dmitry Osipenko (2):
  mfd: tps65910: Use devm_register_power_off_handler()
  mfd: tps65910: Add restart handler

 drivers/mfd/tps65910.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

-- 
2.53.0

