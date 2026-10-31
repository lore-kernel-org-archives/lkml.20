Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420103;
	b=K0Xcd2Hb4fKSjZAoggE1tJ9Gp81Roov9Q71VKLtDvqWTrF25iHTfVsE8oA2oeNPIzRM6
	 qhwJpVSp6DZZRGPvDRf7uDZdTI0M57C+If7I+HlzCPKlw+lkA6C6Qsz8C7eSOfiH2b17A
	 zRlyx3GLmJL7ymEmNoZu5DOn9RyPIqpPTsQdFqy+2Y/R77W8L8nPj7ZPuAUntg2t6Efx5
	 nn7sFVxo3EaJld1q5WS7YJfYK+21EpnFoEypTK2j6dQcY4usSyvpo9nmvRtF0tnsQTlbk
	 4ttSnfigtL0SjKgkz3CO5K4EoozNozJDLBVZOor3hepVR23WofS5ida2veESl+fdinw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=//OtvncOxqkH1qXVs2mmLokVSDfmsZG7I/PEFZI4LlQ=;
	b=2sVJke73CbDllu2FHK8iL/7i/SPLsJpxtDmkAAQT5fFJ2qjn/aZpSldWX9ya/xLM/uXM
	 x+OEKDdORYdJVBgBkpXThH9ltAOgCFvdEEMHoo+pV8riec/DaYaM223SrMBH9Y4QjXhMm
	 ppLA/zW8XzWauLo79JInSCwJDVzzgRMLQmOLmFcdghdzi7aVeD7NVQubqSBXmBGr5Lk05
	 8ycANZYM6nZx2fvVrL/41LTTANCeA42655u56txzGBP8IhbsgdABv7AkrUQjEEgqbUyhE
	 ofi5b/SNg4xutFik7E/7FKSNmB9I64/nj4RPpDkHTs8WS5upwDNdEiAvdzBu+rB+DrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5SHIvSE;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5SHIvSE
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso532053a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793420102; x=1794024902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//OtvncOxqkH1qXVs2mmLokVSDfmsZG7I/PEFZI4LlQ=;
        b=p5SHIvSEVlY2N5MeAMwJeRbnig0B8IWyv0r1b2hO8nqnB/xe51wEBZs5wYwgYBLZEi
         1lJS3cn+rrNv245sBwLfKGGLd3TEDBxDT9/wZhliIHs2lEjN+Phx1gh/OgvLZ5Ca6/EG
         EXOsfmlW8WsFYaGve03aJwsWt859aznyZBQL7T+c/WjP27rX51p9w6nq0IDEf3Hpc4w0
         FDAlncjhjr0PzrA+5G0ozhd827+n38kZ7nTdvvAMGUXuQXrYxyPVHpmouG3kgTaUHw3r
         aHFPTbjMemgwpz5Cj8DWbcEzXr4CGyE5oUvpJkQheBfrCoJKqzRrIkctwR/k5aXmw8T0
         zW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420102; x=1794024902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//OtvncOxqkH1qXVs2mmLokVSDfmsZG7I/PEFZI4LlQ=;
        b=KiTs6wlgqdO3wDLlNSssvq3pEv27r+jANUzibqYa5BcFQua98Y+guttQNj152aL1XB
         LffIbm9KmZtBx+pW28TUe7a8963kZ9p+pOKnvCumKVIm0HSu7qEQ+AvvFYXavb0/mtWj
         1g65Hqzpg5H1pv6Z3KF/q2oJqgO3Rf9SQwMBYqWu6IWvhMaQJ0OJZMvYVZD0agtS2OMA
         Kdik5/fxraQ8I142/iLAMpe7HXyQZt/GQHhxcLBc6Tzpoy4hnUZezD27tDnz+WrIvL4+
         7sKN1QunW9kzDOhfFRYI3PsutlNpqssmBZu0dIf5nMuE+BzmLWLBR9NsfsIrHggkBQyw
         TNeg==
X-Forwarded-Encrypted: i=1; AKwUvBwxrMLkzI+nqvi27C6CN9onNCe1j48BOfDGPxY0c8RTGVt3SlSYP/z97zJCWuB6Bmou/Kl+XZRefczcG2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL810dNiyEXbiKuf8LBzyeGhAUazpAfqBsMA4wgXQh+pPw9CfGM
	JppcZQgjmZsvUqtywMCj3bLD0bqFR5XE+nS3tYSPACcowLYa2HY5/hQv
X-Gm-Gg: AYBFou3dLiW08IRQd7v11E5iJHM9gGML/kze+viI1IXjqDwYWyI7G9EG/YQIZ9kiwU7
	vMi6SVGPO5Ng17bgHJ6nHTXP87HVVRUz+doSio+R8epLZmtI12zUjsm1Ctc7kixhCeTlw1npY5r
	y1zyvFvf4HSGoFo3LSD2MCqSdSejGg6VHI48P6+zOrfmKAqu+uEgxm2Mggc8E94LGeG6Tgl6lnY
	QorIsZ2f+1QH9/z4F0DAn26D/va1ObTzf0DmLgu7k5m0+iPgG1zUXm9IBhh7WBuKMb0Mjn2J1Ym
	crRc8CEcx+aXbzkM3vQXYZAiFQ9hZqltLsSmdTbxIENxoXKMi8TbOmLrZXNh9Ep20Mu5LINzTha
	zfp4gUlJmY7d3TLvjnMalSOYVDT/rRMXZn2tvGO7Ak5L5KDnGGJjDfs8D6VT2KSBwhAsH1NE9Te
	p8a2VgraZ+HMwhVjAdGJq9Z1z0ezkR4F5/DBzvviSiiaXduCfVMzDPPT6pUxjPdwCAO5kWZ8rkm
	NinqO3j5/WneTVVdWIPtIumZM0h+o/tmvzGXHQBx0LjjcvTuBJ44W7WBYCkzNAD3+0KZSwz/1nF
	R9GZBirO2SBX6zzyoVCtcq1O
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr3323310a91.45.1793420102417;
        Fri, 30 Oct 2026 21:15:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845d5e62sm6384937a91.13.2026.10.30.21.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:15:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH ipsec 0/2] xfrm: fix state lifetimes in xfrm_migrate()
Date: Sat, 31 Oct 2026 12:14:53 +0800
Message-Id: <pm-xfrm-core-objects-candidate-0027-v3-cb1e033bff1976f510c9-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

xfrm_migrate() keeps the old states in x_cur[] and their successors in
x_new[], but it does not hold a reference to every state it later
deletes. An SA with a hard lifetime can expire and be freed by the timer
and the state GC in that window, and the following xfrm_state_delete()
takes the lock of freed memory:

  1/2 The success path drops the lookup references of the old states
      before it deletes them. Delete them first.

  2/2 xfrm_state_migrate() returns the published successor without a
      caller reference, so the rollback deletes states it does not
      hold. Take that reference before publishing and drop it after the
      migration commits or rolls back.

Both windows date back to the initial migration support and are reached
by XFRM_MSG_MIGRATE and PF_KEY's SADB_X_MIGRATE.

Cen Zhang (2):
  xfrm: keep old state references until migration deletion completes
  xfrm: hold migrated states through rollback

 net/xfrm/xfrm_policy.c | 7 +++++--
 net/xfrm/xfrm_state.c  | 6 +++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

---
