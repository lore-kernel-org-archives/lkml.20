Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0034A485CC1;
	Fri,  2 Oct 2026 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942049; cv=none; b=Db16lYjWIzKFj4ki9lB0nhH+Uk1u0x55czjhl5FHRmVNMXzcbQE8yWO9ojc48wlJjL7/U83WyNHyYoBiAcifEZ1IfjBIqF4AltnIpUCuGIZddrweZaNMxAn/hq/edVfPHoVX3zBPxXIKjA2ikfJ47Qc3t5FzubNIeQQs9Dwq8k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942049; c=relaxed/simple;
	bh=6D+bs0DPKpox2MlDZUjL3jOXnE6BMSkG3M/nVW4cDhM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Z5wl+VXS1GWjZRZXXU5s7TKpeVqdfZtCMfr7yIXO/WARDIjBmrm9b1r3zrN811tSL/Ktig6GLjDeEX4SHnE5pqPLlUWokO7uQ0YpyI2N/0jkJxVhSeTage5w+FmZVM/iYn9kXGKskrGI/1rAJrVDyKbyhg7f8NdHmRIQh8RLAK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xls5Mu1x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8ArrTYzA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xls5Mu1x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8ArrTYzA"
Date: Fri, 02 Oct 2026 11:54:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790942044;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XongJW4jltf0U+24e7ZXCmKdf2HYnYY2pP/pC3X3CE=;
	b=Xls5Mu1xKK6R9RMHxZg6fQMuAszb04CcBXKTbw6PSFjHdz/WJVxwLzHNfNVioGiAFgQr+W
	3/ZRC3L5L/fnP/rb5tju2zxjVyEImN5knff575j828O6L/tW90ZXgLrbqaELGNRJr36N2O
	k6E4LUFK5h/z3UTWW1ixvuez5/MmP3QFGwKc259Q3M/cGhI7yrXs1QIZGBWMht428Luufg
	kbEBg31h7k3c05kJ6T3Xt+XSipMIeIwuN8JtYiHsLZwHECAQ2GwfLE5vcVxyjFmKrHJ8bY
	fTBrT8P5LBNC0MOV8NfJiQnIA2+gZ6hduXfCPumBLgy81kfM1kDc29RtUxeJeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790942044;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XongJW4jltf0U+24e7ZXCmKdf2HYnYY2pP/pC3X3CE=;
	b=8ArrTYzAw0vrZfSzeNgUnshQs7prnPpy1maZSyJckGF4dsF+axe77rgRf1kk+2i2qYL8DV
	QP/zwOtz+eYspCBA==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] virt: tdx-guest: Calculate the Quote buffer size safely
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-4-peter.fang@intel.com>
References: <20260930103739.2851980-4-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179094204270.3910103.3808136760762563727.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     b37769d84f321cbb524acc23d0f5bbda4ea1f574
Gitweb:        https://git.kernel.org/tip/b37769d84f321cbb524acc23d0f5bbda4ea=
1f574
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:52 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 04:38:52 -07:00

virt: tdx-guest: Calculate the Quote buffer size safely

struct tdx_quote_buf has a trailing flexible array member.
struct_size() calculates the size of this kind of struct safely. It
handles overflow, which helps since the Quote size comes from the host.

Use it to rewrite the bounds check logic, since

  "header_size + data_size > buf_size"

... is more readable than "data_size > buf_size - header_size".

This also prepares for a later change that needs the same
"header_size + data_size" calculation for the Quote buffer size.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by:
Link: https://patch.msgid.link/20260930103739.2851980-4-peter.fang@intel.com
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index 83322cd..77c63c3 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -170,8 +170,6 @@ static void tdx_mr_deinit(const struct attribute_group *m=
r_grp)
 #define GET_QUOTE_SUCCESS		0
 #define GET_QUOTE_IN_FLIGHT		0xffffffffffffffff
=20
-#define TDX_QUOTE_MAX_LEN		(GET_QUOTE_BUF_SIZE - sizeof(struct tdx_quote_buf=
))
-
 /* struct tdx_quote_buf: Format of Quote request buffer.
  * @version: Quote format version, filled by TD.
  * @status: Status code of Quote request, filled by VMM.
@@ -313,7 +311,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
=20
 	out_len =3D READ_ONCE(quote_buf->out_len);
=20
-	if (out_len > TDX_QUOTE_MAX_LEN)
+	if (struct_size(quote_buf, data, out_len) > GET_QUOTE_BUF_SIZE)
 		return -EFBIG;
=20
 	buf =3D kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
