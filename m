Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BA8419FDC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187105; cv=none; b=mwmTcBwW/aRHuyQW6gPP/bIsnjva5Z+akUkv3KzJJeuqEKD0j3JSp6un5Jpl7Wd6TKp4G+mOnxT5Oh7ExN0WQvgqB4uB3JC1WQztJ6N7JnounM122pOwOgOjar5kypN6fR03/SX//15fJIst7YlIrduQf9S0FCbOol+G5Z+QT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187105; c=relaxed/simple;
	bh=UOcwMEFfMVyn4eqg19aQuNNqo5Ku+M5G7VqNBZwAIVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqtUQY2TskaHw8P7nBnQr1rs5Z6x/AE21OymX0r+VaCJ6B2OHqGrbyI741Wqr8XIuNaX/q+aXqKim5+2itoQvzYqdY8bNB5HXHTgRHcZKWSJJwAEMPzwSor13QH6rjK+MqANDkG/Hy53OjNFy+BHEptxx356TY54hU6ByK163xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=PycPI/TN; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="PycPI/TN"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b056d58f2aso3591417b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187103; x=1792791903; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRe2PR2tdyQY60o52xnKS0aVdTlGJcembbzwjk6xYRs=;
        b=PycPI/TNpXsV4L3cHfx6yLOAvR5BhAkDTjqQbLZ+AvzkzMg3oF810BUMgpwlb9EWag
         8jCOMdto419UXSkGTAJtrq+O7tXzHFHR0mUJsZ94QKcgUNmYJG4ZnG0IobKVZXnO7N3f
         gr23lsoS6SpO+68+6v7Ip+kYrTOK9GL82eyaJxe3alR2zWtkUG8Oeu/Mcz/vmwkLPSBy
         b31XJxNhGumjGjaGtGuS1dYG69Ni5hhw345DD7FV/dETyprK+7hdN1VvbKNvUErRw9JE
         uTdPnD5y5Lr2C8lEQXupnruZivBh55CeUvY7jErpIiApsa7WKNG1mx1LQFFIXsZZKNzr
         8W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187103; x=1792791903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hRe2PR2tdyQY60o52xnKS0aVdTlGJcembbzwjk6xYRs=;
        b=i309N2TN+Q/LDTiLOdaMaWsX8dq9wb4bjCmuqJxxNCj6bAz5z9frkhciG09ALXh0Yw
         OsMpyyyjBR0HHLxw4BP4E9bR+6NRaFw6FLNcns6I4wONy6dIF2lz47+RRFcnvA7MeQnZ
         GaN9W1TQpNOJCV9GgTIJnxQuciFsfkElB0kxQwFcvle2xeLlxOuzHguA7/yVEh164KVj
         8RtZ0FBCUiQGWkpHSuFBRwMKPEz7PmkqyX4s1oLWQvtWxzJV3J2XYoTL7xPNNaVZZW5q
         3Q/7bfhzy0aVOMZEXkzu7FgtawiG8+zH9Fl/YdhDbOVSih74oBGC2b5jbfiaxzJ6okU2
         RnHg==
X-Forwarded-Encrypted: i=1; AKwUvBxneq5Iv5kXeZPEHs7NKxK7zf8lgvY42DX88+D9R194+fTwnVSh7mveJuLPd2zWUGrAgSNgkaKjbwl30bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwfasr6Ff3j19rf3UudbrI/WB+0Q1XGcAN92F6r/wxThM9w//Z
	Sz7dahscMyrpSaEutd9g9jbeYqfzbd+acwPpshizJ+989V8NqjFxd6sXWR2MkR8HR1o=
X-Gm-Gg: AYBFou06y7v+q7+YvqTiW6XQDc+oD5/etVjqOXkSYWpWjP/1fZIwGmqK0cP7AbUdqBq
	UJm9GR0tfgur8c2Vs/teNPPPw2+kUUV1ReRZCCs5ft2PLg/ErS5d70/lcJWvIjSB/0Ag83ezInY
	C9dyB5Rp2Jco8sl+yPDu6Ih/tg3IEfz/F9cwoj0UxSzSPeItjCaegqPXh2GYK32aNNgF4lv/btm
	ic7TUWTksw82AEtPXXqe2DO9/HVpFdEo34i1jb1Dw2CgPE4p/pvq8daSE1FSzAi2ytdy3gvyEDt
	/2u8XE+Uyfk4Ozs6H1YKxE52tHE+YJqR3N7xI/NkAMs4bJ8wwp+lYHZWx1b8Dn1eejUVKy7oGK6
	vLY78T72h3knQUBBWVEl1KnI76aPoTeTtdCswtdNuMDh4+Gud8SYZPH/70R4TJwvtERbBn0V0g3
	MSFFwMqCrWnF2l6iJU2PEROxqn3kcnC5Ir+MnO2re5O9vZdA2uLxGCncanlf3e6zrMVJRZhDN2F
	XVmESV8sryZnqZjlByz
X-Received: by 2002:a05:690c:dc8:b0:8b0:cf3d:7b39 with SMTP id 00721157ae682-8b0f2163c7amr4052177b3.38.1792187102771;
        Fri, 16 Oct 2026 14:45:02 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c2esm14150177b3.15.2026.10.16.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:45:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:45:00 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re:  riscv: hwprobe: Report Supm only when available
Message-ID: <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>

On Fri, Oct 16, 2026 at 04:26:03PM -0500, Andy Chiu wrote:
> On Tue, Oct 06, 2026 at 09:53:01AM +0200, Radim Krcmár wrote:
> > The RISC-V ISA defines Supm as
> > 
> >   "An extension that indicates that there is pointer-masking support
> >   available in user mode, with some facility provided in the application
> >   execution environment to control pointer masking."
> > 
> > Our facility always returns -EINVAL unless Supm support is configured,
> > the pointer masking ISA extension is globally present, and the user-mode
> > is running in 64-bit mode.
> > 
> > Hiding Supm in compat tasks would add complexity that doesn't seem
> > justified as 32-bit code has no reason to look at Supm anyway.
> > Reporting based on the a global sysctl toggle isn't done.
> > 
> > Do not report Supm when some harts lack the extension, because it's not
> > available on any hart in that case.
> > 
> > (Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
> >  violate the text of the extension and we ought to have Supm7 and Supm16
> >  extensions if we care about precision.)
> > 
> > Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
> > Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>
> 
> Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
> 
> > ---
> >  The compat hiding and global sysctl toggle better fit in Andy's series.
> > 
> 
> Sorry, I am not aware of any ongoing series that does the compat hiding,
> but I will keep an eye on it.

Now I know the series you mentioned. That series was dropped because the
mechanism was not in flavor of reviewers and we are going to deprecate
the prctl[1]. But I can see there is still a need for understanding if an
extension exists at runtime. We will take time to revisit that

[1]: https://lore.kernel.org/all/20261007085126.222688-1-samuel.holland@sifive.com/

Thanks,
Andy
