Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B548A8C8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563512; cv=pass; b=AFeUbJ2vo5UQXnC38cr5+eQeQUK3cJNtDkp57U4MtBQnZCFKN3GEoXb2MG003GjJgFuccy6exBZOVhtLENxEu5zggJzdJef/K0kY5rHft8jjeujFFVfRHriRT258kNht9J9yOOz9qjAW3G4gWJo7nwmp0zteNlXbDq+UxGNVc4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563512; c=relaxed/simple;
	bh=/mjyagqjzBIPiNIfNt8gfb1IfwsXLdjJl7Bs3jmevAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdOWykPnBlLRXPtzJNlrT47whSi3WyNVWfHwn6SW4sv6T4XCWpZywAFj1iBscQ/v/DaJeRl3GPRWnwvNYC9Pf4PjIKjZg+wf4PTS19Wpm2SLRfU2RUTdKRjqQlYzd3xze0WBs21iuB6m2gulCDarPnhz0ai5p7n8ElODyNYl4dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/3a6WyF; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/3a6WyF"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4e4979c47so73135a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789563507; cv=none;
        d=google.com; s=arc-20260327;
        b=OC/AydVYRzGoUOcWH96rcP2MMZLFvBv2f7pYhJtT2U6Wi16Aad6M4tmZJO6wokyyTy
         IaE/DEqzrpaKdKZMmb/icWVdHXP6ie7QQMBjiiu00otZfY4sauogI3ts+ADHBaXE195u
         l7K4pLHNHSvDKLGVILGU4n+LTh8MNVZSBhtbxaIaF90fgYOoxojIQXK3nxZSn/VYEAOn
         dsvEk7sQkexT2S/yPcAxR29XcLK3JjiIXSjPexcGMR1Bga0VgyGxhKrlwtTdrBEyo2cz
         sxziBulupinBpI6Pr/8b/nQACtswyZ864xiNDsrRhWLYNtX2GD/UkG7g5wxB3gzoSzEB
         x+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taboNxxDOZthWI5pM3+xrSxYkOe+RftDmUoRh815eTU=;
        fh=SQ5dGqnArNXqtWqw4t9N27F8qNzIvhBojATZBOQ10d8=;
        b=VqoNk6itfS2WGj4eFaxzgYsAF5WeIzcgCqmqSdnrepuq4VaWRrVxSduLO+fsDkPtN9
         DdXUCHm0sd4PZL2sAyoirp8Dcmner2K46Gr6SZQkZvDqi+HT1Z3lez0lQ4IAUQ68RZam
         VUNlUjIT5flB4oxq5hBWCDCGzk6s6nf3TiapasjcXhq0p0rVV2fQztTh/5NHSewuamaS
         3bdixaRwdJ4amDE1QM/SbA2tjzz74Nf6x6blBWqTTly0uOiqLTGBJwtlCl5ZoKWlTWHZ
         J2FGHgLtSnJpJ38hEvz9k/k6ICvcvoNKgrjUZA7XF6hB/9JmTOIu3j7XTUfUpSN1uKVD
         27JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563507; x=1790168307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=taboNxxDOZthWI5pM3+xrSxYkOe+RftDmUoRh815eTU=;
        b=Y/3a6WyFkr/CktKRpp3YwLjfjjp+AsE5TS3CrbWGpda7hhO+xfE88uVrw7cDqzt+gb
         aGUcIHRzULpsYMSUkwTpeTGWTI/kfiztzzfULmdASOxbcz9axuyCZB9+/pNyb5zVYqZG
         r/89qMiRIbrXBbBwfuLeJ67EEPitrcYo00MsvAS57W28qSGX9/+J8ndZoka4LQJeZVp4
         7Z7uRzAXLqPj4TNpEv2n9an4R3sO3G1TyfeZpKW0vyUiWvlKv7Nx+cG99ugonZX8YdH3
         ghN07AoyPcuFYDR9+6MOt1mWtNy3AI/VV+YzSro/CR6LGI5Il1zXn/1A06DlVAvdFTI0
         i7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563507; x=1790168307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taboNxxDOZthWI5pM3+xrSxYkOe+RftDmUoRh815eTU=;
        b=v3Cbq9DhsfvgLK8Ja4OfRDanGVfD3asnlgA1gMM7IkB46QaygAgrzLHlOU24YStuhf
         pOX6A1vF9KmAQZzG4yubgm0gbYBHB2BJk7rRG+4cXZnTRFQ0gx4MAUkyz0MLoGNZ5051
         ZAQpMEVTq8YtcZB7jPuNNoWZKlMut9rbXy8oY6PPF6PgpLXmM5PZ7PrBKcJDzE20ipBD
         /Y+IY4dfwBvUvYjzAGRQ+tlOcF7MLihWiIjnLx5vbLkdNBxCSVL1BJpfdL6tbBIOkRSK
         14XGQexn9PofTB0Rw+Eex/pmTTDHeWPw9wkh9as1xX+JmhMqSBIweWs1ayfk18gih8eY
         DIzw==
