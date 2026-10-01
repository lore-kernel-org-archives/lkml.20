Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9B4825D8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886109; cv=none; b=sZ9wFirkCEGUCQ2AuGwbzeU5bDgBNpi8u5YOSu6kgQ77u/SJo+v7Nayn51aQuEsWevTUbOYcYQ4l0wiNgZxtjCxOTfu51e69acxoL64FIAmXhNf6VEBqFoGfU7uW481XxlfbHyxfDnkL4zaO+jWzFkH4l5Eeb+7/7A717USuyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886109; c=relaxed/simple;
	bh=hGQCfoikrCVYkQWYT/pgMBxxcj34mYBayHjxpd04/QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYnMUvVrC1+d+iMTgJ3X12HbaaCttDnL62CkyWZmOXndQuqjUm90MgfuZFyOCfVDrdLrx/zhccRQJjscP4VO8c078YQW8ORL/jXSDOi/DsaqXpFDGK4dH9lltE5eCaHKq1b7hlNK3/Bd1xe5eMlsxf0tEjNOgCam7sLagE8O1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lQ/KJUl5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lQ/KJUl5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=D2fmHSpfpmUe2HAQJmn3Blsb4rc8fDC6ukysJpFE/sE=; b=lQ/KJUl56ONuVzTkVoHEe/ZXN/
	GdQ/pbdGEQBIRMSiO+d5jBagwkw3kTs+GuRxZKnWWHpM4uy+FCV6TmwQpHZp7nrTgKn+rbIEkDK5l
	cKOU+aTOwd6q6Oj85MfgmQquyiEf0bWdwpYnE5FS5I6jIrzG9V66dwWkuKXehZgcFXPW51ZuANOOj
	DIYeVhvz73iAXC43LPhm74eaZUZUfS5bAobisY1/AittWV+DDfJ4Dbp8QTmhSt1Lmo4GtFW8P5PeR
	Pd65FV6SLR3FEbRTVangI1lr+VQdr9bw+mbE70yQ6Jufi1wQc5wDz+Bxr/8XBgZ/OYzszCQ6N04TB
	XO3xCaUA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNHe-00000009lWr-0INI;
	Thu, 01 Oct 2026 20:21:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pY-3b1d;
	Thu, 01 Oct 2026 21:21:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Ryan Luu <rluu@amazon.com>,
	Julien Ridoux <ridouxj@amazon.com>,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 3/5] timekeeping: Bound idle sleep while a phase slew is in flight
Date: Thu,  1 Oct 2026 21:21:32 +0100
Message-ID: <20261001202134.33929-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001202134.33929-1-dwmw2@infradead.org>
References: <20261001202134.33929-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Phase offset for adjtime() can be delivered at a rate of 500µs/s, and
for STA_PPSTIME potentially even more. The skew is recalculated in
second_overflow() each second, and if that's missed in a tickless
kernel, the skew continues to be applied for the whole of the idle
period. While skew is active, clamp timekeeping_max_deferment() to the
top of the current second to avoid the overshoot.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 kernel/time/timekeeping.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index e2f7e28dc16e..986649cae46d 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1975,6 +1975,21 @@ u64 timekeeping_max_deferment(void)
 
 		ret = tk->tkr_mono.clock->max_idle_ns;
 
+		/*
+		 * Skew introduced for phase offset is intended to be
+		 * recalculated each second. Ensure a tickless kernel
+		 * wakes up for that and does not overshoot, while skew
+		 * is being applied.
+		 */
+		if (abs(tk->skew_delta) > 1) {
+			u64 nsec_in_sec = tk->tkr_mono.xtime_nsec >>
+					  tk->tkr_mono.shift;
+			u64 remaining = NSEC_PER_SEC - min_t(u64, nsec_in_sec,
+							     NSEC_PER_SEC);
+
+			ret = min_t(u64, ret, max_t(u64, remaining, TICK_NSEC));
+		}
+
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 
 	return ret;
@@ -3045,8 +3060,16 @@ static int __do_adjtimex(struct tk_data *tkd, struct __kernel_timex *txc,
 		tk_update_leap_state_all(tkd);
 	}
 
-	/* Update the multiplier immediately if frequency was set directly */
-	if (txc->modes & (ADJ_FREQUENCY | ADJ_TICK))
+	/*
+	 * Update the multiplier immediately if the frequency was set
+	 * directly, or refresh the cached skew_delta if a phase
+	 * adjustment started a slew, so that it bounds idle sleep.
+	 * ADJ_OFFSET_READONLY excludes the unprivileged read-only
+	 * adjtime() form, which starts no slew.
+	 */
+	if ((txc->modes & (ADJ_FREQUENCY | ADJ_TICK)) ||
+	    ((txc->modes & ADJ_OFFSET) &&
+	     !(txc->modes & ADJ_OFFSET_READONLY)))
 		result->clock_set |= __timekeeping_advance(tkd, TK_ADV_FREQ);
 
 	return ret;
-- 
2.43.0

