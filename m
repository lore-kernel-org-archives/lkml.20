Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917931;
	b=Wp7fq7Vf4XwG51iC4DW7lHu/YPidmpz+vnQ4zJE0gM8My975dq+Oqqqu1UFzlpm+SOeM
	 7+yPEAs8pmIBzlkd4gLsDxw1CalrsIK7nXuhLMzW+ZrtsvpWINQ/Iad7Kn1nLSAHSH+CC
	 DFROsx0dHLWma/JXrr1Cc9U/iQnekeWu+mEhDpCv0wN95+ERUolCHnVLjphVk5ljxBxoC
	 47Biiarwcn7OXZ7XkUEDm85lyFNq01C/A7nPx7l3bZOBMqqOG0/HRT4i6pdoi4oHbBRne
	 EOmbc6rggFXkIFj69xNS9yxKMH5yrStEn1x3BYTVyT7GHdBq/wX5yQlvgW3Der/d6jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
	b=KWjzq2nKyC2bWT2igZhJ6w6n1PNenrrEYN6E9CEi3FILA71TElCk2QBaVGilDgDC8NL6
	 AI59W6DXJsGH3oPLaaFZpkcux0B+/R+7LzA6kUKUWF/4PTNOOZy4wvmCVkisC5xND0UQw
	 0DtSN08Z97nqyQ5+SISgUMkbzvAK4ymfuwv5U6sIVxm8X2lQx9yHEwI8qVRsyXuc8UPUh
	 HBKD4RJzZ4pqRIYkr5ZCWbkGnuAMKYC+vkjkPbrtLhWJZtulRcg+0WHXes97cQLOHVH80
	 MjMNhHmADgsd65v/d1MfsJSwoyxZ8ds83/D+pkxUwQIgaGjgS6BCN7HEeP/NxSO37CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED5606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ED5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1324303b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917930; cv=none;
        d=google.com; s=arc-20260327;
        b=U9yPLZIsUoDGlTcwHxvGO29KcZj3/RfnW/QMHLqdDkX2Kl/L+PJqrD/hteCsaQhYoq
         fSQVY50J4NfBU8MZE10UTIgceWXI/W5jiocm0cr+0AY01SbNdcFZYvW1+e0l8IovMyBD
         ktA/qbGcjpGfCifbdCNgtYhdbHJ/qswrfyL9HzkX1EgtFWS/4IntzlOAdDmdK2PkLS8M
         E4CnVEJq8CVhza8xB/dBaWvxNi4fBhGCu9lpfAxHnOEZ4OwYyH/hUVa/FDZPr73fqg3m
         CQ8Q03BKYkxvk8CpdGIXG2/1WJzI2sr4HuHyh6D7pu9KD3yLTr9XD4C6NmkbxPt5NDS0
         OB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        fh=kplT++7ihFiRZvW3gQ+6bLsGUgiBsrbDnf3iUr141c4=;
        b=Ybv4gNB11pEAh4IUr+Tcw3jNdmwPjqIW+fSnTi3uTnxFtdni6l4E2qD+fgLI7+ztyR
         /japAloUKYGzujoc78HifXUsPnnQ/ZqMl+8mJx6/aT0RZWUh2f7ifz8088ZeHCkZwlsh
         vo6jfPTNfHKX84uzFoerd9db+pc5frkIr/U0OK1mf6XRCB3VaIwLeMjs7oloRQQ3YLG0
         Amf+kQbLQ/RD8WpSSunaVbmldORYp4hl8+yf+g7IUHi95DO6A/PaL8F65RnFQuojt8yN
         5yD8DWRr8Hia6r65y9VmmbZOAhc31JP9Qerfi557DgNuC/fIiKP/v4VtQiX45Tv0l+FT
         DUkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917930; x=1794522730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=Eh+RrIwyRW2pLFAckDF0MHCbB39wfpgowwsx1EjCEg4TjglDCPKN/+7ORVBplodNEl
         jPsuezn9sp+54nY0YFIN5id6tKlbCmtePGeBOzUEgEtD3zRu4wGuAGpQI9AU5O9H/OG2
         BPrZhYK4c4JMn8PnVzz5wZtQIKJrYDSceGNLApikgEpvL+Cm5kmuYnC7eHy1JGXZFMxb
         f758muqYNnvb4aLtbgJMg7+gE4B3HhSKAGYRVp57kx0wCQq7XDhPMG4nfMdkf23f4ouv
         mOvK402Ka+ie5oiUrYTV9bgBNPGKvXrkXueKKPphc1LciwU9R0c1CRCypkNY+ZaDHYvD
         3AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917930; x=1794522730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=CaeEO7fhttI6U2X+kHCdJEsm9CVxMYf5aygUlcoPG7j1PYaTp8f0YNw7GbUl4vrTma
         q9z1s5gb+8vl4C7qSmG9Ubo1nLwB5yUayA8NBIQVqWdpVOY6aV5kpoi5n1w6ypOPYqsH
         RDCQGiwpV5rFOn28aE2DfJ+AQWXP59n+NSkZUZ2DhhlkUxfiqxDsMYw4OB4YYoB2PNmX
         hIti1At+lWPbqciw59ER1uR2H6A4BaHwql8uYEbzuTLW0vPOvzrzs7wpjxGYmOU67jto
         CAXQIdgVLKiI3LPfxDLLjXUQOJiryPD65Ng638vRP6LTUCfZb/1pfU3DMI5DiLlnaHEv
         nJ+g==
