Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C3440643;
	Fri, 16 Oct 2026 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137342; cv=none; b=bKebPM0oMlPkS8R8/1B5c9WOgbWZtBpZS+NEf5koXcYQbU+IFJ63Io+JtdeyIerw3r14mRbccXMAmKulgiyoy2e6z2f90xy823glJ3nhuLbWMXENXHn/RbHW83MVNIoczjlthCBoryKzq5M7pAvD0guF8rcD9xzLV7/QtaYANIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137342; c=relaxed/simple;
	bh=KGpkwQyyPpBsesFjkT1qMbgGg4AybZw7gxYgg25nHgY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=f+ofsP7p/FZnlxsJLHssQ+epI+0XnWCMzVoXjrrmeJSm9isD+bwu8h1YEOVHl6pvF+LgLZLlNedQTOLz4tHC4abnZsXPadoXUm5qijeD8hW6b0b3NIebkm+yBe6jRGgmarrt0KHnvjNfQFQnyvIz4ZFBuxIAjQN2GK7Kgp7VqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IXxO2D+k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mdUfhAkV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IXxO2D+k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mdUfhAkV"
Date: Fri, 16 Oct 2026 07:55:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137339;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc9VJML3Knma3Yb8YWlwu1j1mPcklEkpt521vOjmCn0=;
	b=IXxO2D+kGq4IsLYGZQvC4naF/7z9ZecZY1yUwDzEggUKeU5zsm4tgihUJi+3HkFHfPyUu/
	bDUl3WOEhT6wxfCg75pEuJRYAj5RGIj4nNXnognx1vFxwUNVcylIFpM/rBgwB6It6Uvjc6
	bUvkilZqSfz3vt87D8JuXMV+OMUSnKM2uCcFWJP9dCHLLX1hb2A7yUez7QJriTzUmpFQm9
	XsOjlOTwJWQcGM/2EYE/fWyA1M7NwjJ4bF4XjNufGmRqaUDeAcTniHo6Xhkqq4JMcIe8Cp
	aRuhKqtgQInIqhmEe4pk7Z7fNXSindpc4+Wu9Veii2GEg/z7llG6IUxa6dEtWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137339;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc9VJML3Knma3Yb8YWlwu1j1mPcklEkpt521vOjmCn0=;
	b=mdUfhAkVo/Hzxb4+v9PsucLRAvz2KoU/w+0tktMPIfEwDgqxC3T05+0j7KzUYdpKMx4rrK
	MhTY7jeeg6Tom5AQ==
From: "tip-bot2 for Guixiong Wei" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/x86/intel/uncore: Fix DMR CXL CM invert filter
Cc: Guixiong Wei <weiguixiong@bytedance.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Zide Chen <zide.chen@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008051953.6293-2-weiguixiong@bytedance.com>
References: <20261008051953.6293-2-weiguixiong@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213733744.2666988.12963924668115748690.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     cf1f186e08dadb5abc4410d10fe3ada7ebf801ae
Gitweb:        https://git.kernel.org/tip/cf1f186e08dadb5abc4410d10fe3ada7ebf=
801ae
Author:        Guixiong Wei <weiguixiong@bytedance.com>
AuthorDate:    Thu, 08 Oct 2026 13:19:54 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:00 +02:00

perf/x86/intel/uncore: Fix DMR CXL CM invert filter

The DMR CXL CM PMU places its invert filter at config bit 21 and its
9-bit threshold at bits 23-31. However, dmr_uncore_cxlcm uses
GENERIC_PMON_RAW_EVENT_MASK, which covers the threshold through the
generic bit 23 invert field and bits 24-31 threshold field, but does not
include the relocated invert bit. As a result, uncore_pmu_event_init()
silently clears bit 21 and inv=3D1 programs the same configuration as
inv=3D0.

Add bit 21 to a DMR CXL CM-specific event mask so the requested invert
filter reaches hardware.

Fixes: 6daf2c35b835 ("perf/x86/intel/uncore: Add IMH PMON support for Diamond=
 Rapids")
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Zide Chen <zide.chen@intel.com>
Link: https://patch.msgid.link/20261008051953.6293-2-weiguixiong@bytedance.com
---
 arch/x86/events/intel/uncore_snbep.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel/unc=
ore_snbep.c
index a97cd02..1b460cf 100644
--- a/arch/x86/events/intel/uncore_snbep.c
+++ b/arch/x86/events/intel/uncore_snbep.c
@@ -474,6 +474,9 @@
 /* DMR */
 #define DMR_IMH1_HIOP_MMIO_BASE			0x1ffff6ae7000
 #define DMR_HIOP_MMIO_SIZE			0x8000
+#define DMR_CXLCM_PMON_CTL_INVERT		BIT(21)
+#define DMR_CXLCM_PMON_RAW_EVENT_MASK		(GENERIC_PMON_RAW_EVENT_MASK | \
+						 DMR_CXLCM_PMON_CTL_INVERT)
 #define DMR_CXLCM_EVENT_MASK_EXT		0xf
 #define DMR_HAMVF_EVENT_MASK_EXT		0xffffffff
 #define DMR_PCIE4_EVENT_MASK_EXT		0xffffff
@@ -6696,7 +6699,7 @@ static struct event_constraint dmr_uncore_cxlcm_constra=
ints[] =3D {
=20
 static struct intel_uncore_type dmr_uncore_cxlcm =3D {
 	.name			=3D "cxlcm",
-	.event_mask		=3D GENERIC_PMON_RAW_EVENT_MASK,
+	.event_mask		=3D DMR_CXLCM_PMON_RAW_EVENT_MASK,
 	.event_mask_ext		=3D DMR_CXLCM_EVENT_MASK_EXT,
 	.constraints		=3D dmr_uncore_cxlcm_constraints,
 	.format_group		=3D &dmr_cxlcm_uncore_format_group,
