Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251640;
	b=i5NDssWdOu3WkhUSJrvWkcOFVQbL82jlf4rcOJgt6D/QGye5hlqPIwsKjI9h1Jfqi7gR
	 o89VnTpE7mc6u5WdEQoBTwBAmVTe/OFZ79gUlTKiWDtwSDL53bP4yOkevUnXyEkZhMcHo
	 Eu14ulKPrA7syg6IvQOJPDI/tAHlSotjnFn2b1xhvxM3bfnxwrTUfALU2INcWfVpTRb0F
	 Nui8bAcDmATW1TZCuxd8YiqJpS+bYWjQQchxGZSKREIESIs1JUuwX+KEbx/sNBCcfastU
	 YEAR+OlRJKJm3LoQkfdQII2/d/Nv5xQOTjOoQYz2XfNixqvEdYpKAicKxNbAZQmiAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=FM9EOPPGQK8Fq2ECpiXi34LkylYkFVvp/oBKHFJxL+E=;
	b=FGjNlLYZ5mDaJD0Zz4saa434ARcCME4f4t/MyHqivmRP09MSHdwulxb3LNza9RHFHd1t
	 zBJExcZs7CCItLxEjWrKeyLyx2kvUasNUQiXFvVP4qaUxp+GHD1lQeFWaZnDJGe/r/mye
	 pj3BENqIpxgjrmZUYDyl10E7rbe6n3ZqJnNkluWTVQLDQkb18eY/7FOnotraCHIyo+onM
	 GfmIpZYfdolWQ3SwzWI+w+ofmEoL0eXEgNUGznrhjGnXVLZ4dNVsvifxbyeEEve1so9sM
	 ZYfqH2jR8YA8gMyrQFgh0VPtPiuEaJbRYixiKaWoUpqsNEqZ3yVkiNfamCnmmnyTlgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=GqkKx5Kd;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082CE606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082CE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=GqkKx5Kd
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbC4N9dz1XM6JG;
	Mon,  9 Nov 2026 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251636; x=1796843637; bh=FM9EO
	PPGQK8Fq2ECpiXi34LkylYkFVvp/oBKHFJxL+E=; b=GqkKx5KdBdZokjsCJYB52
	w4NTA2CAcNT64mZ49+QyfFjZmeedqiYUd6AcGv2DaLsLiQCoB8FbtBy16RA5SICh
	X/gMvlFJxaT0mW/C90Q0IBeF5JdLruS7F7e7pfYP50Qq9WJoQqGQYEU/iXwLDjXA
	vrmB0t/KEbWEX1iXFUPXEo8ie1C5OvmZVEXKdjTStpHuMmtwSjvi+1/aQnXXzmAF
	fZjpSMk2gcPOeC07aOMR55HgoUE6CUBWGR0SYhRBzixBGWGv+xQKxJCfUjVVKh5s
	EZWdFobefuJFEd/K8MLBLNuCWS2hldGUmUpmejJIt2iflPll+Y89PijFWK4L9ozK
	g==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PYOxhhZ0DGbx; Mon,  9 Nov 2026 19:13:56 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfb73VxLz1XM4Tn;
	Mon,  9 Nov 2026 19:13:55 +0000 (UTC)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 02/14] cleanup: Disable context analysis for __free() helpers
Date: Mon,  9 Nov 2026 11:13:10 -0800
Message-ID: <7074ec433986fee7e604a2c414452a3947f496d7.1794250850.git.bvanassche@acm.org>
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

The __free_##_name() helper functions defined by DEFINE_FREE() call the
free expression that has been passed to DEFINE_FREE(). If that
expression releases a lock, e.g. because it is a call to an unlock
function, the Clang thread-safety analyzer complains because it cannot
know that the variable that is passed to the helper function holds a
lock. Hence, disable context analysis for the __free() helper
functions.

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
