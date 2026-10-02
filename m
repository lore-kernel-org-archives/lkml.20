Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219747668A;
	Fri,  2 Oct 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958589; cv=none; b=EJGoj9uMLtwPucdaEquOKXlkGDBmxjbA33TpibM19gci3dOenJiCU7yvzB/t6J1IBT7jz+BefAU269+8oqbYB4xGR/3VXHUt5T1s1bayhJvjdYj6UeKpaW3+0v6SbeAPWLu1M6+UHTjoYIuBMw6EKAPK0V6XWNOaTuMCmgZBbS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958589; c=relaxed/simple;
	bh=e0YF8SxJHsZr4/voB1oBiI1paoJYJexYw/nj736WQX4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CQaOna4sSvLg1lAqTXPX0OpawVxb9v2/0Ze81/nmsomrqT2wSlikA8FyIrnpXp/Zgj1VW52oS1jZQpYZ++BOxGunnRnOx+VgwhvdXT7wswMc0uh4Aspq/wt9hGyozt6FYMnt6qoG7pEZ41t/sN6Enc9l7dmekFYiEZ4Q7B6RbJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FMQYvWv5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h9KGnJhB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FMQYvWv5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h9KGnJhB"
Date: Fri, 02 Oct 2026 16:29:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790958585;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY6WiG36431Tf7Uvw/38/38yUH1T0ERSmXiJYb/CgPw=;
	b=FMQYvWv541CSs7IGK/L6OyqyQtgfhRWcxKOL2hDKHh8/dku+ZlUwnE6QYbAisCdb9MolgM
	ABtQF+/jbHqMnDp7C3sBAjxmeN3qpVZuUK22h7Yr9Q5HFQf9d9oQrfEZunHajJuLYpDqKy
	pP/NovgJF3hr/D1zIaQN2sX2demGyko079uRad/XpKD1OqDlD0R2Y4g3ShgIZVQ+m1MJKy
	4wb0RZtnQXAkavgHej6iiLrtyX6BMnmVyBMjwd7Kp8ibdA3iydO/yBJzlXSqY0Vyi7H+GS
	DdySXru5lHAd5Lozq0TSCeBpWKEUIowGKp6+7FUclcrlEMsMZs5Mhl/muyFQKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790958585;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY6WiG36431Tf7Uvw/38/38yUH1T0ERSmXiJYb/CgPw=;
	b=h9KGnJhBvEQ+ISX0WRAUbhdOdxIyKUonKYCxBWUFGv2ih4867KXa4kGjDXklrSglZpcQ4s
	xO+SixOFPJi/IOAg==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] virt: tdx-guest: Make the Quote buffer size dynamic
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-7-peter.fang@intel.com>
References: <20260930103739.2851980-7-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179095858314.3910103.10093912808378605506.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     5b8212d45d99b77c84e3ad305a295e9e65d5ef20
Gitweb:        https://git.kernel.org/tip/5b8212d45d99b77c84e3ad305a295e9e65d=
5ef20
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:55 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 09:04:01 -07:00

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
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
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
