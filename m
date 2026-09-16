Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544134BA42
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571494; cv=none; b=A2nUJR7kKolVI7i+ED0KqJLbJpw20MEy2YgdSXzOQQpguZTAGrhrKHeWxLcx4GuF8aIlvMi32LZI2fitUmO/Idc5CADz8Fk8etTm99VHCS9CgmOn3be4Nqke1kV6Pt82B1MX3dB1CGI0XEtteCykKOVBWkVT18I101cQ3XK6td8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571494; c=relaxed/simple;
	bh=KLjAsmeeOIZJCMWKS89bqsF0L69UzKvkBuEnkD4hohs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmhQnGw8I4sBqBzk6WCPaYMyZSJmePjQb6OkjrvH8GmCVDN7pM6c7/i8K1g6LXpVEYwJ+5PkLxvWOFhtt/gh3QmA4TQfQX//xRLpuwJR/pnPP1U5gIp6QYloUpD3MD4rcR/+/f+oZA0X1xDQW0h5m8JC1tqq+ACtPgEev+DoU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=G+SCWkmJ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="G+SCWkmJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1391B40E00E8;
	Wed, 16 Sep 2026 15:11:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hI0MaEUscZXt; Wed, 16 Sep 2026 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789571479; bh=Y4gQCJuCLWVMNjrLR3ITyxCKiMN9VSOVUnFo8wvE85w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+SCWkmJAFBTS8hhZgcJ7AuaYNOFdBuuqLVT5KXFqNDVofnomEL9lP6iTrwhNoYbs
	 xxKjqXyawW6aSPJigEKZaOQUCIFwwGypX9SpS0eLHjrXb0CJ1byqQWtPEJv9D3WCWs
	 el5WEWJ6XvDlHxJlxJ4Wu65N5eFqrr7eM3NLzDFhd1D68luW9RB2Mlg7H7QAVXIs+j
	 Df1p7W/iOpHV8GSqY4LWy8zsU39Ii+YrROwGHIwMhKvx6GhONLl24x16NT5nq3OV3P
	 O7i9lAijx8Ki9L1XV8gUipbE0DeVuX5Y5dPnn6tOGpkyi3yfuxlZES1AqN480lPol+
	 Z1XG4rEcPHrO/9cFWqVsZxyP7ddyNlxQ8OocLL2DnMs5HjbiYGA4dXsMwWEQSYteVj
	 MGtw0nhwd3BOCEPH5u9V5No5eXQ7G3MoUfoBSncwnYxNbn2RQSwX0ICT0gQ0pEu1sS
	 gZ5+46rzemdVWF6npS6n9zDeY1A5nO8EIrySV8BCLlq4TEhLgdYkMu5g98BHGA48XW
	 HAWQKBQCVYAfMez95Pg4V2N5UQ5l0SjjCsIe6Duh3ofPppHo0jZZvy2cWk2Ep/x3U8
	 ITTTMNNG1DrngHKszhpW+g3u5xH2IGjaz1cQKTmhkL9F1FtVnCUYich1WZ3S5G5a8W
	 ydwgRSYSy9DTRogwRhmJEASU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 77B9840E015B;
	Wed, 16 Sep 2026 15:11:13 +0000 (UTC)
Date: Wed, 16 Sep 2026 08:11:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: "yolezz. secret" <yolezz.secret@gmail.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, mario.limonciello@amd.com,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] x86/amd/node: Release reserved config regions on init
 error
Message-ID: <20260916151110.GBaqqxjqPlcUAORINT@fat_crate.local>
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915180543.112708-1-yolezz.secret@gmail.com>
 <20260915222010.GA3101@yaz-khff2.amd.com>
 <CABLVixVbsR1Au=ReUUR2tpzhy0+5L8rm6VAAkrwJKR1ahR1sag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABLVixVbsR1Au=ReUUR2tpzhy0+5L8rm6VAAkrwJKR1ahR1sag@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:50:44PM +0200, yolezz. secret wrote:
>    Thanks for the feedback, Borislav and Yazen. I will drop the =E2=81=A0=
__free()=E2=81=A0
>    approach, switch to the traditional =E2=81=A0goto=E2=81=A0 cleanup p=
attern, and fix the
>    changelog attribution (and my sign-off name). I'll send out a v5 sho=
rtly.

Thanks.

Also, if you are considering of contributing to the kernel more often, yo=
u
should fix your mail client to not send HTML mail but simply plain text a=
nd
also you should not top-post but reply underneath the quoted text, like I=
 did.

We have a very nice document to peruse:

https://kernel.org/doc/html/latest/process/development-process.html

when in doubt and to skim through while waiting for review.

HTH.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
