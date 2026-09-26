Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF923E342;
	Sat, 26 Sep 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386802; cv=none; b=CSc2sxa797oz9+pT1s+cDlDD8t8OhEidAA0PgaZ2LnMGA8xb0o5hh52xYNk5P7mEWwudcyreHlO65GC1zzuK5QNM7SfkQhx+D1Jd93g8Ah9IzRY1q+LBDi6JDlgRuCXYDeRnNYMx2YJqhrFuLDZ3QMJ/8F2oBpIjJNIgqdK3eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386802; c=relaxed/simple;
	bh=X3faKwDvWSThqPPI7PTR+IDDb6qKRyubeS4Cljfg/vI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=n1Bze5oIilGV81aTANiSp3kiSGo4YUXrv18XeTT1TY2hqoPFrpt8rOesc7GZIVuszPil+HANdDyUonX0pdXayyB2oYS9SNBIX6PE2qlpcuT5sOp0f8NfYL2SwweQp1P243e56uDiZVbPPkQ1DabN1OLEqrhcHNqMB/63ztlbyTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i/hoERwD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T5VxBVrj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i/hoERwD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T5VxBVrj"
Date: Sat, 26 Sep 2026 01:39:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790386798;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FI6ZPRsNX39dk6yPxQiU/HFth36sczoNAMpNlAENoIE=;
	b=i/hoERwDhTa8PVpq3KTOUCyPbo9kxPhIOIPw2ckSqSOw43GqrT5KCiNY3vNa3NK7eC4FUl
	VNKB/8bCsktoHeJ0xi2YNMgINYPL0Xssz+4d29q8xuOyfobcGFi9ztUHwfj1S0go5qT98j
	vM+xT38SxQbNhuXJzVyHWCmeyi91r0LcRQ5TUmf4pXJb7lEHkeC+2UQqXSePkRfpcO9TpB
	wqZR//eLP+dr00wBjB+Pz8SRzFHZKy28UJAJZZQVSqPtvdAaaWhh0wYBr5HMQr6kOmX2PE
	izHaIsCaJf66m81RS2qHJA2jYEt8dIZvZVTrmqzEbO/KTwLix4c2BGMiMBPoaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790386798;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FI6ZPRsNX39dk6yPxQiU/HFth36sczoNAMpNlAENoIE=;
	b=T5VxBVrjA7hTZMEyu7xoJ6pJsA1qIzf+uBA74wAgFlNhpgCeIvDRHytnVbpkWYW+N8/1cT
	pCmaQ1fhILy+HLBg==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cache] x86/resctrl: Update documented unit for the "activity" event
Cc: Tony Luck <tony.luck@intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915190431.18189-1-tony.luck@intel.com>
References: <20260915190431.18189-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038679694.3910103.13709225278150839530.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     a17d099481bd11f0911993a8e69992269f92ad12
Gitweb:        https://git.kernel.org/tip/a17d099481bd11f0911993a8e69992269f9=
2ad12
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Tue, 15 Sep 2026 12:04:31 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 18:35:50 -07:00

x86/resctrl: Update documented unit for the "activity" event

The unit for the AET (Application Energy Telemetry) activity event[1] is nF, =
not F, see
https://github.com/intel/Intel-PMT/blob/main/xml/CWF/OOBMSM/RMID-ENERGY/cwf_c=
ommon.xml#L9

Fixes: a8848c4b43ad ("x86,fs/resctrl: Update documentation for telemetry even=
ts")
Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20260915190431.18189-1-tony.luck@intel.com
---
 Documentation/filesystems/resctrl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystem=
s/resctrl.rst
index dd4f80d..b52795e 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -642,7 +642,7 @@ When monitoring is enabled all MON groups will also conta=
in:
 	during execution of instructions summed across all logical CPUs on a
 	package for the current monitoring group.
=20
-	"activity" also reports a floating point value (in Farads).  This provides
+	"activity" also reports a floating point value (in nanofarads).  This provi=
des
 	an estimate of work done independent of the frequency that the CPUs used
 	for execution.
=20
