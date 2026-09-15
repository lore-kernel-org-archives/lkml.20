Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAC2F83B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455323; cv=pass; b=aAjgeiIDQJaObeL4M3YVFFpGthFBgHywSSsBwmfr5+cdiNO+ZH63bStjs1NA84IBEt6FausCZkiK/EgZmvCxg4AJo9smj0w9bjIYHeE01yKYYL9cwDvs52ZZ0zyp92lBDwgCIY95/LPjfUV97CnXC72N7c/v8cFgL8Awgymc6ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455323; c=relaxed/simple;
	bh=4kkSE1ejTcnRbMKBPQPOKSGJxClRIs71SQcsbDPtpfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5SUPrD0TStzgkENq0uRQqsQOxlulmoaFy9ziO8Qf/+sncorSx2JNPbTQt8iOAL6mhq5ktQS8hYZj6PeNwdv/3ruvlNvfyBliyqDkqmBep9UJvVEl2Rh0R56YEvcjfsJYyWioJyIBnbxEchE6l6aJI0wCNUsR++raVIYdcfMdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgfvTriu; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgfvTriu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2804375a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455321; cv=none;
        d=google.com; s=arc-20260327;
        b=cvey0ug4D4s6ZHCWCDgXtrfUhINKdcoCJAojpkNjd7809TVCWL71FDrTclvH6xyc/X
         wRu6bINnV+9TA7AyiNNbBbW/NCYZUivplr9xJNjpkWsHHCj8moaXDKxD84U9h/fcvm0b
         ro7I5+x1SeTNAkYGtEINKD201ZSgoffab9T65julJDBV6sITtkSL6QUUMrfVp18KIcZS
         654K1fe22YuEXxfwB7dBa22UAZb/jgelmbQL753JPKR0q0Mc/Gr8uFK4Xk1dT0KhB8La
         DscTQJzsIznBGHqSi0K0H/QNE+VWYd4LTQO7B8fTVQqmgXWQXuwpS0FHFQ3N0C6NAclS
         Bsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        fh=kLD5FV8dGK9G8Ek1W+o//t6Mc7MpmZQBvosmEncYHEI=;
        b=eacI3etMpAlVh2ehhX2rppKshQ/9JuhzwDYXa97waD2VXndQc1fIrCwaWM/87N0jjO
         C7jHjLjkEQWoS1IiEvF56W5ILNOSK8yxUcftgjm54RZO7i7kIfBn2NZRaEm0ILxKqW14
         MB1hJNdsBh1FFiNWDNcj+JYHMbT5usQDwJ80hyCl4+3aPq4vhYstQWTd9qrmkOLqssq5
         Yp8GKzBguvie+eicCWXM98cCRZLl0yjlN0TzGlj/mMCZ/ihDEUgzBRgcW0GPoFAsPyHr
         T8D7wdU1OIZeMX6UyuJzZ/d09MZEaYWIm08+RG/EqOwpkRBPYZ9oMlHdTleWgMiaAcUA
         ICkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455321; x=1790060121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=HgfvTriuz9TdpdtX9WUoqEefMDLL0fWafq+eJIjV17xMUdBgmPiT14O8v++jT1MF4d
         Gn2y+9cBOAYW37VJ8ZtWROBnoTNvMT8iaI3OLha4WuQmNMiFmDVlmrt6w1LsZ3K8PmWi
         tJIBEewA3r3QwIcoW3lY5KZeWbr9yZK9V8sMVXgug49klYWTnjH+vgdjkLbMxq3Slxj3
         TLtr7L8GYQBN6MyHeLNTsqzx5JKgZBbhAAaSAWw+d+SJ+/g8B756gX7VqTK1dmJk47EP
         jieG7j+UyS4vrz6MZS5/sr8sVFIJqsCo3T5fcDaIegeTPzBtqExVzIkBg1Xv3+Gt0aSj
         wVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455321; x=1790060121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=TBqNzVMbnA2/XTO6nkd+pjYyNx+Cwkp3Gk5Yz1Srmf1mm+EQWKau73kRjTzQqSziLc
         JX69xXKKILy5FlJ2acJ6baIAlCMmcrBJiWnIPMu1K+EzspDJMPaYDuZbNNGhPi36gB2b
         pSzhs1YRXsI4IezUcKionDfdpmA4mjN84XMget7fI8S0PGmoBhcuSzDW1FNO71LMMojo
         HiMKdiMjpANNa7LsQQj0wi7MPd40iP0ZJIivlYsj5T0qblj10XJu0mTONPzuhzuZlbSH
         g53wqduoiikdnZ8GxMZPm60/SptHB1VmP2lqfvJB1qqSsIBddkuCQSBwQbfZ2N2muPbb
         3ACg==
