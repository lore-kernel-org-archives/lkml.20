Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCF3845CB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364099; cv=none; b=tTHjBH4YQpQnQk+nh2ZtW7ml5CQ/tmKiPnO/kj1d3Bfa/Dcz4XUK+/fWnRgcBtNEf51yB/YniTQKY3T6tiYMpHoiaQdmHpJDqgqUan1FZglF9y18W/Ie7nWT1nTXYyxKAI2nX0j6hQt4QHYlNUBfjL8p8G4DIOPTPrhi2gW3RKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364099; c=relaxed/simple;
	bh=UGzK0wD+4bkd3wDWXUs6andTHbeSm0gU68wqz6vGYts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcf/YJmwotMBJVHcCBJ3YYak9p/a83yuvmuK6FWOT+CmQ22tgucvOdnRUd52fLqtFj3Ayz/c1akl2hbwsrqNckqsjp1VsDGrd/Rk9N2W2QmjuMJNq/VIWeFPbuHjI0I5bXZ6f49a40/Y+eRYYHnDbAXz0lcmx/ovlgMKI4G4bnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGXMkmiw; arc=none smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGXMkmiw"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e31c05606so124957666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364067; x=1791968867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmxfFGMIH+hpU1CFhvQGlEFC4U55G+QIPjMiXjDrbh0=;
        b=qGXMkmiwGjAwqaEjgGvBppKHjxejNWMI8vXXj3iyFhGpw8nFSukUUJ4pA+dRpMknES
         WYsV9W1yQSEMbLH6dj0fMfc0cNwg4qoId9fy3uU8jRseSHz+5OW94YMLFypHFiYRlpKy
         B+nUcBGqRmub9fSlyZU941PJ6nPIdCcvsUQPNen3+IUYe6kkOJXJkAiCNtBf2sEqbsNV
         mFTz+na8SShEevI9HJAuV8vTnmlEyj0lqCs3nPy9tUagn3XV9e40+8OCBJCLmzygp4mt
         j5ZVIm0rrr2GAl5CoHLgKuXZBwtEc7Cf66xBD9AbLX2x3C8HAHcMp1/HEywxMIgU16Zx
         sBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364067; x=1791968867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmxfFGMIH+hpU1CFhvQGlEFC4U55G+QIPjMiXjDrbh0=;
        b=SPr9gUQXjiG0srVucsr/PgnDZzFe9jgEEFzoAWdqHrQ44CcLsEWg4hUwBmPFCGrof8
         RNEFwpeCGfG2TNVdzKxVR/7M3Vf1XCfMundnKCmpB0SMUtjP4s1kaQ7TDtUI4AMxxa3l
         ClxU+djRZJgeO/qnYbjgsl5XNEZuQnZ29eYsvpjQETB/EpcIs1+mPmYqKuHiklAtjZ3H
         MFfZY+iXikBd1Errn65nj1UHkIBmMamAEtOUzxSxG4eMDxASPE/C9+5D21gFMU9dlpcV
         vKmr0ez2aI06s629//BnytfRzXCr3Cp0lhLZmSEflmx2ywvAMB3u55GcU3jHdAOwn5j0
         q5ww==
X-Forwarded-Encrypted: i=1; AKwUvByJvTEGN5zmh8RFGrcP4p7Tf+GhPU/rBM9i5wWbSbhNkLGTjRRw13qCD+K3iMuoK3+AFro7vMh6hLrwvVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+XntDkQtXjmr/JBDAfpkRsTw7ITF5hxm3rfnxxBJZX2zyKBwY
	Qw3vqJwaYsBxNJPdc0ZdWYQMiLqWwhF9W3hiEMHJya23fdnqvDDzGYG4
X-Gm-Gg: AYBFou3dsJ5IcEipQpGTe4/sratBnDLwFvAW9OLmcjuxINHlgCyzFIG/bk87uC45x9B
	CUdNUtYVPv9mW0EXMOj3A9C+pUZP1URGlhXPabsAXzLoHMyhKN8AbXdjjVHAkRCBwNbdYOz66Ky
	FVx7A6Nji83W45ElI9bDKJERpodYv6Dz1g4BYD7vQRrR/eCSrIZeCAPr7xOPMnrPcG5R0cvkb7K
	YqGgSmYcDhOPPhTm8x1TRogguf/M9LwILcUyKSY+/5btUsV6RKl5IZQGBIJBvlilO+NVHF281vM
	UO/9yAQzNbMquBhbD5ZoiB9g9vzB9qILHsUHF/FwhUOChtjy4t/K6K6p37bH/esCBvBAgGceZrn
	KBpFkLr8KhWtPmcEclWitrSruQ8+lxTjrkkZinVzD7UwtrtAFlIbGBWIMiOLbWM/6pVeCTsgrxw
	4sP8TQzua/13GlrgEFs5Cail8PX4QjY7xorM8+DB6vbxjlFnnciIujsjaEnyd3qKw6+1+jnf5F0
	w==
X-Received: by 2002:a17:907:3e8b:b0:c2e:7daa:7645 with SMTP id a640c23a62f3a-c317bd9c34bmr139970166b.23.1791364066253;
        Wed, 07 Oct 2026 02:07:46 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:07:46 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: struct rename and cast unwind
Date: Wed,  7 Oct 2026 11:07:34 +0200
Message-ID: <20261007090736.277636-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Now,

This patch series splits the v3 patch into a 2-part series as requested,
separating the struct renaming from the cast mess unwinding.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
the call chain to remove u8 * casting.

Regarding your question about the existence of struct phy_stat,
I discovered it was dead code; no function actually used it. Furthermore,
the rtl8723b_query_rx_phy_status() function prototype referencing
it was also unused, and was removed.

Patch 1 renames struct phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.

Patch 2 unwinds the cast mess and propagates
the real struct type all the way through
the call chain, and removes the unused phy_stat struct
and ghost function prototype.

Please have a look.

Thanks,
Timo Joannin

Timo Joannin (2):
  staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to
    rtl8723bs_phy_status_rpt.
  staging: rtl8723bs: unwind cast mess and remove phy_stat struct

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  6 +++---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   |  5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  7 ++++---
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 5 files changed, 10 insertions(+), 27 deletions(-)

-- 
2.55.0

