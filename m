Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11EC265621
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790644555; cv=pass; b=uGGj8VCsOAbuIJvOASn4+izgT1pi6MwDHI6Vf/3fHINDStqMBgFbzpKRsPP3R0QLq+e6sM756q/d5dDY7X38chPyy5lYsJV1cxtuAP+QzT4v50560IIqdABbDlYyEWfU675RL6EsBmIdMfjy+DVb5fDAuif30n6YVv6VxM1MGbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790644555; c=relaxed/simple;
	bh=6KsV4rDAdDxcusMqf5nBXP8iJDyqcK6OlXAetdFDhjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQtx+7NU+EKkqrC9/kr4GlbmyzgkN8PqrOsYLnzakdwKnMUgabfa253YHWrUA5f8lUz9Fq7Q/JMRKLqpu+lfIqpp9feIuCSW4mLE9lkRw9f8kwdx5Eg3QuE/0GoIN7yKIrZ1qE6k2NFhhYKJGzX5EHigV+cHZWuk8NJa9g21d5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WLLPde6Q; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WLLPde6Q"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-81c2131b1ecso246322a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790644552; cv=none;
        d=google.com; s=arc-20260327;
        b=Stixs6ZLEZf5YXq39brhwQvxRTCyJCPd9Haju5icGTh1LAPIhX5edigbM3lpvinQGX
         n5ENt24v9B0Yxn2WLaWJhxPMkeqKD7TQnCleGSBwu2sxrZo4mrNdjduw/apfuylwMH2y
         SK0N3yblizMDiQ6k4MtDGqLscIKL1yCUVCBFWAa88NuWl4OY750xdY/5OseHkvjqbXAf
         FTgk3O8NUnD0VMJ+Fu4FR62I7hcAh49eOKpumrXhH/XL7o+5/LQcUcIzjHx4mMYdufLr
         wQUImEZ8L9mckjInWFnCxKhlbY+Nu4AoErsstaZ0Vl9J3IBvjaKt3l1zfJBZwogy0Cse
         p+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        fh=Nf2GQxaz8zVavDrckPJlCh5kXjvrMNUcI0YAqkkYQzU=;
        b=c/K3+8OvhX24goX0+VH8TNKX6M07BVeHGxsjRmcdzCo8H5WEwLbkL3phdm/bo/wBPg
         TLrv75z8iSXfeAgIXhR4zclPaniMa5heGqe+u8dQVpKGYLMFP7Eff1Y4JfRji5I1WDqf
         BKepiuZy+HKZvby3ZauRdnuN8n/XrOFocHSecOM0dZ/K8B8RZE1R21XrfTTEcXUJ/1qk
         qh9KcL33Pgx6VwDDP+kSxybLeJ7V7Z305el/zLIwSHddYdA30sFaFcIjlu/xz9QW8kT6
         l3FqXN8anekHADGqrPWZx1rOoNtAdSNQ5uqxZct66iUJv+Yy10dbOFRhM+VRBTD08c+C
         vTUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790644552; x=1791249352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        b=WLLPde6QqrGEQ7TlZnh6GBtwyEECzYPwNnwovqyCfe1nP6Rtl6cWfxOeP3v27T7+P3
         JO0RswXenQ3JCaWZLyrCZkHn/AqJHIeWnIVkVqqK7Bh4ONqjh6AJ3ZMIxqKxOF8tTBYs
         DGVx/ZdRRA3ng/3HZmmZD/Ugj2AGjzLyF8HdvvxasSWEujXdLZ4nUmvCXCRYa3RE0yRC
         URNtGEhe5UkwBmRgEecwiBRJ1kmnjqbw95t4pkc/S9muhj+DYZzBdnsaKKtNyIfLwjLH
         1D/kEnjt7dUyOT5ifyQp6U/0PPYcmijYeqVcAiqlt9Id3+2ViYXJFnlMm7rxBisMolUG
         LaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790644552; x=1791249352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        b=yQ32oRA99wJZFvISa2Djq4f91o0gfI/DYf/Gk1RLDJG4H57NCc+HZ1aIWA1byrCeWO
         lYV9Ulr/5GlOblXty5R2WnPTqZr1xxioqYQaOP/eH7lal0fVBoh3sQxw9dbwXfbbXQ7x
         4YG0c+Ns/g4pcNZ6uBcP6+31835zcnyOJsuwqwp+yjduSDrEE3WjJF2G5roTh/emB1aH
         SyEDdXQKwvVaxzPHDOCLQz2EHHG7hUaZi3PW46WNOvV0dIsUDvT9b35kOh1LCfb8UZwV
         VRvKMbSJJy0E5NEzcVF7UoevGF4z/w0AFdXiHt22fyZiJniBDitt6KaRjh2UxYiIr6pm
         7eWg==
X-Forwarded-Encrypted: i=1; AKwUvBy8q+h3H6jzY7MIK2yWuGjj05gCX3ouHcychXWj1DQS2jhzKUs2wVaHTfdQeCO/N2iXAYe/hNi9Y2UUmdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN6JH/5jrz+1Bk5NqCL3SECCtaYk/MkoGlh3hO3Wwbjlxvml6V
	nmtm9Ro+e6FHt8vfnjcB5jc9m5YT1GZdst3p/u14gcPO5PNIi6wreVKssHmcl1Pdkfcd7ZHyD9/
	wu5sXUfhaiIyRnwRt9nMMJtPdpwyys8ZlsweAY9Drkw==
