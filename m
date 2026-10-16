Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD71442FDF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155161; cv=none; b=cNjOcsC4TATHDQ9un4QI2Wh5TPSTpcgOZo1VWRj/mEXwECsgJHJHpa6O2JmwmwHio+qSthkjFo6acBjHDCapNVLL1Tv6dCJcOZrNcVsjUNDJvx4OB6Ji9hr2JwbeJLHM747jgCi4zQGwUKcBL53WAS0YQOHPKPgfi4uq1BQ94qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155161; c=relaxed/simple;
	bh=liozZw3edUG90dfqSRetHlnAXnjby7qz60x6l6yH+zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBvB8fi9/C6fC2VUyCkDEHktuS9DbomV556SbBq/QWwSJYUmh1Q78pu2THVvtBVGdxkLxxqlUDaMQcnarX7ClgOtHDUsc0CsRVMnqMsJzldbINmAWJ06UxVMajf/Rq3lfCUFzzurDMJRG0BhRf1yydav8I/9s0D4aoiIGJhkijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFcURtjh; arc=none smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFcURtjh"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c410cdcab7dso22956766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155159; x=1792759959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bLZq1EO3Hw3snWP7J++9hibpM77l9B4DBDoATQxFi0=;
        b=GFcURtjhm6qPAJYlWeAx2+t186sObC9+6M6TIo4AUtWND5aXbAimxv3/Pt4ZSV2y6i
         Qg51/ZYpt4k12Ce8rs4rYnFL+bQPz/DHZWJ4Tu9sp8lQ4wl8aWqs+UOHUVSPLccwKRU+
         9kH2wFUcHH3s9uRQUAQG56dbk7BW4t9wDIXL+jsJ2c0ZuTO8oxZNzOlbero7XXYxEgNd
         EeW9t0N5JrE0ptvb5fStBJbcilJyx7NpIxS06J2O6/7hN52gb8WZVH3jp9GLLfOOPF7K
         p0ZD1cQ3rrvkJjwMNnhLRzAhabyYporGw1ywhim6mzbc9K30l+8krU0cGbrr3dqF4yCe
         A8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155159; x=1792759959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bLZq1EO3Hw3snWP7J++9hibpM77l9B4DBDoATQxFi0=;
        b=lxbNoG+9D+sQ/yhzaw9/Tnb1hLkk//TvFTyovaVJrKd1+JA454uSZWnEE3woHyGiZe
         DMLlJB198q2f3G8GoVWy3vcTQ5llygYCDPv6r1n/CyaWNUBH36LTMReyIOn4K5xOs1A7
         A0MvDnqYn011A/VIBlkV098aq122kSBRfYq9wrEtiz/RqbDdzCQuIAfcQN6Sw0YImT8Z
         9uhsAXk6aLVEaEE4ez4qbkvmf5T5J6UEC1L3om4C7Ha1PS1096BkNk8RBj1uSVRU26WB
         B74VJZ+eAKb9ogylXJ1Jy0FKgrHhgKy9ViyY9vvU6+qYPxqW14/ZrX1MTQsmBN72A9m5
         qsGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoerT5pFTy4RdNumDx7gMC5dz+hf4WBpQv31jZFvQWO2lYXwxDjouutDWjDBjP/vAvwnWwXQuJmcpi7/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoyUZjdtwG6YLT8KJXGqnWFSqxPq1HxdZYQ+CwkzalfUwA/D2/
	exIyb7uSbc+QXhmKMqbRnFUI/zytz4U41sy7rvnIvFtywnedhGN0NFZdOgN1RTPH
X-Gm-Gg: AYBFou2W+Z+dvQt0IjtrhCHJXAAV3iAx+9wBKUe0bm8lFycmoDP4dJHDo7TbpdTBZxj
	B533tSWdhsIo/bXP51iccKCeKWRyANH5yDdqzT4CBzfxufPillALcXi1Gs++b4K49R9XiSABy0d
	UBdSZZVkUSO+yEajaFnK7JtxrmfuQaCbBdxQMSXAhy2sYAVFwCWC9qmiRlDqbmPS829VS67wlJK
	yKMuCd8X2dvvyeRuKNy20vj3WQn/M2eQB0Gf9aJgDvJ0II1JYajMjIFUoGotze8uctJ02dI2VUO
	K/gTxzuG7LEGwss0v5aGjIXuRdFUB8LtrWqiDpwLvc8dmhU7ag2bDeItLc+eH34M7ue1ITDGFf4
	9rFf2NTnjzaDtB30RvAfpr/q2a4mSoYlPNYM8guvLkUf9lRjUWA6X0XsyE30y7/FGhrqoVbQtv6
	qiaf5lLqVls1NkZs75hiKgRUiBLdS0EKg+CuoVnqqYfEFrDYRjaIpKkF2HOtR2RD3Lca6WFi6uH
	X5eIv1Afn3X06KO218gZpIrmaLFYqYMWiBI8lPatHk72g8CnfnPDCT8sae0LfuG5qAOfo3TJrzJ
	grWlymhXKPg6vx8iDxlpYOORxQ==
X-Received: by 2002:a17:906:4fce:b0:c3f:ce1b:9971 with SMTP id a640c23a62f3a-c3fce1ba820mr366288966b.25.1792155158395;
        Fri, 16 Oct 2026 05:52:38 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:37 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Fri, 16 Oct 2026 14:52:27 +0200
Message-ID: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

One question left:

Are the timeouts fine, while in an atomic context ?
One second seems to be rather high.

Kind regards,

Thilo Zirnstein
---

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 68 ++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 13 deletions(-)

--
2.43.0

