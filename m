Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793926517;
	b=s9oPrls9ZxRpvi+T9XifOPXOSE7kTlPK5JBysfVooXkINPVyhV545Rz0ABk2qQJlxsDq
	 6ZcLiWI8Jy3AN+EIOmt2AmSJVO6w9yx4x8ElzViAgQ8kSTldCbSsYYivNkWrt25YONY9B
	 Epl5xvo9sjGyxCPgYUfvjReXCPzRtFtu/6Bso8uLL1OqNsjJRiE7bDbCafsLA1Ff11dJF
	 qo+CKexDGP9FLH8VazXzAysYkpz24lOlq2Lmik3bV4JZMs6Je5C9bnGjBBHt2hfHeeSD0
	 No2tieqCEBnufS6n36wwLh3LXo1h52JTUbTTGr9mP3z5V4S9Mkn89EhW/oiIqW3JznA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pvie7FxBEE4F5TaOVTDF1PFxgKTWTgEZbktYHKnnLNE=;
	b=kq8CvDAKJ1RprsgOUvGYnycjQ/GrvwqsVaHx7ZdfOSAu48nAXExERucCWUakEvvnKtnZ
	 gJqeCsKwWK1JP5aGPNmeseYp3YcCkbdk7IiWPvRJOlvhkmVeJ17LKgoG0JnETqgBJMHKT
	 5MkQpaEgTA0LCfYlXikmdcrSr2TyePn60+/L5IavIdKyLIroqbpmD9UwzHK12l27/9uhl
	 qprUpcwQ0VbklFYPJ10kzcsnDTfu//mrQEC88QeSJnfjmOOYitvlbosEYqbfPEy/SxTaa
	 wOQ4+ZG7p2i4OTFVmXaAexVx1JQlVngcB/H2aDSNwByOnA/SrjJm+Wr/luPXnoE9dHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ISO2iGUb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE951606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE951606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ISO2iGUb
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso507a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926515; cv=none;
        d=google.com; s=arc-20260327;
        b=UxaMYkW5RsjV2shd3BzhCdwxSvwIAzqDdKCKBxHGiMRlkevihLS9hc1GABOqtK9JI5
         RdQBN+bNr7L6L/t7VrRCp+386HIny+SEbLuxzKB3XXs5Gm+JLKWUWPFNZLBDxsXrFgb/
         W4RdjWzLwtpbWWxR6sIjrc+g7Rb2veapKd1l2JVTljz2c+zDvtKOX0uWGB+g0lnsZDBh
         YTq2hfKdSwI/REBye0b8uWOvBiw6TkiOz0T5HpDqUnljdIvPYmmPouN0IcusnX1EKfen
         qJQW8FVn4qFWoNjN7MubJmrWYXxoK5C9e5E/rWvW5EMZZbg6god5iMLl+zSbCAqVQ6G0
         YEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pvie7FxBEE4F5TaOVTDF1PFxgKTWTgEZbktYHKnnLNE=;
        fh=NKxnBtfOfNjKRBqsV/g73eXN7yLUbkDnUZ65ZyEZCpE=;
        b=a2eFzKRDeaLym2NA5oA9Fvo+xVzbYgT3ci4tK87OfDK41J347+wCBY4yEiOQH63mrB
         b2k+/V9pnBPRsDC39wRxC9ZWlerleM48G29c/NlqjZIJs1ICNNUgcRzfvXvJmAA5tVeo
         s8gkcfa+KuL0MaRD8eMqFE33my8482SnGrhD45i9no/BlBA4MIfYsYa/2ptCwEsJ1ES5
         JN2FkIDGYmNhJ/HMYnMxkWjTvBv47+NLnd1Bgr0X9ni3NYkP3p6ZR9MpMnY9eGStigYV
         9Wjh6VGSiKY/Y9azIeDx2tWWHMfvKm9nFEC0p8JxRAp9qUoYNT8lK7PMAqexpLcfC67o
         5iQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793926515; x=1794531315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvie7FxBEE4F5TaOVTDF1PFxgKTWTgEZbktYHKnnLNE=;
        b=ISO2iGUbJyNCA/wAEq2qLo6dBg6+FoJRGf/RmqnIrc2+/+FPoequVAO2bp5ik4hdgM
         W8N7cUWtI8lVif1u4+kXZMEIdjFnexn7Tegch6r/orESYyzoHEwxkdjFXvdUP6EXWeC2
         TZ+gWacoD1uuP6mRC1awFQ1bXQbX1CM9xvTSQEQGZqibX6iSY2k6+4Lw6T0PqEir0DRP
         p3IDHjpVoaaJx6Hg995ZuhualWg/j/zgW+JzpRf9rmxh82X2zP7R8j/P2p2aHuHY09QN
         bTOV+phN7ROVnF32m5+kgBpUViZ/y/naJhljwWpI2/8JDMcvvHSJYU4imAS/jk9EXO/J
         t/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926515; x=1794531315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvie7FxBEE4F5TaOVTDF1PFxgKTWTgEZbktYHKnnLNE=;
        b=UQEFKL9TGrtnwIwmygVcuek6kl/WR7EMtfy4WYNDZo+/CHwYKkjHLN2aHUMZomyvkZ
         hPcIsN4BiKwFV8aFmDoNWnzCIm8VRC62AJOfvsk+hahaU6ysYXPbuyBgIUIzDaeJ5BAe
         xt1dvhRPvVSzMIAQ8OhtGSkGvVxT/W7p/JTicVOXF0QkFfzF6O+Q765COPQBthUF/VQX
         ZmR48qWjUqiUZupQ2iY6WVFsE6y15eyh1SsHzPNTTFqoMWJRSgL/dVWrHB1AVpdKTs8k
         9dfEUBjK7kdF6QGgo6xr+cGWMln1jdPSp5G0RyMA0tSPiAPWG0Swch1MThFICXIaYSKn
         CZjA==
