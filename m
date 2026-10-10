Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524EF4B95C2
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661140; cv=none; b=JN2GvHtkUvLM1dr3CNKhnKoPpPfW7XKAdIsQPH8q+ihrOzg6ssuVkjn7RCjp9KGL+MuxgNnEifPH+hZ8+EZbPOdNNaIZVhiykkrHUEqrWDNkw2onso/aso5n7G6NE0k4RnRxI53x6vWKzx0qnWGbFWQG9SN9okzbjmeteag4LMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661140; c=relaxed/simple;
	bh=dNCvN6Z0p0apcqDeCGNLBgDGxDSrZTK3JiN1BaZpNmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKtUK5VX9hrOPzi3JnBrHjl8KyxU9ABiEGhR8QrlgQposhvYtjsEfkdIOIp13WLdZZY02t6Ttko10n4zdzsyBwsuUf3ApgNlEWjhzQtP+rOKj5WJ4YDDHNPrI8HWKiqQpAUzvKOjWK5Ig37FsYz3qqFzUuctkwzFFInpFXbpDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNTzDU++; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNTzDU++"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso607040f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791661136; x=1792265936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoL34je1TJl46tTvKm6qjnv06WZpCsCclqHksd2Wqs4=;
        b=WNTzDU++3h+WmbhRy/Hiv48K/S1eBLwd8p/lbLRBO4lftxBjaYfP/wTE5KQU4rODB2
         1RIq3TADgsBivrlJfxnJFAlCMbuacDtvVW3OIS/03ynkfbKb8nppTQSiu4qiY5tex5kB
         1BDIfIeNHftQmWGqRAA5FOYB80F8IjN97na/gqfvMZZ8FCGhhZU2FoWZVk3N/n1po8fJ
         hWaF18bI1dryxgivvjYpPRrDYJiM1qqxgWMAdgm66OodoCsgbonARzeLITJak9qbPbAi
         8Y0VHUGqBpqy8BOOUm/WUhwvsm+S0xunvJCG5qiyXl6lszOTqbgH1bnUPqWIZyzrLQii
         ME6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661136; x=1792265936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoL34je1TJl46tTvKm6qjnv06WZpCsCclqHksd2Wqs4=;
        b=Csj6DZRRiAFKjoaqE1BbEHUYM1Q07V64GaXwGbX6p+FymAhxebv+RYBCvFuWLO7sP8
         duOVYEgw2XZkEKOeCDokaz43ix00gvsf2JqKTgryuQQA0xVOVRBykLO3sHmNVboP3pRH
         +sqFSCdSQ2N8pyPtEdJyimBfP+iyarGC35dEOtqB5i0p3Md7CrB9HpWLDPv/xvEU8ydq
         1+296mYd74O9Ven8J6BcCM14QBP2fH4a4Ijt0fL8rBG2Iznk4lJrZE+LSR3/XsvQ5OmW
         UdmzHRY7f8twxb+ujCVBXBsnccJPiuKw4NMzZzcMJ1837CeyZZ0sX4eoM2lLk6zTtoLU
         JPRw==
X-Forwarded-Encrypted: i=1; AKwUvBy88Nn0n0uZSb9q56VKJzcZLtlUWHgXZ5nmm2oxb8NLDAn5MhIXeHnWSb79giZqtsXWCDTfhNE+PFjmPG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp4Qucc/tlxmg8UMtc7hgw46qdCFhJjboGHE7ItkyqSgdwNQ5T
	HCy79pWaFYB80tTOvosY+ztpqvoZAh4w0cT/WHBUtuA6j3D/3o7m13aYJcte3EuN5sg=
X-Gm-Gg: AYBFou3RNl23kivzOM42gaR8j8RJ9kcp04QDcKRemwSfYTfrRaARhBnWBEDz3I6GK1/
	RPuSBiUu7q1rvyR7LW5CNjQJTmhTf5+BP6T55I2znN8BNulyVvFQtYMbB7eQXPfvpQQ5pF9q/on
	zyUSNmbei+FQNCU/MxplhUcofov2v0Y6b2UUUbmaqX8jst80onZHO8FaYJNvyD6h63/hfmk03WC
	kEMhLcQyLQRir9SvtLyyT8jG/dHDrgC5KmF30C99MC6jc0LBYf7HAagNJ8Ea8dcUxvWFEPkNryN
	rmHmi2NZvYdV0a3QUrR0NeaqniwrFmKRwbtuxmqq1uhb0xF9l44a650W8G8um+qKRfK8vqXqw3C
	WoD2EqTnJiM8gO+2Cf6v2Kdd/u3havatsTUNb8YVNjmxtqX/PXdZPy0Y6QXe35K4jF/ntBOqj2s
	cieYXHzWmICs7oEtkaXRVnu6rNPc24u/PH/NQN16/RCIsRSjYxa1KL0Sw8IpdRMzXHs8NMge2Ez
	p64wLd+tetIPazADG7ZiMKA+ZaPKqgqyWaV+megEyM=
