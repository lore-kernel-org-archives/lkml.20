Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251634;
	b=0ujt5aqQn9qiJD9NhBI/0gXoKHhSjiPCCYc4+z1iGVz/bZPpQ20XsGMQF1MmYN6RAVxe
	 DoFmzO3HoTZFVuWJ1R1oWrAJh8R+mjngAKpXxHI7dBhZqtctE0Lv7EMFkT/4ZFKWcElju
	 v0+kF1OxLsyI2M35p97Mp7OaDeKOtjNeeS8ojt8xZ+9nTBaxr9AOUtfU4Ea3jd/hVi3ji
	 3/ivZ43LFBrIJBM1nIQkHDhUwYYYEEgyUjg27Xv3LRO16NvCmE1zA1oL9MZ9d6qRPUrNW
	 rX/wX7TEXq1pNZVypiBR1O43hN1VrnxPp0fqKRp/eaYfxhvl7C+uiBbxo0TaSLDx0IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=96JoEw+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=;
	b=0lrp7zU7lRVqj4zJtLbO8MUFRtDVOjnABTEn3OyA3NtLOdmy80Kgn+nMkLfOegRVb4kc
	 8wATShmbbC7CzV/NTAybGCIzG48ZvB6lLvIExVMWVA8aKJv16sEJe4jugY9owVRKrGVJs
	 TfgPEaMzuw8zwxXPlaHtIE4pIbohBYviOyeWgU1dYxeomEAgLcEQc7N5CCtddsmjg5fyB
	 8SO2ofGDlarDEdxh6ShrNEboJppsWyTeR8fv5hf4k92ryu2G8hMhdoth0MIN60pfjPSXH
	 S9OXT/7wk6FipcAtmQuMJEQf5B5kG/Ax2+CjSbrGAWQBGW6ZZIYggs09+ePXW9PiTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=DE4lnKSm;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB203606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB203606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=DE4lnKSm
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfb51kf7z1XM6J7;
	Mon,  9 Nov 2026 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251630; x=1796843631; bh=96JoE
	w+w4/NbLbMkquuiq92V24jCwt/1ENl+AiCYq2M=; b=DE4lnKSmIQA+vltp0pHLc
	iOz87e+hS/P6VHmBE2rdWBpCkC+v0YVpo/+60vz5+VJwNP1LZrjmjPhwv1Ydfpig
	Hnbt5OT2zLo63PJNfYtXloGbmkt8a2v5DvmLvMqnunN4b9CcAKFJ2k3pTXJZQzqy
	3vkUtjUbKw+LzRm/OupwvpBYMGH76Hn19jaam/6QkU6vv7YSs2PtgWvTT56j//jE
	xyy11JXNbty/SmH34d4vTFefzLGfyBfiYEe94P0LLIhvSEotxGwd4kOTIXK/s+46
	TTKvOos3YGLicNKgV1jDlihg+Y/ygAxLyAI1TJdP+RCTmkLD9+7T+Q3LP32SDymF
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rj4wVJ3586jP; Mon,  9 Nov 2026 19:13:50 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfb20LCMz1XM5kD;
	Mon,  9 Nov 2026 19:13:49 +0000 (UTC)
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
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2 01/14] bit_spinlock: Fix the __bitlock() definition
Date: Mon,  9 Nov 2026 11:13:09 -0800
Message-ID: <3a7624716aead448bb8bb43722d3a228fdbb8fd2.1794250850.git.bvanassche@acm.org>
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
