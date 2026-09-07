Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27938E8C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761664; cv=none; b=kyEGmSKXDaneKxcv5XgHMfbGb6pjJaetiC5h+5qydOG8kJP0Dpv3WCnPkBJFl8O8dflUor7TWPG25EYTCFXKfV3waPRfZ6MVssX0g79UZ2R58Mh6RJSMSRPRdcBYt0R6H58lfyrSIENcEjIBByEkSuF9+UTWi6EAd+kiXntehtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761664; c=relaxed/simple;
	bh=sOd2VLBO7SnuNRsA3ZiaaNKPFxM9yphhqsyMTulLcH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmQjhCQKeAtUXMpTuxvq0Nx5DpEwoMHsSC0aiXEXiscSJ3tZ9whU27/03FLUQcU3tTFZfCJS5X3THZiQCzwy4so6j7c8mPVUW+BkV6sNgs3XIVOB+JOa/aNKV94c8JY28xEJdhNlD0jn76KvifW816CZDWHlrkro521nbQ8tVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sF3Dudic; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sF3Dudic"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3375923a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761662; x=1789366462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cToOiSNt/mpzlRPqbeCUKa9ofVZrQ/7IjRG4NV0V63U=;
        b=sF3Dudic2ZhBrpu+6yPMx9drdUK5n9hDr7Lm1dUEp6J3+Gsdr27Te2Bo9s+RyRQdL9
         lcsjE/0bOPfzyEM0mYrK1mpccNcovIDZxvKWSBrB0tcP0h10t+6CMAsQTcwjsgVLVoC+
         Az4E9XAsc5PnKX2NZuPTNROBbnT2PdHc9mBqo/T3nEWFur14QR4RnwTcGIrwQ2JqpHEc
         xmVFHNmbGY40vzeMDsQQNbidt7XvQ995jChMziORTRz0CqpwPDDKcGx2oVLtaJKB9d05
         YH4Wiie1inWihIbSa4dYRajLR5gYgdFMlmEKaRNBjJwLoGsopMolOSJYOzZdx7IEq5Qg
         h+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761662; x=1789366462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cToOiSNt/mpzlRPqbeCUKa9ofVZrQ/7IjRG4NV0V63U=;
        b=QPSSd83I+hozhGYQ8S4Z+mnPAWew7B679xFCBRT4g42V+Ibyfi3rgP7GpmqhZkM1ml
         5zxhXmGDtOj8rHwJLnaySZN2cn56sM9NG51IWYfRID6JgbmLEid4zKjxYJNh343ZhFcD
         AlNBYx8UaN5+LYGId2nlveW0ElMusKp+rfwALW4Y+6Ie9sOlXg+WDgWO4V6u9ecbOUNW
         NsMkL/tHFgWlUQrw0FKyfoDlhnW91JiKTwJiVwQupvpiMxnzuqPbeqhQH/3qCmDxZIpA
         LNvBTMM4HCQgSmAcycs13goa73j7RI1pq+jI8tdbshtwdZ/qc7nWjgnef0PuSJh9mToe
         q20A==
X-Forwarded-Encrypted: i=1; AKwUvBz/Ys1tcGnhEMGjrOtv575ArwA+QSnpKQ28lkaNvQSv7dhHRQ+Cdmieg6AvzKmJMggkB2tELl4o/DFcnzU=@vger.kernel.org
X-Gm-Message-State: AFuF++mySVVtypriR7aOAbveSPVGyr6PxSQLm20BTUSesde0y9VZ+YaX
	1Mdmvvs4qqRPoUMRoE0fokQtanyQkfeEAUu/1AMx7rFnaIY46gW+T48UpPnbsK5Qbg0=
X-Gm-Gg: AYBFou3v+IQ37Pz51dhxSgKqAdVSryioDp9nJPVem7MP3HsRodsn7rIpRhlVGAtvBsd
	HEWxcqJOss83xqolCleG+ETVJVIptINxqM8p13kyX7br9fxqAS0sN6dnjFkiw4ZelzBTx5sTipB
	Gx/TmsRXWOBD1w9mqZZgXXx65/DlBfJsnbO9NU5BlzcUEks+BSCJvVt9/BX08eYJZtYovTOxXeV
	KcuisRGV3/fuUxE85Rrzz0ft6WDGhCa0uRszq7tobCRTHiGPIyoPfDei7Tp54cLOmk8AGb624zh
	l7RE4e04cg2n7NdTlB3RgVwN0QY7OncePRPhNlXkJ0xy6hFwqCkMJ1q78BNHeLSTi51zCOn9CP7
	g2ql0d9Gkpy7KCwH7gwctBwn7AIKpDGJPLnoKz+iZ4Om7dlVBy/L32fZm4hVoFK1TuuguRnBtI5
	vl/BJ6x6fOlcqgmZF9QSZQM/1UYTERGTa9eHNCX7j8L/HAjW+vJkR2irD3dNZGSFP74w0qleLDv
	2dn3iVILVz7Ng==
X-Received: by 2002:a05:6a20:9f86:b0:3d0:cc29:ff64 with SMTP id adf61e73a8af0-3da39ff00c1mr34472283637.15.1788761662040;
        Sun, 06 Sep 2026 23:14:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm4651595c88.9.2026.09.06.23.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:14:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] net: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 11:44:15 +0530
Message-ID: <20260907061417.33729-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  net: mac80211: fix typos in comments
  net: fix repeated word 'used' in comment

 include/net/mac80211.h                 | 2 +-
 include/uapi/linux/nl80211-vnd-intel.h | 2 +-
 include/uapi/linux/wireless.h          | 6 +++---
 net/mac80211/cfg.c                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

