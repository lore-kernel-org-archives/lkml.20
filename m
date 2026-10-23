Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785874;
	b=ZbL6GK2auNDdTkzb5Pv/qIURaEaco9PuaQS5s/PwNyMPISyls45rkWbiTt6CpcsDg4xv
	 07Iqbd2Vm2sqwNjQqe27hovqv6DxUbdXNxH58spiqviyGMIVcw5/v6d4PnkW7T3eovIRD
	 H5f60cqLloOdQbO1Dvddy+WkIZhMKxVRulmMS0kjEwUxgDW748paLIacvu2h+nRMAVuEu
	 63whzMMGBy1U80qyB1bALBBEJu4rT60osMf7VZQNvRafdn6FiU0JqYOhpLtjJio4Cg29e
	 BpEsEThW9uNXNeMN55DTT+122/Z2CX8rnSXdTnud0t6tAWW+pbDDQAVi11FQ8V9UxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RbUA7/dxhId/TZcdTXpzWvUZm71mXX0zstuxMncKARE=;
	b=koaWcoNjCTE17m0iR42cXJHO0z5tXhCgQIwz0ceySk8tdxr0IT/LIrvOx7ARp83oK1Tj
	 ReU3g7RdlI8gut9bjz12zYFkA3lF8yB60VeSLmu2majVMss+Rea/VohUBROwNnNGJuD7L
	 WBUu/VHtHmYlyyyn/mMjGI6KQNg0cw9XCBsc8pWpPTpaRKSGigbxKclcMg2lbZgcMg64M
	 U688LYbRpZeC1oSdxHyV0z3w+y0tFBwhOjXYPYq2b9gaZ76kjBIx0SrcMA1rinMgho+qN
	 cbQ67okpSuVev7ClxDjtZn4Kl68nxppauUli+qe64aV2TupW7NleBwjtl+XrJPjcRzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VZRgWHmY;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C66606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C66606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VZRgWHmY
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0592d4539so1757712b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792785873; x=1793390673; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbUA7/dxhId/TZcdTXpzWvUZm71mXX0zstuxMncKARE=;
        b=VZRgWHmYBsNty7OpiLQfu9dH0clS0+IHxuSCUOKQviSGDObVDHj/GhhTJqMvpSdKxD
         iXopNeHKwdG8sti+uWy7V4k1JHWr0Y9zZnlJAFMlY2XWk4FgPOtOUpwlbXpqfrrYe27D
         9GKKq7EaLIJTkLwo1ab0OO9PhlO1pfsb/C4pbb2lFCh39/R63XVsvVQhBsiZd8JTkC5p
         l2CrnI1xAj6PNWWX53XxJsNIO0HHL2hd+h0K070tydrpgpoSxxZXGEaqpr5REM0Zn/mg
         RSYR9fDTXZtQpNC869zbIS4MQObAgU7Z6Fley9LVz9KB+gIWPzIPKmoN/izkf7PArc3T
         DE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785873; x=1793390673;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbUA7/dxhId/TZcdTXpzWvUZm71mXX0zstuxMncKARE=;
        b=EBa/wZUR5ODIyV3ywOeGaB2lpwiCdeZN+ft6rm9ZdWE1QRJ0pfmaYPIqQdGoocnLOT
         ZbMXOmw8MnxjAih8a8Cz2Qvw3BuIzcsDr4M6kl+gTOQc7IMdlXVTF06XbvQVIfikPk+Z
         +eXT+ex3No0KsvxP/HX7PGoJe/R2jmTa/p51lo6n3ZpIJa+ypJ5BwhpbD/Fsg9qoLAAW
         xO1b44I6Ykrm/YUqkmnMxtuuErXwN6H/WWoHV9ZlmP480YWcOZgoD6Yp+LW5XSCSPIza
         w8JR7K6OrL4oILkpXY45/lOTJXgIqFdG/KOz9c0n5ro6CLTGstKBGs54CphIpzGSJuqw
         suvA==
X-Forwarded-Encrypted: i=1; AKwUvBwIL2vCznmdKQBfKzxRFS81D1WMjARy+Dejj55NTiN0O7b7ygWfTXcU3hbmJUqG4lqd7yYnFNR3gdLLfXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKweMrDdYGSeyTIUNn5EYJml8ArGwplsmrU9OgdSOot7szP99nD
	fwSeEIhW8jEj3r4BW2upE6vx2t1BR379xmJSvpP/HHdVOf6giLw2+poPzVR91cUDzd8orJXaQpX
	fTqErl4V9qrDSl7/qNml8+18xfw==
