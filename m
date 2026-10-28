Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183013;
	b=XJZ3jdPJCRhRtxIyDVIpg2yZ8X1jnuoND5+WdnFgmXtNXrILZyyrdYoI9ePflkpYQH6c
	 iN4FqeNWlpH/QSUdgTONLmvyj0NFyqkFjkUxdQe+/cNhHGcX9p7baaq2WyFHZi2aYObaO
	 0ftKCLGWHhqIAcCRll3dNaCGpm5MnlmEl/LgqPth+p94A2JwYIiqdaiZ6rLgtpgUaFVzI
	 IZElr9DYCrSTem29h3sOkgGjnFrObIGSiBPy0rbzkMByhO5dQ+NSqAmPeJCa0uRrsXnVN
	 UTsBc3+TEeNJ0ITYSNY/9NiEUcXrh1XBGeCANZKh3fp7T3DS5lrLZue60kYrn61VHHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h7H5p3/8MmY2hRf2o1iZplE7/tq7UTMN+hAVuumZtQQ=;
	b=Tt3ttdniU9LVaJ+aCYwLrAHwj0y3sPXI+UKISfwEOwtvZLsdM0Z1IqsllGxNtPWXlp8l
	 ThWQaUa8BMbHJhGXXCZ3vZLrgDd+rDdfXZGHiPzSzhIqdUN2srfB+8HKJMluShoEEguhe
	 3QaYuY/PijGxeiYBzktj6bXj9z9aeVrRiSLeI6rx6Pc+6TiGrz+e286mtU7fyX/MLBAsU
	 +Ajpvv6y1VN7X/7ClnHN5FmZD/v66yu9krgy8VYKXW2IUxSSQsvTqM9uodFyx4LRHdQge
	 nXtK9ggiMMZzcxH1e0x8Ui8CSf8p/vsAA3+p6ev0gzD1FyP4IScJkPTFAED2XUCMnHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXrx7cNs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE10606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE10606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXrx7cNs
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e95bd1c14cso6257265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183012; cv=none;
        d=google.com; s=arc-20260327;
        b=i2vDQIqRCrNryrKIlBt4bE85H8aYlC70Z2bnB3wKU+oPpJcx0a0/jEdZIqO+rWcl5W
         ObVijP8GYRFNwwCGIlVS8MsPwOhXASNQnmYv8h+/QgHjw1fkv5H0T9UG6QUvLJAt8k9R
         6foGU+ktpjF48UHtfakt2SsD+i+NoarSaJdH/MW2sWpw5DsyHw+EOx86aBBDcW4u4V6p
         6HEC+CzUl+isS6i24EGVVfxZbP00tM3RsLi9unm16YJXSPjzPMTMYUD50zB6/cpKawuR
         sUjVSfNVSvitHJDWuedJf5CXGglwVtwh0Trti8LhKwsh2I3ogwi38nLjHeDt9dYRqMkE
         hw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7H5p3/8MmY2hRf2o1iZplE7/tq7UTMN+hAVuumZtQQ=;
        fh=Xo0mwhANFhFYX2uHyYVmDEZUK/25ruyxGvvQQ4QVM30=;
        b=NZgYZg8uJh6da47nb/mOqT3LGJyVlivFxAaH58yMxuHx47/JyG7bmEo7PM/ORIzsJc
         bieYMu3YdWgznV6Tp58dPrXMPmckUnb2Y8SYH/XW/IglXr0GvMoWIJG5k+LO7R+et2fp
         jaaTJVRrutOAjyoRxGfCw/yQk0mJs9HrKSxwebdKMuZToX7Q85vsS7cT177LowF9wqMF
         zH081yC3jtgYgUbshv7dg9eivcZ7EOrgZP97I9sRVz1hDLQAehNVrDCyppme5fXz1Q9d
         51jteTE5MEUoC3L27ixU2IqAns76JKycGGV577fpAIbkkqjOrdKuZC6xgBlZof7T3scp
         fjhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183012; x=1793787812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7H5p3/8MmY2hRf2o1iZplE7/tq7UTMN+hAVuumZtQQ=;
        b=oXrx7cNsisFgzIbJAbxRsjycjR5P/FTNIwQcCoFXpEm8b5OuGsX1ZAeYcfy10xRWrA
         /IAdNzehwadoWFQ0ARxy6GH0VNgIMsMaeBzyjN6YfwViBH/OX5a8uBnb7C/6hPNiVTAj
         RiHflQbveoBiXlairYL4JdXjOew6ZDuJ7Ck/cFqNtLF8WJLG2tzxeTfqmQ5jRejXW4DB
         NsLSkFEJDfAXwwacbCW8VhzPraBIR/WembaCMhqhf/lzLSreGUCC128Y+T+nWXhyY6Jp
         WSdkpBSdiE1LsKoP0SW7l2j0ujp4qzT+meKsOxzgXUkSIlKg0OKt1Nf5wnawAGkPXOIh
         uixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183012; x=1793787812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7H5p3/8MmY2hRf2o1iZplE7/tq7UTMN+hAVuumZtQQ=;
        b=iCRsL4ljVL1eykdzqtlrYBgi3IltD3N/VtCvTm6e8PctTOlnMd0kv4w8CBnEbJSYte
         aIQLhmqfz/HR7Is2JZXZtxSWpV17/gvoXyIYBQHi6vxsyGZp2NLF6EqY63HBZUqf6R6I
         zQljReoOPI5LWnaHzodOKLqiG0BF+wKY+SGc+SGXXmzSSTYIG/986zoBf/yW5gUCeA6y
         eO6yEyJNsAeRVQU/DVE/KDsH18EQVOZ7QByK2SuHRf1Nr9vbOndrddPocrO1vThQQwg3
         VKqQZOUzZ2AIH9AjlcodlkerNuME1pwi8J+wEP7uW7mAj7Mg4ZYlEQgHwKIKWajMtSa/
         s2oA==
