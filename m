Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588399;
	b=Qv/hSJqiB8vNvO2b1SALBguebDklsvQCJ7HUzFzreB8BR6Q11oBtiQuH0LlDqtEr01ny
	 m5rDgVPXFtxUt228yPxlJk5HV9zRSPhSX66ceSFYxvL+8VGdwwe3cBJ2NEMmei/l1GfmQ
	 nW56Uuz1zrK/gyKBj/GUztvoTMcnoHLlaIopl9//7g6yHNOktlUmn43XEpi+eSBp2cu6D
	 dAW/q1pla22M89esei72d8Yxx9ojA7uUWoAnAm1ER1fQWFDCEjTAYDrORuqIGXrPN+0h9
	 Pceilt3EjS5TyRgSkwDtNdEHn07zD2O8G7vPbIXyuFLuK2DF13qoxKyghwJJsF4xa/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
	b=W1as+UESBBcCpe90JQqZFQg7PRB71SpaeMX1OSOP9NN7coYbMAI+KByuWsuJ0FcIdsfW
	 H5C87J1iG3FJcyjKFZaY0/mSkqXqmiZfJRFGYQfrvM2Zox36EXujnyR2TDYIXy/slK1de
	 bXH7PGhWB+ZmqxUun/+G1N5MR49HFk51+8E8IRPjeaZxafy0fUSMm5X19O8gjjD2aQ/9U
	 huJ8O7bmN/ysY2LlwFEkv9bYFLVofbyJ4Gce+aQzczP+kdAZzC9Dka9ObzSOdonlbluWV
	 jcOCqHk6v0MU6vT6VzpLdTTxxmQ7m0gWNowfvy921NbrxUE1Xxo/rujijGZ+mIkRHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fyhfHnL2;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB14B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB14B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fyhfHnL2
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso569031f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588397; x=1793193197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=fyhfHnL2vgB+Al2ATPFZaHH0oxN/5vfVtER8IQWKhOYBhNJT4FtRou7YxivrUyj3q/
         /nwzcxONL7tsdzu6Con8f7CAM2xMdFNlVyJAqfTIW8sh39WNInede+Y4Eg5Zh69OrGiJ
         IQM7UkpIOOctEq/2BwM7PDIPIPVVttoace+kvL4WGfc77/2A9+D6MtupCMTxRab/2Z8/
         Q2XNYMeslEdmJm0KY049Qy7mSASaa7hbwVcH5y0T1XQlCBZZ4M8Dd7wVCZBZmvJEzzf0
         fisK+iTfplb8kdiLOX/yhWZKbgqC3t4uWVJNU0xNe47VQ6+kMk8546NoIBfKmNiK2NI+
         XwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588397; x=1793193197;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=Yd/RsTusg+VvQD9fWrx3g6HCMnBzA49X38Vc20+zqvT0KhntsX/HqpDjke0X0paJaf
         0725E5mOm0TWFMwXleaFeJ6wSQXKMFuG4VScAg453XwGyurojFW2v0M0vhUgIx6/uNLQ
         RKlnJa2iMQ8UouSepoLMOCrKthQn1Wl3YaEzuHsQLRB4FmHSTqzs8NQIdUN6Mce8bXgG
         FMscuyIeGYXMuMQ06/PALtg7hH61sIoe+ZuXETFYaUqVB8tol2oNwA4KhDu0QFlRGHti
         X4kjbXFqoKoWOyVn6BsuusqOrX1Efwzj2E24G9Kyj6zwHk5VRjVXuzTMNk1fNHu/vUT9
         fSOg==
X-Gm-Message-State: AFq9FYJXI7PNQUtxZ4GdT3uOmklK+vREG7NdzLVLUbzUPXC3mpACf0gn
	HiBsK4dEqQQgkfP+io5zPZrDG7ql+ph6ZW0Do14broimuJIJYcHVc9um
