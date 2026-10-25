Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951342;
	b=NX8+4E4RuxLXuZplflcsadraX1vMn2BIYtlSDJQTbGGFa99RLgCDg3R7JjVpGx2U1WjU
	 Rg+b5OjDOr2WN02cnwxRhSyqEGnv7vCOfjmY6AE1H/hWTF2RiUWmkVBZvmo/3LpjxS46E
	 S4ssMGtn+PO2u5MjMzpbyNCe/Qxi94eV0Siad15bPHKVvhJE5/UJMVayW5tMU3M3dtuO4
	 PckntpXt3LE1KzNDRMq0r59ZyaS+frqQFsaZZ8udgaFGjT0sEp6iHyRTj25qQ0l79CRFr
	 XpBgUrzDwkiI05Rfj4qs1sMKCXthxlr6Jgq1IYtCnYWTxqb/L4cVsdhxtBjGs/ZT4tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=95rdhHdO0ki+AAo/8XpKJWa1xRVeRBmYXzxQNVzeBFU=;
	b=j+KBwSN0FXUiQYLl/Ec3BAfQUul5bwgVzhiXFFN0J2/lg0aXj5VvuvUnMJUPWoTpB/Dq
	 kXpjz0WSJbSNl9kZvWIcOBeFyKFDTfYvF6iMSaurpa2+9djFViJPHdjwJ4DiuKMPiYaMk
	 VfuN6zt6LzeYm9W61vAcReYd0b+lsXkGanvfcKJ+/PgdlEOcPQVh7QFLNz8LlXO8H+kPE
	 Ljy8KJ9BycDq4g/0tYF2OOEwFFCSvEhximrLCgD49g8gBeMOTBPxYp/eJy83MrK9hPhuY
	 c1xmYX7hvM9koHTNEr0lpoVzdv7mAwaNFdS+ozeFxwTQHcQzmeevPl0srtTX6VCaqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HKoZgO8Z;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B409606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B409606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HKoZgO8Z
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1846bc43c28so2336135c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951341; x=1793556141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95rdhHdO0ki+AAo/8XpKJWa1xRVeRBmYXzxQNVzeBFU=;
        b=HKoZgO8ZF5FYT2E10nYovpwApzcNv2ReBv+dstaQR/0GVY1dCA7dmqMTsoPiaLRpAO
         vqEcJ3IZ/klqBDCLn+84z9IjboTn98ba/L0wYlW4EHp0Aw4ZvKKhN6FEPtCLL3L0zQ2e
         +WSe5urfHaBIMkDI9kH1RdcI7b0oWvy8gvNRh4HPLnMFMjdrzIyUhBbS26mtqf1LlIrA
         qNyBwXKj2CknfVYQAKTPepAB+R1y2O/fFhie4k9T4U6hmR6O3XmNMnnyVsV/yOwY0Mbp
         zH76r3ijMxIbCm2P6Q2Wad1i6EIp35dFsDD0kB/eqHT7pl2bfCM43sYplN3xBuxouH9S
         p4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951341; x=1793556141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95rdhHdO0ki+AAo/8XpKJWa1xRVeRBmYXzxQNVzeBFU=;
        b=gdK3MuuIq9sma015thvMnLwPiEHwF8SHTMyKbT1+Pr9XZrj9fn4d5ChXvzq3NWZW1a
         fp6iQKWa3sIFb860IBsb7Hjz2g4PmO+EQS7ips26fdGE3I7Ftj/aB6O14eqTF/biUKBr
         bU/iUL4C0t35+AGQu7ipfEw7YaiDQufEPOcYGyGgg4zVPg/fl5fSEru9T75lp3lS85HT
         7uvtbJHypx0pnsRLYqs2CTHrVIND2wJ5RBkeqhiB4A9LFvgrIh4N/kAWpL+FIWDN6cqA
         N/y6TbErjvGpmg40dSJxanbDYG8DQCxZyUiz/VfTzc20sxvwKJXDKwvvYOvqtj/PN76R
         IaAg==
X-Forwarded-Encrypted: i=1; AKwUvBxxxvlUHsKSzpFwzWrqqjhGFhf0G1tNgqKwfqQi3z9GEqRLWKE/OHQJPCkFD0L6AmDXr93YuCC2mcDXYc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl9VxZUBU8FqLTzndIQGOSI2Nx+Cn69M7gvNOOxU5zgmBKtgfb
	UHCN7LQMEsspGBQdCHZnht2Dg522mGykQK/vu0s7D1Ma5/5azABZecxp
X-Gm-Gg: AYBFou2E8OvfmxCmlvesCpoCPjJSshWgLeqzi85TB6AgrypSosNUmUM4924FQ4qHvxu
	rmxBhCLfBAovAMcbqhcgIj38RP6ekfjQJdSd6D07OoHFnx6de9EwyTqK99pPppxKZFs2NUZAzCk
	71FrYZZMDr3UlmJn9werzYKr5PN3hpiOXgo5CwuE5AhCKK1MipKNVfazR6O1Ihew3W08wJp8Ysl
	pGabs8d04ivu7Kz8DD0x6ha7NL6zYyLgvMS7fvECUcMccCdkresOId/fDPrd7s9k0uBEHrrEN/g
	np/JLTkmqKHdjj3gQ4JKVc6+likh1WxhmhdmCtx64Yvu1/MAWjIejNaTkBJYIwFdglzM3tjWWk8
	Z/5Z2/SQPDxidBbkZKhi3IgljarIm/IhDDODBW/rwT9rC2eGYFek30a8XUgrUoRQh+ApzWuw2SC
	ha50OdjE1AxPppR6LAq5GCLhOz8TAEbXn41FTZKI3Aiz+aBUj6io/mV/nl+RL6tWk4I3b/QQVCr
	SHs9+XNh0iLOAOPxo+7igFbhFUQXMI7EiHxN4F8vcLbv6CkLNr218QPusFzUAUXlagzLGGPPqQ8
	gG3RAzGZZFPJ21/5ib3H
X-Received: by 2002:a05:7022:3a85:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1993505de94mr7777952c88.12.1792951341298;
        Sun, 25 Oct 2026 11:02:21 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm16099227c88.19.2026.10.25.11.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH 0/3] f2fs: fix dentry recovery and MAIN_AREA validation
Date: Sun, 25 Oct 2026 11:02:04 -0700
Message-Id: <20261025180207.348498-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes three independent issues found while validating crafted
f2fs images:

1. reject a non-directory i_pino during dentry recovery;
2. reject MAIN_AREA boundary underflow in the alignment fix;
3. refresh the superblock CRC after that alignment fix.

Each patch is a single logical change and compiles on its own.  All three
were validated in QEMU on the KASAN kernel: baseline trigger, patched
no-trigger or clean rejection, and a normal filesystem mount/write/fsck
regression.  The baseline source and build were restored and
hash-verified after each run.

Cheng Yongkang (3):
  f2fs: reject non-directory parent inode during dentry recovery
  f2fs: reject MAIN_AREA boundary underflow
  f2fs: refresh superblock CRC after MAIN_AREA alignment fix

 fs/f2fs/recovery.c |  7 +++++++
 fs/f2fs/super.c    | 13 +++++++++++++
 2 files changed, 20 insertions(+)

--
2.34.1
