Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D14A6CC0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484117; cv=none; b=b1OP3mdrOt4PY415M7KZQBXfupGh1m4CVL+b0QnWwxmL/iao64gKI4L31vcCACraVj6p+mQx+guXOFF8JT+iT/cGqK14t2vqRJKDtgY3cMX6nr4ESVXvl2oZ19EE6GVJocerPdQ4nGZOa4P7yBo5FK88hEDtdgB22X8YMm+PX3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484117; c=relaxed/simple;
	bh=jzGIp/iEDHM8UF9ReTwzvy3AmC89cJO19GxIcAiCFog=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWUHSJArMVP4qgr3l8ED0qaYwwJURejm9HXztAyv7JB+iohPYBHrT1/hfmjUmRXWL7ULrOmPiY1/FRLI4+JOIkftwy8/eLWYTPphleiaW2R08wF5SWufeJ5jvofY8JOBxcDfVtxSHjQ2Jl5XwexUr1fXhsDLWPh81d6m68zKovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+Njct6d; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+Njct6d"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so73164366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484104; x=1790088904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUhDI+dzHo2x9QlE6sWGtPeMOZNYE2a9quEmjR2fQ2o=;
        b=P+Njct6dgw/qM+dkOuFwKsxVO68QV8I+r453aPskyvtFJIGn8MqKm34dqbP7Lmb9+D
         XLXcJAqkJQydxbzAC9gcHjzJ7LXwMx0OHxcmrkk8hFgwPQ4IPGl0/lfHi0Q+ptitv8It
         8lySSH4s+1Mq5mo/Bn4wHUKBKg6XbA6Jnvwy55UE+bAZoc2+P6/QrmY0dxmvgH+wKSoH
         RDswxO91YfcDGzkydtDXLRNLglMSEgEOai7jryLuc2HW6AvA5pSROj/XYVxvsWBK/wQX
         zFogEJznjDGOlSWITNj3SA36bNOsA/VG/KWKcPfLjV0ajQHpKR1PRlAqWUoFhYc6krBi
         RQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484104; x=1790088904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUhDI+dzHo2x9QlE6sWGtPeMOZNYE2a9quEmjR2fQ2o=;
        b=xclXGDUaoowjT88fAYEg/BF8by7D27+lOR56W2n4FOCLj2HUxjm6cn6ay5qOiccuma
         vOKyRd3vnPvFsEiW1vR87IDA6axspcjHN0u+zwu9dsXd2/HART7njjch3KYKcJPX/FIg
         EKVIikvVwDOLpoprsMJgqKLY4PEKP3ogRdaoTH5ldPZd2fwzSxelAbBabpo7Sp5Qy0rr
         1/eto97yGOEkgzvp1IItZRe9TAYacQ4woYkA8lf6GPLKZXBveRvBAxhEO7fpeGDli2Ep
         mydAUE400NfFnRdGjwySlqa9ts5hOnmYH6Guj0sgy/fba84DZ7L1gM/2lXJPqKunDeay
         rFig==
X-Forwarded-Encrypted: i=1; AKwUvBwpah0FAfuDTbkqA+ldLIvb8TcJiGT2vgUSFJtiscwUlkWxjkKbjHeRczsSoASCrUb93rDckW/SRaetb0w=@vger.kernel.org
X-Gm-Message-State: AFuF++lItR4lE+vTyKhzF7lrM3A/x86GWyAAaGM9TR4WwwoIb2jRe+Dl
	jgNeRDIviHe0/hPc4BeG+4d4n3GM1T1vyQhKbe1SMmv97ZZC1KZssben
X-Gm-Gg: AYBFou2prhCoNQP9hbmh6iibpZDRgFcrH+OHgr/fuFsK/sHeHQ5glFgt17m6WzUPrD7
	JjlEWJ5G0m2Kb7jaspllyuZ/hGfgodW9lUZwSZ7TcZNZKJVYufjyuaJizuezkYl9uoiDmU8oovk
	sHbP8cZ+8hkPB7xZNNHk199DPBiyg4wAOYw1yhKuS6sejzwI031z1PScYlfvJfLmX/OONsaRZqi
	CIe0vGwoke7UOGFqNEER33ZNhPd6qJMi8d2RSSdIPVaCnESl9IGHZu38vs6hGEhTkVBiZnV+aEi
	Fag7UtcQTjQmmD9v2V772JB2tdrH2QJ43Vmwe6RTzSR394f9yVR3DmDdJeybsq5JLciHg2lDFFD
	pnuFDMMNmFfxbkuohBCXM0bXd5CkKGNVU38ghOgqSzsJphSyQcGC0EUyRo46so+SO20omNddkAt
	XPXjHfUjE8cbY8W/vETJr+GCfMyparWGK538B5
X-Received: by 2002:a17:907:1c12:b0:c26:19de:9adb with SMTP id a640c23a62f3a-c29d78edda1mr121688666b.26.1789484104486;
        Tue, 15 Sep 2026 07:55:04 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm606861766b.12.2026.09.15.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:55:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 15 Sep 2026 16:55:02 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Ye Liu <ye.liu@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
Message-ID: <aqlcRjH9JStZ_eJD@milan>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
 <aqgqjRJ8qpYmx04v@milan>
 <20260914213824.2b5d9af8a5be89fe09e1629b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914213824.2b5d9af8a5be89fe09e1629b@linux-foundation.org>

On Mon, Sep 14, 2026 at 09:38:24PM -0700, Andrew Morton wrote:
> On Mon, 14 Sep 2026 19:10:37 +0200 Uladzislau Rezki <urezki@gmail.com> wrote:
> 
> > On Mon, Sep 14, 2026 at 11:34:02AM +0800, Ye Liu wrote:
> > > From: Ye Liu <liuye@kylinos.cn>
> > > 
> > > Extract the busy vmap area iteration into show_busy_info, mirroring
> > > the existing show_purge_info pattern.
> > > 
> > > Signed-off-by: Ye Liu <liuye@kylinos.cn>
> > > ---
> > >  mm/vmalloc.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 797933ba9451..7638845377f5 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
> > >  	}
> > >  }
> > >  
> > > -static int vmalloc_info_show(struct seq_file *m, void *p)
> > > +static void show_busy_info(struct seq_file *m)
> > >  {
> > >  	struct vmap_node *vn;
> > >  	struct vmap_area *va;
> > >  	struct vm_struct *v;
> > > -	unsigned int *counters;
> > > +	unsigned int *counters = NULL;
> > >
> > Is setting counters setting to NULL odd here?
> 
> static void show_busy_info(struct seq_file *m)
> {
> 	...
> 	unsigned int *counters = NULL;
> 
> 	if (IS_ENABLED(CONFIG_NUMA))
> 		counters = ...
> 
> 	...
> 
> 	if (IS_ENABLED(CONFIG_NUMA))
> 		kfree(counters);
> 	...
> }
> 
> Presumably some dumb compiler or checker warned about
> kfree(uninitialized-val).
>
Probably.

--
Uladzislau Rezki
