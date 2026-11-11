Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415062;
	b=hdcGT8WyoCTemvdQx9bgqrgDLhregxw121MGSCTkJ1rx3ZlrM1qARQtFFJcZgYv7X7an
	 LuzZhhrQ/Iwvf1UNNkH5MiaOzpv/R+M/KnUjf/0j8enSQjqkhT4H8Al78At4myg6cyS8c
	 5UayKZ+jzPKQRqdeEVvkImJF5uOc/e4QXOgProCSSkHDAL1vvQ0EgDtt/4uj30fBu+eT0
	 P8SNIU66WRmTCyLxrINve3Us4VSzZDmc/SRiYar5/jOKL9sivaLMkKSnoUSe5W9HlVJnW
	 q/lSFSpKMLY0UlbZEcfQvV5ijH6by3+oyoabCvJZi9KukSqQWGKgXH4Pc49qEdzl9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
	b=YLTSrnhsVNniWArWqCkQv1Qy4vUVWLmMVcoN57dd7+kzZ5gpCj6JF8tx9PFmtjkyhqah
	 inMeb5zRcwHsQGIKIP08miiKb8RYfvOFpOu6t2t28QkklJY77YQWq+gs+qapUcGPec/eS
	 NkvCUbZ+fSxm4Guu6yOoNIoORKWerGKL8uWkE3Ozln1h3SLlCRqdWe0X5pn3J6OKADFgM
	 4/QrwuOQbhPvidCXRj52b/fSs2Nqg0Z6vkFVUV0zlShCRrNr9xLmpZMnCdcSrknLRbJdG
	 wl+888DwJXcgOpZeTONUfq0ItqI68h++uAuVu82Irul5Cn6v8E/COzNHnee7X0hUemw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8SKiMbt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9BF606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9BF606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8SKiMbt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so27964645e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415060; x=1795019860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=z8SKiMbtsioEG8BEDmDNhfB2vwKql5oh1BPP52d2Dpxsx/OemeCcemDPcThx6J7rKN
         cXfp3TQkAUw4V6kEU4kgeU3Bph2WMo4EetbnMJc2/Tgujrq9scp+lAQqVKjMDwI0oitt
         8E9DKhdn7ils0gksqKYfw57vlkMzxnSTg0LrbL9u6MPLBTv/kcWv6dtEaDxXigNi/hhj
         lYHvyR8vMJczlxjFroYqh3l/WOiKlAZCo+h1Wfn99u7CCPPmrjUWwryGlo/LkVQeIbCp
         9wBVHA6rFOf7pT/OIqMr1w6ybjX5a8BNhfFpsheqARETFob21JmhzpZNmee2dssuCJ8x
         2WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415060; x=1795019860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=L3zDNy1yMt17vVUamcbV+SD6gGF0OplVArgb9WcPwxqNiV0oo6JVTnX+7wqJKKUy8p
         lvoakCLhcHuTgCcAhJc94gAc7WzQ/MT8pz1ijh0fSRwFbkU+MJc+20t/A7d7zKtYfZwK
         9d64mlynlCQao5VBTtINxxcUdUnKvNFwHcCoHT1e5+GlAS0bLcveNx7n6CVTOBfkdaGK
         MwJHUPzCzFMa8MCz4lsZNsSgSluu2NTmR69yIn5LCQorX/oaQBqgREickS0DZ9mOp16G
         f1T+uVGgfffUvKCbINUhjX/iXePSE8fkrh3fXvg1wQCkzDftWREuCxwRTqx81vDuvY5e
         xnjQ==
X-Forwarded-Encrypted: i=1; AL+hErEkluKDQjTEZqpqXtS8vvh02zF0yzGWUgH1ny8xQ0EAMUUDkXrScAjBCK5ux45WK228BRasoVCenPCH8Pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u86WykcwjfOHYtkKP9QgYp9ah8a96CC30OV9+7f1Atm2Jf+Gc
	CGTvpHMDZODKhJJ4trtc94Kv5nPrd4VsRHHCck/HR8nO1KjiC8uLBd1g85cNDHb9
X-Gm-Gg: AYBFou0bkB1p6OSbx+h5iHHiX7PT0UVGcS2hrn7GmKUT4aGO3dru6EDHf0c7QbtV/yJ
	FqHAVoRgOSPd6R6/nzKV4y5RUqOuCKrCcwUrRWP2Ha7zVU+DNvJ1C2bPhF2S79roG0kobpqu2hy
	AnZra8qtQgYqdGB1Q2xInpRqJh9viaHuHnVaohY4z3PG4m0AySxYYPn00FWIpVCwt17DCTmsooe
	JsQ611XBLWjRchMPuUPdyl6P+gG6wEinhTW0gCdj8tgrW14KGuQvn8juz4eOrC0Fzw236Ho5uCV
	XQgw4ZtrjbLoQiqpJDUGC9hnxTIeaC26oqlw69IhgFpEjUlDCDvzbM0UKm4hpdd7ogaUC/iJYm8
	CPm02fbMXRA+1nmWfgwAuiV4tUu4djgxS91Rom6fDxxeOp11SiHhAC9zJcqrNagEIuwXw7Qppas
	rIqIRaK73zQj3rjljhKtVDyCAEme6quSi91v62Tuyy3SBPPHd77Z+M5SP4tyw7Ge/X3uv5ceOjb
	NWzf+uZsO0s1vIV3h9BpBGTxrwxlHbK3+IhAl2Fz6CVCxJ7D15dAIuCnftaK3SJVXM6a1SSeaaL
	N6i7NrPo3Z1wWcQtOQG8leNZIjNONobCN961FeIU4701oKMcvSt4rhPF3WGzpM/iNWZa2TDLwnP
	XJtz0Tg2G9VFZ
X-Received: by 2002:a05:600c:3e1a:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ba093b967fmr58000185e9.31.1794415060185;
        Wed, 11 Nov 2026 08:37:40 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm91135e9.6.2026.11.11.08.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/7] m68k: defconfig: enable WARP_MFD
Date: Wed, 11 Nov 2026 17:37:30 +0100
Message-ID: <20261111163735.227286-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

Enable the CS-Lab Warp multifunction driver in the Amiga and multi
defconfigs, which pata_cswarp now depends on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index e2d474e8cb8f..75d91d502545 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -20,6 +20,7 @@ CONFIG_AMIGA=y
 CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_AMIGA_BUILTIN_SERIAL=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1bbd2aa653c0..120dc68d492c 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -31,6 +31,7 @@ CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ATARI_ROM_ISA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_NATFEAT=y
-- 
2.43.0

