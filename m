Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792995421;
	b=FVm2Iy0JbKOHTYuf4qh029WwYNowCzKrrpk8CfA2+klUqOr8TRFrg1GdfDhKyD/2nb5Q
	 ya9cKUq2izxQOHcooRqGM+x+s40BTDHxYlTQOQSw1+4/U60v6HzrEwhx+Pig9NnQQjDZ5
	 DkR/BzRWLSy+yH1PIEksnWWpXIJnb8Bu3EjNoSbbOtxxOUA38SeJgx7ZmKS0mMTAO0xrz
	 qzj8D2p8tegfVV6Zg6YUxcBFcUraGbPwjQ62H3pZcTxYtjgUJ/euJ+5rjwdDLM/aQnxLJ
	 qziFtphSqzX7DT11gjS1vMw5oxzaWVjC/hCT6A+cofoXUomBBlnEI1SU7iNzcZ374qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
	b=yemvp9DKViyrvdyOZf9RnoiokzQQsNc9UzMBWu2gAnNsqL+gQq9YW1XiEMTfP+MbnaGT
	 k7q38jAXKMdKZWFhq6JnmvcydhASWtc29BufR7o4bCyfQRA9/qQVwRuGI7bNg2fvvlO8s
	 MFvkTm27nCo0NRNnd3d8guN56Cdi7XLzaWxu+bj9QmB2QeomHuvmgxwHeybQzlzAb7UoL
	 SGStYcSrowAiy6ewL1FkKg9x4K/gOXvpnyOkO0pZFNV0YbLAU2CVOoHev0IgNVcaaBnm4
	 bI4HO1xpAQE8iZeqsNwneamKYE/J+5bk/GHVxp201WB6Jo/f8NBV8d1e3XmDtfpsv4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FrLUGRNX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B861E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FrLUGRNX
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-706113e92f9so1578132eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792995419; cv=none;
        d=google.com; s=arc-20260327;
        b=PwXlVNb+1nZH5Yv6jCyopplY5Bj4xkpjDZnYvlBfSyj1bZ11ZLDXRnHjPbwPHqm+su
         exY86AXFLY8RLWKriicx3lxEKXAeXAC1TToBTR3AKk0K2zlj7sWXyCE/mvgA5FokK8bW
         +CL3Ki9R428mX8NVXLMbG9tk997NVgzzP4g5spT/8CjOxNQOmEjkWrMmzWAf/Ni21O6Y
         WM7+FsWSydAp+VZ9MYBEvkmxHs0LS8R+QxvoBaGVo2vgrXUf9M0GJ2UDkeehsETtjoB+
         TR7AvSlrOrblJhZ2RjubC+4pfM5rujybAi1i5+Za8KDAi25b6yRoh00paKROCyGSUDrY
         K0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        fh=Pe6sh94u/bUmuFrT0KluQEUAiDlHJy2tRNMYZg/Echk=;
        b=ZkNcAv0MxZKvIl2OEhtMiiNElsuPiLTG+WxcoUvnN6WdlYA/RMqG8iHCgfG1krV+Q0
         IC2DU6S+16QnCZpwg9UYjUA3eZpihy0XN/woaf1+j8Vj++xIwXe83EV9wVB8Jcfsd3Df
         t181v6zxkG6KYBjEIGndW1cWBcZQw0iuDsrjwD6cmQxKZLLM0w8QBGCccyt2txbYKx+I
         M237jLgD1eUWbb5aiDNshgmEDccxIPgyCeBscr0Ft6Vy95uqTloKik/Errc9NIhDWHyJ
         MP3iX9ewK81L8gcp1SW9waWnLbmvh8jyzXeff9fW4gvE6TzEcl1PNTAMVVjPBMULEqYA
         uIpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792995419; x=1793600219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        b=FrLUGRNXuTeJ6EaEvAgPijQZNLDICaGs+ELAY9/e04MsT++f5cj0FXUl6Jig4cjgY0
         4UPZjN98Jl8lXFRQnooWa9nfsQ+LMt6EHiwp3FjXOtnDWwU5FCCww/tN1BY4zatClJ0t
         L4q2+OvMxD+/CVwoWLidMCtpQm7sV897/drH5Jplz5gHFbetXGg8gInHZj3DYOBrlzLd
         6E0pa2h22j4gIVw3q1dUFTY8CHEAkYJkFLO3TSq0UKXwaq3IKuVn3oOBgoPzGOEo0AkA
         HMEy5rCxXfp7M21TIC/oyUCxf6Mz3QxnLjaNw0wTWly7o0IdqoQisaXNMqyVp9Phtc8S
         GPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995419; x=1793600219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        b=N5Xt6TULOXTHHBq7j+s3E4kauo+mzXz4oth7mBypQVnsZXxX9ZKhKjkWdikCuYs2a8
         guUbLmCHvZRb86PbUlaY6KWKMSGnX8+68hP04WwVTiSGQ/28u7rj270NAchr0Sp2cNDV
         RYgckZH14xWNBCQvGLyf+AmV6Pht+aBVjgWX/aOhK9T8NCBUSTUfogAcbMYFbRjUcpkO
         ELnmrKDJSttSqdjI5n6SGe+6WZkPc5wp4XAus+NuvWO8Dg9A7vKevGZdZRD/EheXB2T3
         bTyAV4LkM/kKayt8AwChTyATgti4en/kZGVRk/QJBeLOYAFjWA7WXbC6X7U+1s8BeYKW
         xTAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU3tocYFG+1zdm2Dmo9vcm61ON98Jtz80NZKfxYLMKcYQINBrK7wFV7ajtnHY7Z20izY8C25QO28n3JW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDMmU9iryJt1VFolAEbc2zIiRRRbnaSOXTU29l2SiSaTyr16gv
	luGebed3nFPudnzswiLqUQK9gg8jtNn8jchBvZFdSQZbi6abX4PWNeISUQ/gpopQjG58z1xaxv4
	SQJ32iqjAr/ujqTFk0NhNOAxjOEBxj7g=
