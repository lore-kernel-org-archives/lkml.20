Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE33BB680
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029467; cv=pass; b=EQzS7iVnZCeYSShkgBVWL1olbAnZMH7dqU1dFmzoSHtNuYPMDYFri8fUwcnbuhyel8MVtI/9d1OskNJVGcL5osqUHzPohE0zON3CCoTU6tkqM8v0MvG+GNEKlfuT5VAszyD587l67ueWSSZNVFOeo2mJGiFqxhhkQRnJplxkljM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029467; c=relaxed/simple;
	bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpXbqry0exQlXznEbCfb+QbKcErPTS7aOnhIPtBGFeRMKJHJ3U8pnWpEgbrtX53/dbUwxX0B0ZzvX9e6//VtS3MTkbZ2H+M3zFbzH8uqXYuJuFNpnYUk2P8nFGBxCdzkkERYXPX4PQfsjwkAxjLqcwnrRt0UeqqDbbQcOXDjLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6wfuOD0; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6wfuOD0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482ea739de2so4602753f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789029464; cv=none;
        d=google.com; s=arc-20260327;
        b=ecS/16KZORo2QVrWCNTEUvXL1mOz2OpP5BF7DQ+w5TLE8MlG1eLWHU+p1m99nePTQT
         sQE/WMr3BW9zt/QitEINvWA4I/TSiLh/L0PrrBLBaMmLqKuihCTaKuqDrsux5pR9Vi0D
         YhElPHCQQS6YzCsyMX4JG6btMeOWUpnqcGSZJ7vHWmUlVkhOcoP7aRViHKj9IAA8ipBs
         qIjI6t7nKFrIruohPlOGS0Uu0sR4KUZnkmIuvazYltkanplcF5iXM22Dispr+VX9UJwE
         l2sM6zRNYOuI3uyE0m/yv6jWJmemOaHofonzzert/Ntb/t+tUGUl47QEpJOHdNfnfP+g
         GfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        fh=TMCZdkoVL9SiXGAD8KuMjCog02qknxl9jV2GpUo/p+s=;
        b=OcOP3zRz5iaLpqBk6wxZWDmDBzqJruws2/fLDKjMHPC/LmtaKXsnM6Aj33ZpiGBFCE
         9l1tUGYsd1/0KOIkzVBxNFts8jd+VWgIOZJawwSvqxXBlNH6A4BAPTXCQRbR1vs7OI4H
         Z4tXMlH7A4isXYd2vSpMY+rNlAsVQdQRrmNywMMN80kGAb+ym5oWcdkXIgVTlubT9rnR
         +aN/3Y0hoREmgJ8R7zQPwRB3fE96h0+KWM/AOqTWMX+38xwJ5TxiQDX+RjCsyldUaYU9
         YQhGMSeDb4o+j9pG/HPHXH69t4oxkYY+3miiaM+PEWux+mZfVyU/5D9BqAs2iQbsYEwh
         lK8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789029464; x=1789634264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=G6wfuOD0GgeSMycPWzGkHC6pJtjh6k5UX+pJJaUn7LNZCxmKnblfjv6WmAsa3lnO1G
         NUCu27CyARa2+vMNtiHi6Jqw8CghBJmYYQSG6//H7GoFIoZGOXVMKubWcCOjQFLaIbrO
         gBCgKrDIE4Oafj64U9IhhNsbnYT8omxsKaMFb9a3mRPevZV34O7OHKjaiSqottHQ+Drb
         XKQ3fII+JTYuM1DvCSLzAxUhdbQPWmNkPPvEW/zyuvtXoRZmVcGu6SYXuQTLnkEPhAb6
         ioC9FP0WspoMVvQ8rTZbhHqStKmVJTRe0Nrq5OkLkixS85uDCUGZZZ8y7w1a9QQ71rFb
         hB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029464; x=1789634264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=BuPI6jSoLOkK3Id/29dW58+c11ybdOW9hm9ucTYbEFVnDYr/y8y6Kx5y1m+9GmZSOG
         9GGEV7U40gc0ofdusU+BdwNBzthEu7sI8g0gy4s+m22QxPPmoyoD6RKkdbezIs6v/X6f
         Nw/fiIt6j90vyRNzIWuomNdRjuJzFvri3D2oPnMb//0CdfDDyJkAQPNZflQ99NqLDjTQ
         ZjPLK94veO08PsOV727yPg9HYgzWbiNgymawG3FZAZoSPDzZ9ziHyLyQrdoaYTHCr040
         1Ze4lWr33YUUtw91gr0qEccPdjWTNm7FVE8yNeefG39ziyqj0bBVZfecTkLqNXbrVl/l
         lpqA==
