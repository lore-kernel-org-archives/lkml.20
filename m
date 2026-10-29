Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285119;
	b=1dZwOXCioAPVzWJ1LfYp7+84vGExfa96GD1Z7a7dKOAHHUHBtcBt3tTim9Tl343MMW6S
	 upVjiUGeRLVkL705J6HqP0oEA9h9VEal3I5G4oQqV2xU+lNrM/JlY2MGEEGlzPie9dMQe
	 hvP10cDNFDBjGDmNUGiDdPjJqNhT/HJlollHFAsUNLR6KRdBy4ju2nsS0GPuutqPr5ZLo
	 NeHqRK2jHlHLC4JeQXgQFM7Sh8kyF+2pALyWesmox7aq77reI7Dofm2dKpJcyxtFaRmz/
	 7++UPDi40OtEk6EmUXP5IJSsR8pL3gLKcDqD91+OYQ9SImWfeeW3sSKJZFci0ql0ESw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285119;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=CNoBY2EeWHEFgt1yeg9PBZ6U1Amx+8f8ooHrQN3OmPo=;
	b=J/5kqxSMr+QhzPrnEPVl5QIRy11t1COu0IsNWX1yoGWTTuX2xJyFOVgWNk49wmZG4TNI
	 uHNm9R68mqOEtD7GT4IFR8J1hirUGcRmd550y4InoHp9dwDSgJhdFd+xQIDPYbHpDhOjU
	 VkJiZckalYoflfQmIf7n/8//O7959mUppwYfy2K0jPCV+z99zTEEM8KBAuC8gARzjyYJ4
	 IP4EhMy5abVcHYfNmOcDq2InUfCqnfl9kQlncZiv2kkUk5MRFdkMYlqGcknjtkKNEuumc
	 2MJnGQ9zTrODHmBwzIvDuGHqp1rCrGSq79wdPsAvQiVm2NPOH2rcduVlJXLJHMyxHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UiYNZX81;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UiYNZX81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=CNoBY2EeWHEFgt1yeg9PBZ6U1Amx+8f8ooHrQN3OmPo=; b=UiYNZX81AcqsZWotAhrPdUoKhY
	zccdHdWmq6cLFmiQQigs/25ytDI/uU9o2H6rFTfICtQ12PjfYnS3XdAfPbHyxRTyjH4hVKTLKMW1V
	QeHd6i0IZqh3/6hc44wc/8N9fgyAnPdkqzFJmhSvKm9cN9FOabisxgboOAwHIONBx5w+pdM13pvwR
	n/35wZCVKRUCK00bA0qDgWwV7Znfui/8tPwj008E8clkL4mO0sj/UCQcvIMda5faqLgjbiW9aF1TC
	k5OMngvHbl224cQMw7dslDxZdDa8UE2QNlqganGTla+pjc3o/ikRMoJgoyG8JYOEMijefv3JV90Wk
	0TyQjc+w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMRNQ-0035zm-1q;
	Thu, 29 Oct 2026 14:45:12 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 29 Oct 2026 07:45:03 -0700
Subject: [PATCH] x86/bugs: Keep BHI mitigation when only user->kernel is
 mitigated
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
X-B4-Tracking: v=1; b=H4sIAO5b42oC/x3MQQqAIBBA0avIrBtQK6muEi3MphoCDZUIorsnL
 d/i/wcSRaYEg3gg0sWJgy9QlQC3W78R8lIMWmqjpO5x3hltztYdeJHLIaKrDVnTtU0vGyjdGWn
 l+3+O0/t+sQzZGGMAAAA=
X-Change-ID: 20261029-bhi-attack-vector-c36ea6854904
To: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 David Kaplan <david.kaplan@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=leitao@debian.org;
 h=from:subject:message-id; bh=M5UzdlFygEbmSIkRv8ha5naqQM0957EzufBscASNrY4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq41v0niI7uhmlNC0kar19lYqcVDLzaR3ekRhp3
 a/Qfbku4RuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauNb9AAKCRA1o5Of/Hh3
 bStHD/9Ov6zMXiDrMiOtVedSarmYLCzOmkNEqNFCQDb+P6Z54EXigXTpp94at58ofXgajTSKjMv
 ot3Po+2eb3qIN7i4au//K4oO+U1ABaaIcEOYuAwLyX1STkJncwHzzW8KAIGabEZ638fkOTcJ1y2
 Re6o0JWDumfQ98xWuGS06U0SmMHgEuk/7Wre2AnX4GooN9KrvM3O7CLIABfOnoDZ0/4qY76al6A
 idaQWVw1KQNRv60bN0g2U15kzajBVfI9FIFTEGzvyzFYQ9rQyZ2wi4BQppcwPUo7O7mI2BjrUEK
 n/ZGp5xJ1njTiv2cz+NELIbl0ykaaAbTpdZyp5Svym/1VoDZ+dta3ZfYFgJXd9ppolgX6CS2c/Z
 Xfks3JI8W+t0ZoXc6R1ZwjaRBzfzSKyjQLEoON0xzo1TpbuNyduGjVepflXeWjK7rT3WeKJlbbK
 JYRrRfTzZ/Q1aCtOQ6WFPGmlhQF30IMZJDEoLzHkrvo/S7PJzisU2uf1lWLk/XjNS2kwWnDk6p9
 LhVJ/c0JSjT/J7WQoyee26a8HF3ADhJj1qCM8xvLC5+aFLW1VRhVauyQhxuvCgVEfcJq+sKKsSc
 RzNTQwA1U/CtqQ55CtH3PtAiWa8tiAlVWaEVycn5O36bpveavGzAOLarGuaXxgwSpbA+CuLuewQ
 qyV5fWjDsvRdDcw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The BHI mitigation selection is inconsistent with the documentation
(attack_vector_controls.rst), which lists BHI under both the
user->kernel and guest->host attack vectors. bhi_select_mitigation()
only enables it when CPU_MITIGATE_GUEST_HOST is set; otherwise it
selects BHI_MITIGATION_OFF, even if CPU_MITIGATE_USER_KERNEL is set.

As a result, a kernel compiled with KVM disabled gets BHI automatically
disabled, since CPU_MITIGATE_GUEST_HOST defaults to off without KVM.
This is a bug, given that CPU_MITIGATE_USER_KERNEL still needs it: on
affected Intel CPUs these kernels lose BHI_DIS_S or the BHB clearing
loop by default. Booting with mitigations=auto,no_guest_host has the
same effect.

Select BHI_MITIGATION_ON whenever user->kernel is mitigated, and keep
BHI_MITIGATION_VMEXIT_ONLY for the guest->host-only case.

Fixes: ddcd4d3cb37c ("x86/bugs: Add attack vector controls for BHI")
Cc: David Kaplan <david.kaplan@amd.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/kernel/cpu/bugs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 000ebee2d247b1..4ced10c6ba0db9 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2088,14 +2088,12 @@ static void __init bhi_select_mitigation(void)
 	if (bhi_mitigation != BHI_MITIGATION_AUTO)
 		return;
 
-	if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST)) {
-		if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
-			bhi_mitigation = BHI_MITIGATION_ON;
-		else
-			bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
-	} else {
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
+		bhi_mitigation = BHI_MITIGATION_ON;
+	else if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST))
+		bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
+	else
 		bhi_mitigation = BHI_MITIGATION_OFF;
-	}
 }
 
 static void __init bhi_update_mitigation(void)

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-bhi-attack-vector-c36ea6854904

Best regards,
--  
Breno Leitao <leitao@debian.org>

