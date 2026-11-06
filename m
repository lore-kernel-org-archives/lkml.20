Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958624;
	b=vfAUGrxbgo/rsc2kMS5jndxZZajf7LFIMNiC3XnisUo+JIkvjEN1NiKHejTNBWA39oUt
	 rZ7OSE4OI2feVr5n47xqbrcmlPx1lEcbzXgyVBFtojuSouF852wofgVWp9nAM6z2ZejJA
	 730FsTD+Tfj9IE72wk19fpmZemdB6bfXvuQRhgxGte24JaDYlBdd6n7kgNewQSBe1Gl42
	 MBbRrKfvaX/TGx3t5Il3ewhsUbWREqU+E1e8UmlI7b1dKAuVFma4kA2wbjpCukOZ6s+im
	 kL1ziZXcBVU+4JkGWpwUFjR8otpOmLvX+YfEVa2ZSKGxOVfnd0ietYykFQEQ5/kCeQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958624;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=9lbjNCwvn/VsFTMhsMK+kRtIbp5EoP1q2579NPuNAE0=;
	b=k8h1Nz/RALtIMYBi/zW4cvQ+wk38cE1zbqYOrbF3YPsYIkUxo8+PeaUs/zXE6ipm2Dk5
	 ZPi4lhvyOzBEdU3Xgj7sNldGbiv1ZJpWYqgzZw/i0Ra+E2mbj4CQQhmaR0kaGb3IdO0kB
	 NUyY08pWfkIoXhZSEDrXr4Ml5O6ccXwsgRdbIgBo6Yb1mq2UqKOQecaIzl8Z3iltI66vI
	 KLmrJGgi2I4MRl9uCaa99pMpDhHUwPGU8P6ZSbbmqJzkBFvoH06+uiNjM24iy0VFl7F/H
	 qlqNbgjWKAHFrL1W3dUUNCIr8jCP5iGX0bB8HT9LdVmFRugI/mC4yWm0LrEFqknVj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="VOWN/pSw";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PV9f3sty;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68528606A339;
	Fri,  6 Nov 2026 09:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68528606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VOWN/pSw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PV9f3sty
Date: Fri, 06 Nov 2026 09:50:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958622;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lbjNCwvn/VsFTMhsMK+kRtIbp5EoP1q2579NPuNAE0=;
	b=VOWN/pSww4ehscEYTP3L22FsgtRKLKq5f3DRxQsJcl6BJWQz5QOna452z6BSmMQpkiNnOg
	KB+7sRdrHpsEDPl5zQeWaudYDY3/qgsL6w7qtpGfz4PoroE/e9Zcsd82qPKb4WfBHAa6d6
	ZUGTZhwmuOjWWVSjq/HqJHraq4DBbwZ8GWPKt2n1w0Nr1x+lqblO8nDTna4NlyIDY2LnOa
	clMxq/X3hDS8BfLLZjzcD47JGqrbhCknQjyOplFKHjVwgP8FPhgynVYD5iIc3h1VLBeKev
	E4+ajVPyzYUB5cF1WktpYGa/NoKQpPRUAiTdfb0b3ZXoaK0/Co1+MDASXq9aIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958622;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lbjNCwvn/VsFTMhsMK+kRtIbp5EoP1q2579NPuNAE0=;
	b=PV9f3styv2S9xNtkgC9xSSLGe/jVRmSCd+ueV4fhGv7XsKDhS9/IR12biV5mkJsVWf9AI0
	bPDke3Kn/d7OjgCg==
From: "tip-bot2 for Ravi Bangoria" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/amd/ibs: Simplify event state handling with
 IBS_CAPS_DIS
Cc: Jim Mattson <jmattson@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026041838.941-4-ravi.bangoria@amd.com>
References: <20261026041838.941-4-ravi.bangoria@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395862060.1009794.12554125086657970042.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     927f9c5cdadbc4ac6973bcd1690107fcb392612c
Gitweb:        https://git.kernel.org/tip/927f9c5cdadbc4ac6973bcd1690107fcb39=
2612c
Author:        Ravi Bangoria <ravi.bangoria@amd.com>
AuthorDate:    Mon, 26 Oct 2026 04:18:37=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:50:21 +01:00

perf/amd/ibs: Simplify event state handling with IBS_CAPS_DIS

The IBS_{FETCH|OP}_CTL2[Dis] bit allows IBS sampling to be stopped without
a RMW of IBS_{FETCH,OP}_CTL. Systems providing this bit therefore do not
require the IBS_STARTED and IBS_STOPPED states used to coordinate control
MSR updates with late NMIs.

