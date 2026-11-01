Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546902;
	b=yEBOV4vMrdZLGmsbodg/AX0vRPhvExTA/3yEnhrR3pQDDLq+lmmzWR5lcaB5n3ndf2t/
	 p5A9OX3krLBb2qPhNm/i1F/8ZXYQPElhwH2briICBZKqNXOWFBnLz8Ka7Eey31e1LBwFh
	 vsNziRUDhtU2LRp7y//W1KETxgDGC657NZJ1kxl/Oj4G1NGn/AMToIOmEEnZrBg7dk4CY
	 l/nB6M8/6w/EtwXEOohsUP0vjVWopXOUlBXb4BN5TuFV7BYB3gKEs1s2zhfA8e8oNK7Li
	 x/lVfteKc47QS4Wp9MlmHLyZJsq+X0tQbzN4eRY7ZMYXmUjJCqslLvRRnTSnulyjuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BWV1IinUG0DTVwsnY8AqH4VfOLB1w3rql3cUkwGyNXA=;
	b=OlaFHBTwwQ2j6pwpAn0e8tnpOd5WIt1w+0a+Vl79LCas+TMXSqaWtW6oFHnfvsMq+p1N
	 sc9+uEQVoEso7c/MBj+a+ObJVS1VTEjcyBVB2AYsdfCz6sSQUcFLuYC6AqsjodN1jZsF/
	 ikNiYpIKcaqFtraVY3AKgkdz7Z2iH3OmiHK7PsErzq0HhnvuPns28842aajPgM1I6GQAi
	 WGaaEdI4l5lrlaXMKs5JMd5J+GaU1rCXNNVPYkl8B3tSuu8QyUgB7AjD0DBOsKYCNEnSt
	 eYq5j9clZ/kwheOm2NI7BOtvdod3L3gfcIeCHy5Ai4+W2I35DKfcdbSUKIhU1Q/yVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv2ur5Vb;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06331606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06331606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv2ur5Vb
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso3890570eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546901; x=1794151701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWV1IinUG0DTVwsnY8AqH4VfOLB1w3rql3cUkwGyNXA=;
        b=Pv2ur5VbbQHTbEUxBye4Ps/lC9cz0ihpSDIvmymLusoZe7zA+A5HL/0yNrAxOiHa88
         dYl1Yor2Q2SsjEWVd5ywSyp7VSOEWwYrHKfZJ2T0vYZXJHWaecQy59bRkYYb5dVp/hQc
         1uS3X4dGkIMKV/D897p6Zs0W4HfMd2r6VxzmOOVUOvoM0O5WpyQFVOXak0Uq0HNE6ER9
         wlHORKwLtmgQpGkwlQ5XG6KIy4S5fG+ZVN0GcRvjQ++imLT5SlrMF8Nl1wNfRQOeTnuu
         tfUu3KuUqAVZpNTyDuhDxSR72qQyaBK0Cu/XLgcxzf5OmRMGZFZP68o/pGuz/IGTJYiH
         +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546901; x=1794151701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWV1IinUG0DTVwsnY8AqH4VfOLB1w3rql3cUkwGyNXA=;
        b=yi/EVGUIweRG5s2/SWn6dijADIL6KjejI5KGQJC3aRKI/m3vu4zhobrytI7F5OMwgm
         +0HvnnkH73fbw3C4v1/u/iUsWiD3FiXwYWwP5Gq4Sn5lDoD9kcT0UZ58XdLfU2Ww+Xe1
         KaJoaaw6dgZu/DfVpL961OmEIXzGSpgKtT5BBQfSoSpjSNrKbLkiO20L74otmqe7/Ebo
         /nmFOaHkU1SsL4qYrlboHOWbPc5s3gquxkPPdxBa8odiASblnfmAAEe5eFZc7N+IDUZ4
         hcLBhAODV/elbm7MtIY6i8jVrWQcRK46iD9IhzxAMWvGQBauKw42V4ObhxdvvvfNvRbJ
         DdcQ==
