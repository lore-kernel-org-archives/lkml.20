Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EB5111BE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748655; cv=none; b=Vd4tMp01sdNguUX4OCge+gB7qNCWJ1621K6U6Rkt5cb/Lut3DuwFaY0t1H1uYg14N5j35mybz4e15R/eWO6dIh7HfenALkqDN7Ol1KMJiG4EX4NQYKUCY+nPwgH/aoq7JaguGxfTWugrimFc184BGbErY6AQAxC3IOIG82WgshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748655; c=relaxed/simple;
	bh=u2qNzscspgNjHmDHfUPnMbVtInEKJuHzmMhUl3PFTKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8alBQCQ8Ozf8acqJK1D7K7V8Evt0YIRtSgVGJAqpTgOrgBUeGHM2QlHirxOyYv910BZgd2VRffSA8Eghf5JJl2bamQTEriaf9EbhURh+GYlX/xfW5M94z0QM89so1jkL9ZQFeYkjyF+Oey/+rGWwhA64eZFWc/QtoK/+kCrnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=VytQKG6w; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="VytQKG6w"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939922847efso85090785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789748651; x=1790353451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22UHuqAYfKNfgslt+w3Gb+mOi1pe1zYpAqvus/G0CRA=;
        b=VytQKG6we8ypXfNkrDDwlg8IqE83rQF/jMlzJ+3yNfQlrmfmb/Y7MemRi7gj5SfL/y
         MQyrFruwPdIhgI2pEkiiAc0sFLcuKMErbJT223jkceruQAQUuvqP6vfW0W3llJYvLHu5
         9+D2CPJ677y37AqCHON/iDgtjWjVFVt749rFkwcysGQlHc2eWeoyhAXsmzPhQxNlaMqc
         DStAw3I89w3pe799zJyGB+mx2jUu1NnvSmMQhPgFh3OirhL+aHqaxAN5edwLp2HQtIAS
         qC6TBXMw3IDr1E5VRZZaBSFZs+PmV0HiTQU/BJP60H3/SJ1hEgAwoj0O53b0ZBuRaWjS
         axSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748651; x=1790353451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22UHuqAYfKNfgslt+w3Gb+mOi1pe1zYpAqvus/G0CRA=;
        b=SEG0n8gvNXFi+nVGZq501JDu9z4nCjTfkRLto198ckc6fGe2sMtoYIhDC9uKVrv4+S
         /xb6IXohO/J9pK92KOFce6nmHHUVfIeg+/y3waK8gbuUxxNgJgTSEqcGv7aBu5u3v2mS
         LvK7lKaaCjNr/vmf90vfvRHQ7ai1Xi5R1L2TkCo/Ri3Prigdc1Kvj1bNc78eTuj6hByY
         phz/AES/GS6RYkEGmhHhzUVKH5ribPKqDOiaC8iTqYt7hFXacxmxkp31zBdLr4UpGSjs
         D9ifKzN7wIjJd20f9odAF0BR3/MaeccUJz7CSprPwTWn6GpJPfFFnG5S086Pe2WlC5kj
         +O7A==
X-Forwarded-Encrypted: i=1; AKwUvBxKX6o1KZb79mSIbolwIQ0cKQn++QZpU3630EOQumxs9hRmrKykyCnc1LlpToW8558sE7voQ6j4Ex7dtJg=@vger.kernel.org
X-Gm-Message-State: AFuF++lV++K9t4rLRhXqdE38h4AJEK6sVD9UN2CgJi2HXkjP7f3Ywspf
	/xsUR3EiWGgnXKySxP/ukYKH4msGYlkIxK/N36OcaUkE/rPY8bvRJUG4+6hCR9bZ2XM=
