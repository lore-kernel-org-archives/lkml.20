Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292321ABBB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864980; cv=pass; b=ZOyN6PY+r+lDBjHYJsOZWfoMPE1804yMI+Ypwjpm6Iepy2MMlMMA3DA5LbYtMYovkftxOffxfXEKaK3lbsWf+Q35Zgbpazk1HB3OW3MZPOQ+/5ymMw+okc5HdoVmDiJQmi2huBXzv7J6PEL3GP3NVCljg7ZbON1wmb2auj3INGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864980; c=relaxed/simple;
	bh=EuScvzexzPb+xEeXIANQoNoJGGCPYZxFQk+Lqw6x2oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlEI1K7rTJLzTlg+Tgaumd796iyScAl4jxyu9BNrC9+OocqoVCW9W0OY7bZaYXHo0riDAgW2RrTghM12zPuJHEk9JlTXkMxfLQMghI3sBBm9xenbRm1YSwjHDPIzP/D4odg7mKXpbf0Pl3ggNJLgMwqqMBhNGsYoVPNORZdgn1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpRpnWmN; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpRpnWmN"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53512cd2f85so33474851cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791864977; cv=none;
        d=google.com; s=arc-20260327;
        b=bvAo1z492vwb1+LaPQTCgK7N6PV+hyFfro+S/m4er/R949+vFu0nI9+bMKugprHHVJ
         Lw0owlPRpSHlYjB85i8X4gu0uGVlbdCzwmamib04dVisz1OuKg3/TJhpol+3zZrhTkHr
         QiRysVe/Rlff4+w6LHSG1Gfq0QVktqtatha/8KU80Uw7Dm7Tv8qzJN0USzfM0T8Y965j
         qRy5T7nd/4FNxXp7qc1lJwFV/8l8Mh4bGAIItnL0beM7TVBHykRUyRlKZUcRkJi9foNB
         Pp/9ByLx+2Brb2xoBZG3XbLDB3F906h88mm8ErSwJvEuZK8gVj29ISft9TodMc5yMtHN
         PcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s9nsO0UGothDGSbTzPgGoq1CEP4hbj1NtB+IcAtJLLI=;
        fh=LN3hmYbfbgwvAdMIFJVlCc2GaqpOKnnzxXdxKGCh0OI=;
        b=FEsO1O66BWJajei15BW1DNxAB670PGAxIZg+t+zW1GYwgtWLVOjeLvKyuFuRZvRSNh
         sW7iDhpUOySkKNaSzFaYeQf4pNa3qoH6G5sVVs9AzzrXCWX8mernwhO+nH0LFo+r3Xyi
         gEjeKYleXACqXJxO42tpAHg9ZabIpo768yNR7g/qCxF1ovoZNpTx4u09aiENtUtpUfqz
         zKusIx9yl6TUmIx/d13/s+2qQUrrJwb1pFedVE6hDWRMatoK4h/ARseO0bO0vtI7FzZ0
         9gT9D2R1olqni5YyhD+xLklKwxHzAKQSsYQ9TmcoS5DktzFvia5CySLReNtOu2iSCrTc
         MA/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791864977; x=1792469777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9nsO0UGothDGSbTzPgGoq1CEP4hbj1NtB+IcAtJLLI=;
        b=DpRpnWmNzQlVIDYZ5GI6LgErg3Lh/tUFAVD1/BmEfypxLeEt8hcJ2N/7+2f7MAKiGh
         deAgN6QrI1x/XYlWv1rmkU9yAKYU9Wukb/YEFoKhci4RdkfHrhf5/nIi1GCMrLWPTZRV
         SlAIUyITOJ4hdjtSu2UdCd02tNkR7GzzuOhjdCErxAqfGmM5nicbEJunqh4hWctRmrXX
         YBywKp9c7P//AcjneCjn8zryDJAs3XLRSqRY1Y+KSsv8XbwFszLIoGBAPG+u9TXOzC9V
         CeS7ihFhg5IUpMkdL7Np12m7C7KqeWkDlGX+Z2e9Ed+3YYU+Atl7T+vzIal1nNVncMLo
         ADkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791864977; x=1792469777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s9nsO0UGothDGSbTzPgGoq1CEP4hbj1NtB+IcAtJLLI=;
        b=mRWeRvmLP5366mB1UcmBNXN13nCgKCa89KCkTeFoXcC++bQHzNt61p+q2ysXYPntFg
         Llir2vz5e5KtwqK03ZK9jgvUqLVQBRCZtVsEtf4jkGBBOP0pMIpHAoBdoc7Eh0kbQ+cg
         htreCZ8BkS1VtltktSc0Q/H5Jg4L45GlsNpRjaABNARmDIItjdZMW5FHKtBk/JRQmsVN
         65LI/l189v6Wn26AWPZqbCOs8IyJVViDXJQwgyt29GhSJBg4yIgSCPeY2bVuD72372tS
         MeBFBqNKd8v1pvZIQ4dK+komaGOqT1LNslxhqIg5F5dCLaIzBFktjULlHfDwP6JN8h30
         bb0A==
X-Forwarded-Encrypted: i=1; AKwUvBwl9xdVj0wzwEacmbwYzZ5VQINV8NS1jpzKoxPAdA0GHTY7kgN/pnJCAQYXX+PnsI2QCvsKMQ22qdhkBq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh/CLlGsmBMqr+kGC89teyuxj5cXCx8bgT487qsM3pER0mjtPz
	kq4ncDBTtUKTu376q75BsNcS1oSqEambUq7YzFGb0hFgt4BF/9g/DKHNLWMbYYYbOZOS7U2QR0q
	TRrpZyLrtiLEXE91fCG4UZRIOgSwfaZg=
