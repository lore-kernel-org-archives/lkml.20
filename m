Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642188;
	b=OwdTP4S1+neZb7YpEKQO+Mfn5+ZU1kJpDKCgTA8XTYfz91PMH5ZhTTGH63BIyRS5H2Ea
	 a9rm8VXHQID7xtGc94vx4ojtnI8/Py4j5pf0Dm72sGDLSc8gVm2bdTHWRj1LVsiNfOUxo
	 mjtKWeb4KNIpcWLePETXxb65WeTbBheQrhizpQ+7l1npE/JsLJ08gMiN+6/1dmE9q4q+q
	 80WfLYaODqZB+HLMG5iWJtwEl5Zab7+a+r4RAy7eO0ipnjwlzDgNbsyAqVLnaAlAFW1kz
	 O6HA+s2C2DCguEteUr0O/9Pez4al165Rru2tNtDpD/QSlirnRgFpAX8pBvMg6PQTS9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wksPVf4+3BY129091ZVPp8TwYhF+Bq8Qv4YKU7zTmjs=;
	b=scuTuLcQjjcqO0L5RYqrwOCPxeoVH1xgihMVBi8MctLTy7yvf3tZQOBzxSLQh3Q05esw
	 SW60a4Cn5COIfMIKje+KBKwTBvSprcjynG56Gf2UWT+jgcHsYn/W26xSfbBNowF5EGu8J
	 VJ2KVc+gVSG8B0OBcG0B/KgwthyGss8RNLQOonjMwtmeCzIEU6fq7ogf3sYeBjni4ZCN8
	 Od/3/SbVX4yJWXNYBEkFLESB4/3/dRyjTebkq/AKVTbmeAT9H2utP7szdhhhgLTHWOXnh
	 zFVCULN5M/TFzUfr4sLmPCkX8QDIUIvMO6+MhHxDkvLPriqZcVXGFytFOmShtqTmqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZK7zyHM;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BE606A589;
	Mon,  2 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7BE606A589
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZK7zyHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wksPVf4+3BY129091ZVPp8TwYhF+Bq8Qv4YKU7zTmjs=; b=dZK7zyHMmVcP48N00IenBMCX+Z
	o/yReFYgu0RlweK61kvVICf3+IdrR04qdXyCDYFGJlfQiMz3Vf18t7orAjRSwQnHJfQIBX6UU1BH/
	DpiFtlXZi54c0aV2bdZz7/uWb+H3p3wPrAkobXdf4hBYKa+sP98O5HOzKBxenRi2ul/w3nxnbFU0C
	au3VMDS9FkEXUnokh00uqNwuR6KExyRWhKz4Bz0VeCeAW5a1iUMeLkfnErUN00knw5G/sm4s+DwdF
	aDCYH6zmK0tb9CmbVmr5mJ3CL6kfOXOaDrnnNy/Me/GDAPIbbJ2Wno5OnJ/2X59JoziyW/Cn3MA1i
	rGfY+6Vg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwGe-0000000HXav-43SO;
	Mon, 02 Nov 2026 17:56:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] Docs: mmap_prepare: don't italicize structs
Date: Mon,  2 Nov 2026 09:56:19 -0800
Message-ID: <20261102175619.2274135-1-rdunlap@infradead.org>
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
Content-Transfer-Encoding: 8bit

Using a single quote mark `struct xyz` causes the html output to be
produced as italic. Omit the quote marks so that kernel-doc's automarkup
can make the "struct xyz" bold monospace ("code" style") in the
generated html.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
---
v2: fix one more instance of unneeded single quotes

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>

 Documentation/filesystems/mmap_prepare.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20261030.orig/Documentation/filesystems/mmap_prepare.rst
+++ linux-next-20261030/Documentation/filesystems/mmap_prepare.rst
@@ -156,16 +156,16 @@ pointer. These are:
 * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
   physical address and over a specified length.
 
-* mmap_action_map_kernel_pages() - Maps a specified array of `struct page`
+* mmap_action_map_kernel_pages() - Maps a specified array of struct page
   pointers in the VMA from a specific offset.
 
-* mmap_action_map_kernel_pages_full() - Maps a specified array of `struct
-  page` pointers over the entire VMA. The caller must ensure there are
+* mmap_action_map_kernel_pages_full() - Maps a specified array of struct
+  page pointers over the entire VMA. The caller must ensure there are
   sufficient entries in the page array to cover the entire range of the
   described VMA.
 
 * mmap_action_map_discontig_kernel_pages() - Maps a discontiguous range of
-  `struct page` pointers over the VMA. They must span from the start of the VMA,
+  struct page pointers over the VMA. They must span from the start of the VMA,
   but may terminate prior to the end (leaving the remainder unmapped).
 
 **NOTE:** The ``action`` field should never normally be manipulated directly,
