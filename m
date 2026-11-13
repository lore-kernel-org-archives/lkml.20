Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598005;
	b=MviBuJdPe2ruynugzI+Q8QZck0EDa+CDl0NN4VmTT9VpySA5H4HLvXFh87SE2ZypxB1O
	 EJ7jUHbXXTnsxLAdoTHHaeU9wPIYoQInH1y2wzIQxeEDnCykPpiojm04SHTLX2wlUwhFD
	 p5HWduVIOPuuMZrdW8vAcA70GIgcmPXsN+71HjSE703jtVkshDTDdUbkzMdb7k91Dur4o
	 DjrpBzo2PggrIlSPT7Udeq/yhTd0mUXghhN+YfWKxT16N7e1/Yh1aAe+s81cZTkMrwsKz
	 rKEDakezMY2DKs8fS6UzjyM3lnoCRmbXuSq7kwRyT8S3F8GhbrqKBNjG7IcB8v+hCcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PiRuS99+AkTRz0MXcWmZfyNH/KXYZ+AP4DTphBGSVM4=;
	b=orOeV8TK+s0Z/8sYuj4uu8/gsFiycwG87pi8HA3OteANSPXSYWPRoPtvid2suwy8qMMi
	 IPOz724SsKO+QolMbz6J1GcojLTBzsmMJox840k04hOb/McrmFascYUKCMOs/Y5DgocCS
	 DqxIaj/PZO2/3G6poD/hwOUIspQV7NpYj1HWLKAd0FXTN3iTIY15noRZtgnAST51Zc5B7
	 LYIaEWAyzcyAIF04d/VVAJK3zFH8ik7cfu4iSehpea+OLBqcV3Ti6w5VJLb1QZaDSAfdn
	 qPQSZnGBeeCGhqPkc/6qJO9IDGHp0k8tXffjDHk/GkL1nCWvUn5HycAYBW8qAZdn63g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cYoot7un;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41733606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41733606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cYoot7un
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7987517aso14438505ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794598002; cv=none;
        d=google.com; s=arc-20260327;
        b=ccqyU677Y2c6sVZacLRW+hKuo5Ne/ALIw+hBnnlIHTxyf/R+gzTlRYd1qCbzX1cb1+
         h5Zbz/toNwTaBodgPnK4JcXcq+oSc/nA6cycLkNCMjZM/306DafcMRCjmyzTRMGqglEK
         kmKSPlhtkd/5NsKX14zFOb3NJw/amIkm/VL/4nJFGfwfVthgQH6QbxcZbCvyPASMg+Gy
         X7arVDFBHEbKtleT/ofQsxSn+XESJqxJYnevENaY5mzB44F8K0+HGmyyFJ4BaAR+Oj9x
         MhzMX4r2EJaM5SmIarIB28ZIxqW9Ex9HKfzOzVUg4Fg0+t9dVnl7yqnJ4hvTHj57PEJE
         vvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PiRuS99+AkTRz0MXcWmZfyNH/KXYZ+AP4DTphBGSVM4=;
        fh=jM35r6ppznGB7USHramBUnRJH9rZmNVV6GfWObzgb2M=;
        b=Sk8DFG0kMrQtfzBb44N4/MrdTA+bKqUOqeKYVEAim2hX1BYim6H5fdvqUIXljz0P+Z
         u04JcCZA7bngDA8sZAUrg87NLe+RSOUs5Jmog1rf8LLIgh+H2bt0CLtrFTvCSWoaLqWE
         8HB+4EeK27k7AMVKhNmhFqv923WDHQJEmpNL6nLfLxtISLcCY+GlwJGR0fBVd30zIbys
         f81sWRac4oNMbl9+tl3yWlR6/4ueTfUXJfhFpC3bCtgThkkalTt4w5u9onkx5YMmRcxD
         xXcm+LC0OWM10Ui5M2U21iTxg1BqhndAXUxBLl8rWJ5CmnnYbXW83TAAH6FCsoXdhzTg
         iW0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794598002; x=1795202802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PiRuS99+AkTRz0MXcWmZfyNH/KXYZ+AP4DTphBGSVM4=;
        b=cYoot7unQPS/3GmA5SC0wFl6UOpV/+X6gCQJp4wBxSFo7t2KxJa2fZxp5V/cjZhU8H
         slv9FbVon/Sv65B6pgIsLRT7xer6EhVRTchVk2j0FwTg/ZfPdCLxuy3ivzehlC7Ly+c1
         O/MRP0xaSILFZNeFpSGbvp17p9I3PnfASo9NsG7qF7v/TmIgigiF5PEmzhCdvt6pDtVg
         0gNogHERceNCbPI6Nj5kOMrza+2ofQdvg2z+jsUWoyKcWjho6jjJeDMso5hWtHjx1Rwf
         mVDE2H9V5hW20AAM1g26zZPvxNVNeEguHXmLWgTkLjcUNK6AH8Jyb36IPwnnjRvJE8h/
         R9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598002; x=1795202802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiRuS99+AkTRz0MXcWmZfyNH/KXYZ+AP4DTphBGSVM4=;
        b=uY6WWHeNmV1cC825uuxiy7LIvGh/XN9DFq+bqMtsqakCgyrKd1P4itjiTJIbFn46NQ
         iKXY+0YF+Izi/+dg5RSqLb0WhlBFQ0Fs6hpbe6l9VnVal/ppJJHB6jIR0w3EcuHQDA35
         tKvmFv2r8f6JNUX0gtmyilakvZRPMUQRuXeSk88e5ySl/2CViC11A2B7WDisuTk7cBa1
         wyJUP6VJActcUnsiLzfZi7plPQvg3OSrOHP3PoxyOYdDDkP1nNpArDf+luG0IT34Xtw8
         D7Kk9XpNSMCGdwqgjx03ck1pfOJddirkF6Clyp0e8sIshOprOsq3yAObVktn8t+CnW19
         w6KA==
