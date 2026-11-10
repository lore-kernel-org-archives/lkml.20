Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294273;
	b=MyrFZJxXBa+ZtNFkRSPxPTKdAkD0VeAmHS3BHIEws+BqSoBQixKgEI3NjiUVA5MWfrq+
	 TZtZePF6MWOWFSKrwidQkt7NOcPDh3cmFkwHBk2yICipKvzSx+T62Hyk1/3+6GMQk9Mhd
	 dwsfEfb26Dg6faFYVY3TQZwUYDStCX4AEt7tXWc51HRJtw6TOzBkoCMizb0CnHxZgxRFN
	 rSPto9fvuuXmVb/3mOgRkM6B5JlR94hQYMTNn9hoI0MRLX/O7Pp+jdLwp71ZRnRZ3zBH4
	 /uODUOXEWo5XtlbQ45xWS9F1Tn5XG1+eHX/XZ8zetZux4bf6BsTLc+6bnS27sw6CeRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
	b=5LI7qpk+9Kp0IZCt6xNUXSjIQrcQKvpxU0QHbZ4Z3PKmy0oAfELOHMR49ZHcQ16VY85a
	 j7+8RMIVoauPZIzBjJg5zdgNRy9aMbvACCxv6sBcsBFkallUZIWRrJaDSLR/rTt+rpR7t
	 pZYdsE5lbwrzHZ5i6r4mEA2seO/w3MhqveNyN/U1iPftd3VFnCadwpX2gcvlrabJc+mpA
	 ik6YonK0a9EwXlzIxwyTqNPUi8rACWlMYNvFiPS+CzXFO5eRlP2xYrEM3NftgsTDehJVU
	 aVaV1qsrTN2jVmxBthxSr9YEIHHgNMbLMzayyukDyINViu3iJNipHkSXhPl3RSHXuMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8Fz+pUk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8Fz+pUk
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2339483a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294272; cv=none;
        d=google.com; s=arc-20260327;
        b=l/6Pz7p8tA1K6IjDKHRM4ct9zHtcvTEbszFNkrKTAT5zen/LxSc9EbArxVKXb2nury
         nHG59nmsN2d6xhHxDoml4fI0yYINQHN9Z5jZF/PRR0peuIOipT5JCX59pyydPg8EETdn
         fy3jWOEOQVpYjAQy9niX9/CKNb34dipkZgJYMaDu1rJxRKu6Flgnpb9J6ggepKDV5Xps
         eqHajqv5pev1BZksFIaaP8Nn13jB4jnFWfmWxq0e2SmioQm19n9LTqhiCeM+QP9lrOsR
         Y75ueSEATrTdqGlL2yxk706i/BURuqCY3HQQx67vi+rj+yK5RcruCas9cVRC6Z+MUFbH
         Dd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        fh=hORcQ3vqxiLkmqSCgcVPfgvTC6rN8kQ01sqRbAv2TSg=;
        b=aSFZL8T8PsLK/zM35l7dwwPGk7XkuEwXcjm+Aiy6vSKJ3Tx1vzJZ8qdpjKC515yN/p
         JrL/Krw6f1JmPweppV4uofR0/N4/9sPKXWg6bQyDp9Wrt9qQt1+D3nZtiiO+qrrjE9gZ
         K/hR66FoS3aWYVztCJadJE6K9ZhIoYzo1Z7gjxAuLnIRFhh14UfNhDgpEb07smPohPfI
         zQAzeKpBgmjIkABZtKTU9kMksFaw/oSPClkttSnmKPTZKjmJ8U+S/mLJOTrY8s+k/eRz
         7tID7iI1sNClKOUmcBr1MPjKNSjs9C4L5sy2gwUP57dxHzOKckHJZkns6/PniPkKAu8e
         ROhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294272; x=1794899072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=g8Fz+pUkZixQzSh9e2idFtncVxS6j+NGGEZZa2lSqnzxQkB1hqczJADO9xnq+rBc6Y
         1Kh3IUy5TF1yBwURnLO/LkQGNgLQJgtHbcgRbPbtcpYwn06Ows9DONJ46b+ISSdkPney
         G+qiWAcYINW4/XIkTB5elPNc/Vd8+so2LmpijE9N1ipFlXeFkQXxlUbTFYmRqZpIoOdE
         dq6BS12Yqug49VJA+WclM2apV/bGg4XpHVix+s+wVuoVKalXRpkONgM4MurBbay3iP4M
         p+10Ahl/+pyx/fXh2SXXp2jGK4gG/wve9G07LuErTdahE0Z+wB4LxBX2fhhXC+NaSUjH
         YMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294272; x=1794899072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=pLVKZjJr06yOz3gMfNBWamjvcdwTXkxS/eq7TbhJ/Hlxqe9sCEhOlv6a4L88i1Bnij
         +itHeW/6c/7bIuj/mOsTkJf0QnPYheWnizQUBMB1LmnJcKJRPwABL23jL/x1b7/oB9RR
         /soCX8ryIO8Bz9EcJzA5Uu7Qcy98zjw3EfLM8JK7SPa1YQH+p0sS4vHv1w0zEabRQP7r
         6vIGsWO//J5Z6/bCIVJwmN9e+DtK/J/OiDkroCeTGJFrq+JmTk5iuBoUBDySkF5d6X51
         aM334w7qKzHkkV64qi3z/HpIXn8XMBDhjnkR9fbpgvCT6yUvVIVXciBs7xyKlfLsidSk
         VAlQ==
