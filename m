Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE5488237
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524473; cv=none; b=QDbNX3OsypT7SqAq9GSZOx+squRPXJYPKWBJsh3KtXnJSIdTUpTnfDRoPFvxh2NbXN9329mT1oaZkj+p8yYIJZF5DmXQTEdcdbcloLDyxdjvMLEkdmht/kOCWWLEvzzHBceGP/cNH719xaBTlbURqkO1bmHwLqVaJUsLQFvUfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524473; c=relaxed/simple;
	bh=E0rFo7Q5ZDwXJBtKF10AfNsw+8XsTnWPZE1MipbUrw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qU3rNZfHmYrZRx13qnusXz4gj4YjnNt925yPfJoXGfDtAq4kyEb+sozLoXUNkrnGbMpBWcm/42tvne9InGG18jtITPbVkmTHPB6+JoeiqnWvCNcG9LBDEb9DeeP40CVg9incz0V+mNI4X0/3xZjHO3YpTxU4M6BvkUMopXbOpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGP52vb0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGP52vb0"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso967963a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524470; x=1789129270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkiCyCvi2P+iZbARVukdTb/KqWgHgSHrWQF85+jAN58=;
        b=qGP52vb03vMInDYZvZs0X5IeiLQLsdLtf/wUCoOmvcVvZNP+Mi7f5ySeIH+Jh1Q/2A
         IQt5vkGd1Og9YNT5AZyzb4xcdGFM+G+KXjFcEQkN1iE8OPnMaX+C5fuo14b3zZqyCgsi
         oullEarQny2DRkuaY9rRTUPiejSHR6RzdgJJr5x0NyRcpD3akSQHQniBFsMS5bXNq7Nz
         a1dYxmPtntJE76liYQunl5LNJMBoqs9DxU6LO4+/5qpbrFS5Mr0XTwvAqQq5oRorVQ0Z
         Pdb/skH3eCs3+1J+Hz/jnEdpAJo+CD0Dwp7n+FAV9+yVM3T6XNiuBhmZ/hUZhUKtfutf
         o/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524470; x=1789129270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkiCyCvi2P+iZbARVukdTb/KqWgHgSHrWQF85+jAN58=;
        b=NX7Jo/W4Rk40q9x6ytnCN+sQcVojCfKPlW2jpIQCjHiRZD4axQS2fpNHiKkIxYKIqv
         CTTAu5Hl6WT3wZtimRwBtkZF+lePiyjAzJbHUX3zMAyzusYg4hEUGY+lbL+RpNCObhov
         vzq1vAR1WKstVckxpMdkU4Xb/5wv+ge4tzMP7VEW1gnfrEgNEmIZjpt16xWCZRZHCSyA
         jNboJxocoepVZ9OyvCocbjZnfxC4oYPbmhy5DLHVBObqS4y7k8CMwioH4STQUWqAsIfR
         7eXRVDDHUoFUErDBVuPhG+g/QbV0FUKTf1LGFhI2w7QR1ZjQ16YD/0Og4TycL5GKkxeV
         uacA==
X-Gm-Message-State: AFuF++llusAFTG1CoYfoWKFR3S/PuJAdQK4nTb+f9jO5sEUnhEBrI097
	7ARrXO2z20DRe1E1BYLeuyX//d4ezZOpXRsKxxbOsED/Drm7H1vjJm4n
X-Gm-Gg: AYBFou34uOHQ1yq3ZreJHzkgdEQTAku+XYfC0p+5nsH+TJwqOyhlGs+xADWPKdBLAxC
	ThKW4xQinpXf98M+xwufqHsncgHMrCwQrT8u2vKkmsOiWKQWSOLb2AGtnf0k+2PbO1O5Wwfq5y/
	l7QOSl5gEzoV+BOVaifBhorns3pYBw+PtUw8VF04acssxmS70/qCBVAzYAAR3PoO3iTm2FcqbwL
	BybnvLZ4It96OUiatd68bLpjWYQC3UZhBGXkkhl/1IM/mOx7Td3eBmWdozEHxD2fu2G3lcpsJVL
	kjQA9OjgpiA2QdZWb5Gn5C+GluiMrtsnPtTx2xCi+sJ9rVSyLzTdW0sNqoPNy6gsFlGDuit1sfw
	t5NOvbYHjGicG3ZKpxSRCJ8c7W/YysV9vRKZiAC+eP3EqilmNBg/XaIZHAGHNohXrB7OwRdo3Tb
	VLnhGRY1rSf15TpIo23+06RRiRKW+Du9c30ZCbRrxHb6aLNXCxlQ82Rb7I5KQtbhi4lnE1RXqYa
	4wVx2vuu1S7bFo=
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr16531593a91.19.1788524470541;
        Fri, 04 Sep 2026 05:21:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm7116019eec.21.2026.09.04.05.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 3/3] kernel: fix typo "overriden" in comment
Date: Fri,  4 Sep 2026 17:50:52 +0530
Message-ID: <20260904122054.28531-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122054.28531-1-hemanth.selam@gmail.com>
References: <20260904122054.28531-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "overriden" to "overridden", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..6d3340d34234 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3266,7 +3266,7 @@ int ksys_unshare(unsigned long unshare_flags)
 	if (unshare_flags & CLONE_NEWNS)
 		unshare_flags |= CLONE_FS;
 
-	/* No unsharing with overriden fs state */
+	/* No unsharing with overridden fs state */
 	VFS_WARN_ON_ONCE(unshare_flags & (CLONE_NEWNS | CLONE_FS) &&
 			 current->fs != current->real_fs);
 
-- 
2.48.1

