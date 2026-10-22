Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694245;
	b=5ILtg/82gJTtQxdUUwNHI1jbFC28JOrB5dZvbGC7Qwu/Hzc/U6LGRwKAMHNvj2vkfUk3
	 BU8jLNg8QNTvBpvjhm6L3roS1V2WRiIgiakVic+jfEQboOrw+6hSeLeKDBg2q9OIFFI/W
	 JpRC5iF94ePdBfIBLrFNm/qz60IWnJLk4w8kC3KO+S5stVuXfiXu37ktSr8T/l5TZZeGF
	 jd9W6tTTWG8QFIBuw8PCpGoezA2J1rtixJnhFTiSXRWnAPvcky5Au8iW6B9wKaGsHs0ZX
	 vIS6ZpADkMxP/PYtHh48FsK5Xuo2Qz/K1OjXEXhkaIoIStI1pm4fNeWr6BD3z1Wggig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=;
	b=WQ3gEBnT++o9wl81NOmM5xWaSqAJYnVIleI/MqdQUIoCy1ejiXaGbQyhf2qL764W0CFG
	 Q1w0MQyE28d/fMC1bCEkrJWBBE9dpp5EELTMC/GOoNUMQlKsBwWTP7xIy5zio3MhKxP9D
	 umU5BaIAaRRsiESWg/E2a7XDu4HkT/gd7tk8brG7s3Xbap3wpTXhP2p+OjA8QIWyO85D2
	 ImaEfymrPxCzth32SK70HUOZdP1OU39Pkoe8zXLcAePuVu73554ZHuHrJgFpGbH2OiQ/P
	 eY1NMF3u/dYWcYapqxbkjf7i0VdAysnUpusufd5ZuOsj6exo6o0YxIm8biGzcUnlo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UEasAaPU;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037E60A3803
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B037E60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UEasAaPU
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98febe968deso123318241.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792694244; x=1793299044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=;
        b=UEasAaPUjd3nDF4vej13dH1Om3zvRljHNuyyTcBA7mDNRUZiJzHADEPd84SWLelerZ
         HVHicG0Q5XQJ66XWIoPZW+en1HMuIlJmvgWkvAwEkKVY9s1FDG1/NgeRso5czLU53Ghw
         Psn/0XKMuu7S7eaXiQWEcam+7bTU+4Iz5kbMuZfTv8hnkPM8tiulYgJUzIb8p0zzlVea
         yy8bapxXo9HLYNv9cYldRh3692rdtuyfFuMb8kLVkoWrmS5r0MZuLGeYGQLd29UmE7Vr
         BcAYP5KEKxAJKnk8L8nf4EURTgi7x00AUbb6Jv+hmMk4P0DpyFxgy/10gDJS5/lSbemd
         YJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694244; x=1793299044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=;
        b=ZWtJoZhsuXol+ccY7vBb4EVND8bJdLB1ssx4LHwG4C7Iu/luxwJMJXgrVUV457zzC5
         gOX2XUmJ75N542AqWCYLZh84adjED9lViu+4FrBSgdVDNR148oWeMovzBFAIAQyV4PN/
         HUO5VSCvEKHU5I5EecosxxWiBbDIgavXryE5mMWWyEUn39yvdcs5DcpV/Y1hnEJq+4hC
         UZakE7r9Hzazu+D5vXFtzdIvZRO8HUA4fwJeke5qUAhvs2+sZ7bu0W73VyRdCqPwzmVw
         sknL5S7aQOsiJ7SVF3s4WrIqRov3ZuerX+xFLtvdCqFRuRF1enBR0QcM63lsLf9qzYwL
         09ww==
X-Forwarded-Encrypted: i=1; AKwUvBxCz1GOmUusQsNkKNPm26GoXTKQDg2WhTqr3pmAa/bQ2kuWnt94wv2+79gRo/Vd6+7sU8mtbmLKIT7wjvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCss44WFgLCW9JAZOsMUW+qiPmFItcJgmUAnXyin6X7QiDG1RQ
	i+D7ROAdN+oyazn56uroptiDf/9+maQ4JGSmomiXsXt9slQK5dgqKxSZhK02Yqv6
X-Gm-Gg: AYBFou12yhl69q3atK+c7IXBKb4exy7iWqXrLQTj/BGkYqRq7Pavn+Ie1bRZNH1r+aA
	VsS4El3Lyba/zOc0liGbNsJOGShFvZe1yJIO+ZdiDwO9xvSpW6Ywp4m0CIAIcgO2VdC9vUAsF7u
	I+YC98cX7BblwWSRuFwY7WIkAzHB36B7wpXEw0yWLQvCum3YGYxW421RyYVlX4+vXDnLcXJPmXr
	C+fQOrGCvUDeWmmZzlOaUUsaYwGkCULGsM6YUs9BWhE4bc+ZB0jJpy6FnCJt51qeyc+EDVYAfR1
	0D7KLg7JAsbYVJZCv9WOopTbuoo57CPY7BSri2S0OkNlg/hM12AcFRp+49PBXjK9DE/rlw/EGOe
	FFE98qVK8MnGqvxddc6tKxbLBmbVZ1zC1q0T1YYEZJDFdLlPunnQibmDLXMbXUzP/jkvIOkVDZU
	mkR8Jte0R9kLCw/rW/C9QABR4isa5T0lXUkZuuKpBy9Mf+OSwWKK4AsJHdT6KodVbmoVf8JmHgm
	Cq7COzFf7vkyrdvQ9kye3yNviLBksLwVA/KYWvjkC+ykQBi2XDMImNO1ccRL9SGEK5UrZx20wo9
	5ia8wUrysBgO0gg8Mjkj
X-Received: by 2002:a05:6102:358d:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7ccc33e4ea1mr127424137.25.1792694243526;
        Thu, 22 Oct 2026 11:37:23 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc2052f7dsm581623137.3.2026.10.22.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:37:23 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH 0/1] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 15:36:57 -0300
Message-ID: <20261022183658.58090-1-breno3011alves@gmail.com>
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

This series contains a single mechanical conversion of the Acorn SCSI
card I/O helpers from ARM assembly to C.

The new acornscsi-io.h carries the prototypes for both helpers and is
included from acornscsi-io.c and acornscsi.c, replacing the
block-scoped extern declarations that the latter used to carry.  The
first argument is now typed as (void __iomem *), matching what
acornscsi.c actually passes; the assembly version had no C prototype,
so the original comment declaring that argument as unsigned int was
never enforced.

No functional change is intended for even-length transfers, which is
what all current callers use.  Odd-length transfers now no longer lose
the final byte.

Testing:
 - userspace unit test mocking readl/writel/writeb verified byte-exact
   equivalence with the original assembly for transfer lengths 0, 2,
   4, 8, 16, 32, 64, 100, 512 and 1000
 - cross-compiled for ARM with arm-linux-gnueabi on rpc_defconfig; the
   module links cleanly and nm shows both helpers as global text
   symbols
 - checkpatch.pl --strict reports 0 errors, 0 warnings, 0 checks
   (FILE_PATH_CHANGES ignored: drivers/scsi/arm/ is already covered by
   MAINTAINERS)

Breno (1):
  scsi: arm: Convert acornscsi-io.S to C

 drivers/scsi/arm/acornscsi-io.S | 116 ------------
 drivers/scsi/arm/acornscsi-io.c | 170 ++++++++++++++++++++++++
 drivers/scsi/arm/acornscsi-io.h |  15 ++++
 drivers/scsi/arm/acornscsi.c    |   3 +-
 4 files changed, 184 insertions(+), 137 deletions(-)
