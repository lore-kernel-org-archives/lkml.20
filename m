Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1A352037
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101925; cv=pass; b=netTI/hVab5ymy1VlDldfYxijVrCgOVeaNelFGAoP+tX0x6Sx6vxtDznovINWWEbtkgopn4OQ7gugUFAzDEWiAhMVx/DrbpBewrXioPQoAJAscM7ysKfLPilnhON8R648X3lqNKOu2cG4WBnRvNoczg/MNQE7RkPYIqhIFT5r9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101925; c=relaxed/simple;
	bh=yMcZrh624HxVdcx0+mbpO4kZXBb94MKHsaPeyPDSENw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/hVrBneAOSckgUMphOCYnDgDeDwpt1aIFkdPv7Pzh8nCqmTccGWcIahdgVOGTWkBeTHocuCn56QUP9pFXKW3jwP3fC7tvEAjgoyWA9j64kryEiIITGLYJXXQPT3xkg7oktXXrd4L7E6/P0XQHpfyJ6gb9SHw/wkwZMER7mOrOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SnWzXkGA; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SnWzXkGA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4222a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792101922; cv=none;
        d=google.com; s=arc-20260327;
        b=Ua+FOPkdgGSpm2Lq5bCKYNVEI7oaZIUchTpkXDEFzIB2JtHNnmLEyr41u1hcP9yNHs
         uJVyBFT4X5StV2fBxSpQBhYxXhJkHbWzCCXDNMvkXuvEDqzEz44eYywZBGgzBXCaj9ZN
         3yc5/PMlZ/Y/EzhxQrg1XWtOuxqfqnVzQ80/6D3ztayhTiI7/gtl1ziRsh2zcY/j5tDQ
         lwTMLmDV0+3hE65p5CYHThDZpjhtC6fpXCBZIfN5GaUoZvl0jZzxoUS/aHtHL6DSOkHC
         ZdLGlX/mSo0qe5jJyQHoECZQKr+oogYVS5pTDItvjXDTtgloW1ogGmxWBynKRTnwMfFk
         9hjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yMcZrh624HxVdcx0+mbpO4kZXBb94MKHsaPeyPDSENw=;
        fh=Pj5ewhx7TeQZzYlS4zYBaRIf7OjJgBDcgCA09b9lOi0=;
        b=Q9nY96D5rZ5vy75pnyR6p6KN5jboXSTdfVEAIizQfrmzPQ8caVrgMO8jxyLB9yce9u
         KcseCIHD9F9FtACOpK9zt9ABgWQJB3PxZh16IRcwiOiHuB4uzAnKv2wECxUlbzkiVVKV
         xqwP5Ss0MSxoTsgsmQidBwR0/5ZFiCIwi/p8EyqIOCm048k3va57ue9IPKushVmzrvUW
         1rOVEMtBy8JyaHMJ5VEhdnrBiDpADoFZIY3LqG4ehuQJ5dt9jC+/YZtH16gKqA8I0Svr
         dTurqp6/S0SLKGuHZaW49DuXwNi8lXgj+JvuqChIuKJR1fMbPmfLXdcDMCLJbUA4WW1+
         i+6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792101922; x=1792706722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yMcZrh624HxVdcx0+mbpO4kZXBb94MKHsaPeyPDSENw=;
        b=SnWzXkGARnOGv12rVr12vkIxseRkR9wKB8p6IuBBsrL4qvKH6vGg4vnLHPrBQySYSQ
         agVgt+EuGiXegzWaWSYiLwwq534MQtkdsf6Mb/c2DYedquWKCitxGZ1TfRQri5gwzFV7
         wzwsWFp2Pf/bbyzuYd3S3VdxL2jr1sk4Leh0pcq/sUVBHzJ5JrnMOJhQhMqgU8ckyn4H
         lEHRY1PapSTxnIAIEj/wgvFEx//z0H2/VHi8v/9VGbISLL3KXmePjSo//CnIK4APQP/n
         QppeHDE3F+z1MjGl4L/UvoKbqnL5Mmm63D8CB6sLw3HrG8sPrfdvpc9+KCNjaIiSJyGA
         qzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101922; x=1792706722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMcZrh624HxVdcx0+mbpO4kZXBb94MKHsaPeyPDSENw=;
        b=Lpu5jbxrt8RsrLSSPmWqa9m+r44dbqp1SPVoifLBbTRfjQ1YPiw2uVbPzbrdn7A3vQ
         XZuC6WRm4C2+f5D/7wXxr9O6wwk4pJ7kunwKSH6ugNTJqD7kRSkKiZmV0kJQV4UaOND5
         uH8gzdZlXvo9NvVNvazs9sDObsUvCUomsdpgmJOlW8ZtmSLYMzejhTC9JmPqJQhXLONT
         aO/OTxh6YIomWsS+VslU8kdUdW9IN8X8KUN95s8gdrxbGGA6yYAnBz8/hXi9nzglQUzi
         vYW8Bfmg1eeafBWQMXNXLw3dfXs8QEhLQqtAVuc7vmmLwiWbVU4YXK6u+CkGEUbfVFIr
         Kw0Q==