X-Gm-Gg: AYBFou1auKPpDQVgWLKeprtBuD2amNdtJY74I2gVnGDh4KkJg+vhraO1M+yTZwn4u7Z
	C4xOlCnN1SmIoVQR+XYsFgrEnuP8DOFuXmSCDShSdkb6ZRToiCcc0W2z2PIwKIve2/DytGZuT+O
	YfFsY4yeEb/lZCoDIEWd7of42QsFw/3E/DUQb6qHOp48H1GK8WNDwMAIH/V0CViuGDqg4zf9PDV
	RdzVg/zNOEPe0cEu3kwsHuOEDRWQehSHmx/FqO9/iLDi3+JkkX010XcsTW/2UnexVqpK7jWqMvs
	revQ6wSTuxeoXgTgy9z9pLlS1V+ScjxBVbzuDTDUjln7H5nE/sAXcGk=
X-Received: by 2002:a05:6870:f114:b0:47d:4630:5998 with SMTP id
 586e51a60fabf-4930a82b841mr16313646fac.4.1790644552340; Mon, 28 Sep 2026
 18:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909222836.2475352-1-csander@purestorage.com>
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 28 Sep 2026 18:15:41 -0700
X-Gm-Features: AclHuK9y1BkUmfj2CwBKzqVvJvr4htN1Ij_BtBFRlnLw9fnPEz3avSjdBXHF6AQ
Message-ID: <CADUfDZorm3WsYxvKQkqr1DVAps=ejF7M4U5PLD4O-94GzmYt1g@mail.gmail.com>
Subject: Re: [PATCH 0/6] io_uring/nvme: support fixed buffer for metadata
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, any feedback on this series?

On a 4 KB io_uring NVMe passthru read workload with metadata, we
measure 14% of the CPU time spent under iov_iter_extract_pages()
(called from bio_integrity_map_user()) and bio_integrity_unmap_user().
Using io_uring registered buffers for the metadata avoids this
significant overhead.

Thanks,
Caleb

On Wed, Sep 9, 2026 at 3:29=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> io_uring NVMe passthrough supports using a "fixed" (registered) buffer
> for data, but not metadata. On high-IOPS workloads, the pinning and
> unpinning overhead for the metadata pages is significant and could be
> avoided if fixed metadata buffers were supported.
>
> This patch series adds the necessary plumbing to allow NVMe passthrough
> commands to use fixed buffers for their metadata. The metadata and data
> fixed buffer indices can be specified (or omitted) independently.
> Supporting separate fixed buffers is important as metadata buffers are
> often stored in separate memory from the corresponding data buffers. For
> ublk zero-copy I/Os, sharing a buffer index would be impossible as the
> data buffer is a kernel registered buffer while the metadata buffer is a
> userspace registered buffer.
>
> My main question is which layer the metadata fixed buffer should belong
> to: core io_uring, io_uring_cmd, or NVMe passthrough? In this initial
> implementation, the io_uring_cmd layer stores the metadata buffer node
> and the NVMe passthrough layer defines the UAPI.
>
> The main argument for moving the implementation to a more generic layer
> would be to reuse it for other io_uring request types. For example,
> IORING_RW_ATTR_FLAG_PI could also benefit from a fixed metadata buffer
> option, though this series doesn't implement it yet.
>
> On the other hand, core io_uring_sqe and io_kiocb space is very limited,
> so it may be undesirable to dedicate it for a somewhat niche use case.
> The metadata buffer node storage could be pushed to the NVMe passthrough
> layer after my in-flight series [1] to reclaim nvme_uring_cmd_pdu space.
> However, managing request-scoped resources from a ->uring_cmd()
> implementation is a pain, as the same request can call ->uring_cmd()
> multiple times and may or may not complete when ->uring_cmd() returns,
> depending on the ->uring_cmd() return value. io_req_uring_cleanup(), in
> contrast, provides a single cleanup path for all uring_cmds.
>
> [1]: https://lore.kernel.org/io-uring/20260909155848.2069290-1-csander@pu=
restorage.com/T/
>
> Caleb Sander Mateos (6):
>   bio-integrity: remove dead bio_integrity_copy_user() error path
>   nvme/ioctl: remove struct nvme_uring_data
>   blk-integrity: pass iov_iter to blk_rq_integrity_map_user()
>   nvme/ioctl: pass iov_iter to nvme_map_user_request()
>   io_uring/cmd: support fixed buffer for metadata
>   nvme/ioctl: support fixed buffer for metadata
>
>  block/bio-integrity.c           | 51 ++++++++++--------
>  block/blk-integrity.c           |  7 +--
>  drivers/nvme/host/ioctl.c       | 91 +++++++++++++++++++--------------
>  include/linux/bio-integrity.h   |  1 +
>  include/linux/blk-integrity.h   |  6 +--
>  include/linux/io_uring/cmd.h    | 12 ++++-
>  include/uapi/linux/nvme_ioctl.h |  5 +-
>  io_uring/rsrc.c                 | 28 ++++------
>  io_uring/rsrc.h                 | 17 ++++++
>  io_uring/uring_cmd.c            | 30 ++++++++++-
>  10 files changed, 160 insertions(+), 88 deletions(-)
>
> --
> 2.55.0
>
