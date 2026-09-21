Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677A314D1F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961612; cv=none; b=Fd7SG4XLwgEVYREacBb+RlgYhWoHuQ9mLWMGm+O53VgY96uii/L/2Cb9NwrzGsFXfwoQFG8CBEa9h/B2kG1Cua0m2cwEE3ywS/qSCZsk45Whzm+4KdYGEB4viZXr9PLll2+VoDLosbVwPk/zqnyENPs8Wou5nnGrmSqKLLL19Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961612; c=relaxed/simple;
	bh=TBh+MnelIfrQyJvDGkl7jT+Rwdd63n0DniAsx7Bxkks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1yxKNb/g880/5HFcHylNkI2tzGhc4sfbx8x3KMRSviieBf6TQgtqOI8HcMzF149AgcfwsP3pHUtnhqU6RDE96rXw8+HCittp/NygSVtSacC8mQox3I5CeN/+bg4s3g+E2+y0C12D1RyTISCod7fgGCpWLivQiKZSSKktR/xf/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HfTdM8/Y; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HfTdM8/Y"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5306abbdccbso29303831cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789961610; x=1790566410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6VHmJPAAkgAY7kGGRO3HmxKD/ZCEfTtvi3FHnUUDOE=;
        b=HfTdM8/YKMZN8nF/1D+NzIeiZuV/PLI5lVIWmJ048CmdSgIJNkPhRuMcsRYQ0FrQyu
         bW1yXguGbsWyiV5xPmgm404gIJc1LUGSGq2KszQQVV8oRI8dxQdozbZ9fz+vgnVErt28
         aghplXr12rvf9UeJ6o9E9hxVWY6jQ2F/DUCrW8Jxgs+oRZuxSUu2Oys7kVUQKEHwFdyX
         J+ddZa786GzI/Kl/YKsD/noT6R9Kc/Hb7+0x9jdstKPHpu4YORGMJjZC1EP2LV0ZuKLY
         LCn8l9M46DK1qouysa573m+4Gnuoz2NyhwiAJoFgMOvgFRW86w2AAJigmd8HZVsALIg/
         IFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961610; x=1790566410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6VHmJPAAkgAY7kGGRO3HmxKD/ZCEfTtvi3FHnUUDOE=;
        b=u3oxgzi9RCbfn7bJ5+4ntTS1KlaNrlfaz0gkzmj07HUwqu/WDFP7SPv6ybCRfQmKvq
         0twZCY7ucImC5i+sczbiXriRZm/EZO4FgoRS7kWQAWq1o4pcn6Lf3gGaMuAQep6dc1cF
         Xa7Rfy+7/S6mpfQCTJcDcHu8egqV2vK+1BdPSXNsoKswnSzS7ZVuiHIhssfHDWQ0D2+R
         vurJVySjqrnrTZIlrhE1Hkgqbd/1ZhZN2jb8saPUSa7h5A5Ef6wSLaU1RZtoEEvRIqmI
         0lTd5NIZiOOEAPx64FMb1DnXiKLY0cPvuVSin2EAvWSeH6A97yWbV0FkqeSTIA3hXlMU
         EDPw==
X-Forwarded-Encrypted: i=1; AKwUvByhkkiggavdxQwbI4bZlCIcNbKZ4VRevGyRVNbQOuo5u9sg4Sm1+APevqEyJilrgfLKmQ8BurgbrHOCfcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVihJbhi1aQvc7z7r/4U/W72Pbtwj84GR5yGFwMKz4X5xVYsBe
	iwJrKNG/secNBN95c8S+VtqCoxLj/WHqZwnCV2F9c7mysz/eHjj7a/2lGBQmaTx5+Zg=
X-Gm-Gg: AYBFou0lOaoK8j987z/uihMgVy0GN2zwfLe41CrqPs27DzkLscFdcQIpnVETPHJihUr
	iMwJrfxmU/oU4KNu5/Xnr5Z/5vnAYVZSxMH1zIetGvIw2lKOBI5NuyNsL3NM161/7AxyzZfZzCW
	DFLt4EUcGAfzfvgaXl5ak0RywBE3YMAEYdwo5flwK/0LAoMQ7F8SQT93CCxKuK08mmwphk9UWTN
	bMQkTIV7Ny8T991fwmaOI+zKGAfIS4xl/Y5plDAKZFAVLSjPcfTT5+28NWO8AlyEFVZzv0a02j5
	gz+fjFtq5WOWkdDdzrrUJ8U637STKPvPar15JirVsreKn4ATKKAaiUm5qlRt8t5YyHFUfztIYob
	5jtGJXs4tVwIieWFX5omtMYG4VHG+JPKsDlz0JzKGJPGLlnjmIBwGY+tcFjsoC5/kQAqWggXzIi
	/9itsxe1DUHupvlmcgI+B/2Hxhj3LGGvg2QoJTcrexsTZInJ3Vkb/AHluFc4KG2hA3fx20jz4Ey
	LQkrIy2rcbDmX+3ywljBAC5c+nSUzCK2E+WiCedd9o60nGcztT32oU=
X-Received: by 2002:a05:622a:5918:b0:531:2087:63a7 with SMTP id d75a77b69052e-532b73277d4mr83973791cf.19.1789961609053;
        Sun, 20 Sep 2026 20:33:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa1db7sm57867246d6.44.2026.09.20.20.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:33:28 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:33:26 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <arCkv_0nk-BtW_DW@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <DLKNKTQHSA6H.6XC9WV37LSVR@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLKNKTQHSA6H.6XC9WV37LSVR@nvidia.com>

On Sun, Sep 20, 2026 at 10:53:13PM -0400, Zi Yan wrote:
> >> +static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
> >> +				int zlidx)
> 
> Is build_numa_aware_zonelist() a better name? Since the old comment said
> "NUMA-aware ording of nodes" and the code uses find_next_best_node_in().
> 

I think that's a vestige of older version having different ordering
options.  Now the zonelists are always numa aware (except for
!CONFIG_NUMA, which... duh). 

Anyway numa-aware is implied by "node" in the name.

But I don't have strong feelings about the name either way.

~Gregory
