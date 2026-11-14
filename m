Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620683;
	b=n8qd70ItoDGDqmuGNrqKExhxgjzKCVoBbIRnB59vtI25tI08juca6h80V+5lTsZQjRYJ
	 tK2XjFZ3Yd+5pTLrpXK+If/bQ6x94SmJUR8joWqanPPgWKcgzFhwqRpC1PQPt6fi+Ey6M
	 7jkBIVHDyWFuDKtcqUKd7D5EguYH6AKW9+RMeK7o6cvehLgcNgI1iDZs/7iTeQDGGgI/Q
	 kqW8CI7X0S6L1zYTE8q4Qi8Nw4kxt/lVE5JrdHNnRfGrW3M1bOj/AWi/HLmPtsBEAOAVc
	 ReNYcXEPS5C246Qdyd9rzz6fZJVkpDKNGnhYS/Xxc3BHP4bZUXfZ/lx4lj0XNoQSXNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OUIhV01zym7F3dnaq+SSRF5JFvrIUpSj3DyEg3o3VF8=;
	b=q+qWe53wFWir73Q5+T1g7Gx93yjqzBOY8SxWVX6xnJapAEbbd7dQ0KrjyNh9oTGrb52Q
	 Ct47UTkYAoK7WcHRggzys9s4Sxn/SGy/Uof+7EPzlQWfbFe1YInz388zjPWIzPMgzH45H
	 Wxq72UUG7FAPf3We9yqmQ8+49R4BsLsSASq2lttVxtHsg/JGdJR8hDSIOpdZmukI7BVaQ
	 E/bxOrmDmQvWRIckfNJ99Fg6Q1YcfI/bsDdnwdBiHH94khPYTiEMeQwVZeDVEu4FJ4zMG
	 MWOYUQwnw51ssQ3VMxumz9syCcmazLzAyziGXqrdntGfpe113FHekzn9aXFsqnaEorg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dpxisuUi;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDA606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEDA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dpxisuUi
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1179719a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794620681; x=1795225481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OUIhV01zym7F3dnaq+SSRF5JFvrIUpSj3DyEg3o3VF8=;
        b=dpxisuUi9wEtB98CoBktt1y+AO+7yYlw5tQxa7E8uRVwh6KCwhmJtxdJdHmMDTggc8
         2SAj12OWFEsQ1jEJ4PDMh4w+vbAb7bjNnlQ6MvuanitTRl2g80ckQOOpBSjFrFUkr9j7
         G9i66NzkiSUNEHEJTQLd3vPeutfVEU8fs3Wj/amyJGSoizDlJaUfFFsGk5OeZqkac1kl
         x++lQuy+QXhcHPmVt3Hn00YunjNHVpva7tfGgeFoJDq7x+E3cDqR+OdaiFDJ7NmzZEyl
         GW4oxPJfEX4glxahyq4JPgEi1noP63GVQ+m2jh/zitUXp7MRwA0SZptrWrKvUuXmIsms
         7h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620681; x=1795225481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUIhV01zym7F3dnaq+SSRF5JFvrIUpSj3DyEg3o3VF8=;
        b=LJ19nsE0dLx6U0VK1bEq5bKTCfdOfNvOrYMCLPAsaNTa2Wwp1St6VB72abPX9QblXv
         6Lpofu0wRmz0/kTsLl/Fjumd7NJkjbkiy+V0zxx5gbb6YornXJ67jhWlNFbXcZcfT/Wd
         lq4zZKVVn/+4xA7ZUblaIF/W8QokrJBjn7waQKSoscDhZEA++mw4Qtig7kAFX07uwuNJ
         htCkSpXpRRJq0qgkskkgtXFV+vzELwab549eVv7S1BnYqt+SqfLJF8Z1TNcEdFIfacNl
         6jv790VIASYKsPYKI8fhuvXAd6eMwB5Jk4LamsyRmp5PmmjwgGWw+6FTVXcnCV+mpGba
         nWDw==
