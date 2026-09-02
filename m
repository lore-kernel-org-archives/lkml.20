Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484323E25B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340324; cv=pass; b=FysWwLAIkKzX0meMfaoou0+iN6GZ8WqsDBS2E3Mu2My7R3qMTqq4V+imswAOCnJlX48TPXFxcgWsUVTS+xYpWjblcb06tX4Pjny6WHYCsN7fhqb6fnZHFeAaw4CVT68A+Av9W2BtD3RIJR1vXE8a+rhRkMAfFGBbD1MhUEBzwa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340324; c=relaxed/simple;
	bh=zPIeU2nyncnp4qwag62RzVvPwiBDgS0DFxIK2uUgu98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjMVjp9xvbrCGeeWlUF5D/4ju6LPrUA2Bbs1yuHAN36IF3Z54EzEGEEivhLxVfueW33hw591ov221TMUx9A2gIOBe9f+5hu/4X1M/Ut/tO1u1A27BdIgCH78sPTfWfspOy5rGhmoj6NJkvYe8G0apG6LBBip8/jvxRi65b8hf9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE/lWrTh; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE/lWrTh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso706080a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788340321; cv=none;
        d=google.com; s=arc-20260327;
        b=sdIPV/BmqmvtlLNdLxgY6kqfNbrqaN1CXpcfeG2nRHykb4LGs2Gsck0CnU5ocWVp1G
         InDUYj9V+tmWCaHjvu5sqGUvARaWSqVVtpwhmNCS/EVK0ipvSBD+hdp8lMbHCC9pNeYp
         LddHpE9QlWiG0MmbdAk3ohBiI0lGwpaGkk2TQ0HGIDTzIJj5CTvLABxC6gLkanl1BcwZ
         1k7Dd9Q/+uXpMrcbzXKF9GNDQT7Ysnqhp6MpXSlks8fq542PJ6WMEzQTanvq7yMHkj0A
         y7bUbWC7NIW3H1ac7yuGSAmX4lyfGBs9yGlOujTmgt0NIbUJ6Uu+PQCRs4jv7mjkRo4p
         OqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        fh=1Fw7dFIwPgisyqB1FNFsvJbRdmsJTxT6lxHOzRAMPN4=;
        b=D0gZRJavuRRcrEUl7e1mNlMSDPZSnR8UPrR+4vIqOS3mhgmUsCp/qqJa+Ee0LUEdfm
         0W3CTFsOBgXOT311kl8IZBQioIvNOwc60rWt71Si12PiTNH5kTzqzErRUSXXSoqcTusS
         Dyl5I4Mw3qkRvMbOh9PSOzCY863JRBYdoY4ro0o9sdExlfO2nU3aMEVxDGK54ZAUljGD
         LZZRvu+fKYNXRxC3V0Ntr4DNiEK+Ukd8ilabFD3kXncFj2vI3eDub7fyeD212cztl/Oz
         +WwFwKp1aAael5VnrhJM0x5GWmHKNBJb3B0BvmxGVenionfH8yXFRV5V6T6exRotrT9O
         O6oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340321; x=1788945121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        b=KE/lWrThBxJyVm4GN2jHMT81bex6vHo4GDXQnYEtBkeJrtnwvydRcItsnXnWoblue+
         rpKH43hSbly4WZT+MjqghRwu4tzjoEbvW0FVmmrd6Waxd/A/0JR/f5HbjYVmlUUspWsr
         RKaKKHJIG0EiSP1j4VtolYUf0tyNPvxCmB60H+rlgWkhCL1fmKNOounegBlMeUTL7O67
         ldnfRDgbzu5+NihF5FxFDDo/lBPFqpE5/nCPl/Fqfen0jbqs73P6X+qCRDHnVChx2EzT
         +f7K+U9ZYis2e5xPUiiONchedxEK2KPiHj29m/4HiFukUhKmUXPyjgHIpCpG+yeR1SM9
         8H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340321; x=1788945121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        b=qwIKqrKtyhfy1FFSTE1VfMwfDgmCN23o8JzMnu+aHptMqTCnARjXhyCv9rhnu34rpB
         xemVvhN8RaE8lDRgcol55tn4f+UR/CgKrzyc+NO5LxUqH3OA+FZJRltqnIm4s9So6HYb
         NUmAGcmb14jwWRvXom7SdSpoxLRERH1IfOWLK0rCrWGjKOwKdIXsI6guOEoDyZMlNbhb
         kdPiz2cHyLQxeKgZxjBj3Q74LcGCBOAZTCRv2l6WXrS8aZEROEJs+QBC66nP5cizjj/O
         7zD+8dUE/ZxZFnCQYlKCzoqzJhJdipNZKvezv78o1Xou2iS4ZdmLuC0nDCzUu07/3hvw
         SDyw==
