Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B630C345;
	Sat,  3 Oct 2026 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988211; cv=none; b=YfEmsxUIBQqYG/v3IQsYaQ936H5GzZHn6pbw8iuR856o5Ad+MD2j6f5GABlMTgnwc1PL/Jp1t2U1/3ZkbKRCNO0u5sYpTXdReurCP07kg5Y1ieNX4R1QVyqcFCy0lI7RCqoy13SQd/n941jkIzVkmmRMdhJgecBv+hkK6ffcn7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988211; c=relaxed/simple;
	bh=YpI7Smvzy4lSr2JMEL9riLGxv1n4IM35NDua6m7IAok=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=aYCPaenLLg7rMGh/c02x4GXER7NTVLaSyZKBb7fxHCqdnWUrnPiVHFRGTQgVvvXkUeq7aEewUY2YIYn2ryZEQEEUKgOt8pHQs+J+/g9LRG5SAm5vSjsqfg/61g3zT5haAfoC0EtksGzHkercHe32oodKMAhbc36x9nrtv8Ahd7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZgPQ9cNi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xhpor4Pn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZgPQ9cNi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xhpor4Pn"
Date: Sat, 03 Oct 2026 00:43:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790988200;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxDx0T3KHMVGPmvCGNKZqnaAvxXK4sFCrHs2MyHNYRs=;
	b=ZgPQ9cNi6C7SJ9YGY6E63XEd+J3iUORsfLhzuzN5gvP5v5RkkVsd3IUxgudQRv4P+xykPp
	N1RecDjew8iD7Hg03mezmrKQuafl+mUwXHmZlSiCdeVknBmEy9drz3EvZQ3rHg3oYAyESN
	/8rb70he97aOov8uaDij9tcXYzg1umCFxDP36uXdapfX7zgpNHtPQETJlGurTMcuZ/fO3E
	xc2Udo8D8AQFwy0eutx+g0bq89+BbvyMX5n+aJQ1NTx2G8QAJOh7CeqnEBvIPDfX1Aen0T
	tRBzXynBEIhE5DEUrAaWa8T45RN8G1Wh1EPgwY+XOBCfiZcLvVrSQujgS/jRxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790988200;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxDx0T3KHMVGPmvCGNKZqnaAvxXK4sFCrHs2MyHNYRs=;
	b=xhpor4Pn3oeuws2nNsm5GbFcs10/U6RiMXs/u5rUyp2fWhFSyfQ9/+aRRDprbezGBKi0kd
	TBUvaL2yaJg82RBg==
From: "tip-bot2 for Kim Phillips" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/bugs] x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=n
 mitigation reporting
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Kim Phillips <kim.phillips@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260831210916.987152-1-kim.phillips@amd.com>
References: <20260831210916.987152-1-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179098819861.3910103.4162467849995047468.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/bugs branch of tip:

Commit-ID:     1847c80537891baead3975f3ca969233ff7b2a11
Gitweb:        https://git.kernel.org/tip/1847c80537891baead3975f3ca969233ff7=
b2a11
Author:        Kim Phillips <kim.phillips@amd.com>
AuthorDate:    Mon, 31 Aug 2026 16:09:16 -05:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 02 Oct 2026 15:48:29 -07:00

x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=3Dn mitigation reporting

When the kernel lacks retpoline support, spectre_v2_select_retpoline()
emits

  "Kernel not compiled with retpoline; no mitigation available!"

before returning SPECTRE_V2_NONE to its callers.  SPECTRE_V2_NONE is not
the final answer, though: spectre_v2_update_mitigation() runs afterwards
and can still upgrade the mitigation.

On an Intel CPU affected by RETBleed, built with

  CONFIG_MITIGATION_IBRS_ENTRY=3Dy and
  CONFIG_MITIGATION_RETPOLINE=3Dn,

and booted with spectre_v2=3Dauto, retbleed_select_mitigation() picks
RETBLEED_MITIGATION_IBRS, and spectre_v2_update_mitigation() then promotes
SPECTRE_V2_NONE to SPECTRE_V2_IBRS.  The boot log claims no mitigation is
available immediately before reporting

  "Spectre V2 : Mitigation: IBRS",

and sysfs reports the machine as mitigated.  The message is alarming and
simply wrong.

Drop "no mitigation available!" because the final mitigation state is printed
afterwards in spectre_v2_update_mitigation() anyway.

  [ bp: Drop CC:stable, massage commit message. ]

Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
Suggested-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Kim Phillips <kim.phillips@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Link: https://patch.msgid.link/20260831210916.987152-1-kim.phillips@amd.com
---
 arch/x86/kernel/cpu/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 1b2381d..000ebee 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1958,7 +1958,7 @@ early_param("spectre_v2", spectre_v2_parse_cmdline);
 static enum spectre_v2_mitigation __init spectre_v2_select_retpoline(void)
 {
 	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE)) {
-		pr_err("Kernel not compiled with retpoline; no mitigation available!");
+		pr_err("Kernel not compiled with retpoline");
 		return SPECTRE_V2_NONE;
 	}
=20
