Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776368;
	b=k8KyWEWaKp5YYVkt9HMLkQvdwuQy043gw8D03qhtzApl9M7fnY5CA6/kS0hN04XSpijP
	 PYdtVfV890+zQf0V6Aeztr4lrk89V3PGhFKpWpME0UgcHn8gnLeiEnkEoRqJnycAML8SC
	 irNSBL8ONs+4ZdHv04t4OF63Yt5tYz78LBCs6DB+9YUrn7f5LdA+ulXAP+FMJeHXlV6+G
	 2ILPY2tgnPL3sGVJ2jOxYngJcbaXVNPCu83k6pZEPt6mxFW/qzN3j2v6IeLjjR06oy21v
	 kMeITJJU03ip5kTpYn/rptRZUU2PXjLQYNeuM/g8ABfSi1jMqc7YgAWuRiJJw0uPsig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776368;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XSow9JMNcB3KaezVYp2YCCd7nh/RjIrlw4N2iZye4G0=;
	b=A2Y6xWGzgPx51EHzoOfzkbtttwbiDj9cKfFg/qSVpgsUD8bpg1LSgRyDHCrwr+YxbxlM
	 l+4LGfduqpRpJ4TOD4Avy5uxlCc9rWxdCz9T8t9N74GQrcFM9ioHH/n0V76sfVeKERU2J
	 ktGQ8TT0y3KDnuGZ1PgWoIijScJf3VJj264Niy4CatUchFcG2miyDJ1CroVAMeZzjlVIG
	 4ti4P/lUWxd7XERR5oB/Jo4d1ctfGh3np8Sj/7Zwnafl97DAgmF7s2PLNMlVk2HhYvSjz
	 S/UrHlGfAhJx7B7jCTZhgRe6+c8HiY+1J162vj/rcTEm1o1Zc12P0maLQAFvFGctkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kZzeyvJo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBD606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kZzeyvJo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705031F01825;
	Fri, 23 Oct 2026 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792776367;
	bh=XSow9JMNcB3KaezVYp2YCCd7nh/RjIrlw4N2iZye4G0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kZzeyvJoosy+DyY4nymYopIcOBr0VaSKdfDrpMhVmfJGEJ2SbGb/ivCBsMdOgD0c7
	 XqCaO1wpHXX4Q6ERUFtBIWUUyMgo6P0CKjYYiurs8ynjMTmbq+cLXy1aK3/gQmdfTy
	 HaZyIDtFwKciOD3g8uKAJusaOOX7DxGyFUBaU77s=
Date: Fri, 23 Oct 2026 10:26:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suseendran Bhaskaran <suseendranb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on
 compression success
Message-Id: <20261023102607.7635885be12b0b6e7a5971aa@linux-foundation.org>
In-Reply-To: <20261022232734.496064-1-suseendranb@google.com>
References: <20261022232734.496064-1-suseendranb@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 23:27:33 +0000 Suseendran Bhaskaran <suseendranb@google.com> wrote:

> In zswap_compress(), dlen is only meaningful when compression succeeds
> (!comp_ret), as compressors do not consistently set req->dlen on error
> (e.g. zstd, 842, and qat set dlen = 0; lz4, lz4hc, lzo, lzo-rle,
> deflate, and iaa leave dlen at PAGE_SIZE; hisi_zip sets dlen to the
> hardware-reported produced bytes).
> 
> When !comp_ret and dlen == PAGE_SIZE with zswap writeback disabled,
> zswap_compress() sets comp_ret to -EINVAL instead of -ENOSPC,
> miscounting the page under reject_compress_fail instead of
> reject_compress_poor.
> 
> When !comp_ret, set comp_ret = -ENOSPC if dlen == PAGE_SIZE, or
> comp_ret = -EINVAL if WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE). This
> allows simplifying the failure check to 'if (comp_ret)' and dropping
> the ternary assignment in the writeback-disabled path.

Sounds like we're complexicating core code in order to accommodate
inconsistent compressor behavior.  Would it be better to

a) design the compressor interface(!)
b) document it
c) ensure that all compressors comply with it?

Maintainers may choose to go ahead with this as a backportable
quickfix, but it all seems to be a bit of a mess in there.


Wht you forgot to tell us (please never forget this) is the
userspace-visible runtime effects of the bug.  Autobot says:

: The userspace-visible effects are limited to corrected zswap
: statistics and a new warning for invalid compressor results.
: 
: When compression succeeds but produces exactly PAGE_SIZE bytes, and
: zswap writeback is disabled, the page is rejected as before. However,
: reject_compress_poor now increments instead of reject_compress_fail.
: This makes the debugfs statistics distinguish incompressible pages
: from actual compressor failures more accurately.
: 
: A compressor which reports success with a zero or oversized output
: length will now trigger WARN_ON_ONCE(). Previously, zswap handled
: these results without a warning. On systems with panic_on_warn
: enabled, this could cause a kernel panic.
: 
: There is no intended change to which pages zswap accepts, rejects
: or stores uncompressed, nor to normal application behavior.
: 
: I think these runtime effects should be described more prominently
: in the changelog, particularly the new warning.



My autobot is all worried about the HiSilicon ZIP compressor.

: I think the zswap-side fix is reasonable. On success, dlen should
: contain the actual output length, and zswap should validate it. On
: failure, dlen isn't necessarily meaningful, so we should rely on the
: compressor's error code.
: 
: Separately, I think we should make the compressors consistently return
: -ENOSPC when the output buffer is too small. Some currently return
: -EINVAL, which means reject_compress_fail versus reject_compress_poor
: will remain inaccurate even with this patch.
: 
: A compressor which successfully produces exactly PAGE_SIZE bytes
: should still report success. Deciding that the result isn't worth
: storing belongs in zswap.
: 
: One thing worth checking is HiSilicon ZIP's negative-compression
: status. It is treated as success, with dlen taken from the hardware.
: Could that produce zero or more than PAGE_SIZE bytes? If so, the new
: WARN_ON_ONCE() might trigger on ordinary incompressible data.
: 
: I'd take this fix independently of the compressor cleanup, assuming
: that last case is safe.

