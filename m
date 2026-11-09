Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217479;
	b=SQbt8vJ3c0bJFT+zGcv0DW7fJAs4UBgDm1Y2PZcHCgo+k9jqtu6tevjNi9zBH0PGiNL4
	 ZankDwTXiUjvBXlYbReExgYbC4/VWTeHIWAsS7JEzkUNW+/l6n+F4n1wcEdC6Lrk0uTDz
	 MCbSua/NkErexDf1AyMlVMZufX+xQiG69pqzqj5tGDgx8KWLi3WnsieuW7p0RC4MwqvUN
	 6gYnRiMq9XiL3DQsTwn7baV+Nih/ld6l34e0qMYVcKCTstytM5smaaeXzCHjs7KyD5eo0
	 dmPVWIGRQOv2xzWd//5gvahCLOA1ZhQFwEkSOuyvPEaXnzPKrCny9891wZRlgg++lLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oj3EKNGG17sqpOqktYRe++Wt7Nxr9RGMT3w7eUeplg8=;
	b=d7YKV4VyMYteRvbtMGoIqNifSZ0KILbciOJk+vYDCGq4vTMROAQaLBY1zG05YqH81m3n
	 X2opeF02jiiypo7ZKoiqZg2z2/ETRANH5KyK70f1UyJ5N31YKw4CDtlugHzR40VCBbMNF
	 UKjHPdKvH3EWVkw0udajspgOggov3ElEFjx0X4kCR1uEZsnBsVAV1GdVA6fz2aYZmRf2x
	 +fohjhPsnaD5LO1RkHkj8kPKNYSg2eCC5JBGwk2bZ4X/LY1qXJRwivJBAq1OK5TMlE+9C
	 1EchSrqn+Pra2p/Bieyk/j6IKZCsbxRYGQHrpcaQsf/ivJyVxGVsgzouiKG+1xfeelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxEawyRe;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65785606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65785606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxEawyRe
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so97937466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217478; x=1794822278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj3EKNGG17sqpOqktYRe++Wt7Nxr9RGMT3w7eUeplg8=;
        b=QxEawyRePq1HxiXwiY9Gxec4QQmFKhN3WPgDg1Tb57J24N0FNdOJ0f70p1Q+VINtki
         UiJIhugZ0ITyGaBXN3tfcymhEQNwJ5h3UE76spHbI6Yece0a0Dwm/2SoMLh8vG2ItRaA
         2YXHeWZatEdJsKv+/mdxxIvqZcL0OJlc6J/dsr6tQXk+Z50mCMbVaYAhkEMcoxdd9BpP
         Q+mrFj4PUkmLV1/Ci0MITaGqYfGZ15yba274xjsJ3kUfzohGiGraWdt1hOAPgidRZ5o6
         OQmBa96obqWpiuMGB7iRbVPwOhaHydBite5W6pxh3ycxhQ4pvLlhN9zuT9YgX4C7flVl
         ic2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217478; x=1794822278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj3EKNGG17sqpOqktYRe++Wt7Nxr9RGMT3w7eUeplg8=;
        b=HOwbS/ECyPPMnQKHLtp/JCCHcSnm6lkatJ6V+zn1qKkFEU6A0gemEhJkK+ci9AFrYq
         c9Nc1X5bO4IGL4/JKY+Y30oasxB+uzssyZjuK7J+JeHWNwzzA3ER+HKAKAK8x/163E5I
         Awxc0S/KaZ9GrJojIeotpp2pCoqq71/kg3vGLFNuTPuCshV5Y9xeCSmnFKb6ocS7vrOj
         4rutWIiod9RLMUGifxZAox8T1q2NJwaNTCGoKb2cIpt5sWBt/AwXF9lWyJhe2dTXLz+7
         Jt8lNolQdj9lYFKFGs8fbXzBSDONKD8aYz338vpAqHnjJ5chCZi01jK+IK5Bg//VkDKI
         UdkQ==
X-Forwarded-Encrypted: i=1; AL+hErH+cLOI+eJd7s+EDEB4VQJs0WyqYW9nbpOeNFLzu8UmScCcQWZ+IfoMBLUFsy4rzNPTSDQbaIGGRabDN0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z87hYE5Fl8lZD/pA1wJiZo1DNTd7sz3JGE4TqaxICEQtWVWo6uE
	MHQUQJufrVa6DwJFGtkcMwCV83raBhssq7zgU/IqSBkUUzdcSgLXCSIe
