Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187768;
	b=JKFL4gtaVMuGpkx5zoLbS5fKkMX4nZ6MNtn61d25JTwFOmPPUI6d7BTXhLyLAqVaWvde
	 SA6uaPm4qqSpKWbveZlUdNBEWmf8KDdf9Fy+ipMpmliTsCPb9EWE/ms641VXUCIhyzSVd
	 dqy7O/e2D5P65BhxN8GK+ceGl1wci+v2FJUNQm+FqD+k3cyzPa+rL1QPCrQYiURU0l3Fq
	 sqgKRww7yqu+LSPgU8nMMfI4+aeAAo+h5GHEqd4+elIPxsukF/KOnHdgMsFRKXxNejNfC
	 xZ7C/2c7paJ9c5HT4s6xeeeJtwJs2Zgs8HpgJ5o2A5H+vulZBk0Wig4MVNvBeaCfpWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3IT9ZF3wWg0/NDcCITM9rGC2ffWPOuz4O4zGIuPGi6Q=;
	b=ykihSOdQimwV3kprb+PNlPL0wU7Uw7vPOpy8o3ZHwa0ra/THlgRcCuiGfYY2ikpCn9NI
	 VOrkctriXD5AOulnheALjFo2xEKMKnGAxUJuvVoqjV3ODKWoU22ycrIJu0ukKRlJFAn2k
	 9MxCs3YtZCgLdWN+MIvn75C1mmsEai6lt2Y9d9rvueh0TLojI52x+9vdMm4i/Ao9racub
	 aN4XIFi3yUMF5H7ElW9NiO8UoIIAN9X67d/ehZuiXvoojHJbvioaGyAMbaPupqWrU75Xx
	 DinUEfYR17MRmUp3qSUQ4xOF+/G1IhMbc1JSPc1HBp1jTGIUgrim7OQI7hox7M+ub5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T78GkiWr;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C5606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T78GkiWr
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48ed188ee81so171685fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187767; x=1794792567; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3IT9ZF3wWg0/NDcCITM9rGC2ffWPOuz4O4zGIuPGi6Q=;
        b=T78GkiWrHNeT2swXbg6OyiFqCfiDi1+Hd1EeIZCwmMvJRZU/2YSstTMP/wMq50rbKv
         KawJrjWmcFeBRmTmEYiWEF6tj1savR34Bqw1V1f7205qRhXUWsEygxJ+tkw4wHy4rweP
         M1FqBjEaEpxz2JFDntWkZm18OgoR4iQPlBZx+mxuXj0GH+WreVOPwvtsMcRiQUwIWMNh
         bhSp3wP1XKZn4+MU5Fg19RwoCA2MgtA6UFzSpBhElgby0Qi2tp7AgKDZpln3D3eiJ9Qh
         Ru9mDhSdRnwIDfn5YmNlj9zq//WmJ2p68NfNp4UbZl5MZYniz9nu7McOl9MfrhkCwyDl
         XQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187767; x=1794792567;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IT9ZF3wWg0/NDcCITM9rGC2ffWPOuz4O4zGIuPGi6Q=;
        b=nNJhyoB2QbfATpR+ux5o+unPmYCd+yBbdgt5CNMi/UyuqTHh0/p3haYmHalvJ8jCP1
         V0WK+kzYcwQC1DTHwFMmDKtxlscvn7EokwYaPfUZGA39PYmp04A9LLurEEqKyFTpDk5O
         766VU2g+JylvCk44tbVoydJ45lhDv0oOXppV3bd1VUnAqpWTb2xvwErMEWYNIAB0m+mY
         DueQJupeuhxyffwRtoyAv0lNkvBn+np/TJYbRgVBLSnIdZeUli64XYyXpfcKuCdPoZLq
         lI96hwPW2OErx5pcTCnAZ/pdx0XgG855ZJqpje7PUrlo04+N8Gv3M2P47pzbaSR7byST
         twew==
X-Forwarded-Encrypted: i=1; AL+hErH8xmVWHFBujyTmDqHL6qRjtNIMLuCHYOE+5RKic+/28IGkgvn0lVnxw8lMc2TigUrRnjT1JGxQH3n0JUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Glz7QLitlMUMTo56PSGD6BrlKIWOCM3Y5sqlfrpgB61pZCK7U
	Unlc1CgfcWRw1hSROI1yS5+Af6UTNpxUt6VRG5WUhDTWvIr04sr1sRaG
