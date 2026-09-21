Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824F44A3E2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979528; cv=none; b=i5Pod+Oi63hsIw0iYzJi7aA4GBqf45bYMiANXeRhbeffH3tlyXDXMaE8Cls7CtfBAuyCg+PyqZ1B4BLDcEj0CNdhQrmWX3mDRVfOrFn/jHIIL1AAIhmY/VBwlQClqe950uWkkOL8T7g4zBwaVdsgIjaX6MyR26DVUtqZ18XBVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979528; c=relaxed/simple;
	bh=FpulTvokzqTeYJ3OxmxU/rNnFJQPKqgmcY5hN5CfRuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtaTGIy3WpMco8VNcb+BGckGtYgJnKtN9C4U4hxTJpAzeNGczuVDlQWxv1P6XVlY35xFhpN/d6Yp9ViuG2+5kH4wG+SlLCTWnBxrTdQF17b2h714TymQZ+2EKogtppLcCoinrsTujzYufoCo7Jp+hvB+h6zkAWls1+c1cUlwblg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgeWXc7T; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgeWXc7T"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so22621435e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979525; x=1790584325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4yvBlT2oLUB9GwD1lafs/1zu+WTyBTei4mStM1E9qs=;
        b=RgeWXc7TJJdM4IP3yNb4OxJR8gpgeUpY8O8JeOwOmFkm+SCAWv8s0Z4noFVsBazhfw
         Z11O4BU5SJbq6p5Yo9tfSlhwWmhYwBbeZWMukpFNlraMJzv52hadT7QBpNMRe1l5h2eB
         aZpC+1RftVfvulgcHnZxvYlpbG/OLTlcHuDBR4rAp2xXpBr8Ju/tLRqVxRPSiUKze9tt
         h1zl7dTAkVxzuivHCw3VbCK3rqv28HNMl4f1jm4IAcu1ul7AVkNXWbNZaA853T/iJ3+w
         pPDv8Emql11DOGhA4+HQ1E5073c7iKeJgPMVxj7hSlhaZwik+ieXIRdYJDNEapM7oA2Q
         9kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979525; x=1790584325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4yvBlT2oLUB9GwD1lafs/1zu+WTyBTei4mStM1E9qs=;
        b=fv7xvL8XcsFqNOZumSUJ/B5RfCqF2QTkVs6IAgc6FClvkItFhJh3rptLd4ZwCrT6mm
         aGZadQDZoEgRfJT1FnH5IsRPF3sIVQuqi43ir6xWLxE2mAtYYQace87xIfegUrMmBL+5
         FQ9wdpsKvF23EpAfVdhfLmw7YNULp9IlmOWXiXLDt09c7WgWZjz5TbUJG339Sa6YFuYQ
         w+7YllnuOtMKfPQLnkVfZeLRABKOgFk+XShaIXljFSRyuJVkZ+7F3DJOcQhXJjEkfZPH
         UGiLnaMXg6WBBV3rDOat1cJcFpcLBLvxKH2Ji7dBXE1ahoEPW+TTZuxWEFp5Slntj6oz
         mP4g==
X-Forwarded-Encrypted: i=1; AKwUvBzQAC0zy77kJsl0FBes1hz39tPvP0h4ntZoSF+fZFHmFAdcbIXv7fts9+Cm0MKLM2xjeowXCf5u/9tD+fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mOJYLI59t8+/LNQETA4BBriNg9Rxj9FpUD9lOTJMXSklSYTL4h
	HJWzQslph7V6B8foPlDNVEAHKU0a40Wv0OGMltrg4E3kZI96vGyUN7JI
X-Gm-Gg: AYBFou0QQVD7i8Wgk2OH9KxpXSeHj+rtmGfXnGTsY/cXQCn8+PJeQp8xbOFBz2HKF+x
	6BTs4YH7NSUUKTpelKV2TpBJ5N5kbuCpHYNiGRzFlOaGnWMdRozCK6DVWtxNFaao4dqJoe1YWWy
	ckXprivrOW66WglqjF5OvTMmG34wNcaGyt/43vT0EtsWeLJMOpm2CTJne1bQpG04SXFNCbmOCPH
	TTKgCeKboQoOcDTWBtFIkgNyRB3BiiXN/mHlKZOP//v1Jxu+F7IQNSuMwCBjjAdpgUzVFD6nViV
	UJD+NZQBlGm9dZOWfKd5cENjf/3OH/85+idp5Ghu5lPvasqqp8zkOgG53Pz4GFBCLPTlajcoNbb
	4/Ibtka54zD8IoeP+ezU8hpVVY7msDc6dYGOMjkXjsnUBpLFZ3McuSzESs2EJEPa+ESHs1j8HQG
	VovL8nFnAg0zhqQJwr2aboIOPukeDmArHVW/iGUkzs8l9i87BckCIzSRaX5HeyL8YLBTSuFS/ks
	ju9IQnjuOtGJ+8psE+u+tGsDGKaNATPCkv18ssDy+3+
X-Received: by 2002:a05:600c:674f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49fc56aef4fmr130546835e9.10.1789979524541;
        Mon, 21 Sep 2026 01:32:04 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10d174sm222806105e9.11.2026.09.21.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:32:04 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>
Cc: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 0/3] iomap: fix error handling regressions
Date: Mon, 21 Sep 2026 10:31:30 +0200
Message-ID: <20260921083133.2960-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three independent error handling regressions in iomap:

 - clear the writeback context after a failed ->writeback_submit() call,
   preventing an already completed ioend from being submitted again;
 - preserve an iomap iteration error when iomap_fiemap() has a pending
   extent to emit; and
 - preserve a direct I/O data path error when sub-block tail zeroing
   succeeds.

The fixes have no ordering dependencies and can be applied or backported
independently.  Each issue was reproduced before and after its respective
fix.

Andrea Parri (3):
  iomap: don't resubmit an ioend after ->writeback_submit() failed
  iomap: don't lose a fiemap iteration error when emitting the last
    extent
  iomap: don't lose a failed direct I/O bio's error when zeroing the
    tail

 fs/iomap/direct-io.c | 11 ++++++++---
 fs/iomap/fiemap.c    |  8 ++++----
 fs/iomap/ioend.c     | 10 +++++++++-
 3 files changed, 21 insertions(+), 8 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0
