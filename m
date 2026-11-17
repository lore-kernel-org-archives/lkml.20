Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925533;
	b=whyqphx/1XU1il9pti1ZTcI0u+qYejwyx8VYKxGq00sUZwqc7H50IJWvM/RTR8KLk7K4
	 tZOCP4przYHvqTXJ+1h3k+QwDmdKk5sksJymPBIhdLZrk2YPGWWsMGuZvUzZWko20Ejd6
	 rgXDCshB6xqn8VuGHwzOyTD6kJr3fsyHQ/xidsrYo+OFyyLSDrYqlnBTac9Ep3CxtNvWs
	 3YkWHCuYDBxXXp+GxEWnPTFJ57JL1fQhlv1Dfihf4eoNzih+3Z5J+37SDdt0fgNjorWA5
	 bsxT7odo30Rui1LpykGUylEYKBjtEgW/B/x5Y4VaCWaTB2CjJuC5kR3xD+sa3HbgajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VuZddKkmAmaYgOMBa+Lzz2VPLUuC+ZWxc4bgcJWjLWw=;
	b=UwEHHRkeTTUx3Gn+4yAF4eSvD0TCBYan+zclFPYSJICrpiADCJWpvt2dkxIUJhbbRsLR
	 QhWfj5kZCStgtyH80QV3MFfM7/fZS4z5e9vePyyv6p4A5Rx/MaoR+xGOyl4RJZ06EPvEn
	 a3AnbI+/hRTX5EJwzDpMEIGrmouQr0OxH89IhTHnAJBT8XiFyyFagfzv6udyCoq8jVVPi
	 PelF9265eJjzVPeup7c/6SJf+GeEAy3NlMPxg5ACJz202CKi1aV8d9KEUxwMJjY16y73Q
	 94s14s16aba1vROZ8Dvy3jVVVFmC5D53Uwm4HSyPm6VijatE4A0jgPRycKSs7twmUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="muFz/FjR";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B151606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B151606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muFz/FjR
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ac798b8bbso2366426eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925532; x=1795530332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VuZddKkmAmaYgOMBa+Lzz2VPLUuC+ZWxc4bgcJWjLWw=;
        b=muFz/FjRovBJKn2Elu8zoPpACD6lJI4JGRM6c5pLXzo332ieg8mC03G9W8RTEO30bO
         H2q0fR8MGHTKf5hQ8RCgP8qmB2Xmv1YKG1hg2g29kcu+NxXTjq7UVUbWqQH746cGWUhb
         Z7+9kJjl0Q4ridAgsKpKURG+kV7blbmnn5Yq2xS3j4keguq5SkyTzGq/dYTl7vqgAlNI
         mWLga1zBZUBbvNJgzoJmeUq8SYVQCftBJ9DIYNgGyoblTOXMuzG902McXJOM839CnI1/
         O2IlzvCU815osz/rrp2A6H1+bOYmwsSkexNgnppBods8YWzL96qTt2e/hx/w0AE814Jz
         eWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925532; x=1795530332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VuZddKkmAmaYgOMBa+Lzz2VPLUuC+ZWxc4bgcJWjLWw=;
        b=d+78GlnncywbmUxsFFhX2TAs7B5z9L/piJvBnQrnrFr+qQj7h0Fk5rZFDmd//kO4tY
         hZ8MQeh9yBImKoWDbdrUgHj8sENjwYvVlYGhfQTBmiXHLaB3h1NOJr4ch9Zjd/ztsRXO
         vIpvc9mLINSu9ZoGuyLaJFOWg/lWLOZggkWuTESXUqAiHxGDphETm0puD9dDVtEEe/4c
         Px/sKww7CCeFy7c9nN/Wy/lYphFlqFYYDK77J1L1BgWgCQTHdVWgl1iZMtyJIhEkhk2D
         7cdLCcGB9F/Bvl0oIgTiSgax7BrqrccYSBx6QTkiyng3iZ8KP2N39NJpXgb+DOBR4qLw
         HyGA==
