Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537571397
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966331; cv=pass; b=O4b5oEPZ59wRFLWpoLI0blJZ2BKZizRPGjW9M9lLGvhLxCZKdt2iZ/GyjhukI/ZMbbC/jzicSYYUSFmN4hXHJyn5Em9xzT5C76n+5e52DAOqxBQxbSIGhhz6B+lSRh6zpaQwRnGQaOVq9lh887mkpmkHa0Mkiuibjjp8OmFq2XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966331; c=relaxed/simple;
	bh=H3gv+ci9yfAjmDlc2a9UttTAk5lYXYxzxqzvJDY175Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGf7l8YxKDArE/ntOFBGskdntw/Bu3QdcO+Rqrud+KIb8JP/wYZsVqlBb2QUHkOASg8QKJUkVj/ZfF8ZrrnyuN2ZWAQSbCr3h1Qc/0jxWttNy7IT58TK/5SZAteBf9TbLsRdUyiiz22r063U1SV/jGpFwZOsLjBWtnKMAhH/s5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+D6GG2f; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+D6GG2f"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2020421077so235653766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787966329; cv=none;
        d=google.com; s=arc-20260327;
        b=DfmDFEimD+ILGqUMsU1NN3wivlON/PP/XgO//ph/lEdQjJ94sj9BZQW436lVpW3976
         Zegu4sJZFNxoZvWgiI9clho6vYjQA6Q/moGafcwQDm5lsQjPZxBT2AUyZgQq9xRNS1bZ
         ZeIeUJ5IcDZ8PdY3aNDfWH5tFgHh/5v8+engctpN1vb34hoyIfkcYp9pU/pQn1xo6mzU
         eyiNjhwb5caGtgy8uCtN9DsSlprgzdI7DikfQ/mMGrRvl0yvssa9pz3iUPGAyXxNhxwJ
         K526R9QPrggYrtOJmiPAocAmc9849izwi17OxLTtCuHHjdShJ/xuNBaJ3lmSPA/4Is0g
         FxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3aE45yjI08m8/n9wR8Sbg0vb54KLTLrJEoFaJwFWHo8=;
        fh=i0YC41Qkc++Jcwa8LBC+4bwsbBJdIUsPYGMxjvvtjSM=;
        b=PqSzpHwd43oZMzDGwuMC6c8mjHdsSlb1/UKU1yYNrPUa45hmcXsNdF+qtdMax/CN0f
         Dd/AP+ZEMP1s3nrf7duvR4PbwcxJ7wBtwyG6WQ2+4XvI+EKhkMLZJS2Fr/fyKILkDm8A
         MJDRVo5Dn0WkSeCt7ifS+g5IqiQRddRKvSZxj3PM7n7vKg23AN53Oa9GtUF7s1zjymf6
         HTL9Kw3+wm2dNAH9vKG7pGF7exBnIaLGoJscO5yhcsl6OkQ+N2PBak6TEwreZGTACSQA
         ivgTheZp+1v0w/LY0SuKCCrfMM7jvQ+1sdwZsbB0/h4M+1PPxWSlEA08c1K8zjqJ/EA+
         pI9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787966329; x=1788571129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3aE45yjI08m8/n9wR8Sbg0vb54KLTLrJEoFaJwFWHo8=;
        b=k+D6GG2fBo1IwpdhO+1a+jRLx+ItHy58ixEycOw19Bpjjvzq1WgIHHha6lPRD7UTDZ
         iwxfdNyKiWYN0ikDuoO2v5LzJY4dhtpkPKUi0pb00TNouUyySYHgRZbqGAbv9uRCm8CC
         xbh5IIfJ2QKWwVZ4xzs5x3AqndwpWdntakfqy3TjIG03QkNUpVeCR6U46GsBuPD7kis2
         wJeXTwMlCk6OhHMt6T5tq9lkLEwevlh7pJ9NSYbTpJZd0aI3aDvDW+F87gcWWFgAAh7x
         4hCrDbCpYD0EauWYhLJhmJolhDlyI/mCqSUu+xTjDgzTktwkPFhhe4s22tMgKauLS0X0
         F+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787966329; x=1788571129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aE45yjI08m8/n9wR8Sbg0vb54KLTLrJEoFaJwFWHo8=;
        b=nip+HSpd8C6tOx0vHa2TYjPT0Ijelf1h6RG8S+32gU1SZH9p7weqe0pxSxE4OzTeZx
         4J5qerWR/7rUxMfDvGfuhCT+GbxaGgEWmlSJLU7oBQ/jPyXT0nPfhuk4Mz3pTWH4ycCb
         tHVU8s+IxyHzLXzlX2nuMI2XNOjD9kWzxQLVhESNYh84WOI/AlfaUCUtiNtVJ0nn6yIn
         JGnhtuej14hr5Z/rQigdh5X+O6IXePhUj14y61oOcFHAsQvZbMQerlqzkNefyxNBnMzw
         gqe+9eSJFFe3P7N2MhAgke+99OSty9lh+Qp2RA9d13Apd/rGLzzW1b+Q4RA2nsQWH9Cu
         TMdg==
