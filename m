Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A551C84A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783114; cv=none; b=kvWMREGk7rjJSQPPPlyuGrr/YWbWSUpidHpjd95m4tw3NBAj9tscW0gP9MrJeluLR9SUVdV7RCogTYXoFg3F6BdwTGf4Thc37bRWKnPgO/N+oeNwXs/rPYz6D/gEseVEoKSAJ3LvaN76MIHnIvAx0ox+DfjNZKBRTPh/+MkwDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783114; c=relaxed/simple;
	bh=BI27QbrWjjmOhq0vm+C2W1vKU07fUKUO1nutLE2yO7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H4vqtma+FCFOg/uer3RxiNllxE6mniv7nNS9a4cFAXLIqF7hHWQF+ChL7csCXsNMxIhDKTiZ93QJAEBTnHDbq3Id22EQBisBXRT/Gd5ojbh2WQ4ejpWeVgKZbnPmZbj0sML2NXf/UY2SUFvgXSpJomo2LRaEC0aa9xeBSf7OlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ippr13aj; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ippr13aj"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2e2dd05994cso4714635ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783108; x=1791387908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KtFxMZqoC/C9wjoLY4kZHSKtrMqIy/tVOF52WmvrDNE=;
        b=Ippr13ajCu0dNxqLuFBnKIlHZ4ZBW76/NQ30d8994okPwDbmxpiYAVwYJZZjgIplBQ
         NNpmBh0V9GZc9h+SarSlhzOQw2wYRuyyqcICxxCyNk3bpU3Uu3gxRRugar1PNtr/skdi
         1Gw+MumL7fIdQHRkGI6thy7quclwvCOO15bf8s3BU2JkmHa8hYQvN04308jI7oelniQM
         fRbqur0X90ZpNQvwPsW9F+bY8d6D/h5CHmhuXbDMJe/qSsaVVui1FOcs6rVHt9Un/vTh
         kySoe6ypKU9dC3QkK56G9R17X7hssehvmMquKu7ocOeyr1ul2sCyFlXP6G9/kxjL4aoX
         Em9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783108; x=1791387908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KtFxMZqoC/C9wjoLY4kZHSKtrMqIy/tVOF52WmvrDNE=;
        b=os7ZKzwG83YLVaohYSA6JSmtYmIY/B3RPjZnV9qnoTPaYJM0gBt6gvpAx3OY9w0Wip
         V2m6csol0bbGSNv2EZQU/nWWAwvG7W+sXLSHjqtC9NOsxd1+J4FbG3dl3aQQ2nspfntD
         H6weKhH5cSfCdjgE/7Dnw8VyzlVxdjYO/Ut9ouuangCjJYIHQa7Dck7MrkPlTrPnhye/
         vLV6Alisk0V8XLoPIwsvL4Is773YuFuT1KnvU20Ujdyp1sYvQMe0eTOlooZRlrPdkoAm
         /uQgoOoyn/bqfoT4nyem5akNBM+4ciZ3OD1EAbmmDLRA8cT9pUp7GfK1ODJ02LUF7Soo
         Cbsw==
X-Forwarded-Encrypted: i=1; AKwUvBw6gRNF/LrGHR7oF44A5GNDe3Xb8ql62wrZIEqlfDznA/+jrKovlESWSjPmcsrI+CSx5uVO2IYF7RQb9T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk9ZmvsOAFiQli9BOSoNGXRhYTol9GCAcJ2bhxh7vwj4FTkFXJ
	MYroJcO4/d+mZPjHfEEEXo606q/ZLcUa81aBhvS9URRhoASFH/Nm5++n
X-Gm-Gg: AYBFou0h7+HNCG7xWrkJkDmgdcAfmVpoSyRsUmm8LY3V/9GMZQKNMasczWAnEL6kh/m
	NiaphUG+qkvsRxa5rESAP7PO5rMv24JLP76JUY52reBtj2RY9ALAfyVN/VKuBRliqYmwu3kovtl
	6khc9jdBiz5uypsCxAuJYy4auTnltPpp8ieXoNmfPtxidQjf4gxXWcl9hYVtehaCiqkWbLXR6fc
	n6EVU0pmmu7pET2NBfileUHC94OPlybKaDnikI8u6XEX43FFYyPAwDt7/4aVS/YjUKKOtXws1Zm
	PgDK2DWBLLND/XlY4U/vPXK85y2oxeNnyGgwpVfFVMeQ3OHN1PPV1DY8DRzibII7kuqMJkDP6sD
	y9qb7OzGYifbbFZtZD6qD5yxzIYxnB1KZp8y/eYfqikxArm9/ugShpe16q6v3js1XCsOlEoFN2e
	KdgM846ZEvB9WUquMRQN1viBh4TYytCKbsO0Q2atDdaqZ+ZD4WWLMYEmnIfkI3XfcKjCti1vqsy
	HoMjh8AAiQ=
X-Received: by 2002:a17:903:1a0b:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2e2e4b3564dmr15723135ad.26.1790783107626;
        Wed, 30 Sep 2026 08:45:07 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:07 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v6 0/5] vdso: Keep the CLOCK_AUX base at full precision
Date: Wed, 30 Sep 2026 23:44:55 +0800
Message-ID: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v5 was dropped from tip timers/vdso over the 0-day build failures.  Thomas
Weissschuh had already told me how to fix this on Sep 8 and I posted v5
without it; sorry for the wasted round.

lib/vdso/gettimeofday.c is built into the vDSO, where linux/bits.h is not
available, so the BUILD_BUG_ON() added by patch 5 referred to an undeclared
BITS_PER_TYPE().  The compiler then treats it as an implicit function call,
the comparison is no longer a constant expression, and the assert fires:

  lib/vdso/gettimeofday.c:288:24: error: implicit declaration of function
    'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'?
  compiler_types.h:702:38: error: call to '__compiletime_assert_5' declared
    with attribute error: BUILD_BUG_ON failed: clock >= BITS_PER_TYPE(msk)

New patch 4 moves BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h, as
Thomas suggested.  linux/bits.h already includes vdso/bits.h and
vdso/datapage.h already pulls vdso/bits.h into the vDSO translation units,
so no include changes anywhere.  tools/perf/check-headers.sh tracks both
headers, so the tools copies move in lockstep.

Changes since v5:

 - New patch 4: move BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h
   (Thomas Weissschuh, kernel test robot)
 - Patches 1-3 and 5 are v5 unmodified; patch 5 picked up the robot tags

Reproduced the failure on v5 with "make ARCH=powerpc LLVM=1
arch/powerpc/kernel/vdso/": two errors, at gettimeofday.c:288 and :442.
With patch 4 the same build is clean.  Built all five commits in order on
powerpc, each clean, so a bisect does not land on a broken tree this time.
x86-64 and arm64 vDSO plus lib/ build clean, check-headers.sh is quiet, and
checkpatch --strict reports 0/0/0 on all five.

v5: https://patch.msgid.link/20260916023252.418473-1-zhanxusheng@xiaomi.com

Zhan Xusheng (5):
  vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso: Move BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h
  vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask

 include/linux/bits.h       |  2 --
 include/vdso/bits.h        |  2 ++
 include/vdso/math64.h      | 31 ++++++++++++++++++++++++++-----
 kernel/time/vsyscall.c     | 26 ++++++++++----------------
 lib/vdso/gettimeofday.c    |  2 ++
 tools/include/linux/bits.h |  2 --
 tools/include/vdso/bits.h  |  2 ++
 7 files changed, 42 insertions(+), 25 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.43.0

