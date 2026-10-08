Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442564F4040
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483806; cv=pass; b=caEwjG5IlzRMiGo+3erR2uEwvuc6z1n0O4tCjN8xB0R2lfqKKlNJEB96P2MUvK50scDNuLxPj63w7Eye4LXteqRYj8dULcdNoIXge2wK3prskYgZ+8BXVyc/rdTxy1oS47NGi6pEmuVtFq4hc7PxbbyM720iaLbQ0DUhNYz/Ya8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483806; c=relaxed/simple;
	bh=Of40/D+2q7EuNroFiUgmRpSmrGdz3Ew/fHYx5vQm+dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/VOMNfA+vU5pSZUOzSfyZBqE7qAOXoy/Y31VGRtEfFqbgJRW16AkTfoscUmunD2py3fOROn3mpuggzggZ7JtrF+vhEwa76RrQNt6d6Thpu3sZITbFO+SDjR2GLLc+6t/HbWVDCpMq9y3LFZQkJZrij+CbtryeTAb3v/WLI+PG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzWY/B4K; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzWY/B4K"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso7415834a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791483802; cv=none;
        d=google.com; s=arc-20260327;
        b=TeZgZmhJnGkrRYyMBOd4YZ189gJuQYO9gi7x2lJajvJkVEIHg2NYnco3gBrfo2ymec
         qU2evAsTwxaMXQxRXSVI21Wo3DkV7Zjct50CrGXCDT7/O4IoQBlzabHoqorP6me8cV56
         IyrTrFlWzOuJ/VOEIO8yYbShEAtpPQ/D+NjHb0qOWecmy4eGMwJFSS016XN+hTcdQsbo
         BMcnJX0AfoIhWcjEwLkpY3OPoFbRqSHpVJMG2i++dviYeXjKYI8L1156jNUBo3w1GArG
         8tEem61opcNR3D55kzkpZ86tinvOxQyb+rQAxOzYdDzXdb/IyfUneJeUiN3U0rvF/gRk
         Q+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qGB3yTtCVZXrcHj1e2uK63lVVVjDF5LreVlgkZI4Tg=;
        fh=oiG7LDfW3gC2IZMWrzaYY4G0wR7qzgmHfcDGDIog/fc=;
        b=TDmk0tk+5CmXQLyUuyA5ESYCGIeoarq/j6Og3/Rq6++l6rfOA1bzSn9MmLOFU0xOA/
         gwtuzSgLB/++EHGBtK/4Wii7UGMW5FDY8jn2DP1ZQp/6yEVWdDCxaW/HTepZOwKgsLpF
         TkqyHEeY8OG8fGurenWIgxRYLfqlayI5bAe07Ugar+NdLBqJ0l1JNAVF2GPNJInvfPWL
         ZOGSiXKMpxCbmTXMe5DXt/vpi5sw+cpLdfhYzPnD/BTNtPY+hnehI7Gg3Tr1BEHVF+sf
         JwVWMXixEo2GuORqdhMUvcNLLE4IJwtNLb6eh2Sf1CJjSL3Gz7pHHBH6ksDWxX5EKmNm
         VnBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483802; x=1792088602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qGB3yTtCVZXrcHj1e2uK63lVVVjDF5LreVlgkZI4Tg=;
        b=TzWY/B4KvWsgzmObIAZmNHbTrlXsmAG6OR+fL7vmQBtxa3eXDUgmkt4RfyarQtszHJ
         UjWcfVm7WlufvVCxuvOCQgYjpHSeApakemW7RuVduFZRBvyFugP0p3+T08A4Pxk5PeO/
         Gzd5mc/bQxmxqsGT5GYo+Ggl1/ncJ7OqOT7phm+NCq6TkZjCsW2igzexmYNsEngLsMoN
         bhsfBD22/IS/MEz9AAAHKFU6McUVaZLyR11/IpDFV/edUSdBD979ca1Lcd/3Dei63ubJ
         4b1EbPaiZWc7SJEOUHm3CS16lqb+22/BX/kYv5n48BIrfhlznedte4iiBOvMve+91vmQ
         VuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483802; x=1792088602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qGB3yTtCVZXrcHj1e2uK63lVVVjDF5LreVlgkZI4Tg=;
        b=sHtaYpT6avUhPTYGjlmjpJ4/bYl/Z3Radb3d5tzssE/B9p/AvqkpyXxKacUWnNP0/C
         IP15GQf66a9LTz4o0uy7vcDGmmiWFQJ1SBEMIyHrPVvQF3Nft/g52M1/0OmIn0c3zXlh
         1ltX41a0Xz8WKmPcy1e5lvKUa2KwdFXLHoOLXKWxFlyKcv6M07a+RTBPQ6lJi9slvVat
         907AUeRfQg7ym+dYpuXWUAZnN2hwP5yFBLewX5eU0G/sY6/yB4FQfDccJXtgpqJgJUwq
         Io6xSMCq9fvfTHs0oXUuCF8i6ygaOC6wNsV4G4bcdY9CS5d3ZgdW7V3bBVk5XsOoXO1h
         lhIw==
