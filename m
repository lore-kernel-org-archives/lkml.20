Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAA46AF00
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091154; cv=pass; b=CakgMgHogEVRKxwn18NzzXbOZBMI8Xr69l6YOtM2lUiS/Rl5O3g/u1QMtHyvbgYt66bfS458nuAzOMBKrTF4LBSah0xYK2z3OCm5qTKkRiwZ7GgTqjWXndnw+jBM02ZpSyU4rY0BMmX2DBKRmm5Ex7BQxLQ/23wQIu5bvMkBhXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091154; c=relaxed/simple;
	bh=njrs69PTpabl/E/c3igW5pfsoq94perIYIoiSEXvZaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1Nff0r75w1vOej99k6FyaBnyPt1eflMvNtY1rcHsFGf3M+F1/jDBMGqI5EX4iuFQ2E2slYpUGND12zp6En2Mqb05Bj0pG+Yq380umzir5qvn+U1RV54I3rcklA5R4lCTuWNzXPkq9Z8hWBZk6pX7BccmHsxpwd6empf/qj3CEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MluYjXw6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrZ864wv; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MluYjXw6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrZ864wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792091152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+t2QXv6kbjJkqJV/NGflwSk1ZKtAPXbD9EclLnTEDp4=;
	b=MluYjXw6DiYLWVgI7SZbf2/zaLrkGsh00iRJ7O5UVEy+jA8r3HI0H6TfbxE7vciJHRemZ2
	M/vARw5qBRftVc390pyg3WMWYB4WYZCYyzpZ/NBJsoEZTlhwi7Q58nChldnDH/FKtgQ/a/
	VJ82/IAStr+8HSSKzJu411mZuJkaPx0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-hBJVSY9VNbusuS5NdnfhoA-1; Thu, 15 Oct 2026 19:05:50 +0000
X-MC-Unique: hBJVSY9VNbusuS5NdnfhoA-1
X-Mimecast-MFC-AGG-ID: hBJVSY9VNbusuS5NdnfhoA_1792091150
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677d10671b7so7052021d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792091150; cv=none;
        d=google.com; s=arc-20260327;
        b=lhp5dfHjoO7S089lQzz50u92y/KnHN4a+UyMGeeY0LNMSbgisdt1foXOr0M+ZTvvEo
         TM1QUDvRWD4J6/hwAtiKPAbsLMTlw4W8BB3r3nnrmvm/fq/PXwiBjT+BnQhZkd9MG02D
         RNdWoJItI/EJWphlqIhc/q2rURwnWmdM6jQ18jTwt4hw8frz/18/6Mb+/AB+UGl05lup
         IQRq8pLuaRNb4W7snr9cWjDXxlwHcOkz2k3t7p0873leoWxLWAzzL2Kdl9MXUF5yOMvG
         c8kV1Fy9fuZkwuD2TmdYPgOWuCy0vhX5lq4+zsYfPQO90gNgNHhTvntCxs6fpJI3lzRh
         fTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+t2QXv6kbjJkqJV/NGflwSk1ZKtAPXbD9EclLnTEDp4=;
        fh=q66jedlqdn1wWuImgaLYP89+PEDp5fYvNtxcyMBnEjk=;
        b=Fuge7iHpOZkDNn4+8a9wTaIgPLP9p3TEYUPZhwuxu1/SXXUxoTusIw7SN2Ofih4FR4
         D7ZdFWuk6Yfq6Awvh97c09VrdluEvNBqCSjlv6cqOLOrhX/O8ZKQh0NLOxgQNFIxX3FN
         0ygK5OsTUTdP36xeblTy97ZyMYrVZPH98HWuKu+BuOXpScK2pb3OuEQtF8EyYZ6XPYbY
         xfSwvCgONYnrvPDEM0YoWoywojpoaokqTwCUPL9nT9vQpo00rwRx28HWSL794EeC1fRs
         fCb+m/wO0oHFGg8hJ4hT4r1yRyFiNXZ8HDPgLI0I2vWUrmLiEkzM+eKGPq0DpopVAs6y
         rY5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792091150; x=1792695950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+t2QXv6kbjJkqJV/NGflwSk1ZKtAPXbD9EclLnTEDp4=;
        b=KrZ864wv4YJKAeMBsTFu45J+hlnfVtRQ+8Z9N1cB1iHHf+fp2lkrUQXcos0C5RXOdp
         bc+duz4YTvjeakAtNfW98T7ecitm56cgwuIWPexPqhmCMhPbaELmjLVxnGVokSM4bGEU
         zhMWowlD6e8m4xl6syWe/64iGsfxf6gQNrerKvEky8dEtaQGA2KUHqbNCmjmzmo7KwKY
         QHaGca1zJOrGfLyyq4/gpcLsXEthNTwRwLFdscFWHy7PEdJZ4yjyg2tSPtpy9zNVIpgQ
         fx+LvTircb5/iqwY2rpD/1T+Wi5joM2CANsu44STdRHrgWXHiMdOGGzqMfO7ypfBVWRw
         vjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792091150; x=1792695950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+t2QXv6kbjJkqJV/NGflwSk1ZKtAPXbD9EclLnTEDp4=;
        b=pbqS0Ll0jfYXfxlBB1PU2cAIYMwHUesN0JJ7ioMRX6SxL/NkNDvoD8zVbWoioCcC4/
         c43MaR/RJmvXOgUpTI0YKq9zTH/koZkSBvesXTMXUaLO/R3s+71CuUAQnXI2663lwUCg
         YuuoFhJiQp7RvKxSfyZLVTNbyegPTu/JPoJwFjG0b3B9PDo6GeRPr3rBs5znuPvx0azN
         IgxV1wNPXhDRj096A00P6FSkr2+wAHnilyaU1F1sGEWxniVRh1LYPsQP5TIFLgAlSE4n
         F2bzYvWjGEG1PVt29ejB4l7fR1ccHXAgv9tn3gHMKlWIrpOTZfx1l3xIUT2bR+unvNni
         GzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNIq/RZgwELa9YsaP4HS75kn+bEfmxcawKNFU/g18ZF6WozQ6iyEz9XF3ye4wAFkIMSpX2+BWeSkqnqGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJRmT+HUcP7nULUqGICmuvx/N2uXokbG8ap4gB7Enu8OCP0VSu
	hSnyvESiwvt/WPANVT094dpKBQA+XxLN29fNcQ3q7a9jicJh8PKxEn4W31F8niq5qJnA3qIOWFc
	g2Zd7xuOF0PnD8D41Nl2mZ0YxghJkqNxDWhHNZ1if+ZH5zDvYsK5IXorjEgUdzbgvgzNudrCNfB
	ZItRXXaoUQPUiiUjKxLKL440EdynlGxgHTSAuxk2Ox
