Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662234;
	b=DTim8rdTnwegx2YC6yGl0Y5ncjuh5sAAuxX0awWRLkCPtcC2jFlcs42mD8KDBz+G7jD7
	 m0rQ+5gG9mh4Z0HeX07TRAKeJh6eT9y27bitLGLOZRAAEOULiRmpphMBqmYMbWWLuB76F
	 t8rx3MdXvC4qO3Is5htd1Ase5Ohb2FHB5M2QPK3KXJxi4TGyjW+RcDEKUW1Ealwx2+hDg
	 jb6UFkXoXnkbe4N1mOXx2G77rDDz18+Joip92AM+F3INzLS48KhLsMhnqKYi8u8aihJg4
	 +f2zaiciN8lqdjfnCzJ+LPmKWLdwcyMZnT39q8lR0WOwF3k5Xq2xPKu8dcYY85oDdrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
	b=nGBB2vFanpJAcUf840gM6WrdTQl1iwMEZ3dW2hGsxGKKIcbLxsteKMhwwztscQDp1yfi
	 a7ajUC/U17+Unly7WnwmcNJW7HwQfFnX0b3iFhxLUL6sfRzsGz65giT+hfYJ6u+jZk8f/
	 X+oAjzr5xBCsynllWcew8nri3xi3M/ClhH9+7ja1Fi1ZAapDLYmOrXkuhnoJkyBDdu7T2
	 0THtX3xkWo+axf2Ph5h+DhIuGbygdnh2Op0PIKu0WUpUBSy9RJu26x3tSfutAxwr7KDbh
	 YDNC8edNMZgU5rRVOUTzCmMMWt4LQTAnqwAJtywGoq62XLp7MDSl4aLrXUVV4Ni5LmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B9606B0EA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6B9606B0EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so316189566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662233; cv=none;
        d=google.com; s=arc-20260327;
        b=Be3FxvpkEyGDQI3HRdQ+tpZ5OdfeuHTu7hcsPdp0MeVEF4XtQKiV17Bmh6A7Cj2YYw
         c9kItoK465RQaody5l8HLXNQFkXZVPWAkFIKLtWjkYVZMcvHRLYryMKJvJ8BEZyegZ/s
         gG/u5MvhlOkoosaXFdGfUyedpIrL6cgODsroDT0nqcjBiw9XF3UHE0RlZxmawtjuRt19
         LLjep3NtqeZUqTWUXCVXaghUaX+eh9zuvMQMVAX2xoeEXdYh/rYJ/6CGCknUNmDar48m
         C/5fpYG4ldoWggeZD4gaUBJ1/LYM//4gMfgftMpEsB8g7W2RSLiWGCAMXOOCw9WqkXF/
         2KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        fh=Cv5zlEiqvsVntoLYo06lzcom/r/ES6MvGexrjVVPXqY=;
        b=Zmctth3zhxqw0Nn/Fk2KSsbpVzf+XCYOnxBboYqEGegrlgTTm92Ah64c4yiD43jAw7
         nS6hhDU08NMUKehkPA87akzJBZyGWqIt0Wp6MLU91VVhU83lmoZmdDT5odbJvupTf1cP
         mKrfVmguhnKygMVSjvXPe8ZmTMO/Unod1ZYjVNBO2MQ3dQWj5Ymao9KIUxcUiPjWMuil
         1Oc77ayaGcKPuBEGs6ofOp1JDlB4roOuVpBRmjBumybyL4uCFsc9Bz984Lbuo/mrmKZD
         9ErsA1eM/hMQwimGiddSIyRRB5Za5fErV5eud6i+cFpb7aBxgku1YC3t1bWpCcvm6EfU
         170w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662233; x=1795267033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=bkBiYsFfmEtp7IJKvH7hEn7KTFWusZlaAuAdlpmYXF803sUqFCC1KYxa9tyrf34zN1
         XEF5zkbgkyIS48qvP5a5GB3ex7t7UtUZYJboxL0XL4tLGHUYaONVZb6rUO8eATYZ1QXL
         8+UQQA+DM8uDBp6Hk2hDrEFaQbRoNXoI4sdU/oLAIoBHSwdiO0Ay272h0WfUXQYhiEyJ
         e2QaMbc1FuXjzS/yNEbZqG1YlIpj/OsymtVLBErLFBFscJ/L9ut44gQSUhbnqudxfjKt
         sK7WJvoJ/AvY0cJmbn/C2ArMEwRPABus1HpWmclIlurEsjmpX9yiYldYqDoxhrn8mpyz
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662233; x=1795267033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=H8adLX1URwVItNvNAO0HmwjU50gx3jBTFe8rhvx1mSL+4B5U5f/xOy6olUggjSHAnY
         YVkgSbBAcEDCFPpL6TCW148jmFosycyOkuegGXpzr9ANezFQrgkhc21cNbGvPe9VlwUs
         n+ptRm05/MHahpvXLIxP2ighRWeZnO8t0K9H8CNAUBtASrXmsEjtmBWkrBG31XFWColk
         U5dO5S1FYDMmZ83sLKAbh2b0Skh5QVg/KfwO/9D5Ky5joayrdPCR22a9CWX48vZJfUzT
         cJ4pg3Xhh/L0+IaiijwTM4Gq9oaVMzUuOVefHaht9DESO8aMlrC8OR6M8F9AW2ejhDRB
         U65A==
