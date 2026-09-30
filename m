Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3664CE67E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771803; cv=pass; b=EPCTvHUBVhPvOFHVKC6BG3TobE7fqH62B7kPg88YuZ59k/tzCwnVgS3D3iF34d7Y8VEioWZGuWeN9AMKlq346gg/+xm0l0A3Bsu8SDZH/H/IQIuSi8d6IhnJ3BdW1PY3JS+f5DGzhV8VYIiS5EzcsFsEXkRAugVaiB/uE7NWob8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771803; c=relaxed/simple;
	bh=RZzbWSIjgew6wFLJXJB540VLEgS01esjSjMrQti3Bdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxkGKsUeXSjkMAaDWNXM2GrQsENvX5Vuhzms1bvasCYqyMeoPQsMbW6ennLVFcK8YQi4oHu1Gh8BRc6AhSnDg8l4tXlTXM89Q8pvDRLlIXEApitpV+dIf71dZJ1Tki+U75jf0rJGjld4JlWUOFwm38HF+nIFPxIaMTWVNQs++s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFUAWwpx; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFUAWwpx"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso5145913d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771798; cv=none;
        d=google.com; s=arc-20260327;
        b=OeatW3UAPpChD/5xxFZJdWaE7x9Adydut0OuRSpp0TWb42fKHxrN/o7K8f/MjVVSmB
         +vwXEAmesqG0TCD1vV9JVy4cJZLWDhICEy8JFU97tZW9eoCH7spBxvVa7iAPn4MDwOMS
         IK4xJ7t9Zb/QPbBHz5IsyKkYqNCWihaftsMBYCUSMXCZWu87ZB8Cy0O5X4YEA2qx2Gzo
         QdTwtY0xgPPcNyNaYimtn531mKWm9EKi8Y/RrpW+M7nY21czfA61u1q61M1jYcB46oue
         My/YzriXQWFA9TXCbp6dFP0NXSajWpjTIAbR7lmjZw/MP7oyTm1COeZmpFQS4PJYbboq
         Tdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        fh=SG9AbwXlk3w7akKojgL11h1FRJrarSJX+7c3YoZ6pZE=;
        b=AiJrR894crquwfNFbHNxSsz387Cv2xAQzloarXSaobYbKDC+o3Xd5YgUaKQf/10QA+
         7Rb3s1uoDU8+AtSlu/FNVKTMFWnaLqVOGY6QBbBVu0trG48jy4j8xmqDZJMPz2s9Zlew
         Wo7M2XSeyk3M8CfS6FnJlIB/rmsyQKOnWxnB4pOe6TzqoCg+d+CJOWd22n7mvEXXIGTb
         PGF9LVxGeHFvWJgL4B/U9qDvHC1l5v8WYjZTv7iZ/41Er7YGKJxtA92MueqvE/65j2jD
         vZsz2bpyo5EEJCyehCqE4stSx3fD2ddsvEASELnzlm6OvnNCVAZNCRJsRCXc9dvdX/tR
         qAmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771798; x=1791376598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=PFUAWwpxNVvoPpL968Pb8klzGZoDvFMcmc/qjkL3jOCzDfaqtEGBir6MNK67BXFeFD
         QZpUSbUMM4sJD2OV71f602feOvoskCzQDQdVIkfmFuUcQcMOXknakedYngeHUGP1+Yz4
         Ig/+pzR2mFzdQVeW/LfCDQfyMAIzQ5Tqj8kiNiy4qjM9HIaiL8IU1JDq5wZA9Vq2trij
         cS7JjZhUOmfGCKQperMi4noQreYOqEYzGP4GJJe+WlZ8LEhRkuyTp5FIZDQ+nbt/onau
         55yTPK4B9GRMg8hpVgu2FReGBboX+593W/SW+lS0OW6/V39xZ2gfZEdo8ntqNapaSNpt
         TAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771798; x=1791376598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=JrUkEXH3OAMy/JOpLyaPehe5oq9YJGlYLn2YZ782Y0Cn+UXY6YPOBzXsgR7fGEyJzx
         /9M1brZIh3ZP8Q4sAznMab0xeuUYjKbyBUzX1GTHpTl1xQ1TsGBKWGXbEtH1ZEmGcqj/
         28f3fBPKsUVfR6XEzA+aJ5zoxZ50RAxO0W/sIDrC97skLWIryMUIXbB3U9zrsgHO7Hou
         6TxP44zD2jdvhmA5ejktK92Tlpy0JhBh37K+RioJcs+xpzQJKmmL1TH26vBMzJtS1UKy
         jE7lPPAW2cRWoQUsfKq801r8Im3zLTnhp5p2s7MlmKXrZ/F1BNHwxDkLLHBwPASaGKlA
         bHxA==
