Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7033C342B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581142; cv=none; b=fFgoAlSYO+KRH9AQecWQ5D9rIJDGxfKmm5kz8WCdaD8/F64czzSuqYby0d7bhZ4vZ4aOIKyw3vBbE0U9YCBa7I6EefOZlJiu9ulZznMB0pjfRukuf0eiTtwYEhdL1BcCQk5FuWtWJBXAijAnhLyYZY1IWmRgJDJ+Ccwn6/m64d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581142; c=relaxed/simple;
	bh=JYguKpWYYDdj85O8UNrflccHJDrj4xz7wT+IHO0o+TI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=epSAnW6e6pTnsNEa75QVjAtMqXVijD70m+RnnUgPHb6bQ1FG7yM3a6fvDFV1QTpE1RxpMzrU2bYnCSiucDKXMpmadXilgbIWniANP59G2V7EhtW0qGaAsNcpmWeXslgxoKtO+7IDtxXHcuKTLYf2y2DfVIdZg9AhmaZIdx+w5vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSxOnD8+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSxOnD8+"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d93ff61046so13670355ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581140; x=1791185940; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrMGPZQfXAem1w1eTjPgNNpDrfOCX+chlCVcm7+bkR4=;
        b=CSxOnD8+FAiM1CguoaAzVBcp7KirSRa1BsTjvvt42KqpJ/9y5hIF4OSsxiqNEPKoLL
         f+LtXK0/nFALt/2rOrnnXzzq4D5g33A+HfiYMgIAECXgyB0avC1LMjtNPv/Sv0iUsDuR
         Laz7KJHY1h8fMh188aNXkeD/7OJnZO1Z0weHcZS7e6/i4nXSMfYDYArKuC//4cYmLMMd
         fvPXwstO9Sr8E85AA3zR7tTvGIhwPNxf63JWLzqF8wMcCtADl9mSBCmTxwKVX0P4hJFN
         kq6T63Ccmkg6YOBNRctP29Uh7x5yxc/AA1mjaUgnPlzXp8MncVCZqVJuNIhnZLBe9IR7
         vYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581140; x=1791185940;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrMGPZQfXAem1w1eTjPgNNpDrfOCX+chlCVcm7+bkR4=;
        b=w8bQfXIY4NKqsnrWfWzebSTocd05ZCGxdYAojdVBEXV02kQQV0N7KRoKdnkdl/ExVo
         CHRkDwrtqmV3mLlfp+JUGPbjQ4FtJmfbomw2zcn9BVD67gs9B7lL9AytIP7HABTP9omV
         tRqzNATAugfAKpTIMMYEv0ChY0D8M60BQfrbzhsRFBnDjFu9wIY+yiT6t9J6E5Ze+4LI
         iSAWhsfJX+DvVFt6rPil6RBL5xt5OCx9xpbtPxndWZzdeCCtJ7N51llFqS6mHv0djuQL
         9sGwlXg7AEXzKkJimWfPBjHi6gemkORWdT/sIFixKn4UNLFXtujXU5yyk7faQXTt7KZ2
         RGCw==
X-Forwarded-Encrypted: i=1; AKwUvBwrB8ocoW8SxG3qRWS9echKOFIM8P2BODYsD8+JTE/v5pSLoRDzgo+xhV874uQbcqRdbCOJf9IpV2QyijE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMkrIQR3i+ugYz4ryxjGL17qBAIiyf4hAJ6szQNAJ9PF2Z8/R0
	oRmqgbt+tETKdP/gmZejoCSZf9spUxATpVWWuiFkjmL4+r/8R5XFcL1Q
X-Gm-Gg: AYBFou1TvaEkWEG0VAHCV2Vn1OnwVKwQvSH9PuPn2ZByUUB//D1DRwt1u70dgDk/aii
	Mq7EOk0KGjXqqZSj54GNYpSufg+KO1j4LdyQp+Qe9FDdX/OJP4PBUSUYjlWWzZ7Oz1We/S/6YYN
	oJ7/GIGQ2LslT8kBZFUfTQ6z/zzqM5yYIOH9DXwrlkMwZfRdoCgwRPDPH6a7jRHvcNqzebaA9DO
	entDCCA8FGUb3iOQgzHoRmZrrBag3MbidsI9M86BYT3iflB7coiMvbhO/jUgynGZKs7oHScjoGn
	9OCkh4K6bkREjOc9uG5hgu45LJQMzvDhXQtL0UZkEOKjh3pEjsXHCKryPzO2ApIZ4YONulml7OQ
	dvVJy67ABqniYWp4Hemf7+/+QEIbZjvCtnpcm5fuPtrcRUdyzVkS2MFohLpf6jaDFnRHS4TU05m
	ZYHxJBitBTYqCrh3v+eaQytVlwrZEemOGzFvXjm0x9EPStbi5dk7EOpifYpaXqU2rG80Lb3FJ5h
	M/nk5wAmCrqBlin6Tp/BjlQqeJ/GnNGDY4Z9ieaxNllvGBNEvAD+RtGeFJkg6UJjESCW6NQ5qVs
	62gy
X-Received: by 2002:a17:902:fc4f:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2df7dd76871mr98510165ad.8.1790581140234;
        Mon, 28 Sep 2026 00:39:00 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91444763sm36663265ad.60.2026.09.28.00.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:38:58 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 07:38:57 +0000
Message-Id: <DLQS1EUNZG5T.1ZCONM8DQM45@gmail.com>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] bpf: Initialize IMA hash helper output buffers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiale Yao" <yaojiale02@163.com>, "KP Singh" <kpsingh@kernel.org>, "Matt
 Bobrowski" <matt@bobrowski.net>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Roberto Sassu" <roberto.sassu@huawei.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260927121400.1188165-1-yaojiale02@163.com>
References: <20260927121400.1188165-1-yaojiale02@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 27, 2026 at 08:14 PM Jiale Yao <yaojiale02@163.com> wrote:
> The output arguments of bpf_ima_inode_hash() and bpf_ima_file_hash()
> are marked as ARG_PTR_TO_UNINIT_MEM, so the verifier considers the full
> range initialized after either helper returns.  The IMA hash functions,
> however, leave the buffer unchanged on error and only copy the digest
> length on success.  A BPF program can therefore read stale data from
> the untouched portion of the buffer.

That's not a bug.
These helpers are available to LSM progs only and LSM progs
require CAP_PERFMON to load.
With CAP_PERFMON the verifier allows reading uninitialized stack
with or without the helper call.

Since commit 5da4a9f26fca ("bpf: Preserve stack initialization for
generic output buffers") MEM_UNINIT helpers don't have to write
the whole buffer.

pw-bot: cr
