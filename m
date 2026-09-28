Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5736312819;
	Mon, 28 Sep 2026 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610977; cv=none; b=OtgJblJLvuFcS44awbW1fqwpZrx3o7LwsCHe2Wc2rsprTPGC6lxJwsUVbGHF+/2o5hTGo51Rn3p2fXKeyeC9HkDFdu151ebiXWVeYvuGCV/AdvsjnGBOjIn0FBWfw5TkQ3kRziaqYKYdScT4iQTGu1eMBkXB2lnAuN6QUCqzzbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610977; c=relaxed/simple;
	bh=vG8MqlIX6V66zKK4ZCo/pAYRKnv5vOIoJlvTUJceVXQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=pHspJZHnhVxH9JpkhQJASTmZdtWvpf0s2b/KRq+qT8fSNHxOqsq2ICPCmashfjj9Gqa5ztxPdD068DVQT0rayXuMHdbFO15dnMVzbpiEALaSGCte7gwzay+gnZNj4wKOmy65Q7hu8LHa+alv22fcZpF1kgzRCkLXTOQQg+lzGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IO7c0/s2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AnseWuwZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IO7c0/s2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AnseWuwZ"
Date: Mon, 28 Sep 2026 15:56:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790610974;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJBJo9L3AUOSCPBzdrb1StT5QbICzAki2W3JGp/KrIY=;
	b=IO7c0/s2dBYU7Ye1r+BiDWccNK3nBACzb1eriOz9atz9rzIgDUu9932wEGTiDe4M7xCzN3
	SwwfN+0JwmFoYWigxjxAjPyykoGLcnJK9NnO+OS2pH9T2edgPDc4USLa0VnGAbh/LAZgMR
	zkWk7T+yrSKdLuh6WL02fJk72eGWj+rZeUql4gwcQG9zjJiER5ILRP8eY2hq8EnejhBaVB
	NelWb1b38CmeUMt0BRrpBuX6S+16IvB6QIVju5i7hZCj7gA6nj5dc1QfFR03Qq9xTZuJR1
	alMs1JVJQKey5z/1vFaC/eQzp96g13I2gEofEzuh7VnjgWpUXTpfwXDVUl9bxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790610974;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJBJo9L3AUOSCPBzdrb1StT5QbICzAki2W3JGp/KrIY=;
	b=AnseWuwZBM5Lbz/l0P/XYswsIcGH7JqsSj7L2TkjUNFRqnLjpiAwln9Bg/LOIdG+yqgeKx
	eyE8yc+Xv/YMsIBA==
From: "tip-bot2 for Nikolay Borisov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] x86/tdx: Restrict attestation exports to the tdx-guest driver
Cc: mkoutny@suse.com, Nikolay Borisov <nik.borisov@suse.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925131808.2415177-1-nik.borisov@suse.com>
References: <20260925131808.2415177-1-nik.borisov@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179061097179.3910103.6159743846563626207.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     a49e2d257594931772ab8f0024708c3076f3aa1d
Gitweb:        https://git.kernel.org/tip/a49e2d257594931772ab8f0024708c3076f=
3aa1d
Author:        Nikolay Borisov <nik.borisov@suse.com>
AuthorDate:    Fri, 25 Sep 2026 16:18:08 +03:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 28 Sep 2026 08:51:45 -07:00

x86/tdx: Restrict attestation exports to the tdx-guest driver

There are few remaining attestation related functions which are exported
via EXPORT_SYMBOL_GPL, yet they are solely used by the 'tdx-guest'
driver. Let's just limit their visibility by using the namespaced
EXPORT_SYMBOL_FOR_MODULES.

Suggested-by: Michal Koutn=C3=BD <mkoutny@suse.com>
Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Link: https://patch.msgid.link/20260925131808.2415177-1-nik.borisov@suse.com
---
 arch/x86/coco/tdx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a63..a38e444 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -139,7 +139,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
=20
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_get_report0, "tdx-guest");
=20
 /**
  * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
@@ -175,7 +175,7 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data)
=20
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-guest");
=20
 /**
  * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
@@ -196,7 +196,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
 	/* Since buf is a shared memory, set the shared (decrypted) bits */
 	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size=
, 0, 0);
 }
-EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
+EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
=20
 static void __noreturn tdx_panic(const char *msg)
 {