X-Forwarded-Encrypted: i=1; AKwUvBwWV7yrgQD7oFk1+rSXWYoJc3De7YwN3DR1Fld42a57yUk/07/IMuiFDKwqHytTJQ8nHWbpjUK0o6oxfEo=@vger.kernel.org
X-Gm-Message-State: AFuF++nKygp8kiJ8H4AwiYuzUy/h5l23ryLQ4CW7GEHJkVIBBXxBK+2K
	FSkZcJ8hHyeVfNVQUn8YIvn/QSjD7K7zIWIJP1jaE8GdYUrLKZJDrVflbkw8iEkaLlrtXaZJbDY
	Uj05dOxKYW/hKAap6TTg0Mip3VP+cDVQZlBBrWrOS
X-Gm-Gg: AR+sD10xwAuxxHFiZSiIZdxDA4yDhwsbdNkaWqY/NdugwqMKmvtET7WW61BWctghN24
	8hMj3z38tSystkw1gYn9u1W8S8QjGnuSrSfCo6rL0lhIhX/DEivvrrgm8GTUKlFkDROO02O3J08
	6hq9fgAoRBJXxBhCUJRMniAm7CPUSSCPWn6IZsmFPlJv8kiFN8I1MoEG5WNJGsWMUTtvbdeeRPi
	cq/BzCgMSwnIxyLDGd1k6HjCR6KvpubzOvFldg7ThYYKomGNbRJIVcds4W7q5tnWfaobTRmu7TK
	WwbnrEdqF/84RArTk0XcaOkf1JE7Zmb6fIkmJ8OFj1HVD6ZRkCjGkASq6IPP6gKFpQY91oWYkOX
	0FEabfv9NQwI2DhfutlfvUmtAix8YCtkdNEhHtkdux8f+i878ErcBKSaB+YB0Tm2GcsKfDIJt5z
	a1UQgfSVfxvL9LJw==
X-Received: by 2002:a05:6938:a092:10b0:c25:5eeb:4c00 with SMTP id
 a640c23a62f3a-c255eeb5579mr473776566b.7.1787966328124; Fri, 28 Aug 2026
 18:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828222640.1638457-1-jthoughton@google.com>
 <20260828173302.29778f1bf802a1db932778ad@linux-foundation.org> <CADrL8HVzfEXgE9OQfULhe6wh1kMMOALsYuCNOUkgBqtzk_LUVg@mail.gmail.com>
In-Reply-To: <CADrL8HVzfEXgE9OQfULhe6wh1kMMOALsYuCNOUkgBqtzk_LUVg@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 28 Aug 2026 18:18:11 -0700
X-Gm-Features: AcwNN1VQFp5gp0oCn-gKtkB6rZ9iIgxR8OPs2LiIa4f6Frg3IYBz6ouINZI-z8o
Message-ID: <CADrL8HV0nUDjr432S8AdTZ_HO8fACrFSCu8cS49vR4XJQa39zg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/khugepaged: Don't install PMDs in
 uffd-minor-registered VMAs
To: Andrew Morton <akpm@linux-foundation.org>, Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, 
	zokeefe@google.com, hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:09=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> On Fri, Aug 28, 2026 at 5:33=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> > Wondering what Lance tested.  Was he able to reproduce the bug?
>
> I assume he just re-ran my repro, but yeah I'm not sure, heh. Lance,
> what did you test?

Ah, just to be clear, I linked a repro on v1. Here[1] is that repro.
Sorry, slipped my mind to also include it in the notes for this v2.

[1] https://gist.github.com/48ca/d399bf534158e80241fb4937ef1ff664
