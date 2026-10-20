Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792467839;
	b=v6+HHxSaeCDO8fg3YgMk+7/ar3aVD3vwdGLgK1sBsKbY63lRSbY/xJOE1oT2RzOLI1do
	 IrhSXKCyq1ENSSamw+apGY0Ce4h4IiFz1sRWqkaTCVGQ2iRfGIG+3tz9IIVrEJXukOGtM
	 lG9koWF3FMVC27bUMcgCbuIafdldt5hfDQqSxQEKuacmgAqSFo9ok8uXjrrT65W5cfhF1
	 PwPPWOyYUTRvWLCicp1jfjueS7f5d/b/Sx2G8JNU1XTCV5vARuxZA4djKK9NEptZQJzOA
	 IjBqKI6/fHmDn8BT9uJrIxbeCGTJza9YE8EIBYMGJIwrlwKM14VDEuGn2PW8j+QQW6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6AmciestcwpfVwikDIiE2zDRFZ72F9LqkNUf023WPXQ=;
	b=gQG3NeNdXdMi/ZShrurOLhxSoajGvxDHrr3cA6MLwpVQ0O3mRiQhnO+fVfM+Ka6CAg/3
	 1Fwwf4aU+PSG6jPJcfQSVeP1gwaMwXRM9AlEunbvbhtmz/tyPtJKy2yGyFB7lnLqyHSiL
	 zwA+l60VBCfLtwOnC93EMAakrAT4OTTX/IdZ004sW1vmoZ0q56rY+GpEqaVM+abSB4lBK
	 l79N5AcyfBnbGUU/DWEYlPyV2Zh8zcGcSkEuC2sVBqs/UvNAnVVFeut4PBZwkCIQ8A38o
	 vy8+rPXytO1/RFIAseEtywJkXLUxOkQyPv9dFuKLNSXpBgZ8KYRbwMhlAHqlK38V3ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sZHAOxAN;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD77606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD77606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sZHAOxAN
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e608cd460eso15424205ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467839; x=1793072639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AmciestcwpfVwikDIiE2zDRFZ72F9LqkNUf023WPXQ=;
        b=sZHAOxAN1BuO0JlG7HTk7N+KXqwMFWOOiamBIhDs4927cLmxQDltvUisQmDK8bGlsR
         PyDSd5/G0th5kYOUdxya5QEWtHgAL436ziufvB3tYwCm5bwDM28yxk4qn4v81QEY2OgH
         w8KZzK8n3hyDxFX0dSu3H8IygRgA5IjhnOfIvtGJnDIQsRDMsm44LTIaz6oGRFeH1P3H
         dtBOoP3TBnGiJG9c3q/2SkjHqC6I4advxQVn8UezKs83HTYlzy3gmvROoZi6b9mQtZSv
         YHQ64Pc1hFwXQFn5o9D30y1RpsHF9Qg99oAmxCpDjc3zw9kyJcFSRKbIK4r9FUhluhuk
         j5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467839; x=1793072639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AmciestcwpfVwikDIiE2zDRFZ72F9LqkNUf023WPXQ=;
        b=Duib7w6Ta4/M0CIWuA4uWzHVjKnB6KX/SyjrBkwYXndn+JSgrFqkYapb1ucpE5IA2E
         zPfR4f5zgDxpDDoK1UrIY2kaMB8ud9WiM2WGA+zfqcld8cGdOhgkon5hwdDtlVlmOQ2C
         G1/ttjHYe7tpfkZpRtIkIJLzZpEWuffiiJ0r7gtbiEBSAs0kjnnLQBvLxS8onoMvqFk+
         lXBNkeg4pvk6RH/9NKhtpq+XtRBiDsrzRp1253ejK3IH2X/KMTM8p/YnapzupJ3f/loG
         /Aemi4BnYMHGB0tA6OOR2buqZZCFbj2SIc4aX2hykhbh3Y0vGWe93A7hw413rxatViIf
         3F7g==
X-Forwarded-Encrypted: i=1; AKwUvBwTGM94x+QoO0U/tUzK13lc50CqY2bsSqyCTiA+DS7VuGX5/IrBSzGfBqSpCGq96nXmj0a2A46KgxKqv34=@vger.kernel.org
X-Gm-Message-State: AFq9FYKybC2GTq3H7RAHB2uaQMaGqOHzkEH9ORuv11qSNb7foi7SJVx8
	PR2MWlXNTegy0rrgnUNRq2Hc8/FIG8SjCVKyaq+iaOTNmk0/XbgamDdc
X-Gm-Gg: AYBFou0wCnSSvmDignzqxCDKYwHfMoQdHP6FiaWo7grGbCQFKI9/NGidro2i50rkxBO
	f0sBqvHHi5ACryBYd407Arp8MEGhkjaUpfqkezp5KSktvcCnnyT9E7TvdWyOMlX5T5KiZDzqhoA
	6mMNp2UVR4Tsr+fzdHYXcyvw+AH9ndmQPn4I1TdzEZRiil4g5SqE9EcegUzFRiH1B7eQa2+zeqb
	rNcozxxW0+HLPjkd2ZmgNWEhAkiKOuqzCOTCFxUu6aAeFX1/cAjFVhG729wcDO7+0J/1bDNVFY1
	oyVopzwMZ1Q+QjZFk6vhEckI0RjmBl5lVDYcV7N/zLZFDREmzoDjcWyt0kFXfc3eVG0yuL6BewM
	xw1hxGqV1vuggIl/ygIv0Qfyj0a4cXY/9TB+PVNaWWuwxQdjc1RKh0zn5mO4h0mqpDUEj1ZIWGU
	NB0Q719gjJ5Zl1MhT572+xcA/Figp7mqjP2ZnrFPMGIsJBrj5hTk5FrpduK+Hqw3PMxg==
X-Received: by 2002:a17:902:e844:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2e9a6e558admr80578225ad.47.1792467838712;
        Mon, 19 Oct 2026 20:43:58 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14caa857sm8143885ad.12.2026.10.19.20.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:43:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/2] ocfs2: stabilize dentry names in file-operation trace events
Date: Tue, 20 Oct 2026 11:43:50 +0800
Message-Id: <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-0@gmail.com>
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

All six users of ocfs2__file_ops pass a dentry name to its shared
__string field. A file reference keeps the dentry alive while rename
can still change the name being recorded.

Use name snapshots at all six call sites, as Joseph requested. The
first patch handles the five callers that take no inode spinlock
around their trace call. The second handles file release separately
to preserve its locked open-count sample while taking and releasing
the snapshot outside that critical section.

The patches are independent and leave the event class and trace format
unchanged.

Cen Zhang (2):
  ocfs2: snapshot dentry names in file-operation traces
  ocfs2: snapshot the dentry name while tracing file release

 fs/ocfs2/file.c | 97 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 29 deletions(-)

---
Changes in v3:
- Cover all six ocfs2__file_ops call sites with two patches, grouping open,
  fsync, read, write and splice-read and handling release separately.
- For release, keep the trace and open-count sample under oi->ip_lock while
  taking and releasing the snapshot outside that lock; cache the
  event-enabled check.

Changes in v2:
- Replace d_lock around the tracepoint with a dentry name snapshot so trace
  callbacks run without the caller holding the dentry lock.
- Pass both the name and its length from the snapshot; keep the event
  enabled check and release the snapshot after the trace call.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v3-d628f98bfcb6784a0bfb@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v4-a9a0df898afb4fc65fa0@gmail.com
