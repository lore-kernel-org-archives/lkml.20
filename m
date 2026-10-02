Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BB48125B;
	Fri,  2 Oct 2026 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942043; cv=none; b=ftSXKRLiG3GnQJNfTnEGlFtSEeaPSHPy3wvadsnquL5i4KqqESO9e1YDKsRYFaKRYgTImjV23vVAHToRIYMhh12DHwytgoVfMy4pky+EF5RZFeUxXoKHNZiBM6ONwlHgEuuflvUNSP7PfUK14Eth6EnHQVnPW9CKbhpT6d5qqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942043; c=relaxed/simple;
	bh=rD4gLqRscUGxq/hcLff8FhPPVxlT9qsONRXNW7ZEa/A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Y+13TN2ICFKgyW58EucGnpTKc/BQPU3LSRTKrpXQ8IT9JTQlcW5/w1Ph2Jgop0/S2eu9kwJ4EeVDWgzjZAU3eFm50yZmR4DCQjccEpGYmu4JZw5As+EwqCHxL8CTVPVzms6f0hPrKtJ3xrKopw/1V0721sRv1BNM+2WnxzzKpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IIImemO/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IXgibqb/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IIImemO/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IXgibqb/"
Date: Fri, 02 Oct 2026 11:53:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790942040;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=era5lAP0c2kSP/FFCWbpHvjhhk2J174sn8PvBox+CXA=;
	b=IIImemO/HP7oxY0B5yqWy/qPpSyislV/c9agfJ7qJ/jlNdNx1nrc260edlQVJ6sW7ZMsz7
	d1VqmPm3NFrRCCGSnwxi3pJKHLeotcEZy1yZ3LCsT9AoDwOer8vd2QcJefesE68w1KcUpO
	IX3GCG6pOzhqcBa4O/R9K32Ipglnbq8y3qvy3VOhGR8lJqfriHHYhCz/JiP+1YbLoeKNB/
	OxRIuzr4ad2zLzbLZixhXLxhwnlPD+Kw3QfKn/FBnRT1ZkB+XgXQxwZldSgOc1xlHBwXq7
	yXFrHu+f12vMgc013cmrKAdC4sTrVf5/C1A61hLh5Kd+wKlAK5Eg9Lpk2hkLCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790942040;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=era5lAP0c2kSP/FFCWbpHvjhhk2J174sn8PvBox+CXA=;
	b=IXgibqb/yQ8fhbYb5RTi1k5Yf7TxO5Ixqc+kxYQB/xzbl98oxcoIpL5F1J3nC6m9Wk+LlA
	9k68fW+Y/Jz9tsAg==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] virt: tdx-guest: Make the Quote buffer size dynamic
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-7-peter.fang@intel.com>
References: <20260930103739.2851980-7-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179094203833.3910103.15684615528022304931.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     e0806b0e3f9a9cbef32ff575e3ffcad77415cdf2
Gitweb:        https://git.kernel.org/tip/e0806b0e3f9a9cbef32ff575e3ffcad7741=
5cdf2
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:55 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 04:38:53 -07:00

virt: tdx-guest: Make the Quote buffer size dynamic

Support a new TDX module ABI that reports the Quote size limit in a
metadata field. The fixed 128KB buffer in the driver may be too small
for Quotes that use new algorithms like post-quantum cryptography (PQC),
which can produce much larger certificates. With this ABI, the guest
sizes the buffer to the platform's needs and no longer has to rely on
some empirical number.

The shared buffer comes from the buddy allocator, as the host expects it
to be physically contiguous. The allocator's page order limit should be
sufficient for current attestation needs. Platforms that don't report
the limit fall back to the default 128KB buffer.

Assume the TDX module always reports the same size. It is a TDX module
bug if the size changes.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Based on a patch originally by Kuppuswamy Sathyanarayanan.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by:
Link: https://patch.msgid.link/20260930103739.2851980-7-peter.fang@intel.com
---
 arch/x86/coco/tdx/tdx.c                 |  1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 02c2871..ad489f2 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -213,6 +213,7 @@ int tdx_get_max_quote_size(u64 *max_quote_size)
=20
 	return 0;
 }
+EXPORT_SYMBOL_FOR_MODULES(tdx_get_max_quote_size, "tdx-guest");
=20
 static void __noreturn tdx_panic(const char *msg)
 {
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index 0cf078f..11d741d 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -209,7 +209,20 @@ static long tdx_get_report0(struct tdx_report_req __user=
 *req)
 /* Size of the header metadata plus the largest possible raw Quote. */
 static size_t get_quote_buf_size(void)
 {
-	return TDX_DEFAULT_QUOTE_SIZE;
+	size_t buf_size;
+	u64 max_size;
+
+	/* Start with the default buffer size, which includes the header */
+	buf_size =3D TDX_DEFAULT_QUOTE_SIZE;
+
+	/*
+	 * Override the default when the TDX module reports a size. Add room
+	 * for the header metadata. The size is fixed during TD runtime.
+	 */
+	if (!tdx_get_max_quote_size(&max_size))
+		buf_size =3D struct_size_t(struct tdx_quote_buf, data, max_size);
+
+	return buf_size;
 }
=20
 static void free_quote_buf(struct tdx_quote_buf *buf)
