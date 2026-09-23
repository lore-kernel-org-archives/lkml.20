Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1145647987B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199998; cv=none; b=daf3Vuc+oljJSEzdwtjREKWafj0ic0udR+2e8V5nhyAlsySVtdxbnqXnInw7vImInrKdpVJdsZGgIq8riDdMXfD6YhuE/HTNY/kk+7/eFNaQqU19Pz9yw92E/IiNLIYxr0hy1cFYclVoFq/CR9iqbZ61yilo75HM1xiQywFIELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199998; c=relaxed/simple;
	bh=xdMUdk2g3RQS68sUHf1oVBCGtOm3a+cNh4Vyy2wH/r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afrmMybKQxfB0FfCjHbvicIe8agSsmhEvW/8JYMnv9LYzG3G5hRD7+iYT6CckJOU/9cyAtZl9a/bGWtasu97BpACLDTEYpg/Atkgj2c2syXxaYN4g+J56XGd1Y6Fu9fmGVvRZVoI9R3XS2vRScQqRIOzRS1tp0w+PIQlCK+ORrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESzcN1fY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESzcN1fY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so7143135e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790199990; x=1790804790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWYKTy9ur2zfAfW3YtEaKW/NAKkIGa1U+2owoaIL5wE=;
        b=ESzcN1fYpS6QoZAQof79mmXasRvWuEXcUvRLo/67PgyTeWZN7rOTbNooUGXr4/psin
         YHgnusrBGzrSYRVNCH0Mz1HmaTjJU5L2xJd8ZyF/q2FFRKqQp2TaBkrt9q3Yfre1PNVt
         3qiiSu2VlgG/AafW5Wu2pNOp8Cjj2sPCGvmuTs5yx0AhwD7Y648EOb0cjcQC4bBAVBiu
         qFZ9QGXpeud8s63DXsc4OTa0ALu411opAE/4OtiXyE6efMJpkgQRO046jQBM9w+9vtGj
         EnqMj1jB/6rhPFDznKUkiG+4kKaJPBAPcPABN1RC4ieQ5p9uiGXnsKQPcCjqjPk94fPI
         KpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199990; x=1790804790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWYKTy9ur2zfAfW3YtEaKW/NAKkIGa1U+2owoaIL5wE=;
        b=2ndulzhIzUQMq1HVyYfOx02fsQuFifFsKleAsECy+Z4GUPs41zxXDGamQZ2fAIzCuH
         zcVkaMudrwuMAcNv5DBPOUkMKphSzmWeGxw3o6QIKos9rcSX80W1rZbAVDuORvuaRdyo
         wqMgGNubdzvtFYRdogcsGYaH2Wgyd/tWDkxVSDOH6Dc4A4e7uCkmBrpVFlx8FjXpzUfY
         6RJO/qq2oul+5b1PXACgrrn6uVvZsawkQ23NyDmVvzltWtXqRE5bnjrnA57fvg0rEGmr
         e9xHjDoKAsAgkbA0bBbE/21tM2+5D119Fq/DuZEtUh3U3kY62U5qp+r2Hun2pyww/GQA
         3ypA==
X-Forwarded-Encrypted: i=1; AKwUvByi6ARGQckstC3Nt8nBdBi7qfiSHE6Yk/zMuHvaDaCrhWq5i7hg+Y8qxLZEj06f4HbC52rg5IqU29f6Ugo=@vger.kernel.org
X-Gm-Message-State: AFuF++mTVIQxgpwVvfGqBqd7ClHnyeDJKiW6eiComk3MLkp3JGIeQyNb
	XPS3Le0MEvpdWdKLxr4n1RI8rvDt4I9mr+mOrcM/xFoDl+2mvrJ7WOvIueLIiUxV
X-Gm-Gg: AYBFou1aRLW9BMenrDySFALQlq5dQFjNvjXfxO4XhiB1yMGUZwuQDAwNV5Mcnx2z6sV
	jZnxhrDo3Q1EIQq6NXslo5MTszSZEro9uyfYpxTS291P0u43ba/4Rp3emBEjwrNlcwjJuBpFDUr
	4ViILiuw3XuwkHhCrvwxJrWXErNVpZD/9q/yagwzOoCO5BGcqdxgulwLyuindQHr+QZPszBWESy
	r/h9gKEgGjdt6LSWTYjaKwekwl4Ls7nITdzhnp0hVciTZ3Bvo7IBu/EN88W2WsI2kS++3ZBF7WQ
	jSQCRRBiz28JM1YYogdY1Gstb6AG4uny2vwNbC0hVvLnImMplBr84iq1hiUpC5z0MgjiYQ+//Rk
	y9xBcEauLjFYPq2rjI1I9Q3lxMKU/8JE67Sr7JQQL1CWzS7MPEYVkBCUQrx81IhAuA/hHcIngH9
	+HDPje8+YA9MCYTpG0ZUlpKaQHyRCBfIhKhxC/I6Z+QsMMh6IXE0D5msDsic5DqsqzLPDRmlsv/
	+Egpaa8ocBIuwSZfXpAGbq896mQSUCr2yMLQ7xUBwClfZ2oe3SHkvZDoACPGP+3dD6sRSpbarZR
	vj/tw+PXfUEFCc8s0SA/rublsUC08Jgw5+7KgQyssi/atBwqWCldYBx8ygfraevrT7fesaC8Dhc
	tpwA0pzU1MoxRkpM=
X-Received: by 2002:a05:600c:8b22:b0:49e:7d25:f397 with SMTP id 5b1f17b1804b1-49fe66d30c4mr8601345e9.15.1790199989777;
        Wed, 23 Sep 2026 14:46:29 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4a2-9601-c082-2dcb-3f3b-92b8.310.pool.telefonica.de. [2a02:3100:a4a2:9601:c082:2dcb:3f3b:92b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm26083595e9.2.2026.09.23.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:46:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:46:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/damon/core: preserve the caller's quota in
 damon_new_scheme()
Message-ID: <arRHl5blMrrmvhkU@gmail.com>
References: <20260921171155.3359-1-sj@kernel.org>
 <20260922120845.44460-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922120845.44460-1-sj@kernel.org>

On Tue, Sep 22, 2026 at 05:08:44AM +0100, SJ Park wrote:
> To calrify my opinion more, "caller's quota" feels unclear to me.  I hope it to
> be more clear that it means "the quota that is passed as a parameter to the
> function".

I've made it explicit that this means the quota passed as a parameter
to damon_new_scheme().

> > > 
> > > damon_commit_ctx() first copies the running context into a temporary
> > > context for validating the proposed parameters.
> 
> I'd prefer using the term, 'commit' instead of 'copies' for clarity.

Changed to "commit" for the context operation.

> Now I understand you added the comment for commit 60bd24f272d0.  I think Fixes:
> should also be 60bd24f272d0.

Agreed. I checked the diff and earlier callers. That commit first passes
the running context as the source. v2 uses it with a plain Cc: stable.

The LLM suggested the wrong tag, and I didn't notice it when checking it.

v2 is rebased on mm-new and passes all 46 KUnit tests on x86-64 and
i386. I'll send it soon.

Thanks,
Karl
