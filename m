Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097B4FDA5A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016689; cv=none; b=My7+ObVGaTtoRGoeNh9Nhy1FgaChcJZZigaCfIUyE3zx+otpN8zzRWz/V1uA9ACV+81wFfNn19m96RF5L6QJxMLQiZ27KbJyz6EXBq0i2rpjp7CBXtcpkgQ4ZMGS+cUS2p9dDVeY0InsXtbczvLHHl3Hr1qPx/Y9DQd9CahivzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016689; c=relaxed/simple;
	bh=gIA613t/TlSvmEDck9oaSUALamHs4wc+Ga8slxlZoho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkR5ORl2rPXgH7RKnorEfC1bw2i70jj/ajEPKpxpEdMuX8izgdo2wjQ1fe2FfB8ZqBj+Esv8gsssAEVLAwnbwh3pqh1+GJJc8km8oNmalbZTJ32yvupLUTzvAswNu5A5VvrZL7DZLdD03PEMBAVb7q1FFay+jADg/OLpcm4rY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpYCt6aY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpYCt6aY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so19531355e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790016687; x=1790621487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE3Tr4gm4tvb6Rbj5+pcpfeQlxZsP6Od7O86P+CMJdo=;
        b=PpYCt6aYElzcQJdSAzt81g13Pf5lN/R733eux3GMQXjzeLnpPoudANzPMvzxrprI9H
         az3g72xCAlOC1KoQ0pwiiBUsoE0XDs9L6DQDXP6iKDE9RUgsFyYLQfF2vRyBNseNrhzy
         2s9wqFFQO0Vz7aaeygqdoYvb/CFQ9I3Qt81sj6ZLaqjOCKQ5wfpuVdP2247kPbxRERaS
         6ZVd5ErDq6dKYE9NpGK22C3I5iipjQOKjwBJZgC8lW77+kzfM1X6U3z5sww3W6AM4kpz
         U/DlJ9yp8ClFfM8BdfmiOA3Z7WmJkwsDzhH3lpfGagDV0cmHielSsq8iGKOXEJgvLbpJ
         gQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016687; x=1790621487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE3Tr4gm4tvb6Rbj5+pcpfeQlxZsP6Od7O86P+CMJdo=;
        b=sxZb7TvEXhHPNpdFAseFJEGP967UQXzany9bOxo+UlR/4ckW9log5yGjWvGGIriinh
         O+UMeSgWkxYBqGMQtZneqriwWKZbEQNgWMfWLq2AxEng/fPA7kyotN7GPuAMImOeHnbA
         XuuaoxpnBbpUWWyzb5g2gseJjzhwXfGXlAcLfEaA1b25r1/PKXAoyAgpIa3F6MLMuNjy
         YsI6k8sn2E0eY+M31bQPCDB6PhhfnINum6uobSVl8u3JcROIKg8vtaeQqgTYUoV1bPLe
         Tb849DYiTmCu+g9XOleJh8fMKTOXMWAzhv4xmL7H9rndTXpNKlXs505JgbwtkS7KA8u4
         qT7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUhnvha3wRPtz86H5S1JIvfXyIw4Fkxg8x7BXHLFUtQLRvNgkwXcoiA1g/pLjduImm+jv+2wMmKFNiK8I=@vger.kernel.org
X-Gm-Message-State: AFuF++lGq5mJs1gjnTgLdTJcKFwVvt2HcZ0rhQn7bybj/9sAzs4flUVc
	TXOPMjqX/WmzumVvsmQgUU38kmk8Rh5nedhU6+fT12pAqldkChI/P3Fb
X-Gm-Gg: AYBFou2Dz6ruvg+hcqbmOSwYEl6Qj3bP9xXQDFXNzYQKTOibl/KJ6/MkoSqG3nefXn1
	A9WqowHq2RoOdfmEs+oB+hwmslRGr4ZYs8iDldb/KxAHgGqj5tbRCI3XUqdyhAyS17xzBN9JWU1
	M6HgsTDm4RS4jsBDYUegq6i1376EjJbRQerXurqoNMn3VbG8dNWpx0iquB8XJ91iBFTSDE/paVX
	5aQuGxGgSjTj66mWnhFfvvaZKaU1Y1dbQydAEEDn/t80Z4mzW49os5KyiXMhRz9IGw1Wr2Z3p+j
	1FXXqhBh7WBTmIhY3r6p1FVr8TE2DgBKiUhprlM51QnAk+W8gaOvqDeWaCPxEffg2Jya6skuEnp
	H/QqTiVAyggqlsu9DqAqrZC5w4K+l+N5TWmUn0sD1eje93qJHbzKFoh4sjigQOhGyMja/ObOgjd
	OQ1nJrZYUxmQfZ2glrtnez4fhHYv1pegDAaQm8Rgox3wkBkI4JrIkTMKa5R1at1OVydgw4s7bGL
	p416VOfaiqrlmChIvvgUX7hWcLGPgpS1r3P/tNC59qqMThAdoinjdsNMBVmo1IgkLjzrP5sGcfL
	uO3QuamVsTIDAau42YMAs2FiNdL/eorzo6CkgL8oNT/BR1zbhEkSyVDHvUouHoC7SZbCY1RP/2l
	Jf91v9PGNAHpa6qeWCzlaWYs=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr177099205e9.10.1790016686303;
        Mon, 21 Sep 2026 11:51:26 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a8e9-c501-45ee-6f60-3fc5-4072.310.pool.telefonica.de. [2a02:3100:a8e9:c501:45ee:6f60:3fc5:4072])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8b9fc5asm11550875e9.5.2026.09.21.11.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:51:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 20:51:24 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/damon/core: score an unmeasured PSI goal as not
 achieved for the temporal tuner
Message-ID: <arF7t_kmisrx0_WF@gmail.com>
References: <aq4g5W58PgWLqJ8p@gmail.com>
 <20260919155342.85699-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919155342.85699-1-sj@kernel.org>

On Sat, Sep 19, 2026 at 08:53:41AM +0100, SJ Park wrote:
> And the apply interval (or, next_apply_sis) is extended for each commit, in
> damon_set_attrs().  Hence, the problem can still happen.
> 

Thank you for explaining the apply interval. So the PSI measurement
period can exceed the quota reset interval.

> > full commit zeroes esz, esz_bp and the charge state of the running
> > schemes. Please correct me if I read this wrong. I can send a
> > separate patch for that.
> 
> I don't really understand the problem.  Could you please further elaborate?
> 

I posted this as a separate patch series with KUnit tests:

https://lore.kernel.org/r/20260921003047.12041-1-kmehltretter@gmail.com/

Thanks,
Karl
