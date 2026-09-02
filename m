Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D037F320;
	Wed,  2 Sep 2026 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334056; cv=none; b=DQaOLD5zQAFisA99v6s+ixbFCqser9OH+f3M1MeQzMglcDRiJgK8sPftclc/yVhfzXX/bWSI16H6J59gcBCw9OUG5DGGcDXuqhTWqYk/16HK3sVWqTnHYlM62+EVqYVdLIRUO2CS7ym0UI8jphwVBt3oD7+Ph303kH/YwhG7iz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334056; c=relaxed/simple;
	bh=0Wpzhq0Fr7qOIIyY2y7TtBo8yzyI1zG0SuXZ/bkLVyI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ia0uQCuq0MYlIbbKJOaS0wLTTyJ9An8YZzNU3llbJc0cfXVsY0S+zNDrN3AKO0u1BW+Xrm7nWkVAH/k6c3BVKz5krkQTnk+6jYpONw201awSh4XOpmmwABjyDtCsjnu+pw2gIQsOKo2vAs0cZpfMBRQpsucKaVYAQu0QDnoG0k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SpMVLbc/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5/IXhtwk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SpMVLbc/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5/IXhtwk"
Date: Wed, 02 Sep 2026 07:27:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788334052;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi0phNCmdPvW/lxtHXapq/tsJ3qfIHViuk2c6LRTQiM=;
	b=SpMVLbc/5DEJ8vWiZHn3cKMSG0KaW7NT628XudLOMIfGhGbEsBe7m3/VHLiA1XIi5V3qbQ
	nYsMaD0oGPmWODGYXrM4uFOepO1QcY0uYlHkRQE32M/41bAefkK2czAbYfY75N7ZwW2YJu
	xYMIvG4BVUn+CliiHpVO+I26FvjtJwcD6Lhtz94/VuYxodUDvDuUV3JU296pAIGEu1vcM6
	44+2EVGBF/fWeguW1IuBYhPH4yGg6yz8kaZKDen29SL4MStVIGY5HfBZ2itRRKyV0GMHnv
	CLElmyB7pUy6eIqc/qtKDNNFMBaC8SqTOQsavnS4oQyTWpzQyVQ0M8ArHvwuqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788334052;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi0phNCmdPvW/lxtHXapq/tsJ3qfIHViuk2c6LRTQiM=;
	b=5/IXhtwksC+TdM781MfHrK+jrwmedvHcHXJkiPVqvytLczqoueaKbDM1f1QNtqGpwEhox+
	LTGPSgcm6KhE3VDQ==
From: "tip-bot2 for Leo Yan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/core: Skip empty AUX records with only format flags
Cc: Tamas Petz <tamas.petz@arm.com>, Leo Yan <leo.yan@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20260825-perf_core_fix_zero_aux_records-v1-1-23b95e8d5df3@arm.com>
References:
 <20260825-perf_core_fix_zero_aux_records-v1-1-23b95e8d5df3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833405111.3717435.11351757508027059690.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     8a7f5b5e860b5c113ca99acd5b1e9074f5c5af3c
Gitweb:        https://git.kernel.org/tip/8a7f5b5e860b5c113ca99acd5b1e9074f5c=
5af3c
Author:        Leo Yan <leo.yan@arm.com>
AuthorDate:    Tue, 25 Aug 2026 11:37:06 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:18:00 +02:00

perf/core: Skip empty AUX records with only format flags

perf_aux_output_end() emits a PERF_RECORD_AUX when the recorded size is
nonzero or when any flag other than PERF_AUX_FLAG_OVERWRITE is set.

PMU format flags describe how an AUX payload is encoded. TRBE driver
sets PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW for raw trace buffers, causing
an AUX record to be emitted even when no trace data.

This is noticeable when tracing a task with strace. Ptrace stops
repeatedly end empty AUX transactions, producing many zero-sized
PERF_RECORD_AUX records. For example:

  perf record -e cs_etm//u -m,128M -- strace ls

  perf script -D 2>&1 |
     awk '/PERF_RECORD_AUX offset/ {
        for (i =3D 1; i <=3D NF; i++)
                if ($i =3D=3D "size:" && $(i + 1) =3D=3D "0")
                        count++
     }
     END { print count }'
  165

This recording contains 165 zero-sized AUX records which provide no
useful information to userspace.

Ignore PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK, together with
PERF_AUX_FLAG_OVERWRITE, when deciding whether an empty AUX record is
useful. Zero-sized records carrying TRUNCATED, PARTIAL or COLLISION
are still emitted.

Fixes: 547b60988e63 ("perf: aux: Add flags for the buffer format")
Reported-by: Tamas Petz <tamas.petz@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260825-perf_core_fix_zero_aux_records-v1-1-2=
3b95e8d5df3@arm.com
---
 kernel/events/ring_buffer.c |  9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 9fe9216..1b1ffe0 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -509,7 +509,10 @@ void perf_aux_output_end(struct perf_output_handle *hand=
le, unsigned long size)
 	/*
 	 * Only send RECORD_AUX if we have something useful to communicate
 	 *
-	 * Note: the OVERWRITE records by themselves are not considered
+	 * PMU_FORMAT bits identify the PMU type rather than an AUX event
+	 * has occurred, so ignore them for zero-sized records.
+	 *
+	 * The OVERWRITE records by themselves are not considered
 	 * useful, as they don't communicate any *new* information,
 	 * aside from the short-lived offset, that becomes history at
 	 * the next event sched-in and therefore isn't useful.
@@ -518,7 +521,9 @@ void perf_aux_output_end(struct perf_output_handle *handl=
e, unsigned long size)
 	 * offset. So, from now on we don't output AUX records that
 	 * have *only* OVERWRITE flag set.
 	 */
-	if (size || (handle->aux_flags & ~(u64)PERF_AUX_FLAG_OVERWRITE))
+	if (size ||
+	    (handle->aux_flags & ~(u64)(PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK |
+					PERF_AUX_FLAG_OVERWRITE)))
 		perf_event_aux_event(handle->event, aux_head, size,
 				     handle->aux_flags);
=20