X-Gm-Gg: AYBFou0Er7+OMzfoGhRhHqPwaPpR7tqUqzwzQJZMsNipVIQNYCjXirkxEHNhwLicsG4
	sWe+Jp+3Af3cgA4ZjIehX2cJTrzPvAxrxtCV5xNG6fdPDsNyN6MUfUsF5vL3yyeUp4m1+dJiEDS
	WF2vJ77fSxCKWQd6+xUARoXOurl1RlODUmfjJ7xewOu1f4i7siSqfatx4BXYjPLUyR4eVUkPodR
	nYHFD3EiEfIuEV/no+b2tdgps525dpZFT7+kIu9MOLilNxV2LmmVMpelzIV53fn1cUCfReL8wFt
	eU4Qk9bldJFvRok6DfzNZJL2xqfE6GQ+vQxTiDUk2wDzbO3b7d1AKdQs6j8QSLpg6twxtHql1Zi
	WHGxN0Ae1neRz5wSwnV2T8EsXqQ4k6xZ6KUN+AIiG7v+xLF1kx3sY2XUvsUxNFqwQR2vLqQ1z7t
	+KZnXxFPavxpRxRiLQ8bZIxwXfmMSp175o8t6Svs1aprXVL/zH3oLY0+DmB0HTXu0BhdD2ow==
X-Received: by 2002:a05:620a:4455:b0:93b:da6f:50a4 with SMTP id af79cd13be357-93bdc6aef5amr427968285a.36.1789748650894;
        Fri, 18 Sep 2026 09:24:10 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e95a4asm173223285a.18.2026.09.18.09.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:24:09 -0700 (PDT)
Date: Fri, 18 Sep 2026 12:24:08 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tao Cui <cui.tao@linux.dev>,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from
 struct mem_cgroup
Message-ID: <aq1lqJdVZ1stTKCn@cmpxchg.org>
References: <20260916125737.1095414-1-cui.tao@linux.dev>
 <aqxMk6yaiFHeeAAg@linux.dev>
 <aq0HNe5s3zvOnM_I@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0HNe5s3zvOnM_I@tiehlicka>

On Fri, Sep 18, 2026 at 11:41:09AM +0200, Michal Hocko wrote:
> On Thu 17-09-26 13:26:40, Shakeel Butt wrote:
> > On Wed, Sep 16, 2026 at 08:57:34PM +0800, Tao Cui wrote:
> > > From: Tao Cui <cuitao@kylinos.cn>
> > > 
> > > The legacy cgroup v1 memory controller has already been moved out of
> > > the shared implementation at the file level (mm/memcontrol-v1.c) and at
> > > the Kconfig level (CONFIG_MEMCG_V1, default n since 6.11).  Its
> > > per-cgroup state, however, still sits as individual members inside
> > > struct mem_cgroup, guarded by #ifdefs.
> > > 
> > > This series isolates the deprecated implementation from the shared hot
> > > structure: all v1-only members are grouped into a dedicated
> > > struct mem_cgroup_v1, and every access goes through memcg->v1.X.
> > > 
> > > With this in place the v1 implementation is self-contained: its
> > > interface in mm/memcontrol-v1.c, its state in struct mem_cgroup_v1, and
> > > its eventual removal becomes a localized deletion of this struct
> > > together with mm/memcontrol-v1.c, instead of unwinding
> > > ifdef-scattered members across the shared header.
> > 
> > Sorry I don't see any benefit of this code churn. The code is already behind
> > config. What exactly this code churn is giving us?
> 
> The only arguable upside is that this would make it ever so slightly
> easier to track v1 specific stuff (once that s@v1@memcg1@ or similar).

I had the same thought. It's kiiind of nice to see which members are
completely specific to memcg1.

> I am not convinced this is sufficient to justify the churn either.

IMO it helps that it's mostly in memcontrol-v1.c where the chances of
interfering with other work are pretty slim.

The patch 1 + patch 2 split is a bit bothersome: indenting everything
into a union, only to then move it out in the next patch.

Tao, if you folded these two patches to make it one clean extraction
and changed over the sites at the same time, I would probably lean
supportive on this.
