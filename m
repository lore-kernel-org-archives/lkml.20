Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1245A46A5F4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928835; cv=none; b=h31NdO35TXy0/3VhNcdtI8+sr6niG+Hhmd5cblFABgjnZ9pk7uFK/2p9493Hf3dEukR/dZh8L10A/qfLICHzHUjvD74I0t/ej+xg7QBdukomiNlNCZ7j+RCa0H4g+8/rvPyEjw66TUOHHyMq/pSQeuvBLJbqFJO3hMuIr41Vn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928835; c=relaxed/simple;
	bh=FtXL8heuT9YQs5T5trNr+oFBXL7R4XHaGzN6EnP+uQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIR51vyhgdndfa6LpN/IF1MArHZ6xGcKwuQpldB64YCHJO7VMWIOSzYMnM46sUbxmEbrkgl9/9/egrMilUAPQ+fyFaLJZTPNAee0wwW+RMUEsQaZ/qgtLq1j8GAoEcCLiESNzcDhdI/LYkknizNV5eYMxbFQfZKYuNmjRO3G7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pplxn6z+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pplxn6z+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9aea40d799so620701a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928833; x=1788533633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yh8jeAOemhWewU0cYVunPjLSEVCbaLJBnJ8ffyFMBMw=;
        b=Pplxn6z+K6Aje7WnWi30q55oVHySMkbAEktPSlYc6q1Q1cwhePRko8GxDdOUCNynfN
         iuJVVF5eUHWvmBSbQmXmSYNWNtEGoB5IdcMe+Ocm16PQe2RqeM/f1ahvxkbi+EsIarkb
         Vmlez0rlGGJiu9sn+Rdo+3Ul4xmCNa6DIrTKIZwWkRNJJjHHKYgmkdVKDfFiVKnmHGxb
         ipTumNyW/kYt8lqRjOt4rlLP8LZmbg24j2BmG4Cw5pLypvIrtDc2u0MpzL/dzXHwi+pw
         CdYRL4borRDxg2Vnwe4PaJcSIA++9jsboYPWtb6qN1YAY6LrgaMqjLuDWuopaSB+BwTD
         HLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928833; x=1788533633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh8jeAOemhWewU0cYVunPjLSEVCbaLJBnJ8ffyFMBMw=;
        b=s0T91tkADPRVBvTHXHMIMyOzv9qaNOsWwJjems1zSDNBPc5LdaWzxyLSF6pYpWMAOG
         LrVRswbhIrBywTMkXmaY4psVMfoEB6oitnM1Uxrba4Y1Ec3Yfz/QQW27fckwxOuEFWW1
         MDoyhi0JfQXumUATW1F+grtQA/CpfrVHsfpH27SqcsxNcZvhO5G0QvSq32nIoRlhxmLX
         vjv4VdGOfoi0qRTKqc9VcNhx3eeG/CeGUtQgFQPwyUlkGBgac48W4zk+kK+4Zh3EZt4n
         qU0Q5KGeMac3Pg3KH0S73Eq4TzvyjzVb09PW4Wv3aBktMeWt+m6caiUIE4Vv4if+Fncr
         rt1g==
X-Gm-Message-State: AFuF++lSzaVPH6axhXtVv190xm9sJQKcCorQ0dbO2e5wOmHVd+GEwyqj
	ym7NTIkrEbC2SjEoMlkJqVGqsnWe6NDUvBPxSO5MZlYMf+JpwAQFDHjA
X-Gm-Gg: AR+sD12UqYGGg1uW0XXz4wehyLCCJ7HHye6WhAkxd+Eb1Iq9nCgKrosGS0wI2YxQRpU
	NI0lF9hSeuW+8ZOwkgzGSSkZNVSrKuH1pJXcFrnMlXnMTpzgvY4n95mcmdLol4RMRTDGZd7R36/
	usZqMpMxxhP9e95AvbkAL0NoC5MdgGuhUZ9rHYLz/bEvP4n8SU9GP2xp9e8iUsg64x+Flbcrcpu
	cfaGKfoIF8w3CdB1A0fYr4EpOZBSo8Zb0MDuf/0sO5025kD0gV77AGR6SrX8LsAhD/et/XxqPpY
	vnQNcS4gWnKlGRl3yOP+QR1smqt10PHivnOrWtXWqsawGIninEEHxSekGWkeegIECUbuNBriHrJ
	fKVVKhLA+daJg1o3h66NJUkZneCZvoxdgaIGuLetNQ77Ck6XoildQ/6fdicZRM9uz6xupYSVhqz
	Lb/65O3ic8N52CWqTmpzXEwpXlFkaBrFrFITzLZLsWtaSSdSRz10oNhQVl+kbSdEnTghxFWWCGH
	g==
X-Received: by 2002:a17:90b:52c8:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-3989bd13874mr639864a91.21.1787928832945;
        Fri, 28 Aug 2026 07:53:52 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80edsm7490619a91.1.2026.08.28.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:53:52 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH] timers: Check timer_pending() before reading bucket index
Date: Fri, 28 Aug 2026 22:53:47 +0800
Message-ID: <20260828145347.71644-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only read the cached wheel index when the timer is still queued.
No functional change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 kernel/time/timer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ae9abf14688e..9f3b199d3075 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -897,11 +897,13 @@ static inline void detach_timer(struct timer_list *timer, bool clear_pending)
 static int detach_if_pending(struct timer_list *timer, struct timer_base *base,
 			     bool clear_pending)
 {
-	unsigned idx = timer_get_idx(timer);
+	unsigned int idx;
 
 	if (!timer_pending(timer))
 		return 0;
 
+	idx = timer_get_idx(timer);
+
 	if (hlist_is_singular_node(&timer->entry, base->vectors + idx)) {
 		__clear_bit(idx, base->pending_map);
 		base->next_expiry_recalc = true;
-- 
2.50.1 (Apple Git-155)

