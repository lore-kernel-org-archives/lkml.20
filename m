Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655329;
	b=WeAAKGZA5rxCH5yLOzkbjpJ4RQmI2Vk4f0f0QncEel3t7AYkyX6RofDil/2z7mRCK6vB
	 TZF73DNoIvVH95efu7kG67zghEYZIFEaxtqtzs8bgect5OiNRlJ1NO/fjLUzOeJE1GAEL
	 OtjCGPm0z5DKyxq1Ok7f/05q9Y0drbRAM8DqV2cdk9uvuY6s0uR72969kBFABmN4+QtTZ
	 eWSQT2yBdZKeYy2QPRUSJLpD1tMisjgcvMRFEwWZygnge1GKIUWEXi4TH33Zp8Ix5RiYy
	 nQBpdypoiudB4eHlX9Fe6MIH8/igI1ijm20BIh6WtqxOYA3S5tm9/lXEdRApfFOUubA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=uL4w43FvOhMXHpH83cVcxUnubWROwucUWwUXEs09Kbs=;
	b=VsvG20kGI/VJ0Gzcy+7UeweI2JnY+JDeHAVP1faMPkOZCjlrpja8eXpSV6STtEvHbR3J
	 O9sJ4Ohh6+kO5yOKcxZS22+D5ar9aU4f3KAkxgW8FGyKwHS196HX+ya8SWUoApRa1votI
	 Jb1xZhQgaj+hGBEzL68ZArp+ajccCj5qBf6JkuilDZyGbWVh8sfbPI9Xtu1PsEmiJDFeW
	 IiYGYttsTtAFkcQbe/yYA0H3N6IHwj5ni1jETtZMHW0NDG/1Cd4Y7tDdxxQtBX5UsVFY7
	 2W/mbIFFJfhTN5We2Q7/f0Hl0Y1QBrUIhd29GXIw5KWwVFweuh7svsI9HAfIFqOodYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=CWOC9Aou;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6679606EE92
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6679606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=CWOC9Aou
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3h37Qgz1XLkq4;
	Mon,  2 Nov 2026 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655325; x=1796247326; bh=uL4w4
	3FvOhMXHpH83cVcxUnubWROwucUWwUXEs09Kbs=; b=CWOC9AouK0sb+Oq4FJvKG
	lb4svC5+TCKd/eKwugD+BNp4e8LBYeMbrgH51WsLHJoCQ4lSxCInvOZUrthQOdob
	9FWjwsSXtiIV3yl1GDvMGueDrS38x8X9trHN/2mUzoPGgykRBXY5edwlmdd3OIgU
	OBdvk9nFrhomKce+3jdIazVf0D1tewKOn04tgxJ1zRxgA9dKO6Jpu0PMZQU1F+XH
	8yTp2Gxk6fEvkoQ9f/sjsutfj/9UrlddeFNY0fjXwYLZMHYlJi05StUU8XGHhOsm
	avro+i2kiBHZaid3E4laKQD3AjG/iJG6+YK7bN7Dvy0wDyunsGbHlkiYI3JFS0jG
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DJY6a25lEf9n; Mon,  2 Nov 2026 21:35:25 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3c5gp5z1XLkrq;
	Mon,  2 Nov 2026 21:35:24 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 09/14] kfence: Use lockdep_assume_ctx_held() in kfence_report_error()
Date: Mon,  2 Nov 2026 13:34:39 -0800
Message-ID: <47e1cdbc0c41e20ed1fca14d958155f9bc21a534.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
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
