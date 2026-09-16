Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC913B7759
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522807; cv=pass; b=nTTTbJgjooiW4/bsiv4KqKBTKcnS+mLYfL0wZVoh0gRFWZ0sBWf6InDOm0++iA7ijviWZYeebDRP9MHxVA+yy8Dk5hZj6oJD1Ybn5LCfltG8uYxGg8fdvugYSM3iuJBMDVD7MAMRDpSiqbm2AKAhH7/0kzyfC48h/LDETCZGGyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522807; c=relaxed/simple;
	bh=F7/Be39iQ67QXJSJm73iOaskwF1HV5SnLrr7SsaSjB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibh3qikZrmHl6mfIzDINT889uyKlRkvZkYJF0bp2VgaLxiGyZm01Q/FIu19xPUaDtef3uun0HYnTUI4wTNXXYhoYCrScy0vKDUsAbbLU8UDgueePdNwq6xM0fU6kd64q6A4cBcg3rZ1MzpyPYjMpRgYxbHaOPKIPEAvy+phW1bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H50U/PcY; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H50U/PcY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4495835e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789522793; cv=none;
        d=google.com; s=arc-20260327;
        b=k6ErkevT3GeV1CXe1fhU4rcLi9GFs8K6YeeHBSTbyWxzH+jswjsNm6Mu7342l0jVAq
         nbsmGFKNoA5YUq5SPWGZgup4eBQs49VsWPCDOGNMmSh9YDyJp6JS9emBLtHgr4GeX/LD
         P7LuipIYOVQyhjbOXkx4x2jAxOFahmznXH90oeyBjR62esnXeERZJC7pK4uHrOby5Ogk
         0/5+8x+21pACPf6FaHqhBeBh/m+a9SASoynLVkYDu1rqqiskYRMdpejmdVv1DaGWSb36
         jOWQ52qImBukLWi3SiYftsc1dZWJ4TgYXNWXad7cogEhwXbs06V9xX8MQxpfRun5DD1c
         gb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7/Be39iQ67QXJSJm73iOaskwF1HV5SnLrr7SsaSjB4=;
        fh=sUioJ8qC79Zmv2cFNv7oHDYcnA4oZKkcUClxNgQTflY=;
        b=Ok2kxroPfEHNVBIBiuXo9Baj76t4kgw/G6qot1mcnP4dlo6kk9s6hhKPJR59k2xlE3
         eAwMtHxLujTOGfoQUhMUvNJXVmD9SiHb1pprdN/fmKzEufEt53X2UbM8RrS/iAWc7eM8
         /IAzqHMkwkDASUo68uMAQFLG89oVnzZW3lsiqE87vTgpRjOG/mNZFQjesNr7/f0AOP0T
         ZVBkhhGkJ9HkkTV/O4jbTREcUCKiFh+GbmlW1kZqmTBOuktPb2+3y+qyQ2KCxfhZtJna
         +8CGHThQ50ggFMX1tOv4TA7hiTuSQ4qhMKUuX8FukGvrShdrczPb5ulaV8E5RF7c7lu3
         yPig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789522793; x=1790127593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7/Be39iQ67QXJSJm73iOaskwF1HV5SnLrr7SsaSjB4=;
        b=H50U/PcY54WwhSQCgwHxHzVdExyJHJl0DviJxtLkvGRfxemTxBuFOkfMAMqYdLqg1U
         20fYUXZkJyK6Woq3Xhar5cl19Ejdh3HAr/O4N4U19XRE5H2rSgusSpdTS1Z2zIXJ4Ssl
         dI/mb67wacad8XJr5D8RuWSN2neyvCYw7R4T9in5nBNRbfINifkKcD+vyrlHD7uVglbh
         W6R53ReIZkpDHVhsoI6ZhjafJmGVU47bsSBy5okr10fGMBi49I878V/mkNcrVMBWUIbU
         BDaGR1tjqTJL3qFwTN486/UhrwqbhQWI03/qq15HQIUN4ycCBOUII1R0zyeEsdP9sUSj
         NWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789522793; x=1790127593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7/Be39iQ67QXJSJm73iOaskwF1HV5SnLrr7SsaSjB4=;
        b=Fsrq4LUgS049Fz3O7bRJH6PZQky5mP+AVmcQxqsRJJK2RIrtPB/9LVu4w17nhTp5CE
         /idZ/ORBe5kc6oVfXO/VM3PFwkrrDtcJtmd1PUyAhgLhFDIdlBHrrl4sR9clPsO2zl03
         YGlGutO1TXWn9vXioM8H+eoGdl8qGoPS9cmawd2szoB/jcC2pBKU0URb0dj1CDziF70K
         ciFnAj7IiStsahjHl525Nf4BnNlL5D9vL9cJ+B6IS3Xf8Ga9tpy9CRopEwobpLKQVNA1
         k1K+VwFKRtWIP+sccRCSDi742XVS30YGNXBPbhy1BrNgFeKpMW+NOtLaYrqvF8hnJ2lH
         RXHA==
