Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4603CB8E6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857985; cv=none; b=QGMdQnKigvWQvJuGRg+uDZFmT0AUH2TG8ZpPwkgc/PTpN5zplFK8CFvgMO5FUvb11DqJBSj4iHVgXbOa1j/TCNrvUkVaJfsuzkLd6Cm9ykg44605l3iYk8MedFu8XBlu2i2OEPbvQC//pQlVkZVmEgK+op5LpOwPfJGaRUraVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857985; c=relaxed/simple;
	bh=nD97E2FLkTmB8Hqzjh5qbJLABCn3WWh8QM4hR/9p5L8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n6g9RAJxBnD62AA+TDGs3pYKhBzVwodEd0ngCHsaYhqB+tDoREIDVbsIhJt5J4P0ERJC00FF2cWhP2aZQMMVUcc4HqZxx1U1/CupKid2NTTtnyGBxCcIvD0keY+spGaUiTU5M/wOfptyOFEUFkPRaWAzlr9Ln8XiVzvXqA5GGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m20HE06W; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m20HE06W"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1873760a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857983; x=1791462783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhoYyUgYu/PYHT4QIXHxuw0wrILGAnXiNG8GA+32skM=;
        b=m20HE06W/rHAhGGOPufmDORKEw5cJ+0nKWEEVDwtTAzz6QTW837a3KbuMLP7jN0HCz
         9c5Mrq0Jf19thROmWriYyKs2Qa1JQrgvI+oPzixdzzOdzOjeKPw2ajYdxDQ7yXHBChVo
         4j9QukQdPF+d/WXW7PX4HOiLsXr4iZTYsAMA0qVJftExKi76MsJcDGBvRr1nZv/+29L/
         pq30TTpldASWKavhpovcQnJu1Mvp784xjiru+HfZIv/nbyOKblbBXrA4tiJ6Z28OyLvd
         aVQScSBoVT9Yx7A5yImgsUuKK9LcrGjiVjMH/N0qZqOycZmFi+mtKskIlQ6VOmVnJdws
         wN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857983; x=1791462783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhoYyUgYu/PYHT4QIXHxuw0wrILGAnXiNG8GA+32skM=;
        b=VN/w+fuJ29kWK/AUjqO40F45tE4N/LlTnFdIHO69kiRZTMnWJBMy4JR/ivEF9QPXED
         2kuaWRPCY/oWmk8QtVzwQi3beJUvAKK6Pd6XxmDzGa/tdF8wYNwR64R0TVqRwkoNtxzV
         nzFUohKBI3RukV/5xGMxYt0GWV1mHWs1BT9eDRd/4ivjfGKquTXP/3ACd5ycljDI5n84
         MhxviAEqOhKvjNHchkihjor0ptynAIeqwMcU2AwzGOP+TQ5Jpn7Bs4FVzu7+sjqgH4BG
         +nVjfpkoy+7FI1jNhoI3+Pg0sPfGtRW/Fsp0kS39GavE9xYLclt25N688zTg8xTS0Mtc
         8zNw==
X-Forwarded-Encrypted: i=1; AKwUvBy2kIBwuvY13SQurD+EewogHQkNbxTIn3qqacla4CRUfSlC7x/6yXY0E1nPr7cD8dtJA1/Rhp9901MA/uI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkEft5ZYdNJB6soJq0+g/h2ZDQ2t4d+SOsXUzbFtwyRfNGDPzR
	DzmQYeyFtia6XFFtdAEWcU6sSLKqAmIVSZUxcOTbUWlgBZSKZxsyzYRS
X-Gm-Gg: AYBFou3Nj+nDUVb/j5LhdvOU0BcwvEAb8ONuMn1XEU7+4orlpDQKKus7ffexCSVRud7
	49OwlGfxZAwUSaLHaz3xe8G0L4XyLjUbcT3fMVWxSfFI5/B5qKAu9HfJhX8N+6A2KWYFvz3ktKX
	EJ4hQ8XUWxB7+D1DlpYRaKV9VKtYzIvTPWOTRedXSln+M2d+PYcwEGOtIRHKBIqdJo4+M3SMW4Y
	FTAV2uRgC/26RZ1SgV8T6G6jUorn4wSZXb6tYFGtUbqM2WIBCZmwwvrVzgHVxPJ2xPdN78AyK2Q
	vtSi3h7n/pWRIWEdxKT3pSx92qbTXcO6ISWgm7Nmuc4/1o5LvusC7eqrFbMswfzacXkXY7HcNTM
	X4+ZrHvp2XMdMTO71rfMre0rzJL8JuYESXu+IQoT7grXPPWZm5si14klwuS4Aj2WjJ52qNSFp/x
	dRygedQNinvltm//GEylDlpEoBFc//32egXPYVc2ebZl0GLvjh202G4M+Tzn2GHWHGnqkvcI7yb
	8pPTGxMD+BDldduK1FUFVJTMyEI
X-Received: by 2002:a17:90b:1d0d:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3a4d1947ef3mr3836560a91.67.1790857983071;
        Thu, 01 Oct 2026 05:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4464178a91.13.2026.10.01.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:33:02 -0700 (PDT)
From: xy521521@gmail.com
To: stern@rowland.harvard.edu
Cc: xy521521 <xy521521@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb-storage: ene_ub6250: don't let the card-type probe hang forever
Date: Thu,  1 Oct 2026 20:31:33 +0800
Message-Id: <20261001123135.38831-1-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: xy521521 <xy521521@gmail.com>

v2 folded coding-style cleanups into the bug fix, which mixes up too
many different things [1].  So split it into a series instead:

  1/2 -- the pure bug fix, diff unchanged since v1
  2/2 -- the coding-style follow-up extracted from v2

v2: https://lore.kernel.org/r/20261001091523.16934-1-xy521521@gmail.com/
v1: https://lore.kernel.org/r/20260929144640.2028-1-xy521521@gmail.com/
[1] https://lore.kernel.org/r/2026100128-crystal-islamic-b783@gregkh/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9

Hongyu Xie (2):
  usb-storage: ene_ub6250: don't let the card-type probe hang forever
  usb-storage: ene_ub6250: fix coding style issues in the timeout code

 drivers/usb/storage/ene_ub6250.c | 59 ++++++++++++++++++++++++--------
 drivers/usb/storage/transport.c  | 32 +++++++++++++----
 drivers/usb/storage/transport.h  |  5 +++
 3 files changed, 74 insertions(+), 22 deletions(-)

-- 
2.32.0

