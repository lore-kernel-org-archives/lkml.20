Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960747;
	b=MtIGRBNHZJmUxL8UN/J7yFpuN7vEAA841soxY9FaLTjOX4h8W0kgapZRNUeqnU+FZkhR
	 /A5ITGJnH5Iljj4Oy+vVEyg/+vJURVTV8DTqe5hic+vhyLJ306UAb120JtjgC/vUySFmx
	 Mc9xive4nPyz5k5DdfNiXDJ25oshpjN6ewtc9XZD87m0k7yKv/k76WwBi4Pw211SIdO0I
	 gQkhDbJLn+5dVWwTZsvX18vzh/00w0x1jGjCiujMWNtXRoZKng4cD2RhgM4rgRn8VEbL/
	 jXDGsR7p778SBPP1oTiuhq+N4BCMfTsKW8Wv9GGS5FcVxV3j9aa1Dd9spnox8HL/GvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960747;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=1ydcgtTKwz0FcI1PfocsPHi803PZUU1xrEmoVcjpn4A=;
	b=3pQowZu3zhA8bW3O1vsdiLcl51fOukU/kbXDIohv+01+/IZAzgqf0rpupFr4ZRInqZ/z
	 Mf84pMHnLDQJTf4VpbTtF3P/+mfiPPU0uhFWNGnpoODftTbuSWzBIPqZigbEWw/3x2/lH
	 AdOfjEZbXcOgyfmCbHAee3mpjaRx47sRAWii/GqtGOcFy8xC4vgyeWsUyidKFQ3YbttNE
	 k94US0CSHBeXXI0wg++Ql+LlJCqsqzRK3mYbmeGysqbG3PzdCavn40/4j3IhmkdYvFsE/
	 cpyrtKm97HSajFAFZ2CMnfuSDzGBKqVzv+Z73MebFe9sLFq2An4WHtJlv5nJLDM/1Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AheFfBDq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4itHE4pj;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02859606EE80;
	Fri,  6 Nov 2026 10:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02859606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AheFfBDq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4itHE4pj
Date: Fri, 06 Nov 2026 10:25:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960744;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=1ydcgtTKwz0FcI1PfocsPHi803PZUU1xrEmoVcjpn4A=;
	b=AheFfBDqXqq11CE0rwEzsdi3i6pdk2PmjfnXVsfd5dvC82f6Is5+29sOjVWi+eyH0BAjk0
	KbU2H/GHE6B2oK8bNylaphbgyRk9ETIK0uZunPkPfma93TqqscVr5TasEDC/EPiGrislNq
	wxZgSJrCkGYjkCnAUnOCYbzZH9OqLetnyJ0SEbANrmS3ucr5BYB/1pL+p+qomgrX1EjhKi
	w8qwhc3K+xZvOT0QL2x9jyxlY2Yytje7S5gQrsM33SGLEsSigeEcizSzylBRFQZ3jRMMKK
	0oP+Bb7u7ZftClcM0M4ilCZ6OjSk5Qh7cJUDeng1kMCHe73JDiq6Id+XQcYwfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960744;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=1ydcgtTKwz0FcI1PfocsPHi803PZUU1xrEmoVcjpn4A=;
	b=4itHE4pjt+toTashpDBWiOmnt3SGIkwbdRgLHG8obPEQAn7M3H9PhWf8oW4qoM8ufDhdMv
	axaZlRuJ/vzdKMAA==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/core] locking/osq: Make osq_link_next() use smp_store_release()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Waiman Long <longman@redhat.com>, David Laight <david.laight.linux@gmail.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396074287.1009794.4185234247140128639.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     649dd027958996a1101f2187257fe9d65c761b4a
Gitweb:        https://git.kernel.org/tip/649dd027958996a1101f2187257fe9d65c7=
61b4a
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Wed, 16 Sep 2026 09:54:01 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Make osq_link_next() use smp_store_release()

Use smp_store_release() rather than smp_wmb(); this is slightly more
efficient on things like arm64.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 2bcc148..984fa11 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -129,8 +129,7 @@ static inline void osq_link_next(struct optimistic_spin_n=
ode *prev,
 	 *
 	 * Which would result in list corruption.
 	 */
-	smp_wmb();
-	WRITE_ONCE(prev->next, next);
+	smp_store_release(&prev->next, next);
 }
=20
 bool osq_lock(struct optimistic_spin_queue *lock)
