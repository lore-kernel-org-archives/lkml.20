Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0C29405
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973518; cv=none; b=W5/dvVo9+eJCEN33p3lg/jy79N+j1shWnO+ZeqlSQn4orilzb+ZKNqA4wnK5HWjMXlJY9Wv6vBe2Dhqpup8VrBRvfEyfcqIU4zWW322qrdZL/yKY6BEFGGph6qLYUhCKymocqMUUfkXJ5I44gQwrWfZLAKk/DCbSokz0rl7Gvq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973518; c=relaxed/simple;
	bh=fDRcPM5YI9tzjDCrA29/HrBa7jhW5uBaeCuSodJeNRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQoKaM7b/2I7fJSFoC5Sg+ZZnT9Ujlp5tCgGEPKTTOXIDUhE7rfO3s8K9XXFsNPP5zCvqNOUU95pTpXEb0/K/PXWORhGHssLIEHMWbDBi2KQHEeFFy8IpYHV6GEhkmOfppdTSrhHBDqlSqUSTit+0vBLThO9CCvr7nzT9MxyHPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcpmZFcQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcpmZFcQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccf2360620so15013245ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787973516; x=1788578316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDRcPM5YI9tzjDCrA29/HrBa7jhW5uBaeCuSodJeNRg=;
        b=JcpmZFcQs6+69gEHnVz2Hw4DoEdCEtcXsnerzddA7f/f500nq/8kzkVOt6MG/eHWNv
         3tNYxaUEnSGkPzteuPPkahdwFivm7mCs61lq5nzJJygOp/pqkP2Z1EvZDZldQ2sUtzqV
         Tm9IGJp2PnANxTEm0qAHS5YDiuKv0m+9N2oZyLcgrQqmD2/KdaRoavW/In6yhuc0R92l
         /aj+l0uwydfYgsyEtN2dMyNAmPlUXLVp7OkgHOntwcy0qWrgrMIAovGn7Z+5b3G2N+3J
         faWNQJt+nyQdeJOEhct81xY/hP881tgKiXlDVs8HFWjWVJXiFeXzYVt91ccF5O0O/qrU
         P7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787973516; x=1788578316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDRcPM5YI9tzjDCrA29/HrBa7jhW5uBaeCuSodJeNRg=;
        b=PkSBWTutO7bc01gatPAJtNxEhWSVT4viewmFSuPOR9K+CeHnh88f6JnsVaC05JAwc4
         pf2O5jPul/nkNYRzMNE+woFBN8/79yK7PhGwD/dea7zkRCbiMgFu1SsPtM7Mxxn6RXQp
         HymtxUNF7oT6wSw9/+AYv5givnsQneNt4QT/Ua8HBJ7W2b/rUWkbscH9n4spaWeKYfB6
         X2lEZDGN9gOBE544mGzw2d5/vu4jvWl/rp3mmJBZZtfjVXAa+C1gEv6R/m/Cydh+8+yY
         lG8FpOCd09l2gxOsHJhplzvAjxTpaDoY0OZsVXOq0XM2xZaefDaU92r1Fk4PR1syntt7
         mk5g==
X-Forwarded-Encrypted: i=1; AKwUvBzeTlUvL8Lly7LgPqVnkN7V7UoDssQLLsVPNnmEOjH5n6ZCZYkQ1lL0JJvsew738GBfbed1QqjPWSRkf0o=@vger.kernel.org
X-Gm-Message-State: AFuF++kDqAhLTGb+wlkeb0cZV+h6Q9zBVosfeTQPLmEYssPuyq3f0FDR
	fyP+tGaYI75WUVNk/7Uikk1kxopJSbyzlcX/jdjqrZquAjHWXoGjtm3O
X-Gm-Gg: AYBFou3djKp1vH9XXxoLyqrVi5WtWYNDkQPVdMK8yYl7IA5rUM/dEZwtTNGxul+ST+x
	M7AxPoU9gqiXNVmPPixZjiciMFW8ofjx4cZB/hhCZF+o0Bn2b0myuaO1mMOrm954XEQF5jIFV1e
	RW5ASONTHTAs5yzAR0FXX1dbcAmfEKiQ8PxYbc2NBln9aAP/q1M038c7EjLP8TH6lAeolVZI2t8
	tEjz/xsADQGI/oR/59cP8yAH7s+Dgjdmh3Lw1elH2TMGqByGMWZ6tM0qcB2L9Ha4Y2J+Rqryt8t
	/ZkgryDThLEGIZ2tSEjXjt2IWh6qh6p/ZrgJuhCPWrFQ8uQbtCjhKyB7Yk46XpELaVnF68bahhV
	xpb2xnF8XhT+zR5/EQsrYURCaErM4z00NQEccKhQMmY2Ve9KokFIFMsvxS+SMUBba//stnszySc
	S4hmLkT+gviJQNCVxO/Q5h4UId0UHNqF9kcHKVmL3RRAO4qHkReovKKMXuGhkLFoExJ1hyVF0qe
	ZuKYHLDlvg9vbZbv4XvSz4goQ==
X-Received: by 2002:a17:90b:4ad2:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-396d0fd53afmr16634286a91.10.1787973516489;
        Fri, 28 Aug 2026 20:18:36 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186803asm9642134a91.11.2026.08.28.20.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 20:18:36 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH] f2fs: sync pending discards before reserving device alias
Date: Sat, 29 Aug 2026 11:18:29 +0800
Message-ID: <20260829031829.2581587-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_x5wNWf6s7j9FBrC5P28c__UiN9kw6mDvqVGgZZCk-ruA@mail.gmail.com>
References: <20260828114125.637513-1-qiwenjie@xiaomi.com> <CACOAw_x5wNWf6s7j9FBrC5P28c__UiN9kw6mDvqVGgZZCk-ruA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

Thanks for the review.

I agree that walking the range block by block is too expensive. I have
reworked v3 to walk overlapping discard commands, cancel prepared
intervals in bulk, and wait for each submitted command only once.

Regarding the synchronization point, my understanding of the documented
ownership model is:

- reserve: In-service to Aliased, handing the range to external use
- release: Aliased to In-service, returning the range to F2FS allocation

Therefore, external raw-device I/O should stop before release and start
again only after reserve succeeds. While the range is released and owned
by F2FS, normal block allocation already waits for a pending discard
before reusing each block.

Also, cleaning the range only after the release checkpoint would not
cover new discard commands generated while F2FS owns the range before a
later reserve. For that reason, v3 keeps the final range synchronization
under sentry_lock at the reserve boundary, before marking the range
valid.

I have sent v3 separately with the command-range implementation. Does
this match the intended ownership contract?

Thanks,
Wenjie