X-Received: from pgbm2-n1.prod.google.com ([2002:a05:6a02:6182:10b0:cc7:52da:b682])
 (user=suseendranb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9d4c:b0:3e2:252c:3738 with SMTP id adf61e73a8af0-3e7bfa44be2mr77837637.16.1792785872956;
 Fri, 23 Oct 2026 13:04:32 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:04:26 +0000
In-Reply-To: <20261023102607.7635885be12b0b6e7a5971aa@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022232734.496064-1-suseendranb@google.com> <20261023102607.7635885be12b0b6e7a5971aa@linux-foundation.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023200426.3865221-1-suseendranb@google.com>
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on
 compression success
From: Suseendran Bhaskaran <suseendranb@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suseendran Bhaskaran <suseendranb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 10:26:07 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Thu, 22 Oct 2026 23:27:33 +0000 Suseendran Bhaskaran <suseendranb@google.com> wrote:
>
> > In zswap_compress(), dlen is only meaningful when compression succeeds
> > (!comp_ret), as compressors do not consistently set req->dlen on error
> > (e.g. zstd, 842, and qat set dlen = 0; lz4, lz4hc, lzo, lzo-rle,
> > deflate, and iaa leave dlen at PAGE_SIZE; hisi_zip sets dlen to the
> > hardware-reported produced bytes).
> >
> > When !comp_ret and dlen == PAGE_SIZE with zswap writeback disabled,
> > zswap_compress() sets comp_ret to -EINVAL instead of -ENOSPC,
> > miscounting the page under reject_compress_fail instead of
> > reject_compress_poor.
> >
> > When !comp_ret, set comp_ret = -ENOSPC if dlen == PAGE_SIZE, or
> > comp_ret = -EINVAL if WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE). This
> > allows simplifying the failure check to 'if (comp_ret)' and dropping
> > the ternary assignment in the writeback-disabled path.
>
> Sounds like we're complexicating core code in order to accommodate
> inconsistent compressor behavior.  Would it be better to
>
> a) design the compressor interface(!)
> b) document it
> c) ensure that all compressors comply with it?
>
> Maintainers may choose to go ahead with this as a backportable
> quickfix, but it all seems to be a bit of a mess in there.

Thank you very much for the review and feedback, Andrew.

I completely agree that clearly defining, documenting, and enforcing a
consistent compressor interface across all implementations is the right
long-term approach. I sent a separate patch that standardizes return
codes on destination buffer overflows [1], but having a well-defined
compressor interface would tighten all gaps.

[1] https://lore.kernel.org/all/20261021205626.3286270-2-suseendranb@google.com/

> Wht you forgot to tell us (please never forget this) is the
> userspace-visible runtime effects of the bug.  Autobot says:
>
> : The userspace-visible effects are limited to corrected zswap
> : statistics and a new warning for invalid compressor results.
> :
> : When compression succeeds but produces exactly PAGE_SIZE bytes, and
> : zswap writeback is disabled, the page is rejected as before. However,
> : reject_compress_poor now increments instead of reject_compress_fail.
> : This makes the debugfs statistics distinguish incompressible pages
> : from actual compressor failures more accurately.
> :
> : A compressor which reports success with a zero or oversized output
> : length will now trigger WARN_ON_ONCE(). Previously, zswap handled
> : these results without a warning. On systems with panic_on_warn
> : enabled, this could cause a kernel panic.
> :
> : There is no intended change to which pages zswap accepts, rejects
> : or stores uncompressed, nor to normal application behavior.
> :
> : I think these runtime effects should be described more prominently
> : in the changelog, particularly the new warning.

Apologies for missing the userspace-visible runtime impact in the commit
description. I will make sure to always include this going forward.
Autobot is spot-on here. I would be happy to send a v2 with an updated
commit message that clearly documents these runtime effects and
behavioral changes.

> My autobot is all worried about the HiSilicon ZIP compressor.
>
> : I think the zswap-side fix is reasonable. On success, dlen should
> : contain the actual output length, and zswap should validate it. On
> : failure, dlen isn't necessarily meaningful, so we should rely on the
> : compressor's error code.
> :
> : Separately, I think we should make the compressors consistently return
> : -ENOSPC when the output buffer is too small. Some currently return
> : -EINVAL, which means reject_compress_fail versus reject_compress_poor
> : will remain inaccurate even with this patch.
> :
> : A compressor which successfully produces exactly PAGE_SIZE bytes
> : should still report success. Deciding that the result isn't worth
> : storing belongs in zswap.
> :
> : One thing worth checking is HiSilicon ZIP's negative-compression
> : status. It is treated as success, with dlen taken from the hardware.
> : Could that produce zero or more than PAGE_SIZE bytes? If so, the new
> : WARN_ON_ONCE() might trigger on ordinary incompressible data.
> :
> : I'd take this fix independently of the compressor cleanup, assuming
> : that last case is safe.

I checked drivers/crypto/hisilicon/zip/zip_crypto.c and the HiSilicon
ZIP hardware status definitions (in Linaro UADK drv/hisi_comp.c), and
this case is safe:

1. In hisi_zip_fill_buf_size(), sqe->input_data_length = a_req->slen and
   sqe->dest_avail_out = a_req->dlen (both PAGE_SIZE in zswap_compress()).

2. When an incompressible page overflows dest_avail_out (PAGE_SIZE), the
   hardware aborts at dest_avail_out and reports status 0x0e
   (ERR_DSTLEN_OUT, insufficient dest_avail_out), not 0x0d (HZIP_NC_ERR).
   In hisi_zip_acomp_cb(), 'status != 0 && status != HZIP_NC_ERR' sets
   err = -EIO (comp_ret != 0), so the !comp_ret branch is not entered.

3. HZIP_NC_ERR (0x0d, negative compression) only occurs when the output
   fits within dest_avail_out (0 < sqe->produced <= dest_avail_out) while
   exceeding input_data_length (i.e. when a caller passes dlen > slen).
   Even if HZIP_NC_ERR occurred with sqe->produced == PAGE_SIZE,
   'if (dlen == PAGE_SIZE)' handles it (comp_ret = -ENOSPC) before the
   'else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))' check.

4. When ctx->fallback is enabled (hisi_zip_fallback_do_work()), it
   delegates to the software deflate/lz4 backend and only updates dlen on
   ret == 0 (0 < dlen <= PAGE_SIZE).

So hisi_zip will not return !comp_ret with dlen == 0 or dlen > PAGE_SIZE
on incompressible pages, and WARN_ON_ONCE() will not trigger on normal
incompressible data.

Please let me know if you would like me to send a v2 with the updated
commit message including the userspace-visible runtime impact.
