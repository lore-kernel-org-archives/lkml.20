Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67383416CFA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341165; cv=pass; b=pufT6STnkjXhOxTNLhUBbLzCWdKevcM4f3UGsyO0YI7AGtclxrxAum5NsLKIKtBbRJJUuNZH4H7aPT+HqaaPuKSGRUF+QsCK/NRMdp1rHSdiemrDi3UqNwNfDmYldpmtOx+JQgXvJ0r1Y6RAbtdFmGxawJbCpb0UKf2HJmMo5uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341165; c=relaxed/simple;
	bh=cCUWfn06UMRU6TRNAb8tmxA0a3adzcLoZTCZNoCsaoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPr2Sh5r1JB7nAPPXeNxnUDFzUdOqqZJ1IeIU2c42S0GbIzsxRFYFZznPcHM9ibRsgpWv7R9qYuzsU2BXGhUsT63vJNq+CO0iNqHymSNcGGZnBshH1nAzNHLsN8pA50kpg6MQhFsYg/nrMxTZbQA3VdNdQD6L1ylTKRll5xh9co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJTy3tKf; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJTy3tKf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1490125a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341161; cv=none;
        d=google.com; s=arc-20260327;
        b=QJb+des1n8lNjysKdkhfHj02Xaspxkk5lBnvLoGLH9SUaIChkYT7TUo7BK1/+S3DE9
         Jl3KHiAYxoKRAdfA3aLZ1zSkuhZ0VHtfyXrFlurmXe0XC4H1a0cPBZKfgdSCH0o2Ih+a
         lwKWQqdWIl3edM33c/d37j5VOfmkRqMDUWllDTDx+TMUkBOssTKHQ99qdTkn5JLzyEHI
         amrGlCzB3dngSrdwhM+J1x+3U8swycSom51jouh/gyXpjVBgFrwP1mIZ87nEwHkwoOQe
         gREgNQQNH0Fa3Ou0x4TQs+PZbQJI6CjF2m/HENzIj4ncbWXmGBN4xhPVF1lh7MlxnL9N
         87JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        fh=KL/NjOa04L9ruC0+8WhsLl3JQ28jLS2PMo/T3d9nWY0=;
        b=FE61ZwqFW3oWOIwvozMheJvrOXB4sD9cVTvmeYGeDwZI0i7llDYYHhaLU9QA/u7yZV
         aMxW9J5IwKvlwtASzbYrZlgwpJ/v0KRVPLxqMV+jjPqJ+omSU9rK3/xv85PWhQ04K6KU
         eX/rUZ3if3H+PIb4AxJUzR7zPhssk+GgQMNMyH0IXrlT30Ifrz3RZMUerOyt6FM0bxeT
         fb0pYna4SM8waxLEz2ncKGjpPXtJwETJkR/6IyYGlxG7h3EA/VkFbCO0FxfhKAcJM9EJ
         +zs9rfQL6gOxBAEI0wtLp22YTtOAZlo+W8OpbjhB6GRzW0LaQT9cG7EWRGtOZkna7SgY
         XXhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341161; x=1788945961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        b=tJTy3tKfo6CdOzYaFoRb8dtOF4vPhSskwFJf6NiD/oPdgvNaUoOeluD2V7ee1sMRJI
         b5g1zx3sgptRSd6f5473Xd4bJFfrSveSKYVcTvQ8pIPju0sbsDOm0zy45hiUC4h+RBJr
         zJKiC2XrXYEi3GrsBphYSKyDrbIZURCq13NEVxG8w6tJmgAjdWOxJ30jwT4cFT/RG4aQ
         13sYqKivNDP5lsD5kesfrKcBQWQAIPoi//d60YqkvVHZnRW6Lkem8dx8j/aj2IfqR+qZ
         WO5ZgeTi+ESIVmaGs4tM+snI6o8qGcoMdAurqpDh5gfBUvaKDthYYNEvts91qu9Zyjka
         rrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341161; x=1788945961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        b=OkAG17tLoT54EoySooP6mYNqeDqu4zgf+6B0WktFViltbFSBe9YJoCNUtHLVSO1+Ye
         ahvV8sePJ/3v7lpF0VxdLDh/taKE0Hf8LpLXKtYID5Qxp1+2TjSBvdeMtz7HN7pGXK9Q
         13jN7h1s2HHYykxAsuqlMcVGn8uy5fqWLKNXKEnIDTcjvnLcl/sjlEaueUOU0EJ9xa+b
         JUVKxk8zi9jlrtdLbR+wvwhkr3plB0N1OUY53PpD5pPrbLphakMyLDhbLmDq4NIDYuaA
         mWpAzA+T+rBEDXAehYSswlk596bbAoGDiHlP9tzShgSGzghVLOCaan9Mvz/FWtFQDyvV
         775A==