X-Forwarded-Encrypted: i=1; AKwUvBwC64Q2ejx0YDFwB9FveHMrPT5NJc1XmFCkscuB46XGjfJAD9oowxMxfe+nFoAZMTXzRIfwBZWZ0YLz+bQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mGPM0Tuj/I57PHQDaE+G6DL6GpYvRsfSc54Gq0pTAMnW0EmG2L
	8ODPD1N2RJ2sIBhVixVk3Q5aA2sPmwKj5bQcGH/QWulPX0QakHjcqdAW/AZpkk59J20ViP6OY/r
	fwqC9WkShA59eqychIlnmHrz8y9J2X6I=
X-Gm-Gg: AYBFou2ITCdYj2YFlcj3PE72tD1osb+TXo6Rbxi86cHX6lqCbPggYJGOU7JeWFuywkx
	K4fTe5nSJF+HE66/W2utDqo5PavHLXkCr+rXSNmIdvFhb1LTpwwJNMdMt+SzzJHUD7x85ArShOK
	U2BfGYbfxoSZDhzAjCqT2zsIxzhdMyTIABeVF5zxMviuTahyrjaTMizlYpfvDOGZx643YRloXWJ
	+HW5tMK+ffcnu5e4OJxIFYVvUTDDAK6ubANMGeiLrzUlDMy5kH4249WeDh8d+kPNR7ItQxpA4UI
	CPGqnxHbR22IjfsJ8TfVu+uXiEzZPMJhn63uVPD2b9rrC0lVPUV7HtvlMLsF80QcqNJGsysvf7A
	eDya9tziEmHwEWmU6OKd5MY2+FwOVHMd+l1IbLcNCzQhfQHsVqFZvVYJ6v10ZIAlY67Y=
X-Received: by 2002:a17:90b:564d:b0:39e:53a:c8d4 with SMTP id
 98e67ed59e1d1-39e053ace02mr2555146a91.12.1789455321539; Mon, 14 Sep 2026
 23:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
In-Reply-To: <aqf-pqvBNQ21EQZx@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 13:55:09 +0700
X-Gm-Features: AcwNN1UCqK6sMPrqlCVGrE3bLZ2b-s0RCmlO_dC6IX4VPS5lJPfQdNqJWmpr8_U
Message-ID: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark , Angelo

Thanks both for the review.

>
> > >  Though practically speaking the error
> > > handling ends up being the same as if they couldn't fail since if
> > > something goes wrong it's generally catastrophic stuff like locking the
> > > core up completely so the end result is the same.
>
> > That was also an implicit point (that should've been explicit from me): if anything
> > goes horribly wrong here, it means that it already went horribly wrong "some
> > function calls ago", and the platform likely already locked up as you suggested.
>
> > In any case, I'm not against doing error checking, it's just about not doing it
> > when it's really useless (I'm sure you understand my reasons), and I believe this
> > specific case is one of those.
>
> > That said, should you prefer having error checks in such places... it's not a
> > performance path, so I don't really have strong opinions really.
>
> Yeah, I think it's fine and sensible to skip the error checks in cases
> where we can't really do anything constructive about the error.

As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
It first passes through the regmap core, which has checks independent of
the underlying bus:

https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834

----------------------------------------------
if (map->cache_only)
        return -EBUSY;

if (!regmap_readable(map, reg))
        return -EIO;
----------------------------------------------

So, in my understanding, checking ret here isn't just unnecessary
defensive programming
for an MMIO write, it guards an assumption about PM/cache ordering, namely that
the regmap is already out of cache_only mode by the time this runs.
If that assumption were ever violated by a bug elsewhere (a PM race,
wrong resume ordering,
a register missing from readable_reg, etc.), this is where it would
get caught and reported,
rather than the driver silently assuming the enable succeeded when it didn't.

Best regards,
Phuc
