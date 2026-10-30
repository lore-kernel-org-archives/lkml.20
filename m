Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339566;
	b=0bAyUNHA74CZr8J7ObmowJY/ckGJcz0QRSeK+UyliM55XKQ/mu4BfkmfE3Z6RbbNAkWq
	 NKu++G1s2gnqNp5vbIXlKBhl7ZbypdMGLcFtI+MV3bOE0BzizbOlb/DrQIF/9uNVB1ELd
	 hsiXSkoH9NB/TTfeBvAD7j/vH0DTG8rGXji89EhFxbOR/95Jm6pY7mHgavwW5gcl48WxQ
	 gxV+pMcus9/JpLKZwbJG4NQ3OB1H+v27TvQ+xv5Il4gD/1O5KuG7xL8FdIuYqst8McCIo
	 kRdTbHF7nwTHvDNw6KnpU1Pitfse6W1KGG+zQMsCVDVFpBaFWUdVBobnEoN6PuUiJXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=VbRiuv1zzZPpsXqO5zwHM0e9x6dnlvGPnhrO6rm2E7A=;
	b=O4Y1hx4N74jN1JWCluPeRsRcwgezXWSgHUjXsPpiywmb/Ii9UL1LZLdbe4IBwNZsw8Ur
	 9Yc1TXMOm6MEaCcDHuXQQaDDs6AyesNNeLZx9Xj1X7/XsbrVzPoJj4z6x+3hyxo4XR7sr
	 UzwPbEB1NfTTRF1SM+l8IMA+EO3UaDDJwZ/56QkNk0BisQZNENvjjuFEenuObWLtQ8JG3
	 Ro3W5WS5uMyrDsHSTvM5jcyoJU3SKO6QXCY+drq1u0T06T+NHX/wnR/NnK2Rn0Wev5+Ic
	 Djd5/7sIlqvg1re8ypCwLAVQAc3KxgCSSdTvpBGHmDVBNgD/PGkFQvR2m5r1phOIjRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kL+rJ5ml;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43951606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43951606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kL+rJ5ml
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18cdcfc05ffso416532c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339564; x=1793944364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbRiuv1zzZPpsXqO5zwHM0e9x6dnlvGPnhrO6rm2E7A=;
        b=kL+rJ5mlhDTdElNXQpMNmC+lFFdeCCCvkIJjS+DDV40iDQZXyTs3SBB2eGEOCQJOtF
         i4Ok80Jl/dyQnnLRATG4Td3Gswm32YCiQT8xqghaBRcVa79OSoHGtQs2R39LFX/jwnL/
         /eRKmGGBw20AnqFQjZpcJKJVmMlLF8NZCpZrgKuz/yAZJ9dEl3egS2lv0Or/2b7DKW7a
         qXzLrrXoXBoNE9m+gfyzTCmLd4rfN5+NfgwLmiILLhjUsj+Z7v94MyQ+kpgOX99nNCHT
         XK5KIuplK8Vg0uRrjpY/hvMdogmx0CcLjeSgG/Td/Ogx7syKS3dPouQ6FzDUyXuhj/cE
         2ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339564; x=1793944364;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VbRiuv1zzZPpsXqO5zwHM0e9x6dnlvGPnhrO6rm2E7A=;
        b=RFD0qKM/mcV5cMrJLJmmjE3f5FimadBh9Lf6e3gkrCTpzUMG7uLu8J4aBeEy4hkcJl
         BXm9VLJ/RhMYp1iWwev+xjXQawF28WshWyQFIDIrsNxsBtflHQ9DazrApsiydeOF5shh
         88IMkLoCmsjuHgeaEVIjVZ2+a5vtK84U0GWrPx4LgY6NS1ezHmy9Csd1lLWFncazG+5G
         T0BR1JyY4/d11WkHHaP34zGWBLDpzVq1rBGqz0UEvCb5GX+fNCbYNm9edCP8otto+CAp
         AFcv4O4wVslSDHHvIROk3kwiMASy+fKkpm+zJOIxkUUHa00uMtTOGSKsvm8FG+h5xt2x
         pY0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+FxgC6rfpc3UDUg9VlEtF3fEswq/UDOoDNqiVZVeayFMAiwUus3BINL5/dnkAY648b8XjAsg1e9IJEmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0QFK+OTSp0/OH660CbTN3Fnj3O+z7XgbL9j9QtNc45j7GaIeS
	p3eGKkTzD20wjl1N8GGIlNv623AxECcXP1KlXYlaxo2unOOqCdAUSeNf
