Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A7638239B;
	Mon, 12 Oct 2026 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811496; cv=none; b=Ee7c4LwpFGYvzh9VJKvTvvebT8hedi6Iot52auum0qrokTv475bIw24e5YMXUG+3Ufs9uATdosr6n3aVqi6EyYXCG6Kzpt/XG5drWuDyIcUbqJS6hu0ACWDHlJRR4mLw6hr1P4GmEv+0/eENZB4L+q9HFR6gs12D7+8MQQWb6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811496; c=relaxed/simple;
	bh=6sW/OFnOSvI1Ws0Q7Mcwj4FMLFOBzO5zP3WV99RnxsY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IGOVZ4ruLKgZfzx/DPQf3NwnYDxvEvKvhn5RtJ+IVfanqeDhd6/ojOWsVrTY9ODiSB2hc2fQ1NehlQGYabc2FEYjVu1Aw0zdXzF+E98DQLcGWnMv867r93v721XMQ5W4GkV6bul+IHrjhT1z/Wud+4bJ8Ro1iW6qbyWCLAJSwzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NEY5bsz/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qlqf4DoR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NEY5bsz/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qlqf4DoR"
Date: Mon, 12 Oct 2026 13:24:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791811493;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeRZFULJ7sH1E4JnH8mxBN1MqhyS8qF0Nw9diqMv1rE=;
	b=NEY5bsz/v1/Qi+iaXEwUHwkpHZBePHaqoMNH9glFB0nrtnrXaDSFTMGq5KSTeyXuC6aPJM
	9GmXzP2iXmw2rcQdyXGKZfCEZq5pzC9njSSkEtrvQXgzdlC/53+L1p+5IZR4yHmwhPePpT
	/oA0ap8gx3J7RiPtUWRvy9VRprFJTqCpqrAHEXEsuU01+Rn/U7lOxj4AFqKKzXp0nvlcTO
	bHdUgRY7w/ot9MNTn1ia0t4LWwn7vqsVmNXL8W/uhIUzUoPzYQQ1IfQo9MWOI+r2veo/rg
	/s2OCF0S70eOUFhSo1PWdWxzTAoi8c7B7tK65EINVjK8qdCC1D1+nyz80XnArw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791811493;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeRZFULJ7sH1E4JnH8mxBN1MqhyS8qF0Nw9diqMv1rE=;
	b=Qlqf4DoRt4nIq5Gg3SzB5jh61ooyuXvlW3a6JZZ6a8g9q6r1sA459r0IQhRdo552YOAX9u
	hTBtu4RLZXTGpvBw==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/core] irq: Explain better on NMI_MASK overflow condition
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Boqun Feng <boqun@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001082519.16195-5-boqun@kernel.org>
References: <20261001082519.16195-5-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179181149170.1914040.15270963547534433489.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     1259028ec8f2a788cf560b40efca2c1fa74da89c
Gitweb:        https://git.kernel.org/tip/1259028ec8f2a788cf560b40efca2c1fa74=
da89c
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Thu, 01 Oct 2026 10:25:18 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 02 Oct 2026 11:47:14 +02:00

irq: Explain better on NMI_MASK overflow condition

Currently __preempt_count_nmi_enter() uses 15 as the maximum NMI nesting
level, and it's because 4 bits are used to represent the nesting level
of NMI. Replace the tautological comment with a more direct mention to
the 4 bits limitation to help readers understand this condition.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261001082519.16195-5-boqun@kernel.org
---
 include/linux/hardirq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 73b48dd..2648c49 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -108,7 +108,7 @@ DECLARE_PER_CPU(unsigned int, nmi_nesting);
 #define __preempt_count_nmi_enter()				\
 	do {							\
 		__preempt_count_add(HARDIRQ_OFFSET);		\
-		/* Maximum NMI nesting is 15. */		\
+		/* NMI nesting is represented in 4 bits. */	\
 		BUG_ON(__this_cpu_read(nmi_nesting) >=3D 15);	\
 		__this_cpu_inc(nmi_nesting);			\
 		preempt_count_set(preempt_count() | NMI_MASK);  \
