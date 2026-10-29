Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793282318;
	b=xq1xc3I4bYFF3EP3mF9rBD4V6LVGcErrS8+gsholwnE8IdXzpafkrbD2z2ibWzQx8qYp
	 IaigrfIoI2OxmD74ONbz3IVTl7pIMliCZqvSaBEVbw6GBGi0sR6qkEw0gD7hSMtEP1kez
	 uhrwzvR88cEcFwPcpqJb75wK/mpkh6arI3xDrQnVIuCUFsRac7lT1vFw2GlI0lOh6X3yO
	 cBzt73KEiBeBbuKCu1OP0D3vXd/+mc8DD0wzd4aD3a4UmLvyHpF2F9VOw5oCiH5oNB1jB
	 GSmqRy7wuhnA/ZRXelUpKdpc9YJEdlnOuBCN+ve2jAvhA5x7s7p9GkqKj1oHo9RiSmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TKHPwAz92PdhTqProcfmSePBu6DLZeLwLhVUswgSLow=;
	b=jCM/kHgNA1xJ57cJ8JriBQFxc70uKAdDV9jdK1VF6eMI3+5bUn7qmPV7VHL37y/YDAwK
	 3rpMOIFNs2vudYZQKvvdKDBiPwcigNXlN7Neb3sQMS881JZH2qZf2pAkrUoFrJTRmjBEV
	 o1UVyBE48ivDwQSM7O1SLJUKd9E87LVgvd4swIWlb90s83g+26Xetzzivk/ScIDi3pfGZ
	 YpFaZN7forqrw6QFoj8eTFUJBrBRVg8uipRg90/K+Eip8/sFET4Jv9qSU+5G505YCp4Bb
	 Qri4bN8KbGgddHzrbPLznBWRg4ofnZpxPkiPY/rEu/C+pvcfKkBEGvWh1dYPQ73yLhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJT1d2UY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJT1d2UY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c49c32650adso248098166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282316; cv=none;
        d=google.com; s=arc-20260327;
        b=ErrzZh2StvQYjNT3REK7nWafsh0+WnhI5F3gDZiSJygY/1fIjFUYBRFeL6n28Fd+H3
         ODsjqW0G/oC77IcH3poAbNxqhKdlaUgRmgZJczM1rMoK4DX9gbjXuSbtppLwH4881wBC
         4q733/D4dXOgFTEkHU+OJPD3D0kfPeKTJ0poDdzFlJrhSMlnL9a2gdNIuNNYZdZdWL2Q
         ZWeNCTL43CIkQhiDprTkwQOSVFB5DU3s4ErJwVnyb/VOJk5Sqmly2atYvoJp0oZhTFY5
         pfR0S4LQYxMvYer1EXfUS5pRCzA7iPUvSNG6tjd2It2vrfTBf6eXHsXkX8lV7noJgSv0
         knpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKHPwAz92PdhTqProcfmSePBu6DLZeLwLhVUswgSLow=;
        fh=kuOw3RGK9AVgtELBKCF/Fbhq+vbx3tds/Z0dJ8VYWBM=;
        b=rITSuPLb9ZUBxCeUyBpO0wKI1kuEl9u9pZp1VkVFUkzVQ5e87joXLKTTdK934yIH2E
         k6KQxqlPLgGS1I3OhG4LPh0EYsp18S83KY+DFY5oJaARhNdxlMJ1/DHUjRULsrqGzVnp
         of1vz0SErD2AYFVkgXTK4/AtM7Z7pIQBiRXkgaadaNKjiJZgYJCUvKYCWfLL3DXvtsD/
         c2VK8JgV1R4GNolDFXieShmoH/EolK7Jnx+I1bY0L0ADPVRTvdkXdnYN/yXNQGdClG82
         HM1BFVpYe0w4GIO4IW9R5a1wxsnAwa4U6K7zWWG5xEuvFqQPT5xRqVUvybiqCCB8IvrM
         Jfkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282316; x=1793887116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKHPwAz92PdhTqProcfmSePBu6DLZeLwLhVUswgSLow=;
        b=QJT1d2UYEQriYuUW8735rNQI7Kxphg9w4E0o+RGF/kDVGLDQFuU/jYic3i8KCiwg1E
         9CfETBF3zvvJP02YEwh4ijalEzaGBqdm1YheiioDRc4nG90iE9PRzY7MoQ5vWiinolFP
         GQBfPxT7lQTnFE0Q+oMEn5/mUUQvWaIeyUAC1FpKDh9ICBl/KT6q/D5LOoKrKA144n0q
         ujlPp32k8bwbaIBy4xdM+B+fVD8ArY0OYZOaBD0qWZnYG379pS/PeNRbD3P9K0IBYUJS
         S0n7iYugWmlG64W8iEam8AHMRX3i4+geBI3LBQ5JjPWyiDBf1T2Wew7OxtsH4I9+PvWz
         KdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282316; x=1793887116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKHPwAz92PdhTqProcfmSePBu6DLZeLwLhVUswgSLow=;
        b=xT/QrptWT/TVetTiIXbuDPouwJLSaJvvw2VPSWNng88AP2bBtiMetFuiNJ5mgC5U9u
         FqckLEAWcJfyWg5EJ82qp8cTGsdy+OfuXePht803+t6Sio8GEDs/NYss5KQF8dNqtBIA
         2+lrL76HVBgJcGzmM2oZJB2CNJLYl2N5ImZX8Ak38BsA9AY8urKDK6oGg7d3yqdLfKDu
         xx3iLXosA/zFaVlWjuS3iIp+f+AJ18qIDfWGsyWrVdmcgEfBAZfYpFRhjZxiAQtpKSqC
         tgHQQ5TuJwmrMj3Tp5E5uaWsmeHnAVD4WSV1KkrpBO20q9PTrG3bR6AbqKJWFlLGSKcu
         qo+g==
