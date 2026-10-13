Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3F3AB284
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912626; cv=pass; b=WDj/PijbBea10N4KNYXisl/g3/VbEH6YAITdHy/85yX6qbMDD/UkjaQpv/DnaGl49Wncpr3HYhQtrtNxWjd147Isd1yf3MTOuAkac7NEH/w9fj6GLw6YPteE1v4q2VzJCO+tbv6TYEY0T4WygdW3Gvdpq5+TGAAIKXRzteyUYFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912626; c=relaxed/simple;
	bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfZbEilW9+HSC4wRGjRHHLcgYK2JTV0cgQSLS8hGkN/yjcFHz8eIwd/D+dUPHTIwdcpLIGBSaC0zaD1AWI61v+cfBsHd2lEEiH62nvJ1EW1yZT1Ez0IM9I1rmFyGvWdEC7nZNtePRrCmIdsHh8wFVbEXd4iuoFHs89jYHkwYk2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZTqr/YU; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZTqr/YU"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so182186c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791912624; cv=none;
        d=google.com; s=arc-20260327;
        b=oHphryr01ukojrguVfJ2jIOogUzQu0OoYy8eF6Rqxvn+vOSv9P3/dIrZi8FKqNh3/2
         oIwmDM8LPFdb5NJWvKefmJAS+3w2MaZePlUAnK1QXZd1k4pJZ61Mw0E/um5lOEPcEhCh
         KsCaDzgyjY1n8UkmtitLZgOwiV6Frsfx8mXXMiFRQhdZ9idyWWwoGvSQ6hkqMM56+BDq
         NfjWEX6buESC/YbMe9ME/FTDAnVWxI7LNhJ/c9TlcWk49ygvjsPyUi/KpNb8Txppn3uJ
         UBbwn6PkVwZA2vEOLUJq25XEozPaBV8ruzYRtVvO0XLz5Ue5DZd6cdVAKc6EGFABVlKr
         Zkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        fh=KT64Yo/TllNrVD5byRJkYBK3JBYmHwwniE+SCZyTBOE=;
        b=bmCTFpAUiSdu6PpYfpubpO6/ZBVQK/2YEiBmR3LCYUyyfmlw7d3izs74Q/DmeHBkfj
         asiAA+Gv87Je3fsKunc3fQ3+O7nftNnCEwBoUlt3qQs9zosingOayB+34lvmsWSdNiHy
         eWtFet48l0RzXXmVskBo27cQFjegBOan3PJz+53ZzWb/0pmTv8178pqnbFVr5QWGUZg9
         /nmu0YBh+/aUSQpV2QiXWDRrloGbW79af+DVM0fXTIW3Laig50FUoPeeLdbNyaH/Ygjy
         99z7ACCZa3tncMrpZRVt+qcWbtZy6C1WywkqVj7QKzvVPqxa7ZzK0g1ekcVkNA3jlDU7
         N2fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912624; x=1792517424; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        b=RZTqr/YUDZ0F1K5EatO6UmZowcZVS+RVi6bSxX9vF7xEzuHVt1M76HMV0AwGBFW6hy
         WJgcLQ8V1rQDxn5KlipCOsKiZGlqScz3NYzH6okOkZqEEmUyYcjmmFtt0QqOXw3Equ0S
         Mn5NeG995YwpHdgf5XxJvo7Z36wmNrBZ5+k2fRkoVTdGwE38OfSqrMn1InZNg2nqenrM
         G8Ci1zp0KJQraGiOrPvA5m507tIIvW/keQaphZ1oFZlODaWYQQhi8eTs9Lg3VPsDdbHX
         WVfubWmXFfLyw0CiEtNO8jFXGOQbQ2ad0YjDpPO/qClWfg+h+mbs2+bbGtkBgSSemDt5
         +Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912624; x=1792517424;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        b=lrR3GKtH7Czar32EVZaQaSOC/ChUKZVbGJPozS00JbGWfA+11hFqY6mX3FKn3fUqX1
         St45Sj8sYXzCLBoSo3Tr2+McZy7evqrOlg5LPvLg/o0+CXFOimcgwcRNZ0Bt0WyBf1IA
         8AvfUJWQimOKbfs49/vpX5t48pHzzh2yQD74bR/kK/sNMJIQdu5g7NzPbopuBuOaCz/h
         a8c1mXyNxbZkUd1dUwhdWuqZAP/XJd2SaR7waN2qFMCI+OT1rEKm2oSn0NF16T+gGg5Q
         rIARXl+TAKLha/5zCciZp1384XG8cR9kSxVF6VOb2ymzNSbXp/FFRGGB9bspWXCIZLkO
         TT3A==
