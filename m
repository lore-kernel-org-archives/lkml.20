Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793467781;
	b=waigBAE5br0/Q8ei8/xK//TmongYXnUnKWGD15VgQ2KkFfMchKkA8GeVkw4vajP7zrzC
	 OtcmZGcCeDLHgkwd06UINNv4rCwLVxxy+X2hxS2HHpiCkqh1ddVbdHZuElvxbRdhrSpLq
	 NDGpTjdnFEXIT4SxD5Msii+sYBy81bTb9DcURR/lxfxbismdNGjxaydv8i0dOzMs3lVNk
	 zoaUqezEDeL2g6TJVs3iZh6rbpcUt923rgpeSTz080IOJbPJY9LaiJOtSmShvZEB3EswW
	 tgSmDgu5UlmD5mvrdQ6DfRP5QQTpzpMbDKc/R8f+mOHcr4CYrSPYlREV6O84QXRm/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RwRF56TcOm8rFLCnqU2JxOydhmu46zMDXK5qAXpa48g=;
	b=q8mo8HuUSjinjiNm4JCCjAfG3a8XmQMUvm1KFnU9MEKaRAC6HS9wy33RH/M+FOCSeXuX
	 iXBWSSqLXcu78PSX1n01/F++KNY5T7vf2B2ksgeEkiDiJPXLmn8KXhuocdvldUMGXOiYq
	 26fHbm3OlwM69TzhgDeMsnmQ+7i4pMtgVqAIKrHhR2m5KnKjvqU21PYlYCrr17PTmsIHc
	 725iXFRu9t4LKu+iIAx0aZMJdTFAznqF9hIqM2PTDN3Rj4p1x1wYdOQ0UwHZ7DtvnrqEH
	 6iFsI6sqgjrv6yGIopOBHeEFCaGmmlu0+7P2i5/bBt1j8sCl49mSNI9rQRLqaktuccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CB0VKiHm;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C7606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CB0VKiHm
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14960175e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793467779; x=1794072579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwRF56TcOm8rFLCnqU2JxOydhmu46zMDXK5qAXpa48g=;
        b=CB0VKiHm+JHhv8Ha0HtoxYlxOGCEe3Tjo+hzOcv/hoi1C3+9J4Y1NrG+2DtRAFEG6q
         82B/qaBpeA0Z3+XHmzJj+Vol5cJcliQRYzx6cJtk5On74haZQj3kMoSWUtzQUwbA5LjC
         8P9Yj7G1agLWWI7hflWsLl6fuRT3AAgSGIJGzIiLASehFvL4qgz7oF/HopvXcE0GMBHM
         mdgyX84McktfO+VZVajBWdFjUYMHIFVss3klVgS40dBzHgJi90GWEHfgu5CVYtFK1tOu
         2ATvTOFokn2+vYdH92pUxcEuhNYLFIbmcf4Yz7X281qt4YTdM7WXY4KAw5xLs4ciyk8n
         wqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793467779; x=1794072579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwRF56TcOm8rFLCnqU2JxOydhmu46zMDXK5qAXpa48g=;
        b=xB0Xsk28tGGBc1Vy9UlY4Eo4T8YD+VSvLIxKE4uTLf/2etrsTxxwVh9QdbcO3sh6bj
         yjPCdGQs9DRWObnZh3lz9MsJHRI6UY8MBjIKIs4wezg03SHs2fAB5Qqo9wAWIba0rcUJ
         ZtcPbhL66Au8Q3H9X2WcFNJWat8AAINBeLE0BCyz62RCmsPqvq3thVlLBT0sRdnOuXwp
         yRsxK0rOHTS0mHy3jG/Q53jG0THUbxxIg60YAn4iTmox8UBBIM3jF1MIEeSjTkSljJK2
         v9HTsFArkt5kBvNg7J+kr7TDfCp+McAd7WEPXZyggsVPrGEM2B5/1xILqEXZxqpGV1p+
         H5ZA==
