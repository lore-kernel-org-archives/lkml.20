Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876667;
	b=nrzRh0MWjNMcE81XFlGK8ytXvFPRHBDS1Q7oNe5YvzZJgBRtgEU9UX4yW6iaxu179evT
	 CWIEv27MZ2N5RE6O+n3ORYntHbuKPI33Hmi2xga5wfBBG6RbZ+jApSEUr03ZeTEMWsZsH
	 qTVFtFF/PRFDhHgh5tr2Lmlvc1iAVm3RdDnCBwemNOFqtuWihTYlftBzYgePVhyeC2ldw
	 FaYjxW2D37s4MldgS6lWCBpyrN5Su2A55DIXiCBRWcE8WYwahXdMrbxEErjfQCR3TzVFS
	 1hyFTeKGcv4aDanvCN19+s6R2NtMNxX9dwNMK1223inUFutKAAEaLlGui7kHYzbIuwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
	b=mMCB6UzurX8Amz48/1DjL27U4wu99NKRcixO+ckxGPPC3fWOLIKNBp/lsYBsvmBoRwh1
	 LzcEbFEuBdScOXFeW8lG1AaK4UQfTS5bEUt8AQyXYzjdKXZwrd4xY6jPHag1FijgORMEu
	 LsA6OBh7lKkb+R3O0iiWAeg82tV/JOUEKKjt0aNtECT2C+nqpn2FGquZEgI2otQd6+LrV
	 U8xPpGUaQRDTq6yxGY/DIvH3vTOHie0u3ZdrtCPS/abtU/TrQDiKIe0j0rFMDvQSf6VL4
	 X92RKlGDEQW5y4aC8u8yRPRqv5+05yPZtSHirYmidt4mBPRwXxw8yf+mTBIrb1FeIEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQOnU6vb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF912606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF912606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQOnU6vb
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2399204a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876665; cv=none;
        d=google.com; s=arc-20260327;
        b=CWi3iwooUDsgi3cCrYcXtPGQHjqkioMHARewhnsZeVspYAMcgogENhgc/Snc8B5RWU
         d42tSDO/qwPXbH3OmobJBGIlEQsnKACPGrTqYPXqBBZOvpSm/osBFG/B7j4W+SAMUMv6
         0KvuT6nhvq6fqjFp5LoteXQS98MYKuu5ANhoW43E01f+gOt8cWxZOJ+Z+OWf3TrfwEA9
         /zx72+lrhjSxfk8TqvP5JC46EIvu73aXr/Q9Zh2BIHKL8GbF3kHGJsWrXe8+dT6ptGi5
         V2+ml+ITXNJs7C1SuPQlfVuqtABTJ7i6/KfyEmuutzUmmarf0obbmRckPPQqbh7LThEx
         ob0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        fh=qfCFHu4g+L/yPEz5TXrw5YuqzRz3puT3TSvJ3PtC4r4=;
        b=nUfz6fMcxnEbQSoC/NhT+DwVt2e2ZiGVMMX2AYiY1w6CQEhz+9R4Ico3L6xhHeHPaK
         XUTReaPe0Lx9/jXvLxt+DHkrCz6ChU8UDM9g33wuchdcv/v28FRqeGet8nBKMLUBhsyT
         JuueGSDUrSpFa04asbu4e08vUIq2NhsGiHRKIhUqIVnKNj1sLb2SOaEj91oBK5nLva1y
         7QHp0iVIT6nShCj9mGa8p/beDnalUmZxbrEWen9UgObh8GqZyhIonpBa8WkASa203xuB
         b/I8OQPCXvBQ64+acNFI5a9GHpsEGcawVxlsTxN3aNd8Ky7ndl/Ql+IVHs8/OjwIb3xd
         +Jqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876665; x=1794481465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        b=kQOnU6vbvBlzv2wUJZDtjXRES4K22AB+2nCtRX+9Xrj9zVV7catumRxrq4w97sScb+
         D0b/k0GCpvaD2/yHptMwAWWemtEc2miD9yMmOdPGKZyoXQRWrb7rVbK3AYMZ9Rc3Jash
         KgMuYB3j70JjdeTrhGL/vU25V+8nNDgBITbzwCtnf2tErJXYLI46v62dA1BU+HGThpGN
         1G/kJTSyYfH6nbzUhhKlwieUnsmdxAu/4jcsFZbJljniPT/49bgCMotpjT5vdZc6YsYs
         hv2N69uuAr7wFzNj7MmI7Em1zZl+SqYMwevSeUFgqwJLDwbzaYuVMlfPGPxr94IdTClQ
         pmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876665; x=1794481465;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        b=ggfyrR8ZPvRjNF8swVFnLVZLwI8POnYwnnoJ4yRFJBjKOY6MirggJw+CtWUWg4PMN3
         dYSecRD9t7SxCTdKE7TGqboOk8TjDdlphPb6WaQS7kva7Zc+TgiEsAnqwLcF7vdfq8lq
         Xcjoc/DjclrUZ3xJrn7GvVpzrpuAETi1Y7zcy4JWv0iYM3TC2zMGERltDo/sA0cT/uZC
         AyiTYxPT550ztUkLWOqjtIyC3G4qrE5PXYKFy5GnN/BcViMJzZhR7fodknn6H/9kTQCi
         j4m4EHtMA8STTTYHWMlrgagYRskz5kURPt3f8JYZOpmXzoq4SeylE+9cDnaxpsLLzpUG
         1Gbw==