X-Forwarded-Encrypted: i=1; AKwUvBxomsOIX9jJYMkpkdrvhkNekilaM0S8ohHMzPkMfxVs1dMc9TJudkYrvFGGamPoDUlEVhLmkep/EwgF69E=@vger.kernel.org
X-Gm-Message-State: AFq9FYInzRQPBNkJffjE4E61/ABhBr5d9/nWT/oQMcVmGTir0HEdXyzH
	exrp+HbSzSlhh3F9lpa5Cv8AW6Sm6TNJa5q0VqzalPeXaT9N6lUcdkSTmrGIWYRGuYuUTgtFWdG
	IXymQD026If7qrcfVBBKjc3IM4OiJggVT9s+b2aOedg==
X-Gm-Gg: AYBFou1Qtx3RT4fq4gMpHfIKA5RXREvKZAvA/tDP3DYZ2Xk8BgR+Pqg72inLrlfQ2Ph
	q+pCOZWEbqO10aDTRYpyNRhKZGnaB+1WxFt8EYtOHtIBJZgjvsrOTHyyeUF4zGoqTaOHAOjBup/
	3uP4kRyB8uvFH7z/aipJ1enVcoHPCBrFq1D5XDgaOzje7rDECxgp6LKVKBz31S9dJleY7Q/7AEl
	sPV17OtMYqDwC87iNNgdnMVV4iMWbheOueKPLLVxqiGxIhQeSRkjrZ2Sz/94BGsBtrYX2lJB60S
	jg5uG5FE9iqUKNzH1Axm3zyIew2vhbMjoR79MTsd3zNd//f1A700Jhb2CQz5t5gzvFY+iNHzRFT
	Glkc2hNgIpUY5qK5/3HPg82QGrJmV5rXQn7k/8RhvGz1WLR0SG5AKp5K5GGF2ZgDAQB+qngLUK1
	khIo7AWsMD1e9uvNrS/0UtOA==
X-Received: by 2002:a05:701a:c96f:b0:179:50d7:9ba4 with SMTP id
 a92af1059eb24-17950d79e34mr4981272c88.41.1791912624201; Tue, 13 Oct 2026
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012034020.100737-1-oliva.scorza@gmail.com> <2026101322-reexamine-astronomy-d4bc@gregkh>
In-Reply-To: <2026101322-reexamine-astronomy-d4bc@gregkh>
From: Riccardo Oliva <oliva.scorza@gmail.com>
Date: Tue, 13 Oct 2026 12:30:12 -0500
X-Gm-Features: AclHuK9o6enG89TsuG8KKARN_Opz28I22nC75RjQdT0RZsA5K-O7kcwoSpews7g
Message-ID: <CACseTm=8+20OAgsS+Hsm=1-8rUhs24rz1nyRVr7P2s93Mp5xDQ@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access outside
 list loop
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How was this found and tested?
>
> thanks,
>
> greg k-h

This was found using Coccinelle with:
linux/scripts/coccinelle/iterators/use_after_iter.cocci

It was compile-tested on x86_64 using defconfig:
make M=drivers/staging/vme_user

(Note: I do not have access to the physical hardware for testing)

Thanks,
Riccardo Oliva


Il giorno mar 13 ott 2026 alle ore 08:40 Greg KH
<gregkh@linuxfoundation.org> ha scritto:
>
> On Sun, Oct 11, 2026 at 10:40:20PM -0500, Riccardo Oliva wrote:
> > In vme_slave_request(), vme_master_request(), vme_dma_request(), and
> > vme_lm_request(), the list iterators (slave_image, master_image,
> > dma_ctrlr, and lm) are accessed in the err_alloc error paths after
> > exiting the list_for_each_entry() loops.
> >
> > While the iterator variable retains its pointer value upon hitting a
> > break, accessing list iterators outside the loop body violates modern
> > kernel coding standards.
> >
> > Fix this by referencing the dedicated allocated resource pointers
> > (allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
> > blocks instead.
> >
> > Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> > ---
> > Hi! This is my first patch to the kernel. I am learning the submission
> > workflow. Any feedback is very much appreciated. Thanks!
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
