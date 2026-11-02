Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655322;
	b=WAYaeHKh6jD2Ol9Di+t5ypZoiB8YlgQZWTMtUAeeoYQpny3pqEQb2buFs5n3ihWlPHQW
	 YolSb8tUysXhEzNL2KNvVOo7jSa6r5X8NReKjskJKL2ysEAM3LGwZfcQZ93qQiS+fts8a
	 q48V7YvwfB9BhXajHipD5tyopohQ8MXfO3BouzHT1U4ZvWLMR5EgYqtR6fi/tR4kVn0kS
	 Npz/URdKuAOjMctzVQrlrmQX68udTVlk1NsVkRXwjVS2AS7XnNsMdKU+nZsl8KSHrLx3d
	 MohJhvtvQV+Gme3i4QV/jmY4STCZiSYyTYTm3he8gF5nBxjrmu50+5Kmc0R9dz1oI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=FM9EOPPGQK8Fq2ECpiXi34LkylYkFVvp/oBKHFJxL+E=;
	b=L2TQO/STDac/nZLG/tla2cGSTygwojFB2HY1cv4veb6vYv6ZHyEHyj48ad3CMD/Lo1Rr
	 bgFKYAQUITZblmT+dQB9cRpHjy5LorXuYnAV8JT77lnVm4W4lxiTytn1QYoU8ksgx/5QY
	 +M8eNrDi+qin4V6WKbJXthyRfl+Ja+t9P9lmtfjpQ7WtpnpX15bTsMfRa5MLVHzDXA/yW
	 3RR07hiS2yguWAe7zB8CdOGecCv7d19ks/BKMnT7KzfmGbN40BEqTXeG1d0XQ1MzY0Ley
	 hslfcdogV3p+bGeoISUI9E4QKwhMektwXM2mJ/STlW3KoyabFWdrUOEbf8LvQLOnz0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=A0P3eeVJ;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D9606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1D9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=A0P3eeVJ
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3Y536cz1XLkv4;
	Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655318; x=1796247319; bh=FM9EO
	PPGQK8Fq2ECpiXi34LkylYkFVvp/oBKHFJxL+E=; b=A0P3eeVJfQ7Bh4ZiREKlR
	ZbFhD/vg1VMwU6oF+lbsJs9Csmm6OjlEFl7cHpTI1wUuCwrdFD5Y1ZNHymiwJxia
	RxcwzRjugsx6QF/0tsAN72ZwhesU88H/qbqPAUV7Vnimhiz/IRuH0YQ/Y9XWNlvN
	JmP938HnGIL9PtrzxOIHQHoZ+lk2LgdqgjVD+dMeZxjxnQSS5uT1e0HESlL49Ko2
	oiGXAgkHCHrlQTbTEJc4M+TW0AuAC/yEIPqjaO8BMa3IyCCOQk2/Z7WJAEKHbx4P
	0HKtrCJYImJH0qtbtprAwayTefE/EgYJDHMODvW0ij3cHNYtIUqd4MReTn5UF0P2
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DFmV1Qq-SiYZ; Mon,  2 Nov 2026 21:35:18 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3T5nLHz1XLkt9;
	Mon,  2 Nov 2026 21:35:17 +0000 (UTC)
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
	Christian Brauner <brauner@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 02/14] cleanup: Disable context analysis for __free() helpers
Date: Mon,  2 Nov 2026 13:34:32 -0800
Message-ID: <29bb5eb2d66f7f59d6d585a44a10cbfe7984a4b9.1793654853.git.bvanassche@acm.org>
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
