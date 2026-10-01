Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B3490C11
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886110; cv=none; b=r6V+BGzPM7qHEJax/zNTQgggBEvWLCX7f3qNn9woebXn7fCg3XEMr4BY8i9+UUpS2CSvUQbdUvBdZvT22Fwd3Xn7MRTlVE674/jlqd3QM/IBlgor46CI8XxiaxRITM//J6EFDOM2Is9ahiX62NRFQZ8H54DjzPk/mokd9Qc5Q0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886110; c=relaxed/simple;
	bh=GVpxYRu+8584h/aYWM5kQDx3x92JCyK0VRLy0eJfGCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyw7xLaw9u9rvb5xNQHjPtOhxHT17FKwIjcmFqrus4rwMZvzpkMltsfvqOS+6Ai1X2D/l3Wgrsc7JrpIXEqZCCnXIVP29QkmD+twJDSizA23RtaQib7aNh0xXI8+bVHjmjyv+lmM3LaldeBSTw9CmZANIrHXwgls/GUtFhQ+Hy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hIVzLkRS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hIVzLkRS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=kQRrha7PW27pqoIOSakZ9K/6jDGxw7dZW1aLodqp/eQ=; b=hIVzLkRSD0YX0YqTrc+bYRBxV+
	7AZ/FZaTOh674Gu4ZCvvIHoGUKZo29bduKjh9/h43ebbdBZej6Bhb6apLAGRSdIxW/Fl1O3mx+L8b
	wRe5qyfUdqE2V8sSJbxy/RizsN7Nj6nHadS1NlN3/ge2Xhj0JygLUbUV01a5hxRgXJ0uQDL74XhzY
	ZyRbVe7Fl95tWhEyk9pnFLk8ajDTxDmivM9J4nLdY41cQSKl2wEMaMA/NdKfsvtDduD9WcK5mXFKh
	rbepL95TCnNObIboAa10eQS1GH43tzGkjimDWz4JkAfWKq4P0FXujtSYW9kOLZE45Vp6mIP7cogKJ
	oIgXd4jg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNHd-00000009lWq-3yRq;
	Thu, 01 Oct 2026 20:21:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pQ-33lj;
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
Subject: [PATCH 1/5] timekeeping: Allow tick_length changes to apply mid-tick
Date: Thu,  1 Oct 2026 21:21:30 +0100
Message-ID: <20261001202134.33929-2-dwmw2@infradead.org>
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

When the NTP tick length changes, timekeeping_apply_adjustment() applies
the accounting for the new rate to ntp_error retrospectively for the
partial tick which is currently in progress. So the ideal line of the
clock conceptually changes from the moment of cycle_last (which can be
almost a full tick ago), and ntp_error grows to show the difference
between that and what userspace actually saw already.

This can lead to a significant value (10s of microseconds) landing in
ntp_error which can take *days* to drain through the natural mult ±1
dithering.

The slow-draining ntp_error then applies a consistent bias to that ±1
dithering, meaning that the precision of the effective frequency
requested by userspace is limited to integer 'mult' values, since the
dithering is no longer effective to achieve the fractional parts.

Fix this by allowing the rate change to be conceptually applied at
'offset' into the partial tick, rather than the start of the tick.
This means that the amount of delta which gets accumulated into
ntp_error remains low.

Rather than factoring this into timekeeping_apply_adjustment() which
already makes my eyes bleed, pre-correct it when the rate changes, to
adjust the 'intended' clock position according to the delta between
old and new tick lengths (but leaving skew as it should be).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 kernel/time/timekeeping.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..e2f7e28dc16e 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2444,6 +2444,8 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		/* Revert to the base mult rate. */
 		mult = tk->tkr_mono.mult - tk->ntp_err_mult;
 	} else {
+		u64 old_ntp_tick = tk->ntp_tick;
+
 		tk->ntp_tick = ntp_tl;
 		tk->skew_delta = skew;
 		/*
@@ -2453,6 +2455,21 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		skew *= NTP_INTERVAL_FREQ;
 		mult = div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
 				 tk->cycle_interval);
+
+		/*
+		 * Rate adjustments are conceptually applied mid-tick in order
+		 * to avoid accumulating large deltas in ntp_error which can
+		 * take days to drain. Offset the ntp_error that will be
+		 * introduced by timekeeping_apply_adjustment(), accordingly.
+		 */
+		if (tk->ntp_tick != old_ntp_tick) {
+			u64 old_dividend = (old_ntp_tick + skew) >> tk->ntp_error_shift;
+			s64 old_base_mult = div64_u64(old_dividend, tk->cycle_interval);
+			s64 mult_delta = (s64)mult - old_base_mult;
+
+			tk->ntp_error -= ((s64)offset * mult_delta)
+					 << tk->ntp_error_shift;
+		}
 	}
 
 	/*
-- 
2.43.0