Add a separate stop path for these systems. Preserve the Val bit while
disabling the event so that a delayed NMI can be identified and consumed,
and wait briefly for such an NMI before restarting the event.

Leave the existing handling unchanged on systems without IBS_CAPS_DIS.

Closes: https://lore.kernel.org/r/20261007234815.4026028-1-jmattson@google.com
Fixes: efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to elimi=
nate RMW race")
Reported-by: Jim Mattson <jmattson@google.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
Link: https://lore.kernel.org/r/20261007234815.4026028-1-jmattson@google.com
Link: https://patch.msgid.link/20261026041838.941-4-ravi.bangoria@amd.com
---
 arch/x86/events/amd/ibs.c | 145 +++++++++++++++++++++++++++++++------
 1 file changed, 122 insertions(+), 23 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 010d14d..66e67e2 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -28,6 +28,7 @@ static u32 ibs_caps;
 #include <linux/hardirq.h>
=20
 #include <asm/nmi.h>
+#include <asm/delay.h>
 #include <asm/amd/ibs.h>
=20
 /* attr.config2 */
@@ -73,7 +74,12 @@ static u32 ibs_caps;
  *
  * XXX: we could probably be using !atomic bitops for all this.
  */
-
+/*
+ * NOTE: IBS_CAPS_DIS eliminates the RMW race on the IBS_{FETCH|OP}_CTL, mak=
ing
+ * IBS_STARTED and IBS_STOPPED states unnecessary. We use only IBS_ENABLED a=
nd
+ * IBS_STOPPING states when IBS_CAPS_DIS is present. Semantics of IBS_STOPPI=
NG
+ * changes a bit as well.
+ */
 enum ibs_states {
 	IBS_ENABLED	=3D 0,
 	IBS_STARTED	=3D 1,
@@ -557,7 +563,9 @@ static void perf_ibs_start(struct perf_event *event, int =
flags)
 	struct hw_perf_event *hwc =3D &event->hw;
 	struct perf_ibs *perf_ibs =3D container_of(event->pmu, struct perf_ibs, pmu=
);
 	struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
+	unsigned int delay =3D 50;
 	u64 period, config =3D 0;
+	u64 ctl;
=20
 	if (WARN_ON_ONCE(!(hwc->state & PERF_HES_STOPPED)))
 		return;
@@ -575,23 +583,87 @@ static void perf_ibs_start(struct perf_event *event, in=
t flags)
 	}
 	config |=3D period >> 4;
=20
-	/*
-	 * Reset the IBS_{FETCH|OP}_CTL MSR before updating pcpu->state.
-	 * Doing so prevents a race condition in which an NMI due to other
-	 * source might accidentally activate the event before we enable
-	 * it ourselves.
-	 */
-	perf_ibs_disable_event(perf_ibs, hwc, 0);
+	if (ibs_caps & IBS_CAPS_DIS) {
+		/*
+		 *      IBS HW                     SW
+		 *
+		 *  o Capture sample       o ->stop()
+		 *  o Set VAL bit            CTL2[Dis] =3D 1
+		 *  o Raise NMI --.        o ...
+		 *                 \       o ->start()
+		 *                  \        wrmsr(IBS_{FETCH|OP}_CTL, new value);
+		 *                   \       (wrmsr clears the VAL bit)
+		 *                    `--> o Receives delayed NMI
+		 *                           (Unknown NMI since VAL bit is cleared)
+		 *
+		 * Handle this with induced delay.
+		 */
+		rdmsrq(hwc->config_base, ctl);
+		while ((ctl & perf_ibs->valid_mask) && delay--) {
+			udelay(1);
+			rdmsrq(hwc->config_base, ctl);
+		}
+	} else {
+		/*
+		 * Reset the IBS_{FETCH|OP}_CTL MSR before updating pcpu->state.
+		 * Doing so prevents a race condition in which an NMI due to
+		 * other source might accidentally activate the event before we
+		 * enable it ourselves.
+		 */
+		perf_ibs_disable_event(perf_ibs, hwc, 0);
+		/*
+		 * Set STARTED before enabling the hardware, such that a
+		 * subsequent NMI must observe it.
+		 */
+		set_bit(IBS_STARTED,    pcpu->state);
+		clear_bit(IBS_STOPPING, pcpu->state);
+	}
+	perf_ibs_enable_event(perf_ibs, hwc, config);
+
+	perf_event_update_userpage(event);
+}
+
+/* ->stop() for platforms with additional CTL2[Dis] bit. */
+static void perf_ibs_stop_dis(struct perf_event *event, int flags)
+{
+	struct hw_perf_event *hwc =3D &event->hw;
+	struct perf_ibs *perf_ibs =3D container_of(event->pmu, struct perf_ibs, pmu=
);
+	struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
+	u64 config;
+	u64 ctl2;
+
+	WARN_ON_ONCE(test_bit(IBS_STOPPING, pcpu->state));
+
+	set_bit(IBS_STOPPING, pcpu->state);
+
+	rdmsrq(hwc->extra_reg.reg, ctl2);
+	if (ctl2 & perf_ibs->disable_mask)
+		goto reset_state;
+
+	wrmsrq(hwc->extra_reg.reg, perf_ibs->disable_mask);
+
+	WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
+	hwc->state |=3D PERF_HES_STOPPED;
+
+	if (hwc->state & PERF_HES_UPTODATE)
+		goto reset_state;
+
+	rdmsrq(hwc->config_base, config);
+
+	config &=3D ~perf_ibs->valid_mask;
=20
 	/*
-	 * Set STARTED before enabling the hardware, such that a subsequent NMI
-	 * must observe it.
+	 * Clear the Val bit otherwise ->start() will unnecessarily
+	 * wait for 50us.
 	 */
-	set_bit(IBS_STARTED,    pcpu->state);
-	clear_bit(IBS_STOPPING, pcpu->state);
-	perf_ibs_enable_event(perf_ibs, hwc, config);
+	if (in_nmi())
+		wrmsrq(hwc->config_base, config);
=20
-	perf_event_update_userpage(event);
+	perf_ibs_event_update(perf_ibs, event, &config);
+	hwc->state |=3D PERF_HES_UPTODATE;
+
+reset_state:
+	clear_bit(IBS_STOPPING, pcpu->state);
 }
