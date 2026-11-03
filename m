Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670832;
	b=NiV1uTdSNB+BuYL0KTxzO2wOZfhu2a+VYE107p/CzclNqwmJ6SkoX26m1+wcBHkoaeWr
	 DfoZbYRAAto4spTVuIXKOHuLAZdTxmkAzoEbdGdHjcs13a0hOXBLea72UgR7Iqpoa/SOK
	 vWqc19Fe8Cp5RpmSKpCoQpqsqi6ssjU0jj8svXYciETa5lFml2YU7FEYSwfRlTjW2ZkV/
	 RGaAsyUeolqR3103X9cxrsH93Wr11EzYN7HTfrQy1aatkAfg1CLd01CSQ9CFnRvlW8G73
	 5SvSnVW+bQig0HoEoLuEq41wPGRPneK/o1pWe3qWCcgIUhbSAihLvWECLQsFLXG7Fvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670832;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/6iaW3j/p/8/EREg0DDaBf/uCtmPFyFVAqjTpOqoErM=;
	b=gMVk8ZuT9sLlWWYKxNOKmhnqzbu3dBkTSq9rTjbIxXNb7J2WqkKP7c/xRo4KZIx2zoX6
	 G3UB5RwCluy1OJvKM5Ki7meZS/rgDeKe202Qi/WWO78wQesMWlRsjWrUUPjJ/vtxOVkZo
	 VyWd7zr86ahn3hYYs0Mz9b4dgCN/pLa9K0mqksqgEBaiTZbeHfrP36nztgNPC830tmTPF
	 dMtwlLbV5HSbabkyzHXGjuqt4pQ8kh7xpFVU0Zx7E+OgjaSdJGUvTqrgtkjbbxDunt+5M
	 0oL8RHSQjZgYK239iPEdE5iju7qVTg7rJsIOCVG/nU+rhXxTOl1QtLjf7k+78ge832g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4yA1C0zN;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B62606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B62606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4yA1C0zN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/6iaW3j/p/8/EREg0DDaBf/uCtmPFyFVAqjTpOqoErM=; b=4yA1C0zNq6NbFi6pU8YwjyYNVZ
	9uP2q4ZTfi+DnWCQ7H+463N4v/PVhdbPhg38A+PlhXaijSi01oIsLLDCWHJ4W6uKfBFZehSMZPgrr
	CMi+96vh//Jl7jVV2MOouUXPlbA1FKQuAKy/FaZtNST+DEN/6Ps6xoNPl8pVMe1rJ3I229XKr1Mx5
	E+6YhtapL/dNQGB+TN8NqoCEw0ICMqGxPbPqyOxeY5pRXQ7hE3GNHZPEsHQgHi4ix8DWFnEBIky3g
	PhPOgR9da7+rQ+7KpfEgnXEZFhujM15yzT5yrwHVGh3yOM1G0dR2xeMq5xtsBFZaoyRXDpZGyWhU0
	SiQobmkg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3ih-00000000pBy-1GJt;
	Tue, 03 Nov 2026 01:53:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v2] pstore: fixup struct member comments
Date: Mon,  2 Nov 2026 17:53:50 -0800
Message-ID: <20261103015350.2475615-1-rdunlap@infradead.org>
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

Documenting the callback function parameters is great, but kernel-doc
doesn't support that. Drop the leading '@' sign from these comments to
avoid kernel-doc warnings:

Warning: ../include/linux/pstore.h:201 Excess struct member 'psi' description in 'pstore_info'
Warning: ../include/linux/pstore.h:201 Excess struct member 'record' description in 'pstore_info'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: rebase & resend

Cc: Kees Cook <kees@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Guilherme G. Piccoli <gpiccoli@igalia.com>

 include/linux/pstore.h |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

--- linux-next-20261102.orig/include/linux/pstore.h
+++ linux-next-20261102/include/linux/pstore.h
@@ -114,7 +114,7 @@ struct pstore_record {
  *	Notify backend that pstore is starting a full read of backend
  *	records. Followed by one or more @read calls, and a final @close.
  *
- *	@psi:	in: pointer to the struct pstore_info for the backend
+ *	psi:	in: pointer to the struct pstore_info for the backend
  *
  *	Returns 0 on success, and non-zero on error.
  *
@@ -123,7 +123,7 @@ struct pstore_record {
  *	records. Always preceded by an @open call and one or more @read
  *	calls.
  *
- *	@psi:	in: pointer to the struct pstore_info for the backend
+ *	psi:	in: pointer to the struct pstore_info for the backend
  *
  *	Returns 0 on success, and non-zero on error. (Though pstore will
  *	ignore the error.)
@@ -132,7 +132,7 @@ struct pstore_record {
  *	Read next available backend record. Called after a successful
  *	@open.
  *
- *	@record:
+ *	record:
  *		pointer to record to populate. @buf should be allocated
  *		by the backend and filled. At least @type and @id should
  *		be populated, since these are used when creating pstorefs
@@ -144,7 +144,7 @@ struct pstore_record {
  * @write:
  *	A newly generated record needs to be written to backend storage.
  *
- *	@record:
+ *	record:
  *		pointer to record metadata. When @type is PSTORE_TYPE_DMESG,
  *		@buf will be pointing to the preallocated @psi.buf, since
  *		memory allocation may be broken during an Oops. Regardless,
@@ -162,8 +162,8 @@ struct pstore_record {
  *	buffer that is coming directly from userspace, instead of the
  *	@record @buf.
  *
- *	@record:	pointer to record metadata.
- *	@buf:		pointer to userspace contents to write to backend
+ *	record:	pointer to record metadata.
+ *	buf:		pointer to userspace contents to write to backend
  *
  *	Returns 0 on success, and non-zero on error.
  *
@@ -173,7 +173,7 @@ struct pstore_record {
  *	passed back to assist in identification of what the backend
  *	should remove from storage.
  *
- *	@record:	pointer to record metadata.
+ *	record:	pointer to record metadata.
  *
  *	Returns 0 on success, and non-zero on error.
  *