X-Forwarded-Encrypted: i=1; AKwUvByzzfDXwg07VCPNZZQRO41JoLcD+l5BzXK8fQZhcjapoCXwZyGilGyu1pWvSuhx0Ial/DglHWu3tYtZpzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlRm/l8QIkGwCsDb7z1iy0QdMLxCJpfiEHo01rRR50SaPggmEW
	pxkdWe8KYGCLkEttd9c2siqBf0m9fU/8VQQZmoKBrKiZANzWhd7W1T8uMWa3dh6i+IEMt5xzEpf
	HwY4rgkPYoGyjEdvpDqbRCviBBRfryHr/q8gGkEpd
X-Gm-Gg: AYBFou288s5YdAx7dzG5hKVjCA9WvkWnryviBfVXql/YCgVMuI0CLTSvnnRSOJI5bBy
	y2v1LFJJ0BJ/45xDAFCyK+P1MZnSKh3CrMuuQbwsHBMIBQnse5CAcUy8SZkVZmLTVnNxUhjveJ2
	ETSznQUrTPp1NLK1bZZ96HvryuuCr3DBuYwhly2EARsFt/41VHL5lR7aCzkZFqT72W90rljs9c1
	SJ0Rc/hwkVuEeRgF8MEX6IThT9GBYbzw9iW9feDAiqhPzn4ga6/JI7T40KVqd0e5gYdCdKqpgkz
	LJ2vZy0/5DCYYO7W8BA5VjWqvgElzrin2zFLejuIsDdVnEPE6z1jolE=
X-Received: by 2002:aa7:c2c3:0:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b38c1d2c27mr8512a12.10.1792101921872; Thu, 15 Oct 2026
 15:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-17-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-17-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:05:09 -0700
X-Gm-Features: AclHuK-L1bJQOeiBybz_HSG7H8fNC-dGTKSw_e8PKvf95DAN0dcFDflyFkrefZ0
Message-ID: <CALMp9eQGyPC8oU_cKjYeJkUhrhvxZR1NASD22bauOb4xhBDgyw@mail.gmail.com>
Subject: Re: [PATCH v3 16/27] KVM: nSVM: Flush both L1 and L2 ASIDs on KVM_REQ_TLB_FLUSH
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Flush both L1 and L2 ASIDs in svm_flush_tlb_all() to appropriately
> handle KVM_REQ_TLB_FLUSH by flushing all TLB entries in all contexts
> (e.g. for kvm_flush_remote_tlbs()). Since both L1 and L2 currently share
> an ASID, this is effectively a noop, but it won't be once L2 has a
> separate ASID.
>
> Purge all Hyper-V TLB FIFOs (for both L1 and L2), since both ASIDs are
> flushed, and an ASID flush is a superset of Hyper-V's fine-grained
> flushing (see comment in svm_flush_tlb_asid()).
>
> Note that if one TLB flush FIFO is purged (e.g. as a result of
> KVM_REQ_TLB_FLUSH_CURRENT), it will consume KVM_REQ_HV_TLB_FLUSH, and a
> subsequent KVM_REQ_TLB_FLUSH will not flush the other FIFO. This is
> alright as flushing both FIFOs is a (newly introduced) optimization
> anyway. The other FIFO will be checked after a nested transition, as
> KVM_REQ_HV_TLB_FLUSH is always set on nested transitions.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
