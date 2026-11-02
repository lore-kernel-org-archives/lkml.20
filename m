Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591823;
	b=V8H+rIqfLc3S6D6jJ6BP2x0W1Vzg4l+65U6LvkZqjZTcnblsrY+3+pXdA5t5Ff9/3Gwc
	 PYqCd4QlEszC/jwoHUi+vO3c2FfuxWnbuCxpDdMzroJlcvN9Yls68nJPLDyWjF6CRGzeX
	 IVZBai8xOnKsUefuY5o9YM4qaE0tiP3Pzeh2dEmbC5mQh0Qyoa4lT4M/N5UoTo1IzWDJR
	 31GCzpoxpR4EQbycGN1peE/tl7yE9sU5oHSvO+s6QZ2exI/ocwyz4lqaFnE054itnRILs
	 Rfe18BUmpFof89awh8oR7MFT8E9KaQIvxUBspQefeHAc/0TxVEJEeEqFAOGRlIpk2fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591823;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=D0zktkAlQB/6L4voGadScyFS/B02kpVhA6tdSqhrxUw=;
	b=Nz6OCKxNemDlj9OnrBbPao+71ZvkQ29x++yIoeqQY41enxj96A4ptwyoheFd1jqAaKko
	 Bj5ejI+mfvw4SJVVwvNdwkbchN+274VuKieCKsX1E8aQhTf371HCDa87DGNpKFpwo3PBN
	 gyfiS+kAqjXx+Dz7w7HRuYwbHToOY5mhivPyXtx2xncOWvTtNS2CRu+4gteNBCIeaL3Qc
	 UDZ7pFbLtYLIWtctFvZEbw/0YVvqiqPVwiWIDoumxiiv0mlM0NbXUzmuqPE7bWH8FE6E1
	 4iLn3To+wo50gKg3vG+w/Ubns23h+M+GgSIpKggQsR4F3PGJt9jYY8DagwlqH0hwvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WNnO08ac;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eDozX5Sx;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C44606A333;
	Mon,  2 Nov 2026 03:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C44606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WNnO08ac;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eDozX5Sx
Date: Mon, 02 Nov 2026 03:56:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793591821;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0zktkAlQB/6L4voGadScyFS/B02kpVhA6tdSqhrxUw=;
	b=WNnO08ac+WXsX35lJJ5tImdundePxjjRlHO86RuzQmLgUJ1Nuy4S6Gdu5v2dDb7iqZPXTe
	gDzLZbzJfj+CvgqD0pWchUA+n33TVbEzBFKL6ACD6P7jdEhIOKZmj5mi6eqf6oaKT4wLxK
	plwniD0ZcZWbzs+3Y/8MKr2SCTPPORr9ZoUhyDinZ3rjPufOhU6WeTaZiC0WzpfT/FJ3wh
	HaUjBr6H+OxqRI/zA2rK1Ywxf+TdOWBTjoMW3PVFuFhWv9iwdcg4aCKuiVVZQxJwYy7rda
	CXrqVQEi+lY3h3vkMr0K03JW2W41NTz8171eY2AOVKXEfqPOlcDRIhpEj197/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793591821;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0zktkAlQB/6L4voGadScyFS/B02kpVhA6tdSqhrxUw=;
	b=eDozX5SxwUsW+P6iHT4MNPnSNZvXofMFiihxuju9s5HIONy8KxM93h9ETt9BKJofRhZtCs
	bwhQKjRiDY0dn3BQ==
From: "tip-bot2 for Breno Leitao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/bugs: Select the BHI mitigation based on the
 attack vector properly
Cc: Breno Leitao <leitao@debian.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 David Kaplan <david.kaplan@amd.com>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
References: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179359181952.1009794.12667029725374386792.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     3457b3bcd344005af894876cab4e634cabdcbb62
Gitweb:        https://git.kernel.org/tip/3457b3bcd344005af894876cab4e634cabd=
cbb62
Author:        Breno Leitao <leitao@debian.org>
AuthorDate:    Thu, 29 Oct 2026 07:45:03 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 01 Nov 2026 17:32:45 -08:00

x86/bugs: Select the BHI mitigation based on the attack vector properly

The BHI mitigation selection is inconsistent with the documentation
(attack_vector_controls.rst), which lists BHI under both the
user->kernel and guest->host attack vectors. bhi_select_mitigation()
only enables it when CPU_MITIGATE_GUEST_HOST is set; otherwise it
selects BHI_MITIGATION_OFF, even if CPU_MITIGATE_USER_KERNEL is set.

As a result, a kernel compiled with KVM disabled gets BHI automatically
disabled, since CPU_MITIGATE_GUEST_HOST defaults to off without KVM.
This is a bug, given that CPU_MITIGATE_USER_KERNEL still needs it: on
affected Intel CPUs these kernels lose BHI_DIS_S or the BHB clearing
loop by default. Booting with mitigations=3Dauto,no_guest_host has the
same effect.

Select BHI_MITIGATION_ON whenever user->kernel is mitigated, and keep
BHI_MITIGATION_VMEXIT_ONLY for the guest->host-only case.

  [ bp: Clarify commit title. ]

Fixes: ddcd4d3cb37c ("x86/bugs: Add attack vector controls for BHI")
Signed-off-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: David Kaplan <david.kaplan@amd.com>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/20261029-bhi-attack-vector-v1-1-29cfa697efb6@d=
ebian.org
---
 arch/x86/kernel/cpu/bugs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 000ebee..4ced10c 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2088,14 +2088,12 @@ static void __init bhi_select_mitigation(void)
 	if (bhi_mitigation !=3D BHI_MITIGATION_AUTO)
 		return;
=20
-	if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST)) {
-		if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
-			bhi_mitigation =3D BHI_MITIGATION_ON;
-		else
-			bhi_mitigation =3D BHI_MITIGATION_VMEXIT_ONLY;
-	} else {
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
+		bhi_mitigation =3D BHI_MITIGATION_ON;
+	else if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST))
+		bhi_mitigation =3D BHI_MITIGATION_VMEXIT_ONLY;
+	else
 		bhi_mitigation =3D BHI_MITIGATION_OFF;
-	}
 }
=20
 static void __init bhi_update_mitigation(void)
