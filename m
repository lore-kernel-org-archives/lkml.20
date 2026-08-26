Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911C35A38C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775433; cv=none; b=TpLtN3IZyMKoLNJU+tQNSgAuDfYHM0hTtleRem10WZR0CZQCYb2oT+ITBazyxupWLDELrsabGQ3e9YoILdcV2NBZLkCH9SJUEHHkbSiEIz6LLZ4BLH2vLqKGbc2S4RMjyko9bNr8p3XAXEnZ1BtXCQOeaa0k9ps0ubX3b8+ILUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775433; c=relaxed/simple;
	bh=3Pduo1gHVDIUUt5sDBfU654xzH3NpDT0jtFbBzAYHKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GzEh9kqi7wvfxW9wUQnQANXFilqR62yVSrW3Xgf5kxbxnUnG7Co2cM50uLNMiO5EdGmUORqP7/Z45KVGD+HTC0IiS9YG3y3hChpuDsy18raBFEqXZdAY42Rd73igmv34fa0iNXwcUKFigo/5MZs3n34t34r31r+VhIppwGEunlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=VPWOFY/N; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="VPWOFY/N"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cedda2ce6fso9206905ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1787775431; x=1788380231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhjGgYTatBrHOcQxWsDxDksd7v3LZqmlD+U/i4Av3LE=;
        b=VPWOFY/Nj1NZ4RktRY0Z3H6xTeuxBcS3n54MAU71fZUSZmwH56ciowhwLmjn9I55W3
         pKQIwGww7siRGWLsc/y68bd442NQC/KYfF6sPTWKffHodsWjz+RQvuPAj1Pchp8HbxgS
         bDs7yzVJVO5Z/ncipvOwZB2EFZMTqqYi+jYeklcevgQzkt6QHCnNBUWxN/9XYrr0kyWj
         cVaDGVU1X/cmC5QP+FmR5zVrHHlPb3IcvgwPmNv1gd2dXCxjf6P+Wb/4I+37IzYhBzQP
         qFyVewDMDgq7h7pWn0TF/5H5OCXC0C/lMM57s1zsHSzOHZ09nBZ4lTNdXcgdV/egR94y
         XNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775431; x=1788380231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhjGgYTatBrHOcQxWsDxDksd7v3LZqmlD+U/i4Av3LE=;
        b=Zey2XDSFiobMYxPx5Xj91FpnVyEFeJNFhQ+rrR7OXqCXEqBm1AT5vqGcx+2p45//vy
         eRdBpIJ/xJDj7k8md5WXOG3eR+142DQcjzxDsek0yRU+obDPDVNIVCmJtvblq2eV0SSD
         h/cjJC4OyNZdUPtlWhotNzhuTbedNTUvabXqaHkLB46gGPWbw9XAclhHKm3LG2n64owT
         2cYGHPeGUZOujAc+CWK0c5+Cq85TfZynmbk52kFyNTLKhpRvxOLA3301czPg54s8Ttgj
         dPghg5XigRMhy6tzsgy2AJgY8vVWtcdzljuRAmFesO+6eo+EN2MaIbIVF1DCP2x+44ZP
         sCfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT2IuccS2YHA5e96tSaWOst0ckCajQCmgoUAcvwjADcFff+OgJ8kG9IkAW4B5xXC39GGBEeom/BXqa+7M=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Wo5zBDEizT+6xUJRSoc4JRJUEuhD9QnR9nposekv4LSGaKdw
	yp6zhK84DrR+v1DqjX2dSbkWWbOfnh+WbbNvdbJMlTh1qqAAFQ0zrgyBjhV0ZGvfz6Q=
X-Gm-Gg: AR+sD10a5ocIYewyqRTYhkYM7Ca44M5Osq0J8J8O8QmMJWWyDr49u8RQed84arV86tE
	en4/PE6t3uYArOAew+RdzPYlBf4nGnElREBw6Q12/wawvoFCO2cge2OoczdWSWNx/EJy10wZRgZ
	P2vjx8jdWuxblLSBSogqirBfbqUQkPXyNg1I/A3tAD+3HqFWcr5gBrJPXImUK9Fw0ITk98wEg5j
	KAw2cJw5aPFtIwOBGKIseVJZdCg+qXRaaknWWfrBnlNzKmyJ8oMqdCcrOL7UwUwqQVssjtTcKyJ
	23Y5ROiWKKGc4Egt2KWHTBBMs0WRu4juyvMwK3/c5DVMDeYKtcT6Mec+H9+1UqbWJQTu+po0Pj9
	0tbHRADEWpknunud9tEQFwfeFWGMO43v/LmwlWwzXqcHjBbeWYU5LkUpOYUEAFlRirnodrNWW0G
	G6yrEAp2wAe3QE9jM+KQUD4GHbwxqZ51XCICYXFZ+qBTdQnI+pragn0QICV4bdTWMddSLCDz8B6
	dyBvR9PQETb/s2k0d5IAaPOTCEr0yGG36dnwg16dRs+ARIoASZn355drog=
X-Received: by 2002:a17:903:1104:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d707955aa3mr161833925ad.1.1787775431276;
        Wed, 26 Aug 2026 13:17:11 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:957:eb3d:7323:2ed])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60b59dsm11179738eec.3.2026.08.26.13.17.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 13:17:10 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	kimjw04271234@gmail.com,
	Artem Dinaburg <artem@trailofbits.com>
Subject: [PATCH 6.6.y+6.1.y 0/2] KVM: x86/mmu: Check write tracking in all address spaces
Date: Wed, 26 Aug 2026 16:16:53 -0400
Message-ID: <20260826201655.9198-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please queue upstream commit 0f38453cdb2e17566ccb7c0f3dabd5bd21caca26
("KVM: x86/mmu: Check write tracking in all address spaces") for the
stable trees. It is in mainline as of v7.2-rc6.

The fix is absent by code state from 7.1.10, 6.18.46, 6.12.105, 6.6.153
and 6.1.184.

7.1.y, 6.18.y, 6.12.y: please cherry-pick the upstream commit directly.
No patch is included for these trees. Commit 0f38453cdb2e applies and
compiles unmodified on all three, so there is nothing to adapt:

  git cherry-pick -x 0f38453cdb2e17566ccb7c0f3dabd5bd21caca26

6.6.y and 6.1.y need adapted backports; they are patches 1/2 and 2/2 of
this series. On 6.6 the upstream commit applies but does not build,
because KVM_MAX_NR_ADDRESS_SPACES and kvm_arch_nr_memslot_as_ids() do
not exist there. On 6.1 the upstream commit conflicts: the function is
still kvm_slot_page_track_is_active() and the tracking array is
mode-indexed gfn_track[].

5.15.y and 5.10.y are not covered by this submission. Those trees were
not assessed.

Jinu Kim (2):
  [6.6.y] KVM: x86/mmu: Check write tracking in all address spaces
  [6.1.y] KVM: x86/mmu: Check write tracking in all address spaces

Each patch touches only arch/x86/kvm/mmu/page_track.c:
  1/2 (6.6.y): 26 insertions(+), 6 deletions(-)
  2/2 (6.1.y): 22 insertions(+), 6 deletions(-)

-- 
2.43.0
