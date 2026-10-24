Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792852007;
	b=t3iXoqw66yPooTsznwzZky5TW/rqJEFGlbuuuebyA0FzftZ2klxeIgRueaXJWnmxnhDq
	 LPMc7zMbpj59oQmUabZ6wNTXyUF0Ujmg4xsLPvQOwZh0+kitCLxMYYkjlJF7Z301IgCyM
	 eo0Lmt/7oFzYA3jZD3TV8Jmb0qxVFz0Zx0Fj3kToz9/vSjZYJc8UdwP/zyqC07NSCoj0R
	 Ja2lFMrn88/4FlfSYlx9OJm4nlFbnQi++h/DZGLhHPzXI2qoDFRbLNGVtYXLBZxWiTrZ+
	 X6sGjSl0ksTTyjL8c0FqxaarRYpAzml/JLeqwilWGQVQkfYk+3j8rRX2yW3hp3td8sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
	b=pLg0VGwwgY3GaAZAgz5j8UlMRuvptPyNcQgZrSBxdyRPbVEX+KZOMqvf9XFD1C2t4R1q
	 1Edcbe45EWfuLZpyXLmrbxWvDl2b3wO8me/IUejtdp1BSI/bIQuvk9j78z0aW+Cy3wRCW
	 Mlt//DNC49PDV8I4beBqXDHchDRL4rM9cigzFl/GOzt16N60p+eBt5ocSqkntzooADSb6
	 wGGXs66tJ1AJ/PT23m4cUl+JEXpehyHNmLI5Rg6tRU5g4cAl/WjZkh4JFrohtnipleEHl
	 +CQ810u9KTJxnQDehHJOee/lKvToTXZ9W2J+gXovjSz0Fl2SZsbS0G8cugfiqKzdXRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaNq+7qO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD79606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaNq+7qO
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70059e4dab6so1216009eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792852006; cv=none;
        d=google.com; s=arc-20260327;
        b=an6V4Y+wkJDxx8aS+LKK3QZ+UNcFYddqwKrc6PZTIlvPkeQYE1XouSih2ZK0h2e44U
         l7/BVtIR4D2e8PM+UG7L9G21s1ulV3rQ+F0g29EFsMs6kAGWKkZDh3fuEzyc+JEyK0zh
         nDQOYcEmrUc6pBmxfRmPxbrx8NGe37vwl0nUQGFfwOINwmSyiGQaoah0JY8fAEb+if2o
         btyYhnGQJspn3SiT32owI6L8se1ACF6MI08ORKo3C6b3XZgfmQjEvP4TTtcT4L8KLbc7
         PX0LnX3aqc2UttxIynD0O82AjfofqnLXAdZoeNsSRLEQFB3D6AnZ9bA67nNGONMoAhmR
         bfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        fh=PC7L7rkN6WWpZIIVaeVX+7xc5pFTtOMxCckyeMM+E6s=;
        b=pVkWhudbsm9arXO+jFgKeommE50xA+LoUJJpdOxLZYo6aDfuOzsDdP7nG9bR+OsnVi
         k4ea559aC5AE92obMf5IR3mCKaKKrIKIdQcbg3V9/XkuyHly5qSZAHMShBsi83lZ1Wfg
         nTeHzgDUjsZPBbnDDI+tbyUtESnoqwxN52vfzYqMGWLWxHGRVGGMUV6AdITiyYwgv4BD
         7slUUWdXtcfjGgblheP2owE5fvYwOS910Gpypbv/jD5Ony10X5C32K/9WWiY9XRAJxwH
         ON8s6O75PQltGs1iH++lVTSrJ66ly6RdDHUACp1hRljdN7LY1YmQrF9/UD0bBU3LQUDu
         6NGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792852006; x=1793456806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        b=RaNq+7qO+0JZjvIFSzJ1cvRHhvrgLaPwkcTdK6H+ubodwHYEFy4K0l5T2xXs+UQRJM
         ku0c/21oTI6Fmlzrf1aLR/MwkK6WEp/EfAzayFPN7oKoMiMvTCdSKf9zKbI9gVwV465q
         zZcQWRIRxNFCwJBz1/Gb7WEx2SV5YlhXHCmrEzHDlYsEwXrv2wz/yV2auXi8+gURiudG
         3T0xvCQgB1f0KDKLYUb19SlStQy/sNZdCDCAHADHPHEQCZWFR+RahjanT3JyaZqbsfid
         p60o1rjWvY0LZV5G+TxXQlKP+ws46XaxtsdgiZRgSVdHEHBatE5IQlQr5fDFShfhQpYS
         ta+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852006; x=1793456806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        b=jg3a5inIq8AbmXkosa8di2qYIh1FGVjfeJVMs8UC5urLQ5QXAZwM3gRRPfXgrVtj18
         2neg4VTX6izWzrSZSWZhLG73RoqxnPpTopGfcnTp8xFPNbR1RWkH2L6Xpg3m6VLoJOEN
         rTkJ8GQenkwhyt5DKwGFQ01OaYfK4WBc1pa0ncUZnG0b/7bPwSnBgobzU2IXAenLpNfz
         HifsSnGHxzloo6xFsXPqMRvGFVBaLfkrwQPSNhhTtiIdw/0/bNN00nFf4mfjNEoZ3qGp
         rNzjN+P+BLp0ScWgeiBCif3jNm63sCZE9MxCXHmd7ceJpo+kgSO/CCZPHDc5J5uwZYnW
         xezg==
