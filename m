Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6E3290B1;
	Sat, 26 Sep 2026 01:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385166; cv=none; b=jaj8XoMwbDAHYn7t3V1vcyIbCHuUii2MFVUSUoVrh3LtrUNOZlB0AihzArbjn/hOL2VfOpHGldQ/Z58F3iBqk3ok2TGOmQrY1Ia+3b93Tumgwm4nEuEX1kbXQOECqe3qZUjGvL2Uiu/5bpcsi+4qxP0OjZg7AJ9I3kNjQxN2tYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385166; c=relaxed/simple;
	bh=7p3uDztJ/B5QAma4VKjN6bpfAE3zbkXdNgiiRzyJMSw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Es6q82VUVuhVRPvb4KAjTv7eecFo/HHDIPsbPA6Xv4R/e35FKAbjBUTwFzVNBg76YQa9+dyAGUAi8WcZBCA6EY3eTHC6QHy+fPgOzwYJAsGAAw0hONofwTSx8JL5yMKLKr299aSaOrV9r9i75R34GTJnbkUMlcuqGnrlhk383AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MqApPiXK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0SuMxgGi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MqApPiXK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0SuMxgGi"
Date: Sat, 26 Sep 2026 01:12:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pK5aW1cH8KXqtkWkwUAGknfA4MowV68wdAAql0cCfQE=;
	b=MqApPiXKyEfBdUWgx0hCSDJr1hJJNBupW36W8UoA6N554Gvu3ECHqoXPjoIhe4nCHZTnml
	wamFbVh0+YkY1JUtrYyoebD0Wh+ssvXJ54TMURdmcoQkX4y+xA7ez8w14xMbOb/dCeRqUW
	3ApvC2mUkCUEj10nckgBsHgju1PCXpwhon1sDf0rGCF/XjBvfWnfHU6KScsOTU3g7WpG3d
	xJUTZKF16WBZw6QID/Fyi/gYZkxa391DLWLl+HyidPJYxsDedVVd3r3XKvQY1k+ko/Yr/S
	bp3330pgEG03j+b30Dy6wHmpKqkAcK/h9VOj9AlNdlR2dgIAPuhjMef9QvAVYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pK5aW1cH8KXqtkWkwUAGknfA4MowV68wdAAql0cCfQE=;
	b=0SuMxgGim08FRZl6Ot+8FuZ3vA1IT1GQ1ZVzjAOZVx8LN7Ju7YN1Og6A+X/eTMD5lWAW8F
	Y5TBj7RdDfZdu/BQ==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Document reasoning of FX-only fallback
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-5-avagin@google.com>
References: <20260925162454.1403405-5-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038516205.3910103.3146108742439747002.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     731300df4f7d7d7153a2aa23b6c4992df3d2a60b
Gitweb:        https://git.kernel.org/tip/731300df4f7d7d7153a2aa23b6c4992df3d=
2a60b
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:50=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:21:14 -07:00

x86/fpu: Document reasoning of FX-only fallback

Add a comment to check_xstate_in_sigframe() to explain the reasoning behind
falling back to the FX-only state when signal frame metadata is
inconsistent.

The fallback is intended to preserve backward compatibility with legacy
user-space processes that are not aware of XSAVE states and might only
fill or copy the legacy FP state.

However, this fallback should be avoided whenever possible. If a process
was actively using extended features, falling back to the FX-only state
silently resets those extended registers to their initial state, which
can lead to silent user-space state corruption.

Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://patch.msgid.link/20260925162454.1403405-5-avagin@google.com
---
 arch/x86/kernel/fpu/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index b9dcd0c..d56819f 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -54,6 +54,14 @@ static inline bool check_xstate_in_sigframe(struct fxregs_=
state __user *buf_fx,
 	if (likely(magic2 =3D=3D FP_XSTATE_MAGIC2))
 		return true;
 err_setfx:
+	/*
+	 * The fallback to FX-only state is used to preserve backward
+	 * compatibility with user-space processes that are not aware of xsave
+	 * states.
+	 *
+	 * In all other cases, returning false (to trigger SIGSEGV) is
+	 * preferred to avoid silent user-space state corruption.
+	 */
 	trace_x86_fpu_xstate_check_failed(x86_task_fpu(current));
=20
 	/* Set the parameters for fx only state */
