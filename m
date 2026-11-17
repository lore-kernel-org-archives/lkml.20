Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901596;
	b=ZtGWnfNCj/on8iI6mBLxWTXGj1+ep4FmxX0cWDNp8VeZtuxYy/U/DyUHASoS2MLDEfFj
	 AU/gjuvsXK92SKTFz22dC3EuDr22J7FStoq8CjIJkBuZg2RWcf+rdtqKShtkO28j0DFfv
	 Os+YICPBeorVHsIaA52Yl5LH5atJ3jNkkiDKHeYOThdFCsrWEC2Oaz/yOV/7bs8z4qvg4
	 MM8IDSNgfaaJbW76JrHCN1akcWY2n7guY/PrSPlD1t/cgJgihJfcgXJnCluKouIpgoVCW
	 QMsQhJfOMTDX8hF5D4GPSxOOhcE37ifx7+nsKMBCQM6hf8D65uaZfDQQdn9Xi3kT8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=;
	b=ZVrO1HKvfk880bGmrEXKLVET4c6ncc/z4kv8zdABB9V2ODJtk4hPaV2JZ9hrkxVqoIb3
	 PZypF05A6StyqNvYgQK5EJvVrpHu9QwHzuyMGz4BA5w90p4prAk9U7quu4g9XKqD5pJt3
	 n/MDBq3npUsfGzUzogZPKXqnomToG+x/CKTyDE8si1Drd0oPzXYy98bsS6JQzHBjczvEl
	 hwgSAZ4/n2EGLJ5p8vnC7+K1kFi43Bgz8zayx0035vM4HxjDbWb2+U+WNcgDdnqPbQa8s
	 KRk9gnlNnYYipf9l8Hjpgnn6SA3g4fe0sb0PTLhiWJy/c3dgqYzbgUMJyCZW1YqXR5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBFs+YBw;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99C606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E99C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBFs+YBw
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso719903a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901595; x=1795506395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=;
        b=xBFs+YBw0oCAPGwE3GUM/+DFiRwI4Do3XIWyVvEqHVHFXxhtqBnQHexJJa9d5EGbBu
         4RBJyoeMABuzm6pxXZnmXe8MqPXqE0dK1HRFONwaFGW5KK1FVaD/YNpjgZDsBVAlI/XJ
         tjPNmWAStIQWzafufe+mu5xz9d54O5VkS+EoKOYTqPWqPOJ8393FPRjLOTPC9zBdcMji
         X0B92ELsXgMhCGVAq2oNmfKad4MJ1i1qfzGTbjK4CApgDS4cNTBppqzXLp0WjPzu9Ziy
         L1K23ot1b2VHKMrMpkDMHsFK8lBoW0hRtzd8I6w7sv+0mOde06Cp5BdQlAh378mHChkz
         zXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901595; x=1795506395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=;
        b=wB5DSlpzNflMiwcbnGKAFPA/lhmZrH+u3kS76r/n8uenMQtlF0+yvhzZV9V9FGcDKS
         O9N1MGFb6x9E2dTgdncGjLXcL77KolinOi/bwxTjoUc4GA3sS/lMx5l+z242hc5t3FAp
         CY7nB2BYdpr0ndKZXpkow969pkIF/gHZeTsJCCfzW/LXxeCplmGAq+L1o3dRfbhAP3lK
         Yje8lBDyU8SH/ViwAB7e1PlgqKwGd2LXHji6nRuITdErdKPy0Ei/pa7KfyTSV1frtmp5
         DrOyFPImwPfbzlwyo5mgPsN7KqSorLjBREeUnWuKnvaWLnLzUEEvBeb5B6yZ84Em0zQz
         Bl2Q==
X-Gm-Message-State: APuU4Z9qsNzzFHhjURNfivH+Js0B4aZM+7pSulRrDSBjdXW2/1JPI0U9
	XASCOy78GAFOMq7T1zSanhWdoxiCg7RHSAw/327M1LN9HTRyKGlhP4PS