X-Forwarded-Encrypted: i=1; AKwUvByiWiIfQfQd9CvJMdEilAhkf1xouDZTJbRVvxIsdWtGq2lsGuuCWwxHXnd0S3FMTKQpCjh/C3VIdvPTHIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ4z4Phqcmmcj8BXpWkk5kJs3W2Ja88XQeVSTFewM1IWgFmh0e
	wVRt/GKn3PpwV7FkRJP7UnMr61+IXquxgpo1LPhY4Bg89kCrA5mo3Rul
X-Gm-Gg: AYBFou0eo43iQtWh8pthDerP89U8FPJOQrvlHn315lZd892lPsKgajSRsrJX2uQyAlD
	DV+e42+SL7kLvuxXHFeC9Rkap9BLrC3d3HGRj3whjbzjjVchumDa053hBiQsMOrspxXWFe2Kocm
	SE1RV89Pz3sVRpGeJdcYK5uzXOfqF3waH6Ufn/PIuqxm3CuCI1oXswrFhkl0i8P/O6fPMxrjmel
	U1VHpt9XTa1aAj7UaR+JbA8bO7yCO3f7ucZ7bLM48VpWWInKCXUrWjCCt+6YLmAcFuXpVQpE653
	qvQTo/VN5Vo+0lQ1xYyvYpHOJ+3LSjpLvQ5Vl2dta32gC4SHefMy0DzpkeRf6CSv3KfkH33X91U
	v6q6/6Z0TIY3uBnY/1SGTtESC8ETBw5fxXBaUHTy+pLmXvUSLmL7Y527k79xkOIx1jW86fzzGvd
	uX78j57wDGKrHr8lH8PQz6q3ZN9fF60tdsC52eAvpdheCjXm7int/b9kAD0HAD51FkD8waioovB
	1JJGMgSWKfOAezT7XKZwuAozCRvsWcSZkqM/H9vIMl/VpXYunGu55/kX6neTxXeWdV5xPSOPkld
	BQ5XeNYDKap0HtQA2Ra1qERZWfEpwIqsEw==
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id a92af1059eb24-1ac5c64cb0emr12048606c88.26.1793546901052;
        Sun, 01 Nov 2026 07:28:21 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:20 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 0/7] KVM: PPC: Misc fixes and nestedv2 vCPU limit fixes
Date: Sun,  1 Nov 2026 20:58:05 +0530
Message-Id: <cover.1793546707.git.ritesh.list@gmail.com>
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

v2 -> v3:
=========
- Fixed logic bug in patch-2 & patch-6.
  (realized after sending + sashiko caught this as well).

RFC -> v2:
=========
- Addressed sashiko review comments
  - added patch-3 to address similar __ffs(0) problem on booke
  - fixed build issues in patch-4
  - added patch-5 to reject vcpu ids beyond the PAPR limit
- Few more patches were added. Few of them were reported by Sashiko and few
  others were caught while doing vcpu create path code walkthrough

Most of these issues were identified while adding kvm powerpc selftests
infrastructure support [1] (which is now merged upstream). Patch-1 and Patch-2
were identified while running the selftests on Qemu+TCG+powernv+BE, while
Patch-4 can also be reproduced on a real pseries LPAR with nestedv2
capabilities.

[1]: https://lore.kernel.org/linuxppc-dev/179211526968.809012.4905747914183363587.b4-ty@b4/
[RFC]: https://lore.kernel.org/linuxppc-dev/cover.1789099725.git.ritesh.list@gmail.com/


Ritesh Harjani (IBM) (7):
  KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
  KVM: PPC: Book3S: Don't call __ffs() on an empty pending_exceptions bitmap
  KVM: PPC: BookE: Don't call __ffs() on an empty pending_exceptions bitmap
  KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit
  KVM: PPC: Book3S HV nestedv2: reject vCPU ids beyond the PAPR limit
  KVM: PPC: Book3S HV: Fix error handling during vcore create
  KVM: PPC: Book3s: nestedv2: Free the guest state buffers if vcpu create fails

 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s.c             |  2 +-
 arch/powerpc/kvm/book3s_hv.c          | 15 ++++++++++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++++++++++--
 arch/powerpc/kvm/booke.c              |  2 +-
 arch/powerpc/kvm/powerpc.c            |  9 +++++++++
 6 files changed, 33 insertions(+), 9 deletions(-)

--
2.39.5

