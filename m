Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8AC41441E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115434; cv=pass; b=Hk1dZ7ftQSC+rccPmQKl4NZ5jQ/SOUgiBPb3zQVj6QblLPgxLAT96ugfZz0MNehFFrZHwFUXSB45iIMJlD7VuivcnQWKtfqc52pOJ3MtH9kuMeeVHoCvz76tsEih+FR2liimMby2V9s4Ye7CKFkK3k2dv0BmnGjfP/05uAgNp2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115434; c=relaxed/simple;
	bh=xclsxU/OKlyZxe04QWb2jLBYOc4h57dKWedu3IwQS38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM8oO45YLDbNJD78PLECnaDssCFXkqiQBxoJZ+fb1O+BDAzNDt/c/V09TR67gRndrR1cRhkEqAVW8d+PHL47g2qGU6WkUke3Sfh0PxV2XlzlIuC36a5vyu33zNBf4CyImoYttnaAx2rtfTks+ZThS6VSsGHkNDNRF2+wHjz/u24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTt3O25k; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTt3O25k"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8abc87cbd93so5092407b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115432; cv=none;
        d=google.com; s=arc-20260327;
        b=AUKtSEU6uVClOS3+LEvl8UkeQCjWpujdpcvkDcKGX4tWZLTMQdvNtHNZHGHu8mOYZ3
         4NmZL5yF0M1UCDwgnAWWXRNRvB+/ZSqC1Z4tFrfhHCDRh51XpxoJF6oFH1/Gn+3ZJjFg
         1axjeG4UEZ/NW7niCP+pG+akTW/PkMHFSjk/xXpIQBIT++SgsgZSt/4l/NKRp1YgqWpb
         mrhCNeUiRdumR5A+MskwK0mdOnb86/O11i970bvIVRmu9dgvXpY0O0t78aioibw9Hqrh
         OpXb8brt5nO2LOXNGc9OAuV83d6zZ7CAUyADbOU51pA4ACjbJXwgF2N4raS4/fo/bSG6
         5FNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        fh=OYZazeBDXvKz+xOBxfFmaiKK2YFcejn/PUbI8awS5nM=;
        b=EG/iDc6dzFpqLBz35nhqpzkojwV/thxZOjHRN3MhfU6VCNqt2evyq/NRlqpa0fBdKm
         Rt07ctguMPsWZnTH8xcmDKveCBOIw8PNWBfZtPh1h/dnpiRgv8/qlGipw2bVra1NhfA3
         EqzWc7ubEV8FsKwzpGOuMXwLXpcCDW1diJDNNohQG/Kab1nms8Glc4XdxuKhcpDY9oIM
         XRgkhbCPXpPNu/cvloPrDPgYBZuWIr4qlcS0b4p3R8kdm7eKFyzzMh1TVvL/qMhUkxIx
         XXxZgfNGr9OE6i302ASd6CbkPaa4JsJDE5xNSztN6cWRZdGKeuLNkuMniv4O6a3bWlK6
         ixHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115432; x=1791720232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=FTt3O25kdhuFy3vMJj9GYraydBZo21rt7viCquC3u8c1wTBCPhP9xrIOznumwoOLSs
         EnPFU04KxXlfX5mPEyL9iqDcIJ2oOGAb2O0uT6Q0j5IjRr8AKKXdPyQfYOh1xFW2Zt6s
         Wy5916Dng5eEZQnTOdh6RCNlQYX/XL01FcZdoiViu8F3+GvIkrIqkzVCXXWZ5TCFnoP7
         OnxIRXdL3EEB8B2c1cTAA6iJWTpG/+SejCvRrVlva0N+RJj1IR3G1s0MluBdO2m4INr/
         vkvE+id9AMGJ8lsoh2EPvX81Q3v7HYA6/XkJIKZWII9uLuEa9XUUi23lZ/5M2LBka2Dg
         b/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115432; x=1791720232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=cpJO78dSRHf2ZM8pCw38cLA7g4Qv06hGCiogvHVPTmFefTWGtuV6SkXVQc5A+NE6jS
         dzP7v4NoacTNzlz540JGBjfok8VHyLZD2JFokO5eVYRovVylfVFgJBQXX/9rXjTrnvTP
         bLagrGrTZHvn2a1SI8oI6UOs2eUlE81K+0gbh4lVKP4uKXDUdf/H9MHLomgqZCkOim2d
         AMvItpcW0EfeZr3GAF90UPEMa8BuBDEoQHMB5lsnaK3D1lAQR742hLq1q+mkxpBC99bm
         CdtzJloRMfCnMkdbKBvFec4gYyxGSz9nFX+VWcrxFpvSni0hd45gbAHJCgI8yxkN0/S0
         AhJA==
