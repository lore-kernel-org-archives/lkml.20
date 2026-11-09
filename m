Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251648;
	b=1IMg/7MsihTRkACqa4PvFavoSV0allr6fCs2uQ+gZVVS2JlJeoL3E26LeVON7Fjul7fR
	 rWqDSgY0mubg9vsUF1SoQfVxRxyrbGHN4xES1bsfeK5UhtmHYvHZXy3weAwYln6Sin+b1
	 jdQgpcOYFPaSUA5gV8YOqa35/Zrpx656OiGmtvvavbwR1RWFnhzYI62jqEBuTRpnS7nfF
	 fIGu+I9jb7YbtnU1y/iRYQAYW13LFBfc/DhrHIgCODNl87KzUq8cazjo/aw1vFMEiLywU
	 lJFLrTrBKsOSGVHp0zOldf71dnh5rJxWEbs0c0S54o0ZDBFHWFPTlAocpzy3kaEho9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=uL4w43FvOhMXHpH83cVcxUnubWROwucUWwUXEs09Kbs=;
	b=BY7ZEsU0ykwbMvAh0iz7I82hsjRMLIXqA4ualSOS2v2Do+sGBthGhrP45PIZXtgL4om+
	 asJuEDhfUBTJzw7Qs/PswyXH6yNUXzdJpZD1j8CVAbtEG+3fbVSFrZUpYmN19XAY+Pocn
	 gdcxrZwvHvmjB5SGvKoWFrmZk8U0UvQ5DYYP3J64vIsIGZV4hmGzVL+r50cX1YicH3coB
	 cFshJEa73KbPr+z/wCwlzoDjJloJSNO9IowWG0utkFyWY2Uagy1DLZ0JkpeTxyEe5mmd/
	 vNe+sSZKFnBi5vqWko8Y+AxR/NRN1b6i5c7CI34CXWDSVTtWEcnnN/rH/nU7/aEggwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nKoOfD30;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4F660A261C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4F660A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nKoOfD30
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbM23Kjz1XLyNK;
	Mon,  9 Nov 2026 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251643; x=1796843644; bh=uL4w4
	3FvOhMXHpH83cVcxUnubWROwucUWwUXEs09Kbs=; b=nKoOfD30Mn7mcHCZfKIxq
	TDwhw945ngy9c0aGeMnj97M+GKFQBxSNX/RuHREm1zc8hwuTaV8pjMY34J25EvGo
	ANo1EO7ABcKCPPPvP4rYYWOIXyMaaeiGuyaaY/YAVPbtM+5J1GW+Si7WnZUffON6
	tO34HYZ2XvpZl9vi7XWinuGaXBOyderYYu/7VRzg9maKw82cXNBe9nJAN18zix83
	IfEWT2PkuGSsDhDV189SUEQoy4R7onVsyv7PQcUq+I8JlT7JtuvRNOHrqUA/zF86
	OvICdJF67ZnW/hkI+J5gnvr30yNivaQ2+Hh12BO9Im6+oOgzPbaFc5NWxuOnT6je
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id pfEh5FMpP8qq; Mon,  9 Nov 2026 19:14:03 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbG6X1xz1XM0nl;
	Mon,  9 Nov 2026 19:14:02 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 09/14] kfence: Use lockdep_assume_ctx_held() in kfence_report_error()
Date: Mon,  9 Nov 2026 11:13:17 -0800
Message-ID: <caf7287a1cb4b265ea190c91578af43c598f591f.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <cover.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace lockdep_assert_held(&meta->lock) with
lockdep_assume_ctx_held(&meta->lock) in kfence_report_error().

kfence_print_object() requires holding &meta->lock. In
kfence_report_error(), meta is optional (nullable), so the function
cannot be annotated with __must_hold(&meta->lock). Currently,
lockdep_assert_held(&meta->lock) implicitly assumes lock ownership for
Clang context analysis. Prepare for removing the context assumption from
lockdep_assert_held() by using lockdep_assume_ctx_held(&meta->lock)
inside the "if (meta)" block. This informs Clang context analysis that
meta->lock is held and preserves the runtime lockdep check.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 mm/kfence/report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index d548536864b1..5b8588d35b77 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -286,7 +286,7 @@ kfence_report_error(unsigned long address, bool is_wr=
ite, struct pt_regs *regs,
 	stack_trace_print(stack_entries + skipnr, num_stack_entries - skipnr, 0=
);
=20
 	if (meta) {
-		lockdep_assert_held(&meta->lock);
+		lockdep_assume_ctx_held(&meta->lock);
 		pr_err("\n");
 		kfence_print_object(NULL, meta);
 	}
