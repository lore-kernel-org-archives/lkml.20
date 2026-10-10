Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FD3328FD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652956; cv=none; b=bUBwnT4daEUdpBiaIoyvwQAt60wdqKEXD8fEdCHORFnlyiZazvCjQNBBsP30VHgXSe9csWkhXYAGRy/swrSOOL5QB4uHOVnKAQymLwldjOK3TwGFsF3SHqc14UinIMV9T97P+eBozoEfwemSleQx4bDSJ8EASOcbp28jeVDK5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652956; c=relaxed/simple;
	bh=VKAd+K1N9VcAyobh6Rlv25i6M2gM4ufwOIzTycg5WuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FQuKIpFAgkS7nD8zhbnIzSRzdJLWROCK1daimEesaXl/PUMNyXv6IcbrqjQTiq8EUtSUq5GhAETROVz991MX/BhT3KQJfpbLvNcPcdti0h0qIC5MyK73nUAE/RoxeRXXNh0JFpk+96yGOENamSAAA7IUVD7rvFZkcNDR61iO7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEVrQ4cG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEVrQ4cG"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso368043a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652954; x=1792257754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OnHwutE7ITegaeoZburj81GeIxbecNg4buPuoGhuOZs=;
        b=tEVrQ4cGiSM4VzqzMltU+/JS4H5W7yQ4F16N6QzxLXAZDQEafIRVPgX0JXzKo9hqfi
         I9YFCvzfX6/9L+4H1ZozhZRzJsIW8v276zpl2zvCIXVTMBI+8uBRmHYAmfbM0/fPp948
         lVEFj69mcTAqt05PqtR69HQB6TvqDE3x/2uvp+4y1LCfKKw7/QzJ0Izc8HPnN2iM1Kuu
         qRo33bfW1A4QxMNH3Kg6MsoznAVZb8BwHIUxNQeZR4qVekWAi9+nY1ovoPAzEyzWOWI2
         aGmAWOHeWdROQqZy/+wNTHl8GfiAqbOQM37ibGS/LUjn2s19XYCAL/J5u3vIs+gGRYRc
         L3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652954; x=1792257754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OnHwutE7ITegaeoZburj81GeIxbecNg4buPuoGhuOZs=;
        b=q+8nuTywurfHRzSwodSU6GElpdpz23mlJqh3bwKmCAOaewD3I8Lgmnz60wWEoH6lq/
         9FugBGFJWwGztAzfQYDCIJzZJwbGhh8rusdbYmHe36Jbqw5aKfy/5968BhNL5mjKvjVE
         9L1Tu/TLPA04gr9Q6OhEN7RhEAcYoHnDerHLBwWSgS8RFXVkRHbvKtI4TTIgAkfeLJYy
         Ouj8/OmmWnig0H3iEjpHUWOASrfpU4QUbxq4p+Ylb4SRgT8ap3/FSyGmrw4M8t0kVcEb
         Lvzz63eQ0mFzpXOLpnCKo5PgOv/imr9grOlf4oWDu+dSfLkSNhy+Su2zc1Y4kft4Mmk7
         +/Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxCCADeB4dkNKQibW1gXgHwSeG5E5RzA0AZdTK1zM6Jm7tXxtdgHWoHf8+iZicAFL/GUBwXA//gDYEe0GA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ6g5KBcRAJ08j5Rm7W9b29pxUgNXMyW8ZEZBmiXaG42BSJw6Q
	td+fWiD0QK7h+ysSjhizyHVJpcRJIZu+619T8kpNxrgPaO8xy3TrsKjC
X-Gm-Gg: AYBFou2x20XvUsvX64mBESueutgr5ZKCNBPTwM+NQqtnaR9+xQtBr2WPBOFsW8sXHTv
	TQlwODcexsbqkQCe3lBNF5KkYun18f93ZVLRtyklYFj6YTA4m+Bab0k6zbKKSpMwhcgxroGXjDF
	Rs9Uo7Gif2MjRoKOuROdigGrJDskHV0KF3xp49WXmmWGEVX2kb+9PVbMKmW/v3/to3KK/UUIPtK
	wUaQQ/KJBK93exeHwFX+Q74oC5NmbxwpXhbiwvENw+sbSL5ejvcx3qqtuM5iBrV4WjekadWGsM5
	pf0Q/BFsp53/mycNrKDPa8zWvqTuPOK/b+so3qoNa6iu/TFiwNpLViMR5dB9T/Y2PE56L50yZX4
	zAJYOiFieN3ncAY09e8L3+YmLAXOQXwDXOwi7uukq3cpCaqIuJUd8cV7m3KJuark6AAXx1G6fZK
	H4SoVZufljL3ycMIsHRcssNmOMuq4/r/rL8nmsDG/htBSjl1pOATatZEsSdXXBgpM5wvM=
X-Received: by 2002:a05:6a20:c793:b0:3de:247d:73dd with SMTP id adf61e73a8af0-3e16bf4e584mr4266698637.73.1791652954365;
        Sat, 10 Oct 2026 10:22:34 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898802de7d6sm1510213b3a.23.2026.10.10.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:22:33 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH 0/2] drm/imagination: Switch the GPUVM to immediate mode
Date: Sun, 11 Oct 2026 02:22:19 +0900
Message-Id: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEt0ymoC/zWMzQqDMBCEX0Vy7lKTQy19ldJDflbdQtKwq0EQ3
 71Jpbf5hvlmV4JMKOrR7YqxkNAnVdCXTvnZpgmBQmVlenPTvdaQC8OU1xKBYsRAdkEYB7R3DN7
 gMKpqZsaRtt/r83WyrO6NfmlXbeGsIDi2yc+tChwhkvjrP8DpH8cXmOnsQKEAAAA=
X-Change-ID: 20261011-pvr-gpuvm-immediate-f7ea8edc2e7f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Switch the GPUVM to immediate mode, as a prerequisite for asynchronous
VM_BIND. A revised VM_BIND series will follow separately; v1 [1] is
linked only for context.

The switch also fixes an issue Sashiko reported on [1]: the GPUVA lists
of other objects are updated without holding their reservations [2].

Based on drm-misc-fixes (depends on 196d4d10c1b3).

Tested on BeagleY-AI with lockdep, KASAN and failslab enabled:
- All IGT imagination tests pass, including pvr_vm_map [3].
- The fail-nth reproducer in patch 1 no longer warns.

[1] https://lore.kernel.org/r/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com
[2] https://sashiko.dev/#/patchset/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com?part=1
[3] https://lore.kernel.org/igt-dev/20260930125057.1837788-1-gye976@gmail.com/

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Gyeyoung Baek (2):
      drm/imagination: Switch the GPUVM to immediate mode
      drm/imagination: Stop locking reservations around map and unmap

 drivers/gpu/drm/imagination/pvr_vm.c | 80 +++++++++++++-----------------------
 1 file changed, 28 insertions(+), 52 deletions(-)
---
base-commit: 6ccf996a0dec1852dab94ad865f27b4904750e12
change-id: 20261011-pvr-gpuvm-immediate-f7ea8edc2e7f

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>

