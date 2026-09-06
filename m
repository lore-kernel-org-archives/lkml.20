Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00762384CE8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673442; cv=none; b=GD2HbyM+HvSRpXCtRJz59VTaiiYJIZ5Mpi3xF6gvDjXtmInh1hH3VgqQYARSFVKC4wFIPrg75ykdTBlPGDvQ8Uyh93e2/mE9shi44nBYN2Am1iO0S5sWLJfYFk0hJNS7RTHArtc4DHTDQn6IegkXcEdoUcDFHcSxp3UyMcFHrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673442; c=relaxed/simple;
	bh=+7nqH51/1OdHpCcWbSJkBnwhzRrc5KxfkE7iE+q5aJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQQn2HQINyPePphuTzKlI9kxqY9TCNxWp3zeY9H0eqOi3PRQJxJVFyFR6uIq48ga29Bj9lWkmB9wu6vC0mxsJZgrVuls5lW0zDzLWKTR/MR4tkxbLEokxiaeNHjt89q0uxWHmJJbdqt5mTzZXQiqbrq5l/2uDg9pNTCtyiZ8t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=We3Rgt+V; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="We3Rgt+V"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1912843a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 22:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788673440; x=1789278240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOlpr3i4pRMFaX6G1BU2/mCS2v2PccHIfgN4ACh/VAg=;
        b=We3Rgt+V5czegZON79whRbQPtXGmBpL/++Gfgc02c9cuwMaLg+PAIcfcdKR+ZM0DTg
         hQo7b+xX5c0sYIVtyifv8Rc5l9fBqzZ3zM+84XIA6IcQnbIZa9S67VSSRlRkgneQIPZn
         j5Wcfg0KnN5xYhnd5aJAvSgGIsRz+FpAe2kWtIktb1PaWuZk1XpTs48sCjhfKrstEanB
         7p7B/r7U1okT6/PGCOZR39G400IdoP+G4ZuoumHjx+vsRbcm9BRP0OKAWZNWSojMgXQE
         hviV15GkWOfWrHdLyGkA0a2GMYZzBAanmHuTifdgJwrDaIw3zQ6AI6kt6LJB360iwVVZ
         2GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788673440; x=1789278240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOlpr3i4pRMFaX6G1BU2/mCS2v2PccHIfgN4ACh/VAg=;
        b=nLw4sUAMN7VKlWgrnqe9mWFMIOkWn38RQBU5OsB8rsGJbgoOQlqsveyhQYL/m9J1Ye
         v+vuP4Yw1C+2c95qCk4u/O9fSJq6lNIHfor2i4ebBliaN8hFR+rDjzxaIhiIPItj/FZF
         Wt4wJuAVJKuBBP5m0S0gCfi8p9ne0IeuJGDCYV1KyFcCPwcP3cAA7XeSvj3+g4LrHLV/
         a6mOdQdBCiWuRrryqaY+ZoRrl8T1lsqGc9HoZy9G2Ul8fJXVRrFWmj6YpVliHE/yc3sb
         QNnbCIE1qhX3wIT4ZQvlRknqEGCwqBDEoZnr6RDGkrXdU6KAtDTArXJnrauq+RiHNlgn
         H7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfFrmY31MaqbQNTAfYPA16/40Ur38LNEZkMfYfeEv0sfTBYrdCD4+yJKb3oQSYUpvuvrHa0q3Ajg6reRc=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ZVz+EePU2MRt2q/mtUjtd93WyBDu9tQjLAi8f3oHY+eELe7y
	vELEviYR6YLe7Xl5iQCQL/kUHH9fPqqTb9Q27d71ke8z/X6Yp2YBQx/nEm9OsQ==
X-Gm-Gg: AYBFou1BEvUlFgS2wyU/Jb5H5w+p6gge1mJp9D9MuKC77rjJ1NdCUnlAiewafAZw+U+
	UK9zsYz5qiq0yzF2GFjaydlRvNu09h3mENmu0uswJ8EjJlEYtgfsch7uWEDYYlPFZXVhFiAbCAu
	h9MteR63sUbQIidcU9K/3yQRSmXXqfuGBhcyZCHmG5/XX/4k8bL1boYfKJxWwJPWGn/EobQ4VwY
	QOTq6UFBQD8aiw9IaLAM9GlVt4QwPo3PEsM9wYXoM2N6BlXgPUOUP801QSr+XMzBDv7GiJVmw4u
	fXLxyxHTvjgPs5xLw0yoXnxpee+dbUPgkCOxE9FWuVcgegmfH/c6J8BCFrwb+sMit13gaJ4SMFz
	O+u8o7ZBNAIxVcZ0figFPEES9wfiTJqH8GQCuUlNK/F3KNUeIQ5oANOR4CaI//Rbx0HJS3D2oBG
	PQX2/vuvpj7C7+PnPhG/XR0s0taHDjz+Ennw4c2+O7nSaKdiCRbYYx7hx19E6VhMt4XH+ke8iAK
	IUk+4/75+Np7HGGV0Ol4LVVZypAAlBrZ1ogJA1GWBU/UW47RhDA0uNPZpue5B28
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr23457699a91.13.1788673439728;
        Sat, 05 Sep 2026 22:43:59 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:7136:e816:e198:c7e0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm13569418a91.9.2026.09.05.22.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:43:58 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz
Cc: kuba@kernel.org,
	johan@kernel.org,
	horms@kernel.org,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	michael.thalmeier@hale.at,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Sun,  6 Sep 2026 11:13:36 +0530
Message-ID: <20260906054336.20187-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

frame->ccid.datalen is read directly from the USB response frame
and used, unchecked, as an index into frame->data[]. A malicious or
malfunctioning device can set this field to an arbitrary value,
causing the driver to read far outside the received buffer.

Bound ccid.datalen against the maximum possible ACR122 frame size
before using it, and reject values less than 2 to avoid the
"datalen - 2" underflowing.

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/nfc/pn533/usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..d08d3b0df988 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -322,6 +322,11 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
 	if (!frame->ccid.datalen)
 		return false;
 
+	if (frame->ccid.datalen < 2 ||
+	    frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
+	    PN533_ACR122_RX_FRAME_TAIL_LEN)
+		return false;
+
 	if (frame->data[frame->ccid.datalen - 2] == 0x63)
 		return false;
 
-- 
2.43.0

