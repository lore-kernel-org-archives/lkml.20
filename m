Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870061;
	b=QfIX2LIRi02mITIhKbvCLgMnL7GayRv32XIOVLnEN9QH+//F0vp3gKiFCV6f5MCztkea
	 LqMI9Z00My/3MuAXvLu6Og4kkf5DB5hEyqhILhAJVae79i0rc3+H26d2pbvUiHmc8W+xa
	 ZbaExVtjwniBDEMrbYW5DJ0KQyGEbLE/kI3wdCGtZ2pjtpifaFwepKhJhAVdnnzfOerzZ
	 86rMyj5rp203dl/KVdvO/urh5O/FI1Z/eo/aEUJdyX6DH4mLJqRjiM7yKMAoU6uniohzc
	 /VlxFCCzMp0CnCzT7JyADt7l2Avn30WbLupTglUBSY+wNVE/lUX52zdCHtAA2i4wFJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=96JoEw+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=;
	b=mYo6QFnYcyivkRT8lK06WdMaoir+QffzQ8MMLpbgWzbhsVlRFQ2MBSjVVk4qMaqCdAdW
	 Z2l5fRbXhLflgKgWm0/JWDx0M/W6wHPveoNXn75ncnCDT0vX8xN1OJ754t74MLSOK0HTx
	 ofpPitPHWlIRRke1Uss0R4bHoCDUi7p6DkCq7CyyUdRi2SE0MzqxhE5PO7lYoTVv91AUY
	 cRIfbhHEii1ce+isZ5k2i3eL4s0gnvIu3cEktQpWiZ7+QMJs6B2fA2qrxyoJCNAyNpODs
	 5OOwYCWhFHlvY75qObB/1ySl9PbLWLObPZNYFwaD04qUiGZNmwDkgDnfSkkXEDbSr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=s5W2LQm0;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767F5606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=s5W2LQm0
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jT3Hx0GP9z1XLkrk;
	Mon, 16 Nov 2026 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794870058; x=1797462059; bh=96JoE
	w+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=; b=s5W2LQm0sera0BtzDMiq5
	T3lgWVasf0A/N/huecw8bcLe+sjn1VcC7cLA8Rie7//6Wo3jAnZU0+hWJNWYwA9H
	ys7YN1N4TGd/+0srhITOzSAlCfOCtcyI4r8/bu+4v4JflbkOBs6x/c6/poTPC2s0
	6JVbVH7fOMNWmLxgdjO9oYBn7GeyYpAyDqv0/gvDhjsbwE/xXqMdfIWvmsXvolx+
	PH041CDGE9beZIWXrbRIU3xsT+fUHHW/mgNmq30hP0UuHLjdor35VhTFF6dGe/Ft
	t5jmYAb/dAr8U4Fhs1noC5K5r8Q1aFAB8kqTDoohcjC+Uppa2fAotnpgl1rbCQpn
	g==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id s14nTrrtWSNv; Mon, 16 Nov 2026 23:00:58 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jT3Ht2Nbcz1XM0nk;
	Mon, 16 Nov 2026 23:00:58 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v3 1/3] bit_spinlock: Fix the __bitlock() definition
Date: Mon, 16 Nov 2026 14:59:33 -0800
Message-ID: <1120d27263be7908709829ecb184a49e1eda1033.1794869902.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <cover.1794869902.git.bvanassche@acm.org>
References: <cover.1794869902.git.bvanassche@acm.org>
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

Surround the bitnum argument and the entire __bitlock() macro expansion
with parentheses because bitnum could be an expression that includes an
operator with a lower precedence than the addition operator (e.g. the
exclusive-or operator) and to prevent operator precedence issues in
callers.

Reviewed-by: Marco Elver <elver@google.com>
Fixes: eb7d96a13bf4 ("bit_spinlock: Support Clang's context analysis")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/bit_spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index 7869a6e59b6a..c31d4f4d09ee 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -17,7 +17,7 @@
  * static analysis can use.
  */
 context_lock_struct(__context_bitlock) { };
-#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (a=
ddr))
+#define __bitlock(bitnum, addr) ((struct __context_bitlock *)((bitnum) +=
 (addr)))
=20
 /*
  *  bit-based spin_lock()
