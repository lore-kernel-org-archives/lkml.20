Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893D0382393;
	Thu, 17 Sep 2026 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610417; cv=none; b=jYhRHz9C8ajUtIo2MC0eo/QVBX8ZWDXkIs1YGCiF/7BJsIV5xZoIMS1HrENyzHYx1/9Ti74iKDMY0nqM5kuC0TQavmOrc+NvkmPLrI5jCdWqaABdsI3STHtL+Izgu51Ke6V0E+gwLmcwROnkMSUaHzmMHF28CXbJ6LHfQ2Yt/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610417; c=relaxed/simple;
	bh=TNHXrZlH1RJynPxVO/9ChsnkSYMz3tDJOEYYygVBzoQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=l82dT43r5yGWBfNKFfg9KfXrd47/jW6gZ9y6relV8/QqTPjSaNmcDXaFDfujDct9nyOADVFd2Uhmmmli4Vz31hAnDjpzmMElzF1XPQXKor0ML+82mB943hbkm/Ss8GNSwMo5eqRQAFW88q/InH0JlqybB6eTfoXbhN4JYvydzjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nwn9NiXP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gbhWzbLe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nwn9NiXP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gbhWzbLe"
Date: Thu, 17 Sep 2026 02:00:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789610413;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxOmticRZkbfdHDa69FhkiIkb0eFioxY9baitoetXCc=;
	b=nwn9NiXPkzaTiseOocYqJoqaiyeEAcv99jtRQivKD1ZUDLb/CD+qUO8ZUSfX8kROv4JTCC
	jXE6tGRjTviCR+3dSnlHMtdcDQpzBOIjYcLXhNPZZ94CwflCGREptV0/UHdIkCHS7Be5jY
	kWywZaJH/UFnrggWBwYSw0SX+AQtYaTAoY0JaZD6ZbqTP9KUpCtGyDuKoD63Fwvo/PLbxJ
	0nIZY5mjD/0/K5qONHkMigl8ydXd8qg80F6Snlv0np13bLubfeAbKOriDPGUr/1D3cTHyE
	Fi1y/OkbkkVwPjuzoi8ip1fFwh9A4NZkIUs3PkDjtJd1n00mNRc1yfYnvrw47Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789610413;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxOmticRZkbfdHDa69FhkiIkb0eFioxY9baitoetXCc=;
	b=gbhWzbLeQwf+LzKtUfHx5R40mflxj/TUwj8kBnJoYXniHN3k3N2+mkgx1b0NwZIc+uEcdU
	qtV5DUtFA/nH9hCA==
From: "tip-bot2 for Ihor Solodrai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/cpu: Initialize boot CPU cpuinfo defaults early
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916195203.1099646-3-ihor.solodrai@linux.dev>
References: <20260916195203.1099646-3-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178961041179.1720534.16078168305924537867.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     7a762b51a149b7bfe431a7571bc7df4beea52e5c
Gitweb:        https://git.kernel.org/tip/7a762b51a149b7bfe431a7571bc7df4beea=
52e5c
Author:        Ihor Solodrai <ihor.solodrai@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 12:52:00 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 01:57:26 +02:00

x86/cpu: Initialize boot CPU cpuinfo defaults early

early_identify_cpu() clears the capability array, the CPUID table and
extended_cpuid_level, but the architectural defaults for the rest of struct
cpuinfo_x86 are set only later, in identify_cpu().

Use the same defaults from the start, so that the boot CPU does not
depend on a later reset to end up with the right ones.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260916195203.1099646-3-ihor.solodrai@linux.d=
ev
---
 arch/x86/kernel/cpu/common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 173748a..d1a949a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1814,16 +1814,15 @@ static void init_cpu_info(struct cpuinfo_x86 *c)
  * Do minimum CPU detection early.
  * Fields really needed: vendor, cpuid_level, family, model, mask,
  * cache alignment.
- * The others are not touched to avoid unwanted side effects.
+ * The others are reset to their defaults here and only filled in later,
+ * by identify_cpu().
  *
  * WARNING: this function is only called on the boot CPU.  Don't add code
  * here that is supposed to run on all CPUs.
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
-	memset(&c->cpuid, 0, sizeof(c->cpuid));
-	c->extended_cpuid_level =3D 0;
+	init_cpu_info(c);
=20
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