X-Forwarded-Encrypted: i=1; AKwUvBwAgRMercwEAo1poSN+PCQ2xAFT6Gjo+AkvYs4hQGxZRGLxdgszzVAPE9cANgRlJS2ZOaL1wagCkRDXcko=@vger.kernel.org
X-Gm-Message-State: AFuF++kjBacOjQclQFSgtcI8H+TMdSIQLxKkNkABuoKULzLrghFOixse
	JyLHPuILM8BplqPrOIccDhbpKYf7a32OnZuBMlYDx6mAf9nacw+WRF7fAE27u6tFjqWt0rmr62k
	unEn366V4rjpnK9j8uv8ucTgYFED+n/M=
X-Gm-Gg: AYBFou1cdttRRBW5gyqr8SN001aHMYpC18UMPCyp3QEN4BON5YdBDkIgN76PQIiA7QV
	HXldQgN5sO7FryOawnBDDV+GXcktv2Fwz9TCRVoO5VLuhkV0/uqfcsYyRqZXBLYvAZ+A7fqwvRL
	u1MEv3N7p4pexzjcvsmg1xtrFx+dyOtkvOm0zHLBThdyLNbzsbB6wiMXBAEdVl/NRJ9RQjEepRY
	4lxIuhBgEpT1JSb3w9HKpOY/b+o+i02dmbj1vGeQOKguYoH1B6zWBIkMMLRPUECnKAfhXN7w1uM
	OBjm4k3TzjN6lUH3asklpOcIlBRkNe3mvSIY/9t5mDwKUJTMfemO6pNO4XbFUhwwEw==
X-Received: by 2002:a05:690e:4012:b0:674:139f:2450 with SMTP id
 956f58d0204a3-67683415fd7mr591950d50.29.1790771798163; Wed, 30 Sep 2026
 05:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de> <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
 <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
In-Reply-To: <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 14:36:25 +0200
X-Gm-Features: AclHuK8YPOdQOastRi1a18WPN6tYPPB7dTTORvevLwrAoFcXLuyzCP_Sv7ilYlk
Message-ID: <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:21=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> How does this feedback fit to other known guidance?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
> >
> > I can update more information about the static analyzer (i.e., it is
> > experimental and its reported log) in the patch.
> > I believe this aligns with the known guidance,
>
> Partly.
>
> How many contributors would be involved in the mentioned software researc=
h so far?
>

Currently, I am the only one contributing to the source code of the
analyzer. My co-workers
provide research-oriented discussions but not bug reviews/implementation.
Regarding this, how would it be reflected in the patch?

>
> >                                                but I cannot provide
> > the source code links.
>
> Do you try to follow scientific development methods?
>
> Will publishing requirements grow accordingly?
>

Yes. The source code will be made public once the research work gets publis=
hed.

>
> >>>>> Were any more of your contributions supported by advanced source co=
de analysis tools?
> >>>
> >>> If you meant AI tools, then at this stage, no. For this patch, I have
> >>> used AI tools to help phrase
> >>> the patch better, but I did not use them for code analysis.
> >> Will this information trigger further collateral evolution?
> >
> > The collateral evolution will only affect the experimental analyzer.
> > It does not affect the submitted patch.
> Will opportunities be taken better into account for improved change descr=
iptions?
>

May I kindly ask what opportunities you are referring to? If you meant
that whether
future reports generated potentially with the help of AI tools will
credit AI tools, then
yes.

Sincerely,
Ginger
