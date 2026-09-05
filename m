Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CA471256
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788606470; cv=pass; b=tdvgfeZahBCmMaFC95S+q29GIr82S7SgSooY38HCmIx5gezjRZrXTebiG5kzhuMYqFnAXN1/kxP1IxVzm1cv9TRMmRnJ3/k/hLQDXHN2yj6rreDbRKxRsq3vgv4v76cRqlNOi+lICvI5N45MUvSBb8DDZupqeOSBkrVi/Z/6wn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788606470; c=relaxed/simple;
	bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJFX6+jGd6F5hP+GymYhqoGfGZJ3unfu8LbS31nVZD1p7W+O0SElOSRJLAlsTqTaGHGR6FBGPTibUEnuwrfPHfGcT3bovjFTyL99T8tv/8CXvvgtCaA8f8UF+jpIGB3afehP5+xw3HM8TM/yLmPscXJdMo9FZcscDkmHLOs48Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=OU0ufY21; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="OU0ufY21"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48584dc164fso1821222f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788606467; cv=none;
        d=google.com; s=arc-20260327;
        b=EUCEwLJKJQ18jkTH+pgFDzYNAvwisc51X5GOnikaB5xFxneabJzDVtRT7/RIBd2Bjj
         +3E7+d07vf4ZlCUz+5hAFOaoXPB3qF6Vjy60kQN82u6LZh8nFrOTV6BB6p/ufM/ezHSL
         oGDXQmFbGSMh/p/lIMCmvwygs1180svi7Blekv56IwJ2mU2d7lAKWPG/M4e/bKgjqDRz
         fn/MhG0QkDVNLh0gP2jARajbh3teVwvS+Fhfhx21gRfzMs7C5UZ9STMhQr8L5HLeIUI7
         TPu9iw3VGYBUjQIi2oNCiEhKr3hzkDe7ZAWoTeBceluJ5V2R0DZTO/8yxqBeMsqJWNVB
         tuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        fh=EPt3K8qTKcfv/dB7XCe+F+VIMFyZcgueHk9tNvpMZrY=;
        b=CuiHo28f98vjiyIzBXK6PtTe5Gnxpv95nBNklvlqcokPrt4wAALqhtFKC4merWWoz0
         mMO0EMVZs0EuBzOYNHNAM74MLxOdHe90SoAnhmRmDKfIkpn8UnEkhXYQwWggWg9FVsDJ
         iag+cXWh/azURw0var5PyL1jixhar5qf5ibvhYPV3bObW7YN06AvtCY2KxBPkgBuipcf
         DUhuFAFNVn6DCeCNUx0mFwF5U9e55dYyBFnzAkXTAcjhq/hek+W8Pvd16eRfgri7MoQl
         VHMsdfnDMBpSs/koKDx/oZD3FqaFl524Vb6ldbeL+neApMqnWZIj1hzTeMSjc7o1NOeC
         hR0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788606467; x=1789211267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=OU0ufY21A4XH+Wo1K6Anp7GhVyxRzP/KRkAjDEqvOCsZFKdMXwiDPaKfOsmpHXznyO
         e/LPo8zGpdbWpHSytPbXf+7L5b55ccVt9MY/OWJYV989PshBkFhvYvVC8gZplgzT0Oqf
         vyqnPQvtJo1ggu3Mgizfo7IITI9F9lT5o/qLYIhRTkTrhBHr7A03fgyd9Cbq2kxao4PX
         4BfdiTnoQjr0EmgzqZ6Wr1GEx95M2j/P4hzlmdhekj/25T7qrAx7BVKfIuaBLPZT0AOL
         uQToz8hZKGfXnnHxMZxv6WEjItC0XCnOm30xw79vNZ98b7FPWySiaPyCC6wDyv5aoQiX
         MCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788606467; x=1789211267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=f8VYMIQ1gtuJYs4d2WOSRma2rBfBSq3MMbtTb+BwQgTEnk5yMsCV/TX1PnyMz2xMfU
         hv7AArsu9Hu2VBEAOtNR7zINL7yPnf1ic3sFR/hlnVbwjwHWziw7p9bbTh+MrXaTHAP/
         2spLYVWdIaFJ/WeP2Q1KtNHcMJc2iYos64Q8W8sgWxZdBnJ1Vyqnllg8hByPKfc1mXB+
         WusBGLjtQaGwHKQFucCsgM9jGmwOQ+MrMz0sKEyAVa3fui5M206SJAXlmSmDhITpKVeQ
         QuhtLLJSaEK7QD1j/wJD5GYciB7l8oQKOwPqVMU4lBEYXdIUQa5g5disw3quWb+SsIay
         sgVQ==