X-Gm-Gg: AYBFou1/yUrE78/mulXap6ZqZ9VsEsr8IhPsp8eApkB2rJ0IrxN8GaTuXhIEwrVC9DK
	I70uAfwTjhopwAh8QzgXa1NXpW4uXjCQL0V4cxDAL0TrZG2wA9sZ6hZh90mY0LNzvJOCMFP4lyv
	nO9N7rgGovJiF9yqbt+jBb45U5LisGQr92p8X+v0jrwFbZz6UY6rHzprWq5d8hnZMc7u7rMlP1z
	twl7O9pztYJ7HJMiCzwKhOmZY4VzI3N8tGQybi1KaRnjG1f54a9spxLso2QAgLgNUt165bexhxN
	ssKSxcsK4o2vjAhFk/2NzJ+Ga69sfRfckIBbuHzWymo+aM6qow8hlQUKD0JFWpClDzEmOgRzn0D
	p8kvxzIKEDq8iib+EdqNoHnWMMm7nHVPOMSQOQVrjSFlpI/tjCFJlrMfumghY0Jv1f7cC3mYEaX
	+Fe8UBAnQlAlB8w0n6XsxEaMABhzXqo44xB+12nIH30CVYeYe2xWLq9dQ7wygAhaDq4colhv2pU
	YktD4XH1PJhN3qKEbzGoYN3pmbfOZLaheuWg4lasZQda0pdFAU2GYVd+IHJwCCrMyKMotyfldnV
	+RSK3Xd8iPXirqEy
X-Received: by 2002:a5d:584d:0:b0:48e:28bd:e010 with SMTP id ffacd0b85a97d-48e28bde4b0mr2656500f8f.7.1792588396895;
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Fix transmit handling on SCI/RSCI ports
Date: Wed, 21 Oct 2026 14:13:12 +0100
Message-Id: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAGm62GoC/y3Myw6CMBCF4Vchs7ZNW+TmyvcwxNAywhAF0hGik
 r67lbj8Tk7+DRg9IcMp2cDjSkzTGGEOCbi+GTsU1EaDUSbXyijRmeV+ZUfCRucqxyazGcT77PF
 Grz11qaN74ufk33t51b/1H9GVLpROK3ks0lKVQgtLwyLbhuXwOdtZehyRo9z0gDqE8AUHqvtvp
 QAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=2681;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=UKJg4b3SfR4kpP4oWIhEOgnGd98EBh9C3fKOCKd2yt0=;
 b=1NJHANvhrv+QQW8+t8rXZ8HELSt/2/6SELbVExz3/VnizRqtcgP50eKAy6UNf7GUmJoRz4YZ+
 q/+dgXcBcwsClSnKfz2cjoBWXVbYCRRGKs/PsjrY89rZYZBKgXjI3nE
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi All,

This series fixes several transmit problems on the SCI (PORT_SCI) and
RSCI ports of the sh-sci driver, seen on Renesas RZ SoCs:

 - Patch 1 removes the code that disables TE at the end of a
   transmission on SCI, which the hardware manual does not describe.
 - Patch 2 stops the TEI handler from turning the transmitter off
   while the xmit kfifo still holds data, which could stall or lose
   output. It also covers the TE handling that patch 1 no longer does
   in sci_transmit_chars().
 - Patch 3 skips the software clear of the TDxE flag on SCI, since
   hardware clears it on a TDR write and the extra clear caused a
   spurious TXI and a duplicated last character.
 - Patch 4 forces a TE toggle when restoring SCSCR in the console
   write path on SCI, so the TXI that restarts an interrupted drain is
   generated. Without it the RZ/G2UL console can hang during boot.

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-coco@lists.linux.dev
Cc: kvm@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Changes in v2:
 * Updated commit header and description for patch#2 and #3.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
- Link to v1: https://lore.kernel.org/r/20261019170139.473808-1-biju.das.jz@bp.renesas.com

---
Au Dang (2):
      serial: sh-sci: Skip TDxE clear when hardware clears it automatically
      serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI

Biju Das (2):
      serial: sh-sci: Drop TE disable at end of transmission on SCI
      serial: sh-sci: Keep TX enabled on TEI while data is pending

 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  4 ++++
 drivers/tty/serial/sh-sci.c        | 45 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 15 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-g2ul_sci-b610606ea5b5

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