X-Forwarded-Encrypted: i=1; AKwUvByAV65j4mUHeXhyEJjXessO5IgKvpZPOdq0E5Y3MrxgvFey9T05M/FubN8FObdOPyUkah7CaDr997eM8Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPeZtWCiveJToYi6v8H7dAxLppV29Na2tLZfWh9URfb+vlW4kd
	DLfzn8xdo4vh9l9NlhBUelEzHPOb+e0z/xqeBvLtXe5uq1E2pp/Piu2bDKYV5woqdG1oVHeRiqs
	bpgsV3fuqjqB3OOZY+v4dWZTv9dKlTOA=
X-Gm-Gg: AYBFou3Bzd4WyEupTc3Ryg8FnBpVEWdZsdmDIaVaCHFvtU+gegyafnmVe7vy8XoBdND
	6V8QssV9SS+ZFoqCZU6NFhdVCeyfhUMjbFS7KaEDiCDFnbIN/oTdKV8Xbs3r4gXBTxpy20r2cP5
	O4nyd1jdAswACm6SZ1v80PRJOhmRVjoyH9fRLbFSizhLZzHCkkmW6No8hQGMAbVvCHJHVFFV8Wc
	cvY2T1e8OjqR1aW5lKOjTtj1P/8gxbYqDw3Jstj4N+QIkRp+YQHdT0rC3endMrWBhgbQeqThgDu
	kxmOLjkcdtoEAkotP1HnAQjjs3YEBlsGVrYabi5R+5IwSAffQTH/iRiWlPTTRiR9TCIicOIBKHP
	tE6PGuCDQZe+0Os4JE7EUjT2JSKSq0A6Gk/im16RHmg==
X-Received: by 2002:a05:6402:2348:b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6aff28fc46cmr6370997a12.21.1791483802293; Thu, 08 Oct 2026
 11:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002161515.932316-1-linmag7@gmail.com> <20261002161515.932316-7-linmag7@gmail.com>
 <20261008095802.79671bd1@kernel.org>
In-Reply-To: <20261008095802.79671bd1@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 20:23:11 +0200
X-Gm-Features: AclHuK_YT4n7UtkmP7VNOeDIFq25O2F-pzFmRQ2myWVzNADzZnCn6eteznczwqQ
Message-ID: <CA+=Fv5RzceCozPFvpffbgoiV=V6t+mRxgk+UzF=TEBNO9aaeUg@mail.gmail.com>
Subject: Re: [PATCH 6/7] tg3: normalize inherited M3000 register byte order
To: Jakub Kicinski <kuba@kernel.org>
Cc: sparclinux@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <mchan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Thu, Oct 8, 2026 at 6:58=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Fri,  2 Oct 2026 18:14:28 +0200 Magnus Lindholm wrote:
> > M3000 firmware can leave BCM5718 vendor registers byte-swapped while
> > standard PCI fields retain normal byte order. Match the Fujitsu 10cf:16=
5a
> > subsystem, IKKAKU model and swapped revision/product signature before
> > restoring host control; reject failed PCI accesses or register readback=
s.
>
> Is there any dependency on other patches in the series?
> if not please send this patch out separately
> --

There are no code dependencies on the other patches, so this can
go through the netdev tree independently. It applies to v7.3-rc1.
Booting the M3000 to test it requires platform support from
the rest of the series.

I'll send this patch separately as requested, dropping it from the full
series as I send out its v2.

Thanks,
Magnus
