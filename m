Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0F39CCEB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880872; cv=none; b=ErBmn+suTruJQvwNKJP82wIVczn1wymYO4OIp1dvN0CQlcMoujybifjXxHgAGWwke04Nr0YI6Sob/qREAZ1bsAeAUfnVlcySyT61zc4Owqy3f+salCUYFQQ5CU27A7hQ+9w0XRJG+6gNyHdEdjZbUSZnVQjtqMnQYhjYW/dNZJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880872; c=relaxed/simple;
	bh=wQcsrZGEGoTD8tZ4mSQVDM0CA0NU/hotKN0jq7p84wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfJKsgmAs6Bmzqu5rYnNrcCXAzSnUBMVx/MFoR4HAjbw2XDDEjMDTQowG1t3NT9AwYMTNs5TXSnUHQ3vPw8+ddNXlKh5MwJ7mS0jFwaKOugeMS3fLEakStFNkcJ9UI3FMqK3HVJ4nBbuypklStzHVvTRH57okquE2DvYn4AGQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaU69TOf; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaU69TOf"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1430eec0070so141709c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791880870; x=1792485670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogQf9jgUBIrgk7octuKzEMYSBjX+/nz7g2meA6r6ONk=;
        b=VaU69TOfE1R1ebWFhpl2jndVO6elNYFjpdO3b0KyshipPlbPN7+t0CWZ4hsMcYoHcz
         eYQQ3kMORsYT4FoEAmpKfmHRMgVM32OELKJZKEMzA6vbLJr1Fkup5mjV3Nb8yxwhoYa2
         vg6nekYyM1dUeMQi/MNb5ZJMS8k6B9hIqs0WYC+NbeVEfT1bGIDtYetfCnFcaJA8ZK3c
         iMNwjiOhbTEOEcIDx4MhUnfzMeHOvCwFPqss7Biq6K2JWNxs5Pv7v1H92ja+eoMVPNSg
         zaCHenbYbuVQPDFFn9gkGcnVKoTpptxMU3kdMbuS5LwDyWC0g0HHaVDNlTOQiK83sFWm
         6SbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880870; x=1792485670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogQf9jgUBIrgk7octuKzEMYSBjX+/nz7g2meA6r6ONk=;
        b=AuV7xzPhwnEJz6cMBC0r6XlwKlnpRz108iBB0rD+sfeQa/UxduJUEpYTjLseY5S+2z
         H9GoFunBeLY3HpwCHTKyOWQ23BxKo8hgXN3TaiylsP3x69rQ8/ePD1JaCwtkEoBXnL1R
         b+Kh1cpL6HXeSh3SPeKYkppHXR8M3kpzkY3LxzcedOAYbgMTEvmDZOKwfKdF8PbepEhh
         f9Snl3vEHt+XLgw5LCsLjz1lnZpRPjYRnyw64qB5x+/BtB68QChRQqUS8bWO4zTsK2mt
         itBdyI/0IU9hqGHad3dDrGV097q1KywNFGnEHwmsagNMBODNw/ma2BlQsXDss8438FXL
         Wm8A==
X-Forwarded-Encrypted: i=1; AKwUvBz1pBD7YhM87ZLXMK5ACOZByEczVM5EP3hP9sRUHN/y0ZH/d4dr/fdrUnzeh9CBxHWDyQzNo/MXcijfZBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJisIqXIy/Q6iLs1aaTRqnVda6R3lMhSh1SMC5yldXYqDtrGtdN
	UYlJ7916bvV/OGjUBpNnnIeJ1u9HQd0qicxGkV4twSjKyGBHROmusUqur89w4mKP
X-Gm-Gg: AYBFou1TWqPwjp0Pg2nbu60SFy4VsmsY8UzrMuzgQqwr9fH5gJS0dP9mMK8MtXvXY2I
	ppIGXQQ2ISxD8yT+OXHcdWbtsRpErrUyLxilPHtR8i5ZNXgsCncMpve325eSDODugKddixzxIy9
	vpgigAkvLrJNaD1QIaZM7O2jAcJu4i2/sHeWyKto+hsEhQL3hrG1yv9bmzCFa13hNyjYLFYTvZK
	aIPuMsMpzJPL6QtQGzBMALsCOOW7EuducXWOwklXmbqQobiOSm9NLiBNXZz70PARLqSvO8dqO2K
	3C7M1PgApV8ojL+0cy9sYImfg97MhDyIMi+0WwR2e2n7K3YYvTsLLRao30cgDVMOeCuOMvAu5vy
	/vE1qd76dzEa7c7wSSKpJ/rgBHpec+dGDy8jT+x1GyNk0B+M1RMH2Yr+P+EN+OWHrn4T1XiMtVC
	oiB1CzKD6RmOfrLs4BCBzgFCoxmmRV0g/G1eVSMaE7wFacX9qkvBLJIZ6Opyi8pMNCUFEbFogsP
	T8SATAJzdIWezSP8f2dWDkPmD9Hx5Aobd8LXB5B5iGTL1mMPFefXpdLMxoBcQ3v
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id 5a478bee46e88-35bcb8a919dmr6285540eec.1.1791880869459;
        Tue, 13 Oct 2026 01:41:09 -0700 (PDT)
