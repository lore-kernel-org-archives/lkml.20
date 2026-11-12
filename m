Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522865;
	b=fSpc0iGKRMWwlF3FXasa33SU4xzHiEa3qszbDPwOCF3dp8jAY6YzSI52scRhb/M9tAcN
	 k0abWNqou5ESXNSCCNgMYPOQsyIz8L5/bSS+tu/HuiVAVh8LsarDT86DzwsQfQ1Sf0Q/d
	 oQdVYF2/pcSIO4RFojhRdM5QJvbH56Ko4mX32Y1S0Kdd+L2xyI4O0yTjOGX8QTyg17HY1
	 GhwgDgfJb3qFKeVOUWEg/RkIiW2ZmO2tzveK1YXXBe7vlXi2Sb8vu/xOUoiwkgEbjbf+0
	 bRZpTuaXsHhVwxxEQi+0R+8o/obxT4wLstJbIcbbOmFPvuJYfOpLE40fKfsdRbxrfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522865;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xGWAwNDnbQAoH+VcWS/eK1bc8gnUFywi2IqyuToUcKQ=;
	b=B187oyuZhIWYkYE4x6/TVDWxoZnO07e/OJhR/xvQt4MfIz00udFrXglRGpSEbFa1YyWa
	 seDaJTXGAdeR32feD16fiuofE7ZswHzBc21mm4LUw/4UAecI2KoAxAOHyfo8iWI5fg9bg
	 DZ3Hl1cgW4QwlMGNzlL3Bvi3RaZdE588Q0wiRGY9e2/iQHXb5tAdoX5SEyvlnpTRs9BrT
	 1YDBrW0Ppadna9EI5NP6Av5tF0lkMTW0dhTolKjmkIYSRrvN2/B1bGBZSh+O65pLdcasW
	 kCksAFFZ7lJ5qHD+J1MPnbC/wY4Btu3lWSq4mBRbD+jeRF3bYf+HaOHAxPdDS3NOzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2U5ZZm6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC23606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2U5ZZm6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426CC1F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522865;
	bh=xGWAwNDnbQAoH+VcWS/eK1bc8gnUFywi2IqyuToUcKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E2U5ZZm6jS8B4+jl80YtHjY4vgWgA2R8mTKPHpxwuyA5oK9Q+ZugRcJ4NBriynvOz
	 hjS0onr5yTTyNLmulKlpnexs6WqMXTLzUQLAwP1ZNqIQg6I+aobsX0OXjWUWfcvH3y
	 lZJT+mIRjhEeIn5XqEMLt6fylWHq51LGTGUhcjnXW0s1jOZH6+LvQMKw/8Dj1BdH1s
	 05Cq0jyjtd7dFftXd984daBsEKn+4r6nsxhrc+NacXIU3zZXwqPhUidhfWBntT55tB
	 roT2O5nP875Tnmq5tehni48fus36Jiv9f/O7sZfWFe9IUNUCKvQJDNWD3Wi5kAXUnR
	 GS4wJRr6/GUdQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50933bdf4bso20251866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:34:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGmjYWvJ40uU3ZroaDk8AYzPzgjCbHp4zKMRZJ9brDl+1QjjrrqF5vEsSIeqAXWWNGgmaFNMsYDzd63zc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k6KeIuMoRpy0uX1qdGaU4YosM+FZljNuZPaGI7yzl+1mg3j3l
	mo4Ar/JO7wpYmd3x5TNXSPBwBNqKnFWwu+2RKW3gjvZdPtISJUO5G4aFipRIkt5mZn3wXjyQL68
	lOcY6NCDGbmkExhBO72AaVDsau7Vrc00=
X-Received: by 2002:a17:907:7b8c:b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c50963856f2mr54017766b.15.1794522864032; Thu, 12 Nov 2026
 14:34:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112111637.184045-1-koray.fra@gmail.com> <20261112182737.1659245-1-icb@fastmail.org>
In-Reply-To: <20261112182737.1659245-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 07:34:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8k8uTW_rLRADHz9mA5VFm2RZj1v6r=H+jEF95912XTfQ@mail.gmail.com>
X-Gm-Features: AclHuK-zDwCv6-7jAZ86Bdbg7IgiGEAgY_lu7kOXMxGX-tXuRmxUNiiyyi_ewJs
Message-ID: <CAKYAXd8k8uTW_rLRADHz9mA5VFm2RZj1v6r=H+jEF95912XTfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ksmbd: fix negative timestamps being saved to disk
To: Ian Bridges <icb@fastmail.org>
Cc: koray.fra@gmail.com, pc@manguebit.org, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, hyc.lee@gmail.com, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, bharathsm@microsoft.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:27=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> Hi,
>
> On Thu, Nov 12, 2026 at 12:16:36PM +0100, koraynilay wrote:
> > When setting a timestamp before epoch 0, ksmbd converts it from NT
> > format to Unix format without normalizing it, leading to the nanosecond=
s
> > field to be saved (on-disk too) as a negative number, which leads to a
> > garbled stat command output and a reported +4 seconds in the timestamp.
>
> I tested this with the ksmbd code from ksmbd-for-next. Before the
> patch, setting an access or write time before 1970 with a fraction of
> a second stored the wrong time on disk. The stored time was about four
> seconds late, stat showed garbage for the fraction, and a query over
> SMB returned the wrong time too. With the patch, the time on disk and
> the time returned over SMB match the time that was set. Times after
> 1970, and whole seconds before it, behave as before. smbtorture gives
> the same results as without the patch, and KASAN reports nothing.
>
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
