Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8751CF70
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167224; cv=none; b=eaBttcNBUvj3NOv6iwlLX1GU5g6RHQgmiHySVc/1g4CcMv4qXPlg26kpu4i8dF1E2PNU0ovj+e02l/QI09AEMY97iaIkmkV0EMuISPFvs5Uvg/p5CeWxsobhcRIy+RMFwN0FcA5s5MH3HgsnQivCgD8RzMmm9E3rzBCvI5S9GWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167224; c=relaxed/simple;
	bh=OuZ8YWn9k/k6Oru5iFZlYbbmFNh1wlAXq+ln8CUZHXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8WAaXpe8ZCGwwqpV5V4TE8h2h8NGzciTnLK0uNpUsWsDWn6pAytxvdc44kw+mpN7jpNAtN8q4lqr6co75oz9Q5qRGyFEW9l3RgLRNRto25KZjn+LvoxTVTjSrXae3Yt3VMEgIKhSPLBt3ZTLuPGfcb4deR5rZYK0sEBNWdp4Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PfVZHEr2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PfVZHEr2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4571245e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790167221; x=1790772021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TdBLUyvMtWr6klMUk5a/hwwvszeiGBeUfZaFfQvLAEA=;
        b=PfVZHEr2+mR/LU5erEQzBSM7jLkdibSU1Gb1niSmd//SoXb3aCz24BbGYYWr186gfg
         ZBKWOW6nCVbnUntntaDmxCZMtJ2aYV8XItVawaH1s13poN9dCYgOCfzwOnYuJjgVX6in
         xLSckdxBeU5G/vVVJaphgOWNQWGY9cuTwBJwjufOjeI6BxXvDjFgmYN8IF8shoXbHrKB
         MKzp8/1Jkv2RB3HIQ3E2d6ihHlun6RFDodc3wwv0JGa5jK+HH9hMX6xbipMNlN7RBZ+I
         HEQjz4kMuagSTz+MM4MkC2h9WvlSaCFtqI/qBa1DnUWe358hAEp5fqcywiYZhC1eNDzM
         Ylzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167221; x=1790772021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdBLUyvMtWr6klMUk5a/hwwvszeiGBeUfZaFfQvLAEA=;
        b=0MgInwfKScLn3ZaOjGXG5BNkmkBC/2NJ6aL0qc3bPPPebfqsLZLvAhHtUgqdzkdtzY
         WAKX7fo5TfbIKgtRfEbq6NMK0B4zuZElg47/C8ct6OlHyLJ0mjcHHGG2Krjow1vkLhlB
         Vtn60wZ9Bj/iVCGW+vQiG7nquSH6FFGzBL0m7lOrz7rqYqGd13ZUI13DsoBI8D0BKrMt
         24sc6GmzXarUNEo516m1aLbq7+1IdSsPsyyTNwgzJ5sxLFrgIBTuoG0YD/XmP8g8yl7f
         ThBYCZF0LerszYIjvW94lbARakKqR4nVsT7Un4V33naC5FL7mEV1/hDUPIFP+ueeh6z6
         UvdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8vFgU00AFg+cDOwn2lPZ9+zhnsXFIz1Bnl5jLeXKeyDVZqd0ZGUetKN9pNaP2ton6TYLVfFdzbWnqmzk=@vger.kernel.org
X-Gm-Message-State: AFuF++lf4ZTfgWLoNBaHEaiLTYvz882q+91ZbjXI0zK4qdqI39TSAP0c
	FjIsLBt3/oDQ7Dagyn1G64IuRVQyywpzHEM6spRkFwxV3GqXeWWesIbthczUR5aSBDA=
X-Gm-Gg: AYBFou2lt1aD+HiJWgRv5m7eefbpNFjZzY/uYn+P4uIFVMtQ98g3vNJc9pLAewyVVH9
	lQS25UFDDNO8BvlLNqJ7ayPMfk9Ujzn8sIqrEqh7j4M8FQu89trRO70mBGrRW0TGfNadAsh0sTe
	snSuuWLaCEcL9oKnxRiicoZr6SGJX8tYQos0vGx28POqZCWLVUYzyINOyfptcu9bZI7m5qbUztT
	bgYfHJYNyu+ALCA5hItLyQVNo3MvNJmO1XygUP7PO+iL8FJht00hYpV1YS2tOXUo2E0CZGMBuY3
	AWfHzNblMes9VhSru84YvZecLLVUb3zAXbyHx2v12P+qiDJ+nK5kmAdzQLfxrmHcS+QxjHK5a3I
	yr9K6ynzzKYKgIO1gydksK2Q5D70T4JakSmczcVT9C78DkhmfYL8gB1Txg0cAe4fHp1ow9MuugL
	EfNCVX6SAM8aeeyyU5WnG23NprHlJ2xQ+lrt8wgbjMp9Od4WPY1ts37c/BzZn97x8WV7zSoXj8b
	w==
X-Received: by 2002:a05:600d:8643:20b0:49f:bc0d:2e9 with SMTP id 5b1f17b1804b1-49fdfd90205mr23203125e9.0.1790167221389;
        Wed, 23 Sep 2026 05:40:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c119sm7240332f8f.15.2026.09.23.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:40:20 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:40:18 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Qinyun Tan <qinyuntan@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Usama Arif <usama.arif@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] mm: restore per-memcg reclaim for NONSLAB
 shrinkers under nokmem
Message-ID: <arPGEda3po0-Mbh6@localhost.localdomain>
References: <20260910080722.3961351-1-qinyuntan@linux.alibaba.com>
 <20260922183547.788d21b89868bf820e94cc62@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jduqwrsbz2lze7tg"
Content-Disposition: inline
In-Reply-To: <20260922183547.788d21b89868bf820e94cc62@linux-foundation.org>


--jduqwrsbz2lze7tg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/4] mm: restore per-memcg reclaim for NONSLAB
 shrinkers under nokmem
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 06:35:47PM -0700, Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> On Thu, 10 Sep 2026 16:07:18 +0800 Qinyun Tan <qinyuntan@linux.alibaba.co=
m> wrote:
>=20
> > With cgroup.memory=3Dnokmem, the THP deferred split shrinker and the
> > zswap shrinker are degraded in two ways.
>=20
> Obvious question which may have recently been addressed:
>=20
> Why are we keeping nokmem around?  How useful are its memory savings
> and is anyone actually using it?

Besides (not so significant) memory savings, there are also runtime
savings (not spending time with accounting of each kernel allocation)
and environmnents where shared (not)accounting of kernel objects is
preferred (as other resources than memory are shared anyways).

The above are IMO justifiable reasons and I know such users.

HTH,
Michal

--jduqwrsbz2lze7tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCarPImhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhuYwEAq+e3Y6FWb+6/NZTcNcD/
OwbFXuc9bSQF8eyv2blq63IA/3OX78kjmj6FDtiaJ3JiP6ozQ4i+Uppjk/m6YUto
JN8K
=dA2e
-----END PGP SIGNATURE-----

--jduqwrsbz2lze7tg--