Received: from localhost.localdomain (45.78.65.84.16clouds.com. [45.78.65.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm42575464eec.25.2026.10.13.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:41:08 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
	David Howells <dhowells@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>
Subject: [PATCH v4 0/2] keys: Fix quota-owner reads and ownership accounting
Date: Tue, 13 Oct 2026 16:40:54 +0800
Message-ID: <20261013084056.1070923-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This revision keeps the v3 topic order: the lifetime/namespace-reader fix
is patch 1, and ownership accounting is patch 2. Each patch can be applied
independently to the base, and both orders produce the same final tree.

Patch 1 protects only the three quota-owner UID snapshots. It relies on
key_user_lock already held by lookup and final reference removal. Its
READ_ONCE() pointer loads pair with a WRITE_ONCE() replacement in chown.
The reference-release ordering and lock handoff keep a sampled owner alive;
this does not require patch 2's new accounting critical section. The commit
message gives the lifetime argument, including a final put by another task.

Patch 2 serializes chown with quota reservation and positive and negative
instantiation. Each critical section is complete within this commit.
Atomic counter operations alone do not serialize owner selection and
count/state publication with chown, and instantiation does not require the
target key's semaphore.

The messages explain why keeping a key alive does not pin its former
quota owner, and why key->sem does not exclude instantiation. They map
those two requirements to the three reader scopes and four accounting
scopes, and explain the existing protection at unchanged lifecycle sites.
All seven scopes in the combined v3 series are retained. Reservation and
instantiation locking move from v3 1/2 into the complete accounting fix
in v4 2/2; no lock scope is split between commits.

The procfs changes cover the originally reported proc_keys_start() fault.
The filters continue to use the quota-owner UID, since key_fsuid_changed()
can change a thread keyring's key->uid without moving its quota owner.

Changes in v4:
- Keep the v3 topic order: lifetime/namespace readers in patch 1,
  accounting in patch 2. Both fixes remain independently applicable.
- Put every accounting critical section wholly in patch 2.
- Make patch 1 independent using existing lifetime locking plus explicit
  pointer access marking.
- Explain the root cause and every critical section, plus the existing
  protection at unchanged sites. Keep allocation, notifications and
  reference release outside the new accounting scopes.
- Correct the reader patch's Fixes tags to the namespace-filter commits.
- Rebase onto for-next-keys at 22430ae5d90ab and request fresh review.

Validation:
- Built security/keys/ with patch 1 only, patch 2 only, and both patches.
  KEYS, PROC_FS, USER_NS, KEY_NOTIFICATIONS, BIG_KEYS, ENCRYPTED_KEYS and
  PROVE_LOCKING were enabled. No compiler warnings or errors.
- Both exported patches pass checkpatch --strict with zero diagnostics.
- Both patches apply directly to the base. Ordered git am in either order
  reproduces the expected intermediate and final trees.
- No new runtime, lockdep or Sashiko run. The KASAN excerpt is historical.

OpenAI Codex assisted with the review audit, series split, pointer access
marking, commit messages and build checks. The existing author sign-off
is retained from v3 for human review before submission.

Previous revisions:
v3: https://lore.kernel.org/r/20260927162528.943886-1-nicoyip.dev@gmail.com/
v2: https://lore.kernel.org/r/20260904080940.575882-1-nicoyip.dev@gmail.com/
v1: https://lore.kernel.org/r/20260823170448.3856516-1-nicoyip.dev@gmail.com/
Review:
https://lore.kernel.org/r/asL2UQjYCxt9SF9K@kernel.org/
https://lore.kernel.org/r/asMQMzqVkmYhwgMB@kernel.org/
https://lore.kernel.org/r/asNCIs3OshLwGWrB@kernel.org/

Chengfeng Ye (2):
  keys: Protect quota-owner reads in namespace filters
  keys: Serialize ownership transfers with key accounting

 security/keys/key.c     | 15 +++++++++++++--
 security/keys/keyctl.c  |  6 +++++-
 security/keys/keyring.c |  7 ++++++-
 security/keys/proc.c    | 15 +++++++++++++--
 4 files changed, 37 insertions(+), 6 deletions(-)


base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

