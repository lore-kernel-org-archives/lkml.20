Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80283492199;
	Fri,  2 Oct 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942055; cv=none; b=Au8KrLDtdVbx64iAUTTVPO9ZY+DpYr6q05xtc+G9OoUl/P+27KhZMVnTmG5MM/MoGLLZ2aFWG7DrxNipn7+/muYspWP1OBIlfO3G0mPYXh1qGsM9hZi3PwsuJ9x22a83zJpIy/vmom5TinhSQIinr1BEp557OcH0CQQ3uZEc3EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942055; c=relaxed/simple;
	bh=TWnJXoJE51aODNPg7P9U4BiYxM/4l9a8WI3w714Ps5Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iYjI8x8ZajVNAg+GpNu9Ju26LnySBlU7Iky4ZxI8YN6RrZTuEw1XVFCFdKl9jx18WTSSDN6jmn4WNYbwitx4zXTGdIjWaOp7v+KdDV394JUNE9EOTMOIxS40eF5R6J7xwL6YAtKKv2FgX96IHyG8BileMIZ5rIBrRVhQa1QAtUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0kKvWnpQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zq3eZQuk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0kKvWnpQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zq3eZQuk"
Date: Fri, 02 Oct 2026 11:54:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790942045;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R89hsoVkQdEDKgVgLXbmNo0ADfmIJ0o+UzMPOsGVmZM=;
	b=0kKvWnpQ+oAgZEsPl8thabRvVvj0MnJ5Zq4aKJmOqbd6XUQAMzbibT7zBTRSHE9hXN8jGz
	D2Zm346ei+T6/wZu38HT9Stx6k730+aWj0A7WvzfGcu9XeRA2DbIIx7pbLGkVeYXrSZGOK
	qnLy2MHv2c1xpCVS1ivgkFIvZqp0YG5mM1YUUP0cgNZYfGDyzHcS4gXXhSim9gSzjYTwx/
	P7MwMq19qG0h0reVfFKhd3BTwUoNQLM5WcMdENXs1UkSMdYZvZUR9H8m7561vYXAI9GNHt
	zslSyi4jBNxvDGOdMA7Yn1pGqsyzHDhOk5ZNsl0iH8hXSibLrKdXw5+1HgWacQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790942045;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R89hsoVkQdEDKgVgLXbmNo0ADfmIJ0o+UzMPOsGVmZM=;
	b=zq3eZQukqUQ7fmUUfP5ICdi05SZqRgy/5r/0xu9uCL5sUr2z0ioUVxPRQq+41AqfeELTUL
	IlAo4p0p/L/h/sAg==
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
Message-ID: <179094204406.3910103.820878334160865632.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     d0690b7700b4c18ce81d48d1889bf7c577ee251f
Gitweb:        https://git.kernel.org/tip/d0690b7700b4c18ce81d48d1889bf7c577e=
e251f
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:51 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 04:38:52 -07:00

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
Reviewed-by:
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
