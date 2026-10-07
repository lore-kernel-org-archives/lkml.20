Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1F3403F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791338342; cv=none; b=lNXS9NHPahAH+S7caqw3bYPi3EvpdbGoMW8aT3Cqqr6veN9C68eTnGAUmgnhlmZoo3ZHYbH1sUKqw/1EHsnmdFLyiMbvYNqUg6LYymKPXbZYVeJGQd+5xSQB+TxdZbUyK1m2uS6QMmOW9+dXWh1xlhq9x1fVNPaedk69GzV1O4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791338342; c=relaxed/simple;
	bh=tIf7W/nmwCnVM6ETQa2lhEAO1QAfidKAfvPq+tKiN6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjZlIR7zU7h5Tudeg0ohmxGkhsqYBRvm7XbaQIYOTYwoNEqEzZ8ucBDgBzP3YEYwF0vdxovoKJ9F5DRJlQXP8DfdsPDZ81+3W1QCRKkflvNmCgDSQrWHRFT1YyCKqAQTEBPtFc5tAHvR86gozO2zNYmZfq3IyuPMcOnGwCIXlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=TbL3ixa0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="TbL3ixa0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3c37877so926527a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791338339; x=1791943139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aape3rD0A/9PXmNWnZ4pikvp5foPOWk9ZifQ2/EdnJE=;
        b=TbL3ixa0GOzssLiUDsuHM1KjWVWWfVdn6LAZLkGPnuwofPv2+czg5p+QNterfzvTX9
         8Bxhv91I4ZLC7TPZKjjeH9dNjCWGztmu42WL3a6SBOkjpe4fRdTNMQzABe28WAmrh4g8
         +cUAvL3v5+ggYW1dO250k/o21NioXvT9QEaBWOPsgf3X1hYHvvym+VPUm+tSdhghSOA7
         VoXjQ7oh9REBKxEngS0Xbu64CYxU/sfMLu8EA9GVJnWJ3eM62m33zyw3LFQOPE8rFrZN
         ymF858rX3P/wTMHCmneo3+qw0X3I658VJuB7GlTkjI+cYklMvYNGV8a2AtiLMTtGa+VY
         LjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791338339; x=1791943139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aape3rD0A/9PXmNWnZ4pikvp5foPOWk9ZifQ2/EdnJE=;
        b=1xznlEMHz/XwnhVng7HsCbnNmgqwH9V9OIG2LVepWYGLDIrAlaVvoptf4HR+OuMEY5
         Ey4IGxEWKKUGjCNuMAXSMJjyzoyxUokOw3yhIF7FuT171QVAbu7sdZkNHsMAENuDtkDC
         R11idlhEO5eL2Gz6tdN/H0k6nvUxiMc5SVob4ETNKTBQNlIMeo7+9YuafVIPnt/4hbYA
         EpBd0L/iDfDUe8v6CZNauK4zK5hPra6nYahaX+vZ8GjiqXh2Zanu1SB+yd4ty4i845cE
         YJwn2s+byBZkdjV1Qd2S+orLBgVq669mX4kwg2X1tyHi1oYzrGvR4pAWAn8jSZ1QfuvX
         ghnQ==
X-Forwarded-Encrypted: i=1; AKwUvByasF1HcHykxSY+qTEEuFEKIz1qs+bULuSyDC3+ffd7o3UW+cDMljZIROC459yXc313Oo/SY8m4Jh4yo3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIR9pwZ2jSEygVMYfqcTySVbz7Uk7OCuQaq/ZqtASxrGbLpIuu
	JRt5OIrjdtYqqh/NNdNidIDP0clJ8PmkPWEKl2nJKMvrfwnrvwDbcrZ6o6OFFjs3HqA=
X-Gm-Gg: AYBFou1cRwy9fS2pZqTHVoqk0hbWX+TMzS5XzgDzLs/B3+wUxTGTS35kU3Vu9GOc671
	4t7DP5hJ9vtYe0alBEVMEaTZhzuSRpudADVSGdpEBjuK69LoL9WfMCbaRMPXuNGPvSsK40b5mWA
	bbz0/n3kCcHDpz8N3uaVkRd3riVwKdWxQFsB0RbwczeFe720Q8+k4O+eWzPh+eeyOdvUktV1iqf
	IcxRawPdNz2SI+bf0UUIJPUhkPQ68OxPlxLQMGxHe+5YEmzfwttApUsiapKe2fu47cE3jIEZw3Z
	6Q3omcBv4ValZlGXT0c5uIAMKwk+wkx0vjjpmmtNmqaqIACn/n7usbnenvUkmTHSVnQ7+TwF+lE
	3S40dnW2diruKBrQedtr1YK0MSj1ToZp3jyWG5HX78OMU1G2jX0yeBxvsxDDLvYoiTszCwU1nzz
	cqikREEKCdQ7FmIGvTLJ7wKDzV6ANoMWBLNpDb0DktSea1Djg+uo6UdiqLhuOGG03oZPXS3LEKW
	Qs5Vw==
X-Received: by 2002:a17:90b:4a88:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3a8a1b057famr728367a91.39.1791338338188;
        Tue, 06 Oct 2026 18:58:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543e8478sm8777205a91.17.2026.10.06.18.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:58:57 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 0/3] scsi: libiscsi: validate task lookups driven by target-supplied ITTs
Date: Wed,  7 Oct 2026 10:58:39 +0900
Message-ID: <20261007015842.634893-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three places where an ITT taken from a target-supplied PDU reaches a task
without being checked. Each is reachable from the wire with one injected
PDU and each is independently useful, but they share one lookup helper so
they are sent together.

1/3 bounds the index from below. A transport that implements
parse_pdu_itt can produce a negative one; be2iscsi does, and forwards an
unsolicited NOP-In from the hardware with the target's ITT intact. I
have no be2iscsi hardware, so this one is argued from source.

2/3 is the ITT reflected in a Reject PDU.

3/3 is the same defect at the lookup that five management responses
share. An unsolicited NOP-In naming an unused index dereferences a NULL
task->conn; a Text Response with the same ITT crashes a little later in
iscsi_complete_task().

Measured on 7.2-rc5 with KASAN over a proxy that injects one PDU. Five
attack shapes oops or warn unpatched and none of them do with the
series. Normal I/O, an abort TMF, a rejected NOP-Out ping, a userspace
nop sent over netlink and an iscsid-driven session are unchanged.

v3: 2/3 - initialise task at its declaration per Mike Christie's review.
    No functional change: the .text of libiscsi.o is byte-identical
    before and after. Picked up Mike Christie's Reviewed-by on all three
    patches.
v2: https://lore.kernel.org/all/20260804040546.2264137-1-yhlee@isslab.korea.ac.kr/
v1: https://lore.kernel.org/all/20260803104149.2114414-1-yhlee@isslab.korea.ac.kr/

Yehyeong Lee (3):
  scsi: libiscsi: reject a negative task index from parse_pdu_itt
  scsi: libiscsi: validate the ITT reflected in a Reject PDU
  scsi: libiscsi: validate the task named by a management response

 drivers/scsi/libiscsi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.43.0