X-Forwarded-Encrypted: i=1; AL+hErEgSpIBGseHHq0IVZ60An9OtCGWajV/Ba/lU2FPtTJg39NOOVi5baRPjH2rTVnNoEdg+oBLRz4o/rDCzOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dxu7SgAnLOY/fSFQl3X9gcuEYv10fPTvvz2VWeA+CNYjkEyQH
	H0a4VkAqRfX7m5XH0qfSimu46eVwXxUtk1si1h0jZBSj5hC5owotRKTNJ9kjhKaTJTGIGeIdr3l
	TyXPD28dlhsFG9LAQxMmFsNVWgOGRoUg=
X-Gm-Gg: AYBFou3V4TAe7EUM+Q4sxzelEBouUF4ALjPOiZ/jQur1DgHEgMPOPtroomfbn2CDg3t
	klxF9wXWlTI3g/bB7jtPg9FGTWOFaK+iqYZhmvqYk6oGwRk0PrxfXery/sADRccAGgfEmcwTm8a
	D7rjuyFcUns5xtTiXeiqIZB+hJlbv8uo7yiYCDxzVL7Ma8nUvKbGs3fRL3F4aXzA4kNCDYd0UuN
	nwpeVeAceD7VROMGbAArcOqxwMyg03ceaaepYQYs3M7wfDxVxIjom5JnbYpW8RswulU8brhM2Fs
	eN/qylfQECQEN0PzIdDWQlJCD9hUZ9sK/uodVsd4QRxX0dPN4Q7bvtEOAEhC++1Fgb9ffvEkZmJ
	W7jPNtn3tHqMRRUuiGodPBwUScVrCB4mwTto=
X-Received: by 2002:a05:6402:239b:b0:6b7:1b62:48f5 with SMTP id
 4fb4d7f45d1cf-6b756afdd1emr945605a12.34.1794294271512; Mon, 09 Nov 2026
 23:04:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
In-Reply-To: <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Nov 2026 12:34:13 +0530
X-Gm-Features: AclHuK_QdgUZlVEI88uRaFYkO0SFBxHrM1OaI5F967fviYpCpm4NPd-mBXdjZBY
Message-ID: <CANAwSgRRYCjYfuW+RqpRzbWx+_Fee2xmqr-GdtWAHCsEFZF76A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

On Tue, 10 Nov 2026 at 12:19, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> On Tue Nov 10, 2026 at 6:14 AM GMT, Anand Moon wrote:
> > The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> > to wait after triggering a bus reset request. However, this function can
> > be invoked during atomic I2C transfers (such as power-off or restart
> > handlers running in atomic notifier chains), where sleeping is illegal.
> >
> > Replace the sleep operation with the driver's internal helper,
> > spacemit_i2c_delay(), which conditionally uses udelay() when running in
> > an atomic context, avoiding "scheduling while atomic" bugs.
> >
> > Assisted-by: LLM
> Also, please drop this tag. The same applies to patch 2.
> See commit 1e035297ffda.
>
Ok once I get positive feedback on both patches, I will drop this tag
and resubmit.
> --
> Troy Mitchell
>
Thanks
-Anand
