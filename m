Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958628;
	b=SQ12kYWfRmyZHhQj8NUWFpBxdHTZ0Pf69nlNgTv/neM/s0GquAlO+soJ5vhW9UwZ4/gC
	 du8NMXyctmY0xQBTeaYayMGU3i9+tIMr8OaR3oN497XN4v1BBbhjtA48/o/Ul0E1stioA
	 FwmHAywVbm8WctxTrrwfQEC6i1TzbA6y1e1wHv7Hhb3GwY6g0r8gqAZ8YLpAk7AoSiQRa
	 EKj2J7wF//IAc2j1AryA8jnRsxJ9HHoUJH/UCidzZ0mnZQ5itUtM6tKbkjFLKiGPOBZ9K
	 q4y/ZaJ+8pnLUxRq0Qz9dK9U6udvCo5PLng5i1wzQ2XgtFk/0PnK4EFTvwbjn1EK/UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958628;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=no5eTtP4RUMyTG6Be02JTXB38EfI0cA5Wu099ZnO2xg=;
	b=Mm8P6g4628nuP+r3zmVXPkNpSh9vuYsIjM4JXeITOc08WSZ/FQmZc2KhVx0wZli/EPJP
	 HDSKtetyUvtFCig1qR86cte3CwQvy/vc+p+uerwSJ/MO7QLJ3+n9dC35wlG3U/mpJaMDX
	 A0GM8xzvgGSsFX/pSSfuIbe/EDMseMZJv3ANLrfWNXNaTUueoDJUnO/ZZ3QwUcFusjn95
	 ls6d5fvscGjf5Mx4M2Ulat4ZiQ8A8kBIXMybnP+EdfGwAOEESkGrZ/megMu7DucIErbSN
	 gIpSYXfU677CaZlmnVn+4GHYCWSs91bucbUYbQ5mQotC0I5lC3RLctmOLNbt2sZB6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sd1P5i+0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hBb2D56r;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5B4606A33C;
	Fri,  6 Nov 2026 09:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5B4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sd1P5i+0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hBb2D56r
Date: Fri, 06 Nov 2026 09:50:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958625;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no5eTtP4RUMyTG6Be02JTXB38EfI0cA5Wu099ZnO2xg=;
	b=sd1P5i+0tQNkUjvca33vZLlQ1Cyx3ibskbMysmK3dko2G/lIiD1n6N50m8lYT9HB6FgrFG
	SAVoR39UI/qXEZli5LP1aUXhghxDObZZH/IQK93eoAF5IttKilkKn2euNID5ydTUs2mcL3
	iIcZZ+R/GEYHfamJ4mtbSu6XHfKEHLvx53JGgO+mfwgnLZfND5oVnMlnlKtWhBVptOtUni
	7OpLnHsboZau35iLV0Jmot4KjlbhGcNWzrXl+XDTFTWCghV0ujyUtXz2fErDhWrKsEl7sv
	DHJTMvgTWxaME/kp+g5JjcQsV/oMSbKChLJVI58wFrA406CxVp/R95Yv4u8DdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958625;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no5eTtP4RUMyTG6Be02JTXB38EfI0cA5Wu099ZnO2xg=;
	b=hBb2D56r6oMpB+pF4GB9y0y9obykSWi4e+kPHWbYaK//eRgJYmq8wsebqwMwnHZHBI4A13
	ZciEqG0HeaOLRzBw==
From: "tip-bot2 for Ravi Bangoria" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/amd/ibs: Reset CPU0 IBS state on syscore resume
Cc: Ravi Bangoria <ravi.bangoria@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jim Mattson <jmattson@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026041838.941-2-ravi.bangoria@amd.com>
References: <20261026041838.941-2-ravi.bangoria@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395862406.1009794.13284269078360175554.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     2c1d35bd95b13b50b43a0cb2167305dabfb54c07
Gitweb:        https://git.kernel.org/tip/2c1d35bd95b13b50b43a0cb2167305dabfb=
54c07
Author:        Ravi Bangoria <ravi.bangoria@amd.com>
AuthorDate:    Mon, 26 Oct 2026 04:18:35=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:40:55 +01:00

perf/amd/ibs: Reset CPU0 IBS state on syscore resume

During a suspend/resume cycle, all CPUs except CPU0 go through hotplug
callbacks, which sets up IBS state. CPU0 bypasses this path, leaving its
IBS state stale after resume.

Fix this bug by explicitly setting CPU0's IBS state in the
syscore ->resume() callback.

Fixes: efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to elimi=
nate RMW race")
Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
Link: https://patch.msgid.link/20261026041838.941-2-ravi.bangoria@amd.com
---
 arch/x86/events/amd/ibs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c..bfb51f8 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1948,7 +1948,7 @@ static int perf_ibs_suspend(void *data)
 static void perf_ibs_resume(void *data)
 {
 	ibs_eilvt_setup();
-	setup_APIC_ibs();
+	x86_pmu_amd_ibs_starting_cpu(smp_processor_id());
 }
=20
 static const struct syscore_ops perf_ibs_syscore_ops =3D {
