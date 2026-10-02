Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0D4F93D2;
	Fri,  2 Oct 2026 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958594; cv=none; b=rHrMU0RBmkzJJDVKqG1Sgga/gLGZ2LpXS/021BtkUXd1+t6BGCH/Kn+E1Eera3qovoJKXvl002PY+airu5c5d6wpUKNoEn+bHu18he+lYhEDtFPJZGwa1oV1tXr3QNrNQXG4dvcknivdFVjZmVo07p+yAHEP1qd8Hn+NGyx2jII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958594; c=relaxed/simple;
	bh=/XC8xbJgdOweGSVSPmcUJfUtQxPra+GHokPqWU2TASg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=b4VBdl1qBx/IASrvijDmPBp2oxG3Pws6Eo6Grym7fPx+U8K3qi1A7bE4LSpHOurpew5R4fYTHGT0ZSWOx/sAvZbiZS/0RIK8ebKtXt7hZaRl3o9Wy14vAhLCybWPsKRFbR0bNgxjb9f8Lgtpoob2F1YAG3Hd56e6k6DkWe4A+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AvIP34Tv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t8IWoh16; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AvIP34Tv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t8IWoh16"
Date: Fri, 02 Oct 2026 16:29:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790958590;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLvr8C3w+Q5krICWAB9fmTaCkelqLghv8jf/1CaM+B4=;
	b=AvIP34TvSbElzH3AGOvXuFuvn7N2a2e8dtzWo0PFvDqeMNSjQvHRROGuLkPbe4d5a9hkYT
	zIyccaCN7gowV2iz63pa5M6u/zQtJTNohH1dkUV4orpQQ6qImgOrwIzJVbvoxqH6dOfhGo
	uM0epbDNmTaBvVYMQlqyZMDbnjygLo8kLOpr+v7ykWGYG6pJ+WXZ3PgbB8ae21O5y5hQkO
	rEZIK62QfK8hoL//inEA3qVhypyVOq/Gm7U8PT7Nq/iHPPyBBeN9nMwT/QbQfXnztEspRP
	mZyJv4OaruZwZ951xrSyf4R3UQnvm83mZ4oG1zM7xHUftzSfdMyEICJeMKgNdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790958590;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLvr8C3w+Q5krICWAB9fmTaCkelqLghv8jf/1CaM+B4=;
	b=t8IWoh16rJuYG5zszdTlMB+XQyo92GxAOeF7QkDLDNPjXpKBHixO6XGCaHF3ZODBC1dvqM
	vdfseUVDMfpL/ABA==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] virt: tdx-guest: Give the Quote buffer an explicit type
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-3-peter.fang@intel.com>
References: <20260930103739.2851980-3-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179095858901.3910103.8546664264134799927.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     0d3fe9bad7c9028b23f753c216d4fdc0a1c76fa7
Gitweb:        https://git.kernel.org/tip/0d3fe9bad7c9028b23f753c216d4fdc0a1c=
76fa7
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:51 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 09:03:05 -07:00

virt: tdx-guest: Give the Quote buffer an explicit type

The Quote buffer is always a "struct tdx_quote_buf", but its global
pointer is a "void *". A function would have to convert it back to make
sense of it.

Declare the global with its actual type, and give it a better name.

This creates variable shadowing in wait_for_quote_completion(), so
rename its parameter for clarity.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Link: https://patch.msgid.link/20260930103739.2851980-3-peter.fang@intel.com
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 36 +++++++++++-------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index a21bd03..83322cd 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -191,8 +191,7 @@ struct tdx_quote_buf {
 	u8 data[];
 };
=20
-/* Quote data buffer */
-static void *quote_data;
+static struct tdx_quote_buf *quote_buf;
=20
 /* Lock to streamline quote requests */
 static DEFINE_MUTEX(quote_lock);
@@ -209,7 +208,7 @@ static long tdx_get_report0(struct tdx_report_req __user =
*req)
 			     USER_SOCKPTR(req->tdreport));
 }
=20
-static void free_quote_buf(void *buf)
+static void free_quote_buf(struct tdx_quote_buf *buf)
 {
 	size_t len =3D PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
 	unsigned int count =3D len >> PAGE_SHIFT;
@@ -222,25 +221,25 @@ static void free_quote_buf(void *buf)
 	free_pages_exact(buf, len);
 }
