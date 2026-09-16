Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80C283FCE;
	Wed, 16 Sep 2026 04:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532875; cv=none; b=TZ9HUHQKgYUjL6cfcBWVO1GjTAdRTNXQHvR4loTbzf4VhVoPOFfrKgoBf8P7YLB8jJ89F80OTu3H1wKPPpnaL1okTyTvugO4v1r0qo1l/Y+vd3cLAcOW7j3dgEnseoowLxu+4BiB5qYsOw48k5TKR3DTyoQsCp9snGiSc9Pe8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532875; c=relaxed/simple;
	bh=Ecm6Nvp3PrSkfAtxVIeBQzlpSMhPGlC8pxN5pUPsx4Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ViYlHhasyYekivNlB3+q5osGIP5YCVrkgPQqIznxkuH437OZiJrVK31UHPmGsTM3UHSLrDlbpt9PoJbets3mVOPsWF1rq1F6zEwSlYCkAOstRkZDdErLMWpLU5otubFjJYWQdmvZTM/bBYpIzwbQacpknVF5xyU67uLrxL6mjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R/t3fCn4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qsxs5OYj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R/t3fCn4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qsxs5OYj"
Date: Wed, 16 Sep 2026 04:27:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789532871;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zF5cwHq0Zv6qG4pYHLX6KL09tVfmmRwTU3tMNUMOoi8=;
	b=R/t3fCn40E6hmC02ac/cIh5FaJIOfsQ5sDjjSNuH8DStiM0uiHfDtdJRUL6oZ0JOFQqRQO
	E6sKqaxRMtfhmXpXdr6pzRVQ7WbGdvCvlgpFUAN+I8aZ90awHClIvE5ww+oK/+uFQQhc+v
	qK1NTtSt1lEq2zIc08ZeGRa2m93SLrji/ra6k+H3k6w7JtqZ2YUixf9+yCsVdlvFS30I2J
	6XxTiLivezXBwluFVCDNkk47pyfp6i+MewP3yzeh1BUzCpZR1WBy3qUShVpZBOvjeM8IhK
	82UT9r2073SNisWINCSj51mG/87Lux9uayyzERbcjkbqm3/g+G6bH8T78ENqvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789532871;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zF5cwHq0Zv6qG4pYHLX6KL09tVfmmRwTU3tMNUMOoi8=;
	b=Qsxs5OYjpchpVY34tEDWsypM7XGVQBer6LHJTjYXMOejnonlYkva9jYrwbUUyKX0f218PK
	DCv+iVofpQEW6xBQ==
From: "tip-bot2 for Manuel Ebner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cleanups] x86/mtrr: Fix kernel-doc notation of amd_set_mtrr()
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915103136.171924-3-manuelebnerli@mailbox.org>
References: <20260915103136.171924-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178953287008.1720534.10988452891957515375.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     c8beda268a6b21910d1325584ce1d45bce4f22f0
Gitweb:        https://git.kernel.org/tip/c8beda268a6b21910d1325584ce1d45bce4=
f22f0
Author:        Manuel Ebner <manuelebnerli@mailbox.org>
AuthorDate:    Tue, 15 Sep 2026 12:31:37 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 15 Sep 2026 21:22:03 -07:00

x86/mtrr: Fix kernel-doc notation of amd_set_mtrr()

Add ':' to arguments in kernel-doc comment to fix:

  $ ./scripts/kernel-doc -none arch/x86/kernel/cpu/mtrr/amd.c
  Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'reg' not des=
cribed in 'amd_set_mtrr'
  Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'base' not de=
scribed in 'amd_set_mtrr'
  Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'size' not de=
scribed in 'amd_set_mtrr'
  Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'type' not de=
scribed in 'amd_set_mtrr'

  [ bp: Massage commit message. ]

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260915103136.171924-3-manuelebnerli@mailbox.=
org
---
 arch/x86/kernel/cpu/mtrr/amd.c |  9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/amd.c b/arch/x86/kernel/cpu/mtrr/amd.c
index a73715d..9e440e3 100644
--- a/arch/x86/kernel/cpu/mtrr/amd.c
+++ b/arch/x86/kernel/cpu/mtrr/amd.c
@@ -51,11 +51,10 @@ amd_get_mtrr(unsigned int reg, unsigned long *base,
=20
 /**
  * amd_set_mtrr - Set variable MTRR register on the local CPU.
- *
- * @reg The register to set.
- * @base The base address of the region.
- * @size The size of the region. If this is 0 the region is disabled.
- * @type The type of the region.
+ * @reg: The register to set.
+ * @base: The base address of the region.
+ * @size: The size of the region. If this is 0 the region is disabled.
+ * @type: The type of the region.
  *
  * Returns nothing.
  */
