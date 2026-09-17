Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7183D5259
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631953; cv=none; b=H3MUfAKZpQIehwWPL3rkZHdjJ1vPIkLgBEIoxRF4eog0JmTHd21cnmwN3lT83iqa6Eor+5fREhQJXDHfI05LEToVEwIfXPEFADE76fNnbCKM0wI7GbrVfPGJms9T659z6+HZbBasP/2TG4N8yxoyO0bU2AaraWaYyHkkQhEtG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631953; c=relaxed/simple;
	bh=HzxMf9+8T6QPlATP3+kPcAW2ULqoRkB/P0Uf3YNk5yM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7tGjKT7eOrNWj0qRNhRkfX9y5IbOWtBKsJt/UEQeNs7Nrh8MdgK0yMVDHWAVOOTrclMGfZ+E4kUa/8wPvHJDhROWxopPuFqSo9X0OwyPEcSIKADE0QOhHT1XuMHZwbyiiEjyhlXnQjcmVtFcfyqhIWu6mQNi2MMcS3vfLPMdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huv7/E1q; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huv7/E1q"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso908843a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789631949; x=1790236749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOfKLa1W7BWMMHOij1kNXtl7XucEhCyieOIZlA8fo3k=;
        b=huv7/E1qv4mSBia1m5TrNhiFYEtn8QmwbBv2I9RqnBZKu1MDuvEWEvZitGzT+78nwh
         rhhRkfylBXu/eXedEhVsNC+qU3jhsdLh6CzwNDhsruCPWtKSKQi1BgPjGVhwFpDwPdbl
         Kb7QzUJC6F/acykt876juwDnHZNzXU/KUjE3ckB2FND/gGcLOQVP6RU0a1qKezyqc334
         GxAT1oIBRlCkcNOyxHZOF0J8GMbcCkUQLsT69XPnPaegWd0ymjRYpqm3EeVW9Ey22jca
         X+DRowM9fwsb3Md1boQkA2zBFELHId32ViGUiIqo4NsRVzsqE8yDIXNF7vW03MDYa1Uj
         jQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631949; x=1790236749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOfKLa1W7BWMMHOij1kNXtl7XucEhCyieOIZlA8fo3k=;
        b=xGZQFAlzr2VOjx3Ic7FdyMZQrP1iNbLFcyRQBIfXmt3BDHxGpgOEeVRbQ/YJBicnbw
         iCaVl1RDrJ3bcfRPZY/lavVRaOatDpmdJssMgAvBDCZV54HKoKokgpVx6DKx1zzdkCtJ
         xYbhMYnUemixsMRpgobdwPB1cZ2JdTtbc9bs8wE8jLSP+RQqgTYV6lj/FgCrz1KnaLO7
         1UYNMZ/EfqyEhe+aPvJYYO27o2Vu8ZcNP1xFN7y/FI9/9MdfZ+jk2yWdf4E+8hm7UipH
         pQxiDim71Rv2ZH/3VY2hdGm/T0hmlvEuHX5YiFJwPjREXNc2/CRXxu0tw2x43htQhFx/
         ocEA==
X-Forwarded-Encrypted: i=1; AKwUvBxTIT228+O2Rf0y/FSDRocBN+OLvVjC4jUclwLve87ez5xn0v0VCF1tszR8UcqwEzi+wHDI3uTTsbrQrcU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkawtffHsxUdkro6L57jmXom/17TK9v2amFq33NxqmAaB5NRCQ
	UPNt+AafkyUefZFx8wswq1E03n+2ZT2XV4NkckUfRCa/eeopi02THP6eP6IfxQ==
X-Gm-Gg: AYBFou191Tt69TQLL+iOGmxbroOor1RfmwSzs7yq0L87qd8hId8bE/w8/WnEdQiLrN/
	2f+RWIqMezTvQI939lSzJxVMnq/u5w7JKClCOZ2vQauIt7tM4eCs4EoUp9EPwtqD2bNs2XQsDB1
	7lReNXrlQHmUPxkHNh0onoDW5dba5eDTRDgOvZtL1tFnCYgkoRGW2mTY/C7/h8MinlxcBpfNW+0
	Z48BaQXVd4WhvvxZw5gAkNWNXe1ffts4xAi6A/grmQjol6c0xqD1RBDHqgKfEr/mP+8olllYL29
	SuddfOCz+XmXvqwmJeI5Acnaw4EvS6i1QXjyGVEo5KFEOXfBcXwoTPWMjEE52yF137/6PTqJJzH
	YcdkhSoPtARcZMqy7AqG7dnmjJKgo6tIT8X2cNEEMVazWpoEvVePEQ2n/csje5gkkToRnwFlPhO
	oM8zr5HhKe6FsY01AviqQ69Kdcf9AxvDXopq65FpN2z88zu2WeJsGnTyD62c/pQ3TbO0ovgzL4h
	rntdsYrO0fpDzMYMnbBJbZ28Gg7iGl7w0aPlbNUpg==
