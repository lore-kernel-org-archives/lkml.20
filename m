Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29DD363097
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252723; cv=none; b=aldP8ve++bJwIn8NSa+qh/VfK0Oam3KFd/1Q+F2Ri6jEk3eEuDlJuHbWMuJaGoHCulzcMjdZRqhXDNGWf3aEqWNgLDbR5SuUjjvE8dBwzgHLI6ifkoaTDFz7mSy3f4BhQdQOGXYd4ADMT7FpbACXxZgUHwmOlXqXlTJsHUHb2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252723; c=relaxed/simple;
	bh=RtNfiVjW9DnfH9WOwSs0qkpDMTrolnRY0ErCylUYChY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqp2hutZMNF6S454Qh/iuvZIiWJz05rqlKh1IUz/HHVoRclSV62zdny8TQL1f60bTM+GbeblbCc8EbuyV3xBavSQfMSLRk76teI/L5/g1fUxGD1RA2HoV4AcorPm9YFhTg5+AlPVO6yUtPjuC3iQh84CMBbwhDGUXEeWLpWvKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHKaAoNu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHKaAoNu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so6199155e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252720; x=1788857520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDsOySodWxKL+2hHKXt/WFKvOj5lnNfss046QqcJo5g=;
        b=XHKaAoNuL1Giz+WanYaxlikWn5WR2+Sw4iqIANsSacVT/jxLRxQhGZu6gYwjKLsTY/
         nW4W0NCSZ0+v8iR3ZWy3X75b+Xa9DAU3j9ryq9Rdik+VJ7i5UbMgwqeIc1vVPT5ivpFi
         VI3IZwBrsQyXtaDukUwmKZRl1UP1vttrjoCN7O2+ltCKFe8fAcO1A9ZlfJcRDVZYwVOg
         /j8sc87nhEB7iWdpdpaSHj+jf7kmoo5WEk+AwKyhhsNkuRXYwwSKaS/104tktwvvtFZ4
         T6216a1r445rLHmeu7QIf43i3vn8X7mSQTOWmp9Rt7FdutkVrSfaaVjfbIi0937m38eX
         Ndng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252720; x=1788857520;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDsOySodWxKL+2hHKXt/WFKvOj5lnNfss046QqcJo5g=;
        b=UpHWSMG4wrTTGoMXXOj5cxZRasxQCikMozs+eet+bDBIzfuRLm4NMzFhjxevPEl4su
         WzbMybl8hGx0AE1jkqO4/SLBXskVfVIu0Av7zIB5yMwwcqW43EGvVjzJ7Nog9YByN7Dh
         ChXqxY2Cu1CT3GJgVF527oMx13tgjqiHlS0EntJK8tw/Zpxx+xScYbaBiCZ6XorawYqw
         dc3Lc3omJyboIsNx1I3U+vKmS1nHJulcnLh/w2fD18T0csLndRc7aghm066vyS/K2Ome
         UZ5lfH6QyYon1OP9TnlVu2kgaY+lzKjJr3CV+oImhrIxnil7Jah+IqvwkgeMJ/+AQs8/
         2rjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9YnTOCp5m2MlJ5DSzvMcaK62CUqW4HHqMwGffNXctk2F4GFCV528wJJp+kpcpsf0y8kB2HKkaxMMhWow=@vger.kernel.org
X-Gm-Message-State: AFuF++lTorjm5Ff1pEFpWWLmF0rT858X2y+p1Zmo9RdFd73BANDWlhkL
	HnFmAk2BHYwR+xaIhfc+gsea9vv+oXBjt7Z79BzO0RVMBSrd9fzMzpQS
X-Gm-Gg: AR+sD11AOzhubjisLcyZzUTuJ9qtdrRYHklzqN/HbScwDC6GKtvqnuvtoMk95U2UWJh
	MJW4McPm+92VJ9+0c/ySye5AreEW+NRCuBLt3RHR4kyZs5TTKT9Q3F8wWTNEtWIwi+/lpMCP7s0
	SSWsBtlVnlft17vstWvqyhn+UzuMWDLxptXPXMF0CktYDdgKXTqycukmbtZA0NSfVZep14ibX0T
	M659prkOhzrUK1CLH8DW1RP3vqc0sDYx+c3vgwIvJtPM01VW6yRhnWVkPW5jlzqDJU3uzyhrrNa
	9J0DwE013Kcge/mO51dCDThhC7JPzOLBOpw2rUh3bfZ4L9dgji8KUDSRHqfSqoJ1mwd80rs4VA0
	r+5gvZ9edKMz/Ut1jpEI9Rqeiil+GjCMymrVCFnKGfCTkwkyj8r4xFt/wHsXd2FZjN7eGCkUqTl
	m2p+/GNhX3f5URat87Vvmy2h9enGfgWhYhn7WuJNGsT59d6fE+f4HFDBOuhbGN1oYeFoKxFlzBZ
	HUdhtmM4WEAlKbVGRaFpfDZig==
X-Received: by 2002:a05:600c:8b86:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49b91c5446emr497972115e9.15.1788252719695;
        Tue, 01 Sep 2026 01:51:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e70csm3291613f8f.36.2026.09.01.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:51:59 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:51:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/nolibc: validate directory with O_DIRECTORY
 in opendir()
Message-ID: <20260901095158.2de73aa8@pumpkin>
In-Reply-To: <20260831-nolibc-fdopendir-enotdir-v1-3-8cf0e79c4e6f@weissschuh.net>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
	<20260831-nolibc-fdopendir-enotdir-v1-3-8cf0e79c4e6f@weissschuh.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Aug 2026 18:05:01 +0200
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> fdopendir() requires a call to fstat() to determine if the opened file
> is a directory. Currently opendir() inherits this extra syscall.
>=20
> Switch to O_DIRECTORY and remove the call to fdopendir() in opendir()
> to make the directory type check cheaper.

This should probably be the first patch.
With the changed fdopendir() it leaks an fd on error.
It also fixes the errno return.

David

>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  tools/include/nolibc/dirent.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
> index 25fbff208998..2dbf4052b85a 100644
> --- a/tools/include/nolibc/dirent.h
> +++ b/tools/include/nolibc/dirent.h
> @@ -55,10 +55,11 @@ DIR *opendir(const char *name)
>  {
>  	int fd;
> =20
> -	fd =3D open(name, O_RDONLY);
> +	fd =3D open(name, O_RDONLY | O_DIRECTORY);
>  	if (fd =3D=3D -1)
>  		return NULL;
> -	return fdopendir(fd);
> +
> +	return (DIR *)(intptr_t)~fd;
>  }
> =20
>  static __attribute__((unused))
>=20