X-Forwarded-Encrypted: i=1; AL+hErF9o/BALtxZmA0Nhx4XUQye2x5SDCP3lAbfvkW5sh/5um7Ih6MZKI2FQ85+6oFCUQ6fBuEvcOWpsWR6ZYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88PaLXQGRW7lOpsBl04SfPBjVdxSw3sY+dNNBtiEsaClDNqzxz
	YA77ce6TI9ahR4p53YOidMvi4l5DFA+vhS/iEjNgCfLZelOJjwcyRMZxuHyHDB/DaZWq+dSynpt
	n1nfBz15xK+/FmGXvTUELikXyy16mBWI=
X-Gm-Gg: AYBFou3ARTh1LmJjHF/6/E0yfRCW3f9ia9wJjjYI+p4yBxIU2w7dqf5mncexVPKlIuK
	LKy8ORL1y7HdXhG5wyD+N7QQpVVjGolgyuYsXA4aM+Qtw/aEcfTPtTIFqlGhK+kEFAIJHfeCbZ/
	LgenpGBIG1tDvR+Zm3AXJLP/izX2hNVvEoRD3K9w+LqiiC8Kx0COjeA553REXd1uWByYZ5w2T7u
	zvgjKpdFd3K83WQGcGSy611HiV3X9rrL3MKlkohL/noRcRzgNnrzHwM1y2ohHUX2xFkrrxYSu2z
	P4ZwP6BN1sYUcSkMi8zzApL/Vc9BTGQfNDxC2sthGhzwcqGy/nFk7p5TzRbNZLuiX76QD3R3GlJ
	yOUmiGd9ReNhPOWhStUOas9QKvnwIAhZqsJOV0Q==
X-Received: by 2002:a17:906:dc91:b0:c50:5a93:3bd7 with SMTP id
 a640c23a62f3a-c509614d52cmr448037466b.3.1794662232406; Sat, 14 Nov 2026
 05:17:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <20261113-good-renovator-99924ca0d55b@spud>
In-Reply-To: <20261113-good-renovator-99924ca0d55b@spud>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:17:01 +0300
X-Gm-Features: AclHuK8rhFfFvkBwbKflVQt0QnoMak0rCeWcBpwf3o6KE4ySn9wUi4t5_Sc9CCY
Message-ID: <CAOPX74613tpMONAYkvY+6=UqDtJ7h8r8FmHmnodmNZ3Zi3RBbw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: Conor Dooley <conor@kernel.org>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Nov 13, 2026 at 8:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > +  leds:
> > +    type: object
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
>
> Please add some blank lines here,
>
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
>
> here,
>
> > +        properties:
> > +          reg:
> > +            maxItems: 1
>
> here,
>
> > +        required:
> > +          - reg
>
> and here.
>
> > +        additionalProperties: true
>
> This whole leds node needs to go down below tx-internal-delay-ps, child
> nodes are typically sorted after regular properties.
>
> pw-bot: changes-requested

Thank you for your review, i'll all of the above.

Best regards,
artem