=20
-static void *alloc_quote_buf(void)
+static struct tdx_quote_buf *alloc_quote_buf(void)
 {
 	size_t len =3D PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
 	unsigned int count =3D len >> PAGE_SHIFT;
-	void *addr;
+	struct tdx_quote_buf *buf;
=20
-	addr =3D alloc_pages_exact(len, GFP_KERNEL | __GFP_ZERO);
-	if (!addr)
+	buf =3D alloc_pages_exact(len, GFP_KERNEL | __GFP_ZERO);
+	if (!buf)
 		return NULL;
=20
-	if (set_memory_decrypted((unsigned long)addr, count))
+	if (set_memory_decrypted((unsigned long)buf, count))
 		return NULL;
=20
-	return addr;
+	return buf;
 }
=20
 /*
  * wait_for_quote_completion() - Wait for Quote request completion
- * @quote_buf: Address of Quote buffer.
+ * @buf: Address of Quote buffer.
  * @timeout: Timeout in seconds to wait for the Quote generation.
  *
  * As per TDX GHCI v1.0 specification, sec titled "TDG.VP.VMCALL<GetQuote>",
@@ -249,7 +248,7 @@ static void *alloc_quote_buf(void)
  * or error code after processing is complete. So wait till the status
  * changes from GET_QUOTE_IN_FLIGHT or the request being timed out.
  */
-static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 ti=
meout)
+static int wait_for_quote_completion(struct tdx_quote_buf *buf, u32 timeout)
 {
 	int i =3D 0;
=20
@@ -257,7 +256,7 @@ static int wait_for_quote_completion(struct tdx_quote_buf=
 *quote_buf, u32 timeou
 	 * Quote requests usually take a few seconds to complete, so waking up
 	 * once per second to recheck the status is fine for this use case.
 	 */
-	while (quote_buf->status =3D=3D GET_QUOTE_IN_FLIGHT && i++ < timeout) {
+	while (buf->status =3D=3D GET_QUOTE_IN_FLIGHT && i++ < timeout) {
 		if (msleep_interruptible(MSEC_PER_SEC))
 			return -EINTR;
 	}
@@ -268,7 +267,6 @@ static int wait_for_quote_completion(struct tdx_quote_buf=
 *quote_buf, u32 timeou
 static int tdx_report_new_locked(struct tsm_report *report)
 {
 	u8 *buf;
-	struct tdx_quote_buf *quote_buf =3D quote_data;
 	struct tsm_report_desc *desc =3D &report->desc;
 	u32 out_len;
 	int ret;
@@ -285,7 +283,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
 	if (desc->inblob_len !=3D TDX_REPORTDATA_LEN)
 		return -EINVAL;
=20
-	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
+	memset(quote_buf, 0, GET_QUOTE_BUF_SIZE);
=20
 	/* Update Quote buffer header */
 	quote_buf->version =3D GET_QUOTE_CMD_VER;
@@ -296,7 +294,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
 	if (ret)
 		return ret;
=20
-	err =3D tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
+	err =3D tdx_hcall_get_quote(quote_buf, GET_QUOTE_BUF_SIZE);
 	if (err) {
 		pr_err("GetQuote hypercall failed, status:%llx\n", err);
 		return -EIO;
@@ -417,8 +415,8 @@ static int __init tdx_guest_init(void)
 	if (ret)
 		goto deinit_mr;
=20
-	quote_data =3D alloc_quote_buf();
-	if (!quote_data) {
+	quote_buf =3D alloc_quote_buf();
+	if (!quote_buf) {
 		pr_err("Failed to allocate Quote buffer\n");
 		ret =3D -ENOMEM;
 		goto free_misc;
@@ -431,7 +429,7 @@ static int __init tdx_guest_init(void)
 	return 0;
=20
 free_quote:
-	free_quote_buf(quote_data);
+	free_quote_buf(quote_buf);
 free_misc:
 	misc_deregister(&tdx_misc_dev);
 deinit_mr:
@@ -444,7 +442,7 @@ module_init(tdx_guest_init);
 static void __exit tdx_guest_exit(void)
 {
 	tsm_report_unregister(&tdx_tsm_ops);
-	free_quote_buf(quote_data);
+	free_quote_buf(quote_buf);
 	misc_deregister(&tdx_misc_dev);
 	tdx_mr_deinit(tdx_attr_groups[0]);
 }
