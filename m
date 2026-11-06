Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958629;
	b=XEFc+TIvswjbJhNJtmbVVFfecmSfDcm3LmjC8qWGJtV+OBBhuvFBp9XuEbtMJYvIJDdT
	 /xZAHMPXYqrR2fxAzYVZ8lnljafQElCmPD8l2GDgHx9SnnNXYZ1Ie3rtuTqFZpEQnS8jR
	 9YLTCWc83r/YiGI0obrXGz0PKBcPgB9bXSDhMi7LIRdUJO3+maCaj65UEifR6oodKMl8B
	 4H7Hte3otAvTAGttcZ7PavtjXok1c7tXEr/kU0NtWIIfmadHjy2ia6egOvMxYQNyiwqtR
	 H2LXMqpi9aqrLC0YP80J61Z5wwWMSXEDAJAi/gBsgzctmuRpmfQqaPJKibpnE+HUZeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958629;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Yw5bNsADi5KTgHZgSsrCXyAtajzD+j1fgwgopci2HFg=;
	b=z3DVKvVtgLrRYKV7/sBQIYz+O/mZoPyXB8o7TYzw/wJ/Z65w/zv4OO0iYCsid6+rPXJ9
	 qBix4VF4v7Goc2pbMCuVWqI9AETYVZCN7S5m0djtgfZILQbDb+oSwc41flf05eSm/uCUG
	 GVcxpPqaxzkvIgA9Tp7vSzfZmwP76C730JZX+9+A0wGBZcKhlVPJDjqq9ThnxveMLdDIk
	 1M7LG0kSs8GZ9pXZu/nC6ozFTUKByKRFGH0rSgFJyIddRZocJffQKo6m7kaXf7UlCCpNS
	 6qx6gZF4bBqNzNs1odbUtvN34IyzwfZ9Ol3euXno1CoXcalpBRyIkyVirHsMIjKQ5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=A2e3Dxoh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F56bPKOM;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D37606D802;
	Fri,  6 Nov 2026 09:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D37606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=A2e3Dxoh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F56bPKOM
Date: Fri, 06 Nov 2026 09:50:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958627;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yw5bNsADi5KTgHZgSsrCXyAtajzD+j1fgwgopci2HFg=;
	b=A2e3DxohWpcEwZfdcBzItMxjArpDGtk4ab+2C3c14GkUEjwNloskgaRwhrV4a1Na4cVsEk
	YihSY1TPMDA0PDoe+Mr830219lAt//t3m4oxvQ8uS4/lX++JsRWvDKD1klj6ZtiSuj01dJ
	MTg433bIIYR6PT1XijIW5buOar/63mCPP8LZx2th6H02FdQBntgrGWJg8mls8UhlFPUGhY
	S24d1Tpb5d/gLQvdQIcFBYFNgLyQrQoWyIncnT+Q2ukZmZftTRD2n8zjPuI2nVcQ2nHjgV
	4/kCn3bl2gHxv4Qf5pjcPowV0zsYqNoDUOKGLRBLMcZ/2uI+Y2aN+KK09j4tCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958627;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yw5bNsADi5KTgHZgSsrCXyAtajzD+j1fgwgopci2HFg=;
	b=F56bPKOM7otbKhEUwPUsVEIepH9Zb+eJ8K4gPcPon63Zao5qKB3jdk6WBvQsrX18vadjEk
	+O0e3KMfTKI1SHAg==
From: "tip-bot2 for Ian Rogers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/core: Clamp deferred callchain entry count to
 fit u16 header.size
Cc: Ian Rogers <irogers@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025215508.1237480-2-irogers@google.com>
References: <20261025215508.1237480-2-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395862567.1009794.17873500038552197703.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     5e4d83fb3616ebf807df1ce1b0ee7a8cdcb5ff87
Gitweb:        https://git.kernel.org/tip/5e4d83fb3616ebf807df1ce1b0ee7a8cdcb=
5ff87
Author:        Ian Rogers <irogers@google.com>
AuthorDate:    Sun, 25 Oct 2026 14:55:08 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:39:43 +01:00

perf/core: Clamp deferred callchain entry count to fit u16 header.size

In perf_callchain_deferred_output(), if trace->nr is large enough that
sizeof(deferred_event->event) + trace->nr * sizeof(u64) + id_header_size
exceeds U16_MAX, header.size wraps while the output loop still writes
all trace->nr entries into the ring buffer.

Clamp nr per event (accounting for event->id_header_size when
sample_id_all is enabled) so the record never overflows u16 header.size.

Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
Signed-off-by: Ian Rogers <irogers@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261025215508.1237480-2-irogers@google.com
---
 kernel/events/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6cbd701..580590b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10514,8 +10514,6 @@ struct perf_callchain_deferred_event {
 	struct {
 		struct perf_event_header	header;
 		u64				cookie;
-		u64				nr;
-		u64				ips[];
 	} event;
 };
=20
@@ -10524,12 +10522,19 @@ static void perf_callchain_deferred_output(struct p=
erf_event *event, void *data)
 	struct perf_callchain_deferred_event *deferred_event =3D data;
 	struct perf_output_handle handle;
 	struct perf_sample_data sample;
+	u64 nr =3D deferred_event->trace->nr;
+	u16 size, id_size, max_payload;
 	int ret;
-	u16 size =3D sizeof(deferred_event->event) + (deferred_event->trace->nr * s=
izeof(u64));
=20
 	if (!event->attr.defer_output)
 		return;
=20
+	id_size =3D event->attr.sample_id_all ? event->id_header_size : 0;
+	max_payload =3D round_down(U16_MAX - sizeof(deferred_event->event) -
+				 sizeof(u64) - id_size, sizeof(u64));
+	nr =3D min_t(u64, nr, max_payload / sizeof(u64));
+	size =3D sizeof(deferred_event->event) + sizeof(u64) + nr * sizeof(u64);
+
 	/* XXX do we really need sample_id_all for this ??? */
 	perf_event_header__init(&deferred_event->event.header, &sample,
 				PERF_RECORD_CALLCHAIN_DEFERRED,
@@ -10543,8 +10548,10 @@ static void perf_callchain_deferred_output(struct pe=
rf_event *event, void *data)
 		return;
=20
 	perf_output_put(&handle, deferred_event->event);
-	for (int i =3D 0; i < deferred_event->trace->nr; i++) {
+	perf_output_put(&handle, nr);
+	for (u64 i =3D 0; i < nr; i++) {
 		u64 entry =3D deferred_event->trace->entries[i];
+
 		perf_output_put(&handle, entry);
 	}
 	perf_event__output_id_sample(event, &handle, &sample);
@@ -10559,7 +10566,6 @@ static void perf_unwind_deferred_callback(struct unwi=
nd_work *work,
 		.trace =3D trace,
 		.event =3D {
 			.cookie =3D cookie,
-			.nr =3D trace->nr,
 		},
 	};
=20
