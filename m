Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B513B47F9;
	Tue, 15 Sep 2026 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438239; cv=none; b=mot85MbWOBUgTnqTEjHWevoefCaeHasIuVkkrVQzekAJM9sPOe8XqiwVq0g/rhwXTu/1wqBBbA78Vw8xGe4/6i/jOHysaSimvx0lYlroeI5EUzpSoPek2E2NhQ4jnukdCpWS1HBnucQ8a8nqX/orQGBxP2elzse++az8TrD9D94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438239; c=relaxed/simple;
	bh=SO9MgLm8MQEbpgHNDFhajg5RKmfrQPr8HGby4XKt1Is=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MVkP0gWGX5p3ThBAY81RON1afXR6x2noF7RDzBCX+8rrGSCpzrjxH9Vf3GgtYrU2u6/JP3L6anoki5r6Rf87tb5M5gwm/+3Dc6xwX4WdpTc4DvipUTee2xLOGXRRxsZ88ipD53o2Ej9/HFuf90RGN/UqEJUzng/df0p2A16ouVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oDyHG9yl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5e95dLJ8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oDyHG9yl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5e95dLJ8"
Date: Tue, 15 Sep 2026 02:10:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789438236;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slNM3Ic4eq4Rm7oBFECtw7LBxwkZa7Wkvh+ikuK+85c=;
	b=oDyHG9ylRIHKR2qVJPPas9T95Dv235syYC3JEgNHvwC1NcMA+93DhkSp2sFUrN+g8UkJME
	bCSaZgvFtPGneg9v+Okt0ulanMd5Whqo+x/8fiHN16rp+mgQp94e/DUqD0eX/axLg4XaAc
	uv+Zr+xuC3tSAMGcebcPwylpcYrtW0sKC2iJIERcmKUtAC42uZSkIo71mbNEnumnl2EKr4
	0dlQdAr1jaHtKBKDMuds4iq5wuPM/gq12zqlsOd2xWh5YLHgHuHKdcBZPw4azqZf2muRVQ
	Cp1DF2OloCaqDt43vi0DMxaxWoOQqD16mlQSwIyOqIyfi0NePLBttQjcf05RZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789438236;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slNM3Ic4eq4Rm7oBFECtw7LBxwkZa7Wkvh+ikuK+85c=;
	b=5e95dLJ8AKE4iD2zB6rI2BmolLudKJWzlTtYZlYHqzNNo28ydWu7+AhSbbQhAwcg60Gt7g
	1VSdVK9uwFjhTvDQ==
From: "tip-bot2 for Bill Roberts" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/shstk: Return the correct error value when user
 shadow stacks are disabled
Cc: Bill Roberts <bill.roberts@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
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
Message-ID: <178943823398.1720534.11395643464501049097.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     9025f3bf73f0565eaa271ecc15f468b1d1e4cbaa
Gitweb:        https://git.kernel.org/tip/9025f3bf73f0565eaa271ecc15f468b1d1e=
4cbaa
Author:        Bill Roberts <bill.roberts@arm.com>
AuthorDate:    Tue, 07 Jul 2026 13:45:42 -05:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 14 Sep 2026 18:57:04 -07:00

x86/shstk: Return the correct error value when user shadow stacks are disabled

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

  [ bp: Fixup commit title. ]

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
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
