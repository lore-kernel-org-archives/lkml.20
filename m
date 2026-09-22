Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5952F299;
	Tue, 22 Sep 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070407; cv=none; b=Pthb5PwMoNttoNtukalikpkABhNYaBTpbuYVu947a5Eu9oEcV3tY53yF1tXQhTlb4U2w+6/TqyUEMiBeV7oIVtSgrvn5aV6kyBuzxkIDkS9VGACI0iwYOGsdZY4fYQTiVtP69QKVf2UL+cPYArAvxCw73FU22HTCsqJJRBBceAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070407; c=relaxed/simple;
	bh=9fBDNWglAF984kg7mPxo66UZoZOy1EbVzWAVGFPAYhE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cJVGf3uDfcoM8zKP2ahOkQglxH5R06UVKnYQmI6+QJE8mJsm6/cCRdaM8YfGRwVwSINaAPjzgtSCkTzGm1+0AFRr5/4l8tZlVpASvz5dMYD+tc/+3+3vwFkptZ9ckxZjIKxjVlh/eVzzsaQsP8XsDqtAys0iCrDMZf4HTaUs2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yPfFa/DV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rdWHsQ7P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yPfFa/DV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rdWHsQ7P"
Date: Tue, 22 Sep 2026 09:46:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070401;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+yCXIk52HZCMb592WoYnkWr70cx/hBIuXzZOUQ+DY4=;
	b=yPfFa/DV5aUJkVKW3VX7AsegFRDAKcTrJ8jN8hzbJxf/w/NoPlHEHq4rnKRJhN35BX2oPV
	WNG5xHYTU6lsfa088D/kcW7oSBDSJOXY88yrLup92vrR1fg3Lk4vxUOHf8TltpVz6VCekO
	xf21hoIGMYU0uPDuywAMvm66uLcwi9gcfhVHGjGOsvxtTJXNo/C7301WTrTTIATswe0V72
	ky/68FE2Wh47H/Ij3g65ZkFNHKM76p89E67XPuxoi1joQ0s2CD+kG33nr5HtFu9A8aWYj/
	qYTFgLx2t5K9VfadIJZb3ZGwnrC2R07eYjKBrpK9TQW1Cmep4Kx4WlBletNzYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070401;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+yCXIk52HZCMb592WoYnkWr70cx/hBIuXzZOUQ+DY4=;
	b=rdWHsQ7PhIyVbmKDr0+sQeYLSCcwKIwtEKXe0DdcX57qiotmQCkcSGWxHEaARR2EstlO3H
	a4rZEZ8dajmkA7Dw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Make @data a mandatory param for
 intel_guest_get_msrs()
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jim Mattson <jmattson@google.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-5-seanjc@google.com>
References: <20260921191418.950933-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007040021.2819794.7404300630050652404.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     a391618e1d563f099e4c2a704f45d08329ccdf7c
Gitweb:        https://git.kernel.org/tip/a391618e1d563f099e4c2a704f45d08329c=
cdf7c
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:12 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:09:45 +02:00

perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()

Drop "support" for passing a NULL @data/@kvm_pmu param when getting guest
MSRs.  KVM, the only in-tree user, unconditionally passes a non-NULL
pointer, and carrying code that suggests @data may be NULL is confusing,
e.g. incorrectly implies that there are scenarios where KVM doesn't pass
a PMU context.

Fixes: 8183a538cd95 ("KVM: x86/pmu: Add IA32_DS_AREA MSR emulation to support=
 guest DS")
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-5-seanjc@google.com
---
 arch/x86/events/intel/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 75c74e8..757d408 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5331,11 +5331,11 @@ static struct perf_guest_switch_msr *intel_guest_get_=
msrs(int *nr, void *data)
 	}
=20
 	/*
-	 * If the guest won't use PEBS or the CPU doesn't support PEBS in the
-	 * guest, then there's nothing more to do as disabling PMCs via
-	 * PERF_GLOBAL_CTRL is sufficient on CPUs with guest/host isolation.
+	 * If the CPU doesn't support PEBS in the guest, then there's nothing
+	 * more to do as disabling PMCs via PERF_GLOBAL_CTRL is sufficient on
+	 * CPUs with guest/host isolation.
 	 */
-	if (!kvm_pmu || !x86_pmu.pebs_ept)
+	if (!x86_pmu.pebs_ept)
 		return arr;
=20
 	/*