X-Forwarded-Encrypted: i=1; AKwUvByZa5bGwIrkFnC8d2KdGlj3TV6GCzhWR0TC2sTRq+p4Yo0h5sRrNw0pS6o3a+7HHnSlYWtGdN7FZRbZYKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuM/cwuRRVxnTl6tpIC8Uj4ZmOqCZZHWMF000m4vOLceKa8UgJ
	jKB84O/otnImdCP4U9z3jhPueuEtkQrSvaHnuTv2EhzHcBgu8c9YWtiS
X-Gm-Gg: AYBFou1qmvui8hfLnANKkFmaaNr8I8Mgp+d6SPBptL9UnalSw/Qb/OvUTqG3SfebCvP
	FGc7VLKTSD7lxMNfYD/1Z73ZZEqbJESxc25Rpt9goEQBN981ymyUwQJ21kvn/2zI0JVkJ0cN4pL
	iLIb7m6Jf2zY5WkJEP89/72jN7SwEHEJtpS2O8+J29ORV/eX7H9+kfGbgSyq5CYlb6c5QJ+DheS
	yS0yHF3PGnCrH5/WgosSrWjNwlxfeTQqsjW6omGnfOWn4XNj5xrZSz0CLNeQA+Fa5rU7rNn0Sdj
	b1lGRUaXKAHoiGTzs/mPQMeThc7mYtr+pfrPiUykl+3+a+6oqG7dmPK/LBLKA4P+3Qmep+mU5L3
	uRAJ0EcpbUOZm6ag1/eCO27T9hOHnHkG01ajzJB+Q4m2ihQbzFxbVaFfVICx2lYTV5lH2/258rT
	R7LOmnE/2N88vaw8fzthiaS3bSrMoWdBiZqPKXQbFWsfyY52HZNziNuKTGi8MJcIwWEdiQhzRjF
	znkDZwYjMqR80vVOFj8TQtxpjMs7Uto6FdSurGyAlEpoDQTN7qLQES+PYxFOKZJR4I9fJUr6PsQ
	aMHwpRStawMN4n3VEmbQejo8AYOZWKvZfn69Q5rtWIKhx0EoLtrTbbyJgw2VtGGfoEhhtAvDxJM
	3WhJZDun3epG6ttCVaAiEZJP8z2RDPu9joJuvxmuTAZsx4iIMuj09HpJ8NfKKzsbiwu/f6SFmpP
	HTKVNg9pl7OxcAFQZiMLJPnRRkBgeVlwY=
X-Received: by 2002:a05:600c:8b63:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4ac17ff9d41mr121811015e9.20.1793467779294;
        Sat, 31 Oct 2026 10:29:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm212352935e9.0.2026.10.31.10.29.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 10:29:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Skip the icache flush for special PTEs
Date: Sat, 31 Oct 2026 18:29:30 +0100
Message-Id: <20261031172930.835-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261017013634.792220-1-nickolai@csail.mit.edu>
References: <20261017013634.792220-1-nickolai@csail.mit.edu>
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

On Fri, Oct 16, 2026 at 09:36:34PM -0400, Nickolai Zeldovich wrote:
> Mapping device memory executable crashes the kernel: an mmap() with
> PROT_EXEC of a physical range outside RAM, from /dev/mem, from a PCI
> BAR's sysfs resource file, from a frame buffer or from any driver whose
> mmap() uses remap_pfn_range(), io_remap_pfn_range() or vmf_insert_pfn(),
> oopses in flush_icache_pte() with the page table lock held

I hit the same oops on QEMU virt with an executable /dev/mem mapping of
0x200000, which is unassigned there. The kernel was abf8c33470f7 with
riscv64 defconfig and OpenSBI v1.8.1. The mmap() oopses in
flush_icache_pte() called from do_remap_pfn_range(), and init dies.

With this patch the mapping succeeds. Loads, stores and instruction
fetches through it raise access faults, which reach user space as
SIGSEGV.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