X-Forwarded-Encrypted: i=1; AKwUvBwl03O/VS2b7wmcEnIUS+UURUt8wZstjBJq9fooJt8hpnNLeyceWfw7Rj0CRkIA0/Bv7ZbjrgscfJgUkj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ31qC1kkF4+2qTB0SYEPHTaS+KdwohrJnrtC6YJ8PPcZFSqiI4
	lTL+0THiZfvuf3O3uUGs33Zg7rqjsU11FjBNH9+hdlt8W++IEeWyLmnFn6TxSV5wHpjfwJ1pPD9
	8EsvJvZAZaWYeWAG3xXt9tfiRlNplakgyhLPwIlk=
X-Gm-Gg: AYBFou3BcjL87x81RhvdKbfBifnNhLfVk2bUGAxrf3Jo0c4u1+Z6tDVidTTE/fYWVwx
	a5cEoqrGwslvKCTNaV17rtpJB767wr13AJ6ASvenHgic8hm+CoyBSAdEZV3/e2qqUMcG7g+0YBt
	psSXxjWEBktj3r0XN4fl+dQD5PK4wkI2a32YvWr8cjph3uqjO3mD47g+0MialpgVRULnnD2uQQZ
	d56gA9NtPMkYh74dgv8bi5DXKyEOUR2+1BcINE+HjO28ZrzGtjH9KAzUgR45do5STWzA203aJCv
	jcoa5VksuMslJZzMUpw0I5yafcsuEfsye/0i8bl65ZKHqkVylPtppOCat/h/3YQTsntBuKaDe9N
	MO+4/zW2YSDWRYL42aK07rHQHfk5GC8HHLtlXIUvuqKN5RPJBAbbOzRSEEq95BXuNHvzCObYoEI
	dvYxhjeGVKllXFU/X0
X-Received: by 2002:a05:6820:740b:b0:6cd:3fdb:fa6a with SMTP id
 006d021491bc7-70ba0f580e0mr687530eaf.85.1792852005887; Sat, 24 Oct 2026
 07:26:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024073549.29531-1-himanshu.bakshi478@gmail.com>
 <2026102448-tackle-footnote-9ca0@gregkh> <CAGLmz9+J-s98cT_ZFHF5EU7t=beK8m82fjq20+n5dmncdrMSEQ@mail.gmail.com>
 <2026102447-exhale-overarch-8ce7@gregkh>
In-Reply-To: <2026102447-exhale-overarch-8ce7@gregkh>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Sat, 24 Oct 2026 19:56:33 +0530
X-Gm-Features: AclHuK8JmRrrQFyrUfEN_DWwoARda0TGIesVXvInZouzCX2AOxXXYX-vfgnqmK8
Message-ID: <CAGLmz9JS1rGR+fM7Rm5FXsFx4aDZuMoYYXH1HJ2_8B+WT_n4Rw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: clean up PLL calculation code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for the feedback. I have read the discussion you linked.

My motivation for this patch was that I found the existing PLL
calculation difficult to follow when I was trying to understand it. I
wanted to document the formula, make the candidate-selection logic
easier to follow, and reduce the nesting.

I understand that making code look cleaner by itself may not be a
sufficient reason to change existing kernel code. I wanted to improve
the readability and understandability of this function, but I should
have explained the concrete benefit more clearly in the commit
message.

Regarding the LLM, I used it to help generate a standalone
differential test for comparing the original and modified algorithms.
The refactoring was my attempt to improve the code while learning how
to contribute to the kernel. I ran the generated test, but I
understand that testing copies of the implementations is not the same
as testing the actual kernel function.

I am new to kernel development and did not have a good understanding
of the contribution workflow when I started. I used an LLM as a
learning aid, but I recognize that I am responsible for understanding
and justifying every change and test I submit.

I will also make sure to follow the mailing list's plain-text and
bottom-posting conventions.

Thank you for taking the time to explain these issues.

Thanks and Regards,
         Himanshu Bakshi

On Sat, Oct 24, 2026 at 7:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 24, 2026 at 05:20:41PM +0530, Himanshu Bakshi wrote:
> > Hi Greg,
>
> Please do not top-post or send html email, the list rejects that.
>
> > I found this while reviewing sm750_calc_pll_value() and looking for a
> > cleaner way to handle the PLL candidate calculation.
>
> But why does it need to be "cleaner"?
>
> > I tested the change as follows:
> >
> > Built the sm750fb driver successfully using make -j2
> > M=3Ddrivers/staging/sm750fb W=3D1.
> >
> > Ran a standalone C differential regression test comparing the original
> > and modified algorithms across 2,010,084 test cases, including
> > frequency sweeps, boundary values, and randomized requests.
>
> Ah, you used a LLM.  You have read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
> right?
>
> Sorry,
>
> greg k-h
