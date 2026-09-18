Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86A52931F8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760219; cv=none; b=UsQ9dqURGCOkS8SLV+jjiuGDoCAi70ajSd24PI7ogJ2my9C0ZhCgmE/cwdot2wiP1IX/ibImVIU12r8G90Eg10Df3KkMDCe20hxWme5xLDHoFP4z+R1HSnsC/1bFR+jXhNJDmaNNCK+ULXYFodbvwgSWbxZzRUWjqgrymirZNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760219; c=relaxed/simple;
	bh=pddCZYVBu34SkVblP1s2Bga7gFJ3LP6zGYOVyxyjg7w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=P6eJIuA80eUPeQT1WjFdW0RJlDO3AclH/fbH0AQuCEogXg4V103xeIBLxxTUwKQK/ycjqjap09il5N1Jp4nwdm6NYfTgnX9MgoUL23/74sZ1/l1jlUy1cmA1dbvOpjUeNjP+PPQ2oGgUHUWN3q+bk/C/sT02dY2Sr6JBRQiTyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XBGK45w8; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XBGK45w8"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 68IJaTv41334787
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 18 Sep 2026 12:36:29 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 68IJaTv41334787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1789760190;
	bh=G3hs8D9bShL73XT+7nzf3nWWa04Ex01dvqSmMZbxI5w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XBGK45w8yafepAn09hCDXPFtBcKXcRHD8f6+4OzWk+INqGWy3R8vFd22M1LvVxxib
	 DG4cFtqNip98zphQwYLlY6KUwaHpH2HEejhvFYvLUfdhGUixTXxPgTT9C46o20UIPZ
	 2axyxcuhqYX105BfZFb5J+1nyukhkC8fFBcnjoRUkoHHylEjXA38NigCLtgbGGZRt2
	 +EdI0LQd/SVxp+ZEe0y/6YMa68EXEegbQ+i4nWjRV6msgjF+UHCWCB5JYZ0aVBM75t
	 yqmAYffva2h+5+88ayV7yPFEDxFbzxJof+q+4+SqtWSo4DCKBJhRkispGEr3GSV9/S
	 Ir3OQZzk1ifeg==
Date: Fri, 18 Sep 2026 12:36:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Alexandre <alexramos25.pt@gmail.com>, x86@kernel.org
CC: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: Question about "intcall" function
User-Agent: K-9 Mail for Android
In-Reply-To: <CAKw2PKFc-OtXxv++3VDSaW_LUh5T0asEjbWiwz1R5Ai_KvL2dA@mail.gmail.com>
References: <CAKw2PKFc-OtXxv++3VDSaW_LUh5T0asEjbWiwz1R5Ai_KvL2dA@mail.gmail.com>
Message-ID: <F6B4AEDA-6BE8-45BC-BE45-F8A4E0B64AFA@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 18, 2026 11:46:20 AM PDT, Alexandre <alexramos25=2Ept@gmail=2E=
com> wrote:
>How can a 32 bit C code call 16 bit code functions without any mode switc=
h (CR0)
>
>arch/x86/boot/bioscall=2ES:
>=2Ecode16
>=2Esection "=2Einittext","ax"
>=2Eglobl intcall
>=2Etype intcall, @function
>intcall:
>/* Self-modify the INT instruction=2E  Ugly, but works=2E */
>cmpb %al, 3f
>=2E=2E=2E
>
>arch/x86/boot/video-bios=2Ec:
>static int set_bios_mode(u8 mode)
>{
>struct biosregs ireg, oreg;
>u8 new_mode;
>
>initregs(&ireg);
>ireg=2Eal =3D mode; /* AH=3D0x00 Set Video Mode */
>intcall(0x10, &ireg, NULL);
>=2E=2E=2E
>
>Kind regards,
>Alexandre Ramos

Because it isn't 32-bit code, it is 16-not code=2E
