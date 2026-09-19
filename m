Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E8314B8C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778835; cv=pass; b=ksjKCakzvB981GqGwcfF9p70wYx/5+0vBrBIJfO8c+goUUd2Iot5Clg493KxH88CtbUxmjRE6cU5tdo9Tnw3hVQ+TLtRPGbxjF2TeEL9UJ2omniVrBFyhAx5kVaufrTeDQq8zb0NKskpnQGH6JrqzJCE7vdme9xlFkpqxlWB9uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778835; c=relaxed/simple;
	bh=ULS1O9H2vl1xXhjc8PA6+XCr3+Fn6BHRdst9HWjSmQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTsgxR2M/HDZi3rW9zjqa28mbE9bAiyfICzXB7YjWOCHd8pA/ki7Zu5oaVHQ8uF49tRXIzb8UBzDk1c66d9A+nacKX5LB/z36V0YS77yN5vKqyhNuiPVazIqLQExgqG1OA4s3S7w6piMo46/Pm1JUzXP39yI41INdc/Hm6kjMkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kpn0g1O9; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kpn0g1O9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so885330e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789778824; cv=none;
        d=google.com; s=arc-20260327;
        b=CE9GcmJL7dNxcFuXguhVFsi12avuxdIh9V0FKx4ezKZ410tevB3U52z+/Q7atuMEGy
         geuo1H2pwSodBhoyCOicjZJT4BPtQc/fvEd0nJqNwPlKb/j7ZaeaQ4Cwde5IS3Ty01+7
         Mu9PjFJlIOXMbtNr4r5uqeXuBouhBc7TOhHjqjn6tKOV9dH4OjHHgu1W2FMfGD40RAtv
         21jYJ58DUjZUrXJwohWfHWkq7lri/kI7hICDPX2e50bXV9abdWC/Uwzl/BJvxUoC/cg7
         XuW33NMZ1noCgNu4r5Eisj+ETLSwXXsL3j6w/PT5EWpGJFUZ4YdRb355ZZOqY02zE/Y2
         VOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ULS1O9H2vl1xXhjc8PA6+XCr3+Fn6BHRdst9HWjSmQs=;
        fh=dwIr+O6ZRIdKpUDVQlPCKLR5kHFR/63dOC8WUeEGKN0=;
        b=NT3ySY0U7WKUPCvLTVeNFYc/+vQJVVlX8X4RVybZk3bThNco2axRImzbCK9jeK69bO
         KmpR51LQDDrE9261dR+O1tC/Kx928NORPFKFA0NpTA67I/nzS1vb0BC/iRGdHVidzGck
         gl7MCghzLFnehwm0shSaRmpnA+x9ic7FOBOJuk3oLRGAUl3F6ogkQ4IXAYjM8FGGBkwj
         4sRm6LyD8bYZkgfBVJxQnW2EXndrS2Jn+9qIXOcad8RaT5iKjDC0zoaI7F+6jYZBe39y
         yebuikjIAYI0eQLH8BEOddruf8hMMMdZ9Uf8RWaSLS8mma36RBmPFq6fkqNpAF1kTfwN
         eF8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778824; x=1790383624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULS1O9H2vl1xXhjc8PA6+XCr3+Fn6BHRdst9HWjSmQs=;
        b=Kpn0g1O9/UWfCTZBkJUmCb365BAxASdEW72zhbBFwtvvJ/oydoACBLO0Dt6FNC0S0c
         4O1FhJIO66yaoCNjPx1lwDg2bmK6nMX1BAs8HjlTSsuGdUu9cxke5NogT72PLBUVENK4
         ts4bMqbRZLbYWA1WS0bv/oFvzAPtBAmWhAe9mEE2f7Qd8DvnkLfNEfeCsV6Z9TuZ48B0
         8ZRBMcU2B8YHtb59Qq8qzG9AewLT2kdCw+3Ck9XOlpIPRU6M2xihUnHQher5pnSosdzZ
         bZ9ahl1YjKSgRRO0bvRbZ+JPW3zXWZjAJPcHh9z5Jr0UpiIV1agd4K0f+QCdLMo/+FzE
         zXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778824; x=1790383624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULS1O9H2vl1xXhjc8PA6+XCr3+Fn6BHRdst9HWjSmQs=;
        b=tb5rUhBaYkgEgScPKhJf2nPYVJc4yRAyOniQ+0SRbBEElsIDbcRgASQDH4AsSouJH2
         nC/zpuZAGPGCTvu9+50obr9T59hKl0d86/99SP1vFum3FppR+GiyvoSVXETepKCBBgWB
         sKlAwE/R7nnIWOkfLVQi5DnhNg/EZVVOk+MTA6unZj3LQfKFmBi9lJ0kSi99ojOHtDhM
         l3bi3HVoSy1rGNye8sbOIi3fh134l8+dtVJcgvqae/+UoiUL+5vrzsouG85DwDwO7VOQ
         0SdrSHpCP1Iuta6rcw8KZ0m4e56xZv5mwyWUHqIFrEDMWHXIIjTmcgrMN6gvAKPc3bJX
         mm/g==