X-Forwarded-Encrypted: i=1; AL+hErF/e7k/aEFi3oZFG0OB8QEQF1awCdPiqxQyxDfhmLddcMVv7an2gG6xXUQs5jIMvjVLtsdgn3PMRJsNwag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dB++NndFHwn2tTLeojg6GaQSQUrwdP9bOhtKn4wNQsB2KbiEY
	+yjeVByBxEoBlNy6xEkSTo1ATyTTpYMjJ797nHmwdk6JDI1U9B8gh3Yf0sAs8W/aQBgrjds6WgA
	sQQy6F7d4cMrrH4f2ZHh2Rma001X7UCI9k4LxP7ED
X-Gm-Gg: AYBFou0JAsHSnpo8/sQbXizDIj+IKBu6vCwcIopVM4SWPcxnL0AN5HQMYmGmiAW8K+C
	/9k2UVZZSk8OH3BAMZlW3cT9Rjjq7C8eacNcd0Y9fA2GOj408jbUs45yjCuIuuHn6b+h/utH11G
	I3coNwKWRMLmk8wSp8PHxVbzkjg2tJ+4HsCg0lbfxlG/sV9PiVboRzlVyYRjMxgH84Zm1KG6s5h
	B4jMDeSksubfyZCWQv9Ptnz5LEV0ACxGgEYuhxNj7CFcBXzO9YUuGG1gbECWxqGSuebugEQSoSi
	8EXhW5Lhln6S5pE7RRx+1JyiWfuKPsXXn203l0uHJrUY+Ozl3HRah2wGoxzS4Q4KhZnsYmSW/FJ
	7TZ0TI+TobPC46FP3ROdkpMcCwH6zXssnivVJwhAsmRQfu1mDrF8V/IZM7JZ2t7RUbgMWSGQbtM
	rY8fn9XwZ91gdsJQ==
X-Received: by 2002:a17:903:22c1:b0:2ea:192a:13b8 with SMTP id
 d9443c01a7336-2ee0daa3657mr34970525ad.20.1794598002581; Fri, 13 Nov 2026
 11:26:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-cipso-rcuopts-v1-1-31ae931d7a0f@google.com> <ad935fe9-31c6-4b64-a715-4af428b389b5@schaufler-ca.com>
In-Reply-To: <ad935fe9-31c6-4b64-a715-4af428b389b5@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 Nov 2026 14:26:30 -0500
X-Gm-Features: AclHuK8_VELfOWb6QxDH9msFQuAihFI-MTzoli1CQDJEubxRePim00n173V_ijE
Message-ID: <CAHC9VhSzdLiJyRfv2+rScvX=6ObQavHvs_UbNKFDabJNzwC0Ew@mail.gmail.com>
Subject: Re: [PATCH net] cipso: stop modifying live ip_options_rcu
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Jann Horn <jannh@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	netdev@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:17=E2=80=AFPM Casey Schaufler <casey@schaufler-c=
a.com> wrote:
> On 11/6/2026 1:40 PM, Jann Horn wrote:
> > cipso_v4_delopt() operates on the ip_options_rcu of a socket or a reque=
st
> > socket, and tries to remove CIPSO options from the middle by moving all
> > subsequent options.
> > That's not allowed - ip_options_rcu can be read locklessly and must alw=
ays
> > be consistent. For example, ip_options_undo() reads trusted offsets and
> > length values from the options buffer.
> > Fix it by doing the modification in a copy.
> >
> > The core change is in cipso_v4_delopt(), the rest is ugly plumbing to
> > propagate memory allocation failures.
> >
> > Triggering this bug requires that the system is configured to use CIPSO=
.
> > (Setting up CIPSO requires privileges in init_user_ns.)
> >
> > Fixes: f6d8bd051c39 ("inet: add RCU protection to inet->opt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
>
> Sorry for the delay. I have tested the Smack part, and see no issues.
>
> Acked-by: Casey Schaufler <casey@schaufler-ca.com>

Thanks Casey.

--=20
paul-moore.com
