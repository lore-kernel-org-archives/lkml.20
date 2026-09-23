Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F0411F88;
	Wed, 23 Sep 2026 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157175; cv=none; b=mWaZzcnZt1IYeTHmI8SxZr6T6h0fdY2JPC0afaCw7TQnojZ5nMfwboB2M0BxTwZ9Ve0PfkPgsd5ivEi1uetmmqpQFrY3O3hJ3msPN5IDS7VJ9rsgceDkyj39dPietBCzYY+DsY9N9XnNtPxAV1mtMipn2YBLF2tEFdnujZdt/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157175; c=relaxed/simple;
	bh=Gz3rxScZ9WJDMeVVlJphlXJvv/LdPNefdEiKnQ58EbY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qRbF5MUZuzMOzgQefscNiXxk165/qBl0Z19XIX7vr4yTxJlXbNRWDp+4jBUK7VmRwsP2W2VzJ6v+bHxrFiZz9DGNEEBY9OmC6BQVfRFJMptCuTVZw6xynGoe74Fkqmg9trs0l/rt33vKH5J8Ig6kErkoQ6lbhaZdo5sNWKAB3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wdGPMIgz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HYVkdNUy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wdGPMIgz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HYVkdNUy"
Date: Wed, 23 Sep 2026 09:52:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790157170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X+Fp4zjRDNjdPqANr7W61Z6RCOV0ZXK9g414Cvjda0=;
	b=wdGPMIgzudRMm3qGMoT5xwt1aE/iIyY2KaFfXbIP3OLun/xCqOzZwRAqfph3A94eoYWhbC
	eVIvx966PoV82DmFDR4QMozZNWc4yyNes5slrvhnPHWDT+xjfsTGiHnqQ8pyz8u7x+EPXM
	0GOzRc4HPy9DccGmhR/ps8ZxRreWiIanB5OpGdiS8PTznFm7JcUdnx2CKNtrm3Dc685kQM
	qTDcgGBcxuj0ckBVrn1XuMGJ98N/nYZ26tbsNYayFGQyIbRwdKkHrjhevwOOgSKGlFgbTA
	+R9xywTGwkBj0XEWtfwaPule7PSU6BT37MAfdCP2gvv8y/wIBy8+/WwhSIEeZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790157170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X+Fp4zjRDNjdPqANr7W61Z6RCOV0ZXK9g414Cvjda0=;
	b=HYVkdNUyuLIAUk6HgMLaolVyTM1VR2F9qAJJJFiD80eBr3giF7XgGgZ3i9ROxW3D9rpHx9
	SI49rYE1XgyLgcAA==
From: "tip-bot2 for Namhyung Kim" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/core: Fix a refcount leak in attach_perf_ctx_data()
Cc: Namhyung Kim <namhyung@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260920231639.11910-1-namhyung@kernel.org>
References: <20260920231639.11910-1-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179015716845.2819794.8708578019641726395.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     cca4980630b3c7a85f53cb43c6018184ce5d4e37
Gitweb:        https://git.kernel.org/tip/cca4980630b3c7a85f53cb43c6018184ce5=
d4e37
Author:        Namhyung Kim <namhyung@kernel.org>
AuthorDate:    Sun, 20 Sep 2026 16:16:39 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 23 Sep 2026 11:48:35 +02:00

perf/core: Fix a refcount leak in attach_perf_ctx_data()

The attach_perf_ctx_data() can race on global and !global cases.  The
global case is protected by global_ctx_data_rwsem and shares a single
reference count using perf_ctx_data.global field.

But when it races with !global case, it may miss to set the global field
and result in a reference count leak.

 CPU1                                  CPU2
 ----------------------------------------------------------------
 attach_task_ctx_data(.global=3D1)       attach_task_ctx_data(.global=3D0)
   cd1 =3D alloc_perf_ctx_data();          cd2 =3D alloc_perf_ctx_data();
                                         //    { .global =3D 0, .refcount =3D=
 1 };

                                         try_cmpxchg(); // success,
                                         // task->perf_ctx_data =3D cd2
   try_cmpxhg(); // fail; old =3D cd2
   refcount_inc_not_zero(&old->refcount); // success
     // old.refcount =3D 2
   free_perf_ctx_data(cd1);

Then later detach_global_ctx_data() will see the data but it's not
marked as global, so it won't call detach_task_ctx_data().

Fixes: 506e64e710ff ("perf: attach/detach PMU specific data")
Assisted-by: Sashiko.dev:Gemini-3.1-pro
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260920231639.11910-1-namhyung@kernel.org
---
 kernel/events/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index db7b76d..e180134 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5454,6 +5454,8 @@ attach_task_ctx_data(struct task_struct *task, struct k=
mem_cache *ctx_cache,
 		}
=20
 		if (refcount_inc_not_zero(&old->refcount)) {
+			if (global)
+				old->global =3D true;
 			free_perf_ctx_data(cd); /* unused */
 			return 0;
 		}
