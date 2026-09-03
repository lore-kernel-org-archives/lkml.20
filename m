Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E82DAFAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475172; cv=none; b=YYEpIsmlf95b2BuSKag89jq4qjCd1cZqquZcX/NykB/1ku9x3qofojHkUUzL+2+HZFODpD57s3cpLFXJJUwLu4dRqfUgcrK+fSdlmH83zx9XMylXRB7OuijPeHopk0Tfv3EeOcpS2t3Ve0fY3Mjv08RT5sdj17CTv5fqv9JbOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475172; c=relaxed/simple;
	bh=2KEK6hCfPY3bO6wobnsYzxM4dHSOgJjX0TNI+c2wO0U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXV/sYbx0Bu+BvsVUkluEXDMItTJlW76oQpmyJzgnWjBcmbsdQoRldAyr129Cp9Jo9IfqILcKS7ZXaww46rPGxzFTYoYRT654LKqCtlekFBTjEceCF5ZdqZ+9Uhm7jWu5aGdxnS2SumpTKdiT9NrAxgITmdOfcA/658fkW25LMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=n/7/vIso; arc=none smtp.client-ip=185.70.43.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="n/7/vIso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1788475156; x=1788734356;
	bh=zOkoNzUGSqjoFL99K4Scc/zmLBivAvnuMYypd872aNE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n/7/vIso42q/PT8/h2c0KkIGHP6ITE+h548vYTgXzUmY+zFrE9B7DOKdeDRgB4sOw
	 jCvBX+1tOhDMaMnlPrzR8C798jIYra3P6PD5+hp5bmDVu386s0r+m8JR+4ZKSURZ5J
	 njjGbGE+GUVqliiadLhggjFnciUMq9GWfPFwtLGbOEW210kJn+zvTOze3hmE8VUeT+
	 1gZKis+zLdxWP6BY82HUiIBCzsOm8U5xBZqmodhLTq6D2McT9K04CSztyGW2UrIJEB
	 sbS+Pr+tvUM64ltDSAXVvOCI2CpdQ6VK/lN/ASK6OXc4k+l+6V6EJmcXl88pyUy+2q
	 w3fHB9GP7lHCQ==
Date: Thu, 03 Sep 2026 22:39:10 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] x86/mce/amd: Reset deferred-register state between polling banks
Message-ID: <VVPre8FwBOaDwOJsZLizBoEllya95qRDFGMnMwm_j_UOTE9L7LptaW7wFFQQNr9nBhwUYorxpQq_IZyQSsL3-IGNj6hdtcxr1HIg1xqWYPA=@optocloud.no>
In-Reply-To: <20260903203609.GC145182@yaz-khff2.amd.com>
References: <ZYPjnBLNLY69gIYeH-ING5IhrnA3ryhVQquuPlWhUR-WmKLUFl3z-HRWR6q3zW88Vi9L4IpFrd5WnRhVG0AptFUR4cDvCGTJ782EUQL9u0Y=@optocloud.no> <20260903203609.GC145182@yaz-khff2.amd.com>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: e37d0fb100a733aaf1a1f3a496cd071d88666edf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review, here's v2.

machine_check_poll() reuses a single struct mce_hw_err while
iterating over the MCA banks. smca_should_log_poll_error() sets
MCE_CHECK_DFR_REGS in m->kflags when an error was taken from
MCA_DESTAT rather than MCA_STATUS. Nothing clears the bit again for
the rest of the poll, including on iterations that bail out early,
so every later bank in the same pass inherits it.

A stale MCE_CHECK_DFR_REGS has two effects on a later bank:

  - mce_read_aux() reads MCx_DEADDR instead of MCA_ADDR, so the
    address reported for that bank is wrong.

  - amd_clear_bank() returns before writing 0 to MCA_STATUS, so the
    bank is logged again on the next poll.

Reset m->kflags at the start of each iteration, alongside the other
bank-local resets, rather than clearing MCE_CHECK_DFR_REGS alone.
The only other place kflags is set to zero is once, before the loop
starts (mce_prep_record()'s initial memset), so there's no per-loop
state a full reset would wipe out. It also covers any future kflags
bit that ends up set within the loop the same way MCE_CHECK_DFR_REGS
does today.

Found by code inspection; not reproduced on hardware.

Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---
Changes since v1:
- Dropped Cc: stable (Yazen)
- Reset the whole m->kflags field instead of just MCE_CHECK_DFR_REGS
  (Yazen)

 arch/x86/kernel/cpu/mce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index 6fa15e19988e..16ac2418fd51 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -823,6 +823,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =09=09=09continue;

 =09=09mce_clear_hw_err_fields(&err);
+=09=09m->kflags =3D 0;
 =09=09m->bank =3D i;

 =09=09barrier();
--
Cheers,
Eirik B=C3=B8e
