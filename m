Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7854078F3;
	Wed,  2 Sep 2026 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383102; cv=none; b=A9AJ42mdpYuQVmOSw0kWdPoUUQwmcsemEkYRrjI/yPnUGmGR9dIxyLGTD/8W6ypu5gw6wl62p4ZOeMSa0eMkNJOmc/lcZRi+rE8oUsqloCQQ82jEOtT5t/sfET5g4XPFWN6whiYW1IkPQTOUhiyKtpbKg4glZx7EVjU2lDNSqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383102; c=relaxed/simple;
	bh=1WWHxMibKuZlW0aGcCYi5iYPYr01/8WWeRoIBdkIbVM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ud8ZdH4gtAAoJcUEE8U/E3tuTVHk0Y4DDmsm4uLsAC5+LtZIgUQduCXAXAEhYeVQ/mAAUotABt1roJOVF3AUYi0ucOk0RSe1b1NEB+U87FPn7UzoROcMHtth9l6b0JmfqEzGPdosyftC6SzYRyrSEG/LBXcIt8ANViaQo2oJ3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EvZK4+YG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vdxnhokU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EvZK4+YG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vdxnhokU"
Date: Wed, 02 Sep 2026 21:04:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788383098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhm6INoV6RzU94+gwFhznkYGtmk1RS9B5DpDSXIYd38=;
	b=EvZK4+YG2quOSANfKzZL9Din3keHB30wyOT1ZXeMoxvC2MSEpklLVfZ8NiQFKIRt2p//8V
	V2tny8K+3QFfUmCporfgESC7sAX8mqBKkTJnJaEqSQc1S0eoHiJjlNHkUQhUkehWH7HMZR
	6nvGBDVF9cUaQP4+3rn2W50HCOiWm2opIqSJDsfez9a6YOlI4njfTTbXdMZCHjY4ssyzab
	35AEQ2A8BHBGHfIGRafqLahNdKdkLZlJ8AenztuAMEuttXrjZPBqSQZOi3jyyTWGpHvTKc
	krR23MLpcfFXm5Je+N3Vfk0FLVieYhHKvZdj1Gw+U89tnZEG8RhkAQmTc+8p9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788383098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhm6INoV6RzU94+gwFhznkYGtmk1RS9B5DpDSXIYd38=;
	b=vdxnhokU98C/GoThb5nH9X9MsEnbYZhas4iu1hmmBaHnCIv8FpKeVuLUXx4kpnv0QzWAqo
	5WL4Kl/zAO+oXRCA==
From: "tip-bot2 for Mario Limonciello" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/misc] x86/itmt: Don't make ITMT enablement depend on debugfs
Cc: Klaus Kusche <klaus.kusche@computerix.info>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260901123404.2503482-1-mario.limonciello@amd.com>
References: <20260901123404.2503482-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838309655.3717435.4361587240254160380.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/misc branch of tip:

Commit-ID:     4a673a0026b95030ee727f1f8578c46a42107011
Gitweb:        https://git.kernel.org/tip/4a673a0026b95030ee727f1f8578c46a421=
07011
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Tue, 01 Sep 2026 07:34:04 -05:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 14:01:08 -07:00

x86/itmt: Don't make ITMT enablement depend on debugfs

sched_set_itmt_support() treats debugfs file creation failures as fatal.
When CONFIG_DEBUG_FS is disabled, debugfs stubs return ERR_PTR(-ENODEV),
causing ITMT to be silently disabled.

debugfs is a debug-only facility; its return values should be ignored.
Drop the fatal error handling and enable ITMT unconditionally.

Fixes: d04013a4b21b ("x86/itmt: Move the "sched_itmt_enabled" sysctl to debug=
fs")
Reported-by: Klaus Kusche <klaus.kusche@computerix.info>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20260901123404.2503482-1-mario.limonciello@amd=
.com
---
 arch/x86/kernel/itmt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/itmt.c b/arch/x86/kernel/itmt.c
index 243a769..85ebde3 100644
--- a/arch/x86/kernel/itmt.c
+++ b/arch/x86/kernel/itmt.c
@@ -110,18 +110,14 @@ int sched_set_itmt_support(void)
 						    arch_debugfs_dir,
 						    &sysctl_sched_itmt_enabled,
 						    &dfs_sched_itmt_fops);
-	if (IS_ERR_OR_NULL(dfs_sched_itmt)) {
+	if (IS_ERR(dfs_sched_itmt))
 		dfs_sched_itmt =3D NULL;
-		return -ENOMEM;
-	}
=20
 	dfs_sched_core_prio =3D debugfs_create_file("sched_core_priority", 0644,
 						  arch_debugfs_dir, NULL,
 						  &sched_core_priority_fops);
-	if (IS_ERR_OR_NULL(dfs_sched_core_prio)) {
+	if (IS_ERR(dfs_sched_core_prio))
 		dfs_sched_core_prio =3D NULL;
-		return -ENOMEM;
-	}
=20
 	sched_itmt_capable =3D true;
=20
