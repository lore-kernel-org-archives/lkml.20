Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557A3FBB72
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762989; cv=none; b=SSFvOnX8KjTjuE0OUV+6UTS9lUeee/8klmZsrP9oVzhjapcYzyp5B4CZLZTyJHTk86OFIWtzfJWT9CJ9mh4ZgWNm5MpEZelO47N6aAvMLnNxciSBkEWFLPcK1Hu4M3pWt7hx4FxLBigiLB+BKAiGc2LonhvnirjtPdVUNJYnTsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762989; c=relaxed/simple;
	bh=pD03QRjgr7BU5SpMfl5vWA3SVD55yZSCZWQBX1G2H+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxPslleg8qpErJWQuFzqVq0tpudvW0G7lO0/+Ax9I8s3KPM1rRhtESiKDBVFZZgsmQghyErjzveBFDPEQAod9XDs+2CZ7D51rPEiBHgevNjqfJnyZoLwn678xQeq/N9kw7FTFy6dDIjEoFL0bEEcoopaNVJLEYv7WVcQbKweS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6sXoDgB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6sXoDgB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-85590c5aeabso2000972b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762988; x=1789367788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWnfnrlWdLKnAvIv1s560hFLdETMMfBpllW7CQBsWdY=;
        b=c6sXoDgB+F4SInfky4oEQzvlmLo3rsuHKRYVYUwkHaWLGhi1G5GIe1Ovo58kpUNMun
         Ox3RtJ/zQ0yVKc/H2ILVIgN+rPcNdnyZPRGgwLlndVZziZEiHKOqPco4ncobJJQ5VmfW
         7bkPlYC7IhGniMg9aFuGZVZ5V93++KZatLIMBbM/KxWsGT9LSmJwXkEwkF4lh638+Luk
         gI7w4d9Pl+523qDDhAAHiGdCZEN7ogvCiRr7fkOBj4OQr6F2NC46bvdR+eBs/mnKvsyF
         hf+3zMC8jdORX6SqaBTKGEFp70EFsf2WVyE0zU4XAoxxPt7jNRztb9gujbaHqDfiQyGD
         kY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762988; x=1789367788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWnfnrlWdLKnAvIv1s560hFLdETMMfBpllW7CQBsWdY=;
        b=L8TmPxv2dJ3v9mfZAMrGgrghSs7co0o1s2AxJl9HFMmAgCBTQnedo/0mkM2wgKl/xG
         Q5FO9+v1c0bG9tiMJESH0aapjN15iHHKQM5UHqlOQ/NOFaAjD+7pesFlm9nUqmfp6EME
         Nn2VoBuWi/Rf6NJBTWABzz5ZBqF54/7XYJbjjGSJtgoAr2KJM6YswOgy/2T0aP7EOc+j
         NDGbZY49nK2deCANtwq0AGvJ5Hb3sXVS3aXu6UYlp0TInrdagX9icUrObMdp3VKcrJ8J
         rr48tj5SdeDwZNWtaw5Q1iiTLgYB9l2ZffbUuPbQBbf1IBR2DjTUIk1LG4vT/bNdtNc6
         2Z+w==
X-Forwarded-Encrypted: i=1; AKwUvBywb21WOs5ip+DBOGi/3okwHbNrLXZhR3TGfw1xQuorq6/PCa/f0qvqIQf4pEI9B9FB5tisNW40VgPAcao=@vger.kernel.org
X-Gm-Message-State: AFuF++lvAr3u3a6UOq66e3PSerHU8IGWSUdRL6lpQrgf2lV1GxNlROXf
	LxqPNiOK+bHB0DI/z7s9QL5SdPSdKLgDu2sMteG0FW4c6hNdLeRqXJtQ
X-Gm-Gg: AYBFou2nq9+78YJlABuAZVDuaqQuYgfvZGI2QCHMPmi/fDvMWoOc0usRAY+hr63TGxu
	mCK+vVMCl69e223vWazQRh6gh6XzevEwQ4yjVI6+uimVp7UYJaIH1J49XmEQoNRUReyvAJeebJy
	wuts3HOS/E0nt7bFkJs1tZVVTu2VSY001lAyVA3nAuPnT5DRfI9wICbhmiBwj1MfFmVkhQxEQH7
	l/VDIb6VTG15LXXqgAETiiLwekpHxVx2oAki4w3n9Ki/pSr0TBZ+DUF1oc8FpFop9odPQgyaURy
	6HE1fw9SaVHah2EqihyHQFelyrG3AciJRnmC8w4ZQfCnt6MSBMvlDKCznuKE0S8WSQyDJsPdHeu
	lhyif/Jptzdc1KhUM0BVDG6aKx6VTdpXk4FNPgBcH6R0c+Id/FJ04Uqa+SixK9c3csROIhwuE3b
	r9eVTwq24dIb2X/zdsuUBRfFC49qMpyAWLmViyxFIGnI50mzzjy8P+DA5iMjbl62wzI+qc3b3VP
	QEmbPDMhqkIAw==
X-Received: by 2002:a05:6300:6708:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3da3a00565emr30434532637.16.1788762987982;
        Sun, 06 Sep 2026 23:36:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm24675937eec.12.2026.09.06.23.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:36:27 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rcu: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 12:06:22 +0530
Message-ID: <20260907063622.24824-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/rcu/srcutree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ed204b3f4b84..01f19bb17dd6 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -624,7 +624,7 @@ module_param(srcu_retry_check_delay, ulong, 0444);
 #define SRCU_UL_CLAMP_LO(val, low)	((val) > (low) ? (val) : (low))
 #define SRCU_UL_CLAMP_HI(val, high)	((val) < (high) ? (val) : (high))
 #define SRCU_UL_CLAMP(val, low, high)	SRCU_UL_CLAMP_HI(SRCU_UL_CLAMP_LO((val), (low)), (high))
-// per-GP-phase no-delay instances adjusted to allow non-sleeping poll upto
+// per-GP-phase no-delay instances adjusted to allow non-sleeping poll up to
 // one jiffies time duration. Mult by 2 is done to factor in the srcu_get_delay()
 // called from process_srcu().
 #define SRCU_DEFAULT_MAX_NODELAY_PHASE_ADJUSTED	\
-- 
2.48.1

