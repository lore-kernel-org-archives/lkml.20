Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C04F3914
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615023; cv=pass; b=UKovQcBGBWlNnaVP62foSIwIZEau6ROXAeeAbhwaL+iFr4cccGlcDav+92xZq3rd4hG4+2AlgW+tWtOHQmL+vvKnQPVAmNJVycNFaDmQdAzzmrBawMxlu0HjtL+t8IDgFhinfxr7pD7lHraFFEB5uRvq7Nzly8mrFblyfBbV6xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615023; c=relaxed/simple;
	bh=kIjtcL+Lz5QXWmruxMdQeu3SBDyRlCb/HiZSt2nCN5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgFcgI79i0RuuSN3E0ClT3nKJ3ZEXtntKUbK7ndQRSPOFkhCo20iJK71jBZderLji5Z1wMXrLExuPdeGiQXQQTKWL7rfsrPfHF3CTZq5ld/uWXAV9kzPJxnFAxGqwkkXNcm00dzj1K1U8jOAafUODl/6LvVCGtV1hCkGFMapTuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLeybZF4; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLeybZF4"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729c4030f0so2980912d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790615021; cv=none;
        d=google.com; s=arc-20260327;
        b=S9z58XwlEypDa24rYLlRkni7kcD2hQ1W/k6s/C5mPfGZybe0nMCD/DvvZaTD5dc5fj
         XVPXjm4sQwV7Jd8ks+YdbOg2BRpiCoJcFaAQFQkZEBlwhVib6FyA2ZewBLEauZx+1Ucq
         fn4FzwPz1w45pRRyuDhSYmHhv3UwM5+iiyH/nFchazJGmG216DdJt8W4E5jRzwXzoBjK
         Rkew6cFi8D6FiMkEc6xJeXHHV1WFlm5PIMYb6eqklaQD3PyTaE+y8nMpacyOD9M+yDwQ
         G6RD6bw8IYdmaPeCxZXROnWeuqapJADHafd7oSGmZwf/eOVfYbumY9Su5DobGtDfSk5/
         DSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        fh=I2X3JkBkLIVNz0PiD6vWA1qbFdCgYhHKeEhd5I6Ho7U=;
        b=YHwfCqs4Cgke9Xj2Mctcn6JMVAck1eyIu/GOU9IiAdIJesoYBvsbz65l6LxQDOt47H
         pu6Np8Eq9bb9A6zK0osZRshx7450WSm5azu/c2x8YXJkXJUd1BZZ+R4bQFzuQcYfeH7f
         nTSC1OGu8nsLVm3rybwe/c5w+jTke+tB71AKLr/uubnQPLFWbBdcv7yHDlTlG2DZsoXM
         eZxp7vG6otBEiJlycAXHV/a1Ldeg3T+MUKkyAq4Df3yfmanvgeIp9p/mjIQV24e3shQ9
         LFI+Ng4fBKT1/LjzwOpCmgcs7/NIvy/8PnMvLMbHHJ7KX68CG7W5V0e8D1Xk/3zWpQ1+
         teBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615021; x=1791219821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        b=mLeybZF4o5R48hMp1zkGZ1bObc9oI5XxUgmdmWDp0zVHcm1PNjtkLwXMnag67i3ytR
         pMxWcd7OvI7L7tCj1l0sJkadZ3L9vSkL9jkD5gwITn9q8P7WIOsD6BxlvPM5EpCzQlXj
         qqEN9cZ0EZT+HlNShYISj3mhy0lrQMYxNV1IseKHSyx9XMknXjCsFovqGwvqfcklud5J
         qygTFgOOaddIKU1LhHBgGAobtI+RfbeCEhv1mTH1MgYihvhK+BXSJxFUVy06MP+Ft2Pa
         j2J9Z1yeUr/vUlcp/eNUvTMgduEXyB0l/XAhtEtqfAOV9KfR3ggzrj49HaMeECaNQusr
         EH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615021; x=1791219821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        b=z8IZlbPSTo3cLe8tHsdVGjdEyfiJyh8GTmmTvJR2NXvSiaaI9Zqc7mm319LhUgDETd
         61hG8RPUbwc4YBlfkVh8j9oPkxNwn0y/+qRof2lSo/wDJsUu+bmNAQp1RTN8AkuaU+0H
         +sIv5geliXF8qLzhLK/k0sUBScv0u4b0ZFClV+0xW4W+1l27h+nI7elAzaUGvxdtcECU
         O2oEUQxZzCU7fyquFcnEEOCV9PVMD6eCJ+ULp3DRRTJeoIlI1n+5ESX7tTZtmheqZL4T
         da5nyeoa+AIKfWu5YRdPHkK2+MiJtjlCCC40gAUnZIYRVFGTgsIC/QseDpu3gBpUy2dH
         5AIg==
