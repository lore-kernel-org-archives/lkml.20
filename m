Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828D3DBD49;
	Tue,  8 Sep 2026 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900722; cv=none; b=L5NLaW+JlqHhzBhI8ONVsAJ3S/M0AjA08bxQpfBJ9dm+tWgE87qV6KAmK4VFYusbOjbTSp2ju5HESR7Y6YE+RYQtbI1ptCxhOTRKWZLqgqrSA8cZiDzl6lR/wV9qogXZYaENiWaPx1zsQDehu1UPwv4FPIneFPYWnDe0QpxLXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900722; c=relaxed/simple;
	bh=HnZxz8ItsTcbeCHP8T8WWiokGzwy7Ty6a9gKiLJss7Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TiGpljNJvEuuC9PQvapA3UgrBn1MaC/RLkrEOVKF3KRFYxxrDXezMb6u08KwAuaGg92G6qEQ+Ht1QHO0DiU9MpEs4hBw12ZYtZT2D8we2Et2DdgnrAjkszdehUDlBng3bQCMzrRAC2ODx3pf2jg2RigyQsnpHbU6oo9bWA1yLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wtuWbaw9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KgSCOUCp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wtuWbaw9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KgSCOUCp"
Date: Tue, 08 Sep 2026 20:51:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8jrv8vhSYJEGl6Tn2mm+NGqyKTB54JU9d56qwFFhUI=;
	b=wtuWbaw9e5aa2wB9WYY/aDDs+ezLfh6S8akVKZmGkQWHuGsVWtVSj+H4NejJwcabGA9sly
	wJQ0qHnYWn3qTtaqZUpEGajDr3C1eMP9SRcfbqqqGrKSVeVi1sRC0YB3XVgMrRudg0Kz4c
	RM5W93cgRk8+cE86sbDGdJc2dY6OOiziYKzyCnRioA5ODxsEm+CK4xO9X1Zk2hrIUrhzin
	PzAhyiBdiRF1csRPdCt1BnJEStteJHMj0/h+wxdl9qDLtOxFkW7aSt0dWMblUcuTTFfIqD
	Ew5/2bPfxpOrxjZtwN5yXWpK1GrS+5R5NH4wRkJzofbFDH9SzAog1LqsOV4UxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8jrv8vhSYJEGl6Tn2mm+NGqyKTB54JU9d56qwFFhUI=;
	b=KgSCOUCpdfxxEiyxGlviQGYYZ0PxdGpwWETDjdY9KGhhKG5ebdTrR38sHyKW4PsGOpDkig
	9FkZ2UUBub4VBRAg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: Enable large PEBS sampling for XMMs
Cc: Xudong Hao <xudong.hao@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-3-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-3-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071816.623050.17378280487409626572.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     62e074f55f4162e1898e7c1807f1501226a9c393
Gitweb:        https://git.kernel.org/tip/62e074f55f4162e1898e7c1807f1501226a=
9c393
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:10 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:40 +02:00

perf/x86/intel: Enable large PEBS sampling for XMMs

Modern PEBS hardware supports directly sampling XMM registers, then
large PEBS can be enabled for XMM registers just like other GPRs.

Reported-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-3-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/intel/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index cc13164..e412e28 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4699,7 +4699,8 @@ static unsigned long intel_pmu_large_pebs_flags(struct =
perf_event *event)
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
 	if (event->attr.sample_regs_user & ~PEBS_GP_REGS)
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_intr & ~PEBS_GP_REGS)
+	if (event->attr.sample_regs_intr &
+	    ~(PEBS_GP_REGS | PERF_REG_EXTENDED_MASK))
 		flags &=3D ~PERF_SAMPLE_REGS_INTR;
 	return flags;
 }