X-Forwarded-Encrypted: i=1; AKwUvBzrHyhmsYyreISYVPLGEnL7/APs4fT1AaQVL7r3EtxB50mCyDzO9gJI1nmf4hDI00QPykTAMWdhaykYMiM=@vger.kernel.org
X-Gm-Message-State: AFuF++klFT0HD6kTwjcmqwNonDq148u8SEMn7lb8uXuOP6hCEZA/K97i
	XIGVwlhHo/lkso6v1gHheiEfMA9+XffyIpFXWK2xX6h9Z5p/ZhcEmsgfCPn9BdbuNa8fMQiJpdE
	Iv6NUq8vAudClomkBI9vzVuqbCZRLpHSYG1qh
X-Gm-Gg: AYBFou09n6N1k/5QdorzUbcxu9ZUsJNQ3lZrRvEOfAk4uKWUDbE/qOVYhB05GxZnt1Q
	AMg55r0UvbRgLUvIbhxKw4cx8K0MfcudzQYLT3xy0PWKjFBm8kpF1hTzrNisVoGWHq7RhchzrHH
	fKAdlhRUCreKJBoqTQKT+FIJirGvlxK02wUNQsA5M19TL6qq+8hcO1TByqCSox8Osvt1o+/ODHb
	f4y/sI4DCJ9tUQJCSg19j3uQOBnTlW1Lu2O0N0TJ+4ypLcnwYFZJ1bAM/6xMovzdg7CQuTfR6pL
	XqgvGFLm48UcFY17wdcYfAaRgSqW4pd4G61xL3MHgdDKYaTqZ2V0gPOmDph7Fp9bgY+3pCNI4kg
	pSysAIIFaOfTON5JcJM1yGDd3p/GSwx8=
X-Received: by 2002:a05:6402:21d4:b0:6a3:f63a:4997 with SMTP id
 4fb4d7f45d1cf-6a682567131mr2177249a12.3.1788340320712; Wed, 02 Sep 2026
 02:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
In-Reply-To: <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:11:49 +0200
X-Gm-Features: AcwNN1W-bysK_UU6D1gNJGL4hkeLn89fMcgmtQ7gQeFBsPWL2yf6N6O3MoMWeZ8
Message-ID: <CA+=Fv5S=N849_UN2AS-Q1aY-34wvVaY56gWY1ULG8hpNV1kuVg@mail.gmail.com>
Subject: Re: [PATCH 10/24] alpha: select HAVE_ARCH_COMPILER_H
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
> which defines architecture-specific compiler intrinsics like
> __kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.
>
> Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
> asm/compiler.h, making these definitions available consistently.


I tested this on an AlphaServer ES40. The kernel built and booted
successfully with CONFIG_HAVE_ARCH_COMPILER_H=3Dy, and the in-tree
test_bitops module completed without errors.

While testing this patch, the FFS KUnit suite exposed a separate,
pre-existing issue in the EV67 Alpha fls64() implementation. The
zero-input tests failed with the contradictory diagnostic:

  Expected fls64(input) =3D=3D 0, but
      fls64(input) =3D=3D 0 (0x0)

The EV67 implementation passes zero to __kernel_ctlz(), which GCC maps
to __builtin_clzl(). The result of __builtin_clzl(0) is undefined, so
the compiler can optimize the comparison inconsistently with the value
returned by the Alpha ctlz instruction.

I verified the diagnosis by changing fls64() to handle zero explicitly:

  return word ? 64 - __kernel_ctlz(word) : 0;

With that change, the FFS KUnit result improved from 8/9 to 9/9 tests
passing.

This appears unrelated to this patch, since asm/bitops.h already
included asm/compiler.h directly before HAVE_ARCH_COMPILER_H was
selected. I am mentioning it here since this patch led to the issue
being discovered.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
