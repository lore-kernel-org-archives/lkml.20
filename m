Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD984E1C8E;
	Tue, 22 Sep 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070407; cv=none; b=bgZo/Tl+d2j3FAWXp7e6BObWn2/Z77HqEhNFS0+ZilFW9BWw5XgeWn48FUvfuuXBHDdWoglpyLMeU/5U/fTZLVB91T68DRdvCPrZxT0MpmcTq7uBI2DOwlxsJgfzy7+cJyOR+8UDJAmTJ9XcdNz8oOLQeBTwHVTg0yrBTl64x2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070407; c=relaxed/simple;
	bh=LbccBJQvRl7YrJr+t1IT0208yBwVIlBZaM0UcXAaE2c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=flyEieNh0fsZmt1Ft5WyD7k5cZr0g9Mi8PAUhla0mSmY3sM3jz6ihLaY9Hp7N3KaEB7qVusyduT4NJ9SS3At9R5ChoVEAh2xNtdgQxqPyctF4wCSWAwQObIDRjuagX44PEf7QaC/QNOF5aQTJVq3VoH6JtzfcLD1LFU9M4qtpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z29mc2Bv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zCGXPNwS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z29mc2Bv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zCGXPNwS"
Date: Tue, 22 Sep 2026 09:46:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070403;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYJd61CHRvWT3qRUQtzuYWgfxBqmcAk5o1keP8Ou/50=;
	b=z29mc2BvmJwyXSL9Q/rQKsNubkQ4RcrmrDQZZqZXjf7Q71l5YoI6UV1vTC6Wpv4iErOsD4
	gmk6VRXOpR8bjEnp9N1YZR6x1jfXHmYdCUrXgfBmHzi3U7s/AYZE2Wjrv0B0xZOo8cUBY9
	tmCt6oh8CRcQzqgKBhpmjxdkkh68/Ixi4LgA1uJlA+etosXSsPmBUe1ef3AHB/L6kpYOfh
	Xx38Z8zQCrdcX4ONq7J2Ii+pIQu5Eqp6TirH/isQ4vigE9KEuSVcKna1fgGkE236rpe7Cb
	xPFtpzeDipCYegli2YcQKuHcOhI7zNEIGJKYQLhw7rsUH2aQM17vnOi00rR0Wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070403;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYJd61CHRvWT3qRUQtzuYWgfxBqmcAk5o1keP8Ou/50=;
	b=zCGXPNwShmscDEVJSDLNX7fI44xbSS5lThb3saBfkAJFxS9aRh4iC7yOoJO4YOTwORCqpT
	L34rwapVxolBdqDw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Don't pointlessly context switch
 DS_AREA (and PEBS config) if PEBS is unused
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jim Mattson <jmattson@google.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-4-seanjc@google.com>
References: <20260921191418.950933-4-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007040168.2819794.4685987581506863481.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     d06260e99eb93d2942b7af4ccd789eb8a6c829d3
Gitweb:        https://git.kernel.org/tip/d06260e99eb93d2942b7af4ccd789eb8a6c=
829d3
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:11 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:09:14 +02:00

perf/x86/intel: Don't pointlessly context switch DS_AREA (and PEBS config) if=
 PEBS is unused

When filling the list of MSRs to be loaded by KVM on VM-Enter and VM-Exit,
load the guest values for DS_AREA and (conditionally) MSR_PEBS_DATA_CFG if
and only if PEBS will be active in the guest, i.e. only if a PEBS record
may be generated while running the guest.  As shown by the !pebs_ept path,
it's perfectly safe to run with the host's DS_AREA, so long as PEBS-enabled
counters are disabled via PERF_GLOBAL_CTRL.

Omitting DS_AREA and MSR_PEBS_DATA_CFG when PEBS is unused saves two MSR
writes per MSR on each VMX transition, i.e. eliminates two/four pointless
MSR writes on each VMX roundtrip when PEBS isn't being used by the guest.

Fixes: c59a1f106f5c ("KVM: x86/pmu: Add IA32_PEBS_ENABLE MSR emulation for ex=
tended PEBS")
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-4-seanjc@google.com
---
 arch/x86/events/intel/core.c | 39 ++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 5ac8fe3..75c74e8 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5330,23 +5330,14 @@ static struct perf_guest_switch_msr *intel_guest_get_=
msrs(int *nr, void *data)
 		return arr;
 	}
=20
+	/*
+	 * If the guest won't use PEBS or the CPU doesn't support PEBS in the
+	 * guest, then there's nothing more to do as disabling PMCs via
+	 * PERF_GLOBAL_CTRL is sufficient on CPUs with guest/host isolation.
+	 */
 	if (!kvm_pmu || !x86_pmu.pebs_ept)
 		return arr;
=20
-	arr[(*nr)++] =3D (struct perf_guest_switch_msr){
-		.msr =3D MSR_IA32_DS_AREA,
-		.host =3D (unsigned long)cpuc->ds,
-		.guest =3D kvm_pmu->ds_area,
-	};
-
-	if (x86_pmu.intel_cap.pebs_baseline) {
-		arr[(*nr)++] =3D (struct perf_guest_switch_msr){
-			.msr =3D MSR_PEBS_DATA_CFG,
-			.host =3D cpuc->active_pebs_data_cfg,
-			.guest =3D kvm_pmu->pebs_data_cfg,
-		};
-	}
-
 	/*
 	 * Restrict guest PEBS events to counters that (a) perf supports, (b)
 	 * the guest wants to use for PEBS, (c) are not excluded from counting
@@ -5374,6 +5365,26 @@ static struct perf_guest_switch_msr *intel_guest_get_m=
srs(int *nr, void *data)
 		guest_pebs_mask =3D 0;
=20
 	/*
+	 * Context switch DS_AREA and PEBS_DATA_CFG if and only if PEBS will be
+	 * active in the guest; if no records will be generated while the guest
+	 * is running, then simply keep the host values resident in hardware.
+	 */
+	arr[(*nr)++] =3D (struct perf_guest_switch_msr){
+		.msr =3D MSR_IA32_DS_AREA,
+		.host =3D (unsigned long)cpuc->ds,
+		.guest =3D guest_pebs_mask ? kvm_pmu->ds_area : (unsigned long)cpuc->ds,
+	};
+
+	if (x86_pmu.intel_cap.pebs_baseline) {
+		arr[(*nr)++] =3D (struct perf_guest_switch_msr){
+			.msr =3D MSR_PEBS_DATA_CFG,
+			.host =3D cpuc->active_pebs_data_cfg,
+			.guest =3D guest_pebs_mask ? kvm_pmu->pebs_data_cfg :
+						   cpuc->active_pebs_data_cfg,
+		};
+	}
+
+	/*
 	 * Do NOT mess with PEBS_ENABLED.  As above, disabling counters via
 	 * PERF_GLOBAL_CTRL is sufficient, and loading a stale PEBS_ENABLED,
 	 * e.g. on VM-Exit, can put the system in a bad state.  Simply enable
