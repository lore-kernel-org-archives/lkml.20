Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C5039A04A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273220; cv=pass; b=rmeH0w7EyubIY6rna2Mvv6utURZzGnzs3L+RD8qFMrrM6fwdXHAZK5J+V6MI/ZmIPO8wYeRYj2fgc3d32zNBavwoZ2RbHN9KlgqXz8802m0PDvGnyHSLXna0bgIv18SKsuCl6yZEU/Mx+hMW3dGz2rftI5wBtZmyK50mKhT81tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273220; c=relaxed/simple;
	bh=jwSkcFIb+xpVx1An92tSBb8cD5CE0QhxS6QkW/Ccv7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYkH+q8Vy+IOeCLHd4SEYnfwF5p7n2GgOQe1Ohpc7UDWfk6iuWwqpS0uC0icD7VPbTpruvD9bESdPdGhplzg+qqGA5yT9wClHeTbYQRD0nB9MkFpM4DbOhku/9+6mlDojWCGIoOWWFLumBM5sIwLZUlCDYNN4YK7gbD8DdJWeac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1VcScjw; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1VcScjw"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b34face6d0so651170eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273218; cv=none;
        d=google.com; s=arc-20260327;
        b=YYNcjFLR0WuiH91+01h12zTwH+iVr8+DwSXoBDp3AdphcVp8AROi4IPRDSqY9jmP7b
         2jYMrrakywjPG26BGXfpW3+34N3ecd/TBPhHv+P+CFqkKOkuDG3aTpGebffHE+Hm25Oa
         cC9o8bpX6QXQM+9MizXszwwjzJ3gb/N+Pzx/lY/qWzqb9bHRvAS2/zPsd7Y710yMgbFT
         kgZYwMVnfsq1HdG1AzrStwGuHHqUpM+Ttrf066/FjCUpGkfqHDHiwJjYgz8PnAkHDjh1
         5sQNZShLJUtbyW6mVRlmfbtnDavF+xKGKEz9dK/WVkgggHxs0VhLLj+kO7aJiHgHlNvN
         U5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cBS1K3vH89cPPG1M+AQoc4jw9SKxnYkckGnojIfP1qw=;
        fh=HcvRsbYAq23nQBcrG0SImuvDMPQj1UE8os+pAZesros=;
        b=RDSCOGXBMLs7iGRXuf0tjO+/hCpuQ6Q4TF6dlFYyWyF7VAYGMvx9wdCMrT7LCjFIK0
         gb9dc3ZZC8gz8LTx2mV5lHoyk+EGl04Hu+p9/MgVecqu1XoWa3qMWTCyuDI8NPryRtLm
         eRUJF6CLLehJTyIt6T2lbyn47eaLzumQtFpgj11fEsk3qQ2yqjPYl1rgwYAu+AcziZ2i
         q6qoBLHiWYq8qVPVyq2Xe8pbUmheq7jOYhqyq11VhrwKi2uCal+ymsFUkQbDGIoYbdfS
         daNstQW346W1E4MDxrZ3r95bYOqZZgLuvcFBXcRROavWRpkgzUOApX5bbhZWd61kw19p
         dzzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273218; x=1788878018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBS1K3vH89cPPG1M+AQoc4jw9SKxnYkckGnojIfP1qw=;
        b=a1VcScjwubA6OPPBvY+EqnRUUk4Rl5wWKvMvClW6kpOxF5Cux689wln48GqzO4Ii9y
         57u6PqlRS917cBQIhGuG8iTG5L9wPvyy2mBG5HBX1S8hV86ygcfy1WeazD5i0KGTgvvu
         vbfhnj41WcAvrdoIWnwJM9Icdq375l5Tk9qgEXHbGPGkVDcFZd7RPOs4A0yBwfcxZvK5
         psqWeNX18otQgw+FHjZuxMTlToYDi+VQ11rMf5FMDyVxzyQ2Ufh9kCTTGOxo6Zleo9Px
         Q7WEmufBYKrScI/3fsMEha9DBFXC3r/MJpeKKYLubWLaPlYpMXlLAR+QWtSnxVu0FQ+9
         hEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273218; x=1788878018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBS1K3vH89cPPG1M+AQoc4jw9SKxnYkckGnojIfP1qw=;
        b=MQ+S0Y+i5vfOQTNOl29w5rBwcRGP7ecTjrQSdBy07mxrKDfv9C8auT2Th9xThs9JS8
         ZsHWCf5atBmPY4/Oj2yj506PnveLILb7X9uDx+hPODbw9xq5l6YSC4/Dr3x0OnnVh1U4
         9oUjN4aXy8YDWiJag5sni+nipfoitoLI57ugdlMjtXVK8Gr9kGHNCHmLaELxNdKR+v34
         QTPA3GiAfgwnkVYohQpXVNhjotQlnV4bPrKNVXkgRIzrURDcXwHO0eQosSqfreInpnSO
         nGoUH712QCI8dQZvKFXP7yv4NvfX4ZZ1H7GdpQZ1bo3SzjIy4qUkiQFggk4n2coYf17Q
         t/UA==