X-Gm-Message-State: AFuF++lklFc45AHlamkFdkVLsvQQ+BLkzZVMhF4VS/YPhsEWqml1k2dn
	eFMzu7I3iZ3Inr4NmeQiI3jhkcdaMoTzQIk5s3Sp6eBb3sgX5X7lM6/e6TpN40vIPs/YEEwDd0c
	NxyWwUAfKb2nejX9ZqIucqTigaLFbX54JsNypogautG3eIDDXjEuoxdw=
X-Gm-Gg: AYBFou01rRUMO7xw47YCtKuv30uY/6BIi7K4omkbu0FvhlzI2CZJ5Ct9uHrkA9H+B8q
	Ooj4ZBpfOUtdYS2zEZj0GYeTm60xIySkqNiRXbGCSgj7ObFea6ZIeC7gt//5qJxgMHp2lfcr517
	Uw1Emm79ls8pwi3bnREKvrRcS/kpCxI4rWBRHul+GnQETvzb+LuiLk98E6KLicjadjg4MKYLZbC
	D+zMBrZYuGTW9KemhluFEuNbhUVxtF3LbPFCzSKLdMPwpkDdAAoT7ntPZMUlfEU5M48FSqTYZ2z
	7PDH8oMsCAPa9cjW3HxNDzt0GU9TBq/yxJlCAcDPkg2LQbLme1sy+7OgaGRxIXg/c6Ibw3W2AEZ
	q7o6Kxladj7O+l7/y0acIyeMwYsGhWnRxRL77Nzs/8F1V1Ds0AZ0n7Gm9XpVFroWA
X-Received: by 2002:a05:6000:420f:b0:484:f26c:b9f3 with SMTP id
 ffacd0b85a97d-485872ebd4emr13447348f8f.28.1788606466907; Sat, 05 Sep 2026
 04:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <871pb9841j.ffs@fw13>
In-Reply-To: <871pb9841j.ffs@fw13>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 16:37:34 +0530
X-Gm-Features: AcwNN1WQxHO5cqvfPg3ullsdiCu5_mZrtsE7_CGgcOOk53j9-4tDEAMo1ePLZfE
Message-ID: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Subject: Re: Interrupt chip driver maintainence
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Radu Rendec <radu@rendec.net>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> Folks!
>
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.
>
> I've just marked about 20 patches and patch series obsolete due to zero
> feedback from the relevant architecture/SoC people who were on Cc.
>
> And I'm going to do that from now on very consequently. If the
> architecture, SoC experts can't be bothered to look after their stuff,
> then don't expect me to suck all of this crap up and then deal with the
> complaints when it breaks.
>
> I'm still going to pick up obvious and simple bug fixes, but for
> anything which requires deep knowledge on the underlying hardware, I'm
> going to just mark them obsolete when they molded in my inbox unreviewed
> by the people who understand it for six weeks.
>

I think this is a fair ask.

Currently, I am focused on reviewing and testing anything which
touches RISC-V AIA drivers. The SiFive PLIC driver on other hand
seems to have no active reivewers from RISC-V space. Few years
back I did try to actively review SiFive PLIC driver but these days
I don't have bandwidth for that.

Regards,
Anup
