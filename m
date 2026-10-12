Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFCE381E94;
	Mon, 12 Oct 2026 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811495; cv=none; b=XQa6tSBzO8gcUr4KzGWABYLHCMlaotAAHvUahT/AxvodscMfsLFeiMSuxMksbP1YBWs3zWu5Z9MOcuuUTqqQ7k3H+MHyGn3NHNVJm+NWZSbXNinLj12Q71PO8V51zdS3mNHU2YRehBcFLF8TXL4VvLA2kKV7wHIwB4KCkBT2CDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811495; c=relaxed/simple;
	bh=oLtecBXVphHGoCdGZe18lHmAhRPmkDEtxEkWqK0hKZk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mAV+Axxz1UZGv25nUf//l+vkp52FtVE9il6JBGHBFxQ6nUBlO5hVQDTkegufFGPJUfJ4vbQN6nLORFM6nigwAE8sTJh36J31WJyCquunYGA/6eNruj41/5TYK9XZRpmSOw6IQDaWHFb9hRZHPyZ4BAMn2cmq74AOCmzqDg/0jXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dooqetVY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gRxmvnPr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dooqetVY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gRxmvnPr"
Date: Mon, 12 Oct 2026 13:24:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791811492;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi07Lm+aeO+o5+MjxWZckXjy1Q1BCsWN5FFHp/8z09E=;
	b=dooqetVY4/fRhOgMDWm9wIS6rwcb9/RqJl8z73fJ5YAhBSCbgDZBS9hn+mZmokJA2t7nY8
	IrJauRGyWfdjIRV13okQzA5S0UdMmB88Qk8RRlI5noopPsIluNNp5uIYSxrzeK0kjQkbaT
	o5MOxgxraWjLSTjGIzb44fN5IhSeD55pOyE3Qv0UVwudknGuzCWSKGYsQkdLAsoFeRZEdZ
	EqqUsKsiOSv7X8LeKM9PBJlu+94fEgjXGag0DHTDtrqSxqvnzASRrjm2ZA1k+M5rcy3BDE
	9gs70mTA7XNtpQuZ4d55dNbuXdIS/I54aTXlcB3V5Sj/KzJ4l6BYW7vir39AXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791811492;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi07Lm+aeO+o5+MjxWZckXjy1Q1BCsWN5FFHp/8z09E=;
	b=gRxmvnPrEYzzfPNCrAAlyqk7uwS86KV0U+R/pf8tWDcVCXIDYBF9vb7rlOA7wanEEhyT6j
	IzQQsoHuXUw5BtBQ==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] irq: Add max local_interrupt_disable() nesting
 level kunit test case
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Boqun Feng <boqun@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001082519.16195-6-boqun@kernel.org>
References: <20261001082519.16195-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179181149013.1914040.7206186420937751362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     67e0eadd862616cb22145d6117b79b79c4ae48fe
Gitweb:        https://git.kernel.org/tip/67e0eadd862616cb22145d6117b79b79c4a=
e48fe
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Thu, 01 Oct 2026 10:25:19 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 02 Oct 2026 11:47:14 +02:00

irq: Add max local_interrupt_disable() nesting level kunit test case

To confirm the max nesting level of local_interrupt_disable() works, a
kunit test is added to the whole test suite.

Note that when DEBUG_PREEMPT=3Dy, it'll generate a warning which is
expected.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261001082519.16195-6-boqun@kernel.org
---
 kernel/irq/refcount_interrupt_test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_inter=
rupt_test.c
index ca904db..38dfccb 100644
--- a/kernel/irq/refcount_interrupt_test.c
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -52,6 +52,27 @@ static void test_multiple_irq_change(struct kunit *test)
 	TEST_IRQ_ON();
 }
=20
+static void test_max_nesting_irq_change(struct kunit *test)
+{
+	for (int i =3D 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		local_interrupt_disable();
+		TEST_IRQ_OFF();
+	}
+
+
+	for (int i =3D 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		TEST_IRQ_OFF();
+		local_interrupt_enable();
+	}
+
+	TEST_IRQ_ON();
+
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
 static void test_irq_save(struct kunit *test)
 {
 	unsigned long flags;
@@ -79,6 +100,7 @@ static struct kunit_case test_cases[] =3D {
 	KUNIT_CASE(test_single_irq_change),
 	KUNIT_CASE(test_nested_irq_change),
 	KUNIT_CASE(test_multiple_irq_change),
+	KUNIT_CASE(test_max_nesting_irq_change),
 	KUNIT_CASE(test_irq_save),
 	{},
 };
