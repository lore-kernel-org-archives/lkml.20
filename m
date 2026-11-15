Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735483;
	b=pb7NhixAVdvCyzPgOyyjtppdgzIZC9uhaEJ0j5lSUu169OTb/RGodEMMtc6lKNOIz3iA
	 uDZK0TYv/U1iF6JRkLAv5gF70iHgXg2yYSifwiWVRQ8DNLdZCOQDuJ5StDVpeDlqgDCAt
	 uiMGhf827z/zHVE9mmteKX/WJK0yDu9mMc+AYEveW+/f7lUepkE+6PiQpJkZWEsCPLdk5
	 gWA17VTrJ/sc6krnHI3qcPPB7rVMbl0JKAUe9OVMX0a5EzL8zx0/SskrUD/QMNQnb8OMC
	 /QdWD4wDhGjZJ0q+DyhC38FLyLg6vgtGj6SPgwMz09g/KNK1wgoQnrV04Kx1ZKjjgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
	b=P120Qk0BUa6VuVozfvEqQwD/Yuoa/z9snNlSFS3P9GZU+SpdYhqnzzeURmyiKvOd1ANj
	 UMcI5rc1lQGSA7FgsrhPNmaknYu6bcYYKBQ6ARr24bOLZ63GvmdHWP8x2e60HV0aEBeJ9
	 UktPlmPcDfTuCOyYSGrMFiW5c8HZ7KwO8f3jw/98nypvaJ9X2Zos22PVnmlZi4AznMNR2
	 Qf1H5OVWRE0LejK709Rp2BQSwJlNhnZiqf3qXVlMaHz9eqN8dkjHqSAUz2cVTjPW+Q8J5
	 gzl+koTsDBKQzXGCBCSWF3jwqwypEP+I22c8vMj59PlEqI9zoqBXggZwOhd+FPXQepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VedZ6Yct;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2917606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2917606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VedZ6Yct
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so31958651fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735480; x=1795340280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
        b=VedZ6Yct43cphb21llsRwcKTjkaJ1KK+1lE5uBQNhhpNW6TPs7YlDmJCU8ZqBdnTTB
         tseOqUhHoo0CLMjkd8nJ4FagYTH3vhEpGFGUeg5UaSw5aEjPA3T11MZNTIIEua/mn2BO
         wlj5EjmIkMszzHeq/4oUZrA+KtILwBiMEPompoMdL7v/LlplJoSTw4S9yGZmDdxIbbeC
         dzsfP+dXkYnVsuARbl/AbaMaJLtz8bmvp0x866JnPQES4x326oJ0SHiT14MVJJPBI26z
         9ylk6D6nNNIObrYBCppy/oUwVW0UjD2MVt6NK5c1dgUjA1kuXZE+Gx1mas/V7QdbELdG
         RHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735480; x=1795340280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
        b=23l+sEQdnAn1hPLuxLUgK4qxbIwNWCTAcLGEqREtZKu7dKVh2qzou2j/f+4RItphBB
         MF3/ys7jPQOI3tm5KPkOl90l4S6M09m9NmWMZqZyq4dx/pvuqd5hRM+AVbLu+KNvYm92
         sF+dU1P/JrmIGqMe+o52iHmHKlPHzrU0wdjxqTKnib1yPGW8Dp9aWt3uUl/cTwPdQ49T
         PgugGfYJQC3w3lURMia9MEdnwdmWEesKblc37G2ul6D1QVDAxtsnwdB52SCVIJoPWME5
         QrOfrzVyBfiSHjWe6CM16JjguazWE2WZrZyv1wlTje4qF9PGkiMLWbG447XoqZZYOevf
         WEJQ==
X-Forwarded-Encrypted: i=1; AL+hErG4alMZPJF/FlCfStb08lmmWHkshxPcbdEbU/L/1whypLDyU0N8ot5bhtZCOSQcV7Zf45aWpjYosAJpcOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Up01/V+0jTaJQ1sdfoI/8OOXYY462fE7NecyIEN8UDH4Jdolr
	wKqGUtnuxvr6vSIJTqNjrcLeR7DIGQzDU0938CNvg3MLDaZiiIgFZWTf
X-Gm-Gg: AYBFou3aUAgpPXdgYLYc483/8gEj64LOWATQJzPyIUQ4459gHp0RaW+HU8tJ/wtwZCN
	NuENZtyjepuyPtuoQU8qrnn3mzvR+wol4mNjdSG+3fFwc/QD8vwFCUJQMmxB9yYNtZfd0sAS2A4
	D5KLUSFQMJ8EkyG+YbJmPnG4MMI7WfHggDvQ33y7fkqbRSqxMsaHBhqxV3n50eLiu2R3kdRQ9vO
	eXnvY9cfd8Kytkki5K8RLNLa88NVBXE6EXZ4VaFE2XnQEkZrGmnsLAc5roI6Yz8FLcKyqumfunp
	AP7/+vA7Dw/zi6NqTktC5BguostLUyfNCH2jLKryOe5uduFPk7FR/SshhtPBh5qrgnnMDt/GZ8j
	mmXS0geWifVXNNE7X6SWWJSnzX8KYL8D3Q46cwOV55KO26AnM2zXY1bfyIAcHSbLUx1kH8pGjhF
	yNpvGpvNKSfSDuB+6GWDv/HTwLWpgve9JYxrFVTJCgail79VjS8+0hiSu8iYEvZsGLnd8vGmHPP
	0dbcnl9zMxpC/Ckv4x+JW2RPt95RQqzUXT9g9e7gER6hz+OVHdryIxoSz6GOPicsWRsaM56+rf6
	mwrOW/R1HL14tcw+w15jMdYbfeOW3+DUW/kc/UmbwPOAqA+DMV81vHw5VVI+Ocx1dAXMaps=
X-Received: by 2002:a05:651c:a184:b0:3ad:372b:1fc8 with SMTP id 38308e7fff4ca-3ae2b4f8112mr16428611fa.9.1794735479714;
        Sun, 15 Nov 2026 01:37:59 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae92dsm23598851fa.23.2026.11.15.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:37:59 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 0/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sun, 15 Nov 2026 10:37:47 +0100
Message-ID: <20261115093752.1287968-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Apply-time cleanups following Matt Turner's review of v3:

- Move jump_label.o beside the other object entries near the top of
  arch/alpha/kernel/Makefile, outside the GENERIC block.
- Include linux/cacheflush.h instead of asm/cacheflush.h.
- Regenerate the cover-letter diffstat and retain Matt's Reviewed-by.

The jump-label implementation is otherwise unchanged from v3.

V3 was cross-built with W=1 and boot-tested on a three-CPU AlphaServer
ES40 with CMA v2. The static-key boot selftest and 30 module load/unload
cycles passed, including cross-module keys. This revised export has
not been rebuilt or boot-tested separately.

Batching I-cache synchronization and relative jump-table entries remain
follow-ups. The early jump_label_init() call needed before Alpha's new
early-parameter parsing is carried by the separate CMA v3 series.

This patch applies to for-next at 0b4cadbe7c39.

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 65 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

