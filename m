Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475878;
	b=18Q870ygj18T1jdZoK8FtXHoS4UcmkT3w19R4O3PY/PhnGZ8dXvND2qNUqYG+5kGaxV/
	 zy1MxTlFSxC+2Ol2rwpyIZBUtZ1tvinjVpju+AHR26aD3F11X+qwvlIk632ZofyQEw/+4
	 DD6hPXiXPDL9n27Jg7Y9w6HHFcXSX5I1H+ScYA6gi/hO6N/QNlxfscdVkKmFl40S0E8KA
	 inuW4Xtk6Ql/iL8lUtofcLE08Jijnsaocn2AMMKWj4QzgyRA32AZG5fAu8SQQ7XHJjaGl
	 iku4V5uh8iOoD9mcRxRPgUymZYp2BL2tkQNMR5yWW0XUTRO4gQ7Z4arQ2iQpywxoFcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
	b=P9bpKiAII3/SBO4YBFbbZ+yE8/G6lN05fSw57vhoJmUtBIXsspXqdah6o5/AXKKzfZhh
	 oqpcadK/TRf3tS5XH1nUPjoADCwnxRhdrE5oh8FzUjdS6Vu5JypAeZilkLn4591LCUp0w
	 kaJSqJIYlWVn1KvrhgZ8HUHYHAyeA97yOdsVRRoN8oJf3JWTBEn/NknP6YAer/G5TP86I
	 WC1K+ykceWXhm3vZhCK7Si9q6D2K/glFYIDS3e//gB+0tmMd1fm2j0/X6MAi9XiQ5m1+9
	 PFHCdTFl/tNzB06Xhe+x1GLd8k2JmT81cb3jt48UM4lnlRWh4q+I3+ce2z0Sw17IWLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rkWZYYdM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F457606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F457606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rkWZYYdM
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c05273c38so4961695d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475876; cv=none;
        d=google.com; s=arc-20260327;
        b=Hp4ZPjk9azQha/04gnFt21v3rPdXKZWUdlj4FrX3MeBdbkArBaD4GCl/v/u3urTYae
         hhQ7IIrdOLGNENw++w6g6siGyZEyAqUQj9Ss32MrGCBmBvjbfrnPr3dArs2c0zUoAC12
         GWWAw+OtoKz94Vv5c21whumcn6f3v7TBZ4Sh69i9iNaOoFk4O2zp+5LpT1VZxbaRDuBh
         gYCCNwOHejBbaDD4nD5MFwUznp9ARt/c6+nRkahmFzI+KCm8aDqRvpiiIGctxaIiUll1
         vbVBjHHbSDh4Vuczx91hDGCeiTU1B5VtknRys+9Fr0gPpkAvGgBjk3dBpo0+1RiePx8g
         n9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        fh=m1mqXBVOExjJCflIquERo4a/IWzqOjGBz3ujqJpYY+A=;
        b=R0/9WXrhu2ZI1tEVRYW+4V7s5rH2RHE+hzWt2ODxvmfQrtQsDyD0XDxQFIeoEchhTP
         HcnsHEDMi6gcv1AmZJgTFZsC7CJYJ4QDW4dxU/GYyYi/QTwY7Urr6hlFAH5n28l639Z9
         3mVr4BsjrYDR5QCno/t82hCvvGEycsJKT2UVO2rAK8c66IL552k9T/T0HfMjKZQ0QdHH
         4b3mIr0USy3UfcJrnyDzJziGdMD8W+UXYvTMfb1pq1U383LjydSJAp8XSIv6Ui2xAno0
         s6uKYbdeNXqmuzWMuYHvp8qSz/W3Utykr4VE3X45ROGysXI08qFjDmG5hJfyXflBQWU2
         3EWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794475876; x=1795080676; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        b=rkWZYYdM0K7SmYI+8hy7x97hj2rpu8rdXzhNyx9CAi83bVmkcOkrGSmOCbJRzFf3Bt
         6IIlVvsQK//hm/LL06n8XXjLJ0YfD6cbRFIl2U4svXWHJrOWVeTakIxZggAzwbYOIKhY
         xF/XuH99e4ZL12APVAXrGVdMcliyKXSPN3tzqxbKhQU7aEV0nH3JS5YRpdYTQlsW9KNu
         Wvrez8SjhIABZ/+DBWa23yBWfAfqfh6xXqRncclXFCSzrqwax69HjCJqnRrv7083cGjh
         dBpDj1gZzpv/5mJEWlbh6q5n51UKNVt/v5Me6/0OWL7izegj+jVUYUHywACuf5xjrPVH
         wF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475876; x=1795080676;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        b=ATA+BJq0Wa9wR2snyUndL6CWnD5fo6WDG30FB6HB5xPuV5WwiqTOq9DXzDg8f35skI
         5Ofeya0X71GGtr78E93H/4gIjz6aPZpYwXut+k+++m61cfNc5YLbFlMQdRku0/r9DfF5
         UJUlTHkPBPwA5JstWaI8sYz4Rfrvt8TFLfsNV86O72Bxjahb5vVy4/RizatIQOxyeB2p
         ky87lnnKreqYwonlzofXMWR/3syxmfhlHz0nfkVkX1P3OErPQcQd4BWVSefjveWmZQyn
         RygAlCu0eZzeYu5dBPsX0vP2VWRpRdytyY3nypUGjNqC5n5RCAXFcOulg5XsfonP37HA
         J/qQ==