=20
 static void perf_ibs_stop(struct perf_event *event, int flags)
@@ -602,6 +674,9 @@ static void perf_ibs_stop(struct perf_event *event, int f=
lags)
 	u64 config;
 	int stopping;
=20
+	if (ibs_caps & IBS_CAPS_DIS)
+		return perf_ibs_stop_dis(event, flags);
+
 	if (test_and_set_bit(IBS_STOPPING, pcpu->state))
 		return;
=20
@@ -1416,19 +1491,43 @@ static int perf_ibs_handle_irq(struct perf_ibs *perf_=
ibs, struct pt_regs *iregs)
 	unsigned int msr;
 	u64 *buf, *config, period, new_config =3D 0;
 	int br_target_idx =3D -1;
+	u64 ctl2, ctl;
=20
-	if (!test_bit(IBS_STARTED, pcpu->state)) {
-fail:
+	if (ibs_caps & IBS_CAPS_DIS) {
 		/*
-		 * Catch spurious interrupts after stopping IBS: After
-		 * disabling IBS there could be still incoming NMIs
-		 * with samples that even have the valid bit cleared.
-		 * Mark all this NMIs as handled.
+		 * ->stop() {
+		 *     set_bit(IBS_STOPPING);
+		 *                               <-- NMI (race 1)
+		 *     CTL2[Dis]=3D1;
+		 *     ...                       <-- NMI (race 2)
+		 * }
 		 */
-		if (test_and_clear_bit(IBS_STOPPED, pcpu->state))
-			return 1;
+		rdmsrq(perf_ibs->msr2, ctl2);
+		if (test_bit(IBS_STOPPING, pcpu->state) /* race 1 */ ||
+		    (ctl2 & perf_ibs->disable_mask) /* race 2 */) {
+			rdmsrq(perf_ibs->msr, ctl);
+			if (ctl & perf_ibs->valid_mask) {
+				ctl &=3D ~(perf_ibs->enable_mask |
+					 perf_ibs->valid_mask);
+				wrmsrq(perf_ibs->msr, ctl);
+				return 1;
+			}
+			return 0;
+		}
+	} else {
+		if (!test_bit(IBS_STARTED, pcpu->state)) {
+fail:
+			/*
+			 * Catch spurious interrupts after stopping IBS: After
+			 * disabling IBS there could be still incoming NMIs
+			 * with samples that even have the valid bit cleared.
+			 * Mark all this NMIs as handled.
+			 */
+			if (test_and_clear_bit(IBS_STOPPED, pcpu->state))
+				return 1;
=20
-		return 0;
+			return 0;
+		}
 	}
=20
 	if (WARN_ON_ONCE(!event))
