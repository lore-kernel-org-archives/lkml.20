Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8B4477FA;
	Mon, 28 Sep 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578879; cv=none; b=FektQQIHytRPx7diH5gEciFLynx0w6y4lxy99f5CXQGAAdK7yQHlBtKlw7KxEhPhQz732tqjWVwpyhxA3oUmMpSyTgWTq8Tq/e5P3EXWLPaD0jexbXatKay0XkYMw63i43Tsipq+MtTJQq1ZlXbyPXe/keZ1F4rQv3Re2AbNTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578879; c=relaxed/simple;
	bh=EF1Bf3xRgXVIHoFpUWDsoa4yst8iMEJYPNjJYnVLq9s=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cIRcx3hgwf6D2naEm5sT9Tz+HNfGw1UCNPms3Z3xpBjMyr/JjYh/nX5yY1Po6XnIGp7uMM17BKprswHbiOMqC4YF3lrJ+PXGBAl5rYT1dJIyewfq0H2VjA/QxQH7VJta0GeRkKvas8gJCMgON2BlC2bFZAF46pUYIdemXfjLBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GTrYh6Sh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qmOblhSw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GTrYh6Sh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qmOblhSw"
Date: Mon, 28 Sep 2026 07:01:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578875;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WR0BbJxSRhA/IwKshEd+JistSb1mVklr7TKv6Uvn6LU=;
	b=GTrYh6ShNFYlw7ljGazNeXHJ7rEWgYphGpttl9pHxZgVFQVpkQlqAKjE3kcHKsGmpCkMhK
	p7vFbVMbRzu6+Aeh3G/psr5ntmluf0quARly19clR5TwW1K24vSknimg8TcPVZztXqi756
	QXPpqgWLuyKfDgRUdMwLJT+S1jWMuT6t/3r58mw6lGp1heHkopv8S3g68TIV/gqMa1ARek
	JOPC60alAnl6w13DO/GDd+plyfpHXiLS0yFClDgbWQMHz+R1z7umVJJTpvod44Nezy7nuF
	1ZgC4+1ONlFvm7B2AIQyr2p6EL50lUxZgsV8X2CbZJfvKzZ/JAvkKXeQ6zYqDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578875;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WR0BbJxSRhA/IwKshEd+JistSb1mVklr7TKv6Uvn6LU=;
	b=qmOblhSwIXbAWrBApGXiRDNNNZPJYPx5ODxudtBeYpAWsKGrN0sfbhmy/pri0fLE09nAFH
	ERUciPdPTBukYrAQ==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] virt/steal_governor: Enable the driver
Cc: Yury Norov <yury.norov@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-14-sshegde@linux.ibm.com>
References: <20260928053728.797539-14-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057887339.3910103.9119829101987077047.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     1fb28c664a19df8d45a6afa04d28d102b04ea680
Gitweb:        https://git.kernel.org/tip/1fb28c664a19df8d45a6afa04d28d102b04=
ea680
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:28 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:44 +02:00

virt/steal_governor: Enable the driver

Provide a config option to enable the steal_governor driver.
Since the feature targets paravirtualized environments and requires SMP,
enforce those dependencies. The driver selects CONFIG_PREFERRED_CPU
for the core scheduler mechanisms to work.

It is recommended to build the driver as a module (m) instead of
built-in (y) due to the following reasons:

- Module parameters are read-only after initialization. Building as a
  module allows updating these parameters by simply reloading the module.
  Default module parameters cannot work in all configurations.

- The driver can be completely disabled by unloading the module.

- This feature works best when all VMs operate in a cooperative manner.
  Requiring an explicit module load ensures intentional deployment
  across all VMs by the system administrator.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-14-sshegde@linux.ibm.com
---
 drivers/virt/Kconfig  | 17 +++++++++++++++++
 drivers/virt/Makefile |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 52eb7e4..eeb84e5 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -41,6 +41,23 @@ config FSL_HV_MANAGER
           4) A kernel interface for receiving callbacks when a managed
 	     partition shuts down.
=20
+config STEAL_GOVERNOR
+	tristate "Dynamic vCPU management based on steal time"
+	depends on PARAVIRT && SMP
+	select PREFERRED_CPU
+	default m
+	help
+	  This driver helps to reduce the steal time in paravirtualized
+	  environments, thereby reducing vCPU preemption costs.
+
+	  By default preferred CPUs will be same as active CPUs. Depending
+	  on the steal time when steal_governor driver is enabled,
+	  preferred CPUs could become subset of active CPUs.
+	  More details are at: Documentation/driver-api/steal-governor.rst
+
+	  It is recommended to build it as module and load the module
+	  to enable it.
+
 source "drivers/virt/vboxguest/Kconfig"
=20
 source "drivers/virt/nitro_enclaves/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901b..05fb075 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -5,6 +5,7 @@
=20
 obj-$(CONFIG_FSL_HV_MANAGER)	+=3D fsl_hypervisor.o
 obj-$(CONFIG_VMGENID)		+=3D vmgenid.o
+obj-$(CONFIG_STEAL_GOVERNOR)	+=3D steal_governor.o
 obj-y				+=3D vboxguest/
=20
 obj-$(CONFIG_NITRO_ENCLAVES)	+=3D nitro_enclaves/