X-Gm-Gg: AYBFou0F8PQ0+/Crolyf2S9MJEIBtOirXXMusH2XQVdDwbcHhyxAag86wBO3ywqOyyj
	hkd7ZEguN2xnfjgyDQFQeA0lC9OoPNxN2eFhblAj6lb+IAsPpOn+3VvwQ++AYUExx5eSdLv0Qbb
	pKKVCdD9JrBAkB8uELUEi37frQBHRgrEAew1LAhF9h3gLJw5sASyBXNIOx9BVJfdvT1UavtukXD
	djbBdhyY3xcQwhvXBoKCGmcqvnLjMgEhPOCkOvknvyDNXcFrQke382uSek5IJWznc6a0AHmGVhB
	1fi4omDifiIIdRC4+4LkWJD+fcWOvMyj5OddHMjqFFJ21uGTmUhWRt38FzQws550xyFfovGzUp5
	E95FX28K7FRD4Dj+hdRF/hbEywvEhB5CpF7lk5kYjvqFYPAStgfT8vzkKigXp/FNPeqxid5UX/l
	L2PbX89WjH5DeG1UiZCQppfgTisYyF9/+VzgCmf6TQrvVfG1iVAQdLXjgyuJeoRUMaIfCyprd4n
	Msdk70t7gcbQ6M8447XvJFkSHyvzyrTEArUxmWUHSLeDWoSDHNyeJ3gbCzdCkyfF03+oN5F9MEX
	UQXoYEXKu18WvJwhYrPpPK0e7EiYmIrEeuof+ywJKoEP7etkH5eg5SwP
X-Received: by 2002:a17:907:3da4:b0:c49:cd37:177e with SMTP id a640c23a62f3a-c4d6db58574mr238659066b.48.1794217477322;
        Mon, 09 Nov 2026 01:44:37 -0800 (PST)
Received: from torstein-desktop.internal ([2a01:799:3a1:9700:6e3a:d704:53e2:f00e])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d6a4753aasm137786866b.45.2026.11.09.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:44:36 -0800 (PST)
Sender: Torstein Eide <torsteine@gmail.com>
From: Torstein Eide <torsteine+linux@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] HID: lg-g15: G15 v2 LCD and game-mode support
Date: Mon,  9 Nov 2026 10:44:22 +0100
Message-ID: <20261109094426.1432465-1-torsteine+linux@gmail.com>
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

This series adds support for more of the Logitech G15 v2 hardware to
hid-lg-g15, plus a fix for the remove path.

Patch 1 exposes the GamePanel LCD contrast as a g15::lcd_contrast LED.

Patch 2 adds an optional fbdev framebuffer (HID_LOGITECH_G15_FB) for
the 160x43 monochrome LCD, updated through deferred I/O, so userspace
can draw on the LCD or bind fbcon to it without libg15/g15daemon.

Patch 3 binds the G15 v2's second interface (046D:C226), which is
currently handled by hid-generic, and exposes the Super-key-lock
("Game Mode") state as a read-only g15::game_mode LED. Normal key
input on that interface is left to hid-input.

Patch 4 fixes a use-after-free on remove: the LED work can be
rescheduled by a key press between cancel_work_sync() and
hid_hw_stop(). The bug predates this series, but the patch is
written against the remove path as changed by patches 1-3, so
it does not apply to the current tree on its own.

The LCD wire format and contrast commands follow libg15, hence the
Based-on-work-by tags for its authors.

All patches were tested on a Logitech G15 v2.

Torstein Eide (4):
  HID: lg-g15: add LCD contrast LED
  HID: lg-g15: add LCD pixel-content framebuffer
  HID: lg-g15: report Super-key-lock state on G15 v2's keyboard
    interface
  HID: lg-g15: cancel LED work only after stopping the hardware

 drivers/hid/Kconfig      |  13 +
 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lg-g15.c | 599 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 606 insertions(+), 7 deletions(-)

-- 
2.53.0

