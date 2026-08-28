Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBD341AB8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936212; cv=pass; b=dFsFxpE542OT76kGhGIZ4dtMNecxR4viEPNIoKmXowp4ipz0mh+iObAbw2fiBRC75E84Esyalzn1W2YFu8hIAUmliB9wO7/zJ9OkSM6KjcYt9AnwqUkUTsOuBM+k/3zBrSDKSCBpL8Mq+npBcwCWikB90TPplzRzdQDXTk9BWsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936212; c=relaxed/simple;
	bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+IVA6/AgL7s9FxYPQkeVTT7tMmSAitcFfKj5dpvSnpSHvmdiWE4M2jIxsxgbQlnmFe3wl07X3gsMIjwMcOwRDiRCTdcxI7KkAKONcijRehdJKtaanH3tQBXNFYb59iy4Y3Zl14oEzb6nnqABQbpIluqFEOE2EAw6XOgzF6xJ/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou2FIwyV; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou2FIwyV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d30c22b1eeso1057335ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787936211; cv=none;
        d=google.com; s=arc-20260327;
        b=jVqMIWZel8IXIKCNFYkDb9S9F+FpEXVCSUEaWjKvEOZCoTwaZDsqT9wViypyd2u8OH
         Cr2Ase0y9ChQUMV4yQYuVLgBJ62XcQuCDZ7vmamCd6LrrIDQ0YxzhnkAlcbTUibaB4pY
         TyYqEi3ho9836osGYqATM1rKy+TNwzrAq58EZJ4c7tdBx/IXdhyQ7mmJ7E8JNI0N60b7
         AvYC/ORqOmDUNL7xAC2Fwzuy/Ox6AwihZ/XHafh7ZXe2wE5OFnEXkRR4y3rQ85CKsyIc
         EuDDr/Kj6xrxGfvnBnuuONGW1jyIdnByrfmLcLnrYXSDwyuO0ahSqfAFcDrcvoosXy/0
         S0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        fh=+YE2AqYTl1kVtGs4qwrTrSgz9hs3wZs5bz6ovV9/kaI=;
        b=KRVNukONdVSWNq34RJVCfQXfFot12Au7K8x0RmQ4LNETtWinV4Nm5pLKzb3bvbGxKD
         Nm8dSp3S+t4FBj/cQomdZclkgdLa74mi74B1TuqeH5z7CfxlGTpmWFOal+/0oVUSk/J2
         8s0qkSeBz4b4ATbeHULDpDNXwYA0qeU5vkEDRAmV+sTb3bhlA/5y0I9vGbNgcaKf7p7W
         3JwbhL5UUIYkW4NBoVoGF03lY++d5Mp2epoCk0zLMMvCfjTEZ498MKZ05hGo8ayALCRb
         DLkr/f/nx0sOwLFZRY2rgb5PnMskMzWu/XCIaO7CChVt7umJ5AAGU8geGMCGT/ksm+fP
         fBOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787936211; x=1788541011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        b=Ou2FIwyVCAORHWLpA4pYi8LJEyru3q3rmtJS1uHfu8HfqN/RIRkxH/76WG6tCrV70o
         /hjlt7ddPZfLVuyw0JkJd5fMemRmc6Kr062++gMO5tqNJdXvV3kES1qDrzKkHo0FCA+M
         XKCmqB7GV/53vfcIrpYElmBTLsNopqh6Gh7XWeOgDfz411eqIJno0V32krOCo+KmdE5F
         jkM35XmZAPUQI+K5BfUlQBJ/vu5EWG3OOXLM0X85U0rie5JlLfSfZVZDq1ld9dzLdmmx
         XMbStLBMyueCq+6UyGxcwNAw99Q7TteeA/gTJg/x2KX8zxw1mBnwxsdHLA+S+ht4tpn8
         j45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936211; x=1788541011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        b=Xc6ejioFdaYiDuKZkuT1lKOVety0Q5PoN4VvwWd4l3Iaxdol+hul22baY2/ePqSyZ/
         d9+yOOGA5SagQfDy3clqFPTCIUVJZTR7CkxcQiD8PGZSMkUB7YdzX50gtCZhkNQJ9dPZ
         BxhR4Imi6zkqbbp7O9tlBCs9fehtcKnDTW2zQiL9LZbEC0y7XzoUxxM+wNb8p/m2T7si
         biXu/hGu0bJlVL7XZYoGcXV387V6fFS9vNOLMfWF+h1md4LQiwMUCMEF1RgEZX42Wgzj
         HAGmktMLwhCMWiHMzUQxjsv4disBH4Wr76vEgdrOSxBU7GecMQLaXoKcPCVvvmOX98Hm
         RQlw==
X-Forwarded-Encrypted: i=1; AHgh+RowNVHyYVdaDyAF8D5M5uBpsTDUNDS9/9nkOV6toNr8NdB7yEiNhga4mQ4AEW+VHLOM0b6UlYy2j05Uzd8=@vger.kernel.org
X-Gm-Message-State: AFuF++nD+yH4cVDrhUyUqqvKurnDdnYffiNtXhfvqz87ZlQUD1T1mhEE
	wkmfCS1wcSfYZFPZ2oz9WMTmub+g/Gg/Cs6Dvdhjahoo8rS0kF45ht02HCmYyX2yWe0HHH4DBRJ
	QE1mT8S5TTIhxbCFI8E7jOw+05bRKxF1egnJl
X-Gm-Gg: AR+sD11OUsgeWFhftU4PxUpMmBq4kIf++dGOOiOqGvojqo/Yfj6udYS7iUnz3y8/Ucp
	Jfn2R5nmeWkvJbYGfjzTc5ALX4POp6bCtKhrMVTLM/OLc0J8gx+g1A8DcuKXhXQowvWRIYliPKk
	xejAazKW7ndteMGjuYR9/rQsKMbZlwu2CaCV6EPByVZCDZvtucSB1LRsaqK3uanDAWQSZKQKWCh
	M3a7qvtnN7ksbB/u4YPKW+PHWmgrSpOVNYHl/NN7wxmbEJmpZBoqS6YkU7p/FEaHbxcIw/g4vIS
	hTiwpRyGSldvA6LmjirYh6/CsMKNkHimHL27YiuOIcswT4pYyaZXUt1AHTkGLIyTf67TL7je1QW
	Oce33BkcNT/V6ffHinyGQ5H6jyHZ+61GTBvfOEpyWxf4+rN1jOlds4J38pCiI
X-Received: by 2002:a17:902:d4c3:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d74df1c3e6mr79183765ad.2.1787936210679; Fri, 28 Aug 2026
 09:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827190431.GA1817346@ax162>
In-Reply-To: <20260827190431.GA1817346@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 18:56:37 +0200
X-Gm-Features: AcwNN1XdgVJz2sbVL9UNhw7YCn59Z59000uRXgELN71Dt05Vgb7qG2OEHAOh4-8
Message-ID: <CANiq72nM+yxePYAD1wM+_Wjhm3E6+TpwXkP6BAK9ZwkuJqkNbQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 9:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.0 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

As usual, tested for a Rust build -- thanks Nathan for these builds!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

By the way, in the table in the LLVM page, it is still has the the -rc3 row=
.

Cheers,
Miguel
