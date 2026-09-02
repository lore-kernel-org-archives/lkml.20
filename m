Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4653F20E8;
	Wed,  2 Sep 2026 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383467; cv=none; b=m3aQWBZcyEpIZfLoAh52VioO8SB7kldjk5E9iFTkFSOfYQd7OGu1/04DgvjABp4KQUZoryEbVypkPFv86EzkJ33sK/wAw9+83dDcc82YvFjiUaX3aXU1Ibps+matgcBFzvMWxxuAUD6nNo2tIs0M+onVL2D0x0C8avG15WMmM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383467; c=relaxed/simple;
	bh=/px/sBpYdh+WGMs11as/NqGV8Ww6/g0x0snoJ/m5owU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IZII/eyTiCYjr2dngOWDa3fbEsT4W6MHrM211XJdvetwhoPSc7D+585a9IEJLMdTpyeyHaqu/bts5xOLF5vaV0WHisb+mrFJkeozaBOK3lBT3VtVkz3Gnrzvl6lO3g7iDW1JvKslD0ZPR0w0NRu2twde0BTJgEIb1ilPvuLVgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZgTYvW/E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aASLnCzh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZgTYvW/E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aASLnCzh"
Date: Wed, 02 Sep 2026 21:11:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788383464;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw9eF/yrMJ9UWEFGbd4g7LpWi2u6qFtlLhHJ5QzBDMs=;
	b=ZgTYvW/EgWSWhQmQzhdDP4+q4eCK8Elzh/LkdljG1oz7Bid2fk4TbZuo9ZVdN0mv7Jh6+G
	KgdDaFhoVxznZbge7c3aBqunR9dGpzCfv8CCmppE7fsbtcI2L9DhOOyP1bTUg06xL6qi8n
	iBuJRUqndUDvbl3//2gfA5VxgUpsNwq46QUpTZGaGEinKgKq/u6a2O3f1o1j38BuXSXywj
	BfVdprESf6ASnvUGlSAVJt8ulzQpsvob9Uu72sJHMPP14ypQonROA3VDKQSp0ovHpEKS8j
	IGgpQYjaPm6enm2sPE1ao9XK/42Pvwqe0TPZGoM9MZzSgiCVAnHx09geSHf+Vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788383464;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw9eF/yrMJ9UWEFGbd4g7LpWi2u6qFtlLhHJ5QzBDMs=;
	b=aASLnCzhDKKiwGedAifnX9O0rinLr/p9v+6fUqQyL/J+Dv/6lOQ/sKU23kAOD7TKzxqr3O
	ibx9PCgdqrwPz/Ag==
From: "tip-bot2 for Bill Roberts" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cpu] x86/shstk: Shadow stack enabling write return code change
Cc: Bill Roberts <bill.roberts@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260707184542.1721085-1-bill.roberts@arm.com>
References: <20260707184542.1721085-1-bill.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838346311.3717435.13754734302325111782.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     f4cadf2d1ee3a24f259495309b76f98af467004b
Gitweb:        https://git.kernel.org/tip/f4cadf2d1ee3a24f259495309b76f98af46=
7004b
Author:        Bill Roberts <bill.roberts@arm.com>
AuthorDate:    Tue, 07 Jul 2026 13:45:42 -05:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 14:06:27 -07:00

x86/shstk: Shadow stack enabling write return code change

The WRSS instruction (the special instruction that writes to shadow stacks)
cannot be used in userspace unless IA32_U_CET.SH_STK_EN=3D1 (user shadow
stack is enabled). So the kernel *should* return -EINVAL to userspace if
it tries to enable it when shadow stack is disabled. However, currently,
it will return -EPERM. But, that error code doesn't fit the condition as
the failure is due to an invalid state change request not a permission
issue.

Investigating userspace call sites, like glibc and criu (checkpoint code),
they do not rely on this specific error message, nor could a userspace
effectively utilize this specific return error code to indicate a
difference in "I cannot enable write because of invalid permissions"
versus "I cannot enable write because the shadow stack is disabled".

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Link: https://patch.msgid.link/20260707184542.1721085-1-bill.roberts@arm.com
---
 arch/x86/kernel/shstk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 0ca6490..eb690ba 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -490,7 +490,7 @@ static int wrss_control(bool enable)
 	 * when disabling.
 	 */
 	if (!features_enabled(ARCH_SHSTK_SHSTK))
-		return -EPERM;
+		return -EINVAL;
=20
 	/* Already enabled/disabled? */
 	if (features_enabled(ARCH_SHSTK_WRSS) =3D=3D enable)
