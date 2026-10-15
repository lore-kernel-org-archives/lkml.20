Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC94BD7BE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062291; cv=none; b=E8cDGZDb52LLtM8XdvJ85+r187PZNsKOyiX27bCtZ6Oy5/quA8JAqcWY85AaQF7dYjlUqKtfkX9ViBOwJJ9fvPGdDntuI39ohttpmMShHxgD9nzlvWKD3sFnggN9R05L86aE7MVkrQU1SkN+o/y7EuPcTbYrbGDoi51DWHZPAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062291; c=relaxed/simple;
	bh=NmmZIT/hqLMK7Z70iQPd80UtpD+b1u7UZ75zdFcA3wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLdcQ+QPyahcsP4u5PoZSC3d6po692+hVUgZk1OOU5liIJxDQ2kI6ow0Sa1fExU1bl7PLtmyPH7KL+x1Kx5mI5TLUZX3XJWvCCxWtf7V3dQaj2hZUxlWKlDRZKbBb8c+dxyK5dulDQ1295ybBzhloSlOgkbqZGB+i45benX6hfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhvRgxeT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhvRgxeT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3075364f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062288; x=1792667088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXDNqJcNZaQ8TKXGSWpU6zqwH8ZsCn0r4wit+9iMrhw=;
        b=XhvRgxeTRGttmbp16XDcVRLY29FYg17djlfFbbkKuf0QPZGa2v4HgHS65pzKT0ixeS
         at3G+Va9QcXRKQWYHItli4mHaDodiQjr2ojubvcR4iv5ID5mcVwBmmsexWBBw2C2/0Rl
         QYXhvjRe7ODvYCjcUo8IUrHA+gjS7Ld4hq+rjKvJK5LULzOQf21nEWJUBSe4h/56ehj9
         bPRaWlkVOfWx7JUn32r/4coX0U6lotW+LC1+0R+D5XsbMuRA2j5Zte/rs67hxXblzYdt
         QB/N5gWCiimxCh0wRBDdt+BRYBqD9q2CJVRUPWBo9h6RHlK2qxO0cKMP0Am0vgYsAQct
         fFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062288; x=1792667088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXDNqJcNZaQ8TKXGSWpU6zqwH8ZsCn0r4wit+9iMrhw=;
        b=hPQ2op8uAcCLgOVj69grIeOXB9JgOSJv/99LXV5wwKDWSca1+3BNYWSnqevk3gfhZF
         6c/Ronnuevdh9z7710QXGj5BiYqrXd9yPoBAOhl5xrDVVEhf87SDCeZUjd3VKLFstYYJ
         gM0Vu/XI19GCBoElrjRSjF+DbnwM0/rIJTS+6gQIf6Ba6hA3ZZjgR198DE+1Jzgt4r8a
         Tn9tccRSODF4bu0HqeL2BslXJppRhCqjV7Jnm1xFVblJzdmDDTotecirTq9MFIPppRbW
         GUmFU+Di6IRHhQ0WxYGwRwBnE799IHeqtuFbyU1ZQWy5lwfbaBZ8qEHR18VQiXljxqDP
         RqeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/akxaXr5oQKvh06H6IsmsCgpYAGuFsL1VZjW3L6y5W9bD2FNGGdzLvkFlhxAEfceAZIyqiLu5Q6eEUDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS3yISpE9cIkpwVRBPyVvteIkiXFdk9++fRmQjUjPq0QNcPOg8
	xgfLVpgpJ/EQpomPLd3gyEXMc4a/czHGz71M+LJ1T/34hyDAnnM6hzMm
X-Gm-Gg: AYBFou2m03YfxnOAK8XkuZR7ywqiVOIaFVclTWtgDt7hsWmeF1sgH36mi9tQYa7bKUD
	w/IazwQ8o8lnxi8Oorf7n8MB98ONqDw004koBISVBCIC7wxXgb3UwyQ1NCQ2mgx4+mnNCGVJMeV
	//1hjx4Jsghy3t61baaNoGzy55twKW/qApkd09y3nLThgE2i6P1SneGyERFdOJmZQjXHtyux6xb
	OPsHu07QR/O1sbKDSPwP34aHuUHERx1QgwEPgktS+P+if/vOnGriT77sJCxygos8A7ABzlUeX1W
	DUmwyddWG3Zrm8uBgmp394MGwRpEsQ9TjwyHJWtSqbegXYDcplhnsNWkgZA7n6t8dfhk0bzDVf6
	IojWHf2LTuZ0sYJEKKqW3Rq8eX7FWOhb+eSOsFBoc4VFX32eH/VnwvfgHPGM/ONiGNZatLL1cyA
	/fV9uRYoaD0Ej0O3OdqZQLDrGSNrHJ/FX1NbC0uwsdVRNswSCagCCo3MAJqSwl+wsottTBDj6G3
	36k7pvhd9vzGhPpo99Z1RY5HnWJ6ivxrzJxHk/ZZwaclA==
X-Received: by 2002:a05:600c:548c:b0:4a1:a7f8:c11f with SMTP id 5b1f17b1804b1-4a1a7f8c1cfmr177900845e9.9.1792062287875;
        Thu, 15 Oct 2026 04:04:47 -0700 (PDT)
Received: from f (cst-prg-86-123.cust.vodafone.cz. [46.135.86.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm57956945e9.6.2026.10.15.04.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:04:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:04:33 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Li Qiang <liqiang01@kylinos.cn>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pipe: bound new-page copies by remaining iterator bytes
Message-ID: <cm7xsdvj6ij3k2ad6jp46eojgazlr4prejrqywezo7p73kzagm@myk7rx2cuae7>
References: <20261015085326.340074-1-liqiang01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015085326.340074-1-liqiang01@kylinos.cn>

On Thu, Oct 15, 2026 at 04:53:26PM +0800, Li Qiang wrote:
> anon_pipe_write() requests PAGE_SIZE bytes even when fewer bytes
> remain in the source iterator. This causes copy_page_from_iter()
> to perform an unnecessary extra iteration after copying all data.
> 
> Limit the copy size to the remaining iterator bytes to avoid
> this overhead without changing copy semantics.
> 
> UnixBench pipe results on Hygon C86 7490 (Hygon 4):
> 
> | Threads | Before | After | Improvement |
> |---------|--------|-------|-------------|
> | 1       | 835    | 854   | +2.28%      |
> | 256     | 179293 | 182895 | +2.01%     |
> 

If you are looking to improve speed here, the real gains would come from
redoing the loop with scoped_user_write_access_size machinery to avoid
repeat SMAP trips.

But that may be quite a bit of work. The patch as is seems to help so
I'm certainly not protesting it.

> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> ---
>  fs/pipe.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 292425a834dd..da5583f7f37d 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -595,7 +595,9 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *from)
>  				break;
>  			}
>  
> -			copied = copy_page_from_iter(page, 0, PAGE_SIZE, from);
> +			copied = copy_page_from_iter(page, 0,
> +						     min_t(size_t, PAGE_SIZE,
> +							   iov_iter_count(from)), from);
>  			if (unlikely(copied < PAGE_SIZE && iov_iter_count(from))) {
>  				anon_pipe_put_page(pipe, page);
>  				if (!ret)
> 
> base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
> -- 
> 2.43.0
> 
