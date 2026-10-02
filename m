Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F014F5DE4;
	Fri,  2 Oct 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958591; cv=none; b=QLH7rXTk4EPwLVP4k+o7iNcZt73CR2vMrf+41rb7ea6eVT7ENYi/eIZtqpL7n/Eq6xa6j1yAXGYIcW7Q/kNnkLi8uYrYR543nW6ia3W3YKKYFAcY+XxQ22FCEEhbRsb48CAntUiIcuw0HahXGNSmJQFIHYKuN0sCPHFBn9OGyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958591; c=relaxed/simple;
	bh=tQgzLQkmn0ICwprKWS/ai3KQqP6igwEM+pz9fueKAXo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IW62BiKkECsJgA5VCqvXHy0HyV8hpSQ8NFqfJl05U8dXmOKONnfcVqsMowhENSrkPBacRJsatA5HAsCa8OxNU/XdPZrKDVHABC+EQIwUNbhZqZDZG0K/1MZMqhDHDefImMY2Y46lIlMnB9uzvjSt0UaNKY6/mPD4LMUz08OiuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V82j1tQX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gDLF1XFb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V82j1tQX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gDLF1XFb"
Date: Fri, 02 Oct 2026 16:29:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790958587;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHUmC13xuL7nFckLb8jN2aUUwMBoB4bNeS5QvWWhJAU=;
	b=V82j1tQXPfoxUwn5wqcFU7CCUYPTHm5TnasWIuXXhpOl5ivcyaPM54QDjn4ylR6XQseKqi
	R2nz2vVND4yJJ0jKuhzpCm/2nG8aa1JfAJl1XuOZNvns4caNo4UrE0tJ399BZ1nTJTQhju
	t9vcBtUZxJgm/8sErp1NkrwOAiJqWs/Hj9xAwgd4mtQUfnCpuI04MU4KPsnKgh/jRmNvhy
	8IuGHySrDy+IMnfC1A85DtuSNIXq5qxD+CUQ1hz47DbGOd5ZXlFPy0iefvt5nCUZZjlZGn
	NsC3HZrVrtgUhUTU6++tmQJpgzteZ5Kh+hEuCpEKiWyvjFFNKVIWY5VnBsXL1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790958587;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHUmC13xuL7nFckLb8jN2aUUwMBoB4bNeS5QvWWhJAU=;
	b=gDLF1XFbd9K8/E6bVGs+EFKeTJJT7y9oIZDj5cgM65G8KFIhcNodV9c5dbrFzqZdwVxJ7p
	IhNyMULdin5jrgAg==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] virt: tdx-guest: Add a helper for the Quote buffer size
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-5-peter.fang@intel.com>
References: <20260930103739.2851980-5-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179095858609.3910103.3982683665485871869.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     ef83bbc05ceb1df7d28e2cbb44ab3cd8584594de
Gitweb:        https://git.kernel.org/tip/ef83bbc05ceb1df7d28e2cbb44ab3cd8584=
594de
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:53 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 09:03:33 -07:00

virt: tdx-guest: Add a helper for the Quote buffer size

The Quote buffer size is a constant sprinkled across several places.
Read it from a helper instead. And rename the constant to avoid using a
verb.

This sets up the plumbing for a later change that makes the size
dynamic.

There are several "sizes" at play here: the raw Quote data, the Quote
buffer (the header metadata plus the raw data), and the allocation (the
page-padded Quote buffer). The helper returns the Quote buffer size and
leaves page alignment to callers that need it.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20260930103739.2851980-5-peter.fang@intel.com
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 31 ++++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index 77c63c3..0cf078f 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -162,7 +162,7 @@ static void tdx_mr_deinit(const struct attribute_group *m=
r_grp)
  * DICE-based attestation uses layered evidence that requires
  * larger Quote size (~100K).
  */
-#define GET_QUOTE_BUF_SIZE		SZ_128K
+#define TDX_DEFAULT_QUOTE_SIZE		SZ_128K
=20
 #define GET_QUOTE_CMD_VER		1
=20
@@ -206,26 +206,36 @@ static long tdx_get_report0(struct tdx_report_req __use=
r *req)
 			     USER_SOCKPTR(req->tdreport));
 }
=20
+/* Size of the header metadata plus the largest possible raw Quote. */
+static size_t get_quote_buf_size(void)
+{
+	return TDX_DEFAULT_QUOTE_SIZE;
+}
+
 static void free_quote_buf(struct tdx_quote_buf *buf)
 {
-	size_t len =3D PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
-	unsigned int count =3D len >> PAGE_SHIFT;
+	size_t alloc_size =3D PAGE_ALIGN(get_quote_buf_size());
+	unsigned int count;
+
+	count =3D alloc_size >> PAGE_SHIFT;
=20
 	if (set_memory_encrypted((unsigned long)buf, count)) {
 		pr_err("Failed to restore encryption mask for Quote buffer, leak it\n");
 		return;
 	}
=20
-	free_pages_exact(buf, len);
+	free_pages_exact(buf, alloc_size);
 }
=20
 static struct tdx_quote_buf *alloc_quote_buf(void)
 {
-	size_t len =3D PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
-	unsigned int count =3D len >> PAGE_SHIFT;
+	size_t alloc_size =3D PAGE_ALIGN(get_quote_buf_size());
 	struct tdx_quote_buf *buf;
+	unsigned int count;
+
+	count =3D alloc_size >> PAGE_SHIFT;
=20
-	buf =3D alloc_pages_exact(len, GFP_KERNEL | __GFP_ZERO);
+	buf =3D alloc_pages_exact(alloc_size, GFP_KERNEL | __GFP_ZERO);
 	if (!buf)
 		return NULL;
=20
@@ -266,6 +276,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
 {
 	u8 *buf;
 	struct tsm_report_desc *desc =3D &report->desc;
+	size_t quote_buf_size =3D get_quote_buf_size();
 	u32 out_len;
 	int ret;
 	u64 err;
@@ -281,7 +292,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
 	if (desc->inblob_len !=3D TDX_REPORTDATA_LEN)
 		return -EINVAL;
=20
-	memset(quote_buf, 0, GET_QUOTE_BUF_SIZE);
+	memset(quote_buf, 0, quote_buf_size);
=20
 	/* Update Quote buffer header */
 	quote_buf->version =3D GET_QUOTE_CMD_VER;
@@ -292,7 +303,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
 	if (ret)
 		return ret;
=20
-	err =3D tdx_hcall_get_quote(quote_buf, GET_QUOTE_BUF_SIZE);
+	err =3D tdx_hcall_get_quote(quote_buf, PAGE_ALIGN(quote_buf_size));
 	if (err) {
 		pr_err("GetQuote hypercall failed, status:%llx\n", err);
 		return -EIO;
@@ -311,7 +322,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
=20
 	out_len =3D READ_ONCE(quote_buf->out_len);
=20
-	if (struct_size(quote_buf, data, out_len) > GET_QUOTE_BUF_SIZE)
+	if (struct_size(quote_buf, data, out_len) > quote_buf_size)
 		return -EFBIG;
=20
 	buf =3D kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