X-Forwarded-Encrypted: i=1; AKwUvByDa1iIrQ90oV1W1DMV03Gxm8X7Fgi4YgoYIp/64MDQwj/gULUvdDJ2+PAL/cbN3C3P33F1ibDYzpcLQ9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYB2XxdRe/UnBESbmul/yWckOf4naH24yGdZJoXpWKIhufXsyC
	saTBMqamSZlvxSjNA1hA+BVU20x4Z1t343K7XUTtvBVkI8vFv7vEmsUJyyogWJ/xP/CdUawSG0E
	KYzSBWkrmGjSF+2/Tu55nf0qfXs03OtA=
X-Gm-Gg: AYBFou3b4ewdyZUn6k8XUuOZ9acPKmYajsNl1uqRhTKUba2CmzQY+gc+V4cgQhhmjPD
	A+U8PdgtCIzWTRPRyF4WUQyDxQyCsbO87rUkBcQGzkds3pPyv3NCMT09CvQXJcOFyG7uftiOKQ/
	nu0RlNybLUXsr5wHAMwyGREebluru8x2yWU+wzzCCL2GCmT/Mkb2O0Z8VDSCjK1uANl/MQEI6oC
	Tspg+vcLWX1r2iaF5NedgPfvNBISQRZ4P24Zcbu24PyymKtdPDmIG33ub4Wg8LEhulbgsNx9fOq
	XEe/r7fKdgLDgaqcTmt6hT0Jq4ZN+/ZCixU2T5z59FvJnWEXvC7Wc4pNn4qnLoHEG/QjecJm7g2
	r5H7rcYHjesuylpFfxChiuZ5WMvLhZO1WsqbnBfDQkYO98SyHohtgQjLRS9a6LtAkKpFq3Q==
X-Received: by 2002:a17:907:d649:b0:c40:d762:feaf with SMTP id
 a640c23a62f3a-c49bdf380c3mr490800566b.21.1793282315466; Thu, 29 Oct 2026
 06:58:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-swapoff-writeok-v1-1-4f4cd420aa33@columbia.edu>
