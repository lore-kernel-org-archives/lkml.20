Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF53552937
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083605; cv=pass; b=S1iiPtw/8eUns5KU9jTdyaXrlE6NyVj3oPCZY0AKoCtWc/ZCgLAcCXHRVX1oDTJetJS8PiUYqwiJDu/IbH+Kydtx+IT5aDvdNUEBvNHCPRqSf3br6kYxnm8ZGcKCj4KEhcX0v0ZYRkipfu2QbiHfYstIaa/fc919o+CkKxh6830=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083605; c=relaxed/simple;
	bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTzNiN/FMkrYvezfmDIYbI3K2I5muRmLsAi3EbQVU1iezwBp5EzyjcKvRjLmyyABmmvzdGUdgfxuZWASi4IeHI383oKiOnUD0OM6HigENDhxZFNrhvWohUqsmm2PSLxBMNz+Z7Q5uz+2JqF9yFNAZX5RtpxbFVe+H4J+S5U4/WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g75hIR5U; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g75hIR5U"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so2199245d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083603; cv=none;
        d=google.com; s=arc-20260327;
        b=LNWBZH8l97/jrcR5ZqAbMkgWf79whNz9miuVA1KcUFq4g7mPX7Jcn2RLFPAIJA9OA9
         30JevfmLDYaGtTb90y88ejQujfNTIrh7NreINfexK517OaqfijVyIRO5ZPViEmh8pj4N
         JuNZw73wOrT7bsTrKsEQhedbximVlIoyQy9VfXJlS21yX/6I9ygjC6ixuNEC0BMCAQ/H
         uRYiKRs01ofMbj7ObEu/jKyTLFc1XABLlUzY9P+ICcSQFQCy5vgaq43JDUEVccoXBfrx
         uo+UtVu9t2hrbf+Ow8xbDJZHz6EiGXbOB9ZsujRK5xrmJNlOshKMrAbpZSABaNhRUqGR
         +hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        fh=TibDp+U4GT+1td+LyJZgVaCuQ/FQFjJV8syD0XbTENQ=;
        b=l37csxD5M2/yNdG81sM1HAlrvG1BVNNxHT5VKw6T0T8LGu7bpHNL6puuGQsw82NPuO
         XGZaVmPWTStYfZFzbCunPthfHrL7CC2LHgTseFM776RnrUGwpyz6CYi91p9iBjpD6vab
         ZUsTq62rq6qklH4KPCOOyw/fFjuznafVXFoWdm/NoW62s10BswoUpHrvWBqwcmd6jALo
         wClLBBzELHdnEhd6s8tjzwcW48NHO6vQx8nck/X1WwnHdfpTEggiw3EA7K92OIF9h2LQ
         U/5LCHGkkfwFyGtZQOEr9fjpsZlkJjOo/zsNKUb8PMOMQhB4rq6RNSaPutHW6pjfqI/W
         XbUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083603; x=1790688403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=g75hIR5UuVknX1OcK23E9JT+2EGsFu06ipzx3XkK288iChAS54pYGNDgOLyGLGMlpT
         GAcczYCGRR6ckNGXcWBSk8+QEruijUthVehhwdCAxskMPD07aWshTQiVhcpXSMnIm3qG
         BZXdU9Pm2KOQj6mmoQv6bSkm7FjL/8WU7MCARH/TpAt8nbOdbeJRkVvBVyDV5flcYKPp
         zZjcReauhKT8/GYlpu8/F0GZjkD25cBMl5Xj1e1qaUIWWMgJawk4TeZqsNWJCq7r1W/Q
         jgjyxzQ4WUBFUQz+K7nJDPf2YZMCq6MSH7ikEvJS7jWOBwcjAR3zd2/HvsFEsRuRw9q2
         WQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083603; x=1790688403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=gvEVa2Jm26dwv5w0KTABrEK/+gfVJSKBX64V/MFzHzE8NMh0us02NYO3XQrj+pcwwO
         v6owIl2o0wPd9Sc/NyQZXdauUdqQ9yM9IlwjYK4gAPF0UncWaNpR5UUn8OcudnI3wD99
         2FDbxqBQS9qeDxiqxZBoaeCgYhOZm3uof/Nht6JWybukwljMfJKvW9bl0+7KHcKdzfbT
         zWCo3BGNYOzGckwL6iv4MHpafrwu8HaWDqlw4AZfFuoysAsPc7+WGV/2w0CKCxWRRzrx
         EK98tin0T8rPHYxjUTLwhD+umMLr+/AXenx3L2k5zcZTfDpk269rOjA1Fjv3NVbR97S3
         LBTA==
