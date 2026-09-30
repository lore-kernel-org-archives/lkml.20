Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7E415F29
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752350; cv=none; b=LwRVsWJiHwle0x5CDraokN58eSVhNJ+bzqDtugdTKTjecDTyYmGg8/tlVM0XQx0/L8qpNDfDD9r+m3bvSTkj+e4/Dqjx9z6EPzfc/fWaoSKWI9gygrehAwiIRCyZ7ktt2QTmjjCoklfiZ50IvfM4t7DdpUhnIv2XLX0nVgzUMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752350; c=relaxed/simple;
	bh=8IWokZ72tDwDWq2sw9b629Rjub6j3ctTrOYI2iTwHJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtMW3TQVjOO6oIfb4N1gxLCdY9ih9IQyH+Mjo9dj2x29rS5mG2RwOv3KUG8FseRXUHrIdUQwIbT9w8H+XMqUtMD7dBzhq43Bnv2VVgQzVXsd0aBWzscFWU6vYz+WkH3NhAjrxmpXfC287OTgpAISVKNBrV6Q63WNCaudbKc5aKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso1423259e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752347; x=1791357147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ndpnvvggs5Yyo8MyrvMBjpbgjCxaohPqITqE/XVX+nc=;
        b=GrAZFHoLCMOfYV3eUhccgM+0yek7h78qZWzbJXvF7ZtR0/b3i94K6egEfTl0YILCrb
         q4sg1mUVAvG8TUCVI3172KgOKa3ebvb3K8AcvTdZy+rS7U37QKzlT5Hg6uGdrwdwgbNP
         RvSn1asaCUgPSjMAPI90pEHVzFvK18Y2jrnjMlwrxoYVruz4eMMnkHL9mX32f1C/9Xem
         zzMLNYTprJnJbWwzEPtq3lD2246aVWpPPs0rS7x4SstShe/Vk25U6GlXmb6HrVUHA2Fo
         FYq6+AZ5F+XQL6Q8mjGmbviyYjM1rF3xZWyClo9nXnvp9VtwsZcQ4QPzZ4AczO7ThodL
         /h+w==
X-Forwarded-Encrypted: i=1; AKwUvBxOKPP60Dv3mrugt37D13MdZvp4g6m2HQRXE6UIN9hIbym0yrg+d7TFdQrcIagDVOraKRCy+ND4pkBAzqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDJKjGH+5c6Eeb0aXLXgOeh0FT1e2rSdB8uj07CQB9kO2KPBdE
	pfWz93kDmt7wrwohtzoX2zCbYYcNIMYXAmlA9b/ETptDrmJ+pwKJGj7ilp2KSqP2
X-Gm-Gg: AYBFou08oeyxqv1CmKBt5D+ihzBvvL9ckk3HUdKAIYlmVQ02uE/GUjoaWMnti2Pkw1V
	Q/NnccnnjQbM6kQoq4hFIdHWFVzTR/DMZTVJQF/jh3eqOoUp5Th6rdhRyslwlgoZO7UfMJRjAa4
	WxwGQiXuaXw+khmGzNjQHzdwTSgv3VjaUnop58OLx89qXbRLLI1rXhG9UAL78nbbClwZokl0FLU
	0ieif+TRPPajt1bc99rcURSjwPhsr9yEpnoIRyxPyMPuwPgWfwetl5ezjVfRTHf5N9rPsdJaMuZ
	/GNJNQcGxz7z5R6rTqeuXLWk0fL1WdtQ0oyN5yvSN+N9r2cRD6QMGcXvPx+QLUxOwjBh3E+E16E
	7YQRKxTF9x7vG8oGRPN/p+7bePfN9GS0+k7ogYRmVDSXJSr9IZPsjQaevx6oGFpFEPmz/QpgciO
	x53jLXyiXVfaUDc+pwt+23t7xhThyig9oOofm4DNNlQM8ZZ5muVG6l2y6BreDxUlZ58BHoBwiMk
	ea/V72vCoc4c1yY9+0EMmlNqlr/ymRbeFSo
X-Received: by 2002:a05:6122:3307:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5d67d9463bfmr66651e0c.22.1790752347445;
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d60dfb6b36sm829447e0c.2.2026.09.30.00.12.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7beb81b2834so15425137.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsLk58QFai02Bbq8Q34Zt7VajLUcyphUTIb4PwZVLOekU3UAIoBLkdUcoPNT9lyKFUe0qHIFNiXHAU4fw=@vger.kernel.org
X-Received: by 2002:a05:6102:689a:b0:7a1:f9df:e35a with SMTP id
 ada2fe7eead31-7be73c8805emr49649137.33.1790752346870; Wed, 30 Sep 2026
 00:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arp2hp7wRlcK_4D8@sirena.org.uk> <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
 <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
In-Reply-To: <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
X-Gm-Features: AclHuK_W0Im8-5f3DLK8-gnVMzw5yRpsmUbP03nV_v3dMuQ6NkoOBdVKvbTWp5g
Message-ID: <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Martin K. Petersen" <mkp@kernel.org>, 
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 29 Sept 2026 at 13:07, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 29, 2026 at 10:48:09AM +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:
>
> > >         }
> > >  -      if (tgtdev)
> > >  -              mpi3mr_tgtdev_put(tgtdev);
> > >         kfree(mr_sas_port);
> > >         return NULL;
> > >   }
>
> > Are you sure this is correct?
> > Martin's conflict resolution in 0b5b2fb484f3b kept the
>
> >        if (tgtdev)
> >                mpi3mr_tgtdev_put(tgtdev);
>
> > part.
>
> Dunno.  There was another put came in further up the function.

Right. So Martin's resolution looks incorrect, too, as it calls
mpi3mr_tgtdev_put(tgtdev) twice.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
