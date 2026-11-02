Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655321;
	b=NQMiNeJqSmFIQfcew/YP01wt0QKR+5FeoaiE6/oW4GTWYyCDy9GzZGiQ5/UQBXZvZUsb
	 vIlxr9DfojO4hXi4yP7qup+khRmelTPpPAdnm30oNCYoUkx+y0c1MAA34i8IojfLEjCQC
	 lcG4l5xE7Qqt5wuTn8p1GrBkOZKrciotBz9mHHYpm0GjMfEgDjI3QxmsSQYWaO00titiU
	 I/uzBh8FAPvLXrPuZgScU4+N/xMiNti3u2CuOPkXgXCaPw7xIGQiiSPk6jq+rlbt0EvjU
	 30di/0P14q6pFDbZ3NUhRyHYVP1BvI10Yx0BSS+hvLEn1CGAUKKW3M0dNvFwMkXYaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=96JoEw+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=;
	b=DLZEj9f0jp1xgC5X+SMiuUVV9HgYVA0O8lGAcqaFpSCtjGOyYRPHo1NSG0XvAN9vNa14
	 nZ7rIXXOoNT+V1ZNXcYFGRCc1uhDT4U0n0YuQCPNK4zEo7z2IHgYkSoRefhFiZcDkblPh
	 Y76YCQr8FeizmBnfHYKTxYOmox14D/rBOvdkdEF0Qw/6VRuYc93DX0xLZuoujvf9hKBqr
	 uJapJ24v6FccNA9kFFU6/sRfwuJmiztVDfbC7i3Yi7nYrdvNYCsMJd+S5JswjB9kXhRVk
	 bnsCGioHG0mtdK8iOgXTuL5bQXNiuGcuRj3WGILCkU1N29eJzAeZf5mbiAfyf8hLAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=wCK9WhhU;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6592D606D806
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6592D606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=wCK9WhhU
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3R4Q3Hz1XLktv;
	Mon,  2 Nov 2026 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655313; x=1796247314; bh=96JoE
	w+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=; b=wCK9WhhUEFQjr1tvrOno5
	4TN+3uGxuF4aFS3kYlmE+j3/NIRuMnXM/rOTJcsrd4qZgla5EeuuSRfRuum2GR8d
	JkOde/jsDHVqBbNoreLmN84EnDBCWF/FPONEKgeNMkLkbwURRLhgEWd/BrChkkos
	a6+ag+5fDtRC2xKdZIeP1SRqlCJXoqy30I+3IhMKbi7sDv1xFieiJS4LjPvOrFqO
	LrKKW+Yz+hCvtwEKOyz3PGVpibpsVx5wPQ+HVwkL3ZZPOevAzvxWLtAYMXMRJMIu
	xf6gJS+4SfPv/mxzR+4PKHdUAnJ5nMKCAiBU31rH/c0OV/zUcZeURoOgaHsp+C1n
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cEbOOdtwgvFx; Mon,  2 Nov 2026 21:35:13 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3N6LdCz1XLkt9;
	Mon,  2 Nov 2026 21:35:12 +0000 (UTC)
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
Subject: [PATCH 01/14] bit_spinlock: Fix the __bitlock() definition
Date: Mon,  2 Nov 2026 13:34:31 -0800
Message-ID: <8303f662c823e7b5700f1bc32faa07b661da4504.1793654853.git.bvanassche@acm.org>
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
