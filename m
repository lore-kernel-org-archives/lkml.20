Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488267;
	b=yTsmeBbiNC5y4rqM2r4dS+gdQ+MjnW5L/Dv4qGQNN5fOdbloKDVTLl4nr8YDGOhBDqbV
	 9MAozJCD2chLpmSd8aDyNVNPg60zs9LpPv6J9hPL7AK/4Kx7RnFyf/Vgyx6WOC9syg6iv
	 AcubkuGbzEPdHJzBLmAUGRVD4C3oxs5ltxT+NBziH1sHQWVS0ivLb1UWz7bOtGkcYlhp8
	 Szd4DLw8LFyUwcXiGLZ0eGYVbQ8SECgyQnABAZKCU+UxfianoDcO2Dqcg8bg6BVPjtJlY
	 iEmXF5GowNZLvHF2NmxsZ14YSLDXDsBPv4h7CWRZB/QkPUQ63M3bULLEinkrmtjvdyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LqYp2jDdq0W9fKFQk9ND3+DSgEsQdJquTqr7hfk12NA=;
	b=PVU5I86pU6ajxUNt6xIl/T2NByfDiqE/02CFQcZCa15a4homwmMiTbIh3BUdxA3+GJiD
	 Ucms6d4apWarBGfJUBiGtiS8P/X125w0dJThuUf64EITVGisFufh7mKua6PRsmT14wz7i
	 ZNUk41E98S5IRo5mScIbvJJejhnJxZjToQJ7n9DPvnyfpmZJsU4SEhnrMqVy0OFb7hxOn
	 XCanlN1gIJ3xyb51f6/bAOmtmD5Ddg23kfchS4NJ11w3DcUwloYd/2/eSOQYlPcuOsuhJ
	 vSmNlWgqb5NtnXUaVnG+25oIwsAabK4rbbjicT9pS4W3QXQZy0dn/AvmuFs7P+Ox1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dzv+rNNR;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dzv+rNNR
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1899703f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488265; x=1793093065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqYp2jDdq0W9fKFQk9ND3+DSgEsQdJquTqr7hfk12NA=;
        b=Dzv+rNNR5s2tn7bapmQt/IO3zO+UkMSOr6xNrXoYXJKCIPBaEPzR13dUcBLRsIzXjo
         25q1w+ivzxlzS3IdfUSPgbUGfu8WXFTdz8I7ZYIaK/BsFoqkx14CN9rO5Dn242Q3rbEn
         zG8Vu/ibkVgdNprGqCdYE8ppGg3rCE7eiTr0KI7SMAIao9KqwMLikK1QqCijp8tVYEvh
         Wjybe/P41OmVBjImmycIZTThDeNJRUkqvrz3LRmemnBmjZkFlycn+2o5AElc/iXyMzMx
         qUqSsfFLi89ZtJws7krKrOB+0ML4xGbVwYo2E1VWthgANO2IJukpKUZjV9bOmrYqFf4h
         z7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488265; x=1793093065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqYp2jDdq0W9fKFQk9ND3+DSgEsQdJquTqr7hfk12NA=;
        b=ijizeSDPD5VA3S9TbfQAS2S19x+jDcMhZoYdepY/62BfXdFTmbmJX34aEs50Gosxyu
         PYsksWgoUqbUjeMi0457gKKLKL+WKQ6OkmFQjRZGVcZ4B547wqtmO2Nm1YYTenjnORsf
         nFa48TTYKLdNicnGxyTvCQz4P8vvyjSL/nwEov/TbCO+5eaQl8/aTWTRSh4qu5wzOhlS
         Jp7VTsr84pR5FIxS+9Y9J3HZ1EJlVVTA8qfr/n281DQ/IwIlDJ9XkjFYje/SKj+3dyHW
         2woJWsXSLucr7xuuDtqpQWI0sVvTLJ0ZkjxSBgJMcVFWBC2Kje0sp5HBK1kzZxbN05gf
         EWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4v3D1QImsHXvnJnv7XhdBIbjAuy+9k60RjpNkdHwCXO9h2tqwbitNoVq4FEX3j3isn3mBgwtIQEgzYfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLywtOpxXQQ2oysxUwJ1SW2eiSLFTB9QuBlp95muP8rW0UEg7tc
	69xdVYCLUqpTUjx0Lc7C4CmYfmgLlWudzBHV672aCdtN8W1c7C+KqpCB
