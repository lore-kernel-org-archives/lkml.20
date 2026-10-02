Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFD40F72F;
	Fri,  2 Oct 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934257; cv=none; b=tZVkJkwvIgQ6WZ9f1Rhi55L6BB8U6EWq5eH+ZuVWTActY+VDsRO3KfgICBNMEfUNicb3Rp0XRljIY+AoMMGgqTkpASA2ptgyD9RUwBk4WtYyY0APqIjhOILxgT/3XmmT7Z1nlIIVx2h1YQ0yu6yXCpmCmHPzARMv2tLbN8LlTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934257; c=relaxed/simple;
	bh=jm4lOPh1T/gf7082+1+xGnUYEcq/ZYAKjDGNDYzMlOg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=O4YfdffDPoiKuy8klC0m3Y7EJyZ7+DDJhNhy9ZQzpLJOmYrKSpSsQ4el3JHoPvKmmPTQ8FWbqWGG4iFchwbD1oM5llXqx1XeNzIzhQps23J+k8c9NOqHpMVEsnVRxGjUaRRnTJUgqzGqWcvN6zPtkFKKywXhaNL7A3xP+GKF1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yngEHroT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+N5mt18x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yngEHroT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+N5mt18x"
Date: Fri, 02 Oct 2026 09:44:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934252;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeyPJqzr2nLu4R9YE7CzVqPqDMA33ld32u8b98Pwb00=;
	b=yngEHroTdjJ047+oBw67OJ6SfLH2WvM3ca0OnpDyYE7gJVLpjwOvvlcdMiqBC8Szr2RQ5w
	ekr4LedhKbWTMN08CCrlp7lAnzt23ufeK5RMSFxQz/Yfs9es8gbjoyahz8i8UcWNmnCp21
	C49guZ50Usscn2WLUjB4PzPMO7+mVOpgnSltjAuE66KSPp6WYBP5CEh2avFv2kmicuQRn8
	LQphjKwLw7uCpu5irJGPN3CYrUWvbG54Meq310JXdrXvcmNb6+Wk/HxH8wETqiLeq4RC7Z
	KTsVVmkuHmKM4OCi61u49nCYzlisYojkOPQVEGKV0O+cB5OeIIFVwUHDhVLTQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934252;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeyPJqzr2nLu4R9YE7CzVqPqDMA33ld32u8b98Pwb00=;
	b=+N5mt18x/uFXUPLOMYc2x76WPgdJcKRkKo3LarHi9kVeClHvfdLlDetJ/39LEPvLcU6rCF
	O2mUj9hwVTAeSTAQ==
From: "tip-bot2 for Kuan-Wei Chiu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/urgent] irq: Make refcount_interrupt kunit test selectable
Cc: "Kuan-Wei Chiu" <visitorckw@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lyude Paul <lyude@redhat.com>, Radu Rendec <radu@rendec.net>,
 Boqun Feng <boqun@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001082519.16195-2-boqun@kernel.org>
References: <20261001082519.16195-2-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093425037.3910103.13388277112184368036.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     26f6b6357b1b06e6aaa9b8d796989cca785d8e1d
Gitweb:        https://git.kernel.org/tip/26f6b6357b1b06e6aaa9b8d796989cca785=
d8e1d
Author:        Kuan-Wei Chiu <visitorckw@gmail.com>
AuthorDate:    Thu, 01 Oct 2026 10:25:15 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 02 Oct 2026 11:40:12 +02:00

irq: Make refcount_interrupt kunit test selectable

Currently, refcount_interrupt_test is built unconditionally when
CONFIG_KUNIT is enabled, causing it to run unexpectedly during boot.

Fix this by introducing CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST so the
test can be configured independently, following standard kunit
practices.

Fixes: 07a88e2bcd5b ("irq: Add KUnit test for refcounted interrupt enable/dis=
able")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20261001082519.16195-2-boqun@kernel.org
---
 kernel/irq/Kconfig  | 12 ++++++++++++
 kernel/irq/Makefile |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 05cba4e..6923f37 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -150,6 +150,18 @@ config IRQ_KUNIT_TEST
=20
 	  If unsure, say N.
=20
+config REFCOUNT_INTERRUPT_KUNIT_TEST
+	tristate "Test refcounted interrupt enable/disable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the kunit tests for the refcounted interrupt
+	  infrastructure. It verifies the correctness of single, nested,
+	  and multiple interrupt enable/disable state changes and ensures
+	  that the underlying reference counting mechanisms work as expected.
+
+	  If unsure, say N.
+
 endmenu
=20
 config GENERIC_IRQ_MULTI_HANDLER
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index 44c4d6f..0e5df96 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -16,4 +16,4 @@ obj-$(CONFIG_SMP) +=3D affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) +=3D debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) +=3D matrix.o
 obj-$(CONFIG_IRQ_KUNIT_TEST) +=3D irq_test.o
-obj-$(CONFIG_KUNIT) +=3D refcount_interrupt_test.o
+obj-$(CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST) +=3D refcount_interrupt_test.o