X-Forwarded-Encrypted: i=1; AKwUvBwcAy16+1oHoxwp+e8qVqT6hqE1f1aHtLA5diWal2csJr62ji6ugFMa35A0GFhgJKkjOwmyNYGO4xy7HL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mVLAXgA0mzaV3TBVN/F3+Qr4ZR48uXpIaJfogwUM+imhWLvw7
	8knHgaRXwbA0EaH1nEYbKNY3PBc1qJDOn0CdGmdDxl4X7X0Yvr0jbnWyd7cpt1h0c7Qhbagmkb3
	LB0Ubn1yeJqsECQwx2M7df7ohB/yJaqk=
X-Gm-Gg: AYBFou0mdlV4jZG09kNl/x+WqYSGKNgUNuH57ULHpIEm4BLPWjlIrw33IrSHeNF+ZSu
	8AtewZK+E2SMOJfVT4wYSB2VqoeztWHi44h5hqvnvv/HYJBSW3YhKBVHngOUeKM/8+iz+ecQbPz
	hGlokR7NxHkE3Lngw7F89hG+645sVVT4YCcbKAyFiOuJFO9RrRLKZpefybfFhYJ1UKWSl1K+DcA
	+fAchfEn0FsXROm8A0hPbZfV0GSwkKHvQ6hMNnaQnT6KsSTs8mrWnBHvqdSS+OcQTRdWw+nO44m
	WjuRhffphfH2RuzZWOyN+V+ExFz1i1fz+W5Uv319m1a9et+3xkHNadoU0NqAPDK7IOTQdvwnQ7h
	jRyRyaADVakiIkOu5X4LMbrI8AizrqKjmr8mrgAxQ5MYofJJi3POp16gq+b+RQ15hInfUC+UW9T
	S/7Vx4n7wSH1QL2EsUIzascq0Dz9BJitV9og==
X-Received: by 2002:a17:903:2304:b0:2ed:1f0c:d31 with SMTP id
 d9443c01a7336-2ed40e688c7mr9370095ad.59.1793917930400; Thu, 05 Nov 2026
 14:32:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:31:58 -0800
X-Gm-Features: AclHuK8BPGpbYIUoL0zJXTIzG60i-gPbL3KKgBgfTHwRc2VAS0UUrPKJVoGciTA
Message-ID: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 3 Nov 2026 17:14:26 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> >
> > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > <david.laight.linux@gmail.com> wrote:
> > > >
> > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > Samuel Wu <wusamuel@google.com> wrote:
> > > [...]
> > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so th=
ey
> > > > > would be different symbols at different addresses. Please correct=
 me
> > > > > if I'm missing something here!
> > > >
> > > > Only that the user might really want one of the copies.
> > > > Sometimes there is only the copy.
> > >
> > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > pagination to cover these. A prefix query for "foo." also finds the
> > > copies when plain foo does not exist (expanded on this in my reply to
> > > Andrii's Oct 30 mail in this thread).
> >
> > I'm busy rebasing my patches - they got stamped all over :-(
> > I should get a v3 that applies by the end of the week.
> >
> > I will add a 'prefix' variant for you.
> > The 'next symbol matches' flag is exactly that (actually it is a
> > this symbol is a duplicate to avoid issues at the start of the array).
> > So in this case that application would always need to read
> > the next symbol (by name).
>
> Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> approach so the two series stay independent, but I can switch over
> once your series lands, so there is only one search over the name
> table.
>
> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.
>
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.
>
> Andrii, do you have a preference between the two?

no perfect solution, but given you don't always care about duplicates,
I'd probably return the found symbol's position, which can be used for
further pagination (if necessary, user just does +1). so, let's return
current symbol index, and have way to say "find by name/prefix 'blah'
starting from position X", where X will be previous symbol index + 1?

but tbh, you have to write some code on how to do these "typical"
queries and see whether API is convenient and meaningful, hard to know
upfront what makes the most sense
