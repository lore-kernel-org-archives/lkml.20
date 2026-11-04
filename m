Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777956;
	b=RKQRRzYLYe6oMkS5NH6waha9bhdYoSp4kWSv7WxhG51scWxn34NOGmUhyGMOIzJea+1T
	 Vk6+wwYRbajY/Dj+RUmljWwrRS4r1uHmJJM8pO7XsX/4CBU0WDYl2fZflQlvkb7sIePRe
	 OTxQZGB4ecX0uDrSvAnKO9/ajnuPe+KHS9C7mxRvnSfiKXetzvciRDz3/UR8klBVeN+Xq
	 t+JHFgG0cSiC/9jlTyIrqv4ja62sYYEM2dLnYdmkDgr4g4qwc3afOsJOpsIVHYzm9CGwU
	 7J3ytMhLX4Yw/GgU4mcEqodfYdAxCWjoAMRLv5SOM9G7u6s1JRBlqrs8CxNeT/EGULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQDrRsMXPh5gzx5RhyL83JNQGl7CwK0fOGMnPQOdIP4=;
	b=RmqJWJBJtIq8JyCf1dd8vQbU6ijqgmJoE5omulnXFO4FN0Wnlk44kNyFzQc3nuUK7zzy
	 MtvIk1UWylpa3M+2nO7MDzdPjQS5VMrU7FatMdNEqUvdfnJ1xrnDL2+tLFjmdezXiapAe
	 oYppj5x/3h5WybklAEJdThlclbY1kISbOBP727Lck60DC569HO/nc0pITu5bN0tBb3cN0
	 SDW3PuM+xwacYTisiE8H0kRllvJD7dFZsy4jcqRP96JKx6Uorng9voUuJj4lF9Q6ENRFz
	 hOJCqMCQXqMKGDsL8Vy4c6pby5WVjDbNQxiJGFyfBneQLk6wuS7PBBsaGJApWp3jM0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xluKvY5b;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF9606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DF9606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xluKvY5b
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso191681b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777955; x=1794382755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQDrRsMXPh5gzx5RhyL83JNQGl7CwK0fOGMnPQOdIP4=;
        b=xluKvY5bPtzusZiqfAdT8zEx8BcKDYppSVfcc7RpnUwa0jb3I28hrfeY4CSQ0MXPq5
         AivBg7Wl/y99ZZFjguIJczs6dI3rD1dXGdzwQuRAQvbPmWY4EFvzhUc0w4GAhkL+1uJc
         sOHcbkEo0uoWhXi07s2MA9Hy0b22ov9izi7W35R+tCbPyI1x4ck4aZOv2yEcb1F5YFCq
         wdcFZNBI88vcCTDAZG5C7VjQdrlgpoDk7v97mZYV9gBQy8GmIDc9nwm8ue7uKab5i2Dp
         Cq46CgEpOcN2y240XiEiTg69IJ54cALATRgO78h5zqlTwAwZtJqQqvUj1bEaWm2xwica
         +Z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777955; x=1794382755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQDrRsMXPh5gzx5RhyL83JNQGl7CwK0fOGMnPQOdIP4=;
        b=Tb+tI3Jy66x0iF+NFxqE2Npa2bAUazNfMZIw94s7Fqq9S6m4l/wnLnwMtHpBDmHmQw
         6/Z5x57774LcdVizZr7spxEE4scFbKXSp99MQmdJ1boRI2ZyRXbUlWuWNy393+T2TRTa
         aX59Ppcc+/OV2t2XslKlCiNFWa5F+jZWQesWdpkdijLu3oV5OkajaPnv3GVqa5/2Hc/Z
         YbxiMHOxyanOOgMQLKS9VDsr+oVXuzWP3iRAAWr1oNBF/f79MDeBb+TK8Cab0ds/23L8
         Ck9Z6pC04fm+ApWOTAGqLD16HOqfIe0Uhu3BQP2CNA/1jozAe5sZcLA2fbQfBU9yoRq9
         p8YA==
X-Forwarded-Encrypted: i=1; AKwUvBzNCLi4Ij/jkXrf1JRZUeGh+9qUdgr7F3UvpY/6zKbWwNySulAHoagZfZT5oyfuBZHs+KVHcL0lKUJc4cM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OV3ysc00OaZQOhrMiXFlCIGWNOkAfOZvyeaUHaQzs0BDQNf5d
	Ht6zYJK4pyBADWaG5YAKAA41Yqb1warZbU9ufa/jfrqhNfMt6vzKNAN4
