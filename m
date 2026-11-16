Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794853749;
	b=K88HhpWh0+g4Cu2lAMl2vpjhyqgFpTfc+PcJJU0x+pnqjeu2w7nWEKU9HkdapIZBS7kO
	 Fc3z5JRvjwQfqRtWXONyRtUQxC+dzpr4teUjnwUe2SzjCEbMWfqh0AZhRVl2rCBBPIQVq
	 dsIiZm2S8UCfr+/n+KhkY+m3cowwrAZ1otghKOlz4DJFRLWD5eFQRVMDoiIwnSWxuhVgB
	 /HESF0oE8wEhi/lXREv9PBl/W6xco/5S88CeRPDAunqaI/MeDfPmEuymp6pUge4m91Ipw
	 EbcUg+8JIDXFDnEPF0j4jWWQjf9aaIyAifGpLEcq54bWArIpbJm3Ml86Y83LT16aklA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
	b=voTx3ew06sCbZBfr246bDSdtMv5+xCYI0PPVxKDSCCH/GDkWGvv9eZfxLeEA/mPNTTU4
	 UoEygW3DIBcsULDvwGuvYzLKBorl16nIY3r7lEY0q0/UEPV/OA6NnKC3r4v49yg/QxgDk
	 VK+HvUl+VqlDwI6zNKD5y8tcaxvXt5MvkiIepDgCwEEBLEX4R394WOJHw8Z0ydSjILer0
	 xb9NjPIdTPpHlPd/UYw0dZcMePqDeKMuJGBEu7/CLxvfmU4JAMQB1FyQSq7wXRgc/kePf
	 wIi94k9Pm18NeXvXlfpMlg+CqTYfeenWrGFyBhQmFWDnAOSeWQlBRpRe6STVF6FNtoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FHImyXqj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E03606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FHImyXqj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so114277f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794853747; cv=none;
        d=google.com; s=arc-20260327;
        b=W5Vp4+PT130WI64SaOVPdYdiNiBfPUU25feX1zc8Qq9phog+WoNRA2qoaHz7PhCRkz
         GKsRcC1tUX/vYEgDCyU/+HLMJ1jvm+pHi3yxlI1aCfflLhFTB4Q/BYDIwfWSBQixrRM2
         o4k+mJyE6c5BX4v4AQzqh2GVqF3meKl0kM2PJztBPyGyOZiKtizFMUYp+ED0P0yQBiVv
         Siso4aZHe8+iJXretxgBsAwESpZWrtni5N8ejQbeVKrJ2PbhaIkExy/BMEbCXr5k+aVL
         q0VgCtzSb/VhPZclnUMrE/MjFLPOWX5TDW8gdZAQGh6J7/tPwC9gXzlMXqyM5qVm2JPe
         EkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        fh=UWZpXiqvrOMD8MQo5r9acQfmyVPmct6w6rTqUcgfsmg=;
        b=F4GQZxNlgaup0iiZaLTynmlZ5GoEY1dd0f9gi/7/7tOOyl1qDGxc1UFextmUwCGXE8
         p9YQt3sgfV8nVJCnzDXux6AK1u+2D8FcMpDjBTL4tEfp/51fvtOZBvK6GstZDNDcQckC
         4P6QMGO+nsq8pTbywwRiGZ4gchxiEuZJ4TW8Ks8QdtaoMAiMwPHEtUrJW2f23OR2VdNE
         pmGeoYFbr+17T+mqxmbCY5p1FpUFIgKVlEDE8yArMXObZpTOjiuXQgCuwkms10D9h/v2
         WYQ0MOkS95RnaK1sRru4/Vps6QC/1ZvjSrkvS6j3aCdgYZmJoQJnMfM3R62xyjYPkh5m
         2vIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853747; x=1795458547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        b=FHImyXqjKF54qvn1mc2RE3gV2hCnlWIaWAw6NqqnL8cS3+c3Jial2vTg35lmI2Pgi9
         4oaIRNBCSWFstH6oEijywsTaghGJAVPkfY/feKTFBfvLPDI8aJ0Ix1l6zNHzINX5IwsX
         o0ZIkSp4mGgAHFTlDVwvnE8VXvGTf2QAAXZJbDbENpQOzcTDb8IRY7TbckfhfPQ3uQmt
         vfD/7oZ7HfF2YHlDBzHKwm0p0Ok6Q3wVM8NYiFaoaOavsUJBsVL/+NQRVmj2RmVba6ma
         8YKlzRMmrswN6C3H4uVHIVK/zHPWZuhVAsQCbW/YnQ8N7wkiJ69ryIioYoFVX59Jktf6
         tRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853747; x=1795458547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        b=eU+7p+HvaNmJZun7VSWv6grLVGkLRCEXEm96XKB/n8Sdt0j+d2fwvVumHRWH//70wy
         RkEtJyjZiQ6WEO24udXZHYAJ15sHqKgDMuobWYqi3SeR8CDTq9SDACjYO7JbrOkHmwxM
         mFJlljHCQgoTC+inwi8Rpq2Dt0rXQQQQvfdATauJ0eVavT55UjhtR4ms53sWuF/zYuvH
         bKX/+/rgQeqQVa+a/P3AclMjIzMM3LW1OvJH/Bt0QdxZwMI3NYPJfou0TJsJ6lS20CGL
         BYfTd6Qb4zgy9PBD3OwwjdKge+wxcehU9Qo8+lo5Qmou9Iiedd3iD42nItp9lITDxzPD
         hQ5g==
