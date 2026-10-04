Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D29737EFE4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124756; cv=none; b=Yez8FNtvGbHR7cz2+mvQtugDTiMOf2EzqEJnnb1FOjqxsxfBtvDXgr5vBOBHvo7pYiXtBtjqf4L1KaqhCdZcsVN/83ECA0GeIXaWwocatA1k6iHk/Cv83bYo8VKiNgCEJLp0aLiVECp99Dc1lYge6y9puxea4OSwP3hR6812p0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124756; c=relaxed/simple;
	bh=3f58ui2UaAqFqyMV2EtClVFH3yRcP7QyTZuYCQDYmHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNT+GzOrvYH8dpX+Mfygymlt8f2/DVlRh278eIyajIItQujYC9q8bt4LVyZkwUrVM8tp6fspVxjaSMCOw+sZS07v9gHD7WcOY1+gs5vZw0NCeLeXpfOZK2SHmNDTAhp06ZKxk0m0uShx4GUE864L2E/RaEjuOxLdL4OIVBcsthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgncOthD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgncOthD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso76015a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791124754; x=1791729554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35o3ClarjDsqmKRMmMbK/8uDTJyS4jnUyX4ib9jP+ms=;
        b=hgncOthDbuu/BNRMGtr5ARMJEJhMoEpNTtVHjYNkjpFEgGyPQbdUAeqvpSCR1lkZMl
         KqmEvy0gb7ZIFMfFR0G8dyP/1WSfSlq1ylFHoLS9zCJta+S92Z8Y2oV69eB/RVggzXSd
         gzvFDFpgRRA6IcRlmVqnfCnifSraSS+y4lm2eWi98x1G2MTmIx/+pILO0HtnZc3r0Ns5
         3UDZ082guzwNlcDaxlwWGCpYBDct50pepVdpDzzohi8WnwRsajr4BZin5lXdBdNREF24
         RPRdX71zZC3tWAXN/GnBl42mSw4oYLdEw8LB9/kOXZ1lvCGm1Rc8pXnS7jOSH2tPPnNx
         aK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124754; x=1791729554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35o3ClarjDsqmKRMmMbK/8uDTJyS4jnUyX4ib9jP+ms=;
        b=fBT+lxJZcPLLrt7PSl97+F52jr+NMWXwq8eWsUpK+KPv4dPAqpPSO+o+MtsMnTl/Yo
         zUpXhxWxps4TzOG7Pohtd7yRuhOvDPr836NcmOhfxpoKZ8tZUoWInhGFEjBnFDDxXWE/
         eLYSllv+RByZmu1jufzfzkYGcOmpfV3k5+jv4hbosV9nyoYPujH6VvkGaTM7tQbNdmhd
         lgFyyGa8VkfIXSbYlm7zblH1CV3345GAtk6/gY+uy3LnrxSba2WkkryK6h8z3eWcSif1
         9OXuIiHSIo15kgkyHECpy+DaNbMXhZlC0enW2qmZrGTFrkwuJe7lU2JAGBtGZTWWzoBj
         WBig==
X-Forwarded-Encrypted: i=1; AKwUvBy6RPC/lEuTzwSowPgTl5xMJcR7Wy2A6Fzz0bg6sbzPyWFEpePX7qjMMGNWeLct0GGx5bnXE9vEN1eZccQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lj+pf7jHbollewlh50u6QL0FzJ6tV1zFdjNAd5PvVCzkzf5Ica
	dx6vF2jbWzRciRH6YfPW+KctZxvdK/GJ1J+bSNVrf7WD7b3YUK5GxxgC
X-Gm-Gg: AYBFou26LMXqH83aab5vyTW6VM7DewvEOKhPTvWCVZfb2qr8isqcgOxmb9Io7MEcyJO
	gxrvZZx1wmrRe0O9V9tFtVtEuqc328+o0VqRXKadLYi8anF2hcA1tNUGchmR9vx454QHnHX+AAv
	6ISUpCPC38wWHt35U1SrqpHSqTxnKjh79yvsuaGBadgWXyu0RiwvpnrcNHGHX9ey8tr9SGTzWn0
	upAoAEErQJvKmCQ7J6P7gX4UY5y9NAzCXCwhvaMEN+DD3pTXuGDykIC/v0dft9XI3sElNsSw6HS
	ZeEt0xaAA0EH1Uymv9QWfdEyDCTMg4X6PUkhZFbmGfkqn0KF+u2iSgJiu7NmaUtVfx8w8tPQV25
	2q66Wh9lW0Kl1uhoLa7ROgxhjEzNn5xM+ZYGigOInDNwRaXM9SOMOJVYI3/gmOurFU0Fhj05HWe
	sV0Zz7RZcdXMG7enLgeZXtfGkPLz4iv5qEF4WjUox66EZvPm88fab3Saaht+MRL+GqA7PWUU5o1
	tdXfaY6
X-Received: by 2002:a05:6a21:3113:b0:3de:91a6:f7e with SMTP id adf61e73a8af0-3e0d6cedcb6mr4095555637.39.1791124754431;
        Sun, 04 Oct 2026 07:39:14 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45f:e6::17:34f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f736b20fsm2862036a12.13.2026.10.04.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:39:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com,
	syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] media: dvb-usb-v2: set active_fe before the demux goes live
Date: Sun,  4 Oct 2026 21:39:09 +0700
Message-ID: <20261004143909.120584-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927061102.47451-1-ngocthang2710.1999@gmail.com>
References: <20260927061102.47451-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot has filed a second report for the same race, this time through
the gl861 (Friio White) driver:

  https://syzkaller.appspot.com/bug?extid=ac020fbb657e00356ca2

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000061
  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:friio_streaming_ctrl+0x43/0xd0 drivers/media/usb/dvb-usb-v2/gl861.c:521
   dvb_usb_start_feed+0x57a/0xc70 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:308
   dmx_section_feed_start_filtering+0x519/0x6b0
   dvb_dmxdev_filter_start+0xcdb/0x10d0
   dvb_demux_do_ioctl+0x470/0x540

The root cause is the same. The demux is registered while
adap->active_fe still holds the kzalloc'ed 0 and adap->fe[0] is NULL.
A DMX_SET_FILTER issued in that window passes the NULL frontend to
->streaming_ctrl(). In this report that is friio_streaming_ctrl(), which
dereferences fe->dvb (offset 0x308). The fault is in the core, not in
either driver, so this patch fixes both reports.

I tested this with syzbot's C reproducer, which binds a configfs
SourceSink gadget with the Friio VID/PID (0x7a69:0x0001) over dummy_hcd
while 8 threads keep opening the demux and starting section filters.
Both kernels were built from the same tree and syzbot's config, with and
without this patch:

  - without the patch: the oops above on the first Friio probe, 3/3 runs
  - with the patch:    no oops over 20 Friio probe cycles in 300s

Mauro, if you pick up v2, please add the following tags for the second
report:

Reported-by: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ac020fbb657e00356ca2

Thanks,
Thang
