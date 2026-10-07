Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D7221F24
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340156; cv=none; b=HHvClC7wQr8pYy4J0HTlWRdfVVtBL7sFdchoQKkCSVBzchajnIju6KGPW6YoiorbsrNrZ07j80Obm02ImbIgpB0H0JjtRtRPHTsrr3xd4Zsu5duQ6VKfkBVww3JdU7E6Wg+jP/LoLp3wV7EeI1EWLRUPeyrAs0N2C0VvBgVinUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340156; c=relaxed/simple;
	bh=bIg4WCGXbdDY5+O81zvgzW0QdrMJj+TZqAw5xTla9jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NpD4YmFm4cp/3ibq3wnauWSzmYYO4qU3RpWHyZ9sy58mhfB/Yeksri7A2d4EL34/oYD/2IwgcFA0SwjeSaJqWi654FXoQFVwqzinotaG6qGro+azJ/Yyh7EZUsd2ncXbcTTe5212IraTRO+v0HEf4bjmzq3Km/l3x4+iRnUqt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doNjfxGO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doNjfxGO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a89d1ca907so400255a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 19:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791340155; x=1791944955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKTyjSqWs6SfFGkHuFH/1TC7Rr/MxEn7bGnFGnrhrHs=;
        b=doNjfxGOwlQE517G75MQHFyGZlNi+NkhdZRwnMZgNmm6Wxo7JlSRCIKwjjLi/3l0La
         za9QIO0DOoEvYH/TLK7wHEKez2hxWq89PfDlwsrWMmC1Mibl1bXcRovr2M+35yDP4Vb7
         sBwXSBFAgrud7mj9TxKHWlV0n9D+5Q+o1rZXh7mN3pnHCVCZAbZzECZKPVXZgoiUt2hG
         yl1QIr1OXCANtagsi3/jzqQspwV2o4/hf44wE8qd692CkxH0qlyhxXQORJpsDaXsAdNZ
         WiEVTnx2LqcbmK+wQVbE9sW16iUwu3Khpdz+Muf6R2rBhO6w/pcxWaK1uonih78pP43G
         iLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791340155; x=1791944955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKTyjSqWs6SfFGkHuFH/1TC7Rr/MxEn7bGnFGnrhrHs=;
        b=E16lmcVWw4R1OEvJuGL1O9y2dAgTi8r4DX1iWtpfOPHE1ROFOT3WeUUhNKDnaRgz1U
         glyT5XtgmV5AvFtKUeHCnw2S7pBi56wwDX+vND9juB3ZCJqwOqkdN3YR2JMA5TbPaQ/b
         v4eqIj1GCjSnDRWn9f26PpMVJZmmG5PJ0aXqCjxLuZK0z0+vQ6JtPSGVijYnBW/7k5gx
         hr3vwPlvlhWCQMzS67dv38eon7Gl2xsSGjqX7HgStIvabIefGVjlA6ajqVWtOpNtEjco
         t2lNmr+HmdITFdyqmZ78lnQp0t5cXMom25ASz9yRxmq1FNhc7ugb6GWqN4pFSrRIzWGj
         pFdg==
X-Forwarded-Encrypted: i=1; AKwUvBwvsTTVfePiN1qp6cgBcSvz+UW6EKD6pdIr8j51st5HdFu6vS+ztiP6xccy5L5TPqmIphZ2/vuq3YKNSKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkZW2uPSPNiLTsVmB04dHYjViZdzAlIxzsAi5U1qnDnwWqRzmO
	1oiByBiU0bP85jbiKQkPWQ9X8wgvt/Lks8pNy/Xl9uyHgPjwjBxfNL5+
X-Gm-Gg: AYBFou3+T+WpLaU2aWlAYPfzIXnfdz14JoATjsF+oBiam+EbJOPyDWLIql1oh34tcsb
	vlYpoHIJczgpZJGXWE6pfytS3Nj4XRVt7wfXpp6DSVYuj/H8UgpRsKHyLfStSVoMyWJaprykWq9
	vPrcOKdza8ISb5CsWlGw2w0/K2fFl//RrdP9QLm/HyMjgZFnaAif2dQvRxNEzjn6VWjtCHd/iQG
	54Kt8IPVCwh5wpmUqBi1VyX2kBpEDflbbTvOyTs3Uvt4rCXL0Hyo0La+pFqdfOIi549Z1DiPVCe
	jFvgInxvqKZU/75EYTzRp2WbYv9Ep0l7qc9Z5TWN9oGOjmntI+RBNR5S3DfCndRIUiTiGotyHxl
	A2ivLZDS1iaJh325JNwb0C8HaN3ZeAVaFOkAi3mvJkxRfnOoisnqPkHJE4olwc/D2yKD76WJQdc
	GoDoSn0p/HmDIib1m9LRgWcMOW7S3iwTJhOxnXrtwas9mDW6Nzc7hVJnqtI8KpE/JoO/d1eX404
	5gat6UGMciRy/ouYDEAXxPUiJLBcA==
X-Received: by 2002:a17:90b:134c:b0:39e:6c6a:657d with SMTP id 98e67ed59e1d1-3a8a14f173fmr684672a91.64.1791340154609;
        Tue, 06 Oct 2026 19:29:14 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm2090836a91.11.2026.10.06.19.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 19:29:14 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: arnd@arndb.de,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	mingo@kernel.org,
	tglx@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v3 0/2] rwonce: Introduce {READ,WRITE}_ONCE_THIS_CPU()
Date: Wed,  7 Oct 2026 10:28:57 +0800
Message-ID: <20261007022859.60101-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a rebase of v2 onto v7.3-rc6 with review tags collected
since v2.

Changes since v2 [1]:
 - Rebased onto v7.3-rc6.
 - Collected Reviewed-by and Acked-by tags.

[1] https://lore.kernel.org/lkml/20261002151757.3605081-1-kunwu.chan@gmail.com/

Changes since v1 [2]:
 - Introduce {READ,WRITE}_ONCE_THIS_CPU() instead of reusing the
   plain variants. (Thomas Gleixner)

 - Expand the commit messages to state the KCSAN rationale. (Thomas
   Gleixner)

[2] https://lore.kernel.org/all/20260920085434.2918331-1-kunwu.chan@gmail.com/
 
Kunwu Chan (2):
  rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()
  timers/nohz: Mark got_idle_tick accesses as same-CPU races

 include/asm-generic/rwonce.h | 11 +++++++++++
 kernel/time/tick-sched.c     |  6 +++---
 2 files changed, 14 insertions(+), 3 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

