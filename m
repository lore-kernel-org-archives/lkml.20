Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62832E13B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788723867; cv=none; b=Vc4MIdO+//PZa3WWxMYnf1TZ9B86cr84Vgq28untM0upCcTTTgWGrFA9grJhvA3VhYrfxWi7caMrh1OrWQNY9w+CUDzYhmtDDGZaldQXFmLo5fYnfO8eSeawUf0H39okj5bNE1QFPOoYotDCWiX1T2w4CuwyMHERHKxJLLzkSmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788723867; c=relaxed/simple;
	bh=Z/QLbGZLB99eUtuXmocBvEQikv5QC/t9YyuXuQ0XXOs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBZd2wOjKNX5VtSqNLzrvpVl1JHGrzO6yXKecHfA70HwgBU23ZlQ6gH4lvIik8exRck6ZZd3jWpxvPsPrc9xKeTC3yOOzBCvX9oA9CiKi7/Q0ndIee+UTb2QB8fu4byXNuXf7Xy9Wvu0Kdnu7yMNtxkLhGIFDQduRd4Fjx3qjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJDTvZvT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJDTvZvT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso26285495e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788723862; x=1789328662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1git0WZ96wbt+gAecFgsUj5GK1DOjSXBKImfrfl2XU=;
        b=nJDTvZvT1bCMBXJXlHTu6CIhUZx5BNJ7cxRi/5qKbe7/hbDNNpIrHr6Mg8jXTQlCNn
         JWFg+4GuuwJ5ISdt1e7zP9PYR2QrSOvLftSk5f26rL2hzy0Zd4NLvvlpkW/DyD58/L0L
         t6Y6cB+uvrChDyZ+WiXCSbm0gBdhvGFJm/Yi0GJiCztw8vUfhVkPQHc7QFRyTYc90BS0
         Ykko0UtXO9OkYBSaukbhJebU54Ap1hMOZHLnfDGe939PRWwxFxtCIkNs8ecRGeCLk/Ar
         I/o2WU2r57WvEp6xv8L1rD2F/+/e4DIi+9+9MHR7Qqwl6YGlk8Jnw65yRY96CeMEJvGg
         ixVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788723862; x=1789328662;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1git0WZ96wbt+gAecFgsUj5GK1DOjSXBKImfrfl2XU=;
        b=jAkxXXPg9vXUeK2eUGCUWYNWN32aBdpzXufPVx1fSeTilMBOOjkTDV/c446euXOPmC
         padsFIOfkJyZ5akB8VUUEf2L5j8PgNNrnqf1C2IV41ir61JYz8xuaPdwMpSACpB3iYH7
         wUkRMgXqToyG2mnaqdDXPKVLYmkLf5jXlv1bK+eMIPTzj3ZnPAP35wHtdFlN3O9nvr75
         idyE6vgLJAdRwSdvAxQ0Ok1Ny3Rj++IZcqQg9MX7mhWJPq/rE3+qxuWHfYEwrsppDLlO
         ZtzlJZp0EYnL9Bl1Y9JOpld5i/53pAjuvspI/XnmD0HwQEffnqddncYEjquMsDYSmV31
         c7lA==
X-Forwarded-Encrypted: i=1; AKwUvBwQAlHM0eX4BG9UeOQsMKbb79nCJi/eCytuvg1hEOTd/1tn+v4VuTpGtvf0C7PfjYWzT6StFzSCD9gbozA=@vger.kernel.org
X-Gm-Message-State: AFuF++mO51slm8v6tsjyO07iZ/3QydF+R/ys47BFjtY+9hUyotUN5l5Y
	mB+hLVhj0YeklS7L1z1eYo4ZNnO2wkobh8vULPadMgNuI7QPJ/d4EG51
X-Gm-Gg: AYBFou11R6QWVUdx6YlgUm5guy9M0pDvhC1J6C7FS3FWyS6fd6kaRqq19j6zsBRW6+Y
	wOe2TE2s3+KBgu7tm1DJ9m+xRvycT7sKmEoBk076w7Y3NNp71GGnpJg+Hc7LpizLzjVG8wQIGO8
	K++Vr5Ek+0WqlmXBOyEWK9WHS9iCuCfoHJ0d9WNB7U4Aoea66sn9oLRNLJG6e3EtREf6VqBunnU
	swLrh63NpsZnsU11713WOSa4CpfZkffzunE7Zfxu9z2hQXpbjseq2SKgH7kQH3RUCAQsOQzmQ6A
	EA8jjRQez5vuPSvJpZMeY/CTtKwiTY8iKb1Cnthr2xzAz4YW5DSUdXdOwFl/SFCr+Beup5zmWTY
	p/Lxq5myNc91oclZvYgTXJd96APDnNNc88OxM9p9XqYn2IY8nWHGFhCOkA0cpQrLKIFuyFyEumz
	BDUtFt9f5q5cSrz8UfolpwENuN8vaXtMfSkIJzRliSgdmiggTDY3fpg3ztEnln57D3hNT20a3JQ
	oAOZXQO4TqVTlVJ2B45mQOdLskvGaszRtzPvGvbivm0iTYZvWXlxSg6lwRHCL9bklGY1Di6G4rc
	3rxSoORCZlvV9EJmGrGD5Z5qndCa/UDV6P+QqU0YwO5MtNucDtiGBHiKcHFQZ7npdf0NXFHzj13
	VraLQx26cyEE1Ns30bOrvmQ==
X-Received: by 2002:a05:600d:113:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49cf827b19cmr106524155e9.14.1788723862396;
        Sun, 06 Sep 2026 12:44:22 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm567978165e9.15.2026.09.06.12.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 12:44:22 -0700 (PDT)
Date: Sun, 6 Sep 2026 21:44:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Tuna =?UTF-8?B?S8SxbMSxw6c=?= <tuna@tunakilic.com>, Andy Shevchenko
 <andy@kernel.org>, David Lechner <dlechner@baylibre.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH] iio: dac: mcp47a1: Allow full-scale output
Message-ID: <20260906214420.580dec27@systembl0wer>
In-Reply-To: <20260906185942.595251a5@jic23-huawei>
References: <20260906045428.4f03494b@jic23-huawei>
	<20260906090802.1282585-1-tuna@tunakilic.com>
	<20260906185942.595251a5@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Sep 2026 18:59:42 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sun,  6 Sep 2026 09:08:06 +0000 (UTC)
> Tuna K=C4=B1l=C4=B1=C3=A7 <tuna@tunakilic.com> wrote:
>=20
> > > If AI had anything much to do with generating the patch then
> > > a tag for Assisted-by: LLM is appropriate.   =20
> >=20
> > AI was only used afterwards as a sanity check for the datasheet,
> > in_range() semantics, and the final patch. The bug and fix came from
> > manual review. =20
> Ah fair enough then to not add a tag.
>=20
> Thanks,
>=20
> Jonathan
>=20
> >=20
> > Thanks,
> > Tuna =20
>=20

Hi all,

sorry for the testing delay, did some light travelling this weekend
and didn't have the hardware with me.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Tested-by: Joshua Crofts <joshua.crofts1@gmail.com>

--=20
Kind regards,
Joshua Crofts