X-Received: by 2002:a17:907:6d1e:b0:c29:5af0:3b44 with SMTP id a640c23a62f3a-c29e52e0551mr377872566b.41.1789631949444;
        Thu, 17 Sep 2026 00:59:09 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453ea0sm250287766b.11.2026.09.17.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:59:09 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v2 0/2] sparc32: SuperSPARC SMP synchronization fixes
Date: Thu, 17 Sep 2026 09:57:03 +0200
Message-ID: <20260917075842.784996-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill two gaps in the SuperSPARC/Viking SMP synchronization paths.

This series is based on the three sparc32 relocatable-kernel fixes which
honour and derive phys_base and advertise the relocatable image. It does
not include those prerequisite patches.

These patches can be found here:
Link: https://lore.kernel.org/sparclinux/20260816075141.3489194-1-linmag7@gmail.com/T/#t

The SuperSPARC Family User's Manual requires software to keep at most one
Demap operation in progress across the system. It also says that an MBus
system must ask every processor which can retain a stale translation to
perform its own local Demap [1, sections 8.5.3 and 9.8.2]. The Sun-4M
architecture specification likewise describes SRMMU flushing as local to
a module [2, section 7.1.4]. Patch 1 serializes each complete shootdown on
sun4m and invokes remote CPUs one at a time. sun4d already serializes its
Viking Demap operations.

SuperSPARC maintains I-cache coherence by snooping, so no remote processor
needs to be told about modified instructions. FLUSH is still required on the
processor that wrote them: the store buffer is not snooped, so FLUSH is what
pushes them into the coherent hierarchy [1, sections 7.4 and 10.2.5; 3,
section A.8.2]. Patch 2 supplies that local FLUSH on two Viking paths that
performed none at all, viking_flush_sig_insns() was an empty stub, and
flush_icache_range() was defined as do { } while (0).

Tested on a dual-CPU sun4m SPARCstation 20, TI SuperSPARC-II with
Viking/MXCC:

  - boot to multi-user with both CPUs online;
  - 200,000 concurrent mprotect iterations over a shared address space
    (patch 1);
  - 40,000 executable-code rewrites, each replacement executed on the
    writing CPU and on the other CPU, with each CPU taking a turn as the
    writer (patch 2).

An earlier revision measured a stale instruction on the first rewrite with
no flush at all, but that was on a kernel predating this series, where the
whole Viking icache path was inert. On a patched kernel the same control is
intermittent, so it is not offered as evidence for anything here; the
argument for the shape of patch 2 is in its changelog.

Changes in v2:

  - patch 2 no longer cross-calls remote CPUs. Hardware snooping maintains
    instruction-cache coherence on the other processors; both FLUSH
    operations are now local. Callers modifying live text must arrange
    safe execution during the update. A later cross-call cannot prevent an
    old instruction from executing before it arrives, and cannot by itself
    make an otherwise unsafe concurrent text modification safe.
  - patch 2 no longer routes Viking sig_insns through the SMP wrapper, so
    that path retains the local-only behaviour mainline already had.
  - patch 1 is unchanged. It is a TLB shootdown: MBus cache coherence does not
    make a peer discard a virtual TLB entry, so each processor must still
    demap its own.

[1] SuperSPARC Family STP1020 & STP1090 Series User's Manual,
    Revision 1.0, April 1994.
[2] Sun-4M System Architecture, Specification 950-1373-01,
    Revision 50, July 19, 1991.
[3] SuperSPARC II Addendum, Revision 1.3, December 1994.

Magnus Lindholm (2):
  sparc32: serialize SuperSPARC demap operations
  sparc32: synchronize SuperSPARC instruction updates

 arch/sparc/include/asm/cacheflush_32.h |   2 +-
 arch/sparc/mm/srmmu.c                  |  98 +++++++++++++++++++++++++
 arch/sparc/mm/viking.S                 |   5 +
 3 files changed, 104 insertions(+), 1 deletion(-)

-- 
2.43.0
