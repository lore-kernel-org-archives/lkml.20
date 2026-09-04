Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCE48A2D7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525243; cv=none; b=TzQq4fi2dva3kpJ0LXXXgDcttkL6RXTtCn7NBs9/5C7c6dQdQbVpjr6g7wt2p67CQNkz3CJXYmQ8LckshUVdX1imszQR6Tcxau/4FRKQYupjIm+BdRuUkvhZH0xNdj2jIwtHzRYNQPrtUgUTdtqACCdFGW7kUYMPe2YfSdHdFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525243; c=relaxed/simple;
	bh=Skd9sFGVupjNb49dheKYVjsjANwr0mvKquEjxnqtDAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFcuE6rT5oU9UC5omkUy2Nm7vaggXWUm/d8HFJWf4Nq7IDMt6klSEXqj7BNGYyn2+x7CFO7lp95R7ToqdSxRb6iQNstrNXaegNIsAmHH7lcgsrvem3UZ42TbSH0DJVwBASZOKp7it+0iJ2+zshmEooXk3vg/eFaUnKg+05gALsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQFXkZEL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQFXkZEL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-85339ed040aso728731b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525242; x=1789130042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bR8WQ5EQXaV1EyU8v3N7xZtL4bw50Ua0ZSK8OwOEQ8s=;
        b=LQFXkZELWmeA3mxuok/98puDYznIWkyPYzM+Ks9X5D0No+0EhiyaS3xkwKRBjYnj3N
         l+dM+w9AfA6M/KRHtOoeEkcgXQAeYsPijjphloCgHcNT8FMXxmmKyvLKlUacsyuwYPDV
         3XRordLDL2BsKhvkXD91ZNebxkoedPUeaDQ2FFRGgQpXQyzOl8KlgnFvePZkleDFDhhY
         H5Dmno/o7TjtBQLsaWpM79KJ8PskABdbPE1+3IU8JsJz8rG1krEyjTWQLfQf1pPQWM8P
         AASc32At0djdBkop5BnPVrbmw9mwBFcNsRA6HILTKGAgyflQKJG4xHGN6MbSX8gjdR3s
         iSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525242; x=1789130042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bR8WQ5EQXaV1EyU8v3N7xZtL4bw50Ua0ZSK8OwOEQ8s=;
        b=FuN82guQ/HbSmniYY3AmWcPdcuukCnawDNKHROSfspvys7+TVBcVYVxBAjyjdLBnCU
         xCMTWWp7/urcpeOVPpw2s65c9V9SGDdLOmweLqaIC/E1d3jCym+qGD/myUMxkysaMh4C
         oIX4iQPwGs2ps4LMQJD/hSfUB9Pmw0ryDduqPqNvRwys/eXmIrl72gQVWJ4lqFwI7Ww+
         5lyL22Qjy4XcFPhL5m71Z/puCZHlRLb8+LyCSuAXscgvK5jkCarD/zcKq7nI0CoITQvH
         JJ2Ibiu3TTjZcn2t9nuox4PE4haxuuPWESbQoI09hq+myva80cRttClk8v3+AubGBAPg
         w+VA==
X-Gm-Message-State: AFuF++kmX9YvVmTMWLBjYb8+uooYphVEqZOGNLntRkvOW+AhJkEhzjeK
	wDZxQBZFrBVgs19tEajk8cjpYXcrbIujlIEo1VCJWvf/+YFM0NPfCWcv
X-Gm-Gg: AYBFou0GKNlfvjkO/A69RhIa6sWBWAJOvmoicSdPtd//yhv3lwwN6Z+TCo6R/PNgSLm
	mYqdVpWyupcxiE7HwPNyGq7cAu9P+HhMvX3veScnC998BFWCOmZHaob4Vc72tVQB0uXR8bHYq+a
	Y06iR/PI6ESKHdYowyhkoYLgR1aA0xf3vl+GP+LLAGl9s7Y/Q6/VQyzYoziiaS5u2qH+/6ULNnC
	2YVa4x44U5lIdqD5aXkJG42ilRZozwyOVpnOAnbNizBUm/2NbkeygS/MEPsB4IkW9rUq2V0XCIQ
	D0pVJLd6EJezJPTDWDO0UrweRjyowDjYmOO/EUELEls7sx8dHnLamRjOJIaHnswhzHZJgzBy7bN
	v1Atw+mcDVRf/W6FgnFZ05QVNLoVrwRMQKvaLz8TLhV6rYoMWGYNw7e7b4ZS/E/2/7adFXegGXC
	zOrUj8aUivPz2FLCMzdc+friqHd+dTr3eZWORcIq+0A6clOPpUTSxCHj2w8PkEO+93SP9UevXq8
	HOKsWDvVeD/9pNoC/FILFcyFA==
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr9807288a91.12.1788525241489;
        Fri, 04 Sep 2026 05:34:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4465310eec.17.2026.09.04.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:34:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [PATCH] afs: fix repeated word 'the' in comment
Date: Fri,  4 Sep 2026 18:03:55 +0530
Message-ID: <20260904123356.37452-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'the', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/afs/flock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index f0e96a35093f..2b1d6eb02553 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -151,7 +151,7 @@ static void afs_next_locker(struct afs_vnode *vnode, int error)
 }
 
 /*
- * Kill off all waiters in the the pending lock queue due to the vnode being
+ * Kill off all waiters in the pending lock queue due to the vnode being
  * deleted.
  */
 static void afs_kill_lockers_enoent(struct afs_vnode *vnode)
-- 
2.48.1