X-Forwarded-Encrypted: i=1; AL+hErGEyMYbQ7adwyqtFOVuqq4M08xc7pUyDlVv17wKpr35WWQISgwwOgoX7cGmNj2UuAoCkvv2Y5kgd6UCU9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v4eAG19ANU9Rd607JZdpGufaTPMH4E1IfKEy3QmkZthxT7yOR
	l8yYhO/lYNBwblnKC45lpfXnDO/hm6MAjOAvCTPNZf1wFI47wdGnBTKKoTL+Ki9fXmVhwL/ImLL
	TUiA6MhonWSQv77gs5ZWxpADWBoM5T89pC4rQb6/ozg==
X-Gm-Gg: AYBFou1BKaOfhj6c6ipG5RgMb8Gu2eSbExTGFqfZ2vbYrHakrA9oRrR9Q3vDsx6P/yc
	W8WJan++kEr+BdfR4zF3Ehlmm9BF1R6YbyEU15W88v7oWfhDjbcbZGUKiGU1vwPos0FniD7NeXM
	dUYYygaIfdkOLimBS7s4LVs2ETtRQz9SaMVtH2wDP1apYUgUFQR1NlpCy/yevehkplJh8lsGmAY
	/5wgE089LFdUVf8D2E5eckxH25N7FeZQS+h/piAX2PuWSdY+sVRRwIc8PXCmfV7b95quiA+aw8U
	pXyeOc3xmCrpVW8n91531QQMPYcJIkd/8Z7rqgUnc5w4kXfp1zuDkQPu8wbO4qxgoxWD4ExV8GM
	LOQa7OGp4r3n8DhbXxr8lRiQPd2d5AoiWX+k3vvR9cSvCi+muJqDdYVkr8st3ocwwgCfc1htNnu
	2jd328QWiPmxbpNqRwD6umGosCPqZPeOoKoLqi3pnfPw==
X-Received: by 2002:a53:a74f:0:b0:67b:f91c:10b5 with SMTP id
 956f58d0204a3-67c67fdfee6mr2823993d50.98.1794475876355; Thu, 12 Nov 2026
 01:31:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com> <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 09:31:05 +0000
X-Gm-Features: AclHuK9o1ZFb6zJeR4-pm6DWlpcG08b32X5ENGmHxfFB3Vx0UUm9PpdFEohX-II
Message-ID: <CAFEAcA8bim81-aKR=whfBaaT92EUAWwwNS8QFAq79Je4Sm+XwA@mail.gmail.com>
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Patrick Lister <patrick.lister.dev@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linusw@kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Nicolas Pitre <nico@fluxnic.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, qemu-arm@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 07:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Nov 12, 2026, at 03:51, Patrick Lister wrote:
> > NWFPE locates the trapping process's saved registers relative to
> > current_thread_info(), assuming thread_info sits at the bottom of the
> > kernel stack. Since ARM moved thread_info into task_struct, that
> > expression points past the end of the task_struct instead.
> >
> > This breaks FPA instruction emulation, as the user registers are
> > never read or written and causes out-of-bounds reads and writes of
> > kernel memory beyond the task_struct. Any unprivileged process can
> > trigger this.
>
> Thanks a lot for chasing this down!
>
> As I understand it, this means that nobody has seriously used or
> tested OABI since 5.16. I last tested it myself in 5.14 when
> working on 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
> thread_info->abi_syscall"), but it was quite hard to properly
> test it at the time, even getting an old Debian rootfs to work
> with a modern kernel and qemu was nontrivial.

> I've added the maintainers for the Arm ports in gcc, qemu and binutils
> to Cc here, I believe all of these still have some level of OABI
> support that they kept just because Linux still handles it, but
> that can then also be removed.

QEMU has already deprecated its OABI and NWFPE emulation as of our
11.0 release in April this year. We'll probably remove it in 12.0
in April next year. (Our deprecation policy only requires two
releases of notice before removal, so we could have removed it
for 11.2 if we'd remembered, but as we're already in freeze it's
a bit late to do so now.)

thanks
-- PMM