X-Forwarded-Encrypted: i=1; AKwUvBzBKNnViA1oVzV8xLSalS3KURnlUncrTstx9VZXSeExkgamR/FZQJpQ8ssJJOCEd4f/MUjINImvfP2N6RM=@vger.kernel.org
X-Gm-Message-State: AFuF++lDpu6qt15W+4xosmDn5QFrg1cwzhB41YFs2fHtM91op6UBUGJc
	434GzzT8rlb/7YJ5tEXo4+RYUuUZuc0LFjyhiltVratBIysYC8kCWxx6C3eGxQjTjqrypRj1fU9
	xEr80ZQJWa8A+GjcnUXdmk7VgOTneDJw=
X-Gm-Gg: AYBFou2mgzlYM6pIcyECT+ImfyVWwqZASYqfHjmhDDdLeGpVO2YoDRUnoOs+WzfQoon
	GWt5bTZHW50r2PX5SE41K4qvHAMHGmsASNaFAen14uc/7AbfJyIIs2DGIPaVb0TW7Uiqs3iavTb
	EOR2fhqQW7zf1bvsMIwSspTr5k6O7UfnrTsyKTfC2DEcALtdW6W7GXqcC6y1O9Q/GtPUvivxl61
	FrFwkLxRnTfGEJ4uSOAJHDpywqDsnVOMBnnTZsZgezTpoVr0T6070nIiHxERgqnK6WCcmxIYrjs
	zzB1NOu4Lut9yFQMVSBwNwC5CKmGmaNiesgHwWNpCEjNXT6iHteUQGwCbjdF6Wr0cgEO7ROWpH3
	uXCHY1wd0UNje
X-Received: by 2002:a05:600c:3487:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-49eb7326671mr12886295e9.10.1789522792473; Tue, 15 Sep 2026
 18:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915033050.1579457-1-kunwu.chan@gmail.com> <20260915141428.90098-1-sj@kernel.org>
In-Reply-To: <20260915141428.90098-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 16 Sep 2026 09:39:41 +0800
X-Gm-Features: AcwNN1WkItfrjGuvh4D30_0jXdjk_3N_mQEQU9h1o2CriinlbmIT02nd1bs-e_4
Message-ID: <CAN_Opa8kqT3veKMw2Efir1p4mKH3oQuD5OqyBigjiBMvw7pjnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/8] mm/damon/core: return an error from damos_commit_filter_arg()
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:14=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> Hi Kunwu,
>
> On Tue, 15 Sep 2026 11:30:49 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > On Sun, 13 Sep 2026 10:17:00 -0700 SJ Park <sj@kernel.org> wrote:
> [...]
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Thank you!
>
> >
> > I'll take another look at the remaining patches.
>
> A new version of this series is available at
> https://lore.kernel.org/all/20260914142327.92510-1-sj@kernel.org/
>
> It has no real difference to this version, but it would be better to revi=
ew on
> the latest version in my humble opinion.

Thanks, SJ. I'll review the latest version.

Thanks,
Kunwu

>
>
> Thanks,
> SJ
>
> [...]
