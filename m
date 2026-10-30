Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361523;
	b=ijP+J+SkKingqBolkzkRoYk0WhB80MRu9Mw9FmBS8mLGc94f8h+CIOtklm+rOnwH1hDT
	 RoVZ1ap6BJSuvLCvVw96MWVkJrbSmU8CX8y5rJIdL6HNFwdJA0RaFIvxppblaUFsFZ54S
	 fkSGfRn3LcHFsZQfzHd4f20ed7YLL7wENLRhUHbc4G1Ga0YZHu8YwVOReSBG0tSgtyt3z
	 iJ85O1FshjCs35cLC5t/djqcb0L/Eg5l0dqYM3GJdh8UILTCRAGSBafGkwpMaDAt1q+Bf
	 5BMCQrxrtnQ+5HP/xDQUFPGJm7/VSq95OmJ9XX/Q5Ti1DEvJUCWbO7JF9G0IpV0aWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
	b=aJ0y+FAnDJDESWYkFIdjTbXcdpyK1e3ZJN73GO0U2IYqQ1di0C5cyxOCkFipdcyswIgW
	 m6Yo7MZJBxhv2MIcPmLofDJrUPJKFHl33qldmbUolVFL4NGkpR3iCyOfcCCnYq4WAYNBn
	 m80HfrLFxv2U4+OMdsEIpaLswfRnDn7UaGGN4SJWHNP7f7tajv9wi3f4p+CX1msykPj28
	 lEG7gF9XgSKMNkosiSP3ZmVch19CkbQ//hX+Czn3sDzhFa+GHuCTl+aA/V7jvHLb0aFvY
	 UjT97AI8u5oDzAbeGxOKvoy30HBscY9ShqRHrDNGM5O/ibS+MpMmvx1eb+RypRyJwvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzQjvSxP;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15499606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15499606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzQjvSxP
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8246b13cbso5177225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361522; x=1793966322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
        b=EzQjvSxPLHZXl/YZUNvhgfWaApbPxlLlU6lJhGVAvNMA4rNTgQOpyqeOVoJV7wz/Kb
         l+ASFxCoumgSCUkrwzDw/RTdHWAmjwsjPtBu1godxRU2UACayyhZ3c9SHHf+PL2nudni
         MgAdtl861Otv8vDOWivq5XgCEzu7N2L3YtUQy94Z9r6BbIkwFej5Lch0JH4K3e9Pt0xI
         Br6B/q66ATElm15E0KXrqo4kKSW6Sue1etWi6ajgVNCHT+CT/oIGbvZCr5nqA8EdS7Xe
         hMMFuDkmIt+MxFsy3eGgMo34KC5dVpGH3kccckKUqEnGTECHpddHz89LseuJkB/45Yhk
         04UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361522; x=1793966322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
        b=uhoHJR/P8mW1FSdLCqFhsgWS+wN8mZvp7Dn7uv+zfLj5S8mofnqOm812dPtvBeJ0h7
         8S6wKA3uyxJNck3HUJrmQP2546rNn+Q65kx3658uANssYz2UCHfVkyCo8SetdzlsvfG+
         g3WOtZpYXSzIeMfARJwRmqFp78eYI3wUqXzXepFl8WPFOyfY+H6Sk67KMyu6j8DXgEh8
         yay3736uPE8lUAmJMmF+j8YfcBVix9LAF3V84yx6AneocHntGCzXResxL4SfuoGjxm7Y
         yZpxHTr5FuQ9bWASlljIFKm/pOh6RLOJ/17dtCuYwZhYUqaBdRgRMqVJBHDXkkf0PDSp
         JO/w==
X-Forwarded-Encrypted: i=1; AKwUvByQa5khD4FweOPkabaui18OHfpJbkCIda8a82zYG2vr6JTcWsDsgp89bU1Xt7ax+JHiWOt46Is5+g3HPUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgbX7t4c02HI7al97ltFOG4TlStD/5lExcpM/V0uS+mPXJSC6V
	rkQr74cnFombijxIFDLlmi8r/AEWkpt8I6WUXEKEPTFEmxqWX2Q+Xg1T
