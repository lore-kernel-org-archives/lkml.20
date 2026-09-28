Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF5545D5D5;
	Mon, 28 Sep 2026 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578897; cv=none; b=S/20YTdRpBOGdeBxMGhjncE4wPu9utyUnSnWBg/ST0DigJiptf/Z7+pD1dk62epVBpXADQNfMxNxxT3BS3UtsyuaaYtpcsmtqhlHWbactsJk2JFkhj8eN9Hjn3qOmZim6rSd3uGKnk6q/mvxaEbcsAW7ZXOUYfDffMrQFlX5lAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578897; c=relaxed/simple;
	bh=sadE27guixpeVjX2Cr2tWHDP1wyLjkmlMfhUTPlepgM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XECjN4wViaDxTkG3znqLfzD0mzsCmhUehgf13wdFE00z/s85JHhrLKrrMnYajmG5uG0KUwoez6OtUhaBSrjFGLXzCwumdSfURS6btap2fylqtRYTqTDHQrITcQwMK/zU5l4x1DMpzg6Uo5vqJOsxgxi6D+4uxD7649cuPN1evns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TuwSLp78; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0yqt5HPx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TuwSLp78";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0yqt5HPx"
Date: Mon, 28 Sep 2026 07:01:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578893;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZLzGVqgKTf3QWn/I2KPazBMXraZO94UeWJR/EtpIpM=;
	b=TuwSLp78ry4Nwq+WkIbUxiFrFgH+FpPj7KcpJY8uNQjmMVyStS27Xj0qoLvQkyF8Po10Ad
	45cR+2ApKTOVV+xZV2twuIjRhI+MXk9zuTC7kCZ5CPGYFxrXKTSBijwFhZ4itK1LNsK06X
	onHR3PXnGanXALPjwCnloFzNhYxNzGoN4qszDj++k3HWbfefKRz5IFe/Zys7M0BzXnID1n
	IcbdOIDyCP1c4JZdRIXFzeBQkck4KHiFHxV0eHiM3ufJNDK0VYV7c1CA/3PGt2xqUaIK5v
	nVqJkvZHrATwU28Kkb2lxFeRki0uLhLxJ9evjieklTvpCKz5qshiqH7OAaFwOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578893;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZLzGVqgKTf3QWn/I2KPazBMXraZO94UeWJR/EtpIpM=;
	b=0yqt5HPx6vzNj+rsdIYuMFhj5mSth0ReJJF3y4mx+AH8rE2I5y8kH3JuwCjgsdzE7d8+yw
	yiEpS9IS+kHAKdBw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] cpumask: Introduce cpumask_intersects_and
Cc: Yury Norov <yury.norov@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-3-sshegde@linux.ibm.com>
References: <20260928053728.797539-3-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889120.3910103.8328955221740142956.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     cfb463b7172dca2f29b2221b71b54890f268e3fb
Gitweb:        https://git.kernel.org/tip/cfb463b7172dca2f29b2221b71b54890f26=
8e3fb
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:17 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:40 +02:00

cpumask: Introduce cpumask_intersects_and

Introduce bitmap_intersects_and() to determine whether the intersection
of three bitmaps is non-empty. Unlike cpumask_first_and_and(), this
returns immediately when an intersecting word is found and does not
calculate the first matching bit.

Add cpumask_intersects_and() as the corresponding cpumask wrapper.

A subsequent patch uses the helper to determine whether a task
has a CPU that is present in its affinity mask, the preferred CPU mask,
and task possible CPU mask.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviwed-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Link: https://patch.msgid.link/20260928053728.797539-3-sshegde@linux.ibm.com
---
 include/linux/bitmap.h  | 14 ++++++++++++++
 include/linux/cpumask.h | 18 ++++++++++++++++++
 lib/bitmap.c            | 17 +++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 7df1573..adafbcf 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -52,6 +52,7 @@ struct device;
  *  bitmap_complement(dst, src, nbits)          *dst =3D ~(*src)
  *  bitmap_equal(src1, src2, nbits)             Are *src1 and *src2 equal?
  *  bitmap_intersects(src1, src2, nbits)        Do *src1 and *src2 overlap?
