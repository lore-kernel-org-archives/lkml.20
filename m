Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFED48CD6D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519416; cv=none; b=fLeJ2cZcR7QUIUdo+Ki9X+9MCH1pfSNnlRxw9WFJ24hILNEMsGW1JqxhFUT5BHZgtZQFdP+YXJrpAV3MCEDtDJvcGmwO8npbzyk9vjT+BI81pPWpoU/zgP88JyLLIxgasrKqdkAASVl9wWrbSscjqzXeKA9pob0yy+ym3bt2YT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519416; c=relaxed/simple;
	bh=L3q78bqrpMJk/g5QJst8moEgJEW0mjslfg//pWTk2/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYpR8bjncGtIv2adyACgOhmjjg7pcggKEfG5zezPtkJrCgU4nzPW7H81WhLIhNVOiKp2lroXZlws/HHqCWC7YDGcjTeg0S7+OMESW7d+AsW0spePa+n15VlIK/jcGrtRoUJhRDh6Suj3etQanbuhVhrmztxYpMoiyNvLtN8b5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dU66HQU3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dU66HQU3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so835879a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519412; x=1789124212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIAgfjkMoEY865Ezpezchwh3HIj0Yl8K2XqbGFpjZ+U=;
        b=dU66HQU3sdI3Rj0m0/x2nY7lwyBx72wHy9Em0pNLWyp5WEAAzAPBBqIUOwBocYZB7+
         1+um0OZdOB3Omqj1boZcUrHw/NfMdXzr4VHdU71ZOmyiBdZLY+lHcyEFbNd/ps+K9q5v
         JwH8XDcHqwcwWjMKfopA10iIZDWjBhgS9HT9vO7T9tw9m7jp5psjO6Y+aLwz+cUoNpbN
         0oA7irvEAbxcdZ3i56rXUtPOEYn8acCd8RKWxNxsA6zhpbWd7jl3LUNscgKxF8ONdWop
         BL7KNa5KOMPMu7FcmuIN1/r1b4W8ONNfBFfcG+Bo+papEwyS6UWySe+LTDx7Bpb+kcDW
         TKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519412; x=1789124212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIAgfjkMoEY865Ezpezchwh3HIj0Yl8K2XqbGFpjZ+U=;
        b=lNtOwG1Gc0ZEZB5OhzIbPudy0sK+a2BQ7tE/prxvLEnbw7HnGkuzF33x7NQWT+Y9RK
         7utPhnu6H06IYJ0Ka/yBHhlBjKVvlbDpELyyfcJyaCvOOtW78jH1Mxl1MrRW0gIXANA/
         6dIMx23Kh1Fp98vCmrPzIAuS5pXN/CFHwZsvrbEPPg1xsa4jGn6XOixTh10Nqp8oh0Np
         CJSK0s3i9xyLAG968x8bNTOmF3Lf2cAlBkzfBp9ywkFoNzLv9qcsHXscpSMm8WsKfrC5
         r5jzE2dO4L4VQaL5UZKYvR8wq3AvQkDK3QFG73Km58cQdMdtyeqYPQv/FvjVlVbQZBa1
         wxuA==
X-Gm-Message-State: AFuF++m+mvcvWZAPZ/v7NONJo7BuSY5eCKFIyovCHsIXh+n9hfQuUQIT
	mtOjnvOrxNYEMyEg5+lk7HlcmDOQo2araKTiBApdKzKQukQ35QAhoRn6P6/BOJd9w3s=
X-Gm-Gg: AYBFou0U5i6hqGnkEisNLDy0a2+CohjdCljiaLGOmfy5zoUgferECTpuAUazZX1WsQL
	f9bODqzCThWMdUQS5BfkV7xgq5zTsDZqczMr0FB+50fh3cSqzEK8HZuY7dhrAh6EON4KEo2s4Zf
	pSCzGK2DVu4yQrqeUvATVNbhhQPfvRl6JuCPN1PLlcn998amB6+T80GotVj2AZ2bM8OJj0P+JSa
	iaCHjPOotoNwc2KrbEdKmnVEUU7stAgW1R8yXdvGGa/x7ANWI1LYiX11jDB6Z2HRaKl7S55AyF6
	u/AFP9d39b+sWQXRxGkNJ1wDm8s5GbPYxMBF9deOXu1d9BOeE1CF+acGodBOLzGYdKDyL5qnwiI
	/yKxgrUGdpWRSO01Qm7ReDPxkpzHAI7lLfuvYAfikcn6Fl01Q+4Hzgg7F08NufAHj2ZcTNhM7AT
	o/4rdcrVMhxah/VuEmRkw8bqi+Btr1EWR8E2MsDzVVCoZ1us2jaJTWHlSfDwPfeyT4R1CEZklNe
	4hOSTYLoNw8FCc=
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr7099437a91.4.1788519412234;
        Fri, 04 Sep 2026 03:56:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6233396eec.20.2026.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Brian Cain <bcain@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org
Subject: [PATCH] hexagon: fix typos in comments
Date: Fri,  4 Sep 2026 16:26:46 +0530
Message-ID: <20260904105647.38515-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/hexagon/include/asm/hexagon_vm.h | 2 +-
 arch/hexagon/lib/memcpy.S             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/hexagon/include/asm/hexagon_vm.h b/arch/hexagon/include/asm/hexagon_vm.h
index 9aa2493fe786..1a65dc6213b7 100644
--- a/arch/hexagon/include/asm/hexagon_vm.h
+++ b/arch/hexagon/include/asm/hexagon_vm.h
@@ -239,7 +239,7 @@ static inline long __vmintop_clear(long i)
 #define HVM_EV_GENEX		2
 #define HVM_EV_TRAP		8
 #define HVM_EV_INTR		15
-/* These shoud be nuked as soon as we know the VM is up to spec v0.1.1 */
+/* These should be nuked as soon as we know the VM is up to spec v0.1.1 */
 #define HVM_EV_INTR_0		16
 #define HVM_MAX_INTR		240
 
diff --git a/arch/hexagon/lib/memcpy.S b/arch/hexagon/lib/memcpy.S
index f8b3c02a8ad1..ae360be68b0d 100644
--- a/arch/hexagon/lib/memcpy.S
+++ b/arch/hexagon/lib/memcpy.S
@@ -291,7 +291,7 @@ memcpy:
 	if(noprolog) jump .Lnoprolog32;
 	align = offset;
 }
-/*  upto initial 7 bytes  */
+/*  up to initial 7 bytes  */
 {
 	ldata0 = valignb(dataF8, data70, align);
 	ifbyte = tstbit(shift,#3);
@@ -525,5 +525,5 @@ memcpy:
 	r25:24 = memd(sp+#8);	/*  restore r24+r25  */
 	r17:16 = memd(sp+#0);	/*  restore r16+r17  */
 }
-	deallocframe;	/*  restore r31 and incrment stack by 16  */
+	deallocframe;	/*  restore r31 and increment stack by 16  */
 	jumpr r31
-- 
2.48.1