X-Forwarded-Encrypted: i=1; AL+hErEYWGctF5obctUId6c2IyfIVbmPmjsjlHGUvfpSCsBaaOlprJldllzddKRBreobdFnWArOL/dhNfNyXEaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dFUDoXw/uxJk80QpmWYwViHBXfbsnfXGfHAK6SALT6uI9klna
	SuCDl1u8InKQMg5WbRomYw+4hQkphe6LvviLABhuT/9xnVjE1HDTTLdks9sCShFdev0q15PqeLt
	tw+sP0z0KffOQQgt+AJRnvb+Nqfkb7gC7sMfTesGI
X-Gm-Gg: AZFdTZcOO7/DYBO3pcHApWSjxinKnCqZ59mLEYY5pzUUDcZvQdQnZQOE0LE1osIEklG
	wAlZsLs9cNyyZl6OPd+bsk80NX7sxzRMLPL8JxyutWyG7dfSRS4k5QSp4zFo8lUquFQkfvlIjLo
	BypKs32FX0G2M4W72g0wtEDf2+gF869zrsN25pbtCHmJ9hu14Ws1qmFp9T9rNWKQopyX2ihoxoX
	8hZbF/NwLBiF3iUldTkWlqhM4MP4vpo98MxIcZC43zFNOevJMJMS2rr28/wNtGtjSWNk6TKemKN
	bOxSjSBRpRFbIfEpVgh8B8GdajP2x4/nu+R/RqxnnYIsAi8G9BxzBUKgxgjs2K3kW+V1TLpGYza
	m2qO1wya9XYSeRcedRDfBjaDVQOephou/21R8sv1swDDjjKHL1TXl3U6jcYeev/N5BSALtSAQkU
	dO7RyF7YrdaGDRLfZ3uUFNmSH2sTuiEbYdrWbj00iI+5u+4Ayd+baru8W2/0gnDZ02wSamejFIR
	CnMKlvSqQJ3nETCpwHsh3nVB2BiMxUmRlB/jCY=
X-Received: by 2002:a5d:456d:0:b0:498:be72:6364 with SMTP id
 ffacd0b85a97d-4a376860342mr482276f8f.19.1794853746846; Mon, 16 Nov 2026
 10:29:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org>
 <20261114202524.GBavjDtC9Z3j7PrV3Y@fat_crate.local> <20261114204605.GA173332@ax162>
 <20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
In-Reply-To: <20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2026 10:28:54 -0800
X-Gm-Features: Aa3M54qN3_OoGAqkQOkSbWOChdqyPPowLr2H70kPaYwIzW6n-JgVCrQ_Fg1xSn8
Message-ID: <CAKwvOd=f+ib1XVvFfiW2mF8NoWo1jr55fJo=QOuZCJmzQCVmtg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Do not allow X86_NATIVE_CPU to be enabled on
 non-x86_64 hosts
To: Borislav Petkov <bp@alien8.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:58=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> (If it were me, I'd simply whack that native thing. It is such a waste of
> energy).

There's always KCFLAGS.  i.e. we _could_ remove it from the x86 build,
and <whoever cares> could still do

$ make KCFLAGS=3D"-march=3Dnative" ...

(I'm agreeing with Boris here)

Nathan,
Was there a bug on file against clang for this?  I can picture a fix
in my head for this...
--=20
Thanks,
~Nick Desaulniers
