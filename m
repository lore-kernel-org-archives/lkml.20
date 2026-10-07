Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CA45C6E1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363091; cv=none; b=LZB8Dhr09e6Hb/SvComsJhXFnIvUj7H4ZGPc5BCDnfXQCCK7AbRSIOliSJ14U/41H+cO0NYvTmcVE7G4NAKlnWHW9sSLqHQijhdmKxAlK5ch8X2/yYsXbXBsjpkle8h//1WsMf9SHIZR1BaqhbIgL1qfYz8EhqwZ1HxNwMoqStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363091; c=relaxed/simple;
	bh=klNl/ybEIa641DOqKc/6mttW0QKGkuJsEQXUGWEvK+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2viGrJh5ydOI/GKDp6SawZKd3kCVZT2+FDqavuQcoaxqBgTuP03iH62oJyoH+eV/fLVwpQDtk1PRYlvKxnIV6/MTsid++S3tgR9rrqO65TgNA5LIY+kFr3KXh2yP5xBpYj3o9Dk+t5MFV8a5SOCeayQ+XHHWJf3QDDppXnsJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=FtOKOQkF; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FtOKOQkF"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so932580c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363088; x=1791967888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=FtOKOQkF5QpwH9J+YIkJ9d6Obu3VpySyv2g0Hk/UvPy9lzoBVn5ZupX4593cAtw1Nl
         /VaHSayT0nMW+sLwmAQGrRdvI8LlGRKk+66oJgOr2VaJf3liiUVy8PG0vKlokyhw8T6m
         CJ3uRfjau0FSK8ZPI7mqAjKPi/W0PvPn93aXOwdCMaZgXSoeKIhDjRzvSSlA0hzj1c/Z
         +g6FFvLUHXC52qQNPGQIX4PgEojD9kQYF01QjwLvoixkt5aB6ez2ABhO6Z5RmyZ6//Xw
         g5YyyVud1JDUIyMJaYhWk4EZums999lNuKWLY/c3kK9iaaymvG/ELsyag2BB1WTIhYWm
         k+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363088; x=1791967888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=XFrDOMv2CdgMJ/rXNHpEafDIcWM0bnK5s6ZSOWCMgIkRE19z18Q35N0vqmk2XpbrMk
         osWGtD5eLpKb88bWLG8a849OxxRGlPO6wX2NuPbJrF/NSdPsogjbaAmO3M/hXuburB7P
         vYmUmL1w9dmcHixRUQoZwB0CMPSSeeiEkSluKxkSq5YHaecMGJhn0flC9eysJKn4XOMA
         pnaaar0h+Lo2mXxgcHxPxPt7H6xB++u56QFQRyV2TMEQIoFvu2qEn4lO+GYPWaNHK6c9
         xFNivtb3yeV3SitXTJPLPrWUBiTR9zD+fstI8S4Nb1ynr+x/XsCKC1PjVGg8yM3jZEUN
         rbsw==
X-Forwarded-Encrypted: i=1; AKwUvBw5TvazqN2Ab/20jNFZcgiZdk5R6s/xAgq5zvrK/gvlb5h8NrEaWi8bJMel72nnrClAVfBtoJkZzj0r22o=@vger.kernel.org
X-Gm-Message-State: AFuF++mVgQro0O+4vJotz1guR4h1T9yyl7k12wYEXQmx04BQl9S29lXA
	cSnwdBgnn48Hfft6LX8dUgwLb8tPehGEGzpt1OH3IlBMm4X2cEPpGxspCVemCkVpqGE=
X-Gm-Gg: AYBFou1pJBPtnLqEpLFCJkwor4sVIyf98TOH3FC9FcPnBpYzBTsnRSWhX2CSIplpKfN
	VddyRIX6S164dXPQBkDX7yBY3LnpW9x0vPVEt0G97AKKi7SD9a3+SRM8s7QvQg9NuFLZOzi4DNu
	uRsUyWxNYS04Izb3y7BgbbMMzI3y/afgJZWZ5ElGfr51seYgQrMxNTi5qaAXP+gWDL5gc4y4wZl
	KZNZP9iVFu8RVm+A51f+7AY20Fnl21dKY89JAFT9v16n8ikzK8hPQteDPnOf/Xu+rlF3eCOFeft
	UuEWwuORhqWLcUKQA4RlEHcY2FOyFGZNBZJQ1zUSYV57ypVrIvBBs/Eva1+KuvXR6OJ8u1C2+j1
	ymkRium/KEwoYMTaLZHA6TKo6bN5YOZP3Zqk3aYp7U11buStfJVZ4DtzjrigaT8EDY23tkvzxwp
	Kjyi70SsX8vg8awqK8JIfir5lbLNaGTdINCVWiMfzthm81r3KXhoWMfVgkakOiTCTNwf2GlEc6Z
	my28/ULDGzwI3PJVp6Y
X-Received: by 2002:a05:701b:2314:b0:151:d6e5:596b with SMTP id a92af1059eb24-162057f2d5dmr1554267c88.9.1791363088227;
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: Deprecate userspace vector control interfaces
Date: Wed,  7 Oct 2026 01:51:15 -0700
Message-ID: <20261007085126.222688-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After several discussions within RISE and at Linux Plumbers 2026,
consensus is that these controls create more trouble than benefits, and
should not be used. glibc will not support using them[1], and we don't
know of other users. There is also no plan to add similar controls for
future extensions that add register state (e.g. matrix).

Let's deprecate them now, hiding them behind a default-disabled Kconfig
option so distributions can avoid exposing them. Hopefully they will not
pick up any new users, and we can remove them in the future.

[1]: https://inbox.sourceware.org/libc-alpha/20261006134856.42295-1-palmer@dabbelt.com/


Samuel Holland (3):
  riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
  riscv: Deprecate vector state prctl/sysctl
  RISC-V: KVM: Decouple vector prctl state from VM ISA

 arch/riscv/Kconfig                 | 13 ++++++-------
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
 arch/riscv/kernel/vector.c         | 12 +++++++++++-
 arch/riscv/kvm/isa.c               |  3 ---
 5 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/deprecate-prctl