X-Gm-Gg: AYBFou0VsSeq8hZpZQw0unFbwTrQnQ9CJ5epjHbu/SFWKNgCVS+Ps5N8aWP3JldmJ1F
	Rbnp2+iaYmCPkpXAkjKd1x1TPG/VxZlIuQyHxk6mDTFWtChbcb/G7aoJGYyTQDROiGxcUaQ2NVB
	lkqXHXQY494JAbtVrNvhJyo6GOHWw2DFTiuCPqjgV0KbTYoTngiWR0n46d/EC6md+kYRdNP3VDQ
	yQKa/fb/k5sxYls/mtSZQ2mbGnRU4yb/B52dAnPn3MNvK8wYRdtHu2XtbykrIKjUH12hyMtl0aA
	GYcnIAt6H9aK0C5A8skSeWpGK0rnIAENHhD4KwRASL+Ygt5K6kQBGeSaOkeMkfcaBtdyAm0lA0S
	QKunNubGRaS9HiBTxU28cKA8VQYBz7XAc1+8JQyGjZBaDRg6l3PP5C7DTI9ZkQQwHcbqgZ6eK3Y
	TD1xWd3jsiygfBWXTrx2B5EeMadVoq3N7gvTq0a9Rcp7Zmkd2sH8pCPxDD4OK4kCOx15pgbyfoO
	xhlGqatIonRZidYY/br/5wGuTyKTxSKC3Ned/4kqw==
X-Received: by 2002:adf:f9cf:0:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48e07fa7c39mr12821637f8f.56.1792488264931;
        Tue, 20 Oct 2026 02:24:24 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm5006879f8f.16.2026.10.20.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:24 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v4 0/7] HID: asus: ASUS Zenbook Duo keyboard support
Date: Tue, 20 Oct 2026 11:24:10 +0200
Message-ID: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the detachable USB/Bluetooth keyboard of the ASUS
Zenbook Duo line (UX8406MA, UX8406CA, UX8407AA): hotkeys, keyboard
backlight and the platform profile key, over both transports.

This patchset is a collective effort, gathered here:

  https://github.com/NeroReflex/asusctl/issues/25

Tested on a UX8407AA against 7.3, docked and over Bluetooth: hotkeys,
keyboard backlight, Fn+F profile cycling, and the touchpad staying with
hid-multitouch.

Since v1 the series has been reworked with the help of an LLM coding assistant.
It was used to analyse the review comments and the code they point at, to
draft the changes and commit messages that address them. I reviewed every change
and tested each version on my UX8407AA, docked and over Bluetooth.

Changes in v4:
- Rebase onto hid.git#for-7.4/asus, now with Denis's "improve the
  driver support for laptops" series.
- Drop the delayed handshake re-send: Rebecca measured that the
  keyboard stays in hotkey mode without it.
- 1/7: check one quirk per branch and the transport in a nested if,
  initializing rsize_orig and offs so that clang still sees them set;
  use u16 and declare new_rsize at the top of the block (Denis).
- 2/7: shorten the comment and put it next to the mapping (Denis).
- 3/7: shorten the comment (Denis).
- 4/7: only handle usage 0x9d on Zenbook Duo keyboards, and take the
  worker lock with guard() instead of a goto and a label (Denis). The
  IS_REACHABLE() checks stay in C conditionals rather than #if, as
  coding-style.rst asks, so both branches keep being compile-checked.
- 5/7: list the report sizes of other devices in the comment (Denis).
- 6/7: move the entries above the existing HID_GROUP_GENERIC ones, so
  that they do not conflict with the T302CHI dock entry in for-next.
- New 7/7: keep the input device names the keyboard reports instead of
  renaming them to "Asus Keyboard" (Denis).
- Add Denis's Reviewed-by to 3/7, 5/7 and 6/7.
- Drop the Assisted-by tags, following "docs: remove Assisted-by
  references" in linux-next.

Changes in v3 and v2: see the v3 cover letter.

v3: https://lore.kernel.org/r/20261013104033.36079-1-p.pisati@gmail.com
v2: https://lore.kernel.org/r/20261009153459.124752-1-p.pisati@gmail.com
v1: https://lore.kernel.org/r/20260513163248.16483-1-p.pisati@gmail.com

Joshua Leivenzon (4):
  HID: asus: Fix up Zenbook Duo report descriptors
  HID: asus: Add missing Zenbook Duo hotkeys
  HID: asus: Force hid-input to bind to the Zenbook Duo hotkey interface
  HID: asus: Cycle the platform profile from the Zenbook Duo profile key

Luke Jones (1):
  HID: asus: add prod-id, quirk for Zenbook Duo keyboard

Paolo Pisati (2):
  HID: asus: Do not send feature reports larger than declared
  HID: asus: Keep the Zenbook Duo input device names

 drivers/hid/hid-asus.c | 154 ++++++++++++++++++++++++++++++++++++-----
 drivers/hid/hid-ids.h  |   6 ++
 2 files changed, 142 insertions(+), 18 deletions(-)


base-commit: e16927855d822a163099ffb2d6a449913fe9487d
-- 
2.43.0