X-Forwarded-Encrypted: i=1; AKwUvBwmZiDSjrmytLaYFT6MEPajOKa39ShHEoYuHp3hT8bW2Xz345GvuTONf4qguwz9nphMiM+anNgtjYHWxcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RLw1YufAbmu1F31ub093LApK8e+eCkmx5cE2aYZJec9JAWL/j
	eYR9ZTYzLDgR0HIFTnU2sjFGWVtwZiT7pHmvUdeM79LJ1H1X93hb0WzWxSN5brGDZPjiGQ3z7FQ
	5By96bZFJUXm/XiCXD91jpA27Kes6ya2/B13lRxds
X-Gm-Gg: AYBFou0gXgJnklM2CaCquLTFSy3RmPYM4vgI3w+/45eol87+RfxV0FdjiiySn6Jzg/4
	Rc8oJc6hXSSTvhksA1cAOZCfUJKoS2YMHtM6d/0KYeDdVg4uMLc5fvXBbmyh6bumepSoK70cthy
	mOaXxlUaC28xnRi6LFkAcDLWGC59vl4muSB2mZNS6Fvveh4WpeeieovNPnvxw/E1XYTW7CvU07l
	SsPiW13BxusLtr01jNPPAwR+rwm6w5+gPQzc+61GgM9VsCti3TZXI4lVRACKMG3hYBbWSjfH3w8
	4q+M5fjpTjpEpdniKVfNf+K2a3PBsDqI0xJ7sQth6FnomHQQY/pSzZLKG4Q099vJ/abc8PjObSd
	4yh2w+2foIptQyWjkIt0p8mAT7pvQuSbIqNHMW/sbu3/eOClbiWI/ORQ/PqzkfkX+nW2WRDYhIl
	7/98evnguWhlNlf/Un9X5//YI6
X-Received: by 2002:a05:6402:c522:10b0:6b5:76b2:5e18 with SMTP id
 4fb4d7f45d1cf-6b5977846e0mr49036a12.2.1793926514814; Thu, 05 Nov 2026
 16:55:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-11-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-11-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:55:01 -0800
X-Gm-Features: AclHuK_-OK6EgfRmV9tzgyyzokHRo1Q__Zmpl2-kwo5V2xZOFJ29vYCt0VgLuqs
Message-ID: <CALMp9eRwVfSCkcZ=hbaPO9Xp261wCSKbB-rHYHxbNtdxCGm-Hg@mail.gmail.com>
Subject: Re: [PATCH v8 10/20] KVM: x86: Support EGPR accessing and tracking
 for emulator
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:37=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Extend the emulator context and GPR accessors to handle EGPRs before
> adding support for REX2-prefixed instructions. Like VCPU cache, the
> emulator can uniformly cache and track all GPRs.
>
> Also replace `1 << reg` with `BIT(reg)` in reg_read()/reg_write(). The
> former performs a signed 32-bit shift, which becomes undefined for R31.
> BIT() instead shifts an unsigned value that is suitable for all indices.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
