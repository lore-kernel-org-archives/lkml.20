Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D9413794;
	Fri, 25 Sep 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333319; cv=none; b=anjj7/KUwYsOeCHUQHglZA4K4/unOy0W1lx41ivFnP93O8WPaCyPMTdDdPqfAuJ2K/upI+OpUaX5l80XgNdxWSpY1DDy1kT7UFp1Ssl8A1vfMZLz18AbAMWF5Uqik1QixmoRWaS2dalWdV7DKIwUTskUxcnQkaNdcb2DmWVlS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333319; c=relaxed/simple;
	bh=4KTeLDIdyuWU+sR8EuIkqVqcynyL4bTbqIErsDpPp2E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AsoEk8atDQ6fMBrBRtDAVmBIZNoT4KaHkKvwDolXN8AuJzEaTnUTnL6s1w8pQe41qQC5dzDpgDkNOZ7aCyfIpxqTy6z9NZT7dhRnOgh81T92IPAQQ+8nrN1lUwa8u0JeBgvzq7D2GUa7lbdrogdchsNvvvu4FS0Dg/ZV6Yg/E0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rxJbAINQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RfqRWQFy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rxJbAINQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RfqRWQFy"
Date: Fri, 25 Sep 2026 10:48:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333308;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LoPQSMlNXtbEtgy68dbKdyoq6RINdeDrfKAbMRlT9A=;
	b=rxJbAINQ4yQ2qqY3CXAaOoGt8mv2Qr2quZbW0wc0so3ONtI0BbSzspiLYRF2osHlSPJdS5
	5XS8MkvdWYNQxuXFnQ9hpvBmp6ABhay3xeOE96NFkRDZ+yMDO4PLtTHuFTqvDSfVU74RJh
	kvE6q+b4Iw+Ri7cZz82nOFonu/l0QvXNBrxgdUUCf76Itrq5b7FzCGiv8vA3WygRPSv3oB
	6+xD+dNOHmYQwaw5fTnCTaSk2qf2aSKuDhKF0AYnYVGTo4YX9/T+lqzx0sW9hJ1rWC3zFN
	gtzJfktpKM9VUTC1I8mFXHrq63TXDWx3SFfN1Jh6viGU+LCvxCK2tz1YehnLGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333308;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LoPQSMlNXtbEtgy68dbKdyoq6RINdeDrfKAbMRlT9A=;
	b=RfqRWQFyY3Nq2HN3WEjgTgzdfg+iTREVuSBRyz1cmIN3VSTnqIKcWCMdN6rE/MAV2Ok2+v
	7mhzH45MAZPG0zAw==
From: "tip-bot2 for Thorsten Blum" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: Annotate x86_pmu::hybrid_pmu with
 __counted_by_ptr
Cc: Thorsten Blum <blum@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ian Rogers <irogers@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260904141659.224248-2-blum@kernel.org>
References: <20260904141659.224248-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330700.2819794.14852847096555968499.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     52a6457f59adf70d624ef1b1bed8d55cb7b73af6
Gitweb:        https://git.kernel.org/tip/52a6457f59adf70d624ef1b1bed8d55cb7b=
73af6
Author:        Thorsten Blum <blum@kernel.org>
AuthorDate:    Fri, 04 Sep 2026 16:17:00 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:52 +02:00

perf/x86/intel: Annotate x86_pmu::hybrid_pmu with __counted_by_ptr

Add __counted_by_ptr() to x86_pmu::hybrid_pmu to improve access bounds
checking via CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.

Signed-off-by: Thorsten Blum <blum@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260904141659.224248-2-blum@kernel.org
---
 arch/x86/events/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 6eb1bf4..5deca1a 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1245,7 +1245,7 @@ struct x86_pmu {
 	 * unique capabilities.
 	 */
 	int				num_hybrid_pmus;
-	struct x86_hybrid_pmu		*hybrid_pmu;
+	struct x86_hybrid_pmu		*hybrid_pmu __counted_by_ptr(num_hybrid_pmus);
 	enum intel_cpu_type (*get_hybrid_cpu_type)	(void);
 };
=20
