Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188866;
	b=qmw85513bTx8py3ct3dJy9Wez/qb9KsChFffEOZeY9XK40ivZHh1CQNK2e6FEeV+saYO
	 ZQ5yAX105qTtFNioXfajfOVKjjtzafe7R4Rfs2tm4Jfhx3IYwP9U01SyWj9sC9a//nLHb
	 /4Q756DhQpBIdMCZl93ow5G+bC0YT4w4QBbXeIpRBeLmWStvkM2RZFh95DGEmS1R2wKnF
	 R1oysbWWlF7sIBlinun4a02/eHSOB+UQIb5NRdSSQOLW8WaSNgB7xFI3kOprUG/r6MLR8
	 S+iwJMfjY8eu3BBL+SQDJJMDg8kizhN9c3g2/DWNIS/7KlEXSVUehOGq7HOIujOIa2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188866;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UF8/PcdXGDq0AIjk8iqXFNbnAyEDR8M0kB8dn6KRodE=;
	b=h0L4jigIyfnrtqt3oY2ZGntq/Tcj4eRRZTZ+JHBmQbrpYgEo6PgVhNhiAEOctcTTpqJL
	 8fnPniFfeii1Gk8NfT4jtJmRLodE24f56tim6IVio0PnCHRCZy1GxUiBSBi6rGlx/DZKc
	 z8Tq1O9OYSA57bgbZFbvh/4N0ct0TY00VCM1IhitdRBtM5UPYiK/6CiotReUIfOMNyIUM
	 sbSYVF5QlKsYuu2CnriIK4WlpM6rSMUGjwFZWH/12DStk1nRhhCwXE2zTuNHyA1zgb5ZJ
	 S+cjNdBYyQqS44naFWWB+HzChfr8QSF2Fm1xw0PxSWijqQQMRLgEonf1HO8bWExT3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Unhx+WO0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E0606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Unhx+WO0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684081F031E1;
	Wed, 28 Oct 2026 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188865;
	bh=UF8/PcdXGDq0AIjk8iqXFNbnAyEDR8M0kB8dn6KRodE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Unhx+WO0D2UlbtQD/OkS5ahg15A95+tnXTHzM7ff9T8zcLduLKl1shPxYtDnsz72G
	 GOswm/4ueBm8s3s5mQkUPf4X0Iaa0F34HC3Esplo3iJ+1FV60BiXUygA7EastBF6wD
	 CPfgu+QCCWT/3GEJKnBTmXbZ7zlrctjon/sySjSKqW1Qg9gxliDtzAc8frxcuH35Pf
	 Q+8pdeqQHPPmjxvZGFj3aRILt61Fo4bPOK8zn/ZXM8o5y63Zv3q9kwDLsgAzDdEjlZ
	 uilxkI8ETChfUBDZ1zeUm8iQ6wyMCpxJuWd2jE8s2KoJAbkg/QYk9DK/ZNlrhK7RoR
	 BLtyzBxylugdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 08/20] rseq: Always inline the empty rseq_note_user_irq_entry() stub
Date: Wed, 28 Oct 2026 07:59:32 -0400
Message-ID: <20261028120034.871983-9-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

rseq_note_user_irq_entry() is called from noinstr entry code. The
CONFIG_RSEQ version is __always_inline, but the !CONFIG_RSEQ stub is a
plain static inline function, which the compiler won't inline into
noinstr code when building with code coverage instrumentation.

Make the stub __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/rseq_entry.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 31ce349ed42ce..e31f9e625d03d 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -759,7 +759,7 @@ static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
 		__rseq_debug_syscall_return(regs);
 }
 #else /* CONFIG_RSEQ */
-static inline void rseq_note_user_irq_entry(void) { }
+static __always_inline void rseq_note_user_irq_entry(void) { }
 static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 {
 	return false;
-- 
2.53.0

