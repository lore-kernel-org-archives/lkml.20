Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36BD493D29;
	Fri,  2 Oct 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942054; cv=none; b=IeHcr42HQNm734/5JFU2EV2cvgH7PfTYercToDnZyO7h09ZMe+TBcwZI7LNKECQH5TgQhYPBjhvdxCR9a7cs7J8ly0qV2Wd2lQiIp7FcmF4Hwl+2s74H5DNx1R1J+hHosWexz5ldiCtfOlFukvs/RQa0Uv6UN4bFJsGvie3aZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942054; c=relaxed/simple;
	bh=L4TnFQyW9TTdhqNL6FV3ducKzK8fSdPcbtZGF+p2ow4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SA3cnw6c+VqciRPFg8wtXgUhmXxlXcq5Vl4LrOEqWR4Aaprz4zWehx4DP2+uBekOVr/8G/9CZyTlp3Hmd/ulqASrJNt5LyuGr05xqUPD+yl23SJSnYhco63Ofyh3lZ8aSd1gi0t2gdyHT8D1j1KMQ/1NUO+A2WSxF/TPD1Zcg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=joSgFFZQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r6Q/D6+1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="joSgFFZQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r6Q/D6+1"
Date: Fri, 02 Oct 2026 11:54:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790942047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfSYOM68cR6+UjuxGCI0CSqTRfdqNicHmXnmPSHO5lI=;
	b=joSgFFZQw7bIReFK9JtPVIMdQ+v6g16Vm6GSzsIVsxjFUSphOlEB/XtJ6E9TXp1UU+uAOk
	NArAqJZEK0hZxS51wbJn2fPr9w2xbtr+/rQ6C8mZIlGh/P3AsC38cLxIMwQIJPZdCj8v85
	Am0yddFc1ULWF+I2rDFY/EcHezRQxaFrrmTGonE0YaBe2SIec60zuMpb90ppaXeNO1yCz7
	nwpZebBO4TqahPc9Malqg+Ij13kIiiIm7rditXAROfl+Dfizkx9dY1Cx+7eG0fFfPBN6PY
	whhPizy3+eU6oDC+vIBoSv/4nFrvSMPizHBv07ekFuDu92q7Zfvz5YfEMtg+Sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790942047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfSYOM68cR6+UjuxGCI0CSqTRfdqNicHmXnmPSHO5lI=;
	b=r6Q/D6+1jphb96hUYTJ/4fPWWDMk3xrLKzj5D54gqQxBq7Vhf2fe38rbAlNB9DDsLKN8V9
	YTZaX7ft+3315lDA==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/tdx: Take the Quote buffer as a generic pointer
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-2-peter.fang@intel.com>
References: <20260930103739.2851980-2-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179094204552.3910103.16075064167967541426.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     3a9651d8dd4760a12317f7d78999eec8c954eea0
Gitweb:        https://git.kernel.org/tip/3a9651d8dd4760a12317f7d78999eec8c95=
4eea0
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:50 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 04:38:52 -07:00

x86/tdx: Take the Quote buffer as a generic pointer

tdx_hcall_get_quote() takes a "u8 *" buffer unnecessarily. It is never
used as such, since only the buffer's memory address matters.

Accept a "void *" buffer instead. This avoids a cast to "u8 *" when a
later change gives the guest driver's Quote buffer an explicit type.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
Reviewed-by:
Link: https://patch.msgid.link/20260930103739.2851980-2-peter.fang@intel.com
---
 arch/x86/coco/tdx/tdx.c    | 2 +-
 arch/x86/include/asm/tdx.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index a38e444..92c2438 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -191,7 +191,7 @@ EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-gue=
st");
  *
  * Return 0 on success or error code on failure.
  */
-u64 tdx_hcall_get_quote(u8 *buf, size_t size)
+u64 tdx_hcall_get_quote(void *buf, size_t size)
 {
 	/* Since buf is a shared memory, set the shared (decrypted) bits */
 	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size=
, 0, 0);
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index e186dfe..97bf6c8 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -82,7 +82,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
=20
 int tdx_mcall_extend_rtmr(u8 index, u8 *data);
=20
-u64 tdx_hcall_get_quote(u8 *buf, size_t size);
+u64 tdx_hcall_get_quote(void *buf, size_t size);
=20
 void __init tdx_dump_attributes(u64 td_attr);
 void __init tdx_dump_td_ctls(u64 td_ctls);