X-Forwarded-Encrypted: i=1; AHgh+RpBbf8skd78CzLLbBgHMsf2eol2QYKVkj/TaoYtWdSudI7xUeZz3THTRwP+I0y9Otk88EML+rtxEAH+mCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8eNCJwFZnPwi8gnrhtbbt5TNlP5k5N+pbCxY8gNPjT9QYx+AV
	7QUncaG36nC+qiJwXp6fS70uXI9lUie7IEoAqeWrfvK7cdVFWfinPfNfpZue6aQhXSvQoZnxvUR
	l+L4arOEb36Zen52cZpqWQ6dJmhaaXHs=
X-Gm-Gg: AR+sD11UjxGOD7CExgz03zaqTqghiokRFUGwNtIXneXy+OrnPGZ5YC6hWQ563EcX1TE
	aRvjEEZ689V2ry9vjd1PTH9C7s9l6U06cRoJtntNkCxGi0s/CfkretolWYshoUleT85VM08Yuqc
	SgDFGl0NTpdOyBdtOJjH+DB7dAg9D38xLsuM90csQyk7uDxrgvLc8Fo1CIrZ6qfBZbjHuYpXPkt
	kPYpQVXf7KKPXxKQvrj+liJlq/p51FmYf1o5QSNfSYc22Jl8U6snmZbhNcECHzDlDHDOH2OHj5R
	es1Ofx6jGdZGrogItVQPoXVb7osjvGFhba+iIVzNDjegw8eiauINqRNdRt3AGGDL/CEDD76SnA=
	=
X-Received: by 2002:a05:6820:628:b0:6b1:9b72:213c with SMTP id
 006d021491bc7-6b378158e73mr3825454eaf.3.1788273218048; Tue, 01 Sep 2026
 07:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-2-wujianyue000@gmail.com>
 <CAO9r8zPYZqZ9UsSU9xVcB6=m-uTkucSoPvA5xCB=mMrb9yVD_w@mail.gmail.com>
In-Reply-To: <CAO9r8zPYZqZ9UsSU9xVcB6=m-uTkucSoPvA5xCB=mMrb9yVD_w@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 1 Sep 2026 22:33:25 +0800
X-Gm-Features: AcwNN1XmqDuQ2Lon7txlynZyRZzsoaJEbZa1ROihp9wk8nxKntpYq9IK_bmAxm8
Message-ID: <CAJxJ_jgiNTBxjojc0XVbd5Bx=veDJQSA8YaeVH=QMBzWzrO8vg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/3] mm/zswap: release retired pools via
 queue_rcu_work() instead of synchronize_rcu()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:20=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Sun, Aug 30, 2026 at 4:47=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.co=
m> wrote:
> >
> > When a pool's last reference is dropped, __zswap_pool_empty() removes i=
t
> > from the pool list and schedules __zswap_pool_release(), which calls
> > synchronize_rcu() to wait for readers before tearing the pool down.
> >
> > synchronize_rcu() is a synchronous, potentially long wait.  Replace it
> > with queue_rcu_work(): __zswap_pool_empty() hands the pool to
> > queue_rcu_work(), which waits for a grace period asynchronously and the=
n
> > runs __zswap_pool_release() from a worker for the sleepable teardown
> > (__zswap_pool_empty() can run in atomic context and must not block).
> > The grace-period guarantee is unchanged; the retirement path just no
> > longer blocks on it.
> >
> > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
>
> Why are the patches still tagged RFC?
Exactly, should be removed, I dropped the RFC tag in the new version.

> Anyway, with one nit below:
>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
>
> > ---
> >  mm/zswap.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 37f34e406c8e..0bb30e58950a 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -155,7 +155,7 @@ struct zswap_pool {
> >         struct crypto_acomp_ctx __percpu *acomp_ctx;
> >         struct percpu_ref ref;
> >         struct list_head list;
> > -       struct work_struct release_work;
> > +       struct rcu_work release_work;
>
> Seems like the convention is to use rwork in the name instead of work.
Good point, I renamed it to release_rwork in the new version.

Best regards,
Jianyue
