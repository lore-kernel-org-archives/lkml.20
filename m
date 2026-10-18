Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91D3ECBDA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792348152; cv=none; b=SqdS91Re3MwzxCDI+2yCVj6JM8l1U4HqlYDS136ofq1r06cnVFaUkoX858xzxyeWGqZXINLC6jGBNjDxTJs0Csf1Kl1Z+uN1+FFZmaM4be7vjNfT+458ORiTGJbKeA4XU38UdlVbTBn3bG+voyT6D/1+JDY/SWlZLyAZC10rMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792348152; c=relaxed/simple;
	bh=/FcEJrTo+6kZTxeMfMC9pkD1SOm/pbQOF2ZkPY9zZeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGsZmBDJJZBRS2UdE/3M/BJseo1EkjN2gw3RgkUCxVqMJGYgnJuSMZ6QeCCTtQJuHPnKl+8PbyAAsxnAh1wqZoIcfzfCKy05JCNwmYq8ZptCJrNJMaeDiM0eS14JMfO2cJaKBxW24HTYfJDRmU+q9tU2zlMRZLEVcPqYQzOxZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra4ENuct; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra4ENuct"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso6397775ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792348150; x=1792952950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhL7iYYfEcNdbRQqdb6S37zX0Ja75Am4y9nFDdcH8xg=;
        b=Ra4ENuctVuw5geoZ8Nzsp4m3/+geTDfFQH3RT9MliC+rp3KwDrH51peoB7hywe9EFW
         lQtJ3CuJ8EiWABPWgNo1LU0UoZoCbQWraoQuvylyK+UO41TsNYXnAnUX3hNXlZZzzFaN
         epO5jsnWZDg6QNV1wg0irZVnQRdnhtuKnEgvBFdLV64ZWYEOWQ43z523Ja3UhNc05Ytz
         ItathiLRQN6jGN8E1mzTGIlEfcb+1QG+VFBxulP+Fs8ozI97DCX9J5nzj1pMR0vdScmG
         YXtM9bJY0HGYvbuEnyGkehAGm8PqRrdhN0FQyaNeJBmVmCvihugIxpw6IW0qKcnVPwpS
         4NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792348150; x=1792952950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhL7iYYfEcNdbRQqdb6S37zX0Ja75Am4y9nFDdcH8xg=;
        b=bGpvXOE+HzLnX1Il5QyfDqgXgik8R0qSRh4WDE+OAitDcQ/iwCtHnwQy+6FH7VPxHp
         b3Zw11CFTQobcpZNQzhQm1DIQ9g9aFA0HEgflGpNmBi8Ud9HyF39OE4XCTM8/SnvKxYH
         pM73LGFH7Vsb23NdxHYLyurpXLeRIEWJefagr1uDEwi13DBZeHgmvSEVJlX1kg856uIh
         SoBbGpGr5WVOVwtsQPi9EZJ2+0V1yypiTuXMLd6nQ3QbaZ4kBZ0b5/+iUL/B6XTy897B
         94FPYqqBKKGgRZ9p6W6hZtqURvL8l85xE3jswvC+G+YYoWESZm5T49xD111Fe+/PF8Yo
         i4eg==
X-Gm-Message-State: AFq9FYK5bVH6SPmNFiN+vNsDE6zDMI/ATYWqUwCQsbHhzJuxBC+3NLew
	bNwTCU+mtN6pq4HWlfFv96iIDCB2ag7Xb3yk1iPDFaxog+adtIu0y8EU
X-Gm-Gg: AYBFou0QVCbtz5oPTOReLbCWiOlpmIju7O/9O6a+nrSeOWDnI2JaVPNHmfOgboZ1Fay
	U+elCka1C+wIp3BY3pkcO0d08lyLF3FcqNCtS1BvMlPg6toTUwSbsB7qHu1lXgeUExWiSfC28S0
	UPLwzGMA8n/s0oYUlK3ncjVM1Gm5fRQr2SiIl8rnmwZ46UT/WEpQXAfEDPmoHIW/DvteTGsxssu
	xD4eL6mc9UzibrkETO1FhXZl41CjjZEwBvmbVNtKYSF8dP3cEU6a3YT0WFqHU04BkhDI1fTa7IB
	RhQe4zoOO8xPSdeUVLSRNLzu1Rij5tZftHcqkWs6toPkDn2UINsiPeXaGSTaUe38RiIVm1Jrb1E
	8ylR2r1jhI+SGBv41ReSH070WsOLiBaLxVsPjo3V8tGqLAOR5aboZNfBQcBQAqn+MNam4jFss1h
	oKoWKUPChGyVDj4zRoyEL88ny0rTIinl/9GGmukPFX+mOBqjigNd7QrQ6vKsr0yUdqg7tJtwRWC
	8skMuDaPrLh2uVRLwwih9++YEIguigFMb1VHccnJ+6xJRZYJIKOSGeoPhao7I8NM4At3ig/wV4W
	erO5JsD51fWaOFui1VHnoin1YA==
X-Received: by 2002:a17:902:ea03:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2e9a6834bdemr43504965ad.8.1792348149928;
        Sun, 18 Oct 2026 11:29:09 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (114-38-149-183.dynamic-ip.hinet.net. [114.38.149.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d4e51sm29796255ad.1.2026.10.18.11.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 11:29:06 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v3 4/8] mm/gup: break out follow_one_pte() helper
Date: Mon, 19 Oct 2026 02:29:00 +0800
Message-ID: <20261018182900.671-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7ba9d2e6370d6134ad34cdffcff5cc79b9192df1.camel@surriel.com>
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-5-riel@surriel.com> <CAJuCfpF47Mpi40=8yujBNruCDvY-Ezk0WFEacCqxcdRjmUqt4g@mail.gmail.com> <7ba9d2e6370d6134ad34cdffcff5cc79b9192df1.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 22:11:07 -0400, Rik van Riel wrote:
> On Fri, 2026-08-28 at 16:47 -0700, Suren Baghdasaryan wrote:
> > Before refactoring in the above case we would "goto out" and
> > no_page_table() would not be called even if pte_none(pte). Now I
> > think
> > you will call it if pte_none(pte). I'm not sure if this does not
> > matter but this seems like a functional change.
>
> Good catch, now we may end up calling no_page_table()
> on a VMA where we are not allowed to write, for a
> FOLL_WRITE access, while before we did not.
>
> That might turn 0 into -EFAULT in some corner cases.

That exit is reached with a present PTE: follow_one_pte() has already
returned 0 for !pte_present() above it, and pte_none() is false for
any present PTE.

So "!ret && pte_none(pte)" in follow_page_pte() can only be true on
the !pte_present() path, and the old "goto no_page; if
(!pte_none(pte)) return 0;" sent exactly that case to no_page_table()
as well.

The can_follow_write_pte() and pte_protnone() exits still end in a
plain return 0, as before.  No functional change here, so nothing to
fix for v4.

Yuan-Hao Hsu
