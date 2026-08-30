Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEE2D9ECB;
	Sun, 30 Aug 2026 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788065146; cv=none; b=SLvaz16qfaODipFpcu1y/3z8f4Kf3FFt7JriS3qNbGh6xUuE57EGhIl8k6R94MX4Nebds8nUVxM2finI1X4y1M/OONgSOqLGzkbrmxYrM+QUmAJlJmwwo6itTmtohSW8qi1vQtg0ulnWs+tBI2HTrFAUhSuB5U4iMQWWPC36dBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788065146; c=relaxed/simple;
	bh=4469t2BI01m8FaUJhHmRqiRSG6N5hvaB02PsaqB2EZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YT3WjgtZmUZGIAyMnzaEAy1GtfWaDH8CWseWwXZAwgAiT/i18ZupbXw6WLLfvO0XVZtD9QXlqdypqdSAdv0P8ziAjEWLbUOc48GRaiU+kYpA6oGb+LkKnCXbviXZ0nKIHCkpvMY2waC6nmmPR0HFI/CMkt2DUC+I+dHyohIghsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=G3HkF+5v; arc=none smtp.client-ip=79.135.106.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="G3HkF+5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1788065133; x=1788324333;
	bh=VyDhuXTNRLc5HiU0Z5ykj8WEslfFb9fK8DdE0g9YZ2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G3HkF+5vv8/6y8cXx942C9q7SeSe04XaEEui1+hHnXxG1zIdMCZ14v7qMbk0OxoTB
	 Lm7wS95BX0K7dSoD2NucDZq+VyzRK89F2PQfXcltA3Mta9/8WBxkkGgr5ET2dMeTxg
	 Xfed85fCzjqXgUh9qVIf+/CkXVeVufzTPUmg1k1Tbd5yIDLV/kVIlfi2dpvfWlysbF
	 WiKRQnAYfA9gZyEqLDAr6R2BHTAGdzBDdByAJbmOqlmCx17iCyjkfycAbMRBPR/SFg
	 T0spomq32isS90SJi0LaAh+SS89x6h88UYadW/YMlRRV5V/33TMAXwvSy4Lx3XnJSS
	 g93aLNF1BV1fw==
Date: Sun, 30 Aug 2026 04:45:25 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] x86/mce/amd: Reset deferred-register state between polling banks
Message-ID: <ZYPjnBLNLY69gIYeH-ING5IhrnA3ryhVQquuPlWhUR-WmKLUFl3z-HRWR6q3zW88Vi9L4IpFrd5WnRhVG0AptFUR4cDvCGTJ782EUQL9u0Y=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: 269c64efadb32e5e216608cf078598670a0df836
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

machine_check_poll() reuses a single struct mce_hw_err while
iterating over the MCA banks. smca_should_log_poll_error() sets
MCE_CHECK_DFR_REGS in ->kflags when an error was taken from
MCA_DESTAT rather than MCA_STATUS. Nothing clears the bit again for
the rest of the poll, including on iterations that bail out of
should_log_poll_error() early, so every later bank in the same pass
inherits it.

A stale MCE_CHECK_DFR_REGS has two effects on a later bank:

  - mce_read_aux() reads MCx_DEADDR instead of MCA_ADDR, so the
    address reported for that bank is wrong.

  - amd_clear_bank() returns before writing 0 to MCA_STATUS, so the
    bank is logged again on the next poll.

Clear MCE_CHECK_DFR_REGS at the start of each iteration, alongside
the other bank-local resets.

Found by code inspection; not reproduced on hardware.

Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Cc: stable@vger.kernel.org
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---
 arch/x86/kernel/cpu/mce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index e4e588d02a18..6ed14ec171f2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -811,6 +811,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =09=09m->synd =3D 0;
 =09=09err.vendor.amd.synd1 =3D 0;
 =09=09err.vendor.amd.synd2 =3D 0;
+=09=09m->kflags &=3D ~MCE_CHECK_DFR_REGS;
 =09=09m->bank =3D i;
=20
 =09=09barrier();
--=20
2.47.3