X-Forwarded-Encrypted: i=1; AKwUvBzmq8OwFzkb/fGp3b7BPPTkoiZskgcmIta096kptbCJ2qGaALrePBQUqualo1wbhLhxXcOF84ndalfnkQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOQwkFrw+RuCs8etTpgBg0ZGDSuhyQUbpeDvgE6d/KHENstDb5
	OqJaJCVqD65pNpjCLaQj3ps4Q8jRsk5Ws1OTQNRFYAZZMHIsqo2spImauyiY91AIsbZzMRIDWW1
	+6iBeirEYjf2OrwOaHDPN3fkMjuIdHmw=
X-Gm-Gg: AYBFou0AIkixbQ35GVOmmKupM6i7hOlQg9x8q3D5P+k2uDl+h7YQy6Ky+XEeK7jgZwF
	j+6xsYgzSvy675EvrgpOK2sNKtW4R9UINbrFzyH7bYAZ3UFfcjIw18s6+659+kt0SvHPX9Fv2iH
	AIV4XLOK51YAVyMGWuJHivlrB00JnFUKU7ZVWNNrsFAK1hiELewa1AKuCYVNuvv361Y+rbZMCur
	bXLVQKK8AwZ4rUl+Nx6jPBzhx+Z23gvXNnsKy024I3/nmrHnWryrx4cfaB3TXMKX/EVyPTms0tk
	dm+WE4vtF8ybJILQ8X8CWqZGyhgHgsFbhFV7y9dHcnN1VwYKWm1CFcFqExxSDZV/b4x6emMuujv
	b0FkPEMo0tZq511loZi+9mHuNS0UHGBBVIhwo/F4lPf1M
X-Received: by 2002:a05:690c:c50f:b0:8a8:31ad:3eb5 with SMTP id
 00721157ae682-8ae398af9c7mr32497627b3.28.1791115432330; Sun, 04 Oct 2026
 05:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com> <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
In-Reply-To: <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 4 Oct 2026 23:03:41 +1100
X-Gm-Features: AclHuK_AzNA1kHsdQJK4JzjMKX_G4POoldRIESfIqws1tUYpdz6muZxIlnl4ufw
Message-ID: <CANpmGNuD9mvO7J3g9gG9_cA6ZDKRweGubBb=yQ_51Ojtx1Owag@mail.gmail.com>
Subject: Re: [PATCH] regmap: Drop map lock during cache init and exit
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 08:43:22PM +1000, Michael Reeves via B4 Relay wro=
te:
>
> > Commit fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and
> > freeing the cache") added the lock for Maple tree lockdep validation.
> > The current Maple tree backend uses internal locking, and cache
> > population is now separate from cache allocation.
>
> Do you have a reference for what you're referencing here?  The issue is
> precisely that the maple tree does it's own locking with a spinlock, if
> we ever use the maple tree from a hardirq context the use of the
> spinlock in hardirq context will be tracked and then on removal we'll
> get a locking inversion warning when we try to free it.  The maple tree
> locking is entirely unneeded and forces us to jump through these hoops
> but there's no way to turn it off.
I was looking at 94a3a95f0315 ("regcache: Add ->populate() callback to
separate from ->init()") and ed5d499b5c9c ("regcache: maple: Split ->popula=
te()
from ->init()").

I thought separating cache allocation from population meant the map lock
was no longer needed for cache initialization and destruction. But your
explanation makes sense, thank you for pointing it out.

I think I found a cleaner way that avoids that issue, I'm testing it now an=
d
will send v2 shortly if it works.

Thanks,
Michael
