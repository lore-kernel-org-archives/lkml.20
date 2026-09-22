Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296314E36D2;
	Tue, 22 Sep 2026 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070394; cv=none; b=Hr5yVWve2s7CJnHjR67v8lsu8HOc6Xr2kOY1n4Tf8cWpNIdP2eKyoK0ABOsQMFnyCvy20H1c6sBjREg2ymCAiFoLfARVhMGhYRKkExe34llG23JQ6O2VRkBT+PZSAn8MizsVkewd7Xv2BU1ENP6JA1qJ/6dpI+m12GFmfOBgMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070394; c=relaxed/simple;
	bh=4JvZRT2h7mHnsU5ZxKXa/kolHyw3TrvunrEY4wKQUyo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mX5CH/IhlX5VQBF06iSHJDeY21zAlAGaHyv9y4lBP/COVDL0d9DQ5Y5u2wcmKWsITpLcBop69+T8duIOnN4XaZvdi+htx2ESXWnkt4Wg9nXedVdB7N9fLqG5mw9zfBHHslcpUaf7KuM6CmgSH3oipcOLLlWp5KQBwmT30BlMjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KxUk9O68; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qr1TA6iQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KxUk9O68";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qr1TA6iQ"
Date: Tue, 22 Sep 2026 09:46:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XptQHOLnMbFQXtfhTj0HK5Upp4kO+IxPy4MXnrS4gu8=;
	b=KxUk9O68PC3E6LS/Ri0pqyYGo1klNglhuSND/1Lt9lVLiJf4RqvX2MrW/lwC6IpSKnbkIV
	dGbXhlV4zhuMauwhzFfPq/Gp7btI+BjVsYQlOU/jAv9zhFY2dcjydIwmQJP5xFRRlJTOe0
	jHminmDPlZT9My2rAc5YeXSPoNoMKgxWgxWEO/4FJ+9+myua62miarQlSb0zOTsWh19wdS
	LDX+2u0thb6jQJHceMYjhHbIfne7rgF8Jb7NTVUeuTh0ghYohWUNZtHzpEmxevKzsUzBsz
	i7Wt0SIIzAbaIiHzorRlKMj+9zf81R8Jnm/dvGhjCPTn8UfuoTrW01Ne3G1yVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XptQHOLnMbFQXtfhTj0HK5Upp4kO+IxPy4MXnrS4gu8=;
	b=Qr1TA6iQuInpLN04qkIDSt7F2L+yI18H2nrT2QHIQKy420mNqA8CQMSTucyz5YO17AhbcO
	4rhNqPebZ4oBh8Cw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/x86/intel: Delete dead NVL PEBS data-source initcall
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015234.981153-9-dapeng1.mi@linux.intel.com>
References: <20260917015234.981153-9-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007038811.2819794.11712046174542758246.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     858b37ca19d3f695f7fa94cd14be5a856fd8e7d7
Gitweb:        https://git.kernel.org/tip/858b37ca19d3f695f7fa94cd14be5a856fd=
8e7d7
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 17 Sep 2026 09:52:30 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:33:49 +02:00

perf/x86/intel: Delete dead NVL PEBS data-source initcall

Nova Lake now uses the OMR data-source table for PEBS data-source
decoding and no longer depends on the legacy static pebs_data_source[]
mapping.

Remove the dead intel_pmu_pebs_data_source_lnl() initialization call
for NVL.

Fixes: c847a208f43b ("perf/x86/intel: Add core PMU support for Novalake")
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260917015234.981153-9-dapeng1.mi@linux.intel=
.com
---
 arch/x86/events/intel/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 757d408..a7dbbed 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -8824,8 +8824,6 @@ __init int intel_pmu_init(void)
 		/* Initialize Atom core specific PerfMon capabilities.*/
 		pmu =3D &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_ATOM_IDX];
 		intel_pmu_init_arw(&pmu->pmu);
-
-		intel_pmu_pebs_data_source_lnl();
 		break;
=20
 	default:
