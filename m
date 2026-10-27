Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120575;
	b=bgogkOIR5cQzxZ5BpNk6zsK0Yos7ipeFQRdf7dF+C7HBT73XS4HzzQzjGqtkfV0rQpWW
	 enubFBeGCtbcluTRw1NLDz4TsI5YhrVxdqRVEEE2zktWFQZW1Lgd8CB6o+5IugKameVYc
	 5GrgpFAEIUDwSFLP056ttIfr+Wr1K9E7Dpw38T8PkgcFU1xYiq7d0vQmsYud1nxJXtcBU
	 h00fFwfTSSbHwQV9tPB8pY1Ug/rScPPUTcnK935OwjKYU5hFLaziG4rDftsM9UOwTU8Tl
	 mp7+gjlRjQSYYdWZYTnmgAvIb8v+Z6QwaN0N7l0b2t4+EGtDIJ+9xg9Y48qMAR4gu3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120575;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QzKhctGyHAq8LmL2v4QfrOSfn76229O83J+Y0DCBOaI=;
	b=Edj/Jdt+agRyTlL+XxcpsV1yZLIzYhMr6p1dIKHqCB9OeIHSycNu+mmh4HYWFniLigg7
	 PoUcz/efQXGY/E4o/UZuakliMe13DrINcHCMuoD933FRqVI2u3y5X4Uo0BgdtL/uNrAaE
	 YzAMGwVlfPHDqozYeWY1VP9r7SDfn/P64jGw4W+FkmOXx+qFkFxtdbPuP6D/+QB0PTwan
	 /1x9B69igVRyGJNyNro2ubR8Vf9vljGCE2CIq5lzK3n7or/Pc9xXuicPYsUO7U+o3SYnU
	 zGMaCk1MfM4pfGm/vCFS72AcadcjCYmFXIPAFMtqJCr+5bGPfGVCWzs1gK2UQm4Y8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gNEEH0fd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gNEEH0fd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADF71F01825;
	Tue, 27 Oct 2026 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793120574;
	bh=QzKhctGyHAq8LmL2v4QfrOSfn76229O83J+Y0DCBOaI=;
	h=From:To:Cc:Subject:Date;
	b=gNEEH0fdN6CfXyqT78freYkUh7TC2ninUZORQjbkxx2stUVNgqf6ccK8qmqhzblwB
	 4PuVDOMZgF2CcbCZuyMsdqXCZ63n9HUQ2nn6IAx71mfj0pViEtyk/fSB+g2+Mph/Wb
	 KLbWqCl8ZS9tK91EhmQJ0f+JhP/qsETFsmwoaHyk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] uv_mmtimer: keep the mapping of the RTC read-only
Date: Tue, 27 Oct 2026 18:02:53 +0100
Message-ID: <2026102752-extrovert-undaunted-d6cb@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=aob91zEKWLN6lVn+saRWzKrvp+l8SKX22+Vwdk4ufGg=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPbtocU2CubSh49KrNVI3LLbrVa/l8F4d7vppddZpSe Tw63d87YlkYBJkYZMUUWb5s4zm6v+KQopeh7WmYOaxMIEMYuDgFYCIq0gxzRT566JkWns2Zv1Ls kGabWuCb6m33Gebn7fS7fCWsjYeBs8Lqnty9Sbmfu5UA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

uv_mmtimer_mmap() refuses a writable mapping of the page with the real time
clock, which is a page of registers of the UV hub.  It leaves VM_MAYWRITE
set, though.  Who has opened the device for reading and writing can map the
page shared and read-only and then make the mapping writable with
mprotect(), which gives him the access to the hub registers that the check
is there to prevent.

Clear VM_MAYWRITE.  mprotect(PROT_WRITE) now fails with -EACCES on such a
mapping, on a private one too.

Fixes: fbd8ae106850 ("drivers/char/uv_mmtimer.c: add memory mapped RTC driver for UV")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/char/uv_mmtimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/uv_mmtimer.c b/drivers/char/uv_mmtimer.c
index 956ebe2080a5..1cced9ef745b 100644
--- a/drivers/char/uv_mmtimer.c
+++ b/drivers/char/uv_mmtimer.c
@@ -157,6 +157,9 @@ static int uv_mmtimer_mmap(struct file *file, struct vm_area_struct *vma)
 	if (PAGE_SIZE > (1 << 16))
 		return -ENOSYS;
 
+	/* Don't let mprotect() add the permission afterwards. */
+	vm_flags_clear(vma, VM_MAYWRITE);
+
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	uv_mmtimer_addr = UV_LOCAL_MMR_BASE | UVH_RTC;
-- 
2.56.0