X-Forwarded-Encrypted: i=1; AKwUvBxhmWJExMNg0quKGjY12rGPPYbuzNHRBapzAA3vLh22/qa+s9iscfxMjmuuUedl0viCg3AOc6tcZtrUxQc=@vger.kernel.org
X-Gm-Message-State: AFuF++khvgsZIOEZKV2BaXBdlB/YDGwzRYheuKMTkTuLn6HKRYwIaWlq
	fFTbDV/nJ8wHn2rtD7vOjd9M6qkbzzMNr/HnoafBvYSPL+HR7KMJ3DNqENVUbqkWABoNBre1PhD
	bDjgonEmNZ9KhM/Mqlao5T8VpvuGFA9Xbecgq6hui
X-Gm-Gg: AYBFou3xowu47lh1FmxDbytrcFk9dklL2nv9w0nbKPD6kmrAiF/tx5jKAHYPPnmZZft
	L11TWA5p7xZD6er95BrvkvkDYieolp2rxv+WV3qAD4zVws43L/YDEbARwH6FPEiSNNkUxCzxPK8
	0qsFSXceFw7eSDORZxMei2B6WobS4gX8NPRfe7MUvWecILsiU3/fphk6KpvmmsNv7Rgzwe1GjFN
	CzFLDeoyRIZqg+ZH8PMY9Vwz2Ui8rEFOKy3dxU39O9MUSab4iBp2MIv3cUYumCF3C6vJgHpzz62
	kRLWWEpa7Sb8zoy3mxzVIm2t+1R0qeLhZqV+f23O7pUmhbH+H9//qXqRfG6ut57KzOiSdL+vPQM
	tQt2xrD77EK+PpeVZprl/
X-Received: by 2002:a05:6000:4a16:b0:485:8c16:a361 with SMTP id
 ffacd0b85a97d-4858c16a757mr37879090f8f.57.1789029463048; Thu, 10 Sep 2026
 01:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826131213.1820408-1-beata.michalska@arm.com>
 <20260826131213.1820408-2-beata.michalska@arm.com> <aqEox8rYYBcfxtrN@google.com>
 <aqJqICNMitP3JTJw@arm.com>
In-Reply-To: <aqJqICNMitP3JTJw@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 10:37:30 +0200
X-Gm-Features: AcwNN1XzpH-G7K26BQl6iCpALzC0tIsAPD3Utlt434iR5Pwrv8_DVtOsPo8QrAM
Message-ID: <CAH5fLgjWcO5fTn3fRwdt8Zh8U+AubtHfVuNOUCnm0U8HjJe61g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:28=E2=80=AFAM Beata Michalska
<beata.michalska@arm.com> wrote:
>
> On Wed, Sep 09, 2026 at 09:37:11AM +0000, Alice Ryhl wrote:
> > On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> > > +/// Result type returned by runtime PM callbacks.
> > > +pub type PMCallbackResult<T> =3D Result<Option<T>, (Option<T>, Error=
)>;
> >
> > So I think my number one feedback is that it would be really nice to ge=
t
> > rid of this Option.
> Guess this can be done. And I'm assuming that's for both Options here (?)

Yeah. I'm thinking that one approach could be to use the AtomicFlag to
track whether a value is stored in the container, and possible change
the Option to ManuallyDrop. Then in drop of that type, you check the
AtomicFlag and only if it's false you drop the value. That way, you
can take the value in/out of the ManuallyDrop so that you can transfer
ownership to/from the storage.

Alice