X-Forwarded-Encrypted: i=1; AKwUvBwF9nkKBoeH+iTnGJy4sk90HkUaVqPD+p3fLliBQDSbF/vKsnWNRt7o41JeDTdHXmkRdTPcKnSiLl97c24=@vger.kernel.org
X-Gm-Message-State: AFq9FYJugPJv7f4DL59HPaLtdKCeidX/3SDoFwdy2rKj3lETKqTc3SQg
	kIXJby0FBhh4MJsCLexhaiDUO2wLTmEMfpVdiEUFXTYudZfiE7MZy0rClfcd+uzmfRznvqqgLNP
	3mLoi/spNBgdmzdZhrif3rAgaG+Guoro=
X-Gm-Gg: AYBFou2wnNwits8ve/y//ChwkLuQaXW6hAOEO7gMuBBnjj+IVK4Y95AZB1j1KDwIzHu
	Db6ixuXJJD1PE4KUKINrDaQO9whbPHZSN8eYZLOmNVsV30GErHdEkOSAnog1Uof7g4kmTin7CYG
	j8ss7MQasLylMc2P5f/GWf/gqPwGFcRkO/qQFbcvcylWQ74FHygxTrRh93BztmrgGC0/sFkfSvK
	1sATndBAEF3gnYhHJKXqTGOcUtgiEA8as3A0lyRAkrPJqpfz06XhwHa4pY4kihkLB9xuAY/n8vo
	8HUoKIR4RHugdFzlnPSMtMTQ0tmj6XHaIuUEO+KvHZ3+D4ntUOm7N9x2DjRRhWTskOJSclzd8ER
	S6CQc48I9TA9V6TD6p6FqBy+moCIcD1Ut//4=
X-Received: by 2002:a17:902:da86:b0:2e9:5b4e:b8a7 with SMTP id
 d9443c01a7336-2eb005d279cmr16426375ad.51.1793183012215; Wed, 28 Oct 2026
 03:23:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
 <CAO0HQ0UE5BtevPHHfV9mQo5HoqzxzDDjAkj9e=pD_0AaXmSYFQ@mail.gmail.com>
 <65fd2260-78e1-4521-9df1-b042788ae7bc@suse.com> <CAO0HQ0W3rALzPX59mVONjDtK1otyS8bo6_hGG6og3qwyLepmnA@mail.gmail.com>
 <84d8eb19-4264-49a5-b9b0-733c4e971433@suse.com>
In-Reply-To: <84d8eb19-4264-49a5-b9b0-733c4e971433@suse.com>
From: Luca Stefani <luca.stefani.ge1@gmail.com>
Date: Wed, 28 Oct 2026 11:23:20 +0100
X-Gm-Features: AclHuK-TMMY98rKDlXfL_veOnxxf99WHKRVy94H0MfYOd5RXWKEpFis_Hy3-fi0
Message-ID: <CAO0HQ0VTd-5Pu_4MmNfcOCjd4G20K4L2=qtkOBfAjYaOj0ZD0g@mail.gmail.com>
Subject: Re: [PATCH] btrfs: do not leak -ERESTARTSYS from FITRIM to userspace
To: Qu Wenruo <wqu@suse.com>
Cc: zhiwei.liang@zliang.me, David Sterba <dsterba@suse.com>, 
	Chris Mason <mason@kernel.org>, Filipe Manana <fdmanana@suse.com>, Robbie Ko <robbieko@synology.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 10:42, Qu Wenruo <wqu@suse.com> wrote:
>
>
>
> =E5=9C=A8 2026/10/28 19:50, Luca Stefani =E5=86=99=E9=81=93:
> > On Wed, 28 Oct 2026 at 09:57, Qu Wenruo <wqu@suse.com> wrote:
> [...]
> >>> I don't know what the intention of btrfs: handle user interrupt
> >>> properly in btrfs_trim_fs()
> >>> was, maybe we should just swallow the ERESTARTSYS case in those scena=
rios.
> >>
> >> I agree on that btrfs is the exception, we should follow ext4/xfs, not
> >> rely on some tricky signal handling behavior for suspension.
> > When I updated btrfs_trim_interrupted I used the same "checks" as
> > seen in ext4 so at least on that part it's identical.
> >
> > What differs is our error handling: we set/handle -ERESTARTSYS, ext4 do=
es not.
> > ext4_try_to_trim_range only ever succeeds by returning the count of
> > trimmed bytes
> > even if it checks for trim interruptions.
> >
> > I think if we remove ret =3D -ERESTARTSYS; from the
> > btrfs_trim_interrupted branches
> > we'd align the behavior (plus reverting the previous change as that's
> > now useless)
>
> I think that's would work for most call sites, but there are some call
> sites that we may want to know if it's interrupted.
>
> E.g. btrfs_issue_discard() is very deep inside all trim calls, if we
> drop the return value without any other extra way to notify the caller,
> it will incorrectly return 0, which is definitely not a good idea.
>
> A safer solution would be keep the existing ERESTARTSYS, but change it
> to return 0 for now.
That would work, I think.
But that would only solve the userspace problem, as checking for
freezing(current) might be wrong in those points, which was pointed
out in this change.
Maybe the "old" btrfs_trim_interrupted users should go back to
fatal_signal_pending(current) only while the free discarding phase
keep it.

This looks similar to what some places in ext4 do, but I'm no expert.
>
> But if you have a better solution and can completely remove ERESTARTSYS,
> I can't be more happier.
I wish I could help, but as long as it's a targeted change I'd be
happy to help, but I don't know enough about the fs :)
>
> Thanks,
> Qu
