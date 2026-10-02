Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E472868B5;
	Fri,  2 Oct 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933925; cv=none; b=n05y1+jDGPODs9r1l1qUk6IoD3AdgCqaJiQ0KyyA2DXNEhL727BFTX1OLbDDTx64+P/4F/UE1t9vLziPHAczfVQ8Uv9eOJ3LEXTTroOGgR6VYmbK1WH3J43OYig9JkN21JmmoE08LEF8VrGduYOvq/1wSdXlq4mt+LQL7ceiwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933925; c=relaxed/simple;
	bh=T5Kz6yh6I3Q8JCOVJ5fxxWE+p0PYaTjtBBr8LFkNUlk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nqxCmC1G375fvNaINNZv7I72vHPMcE8KlGf0Ic9r6n9oWE5vEF3n87+5Ms2zeJ0LoAX1rkMvSAiTccN0+QLjoBflHfzrjYaFFSp9b2KcIhX8mj7mNm1mjb+1NYsYjITRa4p/oKa4IcOH6jKBz8zMpvIdppABDYGaQONyyuHsK5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uFA6cC9o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f25mIvib; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uFA6cC9o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f25mIvib"
Date: Fri, 02 Oct 2026 09:38:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933922;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJqSqHYuYGsYWink4osa6Z6mFuwxRF4iTtN8UIowmT0=;
	b=uFA6cC9o+zS/rkuKizSWgjmg73jhixdJY3LdD44uVkgUG+Szlodwh5DY1BpyKhpRkGGEDQ
	byVY2rtSJpFBAjLWK16w15dZILHaW4nsYLHzj9RFgT9t3TrB5q5dQamTNts+BFVpUnb+X3
	H2+6tX54x5xKFJFfTpRZ49Pxt5z6HDLBoWquxiK86S5BX6yneY2wXk32hnWjB9+f1Pa1Ra
	aVo3JftOdZfWPjIW2yDfnAllZJkYW/6TZkcVwREY7HPKvUh6inTb/B2PH0FcGwLd0W5YTi
	r4oTKGwS5PXkvxRM2s0ZeyCqYKMxY3lejuZ+S/sPOKmMTlpExC137MIBaAWbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933922;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJqSqHYuYGsYWink4osa6Z6mFuwxRF4iTtN8UIowmT0=;
	b=f25mIvib780eXMK6ej0dLdkPDsW+QojdDvogo3qmLdhBm6zpTpD/SEJcfuYx7ZVhluDkzC
	t1eqK9jBXydAOGCQ==
From: "tip-bot2 for Jann Horn" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for
 UAF-related errors
Cc: Jann Horn <jannh@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260812-refcount-bug-on-data-corruption-v1-1-c6da63566101@google.com>
References:
 <20260812-refcount-bug-on-data-corruption-v1-1-c6da63566101@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093392037.3910103.15878606329217264167.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     5b5224220747029bbaee8ab851cc6c599c48eded
Gitweb:        https://git.kernel.org/tip/5b5224220747029bbaee8ab851cc6c599c4=
8eded
Author:        Jann Horn <jannh@google.com>
AuthorDate:    Wed, 12 Aug 2026 20:56:38 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:40 +02:00

refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors

Some refcount issues are not necessarily associated with memory corruption,
but REFCOUNT_ADD_UAF suggests that a UAF either just happened or is about
to happen.

REFCOUNT_SUB_UAF is also an indicator that reference counting is wrong, and
suggests (less strongly) that a UAF access might have happened recently.

In these cases, BUG() is appropriate if CONFIG_BUG_ON_DATA_CORRUPTION is
set.

Signed-off-by: Jann Horn <jannh@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Will Deacon <will@kernel.org>
Link: https://patch.msgid.link/20260812-refcount-bug-on-data-corruption-v1-1-=
c6da63566101@google.com
---
 lib/refcount.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/refcount.c b/lib/refcount.c
index a207a8f..c0f0dc5 100644
--- a/lib/refcount.c
+++ b/lib/refcount.c
@@ -10,6 +10,15 @@
=20
 #define REFCOUNT_WARN(str)	WARN_ONCE(1, "refcount_t: " str ".\n")
=20
+#ifdef CONFIG_BUG_ON_DATA_CORRUPTION
+#define REFCOUNT_CORRUPTION(str) ({		\
+	pr_err("refcount_t: " str ".\n");	\
+	BUG();					\
+})
+#else
+#define REFCOUNT_CORRUPTION(str) REFCOUNT_WARN(str)
+#endif
+
 void refcount_warn_saturate(refcount_t *r, enum refcount_saturation_type t)
 {
 	refcount_set(r, REFCOUNT_SATURATED);
@@ -22,10 +31,10 @@ void refcount_warn_saturate(refcount_t *r, enum refcount_=
saturation_type t)
 		REFCOUNT_WARN("saturated; leaking memory");
 		break;
 	case REFCOUNT_ADD_UAF:
-		REFCOUNT_WARN("addition on 0; use-after-free");
+		REFCOUNT_CORRUPTION("addition on 0; use-after-free");
 		break;
 	case REFCOUNT_SUB_UAF:
-		REFCOUNT_WARN("underflow; use-after-free");
+		REFCOUNT_CORRUPTION("underflow; use-after-free");
 		break;
 	case REFCOUNT_DEC_LEAK:
 		REFCOUNT_WARN("decrement hit 0; leaking memory");
@@ -84,7 +93,7 @@ bool refcount_dec_not_one(refcount_t *r)
=20
 		new =3D val - 1;
 		if (new > val) {
-			WARN_ONCE(new > val, "refcount_t: underflow; use-after-free.\n");
+			REFCOUNT_CORRUPTION("underflow; use-after-free");
 			return true;
 		}
=20
