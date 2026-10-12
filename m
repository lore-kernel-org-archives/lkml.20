Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8A472F91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799564; cv=none; b=duxxvvrwlBD3aFCsZs7bOZu+eewyob5jijoJSCjxi5X4ZhZ3WpNNypVxS2Ip4UmDSn19VG9qs9EcaipEWcfBq27vRPVCW3EgHstkNBcDMWtputkDyqutUTyJ9IWPLJXIykUUyUzZnw4/XQrV6keXOQ1G/U0UIuHOSC6CjLkcizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799564; c=relaxed/simple;
	bh=dsofuRbj1U4u65rs9vpPl8XfBksCcIRSR3AfB0h5FQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcZzqkAEhesuez8Ez2DN2wCAvLxtOtC6ktibtZkESQJ9h1xfgBtHnOBq8gub0UWNYz6Usiz+vZwPhUWDhOtynJMuC+iqXq3jFbBdFRhEmeqKyKOPaPszVGWo21dsa9NLHicLZXgAE2HePZ2awlC4UZbe3+o8W4pHBvCCCkKt5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5Najpwu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5Najpwu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso698991a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799554; x=1792404354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5YuHRGq/vndhRol3HJiJRdr2lwoe+AASVbFdfJsNtE=;
        b=p5NajpwupoHvdgXlP7VrmUbx7s5GqseFLA3D/Z3qfx031eICmWPuUY5I8livigvmOG
         Fc9UiveZAX/ABwUvQWU9zC0fc5VlZBU6wrk2dttvIbANoFXVKxLjCoTkM/PkTeq4NAMM
         0tFaTp8gog3cpu14dVe9zIwE4ANbXWf3ppg431eQd+sT2zhyFJFJwC1Zb7VXWeD5TLeU
         P1a1DhUmv4CjtMbHbRT9yssX07uF5JO4E2PNIUo2vbmBurHdCmIGuGJs7NNG0aOAVZcc
         Ly/L4siXao1ZD3Q5ZyKlcVsE17tHy4PtncY4EIgnHpRQNc0e3r+EmOThb/Xg6Z4mnOLt
         SG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799554; x=1792404354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5YuHRGq/vndhRol3HJiJRdr2lwoe+AASVbFdfJsNtE=;
        b=uv2nTfShSyMsyzLG7NcdoMl4UIZG6z1BGlkXmtxHETaY7EitEKURC1LHXi/Oi8CrkE
         zKJoAJBW5MCdHZVirOT+xrwP/hTzJWuPhRaR5pWuNWLStauM2+MfGcRNxXADOBhDIGG5
         RR3mdDVOYiXrUw2R51sSinyNfabNa09wl87yAttawyOwWstC1FIfsFtHErHFBrMbUIw3
         kmwbfbnBU/r2ppv6sMpXZQLVZmQu66jGMZHJmhrA2RY2cYxqFDC4hTialh/Ek1QHi7yY
         8jkXdOSlH+F65Ip0zziygI+K0pRLCPlMH0l6WQr/83O9n/TBZblRDd6c2HVs3z4GCeg4
         bEmQ==
X-Forwarded-Encrypted: i=1; AKwUvByqyCI4AMumaXTRh5QIUTPEbPsKYeMGim61NKcn0ARFFtY+HNNdKs6umX5vZ539J4qr6mtOmzdaAxlwFkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL77o7WCGEw63LHXIJKhb2/7bKFLwJfx+12t+Lb0mz+x1cJJbK1
	3FKYH1UpqwZzxXYM6aCQdGK0PxkK6vJnBYCSVWOgNE3P6XcdAork2YhGPiyl2rGM
X-Gm-Gg: AYBFou3p1vuChU9lbYDaU2fRc00Pwuk4KC/IjDwTw8HbudFdVcH8J9TL1Jzs+gDG7L7
	jJRDXtt7Sipq62s5RaW2CO0I4J0YdVidRnSU8/zgLwilsgDsbVcFF4bVe7wUxQVG05KoIhvphRd
	o8hwWcMJ0TxoAFYz7AVAP7r3GJ+76hBk7aLkmy+6ZAmjShvkACRdxfdH6jBln1BxB6cZawUiid3
	dPqTHlgjzrp1qFy8/GM8rSj5iYf/qKbyr+iGYI2kfI9DqaKZAOvA01fBB0EI9dM2G9efPt9k+MS
	wafioanPhPxOJc3j2wG18hQlgvBGOUrC4cZeXyQH7vR3XbBTStHA8+8zAIYi9RofM34fw9d86jw
	RdoAokObg4pq7j4SKsusAGQpkkmWseP4OA2w7bO6J6kA5P5okUe39GMLzM0aCONoGYBSZYJe1Wu
	2/PeM+m5D9AcP5zuRJu3ihmxlsYSvIk1xu7PFWMAiaC66nD389s+ibT7j1EIGqE3JgFB1BjmrA1
	iEQbHPMyw==
X-Received: by 2002:a17:90b:4a8f:b0:3aa:fc22:8ab0 with SMTP id 98e67ed59e1d1-3ab3a8e55damr7486615a91.38.1791799554223;
        Mon, 12 Oct 2026 03:05:54 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:05:53 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Mon, 12 Oct 2026 18:05:26 +0800
Message-ID: <20261012100532.19612-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

v11:
Add missing return_code_at_end and accept_zero_function logic
Fallback to balanced platform profile if resume to performance failed

v10:
Replace the previous "profile table" with dmi quirk table

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 347 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 246 insertions(+), 275 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.55.0

