Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223699;
	b=CvqjI2DJZW6U1zvS9lfJALh6Qy610t467qxx3UA4dPVO+XLOBzb0ZC1PFDVTLjpUTVqO
	 r34kZWZb2m1kk0yhcEPNz926w/xSSajElxqsBt6ybeStByCAASF57QjJ+fOBpYx9PIMMH
	 CTpn4DAK2maGL1E1OA/jRSTCK0+MtKYMT+zWMTXNOfXRRMBZBqJN7wab1JItXaUh2+exO
	 VG03+yTKayZsNzRYsg0xAT27wXSj8uwXGYO6+7wbqyjTftNPDkzdaAu/WvwDHX8bqeajK
	 0Clv57uMq18Ymxok6YBKg8crNXxbnnoP8HVifulTqGscgDKpa3NEUYa959gYUf09YoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=UT0+yQBOsayLrN6atTLY8tyBSlVzPffLUJWWTKwuDcw=;
	b=lRu9g3x4n85RxcdlDdyUCFg2X/B3ibS3E/ws6T9FgCLKvHXNK3FMLIPaHDYw1eoR4ScH
	 lQcBkK6AMxZ6XsA/CGRlGjWzXM2e3Svg6gxF1gmsB5VrTbbbzp36uHJddfxHjWzOZfNbc
	 t/c4Q+VO6BR9l3Vk7WDhJfxybDooJHUPUagNU39z9wOLnwCrkdwSXvWx0NzkHt9zXdDsm
	 e70ex4sZTgJ3SR/E0A2BsJOHlgFpwS5XF6aQCZPrAz/4frDs6h59DryB6b/egl3a2Zjmd
	 PCcqaVxODrSKnd8wizCkdqFh/wiLp361PjYuFH4urGm8dgzSYfypxIeOgwLoKyLxXUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+s6opWt;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0E606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B0E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+s6opWt
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acff56a300so6547731fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223697; x=1794828497; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UT0+yQBOsayLrN6atTLY8tyBSlVzPffLUJWWTKwuDcw=;
        b=g+s6opWtgnjK5WYgifmev//GuvXWxo1+PM2sVXOfWCfvDDT23YshSv7/5A2f/70oq8
         MU4A3GU2/2jdcwTfnNqD6qfgHpgOV9GGFCNl06GS0grWN7J0tUMtHT3gKrXlhh7kEPsg
         LFpNIldKHYZ0rNMLMjcZg2PJ2VJs6Gvhg0Fl9XvgytG2hW+Edmod+bWOXtGc/7acBnA3
         l9SZd7mJisV0//4dAPL85kCzmdiWQwWXOUUzmV+NMNHwd8gzxCEtaKye7zIX0A6BGzDr
         yNOJygAIsnhQj7pv2VBaB6StPQE+AUNV3C1SVHFMF++3Jj4LU5DDYWW3oxvDGpe83Lx6
         EnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223697; x=1794828497;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UT0+yQBOsayLrN6atTLY8tyBSlVzPffLUJWWTKwuDcw=;
        b=Jx9pYTSBp2VUusEUUZUCslWeXpfx/siPNrH1ODS8q7W1yuYC07pYV4dG7qnxI6uwpd
         H0C2892v8GWfEuNG8AzRUO4TPBsXzVdT35zfgCkihe+af8+4PxZ7EZfg5dNlRQ8Xhjvy
         012DlGa0kJnbXd84KKdx48UWF9FAPe2n+NDK/LRXHBc3EqZ02YZ02toe8rcP5bvg/etV
         VaOOUpgHWKWORVlzEy7BdIqsUWINLX3Q2MTNJ0aewq+jskMYG8Ko+DtZp9J3FhS3mvzS
         wtrr/eFqOJIYwrAnZNYct53cn2GW07QGTN4bWhkkIm71YS5cQDbaW4os2p1aVA/IwlBw
         R3Pg==
X-Forwarded-Encrypted: i=1; AL+hErGzy6HmFY3W4kBMTCvLTMjaqyLjvpSNMDyat3Q4Ap6RN7R3uFsXv+jf7Cgrk20yv1fIHNVAbTTu50EwL/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P2mNdfu3m6ArieBK1mAhMhj3G6KOKs7qsLO758GpAMAj8CKEk
	yOtsCnAZTDCdimnN33NXYfjYwlF8dFt/IK4w3QPvqanIfJBZj5ZPs+7G
X-Gm-Gg: AYBFou2VsjrG+iXctZsDhCIX7Fo4M0jqOe8iD17OgwTQkQOVQ6MxTatHV0Pw3ycgQpo
	OpfLIRzX872JRJXuI4yXfAH8bTZ9abLf2RRqIbhkylnzac1imEQDXy6V7m7FZGRxGdhEpOTJjyG
	sbNGWL9ULiE4jsTT1yYF38l+GbX91hLW5RYiGiJ2IG+I5uWlFLXqy2tZZ42lTk+r8KdMs34lxad
	PL2B8eCB5NWGWSPNXd5FSCKUhwTGV4XKm0B6XzqLQBqYnmXEBCLPV7n6pjyJP35uU0ojVf39WUK
	lfUqUFR5dqmLqtJDHrs3mLU055MRrfgNaXKLgDMDusZYX5N1D0btB0o7Ws/7QMXbmRRAHbej3l/
	+GzDXjldo0qHn0ilkJ8peKw6aJ65VNuawGkHe1H/Vd9v7G/xuiWxS/lOdAAyzMJATUvM8Y4fIvB
	pLsde1I/MhhPGdeAXgiy4xsJow1CMWdU9LsDDSB7TxJ4Vza56nFKsdfZONE3/6qk6anqN1yeO5k
	rMa5PcSxOZ5vSN9KZtR7Z/mytCJJrNkywzsIl/zr1qLDOi1jFjy6apsTIFHdx6GOea+xxb+v/Rr
	gGGh8Dm0L2VfhR7Tnyx1FpKoao778MRjtupJ6SsTTr8EIMgHPWuXXihL
X-Received: by 2002:a05:651c:e17:b0:3ac:8a38:130e with SMTP id 38308e7fff4ca-3adfa47a013mr9515911fa.21.1794223697143;
        Mon, 09 Nov 2026 03:28:17 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9f43a15sm8477161fa.35.2026.11.09.03.28.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:16 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 0/8] char: xillybus: Fix issues reported by Sashiko
Date: Mon,  9 Nov 2026 12:27:52 +0100
Message-Id: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

This series is a follow-up to the previously submitted patchset [1].
It addresses Sashiko review comments on surrounding code.

No functional or user-visible change is expected.

The issues addressed here originate from the initial submission of each
driver (Xillybus first, and XillyUSB several years later).

Regards,
  Eli

[1] https://lore.kernel.org/all/20261009074557.19996-1-eli.billauer@gmail.com/

Eli Billauer (8):
  char: xillybus: Use unsigned int literal
  char: xillybus: Safer access of unaligned pointers
  char: xillybus: Return error in fops read method handler
  char: xillybus: Rely on FMODE flags in poll method
  char: xillybus: Refactor flush function
  char: xillybus: Correct handling of wait queue
  char: xillybus: Avoid indefinite sleep of work item
  char: xillybus: Cancel delayed work items before teardown

 drivers/char/xillybus/xillybus.h      |   3 +
 drivers/char/xillybus/xillybus_core.c | 109 ++++++++++++-----
 drivers/char/xillybus/xillyusb.c      | 170 ++++++++++++--------------
 3 files changed, 159 insertions(+), 123 deletions(-)

-- 
2.17.1