X-Forwarded-Encrypted: i=1; AKwUvBxmNLfBnvUIu0hFV88lsYgl1205ym2nVrb8cpLSCZPz6ghzDZc8iFOfZp2K4qcT/nItwDN/2N3+YxyS9ng=@vger.kernel.org
X-Gm-Message-State: AFuF++kSfk9W/kUOkhX14Ldt3+dSFskD/Kuivp+GmyPnaEaZFvoc46SI
	ci7hbyKMBs7fO1od7iTa9+F2sy+rnN4u6A8H5XnPGUQL5rOtYvAAhClXgkm0EUy+vEZA5+8MVae
	pxVBXAe3I8c0bqQCii45F0j3uPda2EN8=
X-Gm-Gg: AYBFou3NVWzKSM9RvxP1ck4VF4EwBYd0xL6TXLCqF9MQMiFLnnY40GosFmv91xXsSEi
	pswsry9559HKWg4Cm8F4pVEJMaCiQtVzO3+2VHXHZWSIEEt6CSQ9yiti4wEZdqrnvNHxGYLrgGn
	1dWppKxol2W+WKBURy3nlKO1EyMqPPZJb3fnqfq45Fz08VCYr7wyMr+SJ6m3aMBI/ZXyJMs+4MV
	/2/tpXL0ijUw4cI7TEU6FuBzqvcd3GqgD84wz6zazJAI/i1rp7PyQXtqG6V9PHn49TS/JYclfOM
	VtMwiAooex4EXkeTPiyPjkagwRW+HaK+Dy18Krb0deTDAdR/UFqcGxdI
X-Received: by 2002:a05:6512:219:b0:5b5:e2c0:510b with SMTP id
 2adb3069b0e04-5b8ba5d1c46mr1750846e87.4.1789778823638; Fri, 18 Sep 2026
 17:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915111351.2726334-1-qwe.aldo@gmail.com> <CAKFNMo=0hDANOd+DxxvKA=RNbiG-zygkWh6EUC6Vr2MYe4npLQ@mail.gmail.com>
 <e197037b70377be78b296380bcb31b8c3e8f8d74.camel@dubeyko.com>
In-Reply-To: <e197037b70377be78b296380bcb31b8c3e8f8d74.camel@dubeyko.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sat, 19 Sep 2026 09:46:47 +0900
X-Gm-Features: AcwNN1XvQ7oA7wJs8qNTVXqjcIufwo1diKErI4eQMLUq2UxbIuNp6roz-nIE5Rg
Message-ID: <CAKFNMo=0-rxN0BKG1v+KhrGwnh2ZL_Hn2Jbcqc9sWRV8cwxPrQ@mail.gmail.com>
Subject: Re: [PATCH] nilfs2: validate file block counts during recovery
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 4:33=E2=80=AFAM Viacheslav Dubeyko wrote:
>
> On Sat, 2026-09-19 at 00:44 +0900, Ryusuke Konishi wrote:
> > Also, please replace the 'Cc: stable' tag with the following tag, as
> > with the previous patch:
> >
> > Cc: stable+noautosel@kernel.org # Non-fatal bug fix; defer backport
> > until a real issue is reported
>
> Damn! I missed this request. I already pushed the commit. Are you OK
> with that? :)

Viacheslav,

Since we haven't hit the merge window yet, and linux-next (the
destination where your for-next branch is integrated) is a daily
integration tree intended to be rebased before being pulled into
Linus's tree, updating the commit message on your branch now should be
completely fine.

As documented in Documentation/maintainer/rebasing-and-merging.rst:
"Some trees (linux-next being a significant example) are frequently
rebased by their nature..."

I think it would be better to fix the tag and overwrite-push it now
rather than leaving it as is, though of course it will need to be
frozen once we hit the merge window (or after the official release).

Thanks,
Ryusuke Konishi
