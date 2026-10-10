Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F3291C10
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596076; cv=pass; b=OmVS86h4TiOKxmtOCKahwODF9plArsQlGDatyP7P22i2RBA39NXTtX/W4mgzm4iMcTgzj6JOvyGrh6J6dsbV9vmdLdWq/LkJ/xk1mGozwH5HNB8Eg6T4V9795DuKA/OowFK2piSEj3pOihBxWOaP8RESAnO8zXhw6ncrXOqreJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596076; c=relaxed/simple;
	bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOlUCkvTmKSBJuCf5dY9tm0J+ZlgZkf+TTvN4zi8aVDBekW0B8On8LwUJXvyXQTcpVi4rrK9DcdmvOWVw/YUwPgmIbpTpOQrkMyuFyGVXuGNpmyODDtQckBfgB3iJtpECMNPw4CC2g/HYAdVm4OtG6xw8QnCY7f9Fgwt0JeWh7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofijy4eX; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofijy4eX"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a9787a156eso3097111fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596073; cv=none;
        d=google.com; s=arc-20260327;
        b=WGurtPz4eTQlEKkv8rEggaVOzp1QgG5GiofVjM1t5Uu3QPiwqb5eBFgQC0j3s2UzuQ
         dPi2x3zl2AC+quXAJY65hAG3eGjugyDSPsc4ipjUtidqKb/ME79d6Ch2nYbkdemSJ8fq
         nuQ3Ovgz0y+jlI9ytaMVdr4qQRU5pIfyKCsS4wTpqrLSBuLfglsjO/sVIEcQZ+rrkZSD
         IJUXq1gBMV6HGbp6CjAhOk+SuhKXTSNeCQl+3JRglJdCW1CfDNWlfePP/DvNneksLjyw
         zQwwbJd3fxc/XETjEizKMuvb42BdTI2rwmoFZm2MszQuWM0RYdtDPWwUuml2d+Q2Fc9m
         DH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        fh=9gO29NaKCILrguf4f5eGFUeuok7lKPQO+s3h3RSASzw=;
        b=AMp9z/5HSlbaytQ84fF8VyPjQ+DsOuqzQ2QQqkNsSVL5v+4ZAYnz51KtI9WQOyrTKD
         n7GsTAsnPKUkA4hHSWMwJEoPd8op47dRnosL92Tk2YDwkf45ZUx74BDYpMnhHXBYV32s
         1fbVcrjpRq0ziEByNLgXK7IfM1VkHfeT/OjnshlJZ8HbN57Z9uoxHrG6dV9zi6NvEmxx
         xAN4Jgu9nQdPQCE6UuZdakRE8AIwTjhDFkkM5KE4iy1GTvs6VrPYZXCvUIP88YNVtdFS
         Iny2HJsBvQ62yoyFjfBw3WpNfwgeYzXv0sDCh2FX0uFFyq+WW2Yb90h7wqPn9uF76om5
         7mmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596073; x=1792200873; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        b=ofijy4eXnvsOjZ/KsDrgt84cmJkc2+EpxCuvPiJXW5MVP0xaDWb9rgbFOepZoCG6DD
         SgiGHTraZIB/E5WUGhZAt1asrG0qX7AjMe3dn420t8XjKShRSS1EXNJyA/hQeCdW4I0F
         Nx6krJBrVzGfaqKdojbrUftYRW7jy361JvQcODGTDQ1FYlMfz7bqO0MiOG+gjmqP+ZSb
         I1j23wfmMgKs++DWRo0olQVzgxcmX9jYH5/y7zhl39cw1zHC/k3rfiyFWKDo2xOWFSwK
         ejErI4KJDONLwf5YUf1816IJ5q0W8LtjNuKM1UxlMwYhmj6dm1USJycoDFWiwaQR31z5
         3iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596073; x=1792200873;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RBZoIK02FXTZMOejEdU7KRpP3/DfoMjBE76QQq5xDqU=;
        b=B1Nud+/QOu72/Bt6hXfZScheoFXsqejNoeWuarBJ51gOk4h6cv9TlGqSxMQP+AgBgO
         CjpV1hMXE0gOwVh32/U4kpgHGiv0AxJ0u8cxvlBVrRCMbEbH5YVrtcshqkLm69ObCDAj
         NuJj3GZklRrB7BmDpjUoGS4UJ89B5U+EeDTsBG57W9ekmsXWyHib9IBM0gQizWJbQPwt
         NBWPqxkEQslfS/VtC1PdE/vmNe9zzXahvru/g1ii8l8OWo/Zq3YMl+0qc7rRukcwmt7c
         VdctO1JXHUKFU/3bvO2HmdHqZslp8xNqA2cmgCmuPCBfRcRwUlSZrgbz1fbvIC4RfZK5
         y/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKsPKKgELfmhL1ylxmUJE2qwvrWX5ZNfgFNUiNf0cBfU0r/+zqM65F0auNPjyoJTnU62+0ORPRcVQpEVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF4Ff6vHv9y2n/49IhCG8lYhgWzuYTQAVvuEmmnfngj6EBFKeG
	rko0s13n3yGn+V0dQn2W/94t/QKnj034NhFNeToHztlNcNoZGr/AkRuIbVYfcgdzd34Vwy31KxW
	XE4BdaUfK/wcFm9y1baQ52XXLdyv513MWSn6x
X-Gm-Gg: AYBFou1QC/ZAfgP3yGFD2VIE4Wz4DIbL7V9U7xAFaAWD7J0H6CSGyVS6BYF3f1GKCzC
	sX3VV/zOmNzMovYerZK33oevCXh1m66VfgBjqIdyECkb6sJpG0sr9+Axyv1E+LpiRMkla6zQ88D
	ibOMYzyyMnFNM6mKWJdf5kASoSjRnRjTearjsRdnxVyLWiy6KV07Ltzf2V7TRK9RPcNbb4GIy2k
	ztXrBuddaW4M2Wz6aWGlaUhg9bnBGTOjKZNY2W8eReV23zqmNij5gKRHn21xmYCVBxSnHmlzZ49
	Tvh+yi56WUlHYkDuXvEJbktbk3r2SIpAj4IDNqaqoLeTwNh5cCW6gwa5zLfYqhKfyQ41naMFUH5
	T5e35VrDP9IBd9shlGGJhPVADs7Q9197xD9ydz4PEN4q8OVI0pyUDTtlIH/Cj/Y8hFIHeESnby1
	0Z5/YI3A==
X-Received: by 2002:a05:651c:b29:b0:3a9:83f3:ee73 with SMTP id
 38308e7fff4ca-3a9c55c7a69mr8139591fa.19.1791596072901; Fri, 09 Oct 2026
 18:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009212501.971158-1-linmag7@gmail.com> <20261009212501.971158-2-linmag7@gmail.com>
In-Reply-To: <20261009212501.971158-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:34:20 -0400
X-Gm-Features: AclHuK91lXz82mshEmNWJGl1kPK5uU3pgI_eu7NyeDs55T-QedcNXRAggubZysw
Message-ID: <CAEdQ38GQUKnKLiCLpceTrYNviEag57uJhoUXntmrbwYcL6J8nQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:19 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
> Cc: stable@vger.kernel.org
> Reviewed-by: Matt Turner <mattst88@gmail.com>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Message-ID: <20261008195608.965266-3-linmag7@gmail.com>

The Message-ID trailer is the v2 posting's and should be dropped.

The patch is unchanged from v2, so my Reviewed-by stands.