+ *  bitmap_intersects_and(src1, src2, src3, nbits) Do *src1, *src2 and *src3=
 overlap?
  *  bitmap_subset(src1, src2, nbits)            Is *src1 a subset of *src2?
  *  bitmap_empty(src, nbits)                    Are all bits zero in *src?
  *  bitmap_full(src, nbits)                     Are all bits set in *src?
@@ -181,6 +182,9 @@ void __bitmap_replace(unsigned long *dst,
 		      const unsigned long *mask, unsigned int nbits);
 bool __bitmap_intersects(const unsigned long *bitmap1,
 			 const unsigned long *bitmap2, unsigned int nbits);
+bool __bitmap_intersects_and(const unsigned long *bitmap1,
+			     const unsigned long *bitmap2,
+			     const unsigned long *bitmap3, unsigned int nbits);
 bool __bitmap_subset(const unsigned long *bitmap1,
 		     const unsigned long *bitmap2, unsigned int nbits);
 unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits=
);
@@ -446,6 +450,16 @@ bool bitmap_intersects(const unsigned long *src1, const =
unsigned long *src2, uns
 }
=20
 static __always_inline
+bool bitmap_intersects_and(const unsigned long *src1, const unsigned long *s=
rc2,
+			   const unsigned long *src3, unsigned int nbits)
+{
+	if (small_const_nbits(nbits))
+		return ((*src1 & *src2 & *src3) & BITMAP_LAST_WORD_MASK(nbits)) !=3D 0;
+	else
+		return __bitmap_intersects_and(src1, src2, src3, nbits);
+}
+
+static __always_inline
 bool bitmap_subset(const unsigned long *src1, const unsigned long *src2, uns=
igned int nbits)
 {
 	if (small_const_nbits(nbits))
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 4c8bb69..7c8f167 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -825,6 +825,24 @@ bool cpumask_intersects(const struct cpumask *src1p, con=
st struct cpumask *src2p
 }
=20
 /**
+ * cpumask_intersects_and - (*src1p & *src2p & *src3p) !=3D 0
+ * @src1p: the first input
+ * @src2p: the second input
+ * @src3p: the third input
+ *
+ * Return: true if AND of the three cpumasks is non-empty,
+ *	   otherwise false
+ */
+static __always_inline
+bool cpumask_intersects_and(const struct cpumask *src1p,
+			    const struct cpumask *src2p,
+			    const struct cpumask *src3p)
+{
+	return bitmap_intersects_and(cpumask_bits(src1p), cpumask_bits(src2p),
+				 cpumask_bits(src3p), small_cpumask_bits);
+}
+
+/**
  * cpumask_subset - (*src1p & ~*src2p) =3D=3D 0
  * @src1p: the first input
  * @src2p: the second input
diff --git a/lib/bitmap.c b/lib/bitmap.c
index ed68512..d1cb8a5 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -308,6 +308,23 @@ bool __bitmap_intersects(const unsigned long *bitmap1,
 }
 EXPORT_SYMBOL(__bitmap_intersects);
=20
+bool __bitmap_intersects_and(const unsigned long *bitmap1,
+			     const unsigned long *bitmap2,
+			     const unsigned long *bitmap3, unsigned int bits)
+{
+	unsigned int k, lim =3D bits / BITS_PER_LONG;
+
+	for (k =3D 0; k < lim; ++k)
+		if (bitmap1[k] & bitmap2[k] & bitmap3[k])
+			return true;
+
+	if (bits % BITS_PER_LONG)
+		if ((bitmap1[k] & bitmap2[k] & bitmap3[k]) & BITMAP_LAST_WORD_MASK(bits))
+			return true;
+	return false;
+}
+EXPORT_SYMBOL(__bitmap_intersects_and);
+
 bool __bitmap_subset(const unsigned long *bitmap1,
 		     const unsigned long *bitmap2, unsigned int bits)
 {
