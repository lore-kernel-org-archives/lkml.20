Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637776;
	b=vLzSwiSwljurMZ6bhEbMGmORvR+KNbgZjK7hhYWuDpouHsW9eJT7YzSFqRBsQI1Qr8uJ
	 ghscVnHAyLzyN9NGop8QRkaRnV+cBYgSGL03caVkeFeJ/3gOBxY6Iy+qvUU/jwLxmcxZy
	 mARHnu2VWphfykRUq2Njm3jDNX8uvPrlwkVyex7b/jYGerXpxItrQUVTR31/MHqzkvQh6
	 UxXlVgGtaDmW56qiUOKeGWGgPA3fAmq9rDDiqVLuvXWTau15BJavolk4vnJ6Mbrxny5Ug
	 2VAYNx8hayAmdPEzj6bOx4NTTm6ftpLnX6v7ogSJLa28hZWjrhT6RiWmDbjuP8qyzKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
	b=LfyG2Ptu4/WyGbV7MGCS64C53xbplj8DIqexLK59HDSO9citza6bi4K7Ww3ufZAhl3wR
	 6wq4MDLxF+oNQtkA0PCKaIh/PPRYVRDOuqFyfvirc8Oy23gv40L1/O5GklGdOcCwfFpQd
	 5iYzchhUrF4J6TmzaYvUqEtpmpZbIpJrZVuDQ2cDrne2gpXF8/Nn5P2bb7HQXceQcKvXG
	 iTfC9R+K16GV7AwYrxcxDV7Z4gYL1ayGsfuxIY6WcWcWIc1Gf222yG3IzDHyBSXpXoWNW
	 RMp5uxBjK5JRRlQuPDa9FBlpJXHm2Dis4kp8l/Y8hwdmGz69LQrgzWyOY4Oipub+yuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdakY2AI;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F8606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdakY2AI
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso27778055ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637775; x=1795242575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
        b=wdakY2AIl5dU8gPIjU7P1qXU7P8hQIaIlWiyB6RVVH61maO+QZli+X7JbADKU/T3Xp
         rKQd1H6/6pb8zkAQg3shBm+UkilFvFahy+IeKa/ixDcE/oA70rgmQ6elP/E/0tqnzEOZ
         KfbjS0fH6qTekJXB3Mu2Ewp75BgLqUHpYzBr/9ZNRFdEyFlscqlnLHlqBp/onsXC2XDp
         t2jT/IHOLZ7OjK0SiLCFfh4nxGVGEvHHQJlEbwXHzmXgS2WBMNPP1ffIO06WOMjmGNoR
         02VHm3oOWmRXL3iAOCnyvR85hXKxXDafrJMW4l8RH+mFvhCnNYW+xSA+o/gPN0WGE0KG
         ZY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637775; x=1795242575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
        b=fotpLnHL94MGFZoLaJjvJ9tABpBIpF94MiHpyO4S26BDF3GkwJpvEJNzhqyJZJcyPN
         102Y9u3EeBnII/tdoScWhXBJPMWIDDqNj17x4fBHvMt0tsiHk/Lb0NQxRfBSB4H3H6eP
         aC/9ReGX1q1R4/mmfPRpAi5geTrOrJczRbEem0t/DiHrUwBE0xbUWqduMI9AAIGeJEPA
         QUbltmmBuIWi5EBJEiLsi5ggiO/xawpQLX5HulNBOTy+mXCBMXL1A13QFRdZK2KMsZjs
         2A7u2zPxRfmHrG5ADizcMINufmGUvk3yfzz+ooliHgbY40xD9IDsSJUKi1YT9q7yT4M9
         +Nqg==
X-Forwarded-Encrypted: i=1; AL+hErGT4fFll+7W+lkX299lCUhb6SdfRu+aKLlxD6JY14cSRsoKhX1lLZAmDBC/2S97AzR5xXB5z7duovx7hTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CQJuca5dGoB5JwbaakGJ139YFrOdmY6W3Pu4s4/f0Hr3baEBr
	ZmV/GS/2o+h//jrlfJA4UUGjj2JHs0qdhNmrbb8psXk+edm+tiCO3IGg
X-Gm-Gg: AYBFou0y5wm4iuxQitONludkY3NKJjH68C3ZimMuuwmTazbCSPkQliI83wauFsfPhwJ
	jM9YccxwhLuKShjThqRQcEo+fuykmf/rktG3TguCEfhVezWWBlZlxKTLTrwQzxqPWy7itY45jKp
	9TnI25V8okmHZLA+voL1qHTSaxNO8ftlq8buszZUrW3UNElrKaeEF6x/Q4qUo+E0AIgdqUMGcnF
	alzc7MRQmE2xTdj9AOqUOvp8fOIEFzx6f3Ljq68qdccXjY7Ves3HqScWwVIqcYA8A2tagaZhaQP
	CbCpQaMssHcHwLDk9sDL6+PY8lEEgxbH7NUkGtIAzbb7kqKHT8LfS9b7n+a5abGgPqseEWiM1in
	PcoHHYyiEg0xVWgf2jb52pYcwe7SqwtRaoFdBCyl2Ry/v1fIOKL3T3Efy+KGfuaX6GprWbgb+Sd
	Om7xjyQYldtyNzCD2IVv7SrGRNSWJrD+YuybiwJ9WbjcNA7kxLJiThglnmevz0PeqMCBe7NYkQs
	5vw/NGJZbz3GkDAr9yS2eDodDXJic2qwScgcFIzyLIbbRebsw3agAdLGXlN8IkB5pg5XTNrWuFW
	DREmrRNn01hy99T08KMylNnlfl0zbJLPQB1xAwdsh24aoAsV+z9W2SX6rNNkP4g7bI5QP4qJz8f
	lat8ZnQ9du8eaICUcdOvBY1is1fjFweBm3vovo8fuX1bEdmVNDFBdcMArPfSE4Dn+pwgXeGFUnV
	r2Eg==
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr52433425ad.25.1794637775107;
        Fri, 13 Nov 2026 22:29:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Fri, 13 Nov 2026 22:29:24 -0800
Message-ID: <cover.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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
Message-ID: <20261114062924.U1xfNKsGHFfGPsOYd4Tu6FhUdx7NwG7U3zHEnt1wBUQ@z>

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed as unsigned into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
 - charge_control_end_threshold rejects -1 and 101, accepts 85
The kbd_get_state() failure path of patch 2 was not triggered.


Rosen Penev (3):
  platform/x86: dell-laptop: Reject keyboard backlight timeouts that
    overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Parse the charge end threshold as an int

 drivers/platform/x86/dell/dell-laptop.c | 30 ++++++++++++++++++-------
 1 file changed, 22 insertions(+), 8 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

