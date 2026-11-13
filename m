Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584486;
	b=Oler6ENhOK/3SVeTvCWs6i/1+Ts+ItrjxFHu7tJdZdTK1JbXQaEje+L5eXwidKBmR7TK
	 jFbtJvp3rLJ2vVY6TG/ckDP2D3RLuvYJ7rVotNVyi5VzCwgWMBtaM7Uy+OkVCLHKri0Ca
	 bYbr2bvT1UtJnXcLuSfJ5BWMVsqQo+kALLJ5nFjNX7cVp7vcFAvvTIq/7Mf/Z1cRYG5ps
	 z3UKPxEI5F/JxCLIyqM8OvwfUmuGHi36W+E5Ajbl5s43dzuyi2MFIQhTW7bwzXdY1Howr
	 144GbqUD4wg4IIgJgFcwpPP83/e90zXF0bpuakkczZ3KYow0NGVzQc9XuLc5Tn49PCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584486;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M/5Ptjha+MZm4VPJ5exxOSJXhRhs6Cnn+oUR2J6zLoo=;
	b=rtmMrc4wI3JHA5rVdkMrkKVywPGLEHMyAMI8wEQh993I5htcEvNsWr9OrFo3YuDJqW9e
	 CxwaN1df4oa0yBfCMqw0FDLakgQpiGtYV2yBlnGPDyyNthhOAAU7m4OR9wSEj4aVnyYyT
	 EDDmZrElphTNgCTIbNt7bumhz1npI/UZLPuM/kqMuFPMi6bFw8cjlG+Mgj3JTTeab7EGi
	 f2159v42uVNgvgqMHPaRaRcXS2Pa0K2a0I/NsDRQuohrZvCU+YIqH3zh60hH7kyoVnthe
	 /RsvnXPOmPe5ycZYjXPs9xlyAJ/LBbY7NJ9d4HcYDcKAwYjg9K/dbNGpTKlyVeeZhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Glpf2ZoD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEE606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Glpf2ZoD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2041F000CA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794584485;
	bh=M/5Ptjha+MZm4VPJ5exxOSJXhRhs6Cnn+oUR2J6zLoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Glpf2ZoDv+4Hb/eXMTnB/lrhr8OvOEGol1gpB8n2lNGlvVXLhnNGag8mLZFQ/Fmgm
	 bPOq9VGdUkCF+Lp9X7jXFjejhwaIVxkeboU49L67DB0Nh9Ln+cXvgYbOwkMvtuoyu7
	 oOXFhQZMW7GaAdDognkwpFkgjGTb2YdHVU0DH3+DLvq1Hq8uLXv5jT06UXRKZlKqx1
	 aM2bkmoUkG+7Qb5JtB1EgkbpYruceFzfbCQbmyHYe8r/y0IIXqIpfa5I27jx6o5I3K
	 G/GAXet4fUFiyzthCbSHgFsE4GuF0+e4jUBEjP8CltNVm2r4hvwgr5FlsZ0zRhHxDg
	 r9ksXJ8d+horQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1044644e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:41:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHgeAUWKWlxo8ud7ohlZP0uTgDKBvFN3HopR63E0CRWDSseyeD40jQ/MIur1Dw3U1TUwp5JrkxoDB+Us84=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mWs+ge18G2TZpCnOK4DThzEGEsPWr5biss/PKFwUepYJukVGY
	C0rItkZj66NJeGNXYTguf62ApOIxs/2rB80XutXK4w7OXUq36YiCEPTxdkOe170omKBEqXnU0UI
	aM6ROFC1LFbDH23t8Uhv64RvgtJn19/o=
X-Received: by 2002:a05:6512:33d6:b0:5bf:e7d5:c22e with SMTP id
 2adb3069b0e04-5c170b2d8d7mr1035200e87.65.1794584484190; Fri, 13 Nov 2026
 07:41:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930140850.4864-1-parri.andrea@gmail.com>
In-Reply-To: <20260930140850.4864-1-parri.andrea@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 16:41:11 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gKFEh7Sdt2pWXQmXOfNUt1bZXDEX=DUreJnbBFbaV_6g@mail.gmail.com>
X-Gm-Features: AclHuK-qbkP7uKHsgB_vdFdNoRe6t7FdMb6Md0Dg0CjFhPw0DEygSMKA3gwoyBI
Message-ID: <CAJZ5v0gKFEh7Sdt2pWXQmXOfNUt1bZXDEX=DUreJnbBFbaV_6g@mail.gmail.com>
Subject: Re: [PATCH] PM: hibernate: Wait for in-flight reads before freeing
 the read-ahead ring
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Bojan Smojver <bojan@rexursive.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:09=E2=80=AFPM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> load_compressed_image() reads the image ahead into a ring of pages with
> asynchronous bios, and waits for them only when fewer than CMP_PAGES
> pages are buffered. From the second loop pass on, reads into the rest of
> the ring are thus in flight while buffered data is parsed and
> decompressed.
>
> The exits taken on an invalid compressed length, a failed decompression,
> an invalid uncompressed length or a snapshot_write_next() error jump to
> out_finish without waiting for those reads. The function then frees the
> ring pages and returns, releasing the hib_bio_batch on its stack, while
> the outstanding bios still write into the freed pages and hib_end_io()
> still updates and wakes the stale batch.
>
> A corrupted image is what fails these checks, as the CRC32 is only
> compared once the whole image has been loaded. With such an image, the
> resume fails with "Failed to load image, recovering." and the boot
> continues on top of the resulting memory corruption.
>
> Wait for the batch at out_finish, as save_compressed_image() and
> load_image() already do before releasing their buffers. hib_wait_io()
> returns at once when no reads are outstanding, so exits without
> read-ahead in flight are unaffected.
>
> This was found by code inspection. It has only been build-tested; no
> reproducer was run.
>
> Fixes: 081a9d043c98 ("PM / Hibernate: Improve performance of LZO/plain hi=
bernation, checksum image")
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  kernel/power/swap.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index c78f1593600bb..49b3da89b49d4 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -1198,6 +1198,7 @@ static int load_compressed_image(struct swap_map_ha=
ndle *handle,
>  {
>         unsigned int m;
>         int ret =3D 0;
> +       int err2;
>         int eof =3D 0;
>         struct hib_bio_batch hb;
>         ktime_t start;
> @@ -1478,6 +1479,10 @@ static int load_compressed_image(struct swap_map_h=
andle *handle,
>         }
>
>  out_finish:
> +       /* Error exits may leave reads in flight into page[]. */
> +       err2 =3D hib_wait_io(&hb);
> +       if (!ret)
> +               ret =3D err2;
>         if (crc->run_threads) {
>                 wait_event(crc->done, atomic_read_acquire(&crc->stop));
>                 atomic_set(&crc->stop, 0);
> --

Applied as 7.5 material, thanks!
