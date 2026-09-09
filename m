Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC39581249
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971608; cv=none; b=Kadqwaj1DOrnRSsWqAWmqSBL8gs4iNCOm/8qjF+mLtuf5UJGQlV0x6T8/5bEm9LYfXT+sUjBqjcqvPy1whAc6QYWBBFOWWjRdG+KY5VkaYSdMhLJgVi1WVj/UoctyZseY+ihXnk6eplIRLcSVqMVjDAIJuagPYYHWwepMtDEi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971608; c=relaxed/simple;
	bh=fCW35xgKw5mFk+CXjYnTpeFbSTqOKRG3KOCt7lMests=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Rr9sOca7lw/0BV4k5z9KfAfFiPTNtCDgjIyw88p8FPcqhiU7n8olorxe0CMA0iKJGmwfWhscg2Fzc3fb6+c9O3HEbWzdgzbimN9WTp4JSga8OQLbyqh8es+ED6LLpHCcMHCk8ItOGY94CCFtlXvRM+AqUMVbZBs4wiHUFqLL4pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=boANYOM1; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="boANYOM1"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482db84a6eeso5487872f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971605; x=1789576405; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9F29pgqzSEEGhdKXzSoeSjrkWbfxwwKzWWjbfaJg52M=;
        b=boANYOM1dLySPMqqwilMxw0PlgovxSDhM8kbEZdPbWd5CofM+MBNwRQu4zaKfNPFhe
         65ppFf1KN/lrmdMsILeZlyGl8rFR5l8oYYmEsXfjYGKFtCNFCD0vTen/fQWRTCPnvuMh
         cND4LaMnrmty24iTe7Hl58Qr5GaH/1aAWvc4A/3TwMOxXPZndpzP51kbhtvme4wjh7uF
         SngNobBz4iXO45051ULkqBJjDsA/fWC/NTA1mGIfrl3/zwi4IEGfpqskADsZqMKO3C+C
         H9OEaVlcn7zHKfCGziz1cmsaRt4Tmv9yK4sZYyo9t6ClnGrcmCIW9YcZqUJRGdwystoX
         Oj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971605; x=1789576405;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9F29pgqzSEEGhdKXzSoeSjrkWbfxwwKzWWjbfaJg52M=;
        b=h9HsCVnoKPp6kimBjsyXjrM18MZho+qQoTrUgfefy7gQR75R5eS8ZNQ+EzJY0xge1N
         5yuoBM5t0jxa5YXFzPpItWxdkmbIi32rI0kMo3daLhmXY5FyiekA8P1VWp+RrsMeynXD
         Yuha69TuyynDYQpjFf0xdkMcah/GttEujl3olZAl739MRUCRrjX8tTuYblWOIdnOqpAq
         CEDe8oVTjrUEMtY5TpGgfBl6nI1OnFNU0rXf6IHy48yE9/FYx2Ey0U4KXY7/d3Mu5+if
         BEEKp1++OwDeoc2FW0dV+h3zADB4X5nK7RIrtmj3XIj13gXisP1weenBo/6njeBfm9nA
         YE5Q==
X-Gm-Message-State: AFuF++l6jXmOXuuyP+DB6itDDdk6E/rVSMq6FxPzMfXeTnM5ze8jXucr
	bhQH9fy2i9tZbO8BQBWlXL9sJzx20pUKm561eHyxUKfokiuLdKF6WKM+BaOzEMeh5XUSfTgA7w=
	=
X-Received: from wrbfm8.prod.google.com ([2002:a05:6000:2808:b0:482:9ac7:bf8d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240b:b0:485:adb2:625e
 with SMTP id ffacd0b85a97d-485ba5ac434mr5089735f8f.1.1788971604178; Wed, 09
 Sep 2026 09:33:24 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=ardb@kernel.org;
 h=from:subject; bh=BN5mdi+XwJG6+zGaZF/ZnbkuWncM32zZoRVtJEYNAIU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV8Bqf5uZVoJFu1eunuMvsyBTRXrrVpNvRxzb5bmbX
 zabpP/vKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPhiWf4n8M6XUJFWvTICnXB
 PMMTv4UcYqb/fuV343ns2pWy/jd+BTMy7HhcG+ZhOe+g414f1zBng78K9jnS5SuUpy7a2RH0v4m NGQA=
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-4-ardb+git@google.com>
Subject: [PATCH 0/2] ARM: Use type override hacks only in NEON code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that the RAID-6 code can no longer be built for user space, we can
drop the direct dependency on the arm_neon.h system header, and include
asm/neon-intrinsics.h instead.

Since asm/neon-intrinsics.h has all the type overrides needed to include
arm_neon.h without conflicts in the uintXX_t types, those hacks can be
dropped from asm/types.h, and so the file can be dropped entirely.

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>

Ard Biesheuvel (2):
  lib/raid6: Switch to Linux's NEON intrinsics header
  ARM: Remove hacked-up asm/types.h header

 arch/arm/include/uapi/asm/types.h     | 41 --------------------
 lib/raid/raid6/arm/neon.uc            |  2 +-
 lib/raid/raid6/arm/recov_neon_inner.c |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 arch/arm/include/uapi/asm/types.h

-- 
2.55.0.1003.g10538fe699-goog

