Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197E3A7198
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764042; cv=none; b=aD1YM5tlV9/O4Jo3qNxQFtaVIKIt16aMA2rt1KVen4NwB7IhrXqMRZliFXuoSzxzSXV7U3uoTxrL6zZDNC1p9mcBCBr1q83xlA4mH1CF9n2Bh3lRM75DVjNhij4Dz1iuV0N5FJUQ4koXNEtxUDlsq+jDuwSfqMtw3ix2HlVMEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764042; c=relaxed/simple;
	bh=Z43zp6+X47H+FRpk/4mStaHuWXP0KhSKFjJs547VDPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKRPij6UwQNFjTK09XmDTc4ywk/XfksCkgUnXfIek715V5LE6BPNcVB/OUJh6cUjiZBT/00rCZ15JavcFifDgDURSE05e8gt0u/35vlBpmv7MWgnsGRoHIYe5hwnkx9GEI14fqtPeo1uYVrXEKoNkzAth4fJOZid83vhsU1jEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GecyAk2y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GecyAk2y"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so5358647a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764041; x=1789368841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrD+6SYHsfYtIK1NfzEqUbDkF+3YxdF5omU4KRU3YZA=;
        b=GecyAk2yqEW7kVjnzkZWyb/AcpEAqhrHrwWSueF04H8l0eOKSDF+oVUvAjAVKYji7L
         MIy/rTC64oFcy8xKEZqSr6M+16rOhXXERUa4VityIJd9LB7vu5cR0wsFGzXD7aFfZYMu
         MTATm9KLe+PGZ24CBEOpBC2kXuK9Q2gxrVzNsND0c5kLIGQsMmBJZnjxJYaDBNyaXPwb
         GRoOK4W99F2LCQrM4c94Cm6ceJ8v+AFQfs45+vL21spoByMXMop19RIz9OxDJ6DPACaf
         fFY2iXCmQE7uD7D5zlVXwBwgV3L+iH75hdqoXLgy3zmHiTlp5BYtNJXe82De6fD4rULo
         8j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764041; x=1789368841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrD+6SYHsfYtIK1NfzEqUbDkF+3YxdF5omU4KRU3YZA=;
        b=Ri/P7T1a6jaOcQvXlD6tWWxe0d7zr/A7tiJaYR31nOtYktYOcxgFcibLTN2Ru6FFyJ
         qalbbzzxEkKuJtDu2VtHlwFRSNPKaI4yJJ06IMiEi0g6QJHXG2a6HpW9DhF1Dxaj+GCH
         l4YrA8QgDN4STw0grYoLfw1+mOHcUuo/anBFZsWcx0UgHGJ0SqGyN9RfWS1HSYZxq6Fg
         08pY5thpe/aIZk50s5CWMV4D5WTO5pXaBMaTZNmI5RgOb2GSJ7GJAbX4r6tR+IHFjjxE
         QZIggMsCW2pb8rWtx9gfxHPpD8wmiS3FZQXSou9RXyx8BG0CY/YweXE2asNwS55DlAFF
         B8Fg==
X-Gm-Message-State: AFuF++kU6rUwk8Pmj4Yp5MGmcigvoLW5ItDeXvu49wvZIjop/4WtByCG
	gVaN+Adt2wGqJQ6ABuckM5pZbvSU0hhjG5xYmtkSvgk/aZu1HjYDYTMT
X-Gm-Gg: AYBFou2teCuajvwDSvgXHZ11keEls+7+ef8jxCzrUjjQO+j9b9GFenTbSbrAvvkor/V
	9NK6zaHmY7jCB2XFXUthaaRabMmVPveU135WIwELwUdXrZ9OyP3lM3wJugKhdARk0xLAn4H9L3L
	nFDt2l72qG0liW4opcCTw32hkl4hlpKUb+WDCOCbwPUBvuh53MrniffXM364dlPct4JgY6pRNRw
	sUtfuZaXwKBCZ38SsbBnVuIZjwVmIK/2sOtwVfUikzKzqKbrRTH56fMeMcYvAMoF7FARsTr2VzX
	LDke/9lZNFcVMXVH1hUs4D+QGEMel0w5RVA7iMPtPbRKc4IqZqTTQLN6wv+NaiGzk9t0Nihflbv
	PhHfRfItpDpDdA4/OYeDPw0wZ/yc7G+lOvcgAnW79ddKtvVXwxL419KxkZcaW4kRqLFrGmnQdPV
	rKkQMFAwlt+ng4yd9LprNhmKV9gPlbz7rS6lRyoxxdPvpwqOFfqDKwRjo9m7QY0/ve9lOJuUGt1
	BhbEYBDs/ySsw==
X-Received: by 2002:a17:90b:544b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39b261e3b72mr31902807a91.12.1788764040901;
        Sun, 06 Sep 2026 23:54:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm32883083c88.2.2026.09.06.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:54:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] locking: fix typo "supress" in comment
Date: Mon,  7 Sep 2026 12:23:55 +0530
Message-ID: <20260907065355.5257-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "supress" to "suppress", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/locking/rtmutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 4728631ae719..9d76aafe529a 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -790,7 +790,7 @@ static int __sched rt_mutex_adjust_prio_chain(struct task_struct *task,
 	 * are boosted.
 	 *
 	 * Even when we start with ww_mutex we can disable deadlock detection,
-	 * since we would supress a ww_mutex induced deadlock at [6] anyway.
+	 * since we would suppress a ww_mutex induced deadlock at [6] anyway.
 	 * Supressing it here however is not sufficient since we might still
 	 * hit [6] due to adjustment driven iteration.
 	 *
