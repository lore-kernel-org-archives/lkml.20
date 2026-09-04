Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C509F371876
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556952; cv=none; b=WNmQAM920w0npBE5dLV95mQPygUlIxPNVboyGEZQz4muYU+v6dBq8DPGAl2g+f8jBWYhV1u6flnHyxNu3U5VAWUs6WYqrJhZ5dIKdQ5L49VoBFYqpMCPOHfqwSpsIAWL0EEAtcbdmdfU1J+Jg84vn3iiiCEwui189v6ZDeMZOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556952; c=relaxed/simple;
	bh=sAxci377fn8+FnyuNLAMrG/6nTy5cwTzjBUe0YrHgbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k1cq0C8TkLB5yT4CCC8KZXRg8z/BtV/oKO9iThU2rdtCzTh113LXKeePbZWPggSxbEOEEZ09k8VFUkR/3EeqVp/zqCIX46Yg7RbW5U5pk6hB0kCDv+qc8K4/3gqCgXfAZ/9R5XNJ3atETtShpnA/x2zLwITZJuyIDsOZqXrwdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA3ujme3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA3ujme3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1466569a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788556950; x=1789161750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDZS/yUUq6qUoww9Sgh++cO+lJPE83G9J2KfDK5Wa1w=;
        b=UA3ujme3JkDKYZCyllqcSLDJIV8YV8hes/pRUDbBGHf3PkfFZE2ezXXpzOp4E+ERw8
         6H6aRJBBeprBil7/pgqZ1+w1B+GCLOxDzJqp0gbEel27HXUQOvyAkm0PctWVsjQK7ZzU
         Hw3E462g9tSWoQ61SZ0/28ohkEshTzsqLxHCgqnp3Oh86+HVeeaR7Choad1g02TaBVps
         1AO7J4KuYUpchZ3S7V8iCtnREym3ytqqeUK80FZFyTFDF4nmSIJnm0ubWsBMc4uSjqos
         PXVixrbJP9HUeS9okVUjycGPSQlon7LrBt9o5aXYGDpUElF2LILVZPbpeVrghdVsbvPS
         h1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556950; x=1789161750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDZS/yUUq6qUoww9Sgh++cO+lJPE83G9J2KfDK5Wa1w=;
        b=LpSM9M6oO16bNLAIe/ehlT1sSfH9Y4vyXQXSjfEFyDFU19in36IzYk2QolU9pS7Li7
         BFPQeXlyZCMogPwyUUROGOeoeIZod4kC0NK8A8Wcoxw3ti9ISuz/TlajPkyqZsQhVzg+
         2v38qsuwdls+bf1TY1ImEOOrxueKKzATBjkjiVLoOD3K8b0DuB/U/mLkVygD8sZxfyIQ
         I65twkTj9ccP5qvCqLkNUXpMYQXdd+UfodX/nNT1A34OKonk4BPiRzMey1gS4Mm8R47n
         Mhm9sU+0TudTDtk8ELvUffdAAe99OU42MZCDBmAYRVHkOQbKjcosjp1WPhn78CwmBxLc
         cZyA==
X-Forwarded-Encrypted: i=1; AKwUvBwuLxFJps0F5vfu6j2hst7rbzb8E4uah0KOdaPUWO1VVq6dC1DObPVx7d6K9GHSreM8B/hoQT2THhlRBpw=@vger.kernel.org
X-Gm-Message-State: AFuF++k22nOv+KzcK7grtlNzhkrr3e4hnLVwFfW2Rvddi5lKYpErMa3K
	wCTHdCdOVdiB52u3PRTdk2dKLNs4CyTRB2E040svLSzzfOhAEH/24esh1c38yw==
X-Gm-Gg: AYBFou2/QReJDv22UkEtcPxsrrHoYVYz/n2famz1BL3CYJb9WoVJ7ItNs9IJ4dOXOKE
	zAEsWuwqL21MgESdF4YIV8HkVYe1DBvXtCIcoAvxB7FSmxNuejt4tkq0vEc7aIRwJ0NtQFvQ4MB
	DWnOpZfOyLcpcN4fDa81XARYeAPS0jn9sXOYq3V6pTV0RpxX2mk0bRr8a0Opt/4/9LSMZ/AhdSh
	kYbuAtSBQK7rtTyYsEKTECO4yFd+rBWa/nWjIIgy+snLC/Hnq5tv7iQo8unaTCXdNsrPHM6c1cL
	TER4w5bwGwcGwDhdKr5ytCpWxm1FVJLccpI8nropfVhbXVhssuJwqMjiRhqbqhNAV0ezFXcSlEG
	wTeqCUCJnPSu8IyyXEWkTfb3TjOxMJ3K1tfFYqYt9tY5PlytkHfyQMEHoISJTr7l2Vj0ilWvmaY
	w2Umgt+WVxiH96cFZIK8tU6pZmeLCHaX0WISUy+IlZMHtcbdmW3qA8DXzh4lN1b2ijminv3wGsq
	RIrW8MIRqx5HY8MmLm6dW2sr7ANzXckx0IfEzPeeJsBN1vF0p1SwoRvr1eFg8JEBKQ15HiiE8k2
	OFlQZ2peoENcaCLg7aEtUaAdgzXryf3JbakuyW7+/rOwiP/kbg==
X-Received: by 2002:a17:90b:224c:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-39b2624cf31mr11476690a91.22.1788556949925;
        Fri, 04 Sep 2026 14:22:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542dbbesm1315056a12.13.2026.09.04.14.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:22:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] ath9k: delete channel-context timers on deinit
Date: Fri,  4 Sep 2026 14:22:25 -0700
Message-ID: <20260904212225.84813-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath9k_deinit_channel_context() cancels chanctx_work but does not delete
the offchannel and sched timers set up by ath9k_init_channel_context().
If either timer fires after deinit (e.g. during driver unload or
suspend), it accesses sc->sc_ah which may already be freed by
ath9k_hw_deinit(), causing a use-after-free.

Delete both timers with timer_delete_sync() before cancelling the work
item.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/channel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/ath/ath9k/channel.c
index 8b27d8cc086a..92241c24a0a4 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -1363,6 +1363,8 @@ void ath9k_init_channel_context(struct ath_softc *sc)
 
 void ath9k_deinit_channel_context(struct ath_softc *sc)
 {
+	timer_delete_sync(&sc->sched.timer);
+	timer_delete_sync(&sc->offchannel.timer);
 	cancel_work_sync(&sc->chanctx_work);
 }
 
-- 
2.55.0

