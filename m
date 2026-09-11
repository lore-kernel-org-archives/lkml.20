Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA93033E3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098179; cv=none; b=BppmuRA2+MHRLZa4Ll1hhU+d0Os3CaKcELMNfzc1X+kScoG7wOL5zI7AgBBffqYd77Kuf21VUvcaz3jtHVPpd4r7q7MkhgAhSO+2prvbD22/T8Kr7fOtAaPLUlNcS9nJoBVKILpqyZkHHfCKpOuzih3DvzWJtaPSRGFhp6zo3Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098179; c=relaxed/simple;
	bh=ezl60jnsGlY2DjuW5u8Hxt4e27j5KruM4etJ6V9C2uE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fAXicTuvSdNI6z3N1SO6VJws8zHlHlNx8eOMBeGwfcUhPzZqlWoTfQUcQxOCXKVXfxbLsEN4kcUcOq8knQt5PswSGgoewBbhiUrZq5zScte4XZK+r/VLmuoMZc17KUFeewdfvXrbJi2PjIAAAU37RR1buOkdrvaAFfW8TmouLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwQnKggr; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwQnKggr"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so423114a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098178; x=1789702978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cS7AJAyUrXw4OKsQuXto2NRThO/NQ7LZ4I3G8/x/j7Y=;
        b=NwQnKggrZbdvmf8bEqW4QqxsnvrLHhEXABy6/YHz6jTuLwCMrv/zYPJ2V9k8zpYCiG
         y/usF2SCWA0aw+nLN3KUjxF7z12j4a2PNprmYeZqNKQUdwHLrQ7gD8T3XTF/eXlbSZlg
         HFKRT7rjb+JOu8pxqQNCDWCn75ghzEQWOXwOPIIy0h2PThRyIpB5GBEHqGOXfjzsmXLy
         0bZE14y/dSHw0ROWYmCgZAB0J58fOAGAHeQQAEpmxhRwfTPuklYT0vItw91idWy/8mtL
         Nuc2722H715Cb0nFsFZGTzNqw0/8hsVz2XVbo4lZS0sNPyi2i9oWPzzaTNCYDGyc3lz+
         XxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098178; x=1789702978;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cS7AJAyUrXw4OKsQuXto2NRThO/NQ7LZ4I3G8/x/j7Y=;
        b=hs2MsHNELvrK7kgfqZ/aLbNJdXyEGexWbypmjQaZYVjO6Bt81OOd/Qelm8zTe2gwgT
         yH4POUV/EcgmW6gS/crTI6saihif7845fHU4ZyGagkqsZgcycG4wBsis6cb6nwZ7eq4p
         uZDapPJrbuaLF0l0UVP4Jt0Cwy9MlguaGhbfW4POKdS4Lubfk3wdAMpyvxe5zURVL8CJ
         /V5zPA1+x2RgkOIgovEIHa/JVr+7sYy0SsFwlI3cVXy/QO0gwXoE6sLXW23ZW1ib7b6c
         C/fxtJxva5JvNV6o/g5z4ofgnbOKXhi0AkwshtrWlKhI83aak3J9dXm602lSL7mH3T8L
         Fy5w==
X-Forwarded-Encrypted: i=1; AKwUvByEz+P3yjbU6jSo6GRMCJ0ImNEm9Kv7Jr9WaXSKJJvxNVzMioWCH5enfr9Ybug3JUAG2XJKdUMlUmhxLRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqty9kUUFgFgvrsm+p9Tvgnk1DZWc/cTxixEdlZ5cub+msoF+j
	8HLqOhQAvbcTb90GIT/rA8J2VUs3LdXDBg0+e1gzu1ZABY2ajsIhdfma
X-Gm-Gg: AYBFou2VQ/MyAS7IE4awqGHAmUTmofbjLLgXXWsXzp1BsyoU6xI//k1gFBR00Rf+tWz
	kJIG6+ugLJHjVZUoM+7oCiX51L19UX0a3gJv/Ln5yLmAdLq4RtJZriSq+400mhW9p06xRmtyfuo
	k9UIFsdZJqZiNkZZkD8fxJAnG6i1hD1YPQipnGjja2WxK/qS3Een/EFHZCU9DMSZrOAGrQbh6Dp
	tvxn3sb7D/ZzTIJ2u3SUZwFKRxQHbXfgplTHeeOhXCcXAy4BKZolesBv3C5GyNCrTAb4VHcseC8
	bVxlKZQF2bMVd6h/F9lW7eRQaUQdzrVcRTt0jzS8cfEdOgmWheW8UnX2QZBjNyXheEzd9WfKvs1
	6se11ibsQqOO9SedCAJ4BOT7epup2W6USI0kFSs5tQ7TkThbMwZ6cb/BpzPl2uJGLE+Af20AKdI
	m15rAbWhVhxScK97KJXNbjhmmiBh2j3F0KtWDgix87CWzJIMxYNy9D2MaAi0vEjJDpKz26yOjJ0
	lqVhCRV4rtD3GqeatoT3KKNzrFu2w==
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr3366244a91.20.1789098177800;
        Thu, 10 Sep 2026 20:42:57 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d9ebeb1sm408602a91.4.2026.09.10.20.42.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2026 20:42:57 -0700 (PDT)
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Helge Deller <deller@gmx.de>, =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?=
 <miro.kropacek@gmail.com>
References: <20260827093948.2825531-1-lilinmao@kylinos.cn>
 <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
 <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com>
 <a8cb0e4f-a2fd-4478-99d6-fdb043a9d15c@gmx.de>
Cc: Linmao Li <lilinmao@kylinos.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6197fda7-889c-7f26-98ad-e0c56da66efa@gmail.com>
Date: Fri, 11 Sep 2026 15:42:49 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a8cb0e4f-a2fd-4478-99d6-fdb043a9d15c@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Helge,

Am 11.09.2026 um 08:39 schrieb Helge Deller:
>> All good then - do you need my Acked-by for Linmao's patch, Helge?
>
> No, I think your Reviewed-by is sufficient.
>
> But I added a
> Tested-by: Miro Kropáček <miro.kropacek@gmail.com>
> tag, if that's Ok for you, Miro?
> It's always good to know if a patch has been tested.
>
> With that, I just added the patch to the fbdev git tree.

All good then, much appreciated!

Cheers,

	Michael

>
> Thanks!
> Helge