X-Gm-Gg: AYBFou0FeE7cqxo31kvEoHYmH1PJYdkTYYJXIDohVVMkYGFtB5SBa1y0SawKVZ2Tly7
	uxWCPBhMmIslhtCN3ydwuhRaQsQ5s6NRmEUwcC+DMDM9n/hOkX/99tUbTOzGdTyftViY2FT9SfH
	ZzrbE2JnZs6zEhktxqB+h37RVSvpX5ugnzk/vVGeWGVWBZsLzNWp8BUs/8gws4tWJ2V8EhEypxx
	CerlWQ+4vAIeLfmBNDktGw6l7KqRG/0VqbwxJMIEDPXWO30PN+nB91XjuESQ9lq9A8XszTQ5yYx
	E6gaQDP5GRqYiuZXPSK0jeD04w2nATcKyzfALc74xCKokxaUO7Bqg8NgcpHDahr/bGadPTenO44
	bAR36F+zfVN/rUJ7WKAPMAjcXkfFIj8mre13V4c2yhZVjkH79p3GMval3mEQXzK8hv8zadWj4FI
	ONFpcy9J2JEHHPjm6E6kjMYNQdkxLOa7JbFuW+AgxsN8C3V5QWcOKGuirbwXu9Jwxd1nHF4tOeP
	PJ9Ok9Djrh7o6hn/bUz54W3b+IxnUQxKfKHQt6T/MuRTb5Jdp3B+4OvEfke9CT8Arjua1sOzxaY
	lzHguvo93NT4j4ZY4WzuUCisSKMxagEGAMSuMwxZOok+/sQW3UoGI0+dPf5gQVqTP1jXNXe3xr4
	sF2Q+Zmi9D4g7keWWN6pKJmHWqaPiZM+03vfzGMwutwVZPhks0u8goRn+kvV4wEXwRQeKudJNgc
	U1FMR7cUWwbMt6Gzl5mosQDfi6lDsS2DHkElxrTGk4ReQ15p6ltI4q
X-Received: by 2002:a05:6871:825:b0:491:6c73:817e with SMTP id 586e51a60fabf-4adeb44512cmr1457682fac.5.1794187766772;
        Sun, 08 Nov 2026 17:29:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/4] mtd: rawnand: restore SmartMedia setup in r852
Date: Sun, 08 Nov 2026 18:29:19 -0700
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQrCMBBEf6Xs2cUkoLT+injYJKtZIVGStRRK/
 91ULwNvGN6s0LgKN7gMK1SepcmrdLCHAUKi8mCU2BmccWdrzYjt47Mo1vHksGWqmjkKIalSSDh
 bdJOZJkvEhgi65l35Lsvv4nr7c3c8Oeju3ReeGqOvVELaq6zxWKj04EVh277+bkYYpAAAAA==
X-Change-ID: 20261108-submit-r852-smartmedia-attach-v1-290991aae0aa
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

r852 installs its own NAND controller, but the shared SmartMedia setup is
still attached to the unused legacy dummy controller. Run that setup from
r852's attach_chip callback so the media-specific OOB layout, bad-block
handling and page-size checks take effect. Restore the hardware-ECC
default during probe so the PCI path selects a valid engine without a
NAND device-tree node.

Before restoring the shared setup, correct the first ECC region's offset,
remove recursive NAND locking from the bad-block marking path, and select
the standard OOB writer for r852's contiguous spare area. These keep ECC
bytes away from the metadata and bad-block writes within the spare area.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (4):
      mtd: rawnand: sm_common: restore the first ECC region offset
      mtd: rawnand: sm_common: avoid recursive locking when marking bad blocks
      mtd: rawnand: r852: use the standard OOB write operation
      mtd: rawnand: r852: restore SmartMedia and ECC initialization

 drivers/mtd/nand/raw/r852.c      |  9 +++++++
 drivers/mtd/nand/raw/sm_common.c | 55 ++++++++++++++++++++++------------------
 drivers/mtd/nand/raw/sm_common.h |  3 +++
 3 files changed, 42 insertions(+), 25 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-smartmedia-attach-v1-290991aae0aa

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

