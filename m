Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9C4EB842;
	Tue, 22 Sep 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070413; cv=none; b=m/Y4yNYCyuGsHoMjXslz1j8AuZswMN3hY8I2ET/lNiaRrzbemEWIt6LKIOBJHDjfNgfZrc88kFXvINimGsa+DUH4/0kUQo3RUiLBF6MMkN29wTcWbGmP5SCwAwtOw1/FaEqT+QS/M8GaopUwsNenjgcBL6bzOG4GoVtaZ+l8nwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070413; c=relaxed/simple;
	bh=1vKvCPAnLXRrvYDjzFDFP5hcoTlYVxpp9+zJmNrIOLE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=gWr2dWBLinwySvk6KsSZ7edm7AO2bX85PSE29oe6HEXX6y9j1lK0OsxaY6GDwopFYX8shyaqc0LskANbv89oB7f755RJX/0R9xXO902BWRmMDnDtimuokt+1YTi2smnSe8Qgirrx6b4Ot+8NURX16uXxLaK3ZsajRxJSuaHxUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3RpGIAjZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BBuhqgPG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3RpGIAjZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BBuhqgPG"
Date: Tue, 22 Sep 2026 09:46:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070406;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oR0kVtKq/UeYer4pqpsaPLBAScFqyF18Eh0wX+Hfw9A=;
	b=3RpGIAjZclLNypP8ITyEyJ5KGEfQEqH5sEOXHnkd3K7SXo9NJoz6j1UXvEqSCdA0X+d3mi
	hXHi5hJuyBgsAkUofItAZ9Q9tZ+z6ojd4gIudDitPxoZX7WQIYajJn13Yit/VMexnWI+gh
	OCOONz8jQmPH8KZto/CN5lG0GzSwowNMqbzWAwpx61Be/U7DeI+gcibZiSXUkt6Ez3kXs2
	INAuI+zf1N4GofLtAqI6HHbWAqzMG4XQQ/+2z5PHn0yrA4/iZemzW6Ex6A5CtvqSR4MlDf
	H79ws5jFLezJyUXzSgVxaxRruYpsf94mDnLmq5yroSk9J0xxWu7wiQ4vyqToOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070406;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oR0kVtKq/UeYer4pqpsaPLBAScFqyF18Eh0wX+Hfw9A=;
	b=BBuhqgPGnuXa2U0VNx3V+9ZoGoLTAsjKA//Rush5XHY9FtTi+vgOKX+XXZQalCx6ocP4M0
	u3nW44z94czfIOCw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Ensure KVM guest PEBS path doesn't
 set unwanted PERF_GLOBAL_CTRL bits
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-2-seanjc@google.com>
References: <20260921191418.950933-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007040510.2819794.8929882011547828067.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     cec38d5c098a350dcf084d345025136ade7e6d1e
Gitweb:        https://git.kernel.org/tip/cec38d5c098a350dcf084d345025136ade7=
e6d1e
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:09 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:02:37 +02:00

perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted PERF_GLOBAL_C=
TRL bits

When reinstating PEBS counters into PERF_GLOBAL_CTRL for a KVM guest, mask
the value with perf's desired/original PERF_GLOBAL_CTRL value to ensure
KVM doesn't unintentionally set reserved bits in PERF_GLOBAL_CTRL.  E.g.
if the guest's PEBS_ENABLE value had bit 63, "Enable Precise Store", set,
then using the raw guest PEBS value would propagate bit 63 to the guest's
PERF_GLOBAL_CTRL value (which thankfully would be a failed VM-Entry, not
a VMX Abort).

The only reason this bug isn't reachable is because KVM doesn't support
"Enable Precise Store" (which is probably a KVM bug?), i.e. bit 63 can't
be set in kvm_pmu->pebs_enable and thus not in arr[pebs_enable].guest.  In
other words, this _should_ be a glorified NOP in the current code base.

Fixes: c59a1f106f5c ("KVM: x86/pmu: Add IA32_PEBS_ENABLE MSR emulation for ex=
tended PEBS")
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-2-seanjc@google.com
---
 arch/x86/events/intel/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 1ac2ca3..0400b51 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5359,7 +5359,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 		arr[pebs_enable].guest &=3D ~kvm_pmu->host_cross_mapped_mask;
 		arr[global_ctrl].guest &=3D ~kvm_pmu->host_cross_mapped_mask;
 		/* Set hw GLOBAL_CTRL bits for PEBS counter when it runs for guest */
-		arr[global_ctrl].guest |=3D arr[pebs_enable].guest;
+		arr[global_ctrl].guest |=3D intel_ctrl & arr[pebs_enable].guest;
 	}
=20
 	return arr;
