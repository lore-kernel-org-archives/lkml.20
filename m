Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870086;
	b=eKPIAFDLVDASAAAetHDCoRMx58FzF//KEiyrrdgFL1noyaa/cHYZXVS8/kfig6Hv0vR9
	 LV7ddUa9oWipuGtNPRnd00b0Pd7XWwlcRRc82i94jbp9Mi8ksgSwyosD0enh7xxRT4D8Q
	 M6vkjmwyIof6WnxSaXNFYqJBe1GJyMcpgp9tXnoBqUtAU4yOrQgYMKbtaWYLhcyAsfEKL
	 fTfS0ojmBa5m1rIM3yZYtlH8OGGwZev37SUhb7yKnVtxrFcdNeKC1L3HcWC8d7QYkzr2y
	 sqdZIAbCCa9kauCbrhgcwrKRxwb6KAT5maiANL2O9TPqlukyCWnoCu09YmKs10fW5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=cd4AfU3+6JbgZv3ifbNUaJf/Vq0mPKc6Jg1YGbbwxyc=;
	b=qe/stPjEge3fodFn1fu4v4D6rwuqoddkmgtneK4s87XFV7qAPvyZ9D1WzekYzxqzs8B1
	 TPFVFu4G1qUzykNa4X+kvAczhP+lIw6IAJDbQrfrkVB2lKFjmoOVGWwyNx8sWAgr6A3iN
	 q7DJxzqzhLdqyJICmI+bfow53BQOqXV0/Dv5lc2UuLRRxDT5jXbfgPhKO320Cj2K6I3Py
	 iP0/psHv7gsiI6qOUIimIQmt3+pV8ZbBHCGvSUGn6j3nMJF0L1hGPdsHQqx2ay+X+Ptsr
	 aQAVaFIuxEruFO/a4rj/iJRaIetm3S4tncXYM/yMTG8SRKQLghptVJCtpZeuJBBCmzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Tcods78o;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC7606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Tcods78o
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jT3JP4j0Mz1XLkrn;
	Mon, 16 Nov 2026 23:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794870082; x=1797462083; bh=cd4Af
	U3+6JbgZv3ifbNUaJf/Vq0mPKc6Jg1YGbbwxyc=; b=Tcods78o4jGZt95oDhS9P
	62ThNZ4+ewwUyGFz09otsKccsh2qCHc9H1kSv9XGqyl+uso4teyIfD1t4Vgzokka
	D1AnBRBLcgpOqJgoD78bMlYWNoJK86mNXseRt/sDBDl+8eXj6evOGkDe3jCosaPb
	5voEEsRXbT4/2vPrWVJuMdUU7pJjIb/2zJkZhv9y40jgsCraMcicuFp640LeOfIZ
	YpUgIFk0qhBJI3kB6lfV/ar81x3lma+ydFRHZcacMnr6ah37EmGR8YQrTnOyJV1U
	03KPlatEE6Dv/0CLjA533QayXrgRWlAHbjWyxiTN9gyheW2JHq5COBwXRn8yVXZ7
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HgCmjfnzTN5L; Mon, 16 Nov 2026 23:01:22 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jT3JK3tNPz1XM0nk;
	Mon, 16 Nov 2026 23:01:21 +0000 (UTC)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 2/3] cleanup: Disable context analysis for __free() helpers
Date: Mon, 16 Nov 2026 14:59:34 -0800
Message-ID: <d71ef58fdf6958ac524ecd3a81d527af0406c7bd.1794869902.git.bvanassche@acm.org>
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

The __free_##_name() helper functions defined by DEFINE_FREE() call the
free expression that has been passed to DEFINE_FREE(). If that
expression releases a lock, e.g. because it is a call to an unlock
function, the Clang thread-safety analyzer complains because it cannot
know that the variable that is passed to the helper function holds a
lock. This is needed by:
- __drm_for_each_bridge_in_chain_cleanup (include/drm/drm_bridge.h),
  used by drm_for_each_bridge_in_chain_scoped() and
  drm_for_each_bridge_in_chain_from_scoped().
- netdev_unlock (net/core/dev.h), used by for_each_netdev_lock_scoped().
- netdev_unlock_ops_compat (net/core/dev.h), used by
  for_each_netdev_lock_ops_compat_scoped().

Disable context analysis for the __free() helper functions.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/cleanup.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 1fb8058b897d..f6afe80781a4 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -207,8 +207,10 @@
  * Without the NULL test it turns into a mess and the compiler can't hel=
p us.
  */
=20
-#define DEFINE_FREE(_name, _type, _free) \
-	static __always_inline void __free_##_name(void *p) { _type _T =3D *(_t=
ype *)p; _free; }
+#define DEFINE_FREE(_name, _type, _free)				\
+	static __always_inline void __free_##_name(void *p)		\
+		__context_unsafe(/* _free may release a lock */)		\
+	{ _type _T =3D *(_type *)p; _free; }
=20
 #define __free(_name)	__cleanup(__free_##_name)
=20