X-Gm-Gg: AZFdTZexWYNMqJAbbDVxLks08YPaliey2kfgL8psuFE+ZBzNESnTzYWlxcaVE0WtwG+
	3i72NbZA6op+lUqG0qIFUzkHI9x7n4SjIpDswqFFg0XcB7B7uhdEeFnjUFZwgbq+QdBLeRD7xZk
	7Fy3Qq01bcn77n8XbArsaTwK3j3CyulxbinW53BEuRjsj1xfWXRIXKbSKDUFFvWXo4AQNE2EThC
	BjSKwolssgnntdVM49U1x/Efk/T2sWPoz2srlFFNSTOOopXLG6Qt4CliOUHW4i9Zj2fnoK5i+X1
	UzoZ7qbw9gWjDuutnViK0P7JnKLeexyLxppirEOPO+sD4WiuwZFwMjeuX4+AA2XFI2bqDmqNU1S
	WZgS5a7ZyDDTb/rx5TurUmMzjCfDCPklpnFjJSURz8NjJK91EwL9Au8i2EQS7tGdlN7jUtfWSV2
	ZvqUjk+blxmx1N24aNuMEBWcdh0ejRtBysm21I2IL5cGRzYgb9iyVG7islfZ0TmMy24V7mu3/am
	BqSzevnbwgXHKxuFIKhXsoS/CgQz5qOCgwQJtmA2polfnNFViYhpd91+7TMJyb3lnOT9vpITNnK
	ymHgHPIuO3blpZWTt2MqaNFlRmpncWrIxNYQEneT5mmfZM1M
X-Received: by 2002:a17:90b:4ccc:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b1b0cc971fmr10801676a91.42.1794901595465;
        Mon, 16 Nov 2026 23:46:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm2866940a91.0.2026.11.16.23.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7C7384248A7D; Tue, 17 Nov 2026 14:46:31 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Lincoln Wallace <locnnil0@gmail.com>,
	Joe Perches <joe@perches.com>,
	Will Deacon <will@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] ARM: hibernate: Replace links with lore
Date: Tue, 17 Nov 2026 14:46:20 +0700
Message-ID: <20261117074620.30340-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=bagasdotme@gmail.com; h=from:subject; bh=5xgCi9au3vDG6thHydoq+7gGalby1Y8MkyFeA9bAaKo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDFl/WDO1A9u82BvYlos/mnRXybqkbPbyr8wvkjPmLtgXZ Bf6729dRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACaScJ/hn0Je4/Qw65vCcoUb dz/f/Xbvqqd2fjevKPo7Vtj4fLPJXcrwV2ZqfSGTc1aBzFvH7UHn4pLj/P6dycninXJPxkZtN0c hMwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

lkml.org has been down for a while (web.archive.org link [1]); LF lists
archive link return 403 (web.archive.org link [2]); and patchwork link
requires sign-in (web.archive.org link [3)). Replace them with lore
links.

Link: https://web.archive.org/web/20260208121703/https://lkml.org/lkml/2010/6/18/4 [1]
Link: https://web.archive.org/web/20191117150008/https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/027422.html [2]
Link: https://web.archive.org/web/20191117001352/https://patchwork.kernel.org/patch/96442/ [3]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
This is an alternative patch to Lincoln Wallace's removal one [1].

[1]: https://lore.kernel.org/lkml/20260718175114.1404471-1-locnnil0@gmail.com/

 arch/arm/kernel/hibernate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 231a76af09a03f..88048ff36aa40a 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -7,9 +7,9 @@
  * Ubuntu project, hibernation support for mach-dove
  * Copyright (C) 2010 Nokia Corporation (Hiroshi Doyu)
  * Copyright (C) 2010 Texas Instruments, Inc. (Teerth Reddy et al.)
- *  https://lkml.org/lkml/2010/6/18/4
- *  https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/027422.html
- *  https://patchwork.kernel.org/patch/96442/
+ *  https://lore.kernel.org/r/AANLkTimmvPMG0GFEXfgFlXgC7V4dIWmW8vEC5gegsKSE@mail.gmail.com/
+ *  https://lore.kernel.org/r/1277908081-17195-1-git-send-email-Hiroshi.DOYU@nokia.com/
+ *  https://lore.kernel.org/r/5A47E75E594F054BAF48C5E4FC4B92AB0322A8AACA@dbde02.ent.ti.com/
  *
  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
  */

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
An old man doll... just what I always wanted! - Clara