In-Reply-To: <20261026-swapoff-writeok-v1-1-4f4cd420aa33@columbia.edu>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 29 Oct 2026 21:57:58 +0800
X-Gm-Features: AclHuK_WpVrYhoxFjt0fFzoVltcEmX0dIv3cEJlmPJMkDPc9YKVqxhVZUIteE9Q
Message-ID: <CAMgjq7AxShdVC6Ax+5USBSCb3c92MC3UVGLucxN47W_EmVcwDw@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: stop cluster list scans once swapoff clears SWP_WRITEOK
To: mt4022@columbia.edu
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:21=E2=80=AFPM Mani Tofigh via B4 Relay
<devnull+mt4022.columbia.edu@kernel.org> wrote:
>
> From: Mani Tofigh <mt4022@columbia.edu>
>
> SWP_WRITEOK is cleared under si->lock when swapoff starts so that no
> new swap entries are allocated from the device, and try_to_unuse()
> then waits for writeback of the folios that still use the device.
>
> However, an order-0 allocation that chose the device can race with
> swapoff clearing the flag and then loop forever.  It takes a cluster
> from the fragment cluster list of a higher order with
> isolate_lock_cluster(), the allocation from that cluster fails because
> SWP_WRITEOK is clear, and relocate_cluster() puts the cluster back on
> the same list, so the loop keeps finding clusters on it.
>
> The looping task is in reclaim, and it may have set writeback on a
> folio whose write has been queued but not yet submitted.  swapoff then
> waits for that folio, while the reclaiming task, stuck in the loop,
> never reaches the point where it submits the write:
>
>   CPU0 (reclaim)                          CPU1 (swapoff)
>   --------------                          --------------
>   shrink_folio_list()
>     pageout(F)
>       /* F under writeback,
>          write not submitted */
>     folio_alloc_swap(G)  /* order 0 */
>       swap_alloc_slow()
>                                           del_from_avail_list(si, true)
>                                             si->flags &=3D ~SWP_WRITEOK
>                                           try_to_unuse()
>                                             folio_wait_writeback(F)
>         cluster_alloc_swap_entry()
>           isolate_lock_cluster()
>           /* allocation fails:
>              !SWP_WRITEOK */
>           relocate_cluster()
>           /* repeats forever */
>     swap_write_submit()
>     /* never reached */
>
> This results in a soft lockup on CPU0 and a swapoff that never returns.
>
> isolate_lock_cluster() used to check SWP_WRITEOK under si->lock until
> commit 07adc4cf1ecd ("mm, swap: implement dynamic allocation of swap
> table") removed that check.  Restore the check.  Since swapoff clears
> the flag under the same lock, isolate_lock_cluster() then returns NULL,
> which ends the scan; the swap slot allocation for G fails, and reclaim
> goes on to submit the write of F.
>
> Given that this is a race, its reproducibility is non-deterministic.
> We reproduce it by using a non-rotational swap device that is not
> synchronous, with 64K mTHP enabled, where one CPU repeatedly pages out
> two 64K folios and a 4K page with madvise(MADV_PAGEOUT), while other
> CPUs run swapoff and swapon on the same device.  In my tests it
> triggers within 20s in each run, and with the fix applied, it runs for
> 300s without any hang/kernel report.  This bug was found and
> reproduced deterministically using a deterministic hypervisor that is
> currently under development.
>
> Fixes: 07adc4cf1ecd ("mm, swap: implement dynamic allocation of swap tabl=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
> ---
> Before commit dda8fb68b590 ("mm/swap: also use struct swap_iocb for
> block I/O"), reclaim submitted the swap write right away, so on 6.18
> to 7.2 the loop most likely ends once swapoff frees the slots instead
> of hanging.
>
> Reproducer: https://github.com/manitofigh/swapoff-repro/blob/main/swapoff=
.c
> ---
>  mm/swapfile.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 601979b97f95..2b03d14b5f52 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -627,6 +627,10 @@ static struct swap_cluster_info *isolate_lock_cluste=
r(
>         u8 flags =3D CLUSTER_FLAG_NONE;
>
>         spin_lock(&si->lock);
> +
> +       if (unlikely(!(si->flags & SWP_WRITEOK)))
> +               goto out;

Nice catch!

>         list_for_each_entry(ci, list, list) {
>                 if (!spin_trylock(&ci->lock))
>                         continue;
> @@ -642,6 +646,7 @@ static struct swap_cluster_info *isolate_lock_cluster=
(
>                 found =3D ci;
>                 break;
>         }
> +out:
>         spin_unlock(&si->lock);
>
>         /* Cluster's table is freed when and only when it's on the free l=
ist. */

Acked-by: Kairui Song <kasong@tencent.com>
