Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958631;
	b=nr8JEnhL58AuVLIWVH1sO3aDjBRA6fGHgn9n8H2YhdS/o9wNMo+nfYIn4UV4yInj/+dL
	 81eGn2uAZ/gKjw7IDPOemKT1fsIO4WCw4C5BfJp+He+exj/q71RVJidJrzJO4imtqCTdB
	 0mR3P7sxNOL1Z9AJq5a0odcNl6SSNnzg5yxyT/DI8AzHVsX24jBj2DMOF3vtF91Zn9pF/
	 Fb1LhQeggzgObobVdT5gselZYPGOVHqgwoCS4I7gUWs6Yrlu83V59bqhU52t2bNALDsTf
	 VkfkJYVmPCGVk7DWdkTpm912igcRsUUZFbUMZS+qXbUAEgxELPhWls582UzVIV130mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958631;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=D2SkJKrN7/FmI2FuA7V9r5zCUI4Cx69VwNQSz5JglGs=;
	b=NW2+mPyYWNart+DqtEwr6Q2KneHNqQ0L5QLedFsT/d+HSZ1SJo2f+Ro8GeWm3/qhAACI
	 m/Wn1Gyk9Y2zGdRcp+JYHbXoTyUnyttYOZWdAT0udfVutRiVy5TNJiTq9IoMTwbeg51wM
	 KtlcCCf43Gwr0xTvJ1UqJOWGyqhHSWqpprx9+mnqsYjZcSxF40xRNVtfvKITUvn7/kuKt
	 QWKIUqwqA8UqLehFcMvvDFkN9X7l7XAqM6Dqvz5o01ae6kDRUiLBZ9JO9wCYk18JMcqof
	 txTSHG+/uzEu6f2zW9uE7uyXCe758MOsiJ0WM1pqZW11wiMVM0TPZL/FWkebC59KyMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wo24yHHm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rjEBbrwH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D879606D82E;
	Fri,  6 Nov 2026 09:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D879606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wo24yHHm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rjEBbrwH
Date: Fri, 06 Nov 2026 09:50:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2SkJKrN7/FmI2FuA7V9r5zCUI4Cx69VwNQSz5JglGs=;
	b=Wo24yHHmbocedAsHGeiVolerKVIJEzQhJx8wM/7rc78sowfA4+tB03MqDmT2V4kJbqaLJr
	ZorUGZs+b9iQM7Xw8XVbf9TgqMvVOIRoXXFr9ggfYR9Y8n9FzyVmRIEQU8mw12Z6PQ5nYV
	/K+97s45gLK7qMbpZl9j9CFa+gEyKu9/lcsyeBTNQ0QcdkPNhtjdKhe36FDc1vcPa5dC9i
	zsZcXNLHBU+EkpoEGqpDISVbRgavJr/Ps1KZVSBcJ6YezP67w27T71qISvb2QqUv26Ibly
	CLpOBLShChMlHY8LvkPURXopFfUetRQCXLH3Tkw2QtkrIgGaA6j4GG6XBL1uvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2SkJKrN7/FmI2FuA7V9r5zCUI4Cx69VwNQSz5JglGs=;
	b=rjEBbrwHe00TreBokAB9P51lxMsBBMrX11cHiEMw/dKjIZGrmgq3+pytNlK1UJymeihKqV
	Sj2CaPrN8N7oQfDA==
From: "tip-bot2 for Ian Rogers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/core: Include perf_event_attr::defer_output
 in is_sb_event() check
Cc: Ian Rogers <irogers@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025215508.1237480-1-irogers@google.com>
References: <20261025215508.1237480-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395862729.1009794.9028432222904707634.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     772f38fc69d5cf22f13b43dec30c2bbc5bdf4eb8
Gitweb:        https://git.kernel.org/tip/772f38fc69d5cf22f13b43dec30c2bbc5bd=
f4eb8
Author:        Ian Rogers <irogers@google.com>
AuthorDate:    Sun, 25 Oct 2026 14:55:07 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:38:16 +01:00

perf/core: Include perf_event_attr::defer_output in is_sb_event() check

Events configured with attr.defer_output =3D 1 receive deferred callchain
sideband records (PERF_RECORD_CALLCHAIN_DEFERRED) via perf_iterate_sb().

Include attr->defer_output in is_sb_event() so that such events are
attached to the sideband event list even when no other sideband flags
(such as mmap or comm) are enabled on the event.

Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
Signed-off-by: Ian Rogers <irogers@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261025215508.1237480-1-irogers@google.com
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 457d75e..6cbd701 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5356,7 +5356,7 @@ static bool is_sb_event(struct perf_event *event)
 	    attr->comm || attr->comm_exec ||
 	    attr->task || attr->ksymbol ||
 	    attr->context_switch || attr->text_poke ||
-	    attr->bpf_event)
+	    attr->bpf_event || attr->defer_output)
 		return true;
=20
 	return false;