X-Forwarded-Encrypted: i=1; AKwUvBwKjhTAFxgBeuSCE2wwa9VUDXSvkfOtAwnhowj15sJKhxqqaFrirnp9IPdgqhcHemFzGYLJKSkKp6KjOYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V7D5njmyGr/YGhA7gT2cjPpGYexJDkLeo17ifo5GNyzO5tLWv
	hqwZU+z3zZwK/xrpBWi5CEAbmQe2f7dJpMaEK4pId+2Eili7a0q7MDn4ED5Flkb8dMu1O3ZRFS4
	h8n79RZCLKaLfsr7i++49RG+fYxkm0kU=
X-Gm-Gg: AYBFou3KncjuJWS3ymRgp6CVVlq1h5FYwThDyALTGaus5y2hsgKOOtK9daIXpJdMtgl
	jtrHoVUEE6hXbaCVNyBU13E8tEVHLbN3KiWSc2Z0zqei4rKs6JPdrEuq2Zm5OK0mnnwAkxkkDvh
	etDy17oS3accdykwHehDdgtExmiKSFMTZdQ0rYlKW6ok37RD5SXutULwHDoy+Y+n9sqVun9H9y8
	jMP9z0zbsrGX7G4c4/4KvKlxlXO4xPq+NpCPlNf83yl3hIYn6kWB6M/UyUsRkdOhcEKLqjeqgSa
	x4wbeh6fdU8fUx02Mazfx+BD+FQ18+81dwBq7XZGuZoVESiNyln2k3QlCS6c7mK0EY7sVBF/eWt
	Yvh2o6b1r6N9rNceuDbXd3dGzXZuyKTkWNDDKFsZMgRio0beznZ3CDayHPZQUqzp3JzggpWFAYt
	+8jLxIM/i4r5d4SBOrj5JEEFFVbCuu1oXPPAdpAw4pPdedtW3zPRjUBjff02jg/OtPWMr0I3lLQ
	qlKvjgaCqIDjqiP8A==
X-Received: by 2002:a05:6402:5007:b0:6b1:da03:d01d with SMTP id
 4fb4d7f45d1cf-6b4d553643amr14135108a12.34.1793876665167; Thu, 05 Nov 2026
 03:04:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:23 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 05:59:25 -0500
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 19:57:54 +0900
From: Florin Badita-Nistor <baditaflorin@gmail.com>
Date: Thu, 5 Nov 2026 03:04:23 -0800
X-Gm-Features: AclHuK-4Nom9RDl4FW6BHaQMolk43Eurezlxzr6YWIJOrxIPsqAN2ihEbuJFFYo
Message-ID: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Subject: [PATCH net 0/2] tcp: fix false exhaustion of odd-sized bind port ranges
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

TCP and MPTCP can reject an automatic bind with EADDRINUSE while an
eligible port is still free in an odd-sized local port range. For a
three-port range with its first two ports occupied, automatic binding
always fails although explicitly binding the final port succeeds.

Patch 1 keeps the complete range length in inet_csk_find_open_port().
Patch 2 adds regression coverage for each free-port position in three-
and five-port ranges, with both lower-bound parities and all existing
protocol/IP fixture variants.

The issue was triggered while extending port-range tests with Codex
assistance, then isolated using userspace reproducers on unmodified
kernels. No kernel instrumentation or fault injection was used.
Codex assisted with analysis, reproducers, patch/test code and commit
messages. The task was to find a small networking contribution relevant
to high-concurrency workloads; the missed-port case emerged during that
investigation. An independent model review found no correctness blocker.

Built and booted the exact net base below and that base with the fix in
separate x86-64 KVM guests using the same configuration and binaries:

  New regression test: 4 failures before, 0 afterwards (8 cases).
  Full port-range suite: 4 failures before, 0 afterwards (80 cases).
  Two existing SCTP late_bind XPASS outcomes are unchanged.
  Go net.Listen with a three-port namespace range and two listeners:
    IPv4: 100/100 failures before, 0/100 afterwards.
    IPv6: 100/100 failures before, 0/100 afterwards.
  Explicitly listening on the free final port succeeds in both kernels.

Even-sized candidate sequences are unchanged. This is a correctness fix
for odd-sized ranges, without a general throughput claim.

The userspace selftests were compiled with -Wall. The boot-tested kernel
builds used W=1. The changed allocator object also compiled with W=1
under allyesconfig and allmodconfig (object builds, not full builds of
those two configurations). The baseline W=1 build emitted an existing
Synaptics input-driver format warning outside these changes; the changed
allocator object compiled without diagnostics. Both emails were sent
through a self-only transport test,
read back as raw messages and applied with git am, reproducing the exact
expected tree with preserved author identity and threading.

Florin Badita-Nistor (2):
  tcp: avoid false bind exhaustion with odd-sized port ranges
  selftests/net: cover odd-sized local port ranges with one free port

 net/ipv4/inet_connection_sock.c               |  2 -
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)


base-commit: c6b41de4dd9f2d6856d8d8d292348f7961034152
-- 
2.51.0