X-Gm-Gg: AYBFou0WSCYH3tOP+v/JfA95SnwRzqBmruvWhQAFd0l9CLfAmCn66AQznwmHttLw+2y
	j9496uevvNbu2TfSMCF+WWZcja8LrxYGtBk+UODUGfDjze7M6xkb76SeymbPOd9T6IQK/KDN5Ps
	7m7QLF7/SQYLcfQK85o6JtMYSsrLGp91EJPFthPKs8Y8knryNoErrFO+84Ewai30eKYG2mvPrf5
	vKR3dzg3LRTknUimtp91EncThjbUeDK5/QmeRCDR/NPKDbKpXQ1Ghm4KSY+0qvbSYTzlMcyFZG1
	29Y8AbsIX4oXHbW3qKixGU9q2ZPIWA1AdbTOp8xAQ/LVVR/UanKFXwaKCRZP5G4EMYUADUNDxgN
	HuQTPpbGjGBEvypABOcQ4CSWO4AG3Mjj1dADkjEYAj+qSpf4PXGNb0TBmU3P8IAJ8X45ubDj6+C
	HfgZD9bAqcMvj2Pn2Q2tt5ImjJmahAyd5FnlPJJ4o0GR6sp/reCtbUu3NMKroRzUcXwG2/+iypj
	qNWY1GbzhXUAs0K2ykYAw5TvoI2X0ma+Dbx9OOF2apr4vRSnwDDFADcT9FsqyQHjj3KZ0J1ZunE
	QO/iSz7JSNffI4NpCoVccKfy
X-Received: by 2002:a05:701b:2411:b0:1ac:75b9:f82c with SMTP id a92af1059eb24-1ac75b9f892mr1448025c88.34.1793339564232;
        Thu, 29 Oct 2026 22:52:44 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm3675448c88.22.2026.10.29.22.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:52:43 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 01:52:38 -0400
Subject: [PATCH] mm/filemap: clear page cache marks once when removing a
 folio
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bug-mm-filemap-init-marks-once-v1-1-699835fc6690@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKUw5GoC/x3NQQ5AMBBA0avIrE1SJCWuIhbTGkxoSYtIxN01l
 m/z/wORg3CENnsg8CVRNp9Q5BnYmfzEKEMylKrUhaoUmnNC53CUlR3tKF4OdBSWiJu3jKaprCb
 StSEDKbIHHuX+B13/vh+gfW5ecAAAAA==
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

xas_store() clears the marks of an entry before it replaces the entry
with NULL.

page_cache_delete() calls xas_init_marks() after xas_store() whether it
stored a shadow entry or NULL, so a folio removed without a shadow, as
POSIX_FADV_DONTNEED and drop_caches do, has its marks cleared twice.
With 4K folios that is about 6% of the time it takes to drop clean page
cache.

Call xas_init_marks() only after storing a shadow entry, whose marks
xas_store() leaves alone. Dropping 8 GiB of 4K folios, median of five
runs, averaged over two boots of each kernel, in a 32 vCPU VM:

                          before    after
  POSIX_FADV_DONTNEED    1517 ms  1423 ms
  drop_caches            1515 ms  1422 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/filemap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c6..a0c959e74533e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -140,7 +140,8 @@ static void page_cache_delete(struct address_space *mapping,
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 
 	xas_store(&xas, shadow);
-	xas_init_marks(&xas);
+	if (shadow)
+		xas_init_marks(&xas);
 
 	folio->mapping = NULL;
 	/* Leave folio->index set: truncation lookup relies upon it */

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261030-bug-mm-filemap-init-marks-once-b83c6aa67bab

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

