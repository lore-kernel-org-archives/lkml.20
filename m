Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208862;
	b=PwRhaZydQ7KDI9H9vatInwaI7YvaZpcvy/3X8PwqVe4Re/AozGrHqku/qIjh4m+Op4CN
	 UzpWGLYyQAV47w4tinvQx97pg17XEdnJtMF9bndHrr10vfPDvuDpY+JIFXvEtgbGfE4fG
	 2P37x6AjiKpKeqkEdYEqcl8e23mUkeNzPyriJXb9HYpmog1XbaLyXWd0NyniuRQzPwzh4
	 axmdBjlnV/cc2TkJHg6tf74BKCimOtbI1L0fsFUgaWYivDBfQSs3Emoy9787z+NE+Pj9L
	 ado20n5rJZw+gwgsU9d04TSIBslTh5xO+5Ju2/e7neFZyLC2E820UPZg+BIqPvFdlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208862;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=21fyeoqlzkV320q2Wq+UIfBvB3657QnSEdzhcqBUx4Y=;
	b=DWFOWX5le9hORToI9Z8spvn5QvN3JELMLxPVHOrJaKr/9sgZ4Sric4VSgwAycssgswsx
	 1GtgA/fhOBGHuMZE043EyDT6vnvtUwGEwu1YbAfkt9dQpKOBrzxDXhX8rvs8x4wGwKwBj
	 AnSRzft79BAlUlfMsIsiBDxgazzOAgU2VCtoIU1A23jLidRCkomOXJhGa0TtWGQSyf5AY
	 O03R8LftOVPrUxHPpD9ONXj11ELNVUnZtSx/Qy8boaEQZLXIk5RO8Z4bF7RBk1rlh+FBp
	 ELCLee0ZQoYvVXuOJDEFyr8DvBamd0efWM6K+3FvYa6QRrCJU9BsyGpHAJwp4htWRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oX3YydJ1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=b7GODS1U;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EE3606A31C;
	Mon,  9 Nov 2026 07:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oX3YydJ1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=b7GODS1U
Date: Mon, 09 Nov 2026 07:20:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794208857;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21fyeoqlzkV320q2Wq+UIfBvB3657QnSEdzhcqBUx4Y=;
	b=oX3YydJ1xjOZ1eha0/jFD77rpE0C56/vAA1GWaIFmWa1/fbwyCKKTnZgOeoDe3Nr9tz72D
	MCegZjrZzCvAR1O9xedfP7BSCE4aITvynrKOqMT9EmK+Pk0yGeT4xr0iF4DhDK7KUltgVK
	ygAdDmIjj2y+sYvsk6OWEhDtOc8olFTL91Qxo/hNLA3QEfTioJd78lK0XpcTEF16KbrP4e
	0td1c2VUkUh9ocoCGf8iKNUpDndbyKnfT1tXxVA6qE5flKwaDjzhi9S26KUwOauOxbCqCk
	X8xzE+6mdhV36Grsc32Oyo/p7ZMWBEcKCpiM5N+1zSS5gR6QHMk1XVDxw8lqDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794208857;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21fyeoqlzkV320q2Wq+UIfBvB3657QnSEdzhcqBUx4Y=;
	b=b7GODS1UM84WNZY2K5r44I6TJw2PXtbe+8pTJ4Z1K18NhMU1PcLtIvaJBUMUieZ9JomMnN
	svUgFaxbWeNTxUDQ==
From: "tip-bot2 for Breno Leitao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/sev: Fix kmemleak false positive for the RMP
 segment descriptors
Cc: Dave Hansen <dave.hansen@intel.com>, Breno Leitao <leitao@debian.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@debian.org>
References: <20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179420885572.2093942.5806996038965456281.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     641890fe65068455c73f45288bc6f5e435650dd6
Gitweb:        https://git.kernel.org/tip/641890fe65068455c73f45288bc6f5e4356=
50dd6
Author:        Breno Leitao <leitao@debian.org>
AuthorDate:    Tue, 03 Nov 2026 06:01:56 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 08 Nov 2026 22:57:10 -08:00

x86/sev: Fix kmemleak false positive for the RMP segment descriptors

kmemleak reports the RMP segment descriptor as leaked on SEV-SNP hosts:

  unreferenced object 0xff11000140e23b40 (size 32):
    comm "swapper/0", pid 1, jiffies 4294680964
    hex dump (first 32 bytes):
      00 00 00 40 00 00 a0 ff 00 fc 05 04 00 00 00 00  ...@............
      00 c0 5f 40 00 00 00 00 00 00 00 00 00 00 00 00  .._@............
    backtrace (crc abf63fca):
      __kmalloc_cache_noprof
      alloc_rmp_segment_desc
      setup_contiguous_rmptable
      setup_rmptable
      snp_rmptable_init
      iommu_snp_enable
      state_next
      iommu_go_to_state
      pci_iommu_init

The descriptor is still in use: get_raw_rmpentry() reads it on every RMP look=
up.
Its only reference lives in rmp_segment_table[], and alloc_rmp_segment_table()
takes that table from the page allocator.  kmemleak does not scan page alloca=
tor
memory, so it never sees the reference and reports the descriptor as leaked.

Nothing requires the table to come from the page allocator, so allocate it wi=
th
kzalloc(). kmemleak tracks and scans slab objects, so it now sees the descrip=
tor
pointers in the table.

Fixes: 0f14af0d1d7d ("x86/sev: Treat the contiguous RMP table as a single RMP=
 segment")
Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://patch.msgid.link/20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@de=
bian.org
---
 arch/x86/virt/svm/sev.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 4de9681..62ec762 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -361,7 +361,7 @@ static void __init free_rmp_segment_table(void)
 		kfree(desc);
 	}
=20
-	free_page((unsigned long)rmp_segment_table);
+	kfree(rmp_segment_table);
=20
 	rmp_segment_table =3D NULL;
 }
@@ -369,14 +369,10 @@ static void __init free_rmp_segment_table(void)
 /* Allocate the table used to index into the RMP segments */
 static bool __init alloc_rmp_segment_table(void)
 {
-	struct page *page;
-
-	page =3D alloc_page(__GFP_ZERO);
-	if (!page)
+	rmp_segment_table =3D kzalloc(RST_SIZE, GFP_KERNEL);
+	if (!rmp_segment_table)
 		return false;
=20
-	rmp_segment_table =3D page_address(page);
-
 	return true;
 }
=20
