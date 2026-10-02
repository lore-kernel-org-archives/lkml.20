Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427E2773F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914354; cv=none; b=sgdM9aKoLu/0RQjn8gkkyhdZqzKJ3EpHP2mHDLhY0W9yrsKwsj42s5cT4Ojt9Hn6GWlQZRDEcORKIx6xJ3d7HqBQNmTF8ZSeU3oS7MYgwF+swzPM+gjA3pDUC5d2JS3L2VQwPuQgET4QA1P81fSjQoH4efPfb21ShnMPvB2njSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914354; c=relaxed/simple;
	bh=0E1g3hXNc5T8+/OlUAY8brg1X8dtkBJnFxFcV9oaR0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cwi1VakhcZx2uNPNw1OgXAmXljMIkzSnS0OUFePkVnPtKQb50Qnv2zsJeiYiy31JujPjCfZhe9uab8fJct7Yo0kr617nTj1CIKHPfDfPudhjyZkobOzMVNbEBApd5yujgkpixhxvY58cFj1gXJSE/hLBBnTL8kWYixZTCXHppsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snqNe9pr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snqNe9pr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so50559465ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914352; x=1791519152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCFmK/EgwoNthwJ9N2KvLBJFDohYa1KogiEhV4aDUrk=;
        b=snqNe9prnhr1KZNXyod+lUQDu1cbnYtQ6ssPcD3N2FrsQ4Swcy4EsTcueXQnmFT3j6
         X0a7yVkqui+PY91QevG/tAsqa5eTfM4gwf+ZPyNNecRh2liovZEdvCgvGmJED+ZtUvgN
         XeotJ2nuMbSz4QIJJt4b5y7QjA1w7wgHRGdmkjXhLyIq0Ln4h/XkP0jBwEFjeoddjJ7t
         p1oZ0bHSdloPFDI5SOHhv+KoNFk1AVXjIzapRqn/UbR/GGYeCIdeHv6hS+Ks+08wrwMy
         bzKMPtqCK5Ps7KpgznhtnzhDc/r5Nazq5MelzkmRYVnGI0SfrDO9elUqCQMW74bMuDY/
         E8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914352; x=1791519152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCFmK/EgwoNthwJ9N2KvLBJFDohYa1KogiEhV4aDUrk=;
        b=m+p0Pnw24mbkqo3dVoEFN02n2lxI1kvdNeLme4puSDJVekyHxDdwG3vOoPNgIFJex5
         jWwtanRk3xoefKj8GW1ImVcO71MSVc594l58DnKzZ9tGdEam41blwxcLb0fjjIMC8Px1
         1q6OipAxm1L5ojXG3lOL+GOw8wRjUq3drTBoc3uJDjqIfMuyvybV3S+w7F4v8kWMQOnh
         HxfGQ8xXvq+sJuhpZmX7v18hn+BMkM5v3+MxPh0+tUXw24sjjGQWdNUiKs1iXQ+GeZLo
         YEZ5xmLRy7DQcor0X9H+9tWqiyFY+xHnK7pbntE0Ujj2arcvNqgIlOSQGnNizdSy+VL3
         r5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJD/yati/fUDRXL9pz75+U0Zb1Q+sUU9FrSugjp9uBGB78E09mCio9kjnN2GK5vHw1EvTru6iFJFrUdbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJUyerCt82jHfozcBpN+w75TCDOmYgXS1qraANa5ZetW5UDkSV
	JfurEKFTNYJvnJrYvDwS2SDUWlMGLy5SUbmKV7R0GwHLzKnqy5zm6Q08
X-Gm-Gg: AYBFou0kp5zkMJaT/kViVePx42m4LS18m8Y4OHpDjY3GGfLRgnExydTml+e3Z5LBZcw
	2nM6BnZkACEU7aBZjumtorRkhreboWPv6DmNr8kYeFlN2f/stM8DDPuo+Y1lP9eWVSUUzXNu5HR
	2L7xJ9qk5M46DRe/ZEvaZoFW6hpAFjwBiPzzI0EjWEf/bOlIQ6zjkRNt8TJx7ZkZneJT9qDyj3Z
	rD6XF9TTaCadE2Aw50IgY6Eb9r+Nyji3ztCxIlukGcknoQ7UdNNLWaMGNsc/LX5NYmLwkzmWc1G
	cmFs25Q6PNOAargG2YpUU7lr3ukECmkKSB/1D6Fmd6R4mLl3Yp+NfoG9X5ISs3eott2HBPxW/AN
	vaV82b8WjVCABS1i+ADzq0TMxU5db1QAw1Z7el2fXy8CM3B6N4z21RhPFLfQUBYOoB1hZjsW5py
	f+5u3UuvfjET1TZ9I9Et5b+LFJsh7t+qCVN6nobkIlx4uuqXj9dSYRK/IMFa+fGzuYjt0rht1eA
	E4E62vqMBFpvk13ReW/8tR2AqxER29Ox/POY2m4L5EoOB6R/WBPSezEb6o=
X-Received: by 2002:a17:902:d492:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2e499f0d039mr14172415ad.3.1790914352482;
        Thu, 01 Oct 2026 21:12:32 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f680403sm3484055ad.25.2026.10.01.21.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:12:32 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 0/2] sh: add initial SH7305 CPU support
Date: Thu,  1 Oct 2026 22:12:18 -0600
Message-ID: <20261002041220.133911-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial SuperH support for the Renesas SH7305 processor.

The first patch fixes SH4 compiler flag fallback handling for toolchains
which support SH4A targets but do not provide the plain -m4-nofpu
option.

The second patch adds the SH7305 CPU subtype, processor name and CPU
probe.

This is the first small architecture level part of ongoing SH7305
enablement. Platform specific clock, interrupt controller, timer and
board support are intentionally left for separate patches.

The SH7305 support has been compile tested with GCC 14.3.0 targeting
big endian SH4A.

Changes in v2:
- Use my full name, Artem Novak, for authorship and Signed-off-by.
- No code changes.

Artem Novak (2):
  sh: guard SH4 no-FPU compiler fallback
  sh: add SH7305 CPU subtype support

 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/Makefile                | 2 +-
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 5 files changed, 16 insertions(+), 3 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.55.0

