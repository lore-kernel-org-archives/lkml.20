Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182953DD526;
	Tue,  8 Sep 2026 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900724; cv=none; b=ozWYUP5gI6/+nmQLPlu2aZRAidgW47rixlrntiL2VlGrxkwWCIOXrUJBa3w4BeKuNQooXP8qpgeuUz1yunwYp+LSoRB0tm3/54a9duajC/ETqEw1e40Vwayg17tIeUCLh3aZnWb+17wBaMtE4Jf0pRix0eorlCFIo/mjWfIt/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900724; c=relaxed/simple;
	bh=Yup8mMlTsc2xt61JJMo3zUDjlmgGyAIJNZ8Ly69Kuoc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jk3m7bOfhm03FW3FYcrP5ScTiZrWJR4k2E3/3anOGpMnosufyBLawdq+FbbxLqj3ibvn5IHjZTDl0VuLivOPqG0KFKyDkjs73GTNoBgj0TD8qpGHyOsa+Yh6tWjUk+Jf4HTn3ky6kav02K4hG/yobsUHA3SfkEZorknfhnNkj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DuK00l+6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=60Gvuujw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DuK00l+6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="60Gvuujw"
Date: Tue, 08 Sep 2026 20:51:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900721;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO7bhT/qAH7I0pfrPEGoQB/pRCwAD4iGWycC8A7LXRw=;
	b=DuK00l+6mSGnrBBs5qTvLOz6xk2pvMMyLeGUlZh02Xajbq6oNDtpLlvqc59MILQ29V3ncz
	HCcTQX3addUgceFzYK4jr/8sM/EEg6/certdHWj8QPSjiTUQQm/liOVrtty4r5Bk7+h8Ex
	UB+BcUVU8EpCD+rp77PFSha7VrI2AMR9O78EB/OMZZHDuaj4igFsr210D6oM6qa4TlSr9T
	zHOt9eBOhSsnoQcZoDxJWtEoDT5AxaQgRQ8ufDAZbRmFh+BC4YDsLaAehI7o23mRmQyi8h
	L6LkaHYKXcm/B+TuJ5E94d2KQG5K0G/w+8GhvTYwnF/53ofM/wsXbc3QAwtadg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900721;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO7bhT/qAH7I0pfrPEGoQB/pRCwAD4iGWycC8A7LXRw=;
	b=60GvuujwLFZseQBUTHj0OaI6e8u48h6DJg4ZMImwx4wz6nQGPOFTGtlv3e5d+GzpFzof7y
	zzBBt1q/EY+fqEBQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Move hybrid PMU initialization before
 x86_pmu_starting_cpu()
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-2-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-2-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071957.623050.17967989406448990455.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     9106892e27cad34c87ab1c5631d9c101237bbee1
Gitweb:        https://git.kernel.org/tip/9106892e27cad34c87ab1c5631d9c101237=
bbee1
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:09 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:39 +02:00

perf/x86: Move hybrid PMU initialization before x86_pmu_starting_cpu()

The current approach initializes hybrid PMU structures immediately before
registering them. This is risky as it can lead to key fields, such as
'capabilities', being inadvertently overwritten.

Although no issues have arisen so far, this method is not ideal. It makes
the PMU structure fields susceptible to being overwritten, especially with
future changes that might initialize fields like 'capabilities' within
init_hybrid_pmu() called by x86_pmu_starting_cpu().

To mitigate this potential problem, move the default hybrid structure
initialization before calling x86_pmu_starting_cpu().

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-2-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 8b3ea0a..75358a2 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2218,8 +2218,20 @@ static int __init init_hw_perf_events(void)
=20
 	pmu.attr_update =3D x86_pmu.attr_update;
=20
-	if (!is_hybrid())
+	if (!is_hybrid()) {
 		x86_pmu_show_pmu_cap(NULL);
+	} else {
+		int i;
+
+		/*
+		 * Init default ops.
+		 * Must be called before registering x86_pmu_starting_cpu(),
+		 * otherwise some key PMU fields, e.g., capabilities
+		 * initialized in x86_pmu_starting_cpu(), would be overwritten.
+		 */
+		for (i =3D 0; i < x86_pmu.num_hybrid_pmus; i++)
+			x86_pmu.hybrid_pmu[i].pmu =3D pmu;
+	}
=20
 	if (!x86_pmu.read)
 		x86_pmu.read =3D _x86_pmu_read;
@@ -2266,7 +2278,6 @@ static int __init init_hw_perf_events(void)
 		for (i =3D 0; i < x86_pmu.num_hybrid_pmus; i++) {
 			hybrid_pmu =3D &x86_pmu.hybrid_pmu[i];
=20
-			hybrid_pmu->pmu =3D pmu;
 			hybrid_pmu->pmu.type =3D -1;
 			hybrid_pmu->pmu.attr_update =3D x86_pmu.attr_update;
 			hybrid_pmu->pmu.capabilities |=3D PERF_PMU_CAP_EXTENDED_HW_TYPE;