X-Forwarded-Encrypted: i=1; AKwUvBxugIPXeHXMlHuhKT2Ee6AlnYq4Uv3MlXE7gJDSqbW/EAeOnqRw1FMw2qTZNwXig9ZvnsP/LxU2XO5uETg=@vger.kernel.org
X-Gm-Message-State: AFuF++nCak63o8OMNaRZW3VjYEOhmB7mX3AD75jYv77ettEVBIj8xmxC
	pWf37RVyN9sQ6okYsOnSWu521YmIK8Ebvr9d/t4PfBgicM05VeC9E1zz19jUmlkyiWf9wwdPKrw
	yGAS2hH+e0BlH0ZbRIZIm70dDps4oDgs=
X-Gm-Gg: AYBFou1XjB/xAcVI5dn8ZAcXhITpzbunsoxkp0Y/CC4Ykyfimj0Xdykim+KVcX3KP+F
	U+juzERpmWKx0HEFf4/04nF96wPAXlZ6PwteBZJs6N3fvNPt6EEZF5yzMwZXtZrXMI8h4S2wFZ6
	2+k+ja3No1+Gm43eyjIE2OFmT3bgttkuy/TsHIEavvGBFFqyf9G5jGNj+uxCDjgCjHt4zbklm16
	5P9wVGZHAhsYUjdn8kM01xw7R2Of2k/fbF/MlLSYtmvOUR3ZFpedz0j2djZ4HK9GI7igcUc20QI
	/3g33JquaYiDE3gCW/qNxj4T7PubTKgHx/PH4gzpomKdNmVZCEYcxnVCLmu4rp0dXpWx7Kw1t8C
	7PDU65u61JOmtLbIYzkaNOaKD6zoyQtk=
X-Received: by 2002:a05:6402:44db:b0:6a6:6346:af03 with SMTP id
 4fb4d7f45d1cf-6a68234c350mr2119123a12.5.1788341161195; Wed, 02 Sep 2026
 02:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
In-Reply-To: <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:25:48 +0200
X-Gm-Features: AcwNN1VHt8YKe3SoQU8DzJLTk-9J9GLSJswVYEvwz3fWJMFoEX6-Et02RNfO27A
Message-ID: <CA+=Fv5SbH+Qtr9R7O7ujth3pYQp4W6x9ZOX15Sf96rRYUT=wYg@mail.gmail.com>
Subject: Re: [PATCH 11/24] alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has a clean split between user and kernel address spaces: user
> space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
> kernel space uses KSEG and vmalloc regions near the top of the 64-bit
> address space. These are strictly non-overlapping.
>
> This enables optimizations in BPF and tracing that can skip address
> range checks when user and kernel pointers are distinguishable by
> address alone.
>

I tested this on an AlphaServer ES40. The kernel built and booted
successfully with CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy.

I verified that userspace mappings were below TASK_SIZE
(0x0000040000000000), while the kernel text was in the high Alpha
kernel address range:

  0x000002000025a000  highest observed userspace mapping
  0xfffffc0000310000  _stext

This confirms that the observed user and kernel virtual address ranges
are non-overlapping.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