X-Gm-Gg: AYBFou1FBW5/inJZlstNh5Xk/dEqcOTpWeJ854R2xze7pbPiwTSia/Q7KtXivY6/bRh
	u2ozK7dm0O0DR7rsgxQOycKjlMz6QWCHFmbTAxkxA4APtXBvfUxSHQNvOn8GCJMjJEpgR67KxKw
	eATK6ICZRq7ob64uwYpCAnAcQWGIifvZISyOYT/3aNeYsz4qpL31ESk8d0JqxHo0vTbPhi72Foi
	7HKa9RzRDtRDaJMmpVzTAENz7Ex8o22w/Wrr+dU5mLwPw==
X-Received: by 2002:a05:690e:c41:b0:679:8bba:31f9 with SMTP id 956f58d0204a3-6798bba38cemr2199245d50.91.1792091149408;
        Thu, 15 Oct 2026 12:05:49 -0700 (PDT)
X-Received: by 2002:a05:690e:c41:b0:679:8bba:31f9 with SMTP id
 956f58d0204a3-6798bba38cemr2199234d50.91.1792091148870; Thu, 15 Oct 2026
 12:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-gfs2-escaped-copy-fix-v1-1-ff917ec48fcf@columbia.edu>
In-Reply-To: <20261014-gfs2-escaped-copy-fix-v1-1-ff917ec48fcf@columbia.edu>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 15 Oct 2026 21:05:37 +0200
X-Gm-Features: AclHuK94-O6U3jMmeZ5GvtKhtuJdhgNOo4OyQgWOMPl5vnte_lO1Kd2hA9skmQI
Message-ID: <CAHc6FU61aba=a4eTH8xLGm5RDpLxxwzstq5B3aMTA1R0CaNSug@mail.gmail.com>
Subject: Re: [PATCH] gfs2: fix the escaped block copy in gfs2_before_commit()
To: Tal Zussman <tz2294@columbia.edu>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:37=E2=80=AFAM Tal Zussman <tz2294@columbia.edu> w=
rote:
> Commit d68d0c6c3fc7 ("gfs2: Use memcpy_{from,to}_page where
> appropriate") made the escaped buffer copy read from the mempool page
> it had just allocated instead of from the buffer, so the block written
> to the log is whatever the pool page last held. If the journal is
> replayed after a crash, the block is restored from that and the file's
> data is corrupted. Only escaped buffers are affected: jdata blocks
> whose first four bytes match GFS2_MAGIC. Copy from the buffer's folio
> instead.
>
> Fixes: d68d0c6c3fc7 ("gfs2: Use memcpy_{from,to}_page where appropriate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/gfs2/lops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 77ef22eab368..16fba2108a4f 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -689,7 +689,9 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, =
unsigned int limit,
>
>                                 page =3D mempool_alloc(gfs2_page_pool, GF=
P_NOIO);
>                                 p =3D page_address(page);
> -                               memcpy_from_page(p, page, bh_offset(bd2->=
bd_bh), bd2->bd_bh->b_size);
> +                               memcpy_from_folio(p, bd2->bd_bh->b_folio,
> +                                                 bh_offset(bd2->bd_bh),
> +                                                 bd2->bd_bh->b_size);
>                                 *(__be32 *)p =3D 0;
>                                 clear_buffer_escaped(bd2->bd_bh);
>                                 unlock_buffer(bd2->bd_bh);
>
> ---
> base-commit: d0c4bce31a579216780b990a09250f15e00f38ff
> change-id: 20261014-gfs2-escaped-copy-fix-1055ded37add
>
> Best regards,
> --
> Tal Zussman <tz2294@columbia.edu>

Thanks, I've applied this to for-next.

Andreas