X-Gm-Gg: AYBFou0z5XU2XkSUcIJBLY/5vhEwWx+TL9benm3T+vIXmHhRTMuqoWOMYknXXgLlNeD
	fK6VR9WvGJivII93DuBesfMGQ+1TduJYkBcL5KP/uC10wdTtzueAYZ2L1OEze1Q1qJ0wiLJ+2Xv
	jdNayBauy73yPqGd7TImmU+Dz+x5VjKNcrwrpfh66rp1wHB1oC1sKIaP9vXzWhJllnhM2x41oF+
	f4wnplP2PCcGaoitlu29ja+m4O5+uoeZAKrJ4lHKN7Zx7F7R3X0y6j49an88Rhu8RnWjNm3Qz4c
	TokxtpH5D2ORyrQ23NFlJMqeZcIGr7mdD03lyMrdB524iJuIUSTfFQdxk15Cy1XBnY+gBd+T6fn
	qzdOEUqVqr/egEd4wkHjWJDMLkAI9Q6ELIhELTkc5rcXmZxc+hYdoO9+b/PKP3tMNzzrQU5zDce
	DH4Mg7v9IvFXGVEVCFNIauHCvU6I0JhkU3DiR0b8AxbkEcDzxpFBbbVOw+zwTnuNIpoK0u+Lot5
	xlcfvPuuUEVP7Lf+nNWgEcDdwUifZpVKoEZ6vxWyFwZijNi8CHZAi6OqYNzu79Pk6mU4en5GqCw
	ASRe0S07z2JhjgBLgy+0MQ==
X-Received: by 2002:a17:903:230d:b0:2e9:6788:9372 with SMTP id d9443c01a7336-2eb36515de8mr22854405ad.62.1793361522377;
        Fri, 30 Oct 2026 04:58:42 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm6175585ad.34.2026.10.30.04.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:58:41 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:58:38 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 06/12] rust: serial: Add minimal serial-core polling
 console support
Message-ID: <auSGbrP19XfI3S5N@debian>
References: <20261029-rust-bl808-console-v1-6-b736ee920078@gmail.com>
 <tencent_12B82162741365EE49D2A22CCDF2A04D6908@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_12B82162741365EE49D2A22CCDF2A04D6908@qq.com>

On Fri, Oct 30, 2026 at 10:16:11AM +0800, Shuai Liu wrote:
> Hi Kwanghoon,
> 
> I reviewed the Rust side of this series (the serial abstractions in
> 06/12) and did not find any soundness issues. In particular I verified:
> 
> - uart_port.lock is initialized by the serial core in
>   uart_add_one_port(), so zeroing the Opaque port storage and relying
>   on the core to initialize the lock is safe.
> 
> - The set_termios() adapter unconditionally taking the UART lock is
>   correct: the serial core callers (uart_change_line_settings(),
>   uart_set_options() and the console resume path) do not hold the port
>   lock when invoking the port->set_termios() callback.
> 
> - The console callback accesses to driver->state are protected by the
>   ownership chain: the port holds an Arc<Driver>, the console is
>   unregistered before the serial state is freed, and removal drains
>   the console readers via SRCU.
> 

Thanks for review.

> One thing to consider: SERIAL_BFLB_RUST depends on COMMON_CLK, which
> cannot be enabled on x86, so neither the driver nor the abstractions
> get build coverage from the Rust CI (allmodconfig on x86). Something

I don't understand for now, COMMON_CLK not possible on x86?
or you mean CI not supported?

> like "depends on RISCV || COMPILE_TEST" (with the clk dependency
> handled for the COMPILE_TEST case), or splitting the abstraction
> Kconfig entry from the driver entry, might make it easier to
> build-test.

> 
> While reviewing I also wrote KUnit tests for the pure-logic paths that
> can be exercised without hardware. The patch is attached; results with
> kunit.py under QEMU on arm64:
> 
>   rust_kernel_serial: pass:8 fail:0 skip:0 total:8
> 
> and CLIPPY=1 is clean. Feel free to squash it into 06/12 or keep it on
> top of the series.
> 
> Best regards,
> Shuai Liu
> 

Best regards,
Kwang.