X-Forwarded-Encrypted: i=1; AKwUvBxT89HPdbDVxjXDTeVWJq2+1XtKqsKD/rew6zWtxOOzBSU25HQ3RbiQ7O6bjb27YKtAJfWRSfh4iFhlPZs=@vger.kernel.org
X-Gm-Message-State: AFuF++l9OthQFpXaPz+7gnt8Ou6h/CeVg8/6DSTB9LmF3W3v/+EPrmyJ
	iUeOKLOM+TQqSt1JSgDVx3k4VVskLff0DSbVtBfpPRtWlAmU774I2ULiy8jylmTgPgjpMErVNN7
	dLt0Snt16NdmAe/qs5EWpeJxNXbfsnD8=
X-Gm-Gg: AYBFou293V3F3k8ioXRKmBusA6W+vLNP8mh9jvcCpBEbjk2oce6WSNU905bfnilCYjb
	2Stddaooy+Ym5k7H5yKiczzf0hKjtgg6mBw6rOgVOctRKLHZbJV8CY+MA3QXcGOgbrw5Xch7yqD
	K+5RNo1fjs9mIvKPtRvXuzRSO4MpVAbn4zAHoVlfK986b1fw4JxH8LfLWpc3E44DHN3f6BkXnkv
	JzHNAT1TRJjZOXiD7OsJ97iP5u0h1KeackAKMvFfk8wnM5VPwEq069hKC2GTeNeme7jbbOYRCyM
	r0mGJ/CmJqmTMUWOdIMPEPttd8cDAAbvGHLghVJGLgk2fdTFUNG72uh46lRg0w9axsAdm+d2V3c
	4Fncemv/4UqCLmU3jyjU6cmgWetQ4f3+L/ugUf4Pb2Q==
X-Received: by 2002:a17:90b:4a44:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39e1e5ddce1mr3962699a91.6.1789563507423; Wed, 16 Sep 2026
 05:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnq5_NyBdPbavmiPVdsHkP_Oi1w7ngX0kPSNce+BWN-YkuAFQ@mail.gmail.com>
 <20260915232043.1222-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20260915232043.1222-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2026 08:58:14 -0400
X-Gm-Features: AcwNN1V-eNmnsnA6Vp7fEkglgpoEParustJjkGuxPErPwN3z_wLoywr9u_8NQ0M
Message-ID: <CADnq5_O5QHaUjy+ppibtLjmn-=exK1pptjjnbO9qrn16O1oxBg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 14
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: 062bel313@gmail.com, Alexander.Deucher@amd.com, Christian.Koenig@amd.com, 
	Kenneth.Feng@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, ed@aicharmers.com, 
	linux-kernel@vger.kernel.org, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:20=E2=80=AFPM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > I can drop the patch if you feel strongly, although it is pretty
> > similar your original patch, it just keeps all of the logic within
> > navi10_ppt.c which is cleaner in my opinion rather than pulling navi1x
> > specific logic into the core pm code.
> >
> > Alex
>
> I dont have problem with the code, the problem is that, this is not the
> solution to this problem, as i said in the previous, the solution lies
> in the DC not the SMU (i tested by removing dce_v10_0_early_init and addi=
ng
> that function to dce_v10_sw_init), it is also confirmed via the testing u=
sing
> Opencore Lecacy patcher, which makes the display 5K, and make the display=
 not
> use compatibility mode (4K), and it also fixes the SMU problem.
>
> (https://gitlab.freedesktop.org/drm/amd/-/work_items/4455)
>
> You can choose to upstream this, i dont necessarily have a problem with t=
his
> patch as long as i am the patch author (eg using From: )

I'll drop the patch for now.  Once it gets sorted out, we can help
review the new one.

Thanks,

Alex