X-Received: by 2002:a05:600c:3e11:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a18e4a90cfmr95543885e9.28.1791661136292;
        Sat, 10 Oct 2026 12:38:56 -0700 (PDT)
Received: from localhost.localdomain ([67.209.128.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm11123224f8f.16.2026.10.10.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:38:54 -0700 (PDT)
From: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
Subject: [PATCH 0/2] platform/x86: asus-laptop: Fix Wi-Fi hard RF-kill on Pegatron Lucid
Date: Sun, 11 Oct 2026 00:38:35 +0500
Message-ID: <20261010193837.1120-1-kotekompotek@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Pegatron Lucid tablet the built-in Intel Centrino Advanced-N +
WiMAX 6250 (8086:0087, subsystem 8086:1301) is permanently hard-blocked
under Linux, while the same unit works under Windows. The driver and
firmware load, wlp2s0 is created, and all pega-* rfkill switches are
unblocked, but iwlwifi reports:

  iwlwifi 0000:02:00.0: reporting RF_KILL (radio disabled)

and "rfkill unblock all" does not help. There is no physical switch
and no BIOS option.

The Lucid DSDT implements \_SB.ATKD.ENPR/DAPR for radio ids 0, 1, 2
and 6. Reading the GPIO level register (GPBS + 0x0C, GPBS = 0x480) at
boot shows the lines that asus-laptop drives (GP18 WLAN, GP17 BT,
GP20 WWAN) low/enabled, but GP27 (id 6, EC bit WMHD) high/disabled.
asus-laptop never touches id 6. Calling ENPR(6) via acpi_call
immediately toggles the card's RF-kill bit and Wi-Fi works.

Patch 1 fixes a pre-existing leak: asus_rfkill_exit() never
unregisters asus->wimax. Patch 2 needs it, since it reuses that
struct for the new pega-wimax switch.

Patch 2 registers id 6 as a "pega-wimax" rfkill switch, following the
existing pega-wlan/pega-bt/pega-wwan pattern.

Testing (Pegatron Lucid, Debian 13, kernel 6.12.111+deb13-amd64, the
patched asus-laptop.c built out of tree; the two hunks apply to 6.12
with 2-line offsets):
 - Clean boot without any userspace workaround: pega-wimax is
   registered unblocked, phy0 is no longer hard-blocked.
 - wlp2s0 associates with a WPA2 AP (-43 dBm, HT40), gets a DHCP
   lease, and downloads 38 MB at 4.7 MB/s.
 - "rfkill block" on pega-wimax hard-blocks phy0 ("RF_KILL bit
   toggled to disable radio"), and unblock re-enables it.
 - rmmod asus_laptop removes all four pega-* rfkill devices
   (previously pega-wimax was not freed); modprobe re-registers them
   with no warnings.

Not tested: patch 1 on a non-Lucid Asus laptop that implements
WM_RSTS (asus-wimax). I don't have such hardware; the change there is
the same asus_rfkill_terminate() call exercised above.

Only the 6250 combo card was available to me, so I can't say whether
id 6 also gates other cards fitted to Lucid units. Registering the
switch unblocked matches what the Windows tools apparently do.

Tool use, per Documentation/process/generated-content.rst: the
investigation (DSDT analysis, GPIO register reads), both patches and
these changelogs were produced with an AI coding assistant (Claude
Opus 5.5) working on the tablet over SSH at my direction. I reviewed
the changes, ran the tests above on my device, and can answer
questions about them.

Based on pdx86/for-next (98f039265e58).

Pavel Kossenko (kotekompotek) (2):
  platform/x86: asus-laptop: Unregister the wimax rfkill on exit
  platform/x86: asus-laptop: Add WiMAX rfkill switch for Pegatron Lucid

 drivers/platform/x86/asus-laptop.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.47.0.windows.2

