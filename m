Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59448B37D;
	Tue, 22 Sep 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070390; cv=none; b=BHUWIYxNj2a0pFULIcs1s4yr9ADo0IXEFnKB0Na2gei5bWQuF49GDGYMUPqbp6TYyTuNdLGGYfiT5XxaIuO7/UrYLaHlGGmUHBkXbtwg3CdK6Xjiq+L7t3xWTch3lxwlDZ1ABC2ePGXK54iKurl6qFwL7AaNxt9y1GgYUGgeJsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070390; c=relaxed/simple;
	bh=enPidEfjLt9ON08VnhdMzs17yLh/ks21wB+oJ+I4Rdg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=gX4cZR+YfrL76om4SYON5XnubdzoRpZkbNmL64RBCzozlhdL2gbDJFbUCJzeENgZvKktPQDYNyUVh6i0z2ypbnevrJr7px94qWlUGwDYyZBP5GniQbLay3qmQXGSCAIZLCD87nCNOBSwm81bVnB9T3GDIbswscsB1tqiIoG0NhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yj4L47wK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L6+v1IoR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yj4L47wK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L6+v1IoR"
Date: Tue, 22 Sep 2026 09:46:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070386;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7d49qibD//hXW2HF2gcaFXRhZIxodNh7ZjOqAMBMhM=;
	b=yj4L47wKhnwWk13b/Diz7OYRvJQSBjnWULifYIx8v6fGRkxXVZxuoXJSbdofLR6scTcVz+
	LNPuWQlmbwHwcescB07Km5UVcKXVqCF/xv/pAOebVCRv+Vc84BBluaevvceOR6C9tNjQ/U
	nPUgqX+51lls498fOd2aUdUuJroU6UA+mb+mHIteKaVH6d7raCW+bLDcHEnLnHyZJagpWT
	9WzPQ4OF6wz6aMasvdlmxGMSikPy1rV0Ic/uSeYMe0UoFmnVjc73WutgeIXAgNXe+XpoMp
	zte9A8mP6tV0emjmC9b3RKet9SiYC+kLiLRXIKOJPMWNOAPfSHmfisuYxtgOug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070386;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7d49qibD//hXW2HF2gcaFXRhZIxodNh7ZjOqAMBMhM=;
	b=L6+v1IoRfrdh5gIyOy68qyQMxbRcRZ/KAgDxaw766VjDpe0B9PRdrRwnnJB29CWJJJO5kF
	HO15IWdsEh3IeTBQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Fix precise OMR event scheduling
 for DMR/NVL
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015234.981153-11-dapeng1.mi@linux.intel.com>
References: <20260917015234.981153-11-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007038495.2819794.7878906313438958797.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     ff1621adfdd7cfb73f2ccdd3856cd3462ac98ac5
Gitweb:        https://git.kernel.org/tip/ff1621adfdd7cfb73f2ccdd3856cd3462ac=
98ac5
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 17 Sep 2026 09:52:32 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:37:00 +02:00

perf/x86/intel: Fix precise OMR event scheduling for DMR/NVL

The latest perfmon event database introduces below precise OMR event
support for DMR/NVL:

- MEM_LOAD_L2_MISS_RETIRED.* (event 0xd6)
- MEM_STORE_L2_MISS_RETIRED.* (event 0x4f)

These events use the same OMR MSRs as the existing OMR events, but
they are not listed in intel_pnc_extra_regs[]. As a result, perf
cannot assign the required OMR extra registers when scheduling them.

Add the new precise OMR events to intel_pnc_extra_regs[] so they can
be scheduled with the correct OMR MSRs. MEM_LOAD_L2_MISS_RETIRED.*
remains limited to GP counters 0-3, while
MEM_STORE_L2_MISS_RETIRED.* is available on all GP counters.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260917015234.981153-11-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/intel/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index ecf6d63..2271560 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -522,6 +522,14 @@ static struct extra_reg intel_pnc_extra_regs[] __read_mo=
stly =3D {
 	INTEL_UEVENT_EXTRA_REG(0x022a, MSR_OMR_1, 0x40ffffff0000ffffull, OMR_1),
 	INTEL_UEVENT_EXTRA_REG(0x042a, MSR_OMR_2, 0x40ffffff0000ffffull, OMR_2),
 	INTEL_UEVENT_EXTRA_REG(0x082a, MSR_OMR_3, 0x40ffffff0000ffffull, OMR_3),
+	INTEL_UEVENT_EXTRA_REG(0x014f, MSR_OMR_0, 0x40ffffff0000ffffull, OMR_0),
+	INTEL_UEVENT_EXTRA_REG(0x024f, MSR_OMR_1, 0x40ffffff0000ffffull, OMR_1),
+	INTEL_UEVENT_EXTRA_REG(0x044f, MSR_OMR_2, 0x40ffffff0000ffffull, OMR_2),
+	INTEL_UEVENT_EXTRA_REG(0x084f, MSR_OMR_3, 0x40ffffff0000ffffull, OMR_3),
+	INTEL_UEVENT_EXTRA_REG(0x01d6, MSR_OMR_0, 0x40ffffff0000ffffull, OMR_0),
+	INTEL_UEVENT_EXTRA_REG(0x02d6, MSR_OMR_1, 0x40ffffff0000ffffull, OMR_1),
+	INTEL_UEVENT_EXTRA_REG(0x04d6, MSR_OMR_2, 0x40ffffff0000ffffull, OMR_2),
+	INTEL_UEVENT_EXTRA_REG(0x08d6, MSR_OMR_3, 0x40ffffff0000ffffull, OMR_3),
 	INTEL_UEVENT_PEBS_LDLAT_EXTRA_REG(0x01cd),
 	INTEL_UEVENT_EXTRA_REG(0x02c6, MSR_PEBS_FRONTEND, 0x9, FE),
 	INTEL_UEVENT_EXTRA_REG(0x03c6, MSR_PEBS_FRONTEND, 0x7fff1f, FE),