X-Forwarded-Encrypted: i=1; AKwUvBxpBniFU5/dwt02Knrl09O86xAHqqRhJyGh65pJCL1P9/3nkmAtinlOBzC9Cam2sZUEUnxg7l6cnkgCtAA=@vger.kernel.org
X-Gm-Message-State: AFuF++liBipY89ah5+cSrT1SZ3tbOpY+/FCMqGVZY5YXQEDMPYoNEt7r
	UjZwAq0EyEFj2qPJzM+K7dKFDMC056lypCsAgJ7EvlxNXPZOI8OedU1h8394L+c8OhJsLA5h1mx
	cFvqlz/d4G/oq+qQf7uG/U9igzlUk/08=
X-Gm-Gg: AYBFou3554Bk4864+1jL80rvVtcrkuAc+eJBs42e6dQ7gWrtZ8bzZcE3FwJFa6IrMzp
	hwnF0Lxy1vmSjUDYytlsorRYexDqrNgeiGaU/ku4eXTQtR1SYlaBwVY0cCy1NaYqxvQ2czKQfed
	rg6ZRsj8ylyJ2R6acYnqxNZbfQTsjwMu4triB9yAfRbHT1q2NgxefFBypK/rMQqtr0TTlgCuoCI
	PDh9g0gYtz4tFEyOtDm1FN8AjduzdiZDTZARsJoZjtxS2USOKmkvgTEnIZZTQdfNsCdPvWurluN
	Nd02pbW1a7gIZ2/UdE0iiVBmbUimMPizvm14iJV+wgKRCGxCdW1FGBkq2MnRCnPJ38DfiQ==
X-Received: by 2002:a05:690e:144e:b0:671:4e37:a832 with SMTP id
 956f58d0204a3-672c2a1492amr1424683d50.22.1790083602711; Tue, 22 Sep 2026
 06:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com> <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
In-Reply-To: <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 18:56:31 +0530
X-Gm-Features: AcwNN1XaRXA3PPjiOAu8sy9beqIj3WvHMknSJQK0T_ZOITGdCWmSpx7UdDH1Lq4
Message-ID: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thank you for catching these issues.

You're correct about the defconfig. I used `aspeed_g5_defconfig` for
the DTB build and incorrectly reported it as validation for the
AST2600. I'll rebuild using the appropriate AST2600 configuration and
correct the statement in the next revision.

I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
MAC0 and MDIO nodes, preserving the scope of his review.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:51=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 9/22/26 2:34 PM, Prasanth Kumar Padarthi wrote:
> > Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST260=
0 SoC.
> >
> > The series adds the board compatible string and describes the BMC memor=
y, SPI NOR flash layout, UART console, GPIO line names, graphics reserved m=
emory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.
> >
> > MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID =
mode.
> >
> > Changes in v7:
> >
> > * Correct the GPIOP bank line names for the reset, power and NMI button=
/control signals according to the confirmed board mapping.
> > * Remove the obsolete GPIOF5 reset-button line name.
> > * Leave the binding patch unchanged.
> >
> > The B650D4U DTB builds successfully using aspeed_g5_defconfig.
>
> What? The B650D4U has an AST2600, so using `aspeed_g5_defconfig` means
> you're using a config set for the AST2*5*00...
>
> Also, please preserve the trailers from previous serieses (i.e. Andrew's
> Reviewed-by trailer) if you don't change anything significantly for the
> parts that got reviewed.
>
> Tan