X-Gm-Gg: AYBFou1AsFRsoju4RjoQT5mcS+qLs79sxTfPgr6GoSG0cSRfVoGIizP+XsBDU2W8sG8
	GSmZ5JhYNBuS3UquWxhyH7G+qONYmYZ/pc3xSer3suQ20fzX9V33DazEsZ5eItlLXKD0v+Asnnj
	h6VU1aElh7IHi3kXYWWD5oeopah15sFgZq6Efu+JVMRAznnlebES8gVokqIR+HV+zJn/JCgtDyV
	bZrG5o6azm9uxWuwi5YMF3W9mIj1m01CSx/EVrB7tDbr02QTL5cl+8fNF4s2N613C+rqgpA9rWu
	SOFKXfdo2+w3odTgHVLDdXGYSIjBBshsqiQ4lm1mXnqGIQpTAObr//KPcPu5pxjtv5uQgoVSaZs
	fKD2GK8emrt8TLfjZLp/4YH+YGD/JQaeRAhue6zF4Jyd7ONxW9H/i5HU1cgrSPQCKVbaeR2k=
X-Received: by 2002:a05:6820:340d:20b0:6b7:46fc:1d8 with SMTP id
 006d021491bc7-70ba0ef0690mr1914182eaf.55.1792995419601; Sun, 25 Oct 2026
 23:16:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain> <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
 <at7s7We7bxdmmmSM@stanley.mountain>
In-Reply-To: <at7s7We7bxdmmmSM@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 11:46:48 +0530
X-Gm-Features: AclHuK_st-Xa8oKg66mPkm3FdUxLxM8NWdOA-cYaAmfiphj913FwW3RJaID5D5c
Message-ID: <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan and Andy,

I have not found any call site for fbtft_init_dbg and just assumed
that it might be useful later on as the driver develops. If you are
considering removal of the macro, please let me know, I can send
over a separate removal patch of the same.

I have also noticed that other helper macro just after this one
like fbtft_par_dbg and fbtft_par_dbg_hex have some minor style
issues too. If you want me to correct its style issue too, just let me
know.

Also, regarding the confusion of threads, I had sent over the patch
with a revised commit message as PATCH v2, which matches this
discussion's subject. (which I apologize for). And also sent over
the reply that I meant here in the original PATCH v1 email.

I hope you will forgive my incompetence,

Thanks and regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 11:32=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Mon, Oct 26, 2026 at 11:23:21AM +0530, Himanshu Bakshi wrote:
> > Hi Dan and Andy,
> >
> > I have sent over the comment on the v1 message chain and
> > also sent over the revised patch separately as v2, I will be glad
> > if you will go through it.
>
> The subject here says we are already discussing v2 so I'm confused.
> You can go through my response and decide what still applies I guess...
>
> regards,
> dan carpenter
>
