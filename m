Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691345D91C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460608; cv=pass; b=nx8EhohZguDkf5XxfOxmOLRm56vaFUuswiEdXSnDxpkTyb0DI4AZ9rGpeqtNn+8QX9ymnetreeoRwXf+B+D8PDBOATDegtN7tLjL2Lkrnp8Y4xKZz2ryLb/ntEUqxaJxRWB6m3O0rpGH43nCntBxs5LJshXJBeDk3/33uupeXig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460608; c=relaxed/simple;
	bh=zrSbisXnRqG6tuaqy924oPWL1X1bSlGGV0YFTsGVVTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mx0BcqSTSmoloCI3fFswACZivOql0CUwvDd1kVr+Gw5MYBw8ZOeVdklzhykdbAoN3pJogLQ0XmryGXR2Ugvt5cqjBlDpeAahmyWxWk8n7RlHRTIjnmgdcpvGn6O8xtYtNikvy/9o3AErx2jd90Erem/AvtP+liipn6u4O/7oty4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNiOCsP6; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNiOCsP6"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso2715551b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460606; cv=none;
        d=google.com; s=arc-20260327;
        b=JZ2P1zodUoC9CrCubcMrESANXdSrXOa2wtYhdgOHXTu9Q6zjCjHwE2eSyNnEccAfy+
         geL5vK3bYvbqORF9Uh9nepmhq6zejmL4c8X0QndgGM3k8u1H6xbTT4iYHfNqaAdbaF9+
         EbmxcKS7JM87ZWe+rr+LuJoAnvkTb/u6ZAcTZOfuoXjl4sM+4xq6AeugQt5tdUv5Zsyj
         ud/MdAbcPegq08yi9a0LmYmv3m8dM6VLRZIaiFaG815BnFdWOj9kQ4bSXlZ8IUFVuJKf
         F8uhAG95W507+GmPX/WnUOmCuHNStnOs8DpikZTxdXUCE432iQ9YX3Rj9NgZ9RD5T6/+
         j8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        fh=S+u70cKr5iJaphZTOdGoYPM9ygJx4ZzcqAWIW211WrM=;
        b=C4Jhlka1GnDk9pMW2ZbKnf+oSe5eMLqg2lujT7Ps8P9wcSoKlQKi9sxe4if++7DI8v
         VTqsZqEVFad/YbV8nvLrW2MEYxzhRyM5B0hE4w0RqEzvTI30yf0v38k1WaP601C9BoLD
         2dgAJDLb4e4nO76tfAK+brk6ijxzgggQF5uXk6nPa7lqUm6ZsU6cv5ok9lWdKhvbKyRX
         rbIGlWrN+gEOFTGPHmBaVSefKgAZwHEsZgJT8aGO5aM6yfUKoYV2TcBohMBBFI1KQlZm
         ta9ScwwbnzWqVCHdO1uovE3d5alCAk1EhdTpsXplMjUbRvJHXxJAc//Z1hD9/NdGDRG2
         DMPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460606; x=1790065406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=XNiOCsP6Gdi1amzLUOjgViWvXP7BpRIlXCrMbjh2QXLP3axR+M5LSLNJjbVoI1WzN2
         mGf5TInJeaSHuEzKMhRfEyXcSnKbHa2HzhkhS97eWUGhqgZD2aI9eh/hpr6x1utG3vzH
         xWY6G9R2Ti2l544wvospp5ZHLPIEJevNz+/0gWWcDcEBNUyZgiDW+9EGMmPcpLR1AoH8
         nMhB0EhjvS3mF/on8GoxI0gyJNRBzEu+1wNvfeWbYaQNZG5gyFzLzvE22NBtT3J6lFhp
         Eyauatg0oSnt4dEtmt42IQAbJfUINmPvAaQ7bQpu8TlKWLV1rfIMQob5pG2SEWNrSN46
         j0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460606; x=1790065406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=bF1NSl6BxSPmrYf9VJKib4KXf/bUU2cblYfgSiOismRoPqGUUVAhP/yJe2zrmOJ8Gn
         Ir+zVTgVKDS24pLOLicY8YgRG8eYhn8h2edBkgIGLlsghxJYBkl0+hnL1ZuWC1sUNKMS
         4vnjLf+MYf8Yl56yMbsRUiZM8upcAC34RUPvGVEkCWjUPcSRNtqqnjRLRe/3ePVERAoJ
         zo0T6aFnZ7CwLWy2it+ameWoJ5fJaDaOycN2/Bl2yMrslaz6FelHRJ23xw7/P7P+ERrh
         7LPA5ZsiJvArkae8WhKbpfptnRD7DJ8hLpqz9L88Wx9RDX8QuNC9KPJs9SYTE4o5DdXG
         /hgw==