X-Gm-Gg: AYBFou1dFDSwgV9CIIiTDIe8wGnZet+X5qyR6mby05Wc1UQXAwl5QasAe0zNVLXCeUO
	3XJoGKY/KlcwG5u53E+Juxakyb9yUCd8k408PVmKtjPhM7LinFINJL00CQqlmKT91ISFkbBVi+K
	tLf4E9WtHqX14A7ERqiRkDsGml82IiRTe4WCRH5BUWVl8iM+yHL4A40LZ5D3x8/tItvpebJdr/r
	PKe7iTW/Ejl+1cr0F8gX9bjBtQN8clDxXDxuESaoeS7iK8MRstsRIea7UyNZ4G/VaWyJkpzabUQ
	K+Jmtcm0psoGSQbaeQLRQ0/d5hnNgbwJ9q53Mjb+JXWl535BO1N8/0T5GyDS3Hym9UhOdlZFYUR
	j6wcH3bZEnzoEgYQy8kqWaEwuOUJoRAvtrD5arX4CEN7+/u5XLej3xSR86FjtzBIN5RD6clNTPj
	fO80yGqM8uuU/kf2JJnYZP2NtsP4bbKnwBEbRWjTSjk6Yn9wtfYuvpGA6xjkEuMEkWKEBad/1Uc
	nAYqM0HiqknAoGr2S7LpxBikjy51R2z15GarQEpOmoqF/PxA8zBFUg3ihSsVw3ywOo9TwGRsxvm
	58gAgpS1MvkKXAoLa8tONAlupVot9JkYhoy7znS4hVgdItR0OPoSaB25X+YZQseXpsSUw0F/SPe
	H9W8Uk165xhdSWPlnMC3zeYA=
X-Received: by 2002:a05:6a00:a0c:b0:881:e737:8213 with SMTP id d2e1a72fcca58-8a9ba806f29mr9927231b3a.7.1793777954738;
        Tue, 03 Nov 2026 23:39:14 -0800 (PST)
Received: from localhost ([103.109.144.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91d32sm543783b3a.25.2026.11.03.23.39.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:39:14 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Zhiqi Zhang <zhiqizhangg@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 0/2] bootconfig: Fix maximum-depth key export
Date: Wed,  4 Nov 2026 15:37:40 +0800
Message-ID: <20261104073742.21202-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

I found that bootconfig accepts a key with the supported maximum of 16
components but fails to reconstruct its full name. This stops the tool's
list output and prevents the kernel from creating /proc/bootconfig.

Patch 1 moves the capacity check before collecting the next component.
Patch 2 adds a full-output comparison to the existing bootconfig suite,
including a check that 17-component keys are still rejected.

Validation on mainline 05441d697f7f:
- GCC 14.2 and Clang 19.1, -Wall -Werror: 82 tool checks pass each.
- The added test fails before the fix and passes after it. The independent
  nine-case boundary/round-trip matrix changes from 5 pass/4 fail to 9 pass.
- GCC ASan/UBSan: the reproducer and all nine matrix cases pass.
- Real arm64 kernels under QEMU TCG: depth 15 passes before and after;
  depth 16 loses /proc/bootconfig before, and exports the exact key/value
  after. Both kernels use identical configurations and initramfs inputs.
- A full baseline W=1 build succeeds with existing warnings in arm64
  sys.c/traps.c and sched/rt.c; bootconfig has none. The fixed incremental
  kernel build recompiles lib/bootconfig.o and relinks without warnings.

This is a long-standing functional bug, present in the feature's original
commit. Mainline, linux-next and the bootconfig for-next tree retain it;
no matching posted fix was found in the checked public patch records.

I used OpenAI Codex to verify the issue and develop the fix. I reviewed
the changes and wrote and ran the regression tests. Codex also helped
with additional checks of the boundary cases.

Testing is limited to little-endian arm64 with external initramfs
bootconfig; other architectures, embedded/forced bootconfig, allmodconfig
and fault injection have not been verified.

Zhiqi Zhang (2):
  bootconfig: Allow keys with the maximum supported depth
  tools/bootconfig: Test listing keys at the maximum depth

 lib/bootconfig.c                    |  2 +-
 tools/bootconfig/test-bootconfig.sh | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.54.0 (Apple Git-157)