X-Forwarded-Encrypted: i=1; AKwUvBwa/dYyc7JPss46dJ3F1DRRGnhQn65a+CjbIWio4n9Zen8ch6DiClsdGl9tWZIVd65EVeF1pChbwnK/qYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5sq0e0fDSIdB5m0pEdumJ/AKotGolqXmUbhsQmKZDyRiP35WH
	rGIpCPWiXHlbiHBF2c1bxd7Aw68NCNUFd9qunQKIQsr1InZGmBdv7KFSAraQZzdfBLTe+Gihy80
	MtIVOzgTQ+wKpYDF+p7cV56N1u/FpITIC73TIvj4=
X-Gm-Gg: AYBFou3gUj0ie0xH30qFj19D/Ggsg1m4DpyOpe+kvkiT4I1iIvgITilQKvcu/JII8ea
	foAQ6ocJ36ZzTARWSfRzXabgBjoZ7DJhg3EZX5XpnNZk5raJiTPquQ/ja/kz/H5AJWk5McFy6ub
	rpEK8ogxMvvRuKadZVTAoJrRQiuNXsMSoBBiRbXi013rroRDUco/U82o06zRMEVgZsCr9S0TkoN
	zAJ3wjdq2CGD3S23fzD22bxHG1TeXB6G4aT8eg7ytCSUpDEKklJvYCgaA1SeFAfyNvkqNRAqJ6j
	tNtcJ1CN5KWpo+AR+4c4en5eAMqTr5IVi19gfCa1DdlNHXyOdvbvP+p1sC2QBBg18LZE7u9FcCR
	dnh3H6FX5KletBr/23cmKTZcJ2Gqnqoc9l7/OfeTeFw==
X-Received: by 2002:a05:690e:148b:b0:674:a21e:bd37 with SMTP id
 956f58d0204a3-674a21ebf7bmr2328093d50.31.1790615021131; Mon, 28 Sep 2026
 10:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arOMTa0L7QhM5RyA@sirena.co.uk> <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
 <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com> <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
In-Reply-To: <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 28 Sep 2026 13:03:30 -0400
X-Gm-Features: AclHuK9UF_xa2rnFnhmSVp7Dtg_WhARNyORcRxoYaHRjYw0Vfk55PTq37EeuSR4
Message-ID: <CABBYNZJKahHw_GXhiPKYH3_br7WWydH_YjGDJ4LAwOECLG4c2w@mail.gmail.com>
Subject: Re: Missing signoff in the bluetooth tree
To: Mark Brown <broonie@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Sep 28, 2026 at 12:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Sep 28, 2026 at 11:13:19AM -0400, Luiz Augusto von Dentz wrote:
> > Weird, this should have been fixed in the last back merge, going in
> > the list of commits in bluetooth-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-nex=
t.git/log/
> > they show as:
>
> > commit c9c15d4d8956df8c564f7c210e4dc5b9b820d97a (gitolite-bluetooth/mas=
ter)
> > Author: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
> > Date:   Tue Sep 22 18:33:11 2026 +0530
> >
> >     Bluetooth: btintel: validate DDC record lengths
>
> I have this commit but also the older
>
> 4712bd9a14cbdd712fc8584f18be332b9ceb70b0 Bluetooth: btintel: validate DDC=
 record lengths
>
> I didn't spot check all the rest but there's a bunch of what look like
> duplicated subjects.  If you did a merge then both the fixed commits and
> the original problematic commits will still be in the history.

Interesting, so back merges seem particularly weak regarding
duplicates. I wonder if there is a merge option that can eliminate
duplicates, since I don't think there is any value in keeping previous
ids if a new merge changes them.

--=20
Luiz Augusto von Dentz
