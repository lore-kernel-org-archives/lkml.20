Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170436CDE8;
	Wed,  2 Sep 2026 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333728; cv=none; b=XXCLssf4/Ukm90/AGLZ11AUfT1mtrOiJ4rHdNZ39S0Kk3p4uGvPWRpZHgGU6HSBNSiYMQj0gtgTuz3po+8g6nb5Rbnh4so82ita8ES2k6ijmY6t1oiX3oRDPGfjg0e2cos6uWFPWhIAdhunJpHIKdtjxFApXBS3IU8Zgd+Ugnfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333728; c=relaxed/simple;
	bh=EmZl0ZS1VDnyvucOt3Ck3a3qZznrqqI74nTNf/CgevY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nDVJ8DfU8GCsdnW7PkmYs8+6MZyqUwCihvde6LwmiVa1YbwCBGbT5Z2jn/WOlSd/g3OQauUX5Varhd+qWzSDLwHwEl615IJL9FAtCv/scS/phgS8KCY8JhBqPozj62T2CrniqovWwwQaZl3vdSxR5/AkF0aqG0N3KmOA1BYLC6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yb19/3Ov; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XP52FzDG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yb19/3Ov";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XP52FzDG"
Date: Wed, 02 Sep 2026 07:21:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbJ3Bapz+ZTAEX4xEcu94b1/6ANBXQSP6JzcY4tESSM=;
	b=yb19/3OvrwTEiA2mdA012+q7Q2NCbSYqN11UxXLpAQ5z2SJpIpd9M2qwNoc64PoKQZ0KEK
	+qTKzZS1DkdeEVXjBN35AA7y9hf39xAEhvm4ve2GpXb1Mx59QvVW8tvS5RR9cLwE1It0Br
	/ueg81YRSaW7UtKI76Pu5FebKj/Z26S+tw2vRe26yT1KrIZ5MzzSFr+wKibgGBhaE7aHPu
	j6aEtQ8lDuHamuDPSJsa+pLnj53pZgbmWFwvpFL7K1Z+1FW2kbjMR4qy9RJM+whNurstQj
	7QPHCNg/WGjxLur/8/I0WnQEB95jmVT0gMbQG178/qleVBfJ+nrAOS6cacfKjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbJ3Bapz+ZTAEX4xEcu94b1/6ANBXQSP6JzcY4tESSM=;
	b=XP52FzDGhRWi0WIR164WQcYD1+1Ur0LfuFrVZIRvQeiqWGJ8MySvFy4MOtz1PDmBmhzWFQ
	FAY/ESMo2w9gdNAA==
From: "tip-bot2 for Mario Limonciello" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] x86/itmt: Don't make ITMT enablement depend on debugfs
Cc: Klaus Kusche <klaus.kusche@computerix.info>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260831053836.1881864-1-mario.limonciello@amd.com>
References: <20260831053836.1881864-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833371754.3717435.9667599490613115794.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     eaece4849991d62fcd6f46637c55dcce00e25d70
Gitweb:        https://git.kernel.org/tip/eaece4849991d62fcd6f46637c55dcce00e=
25d70
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Mon, 31 Aug 2026 00:38:33 -05:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:50 +02:00

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
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20260831053836.1881864-1-mario.limonciello@amd=
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
