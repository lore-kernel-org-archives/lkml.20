Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12926426EB2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234205; cv=none; b=W5S35Lu/0SD5SAyvTkXVWicCorl9wUhEYL9RN0yoC2uexOPMTkcyxswvyCA5ncHhNHyADftal6wMgmr6cYXnYvCZNWjX4BeoFUo+jBC489YqIJoTaYuK5qG323vWSuECUuvBHrE9lqnIREOrgw7BdeH4n/n5vU5f1RWDuLCfp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234205; c=relaxed/simple;
	bh=GTEVgAingNMNvYRd0hOrqYY22SEBjqYKvF61JqVY9do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mmz1oMvl2h0SULo2DICHSkuGopBsywE1VhI9JMsFBGSmH+sxxpsxdjLq89tnjVUlcYUUuJZJU2t0tBlQsfN2fblek8gapEfYNkaEezNrz0WN7eEjs8Ogk2CouHy3rOkBsHxx8nc68pjF37fKAyVPGcvld1sVJ3momJ4Jus1KO+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxCcrb3u; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxCcrb3u"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1297087a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234191; x=1790838991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEBq3oR2dxLOGmSLGFiZZ9aV+cM/ZzcBmqDLieFfw5A=;
        b=FxCcrb3uD6nrom6kzH+joZQKgjX+gQTMX0Tg9kLJ5tp5ChTuUxTCnDqqRvsSx4V+GN
         lTt9XfKGvcd13EDV1E+I49+0vLMOD5fAv0gbWfDA3TNwsg8NLRPL2no5vGNElNaSrVpf
         TSvO90CS6NVy6mULmMGJmbbi226nKXaolR6gl10tVUzutRX0jRfWtEO0Y5ar+NAHxJ89
         XUGf9p5MXnEaxrT2/ia3kLyb6ISqxovLoqEcT5xJE4jlZmW8429/7J+OFacD+vBWuiSW
         Kl9pGv7RX1o0nqJ81pMXXav7a5VDv7+xGIJ3iPRWLD+c68tG6b4aBSSuold3tnLuspM9
         93Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234191; x=1790838991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEBq3oR2dxLOGmSLGFiZZ9aV+cM/ZzcBmqDLieFfw5A=;
        b=TtvJeguLMQoje67S6g/zwQcqqDDCgaTEnBoV2yVhBqaelHinla7p9/tiTCQ7he1dfU
         EW44l8YSYphfo9lJBvii8c+BpePbx74QCSbQGEXNtiJU4NLdjCHObaMFp2muZezR/ECw
         K+bMEJwuaffBpNEfniYckuwZo7i9V8gBROfSeTBi+6y/3/GSzFJ7RUau81oRulEbaEcn
         51Wiea6v5POxNKIr35xUmWWKpgCu38GJ8U44OlrKCB76Bt2aMtZKJsoJ8/jM3NxoVIFP
         rZennpfrfEY4tlIolvHEd6IFz9J1UOdqMkBfx3aRMOYZHPAJkFhOhpPgYxhEttm7V7+F
         fIdQ==
X-Forwarded-Encrypted: i=1; AKwUvByYr8HbmQd95peZ5CA8O2rbxuLlA2OSn7aKEWOaSIBO6oLvbmkclPxlJq+eecWzv8JIG3CRUlvjAjcYMHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mg2a+ncFYwObWSCrBqIkP2+Ff7sXH0q1nKE17pi5seOvHMHa6S
	bR291Gf5JSPLw4kOJor62mne/UdOaf45ivHTbQDatthk584T+b61NHjQ
X-Gm-Gg: AYBFou0E4gVxKZLR2GZevT1L/XQopvCteEYVINl4G/ia6phVp+BCItygSc68K940IvG
	3HA/O4ZcCDkFOwQ2JzsSLhFsggjFrLsHfec1mY1ByGOy1t08CzyZH8DXPzVMCq/f1USy65L4zIa
	AIhc61xpm0eqKYT24PrTA3QEqxuYOhaBJpZJfyj0NxrGRjr+JHMmgbJBbscfZnbkfo/H5NNaGzD
	CT/40SY038thLwQOkkq50IwC6+2x291YnSNGmQPmSdLOPcNkNkNQMrD9A7EUFkekHy/5ZilD7sz
	lg7UE1ZlWYIhpotHShnJ9qTG3vDlrdHu+kfpZeS6FHOCrzycOk7B+rpKUN7Blp6QbYkJkwScRYA
	Wqj537No2UvBf4+PvHJNs2AAI9uu0UrR0cl2AFleONJ3PKxl9T26HvbohEEj0860/kfBAJPO51W
	kd29Yk4U4QkWS+dG3aBmgxNwBna4TW5H7WKFvS+Q/z5FzYJAWf7GxJXdqPObk/0L5+vuKN4s3Hj
	ehSF/FcSmqg61y3drODtj75m4N29ZhkQGDYl+hDf1xqqmCQUSpQwYDBwXZiFdXSgDv0t0DdVtmt
	DIDzY5YtzA==
X-Received: by 2002:a17:90b:3e87:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a09872e15cmr1359457a91.39.1790234190967;
        Thu, 24 Sep 2026 00:16:30 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa00sm4003402a91.5.2026.09.24.00.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:16:30 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: kuniyu@amazon.com,
	edumazet@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH net v2 0/2] af_unix: fix inq_len accounting and consumed OOB skb handling in unix_stream_read_skb()
Date: Thu, 24 Sep 2026 07:16:27 +0000
Message-ID: <20260924071629.2683160-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two OOB skb handling bugs in AF_UNIX stream sockets:

1. Decrement u->inq_len by 1 when manage_oob() unlinks an unread OOB skb,
   preventing u->inq_len from remaining permanently inflated and causing
   SIOCINQ / FIONREAD to report a stale positive byte count on an empty
   socket.
2. Skip zero-length consumed OOB skbs (after releasing SCM rights via
   unix_orphan_scm()) and pull UNIXCB(skb).consumed bytes via pskb_pull()
   in unix_stream_read_skb(), preventing BPF sockmap from re-delivering
   already consumed OOB bytes or partially consumed skb prefixes.

Changes in v2:
- Split into a 2-patch series as requested by Kuniyuki Iwashima.
- Update Fixes: tag to f4e1fb04c123 ("af_unix: Use cached value for
  SOCK_STREAM in unix_inq_len().").
- Call unix_orphan_scm(sk, skb) before consume_skb(skb) and use
  pskb_pull() instead of skb_pull() to safely handle non-linear paged skbs
  as noted by Sashiko.

Hui Peng (2):
  af_unix: decrement u->inq_len when skipping unread OOB skb in manage_oob()
  af_unix: skip consumed OOB skb and pull consumed bytes in unix_stream_read_skb()

 net/unix/af_unix.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