X-Gm-Gg: AYBFou2Elx93DHIvVyM2FdqAweIzAvzUsnn7aDK/8fuqALqlom1TNNpqXf3ZBO7fQS2
	q37GXA2yUfdFj731PsLemCDH3BTB+b4dQ5VqjDvC53ku9LFXztk5zmrSCOwXPi++t/jqYwGo3Ga
	g9pXGYo0MoyXTH7J9Ir9AaLx4XeBPLF9Z/+UMzCTFCC3HRBQVlElpVW1KaoReAowJVNjrYQJKYr
	U5vEwETaD6j23YK7Z31PbLrklqyJ7tHEBFbXkfHkCsqyFwxijaTrxLOMKNgCqX3CRlAu10oJEkQ
	YkW0Zp9mbJrT4j0pJKbD9LwJuAHJQEHRtgRhT8HHI8BKKLC07DArkvNWBcammgqA/I/2BL1oW/O
	xU+uHWrJFPB+hebV7oCcaH8/PC6J4K5wyXbRarr9t
X-Received: by 2002:a05:622a:4d89:b0:533:a8fe:e43b with SMTP id
 d75a77b69052e-5359fb65378mr173702381cf.38.1791864977501; Mon, 12 Oct 2026
 21:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913084907.520877-2-david@davidgow.net>
In-Reply-To: <20260913084907.520877-2-david@davidgow.net>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 13 Oct 2026 14:16:05 +1000
X-Gm-Features: AclHuK_SP0l1zjHTbNHKw24D3i8q_PEVEt7AWawe0CGqkzoKBq90LKfm_nii028
Message-ID: <CAPM=9twi62M3zJJMGa4M8WybEXhX6VK7VGtGBjrBUX4YQRs9+A@mail.gmail.com>
Subject: Re: [PATCH v3] drm_buddy: fix power-of-2 rounding errs
To: David Gow <david@davidgow.net>
Cc: Jim Cromie <jim.cromie@gmail.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Auld <matthew.auld@intel.com>, 
	Arun Pravin <arunpravin.paneerselvam@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 18:49, David Gow <david@davidgow.net> wrote:
>
> The standard roundup_pow_of_two() and rounddown_pow_of_two() macros use
> unsigned long internally, which on 32-bit architectures (like arm32) is
> a 32-bit type.
>
> drm_test_buddy_alloc_exceeds_max_order() uses these on a u64 value,
> where they silently truncate the 10GB allocation, giving unexpected
> success in DRM-CI.  (see below the snip).
>
> Fix this by replacing the those macros with safe 64-bit power-of-two
> calculations using ilog2().

If we are going to do this, but fix it properly later, I'd rather we
add the 2 64-bit macros to the buddy allocator and use them,rather
than open-coding this, then knowing we did it later.
so add 64-bit rounddown/roundup macros earlier in this file with a
comment, then use them here.

Dave.
>
> Fixes: 0a1844bf0b532 ("drm/buddy: Improve contiguous memory allocation")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Signed-off-by: David Gow <david@davidgow.net>
> ---
>
> This is a straightforward rebase of patch 39 of v12 of this series:
> https://lore.kernel.org/all/20260326185413.1205870-40-jim.cromie@gmail.com/
>
> The only changes are updating the buddy path (as it's no longer a part of
> DRM), and adding the Fixes tag.
>
> This is a fairly hacky solution: I've got a nicer series which adds clearer
> helpers and generally cleans up all of these macros on 32-bit systems, but
> it's much larger (and growing as more things need cleaning up), so I'd
> rather have this more urgent fix go in immediately, and save the cleanup
> for a less-urgent follow-up series:
> https://lore.kernel.org/all/20260830103321.2042968-1-david@davidgow.net/
>
> As noted in the original series, this is causing KUnit test failures on
> all 32-bit architectures:
> [09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: EXPECTATION FAILED at drivers/gpu/tests/gpu_buddy_test.c:1429
> [09:01:26]     Expected err == -22, but
> [09:01:26]         err == 0 (0x0)
> [09:01:26] WARNING: drivers/gpu/buddy.c:508 at gpu_buddy_fini+0x244/0x2e0, CPU#0: kunit_try_catch/1595
> [09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:508: gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]))
> [09:01:26] WARNING: drivers/gpu/buddy.c:516 at gpu_buddy_fini+0x284/0x2e0, CPU#0: kunit_try_catch/1595
> [09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:508: gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]))
> [09:01:26] WARNING: drivers/gpu/buddy.c:516 at gpu_buddy_fini+0x284/0x2e0, CPU#0: kunit_try_catch/1595
> [09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:519: gpu_buddy_assert(!mm->used_scoreboard[i])
> [09:01:26] [FAILED] gpu_test_buddy_alloc_exceeds_max_order
>
> Cheers,
> -- David
>
> ---
>  drivers/gpu/buddy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index 26e7a48b55f3..964a5ae78f1b 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -1188,7 +1188,7 @@ static int __alloc_contig_try_harder(struct gpu_buddy *mm,
>         u64 modify_size;
>         int err;
>
> -       modify_size = rounddown_pow_of_two(size);
> +       modify_size = 1ULL << ilog2(size);
>         order = ilog2(modify_size) - ilog2(mm->chunk_size);
>         if (order == 0)
>                 return -ENOSPC;
> @@ -1435,7 +1435,7 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>
>         /* Roundup the size to power of 2 */
>         if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
> -               size = roundup_pow_of_two(size);
> +               size = 1ULL << (ilog2(size - 1) + 1);
>                 min_block_size = size;
>                 /*
>                  * Normalize the requested size to min_block_size for regular allocations.
> --
> 2.55.0
>