X-Forwarded-Encrypted: i=1; AL+hErE2wjXkkGqc4rgV8YXetPKTGHT4ChDAaViVCzcoII4O5MBSftWnUxA60eNdrs5WhF4zo4KCBGSk8aYyOVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/goz14QccZ8bUGQ31mzUL9fgvfTw6bkix+u1lC/t/3a9at3Von
	IQkbHnuZucpHZ3sHp13X6tCZK+re+qdOFfrVYgTDlxFg3LPrX3mtvcWj8cJjODUeq7Q=
X-Gm-Gg: AYBFou2Sa19tm+nf1va+w2E4O8NsKIwxlfiUM+ujV7Ck/P1Q1L6dLXi4h6akq7bXdEr
	S3mSHSz2d93dqars2fN8pmcPRv6nxqn4cWiaWUKrgFlreg0tJrTESKW0lX2uE3hAKs1MTcYQBB2
	6c/RbogaclMu7Lk0tjti9oTcTZiNiTTaEZHBv501GRoXHskLvoFIdvPACSUxrfeT2HJgpEGyTVB
	QWlDFRJw5PHaisOyAD0+v/bnySlQErlwKW3HQxt2OX6+Bg9s5NN9UG0jLwrLjCp9r1JoOnflnKD
	QSiDQiVeAxmu5FzcG+WBy+pyDLFHihZEd3CBb3ayn2QdGUBMXxnVi2STdInisLfLi77MeSV89rL
	RBgz5y9v4o4QMjWyeJMmiJWIHiLeHvW5S+svvYKtFL3B6BPLnLkaRh3jOuZcunonfjlkzjnG8gz
	CiJWnxflSGWuHeVWdAOWz+4rrOB+KYkA8VPAXeEivU9nbASZIoZlkGCzaeUl3BlXOfKS1MK+8Zn
	qm/A102z3/0ksHIZN7kk5Ef/9ssmwrjr6JFv7rN8cRsQCTL1wTuvTvHiDC1ZvDROyjlGXcV5NSK
	MYLiuaXic8ApQIf0rsAiyNHINnrSVdy+miK3Yx2w5HxqIoiOCmwvRsSq86KQKoEpWy1RWwt3aNq
	AJ+JCI0N0pDDM9P8y4fYt3ssyGFNBgSDjkU6IKu8odcJ2yXAsT/29qTJ4x50=
X-Received: by 2002:a17:90a:e710:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b1b0a0e108mr4042515a91.33.1794620681401;
        Fri, 13 Nov 2026 17:44:41 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm3437082a91.0.2026.11.13.17.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:40 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] scsi: mvumi: do not free buffers a timed-out command left with the device
Date: Sat, 14 Nov 2026 10:44:28 +0900
Message-ID: <20261114014430.489668-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

This is the follow-up I promised when answering the review of v9 7/9,
https://lore.kernel.org/all/20261015055719.3992456-1-yhlee@isslab.korea.ac.kr/
and https://lore.kernel.org/all/sashiko-outbox-172292@kernel.org/

1/2 stops the controller bus-mastering before mvumi_detach_one() frees
the buffers it was given.  2/2 keeps a timed-out internal command's
buffers until then, rather than while the controller still has them.

Based on mainline; it conflicts textually with v9 7/9 of
https://lore.kernel.org/all/20261015045213.3975845-1-yhlee@isslab.korea.ac.kr/
in mvumi_delete_internal_cmd(), and I will rebase whichever goes in second.
I have no mvumi hardware; this was checked with a KUnit model.

Best regards,
Yehyeong Lee

Yehyeong Lee (2):
  scsi: mvumi: stop the controller bus-mastering before freeing its
    buffers
  scsi: mvumi: quarantine a timed-out internal command's buffers

 drivers/scsi/mvumi.c | 42 +++++++++++++++++++++++++++++++++++++-----
 drivers/scsi/mvumi.h |  1 +
 2 files changed, 38 insertions(+), 5 deletions(-)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