X-Forwarded-Encrypted: i=1; AKwUvBwmsUDf8HLmfwl04WFLZPqTd5xlzwXrw3T2lix1iD29hBdDnOawBmpCCvihyn5oUGaKGKiHwQC9DvexGgE=@vger.kernel.org
X-Gm-Message-State: AFuF++nmTYD1XkUNmvxjacG/DYD+5Qt4O0GOUFNkhtuQbLpaPzpLzDmV
	jD6MzbjcPIWPhbG8ER4A78if9ktt3yxWnwT3AALGNzuHbaSQS8geezIwXG9T9pvs0udE9o3uZrr
	KtKGe41x3OGQtAnVzXc1pLbCbty2+K6w=
X-Gm-Gg: AYBFou3iJvfNT7Zru43e1v9qZGi/qlm5SI2GlX25GV5vtIUgkaklBz9Gf6e53stKwDJ
	dFVrDGhabn8Ajq9/cJPkq1BuGc26YUwFtmVDeaB+qQEtj7MYvJJaRQGQ60J9A9+qlNe6Kw7Dza1
	6+GZDe+pYm/+WQcFzrgD4CT3H3kQQI+JTFX6YnAuraCIgipcvGIl71EhbhDQ6fNCkPNZH35iz3K
	LgrtJG8EQWV7PwnIYXQu9Y2cDY7lmXkMfwdFvFMqVV0ji2c1ay8cOik14OzG7AmVW6WiN64rhv7
	6Pt87MuTpSYMXJtI4KBZv6lUfFB4kn4vkbzPpVvF5vG99eMDp3H2T4PF1lQelBzitLczKxT8ynx
	5tEvhHwSHdcIFiCAWFINODUr4PFKEHhdI2MepFIET+O0GxkgCPNo8RwUPA01WSapam64=
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id
 d2e1a72fcca58-86f82e5bc49mr11440122b3a.3.1789460606294; Tue, 15 Sep 2026
 01:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
In-Reply-To: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 15:23:14 +0700
X-Gm-Features: AcwNN1VJxWS0kfmgYMTWj5HmLKEavOhSqOjDUWyYXdNn-q4rjwexIxFPMbacpHc
Message-ID: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,


> >
> > In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> > correctly checked for error as in, if any, probe will fail.
> >
> > So... during suspend or resume or anywhere else in this driver really, the regmap
> > pointer can't be NULL.
> > The right thing to do here would be to just remove the useless check.
> >
> > Mind you, this comment applies to some other commits in this series as well.
> >

I found something interesting:

in mt8189_afe_pcm_dev_probe()

-------------------------------------
afe->runtime_resume = mt8189_afe_runtime_resume;
afe->runtime_suspend = mt8189_afe_runtime_suspend;

ret = devm_pm_runtime_enable(dev);
if (ret)
return ret;

/*
* Audio device is part of genpd. Registering it as a syscore device
* ensure the proper power-on sequence of the AFE device.
*/
dev_pm_syscore_device(dev, true);

/* enable clock for regcache get default value from hw */
ret = pm_runtime_resume_and_get(dev);
if (ret)
return dev_err_probe(dev, ret, "failed to resume device\n");

afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
   &mt8189_afe_regmap_config);
if (IS_ERR(afe->regmap)) {
ret = PTR_ERR(afe->regmap);
goto err_pm_put;
}
-----------------------------------------------

Here, it looks like mt8189_afe_runtime_resume() gets called
before devm_regmap_init_mmio().

So if we remove this part:
---------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
    }
-----------------------
from mt8189_afe_runtime_resume(), that could actually trigger the bug
we were just discussing.

Best regards,
Phuc