X-Forwarded-Encrypted: i=1; AL+hErGM9PFU3K/beAoW3Is4oIxFxJfwFaVzPDssXzAgKBauLN6mR436AWQxM0uPD/FwcecQMeiKj4i/pYz3EFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0vA67rCdKbT98JHn9BX9m3Bj0/QsVF1TQNTzaJTTD48g2eem5
	KuY3s+37G2U8Nn7E+DMddtx8grwFolRjW0f05P4mTvXfGjXp9CtQl0mF
X-Gm-Gg: AYBFou20A1V1Y7BnOvrw5ZBv09sT1gDv6tEDCRRP/fQ1MZsqh57L+lz0GHWnmlLEEpx
	iCyacgkr2wRALSwxirvqgw79pDTErxvo2fnt5ybYCHoz3PTDPxcmZNX8NXGNCWpCSWRZOcGnn2F
	M9q8o4EbmwFvWpWO2XIBvsE3WvuDLULWxAQJiiN9XXL+zV2aLs+Vayjyu7O0zvUljmez9IlyilA
	zdvsGD1vvXnPKL0dkqGmA8db7CCcFXAte8O2C2T6vb3UNMzsjYckZgibAt7CTjIPJkAnM7z8Gmn
	ai6nT8p5iQLvRKOb7RGUSQ2ccv/NCnYfYjZBLv52memqKv0wNeAUVoEOZaQf+t8ORv/5whFIlkX
	MHHjZW/hdKch0eEDg4QpPtVf+fp7LKsbFeod6Wkua1IHjYoYzRvlK73ocLmCq4a6eK8CaJ3gSwg
	2R4d71Kn1jiq6i8srrQRErCPP1P42c0jF4gIMUJYNS/VJ0ZVrHqpllJOvLLasWEhLRpVIkDqZ9b
	Rff07Md/o/3fta8b27ec6yRnSsPmW58M7Wx2rRy1GMebieoQo2yotF9jaVB5+DunLzQSPrD6cxV
	/K83nnfArSmHPS1Gz/Ev+0P16EOlp+Gazw==
X-Received: by 2002:a05:6820:8914:20b0:700:da68:739a with SMTP id 006d021491bc7-71ab5032398mr6453455eaf.47.1794925532060;
        Tue, 17 Nov 2026 06:25:32 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af0a8a18csm5313709eaf.4.2026.11.17.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:25:31 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 0/4]: powerpc: Misc fixes for debug kernel splats
Date: Tue, 17 Nov 2026 19:55:16 +0530
Message-Id: <cover.1794924821.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Enabling debug options like PROVE_LOCKING, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP on powerpc64 showed these warnings.

Main motivation for me to look into this was - many folks internally reported
that after generic entry/exit feature, they aren't able to use lockdep because
of the warning splat it generates during boot, after which lockdep gets
disabled.

Therefore this series is an attempt to fix the warnings which are generated
- when we enable these various debug config options.

v1 -> v2:
========
1. Patch-4 fixes a pre-exiting issue pointed out by Sashiko.
2. Patch-2 and patch-3 from previous revision is re-arranged.
3. Patch-2 change smp_processor_id() to raw_smp_processor_id() since preemption
   is already off - (From Shrikanth)

(Sorry about a quick v2 re-spin. The main reason for this was, a new patch-4
which Sashiko pointed out as a pre-existing issue).

Ritesh Harjani (IBM) (4):
  powerpc/64: Leave lockdep hardirq context around replayed interrupts
  powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
  powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
  powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails

 arch/powerpc/kernel/irq_64.c   | 11 +++---
 arch/powerpc/kernel/watchdog.c |  8 +++-
 arch/powerpc/perf/kvm-hv-pmu.c | 69 ++++++++++++++++------------------
 3 files changed, 44 insertions(+), 44 deletions(-)

--
2.39.5

