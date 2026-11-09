Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192268;
	b=3kAZ78AI3SHq/jEKCHQLQpRgiJMv8taZNHjDEfH8fKBicqcCtR7DGQY4ga275uAgiqJM
	 X1dOu4k2z0g8X/xJpuBZqFd12K/Sxw8IO+IWNRowF40c7Lo2Z9HdcNszNVsppxCBWp2GD
	 OPTbWWDpX5HYcRlqWdNcjSrmd7KXbJZxLazxMKqcjXENLa/CcBE7toeS/zOC/CSsDAXt3
	 Fvbwk3SBIzgcanTW/L70PsZHBvsVIwVQQjSxaIuroGLJabl1rmd7CHiuSf7mroKJvC2fN
	 TKQRKCbRSI05+AgnKeKqN9PN3OlNVpj4NfRAYXdq+O5UlNNqKEw12fJMoIEL2xb0ONA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
	b=ojkUu0n3Eb4rZW7ftgW6je+enedD8BqLB5VdLkhtUGob73kZcNDzpiC8VjKUbQJYYnBh
	 6mpbiQ3VjD1MHaisLtButKZTfvQzeS8eqkeBL8NipZ9kJYlTUbJyDlwX1CzpR2CWESuOt
	 wiiDqsxVMyppZnoFnIYWdlZKwp+8jXhUBCHckjoTCfJtT36nZ8779KA/P5joC0EpBc64k
	 rJtTLHgAISO9rBdNsIF0SAKdFcbRrRpAZP0TOlner8J5dhacHHCyoW+ATJ7XLSkmznZCO
	 CCxVu67QArd4lxYuntjWvoEqdcO1q++zpZkndQWER5pD/irDKV8oGpMFvUR17kDwSYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC79606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC79606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so812584c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192267; cv=none;
        d=google.com; s=arc-20260327;
        b=XdOP8EClCPsm6NKgxQ4FJEcafCl5NSe4EBXms6Oh6GLCj1iJrPPgA3EDbhhSlfIAiB
         3+a0vvNYdN/diK/5cpeLeSj9HSXdxketOr90sla/5SQ/zX+VR3upYdtz6P7OoyGUW6xh
         ccExnOlZztHkL5D2h2JV1V5Sw4DQuNPe7LguOmHbGA1Y42NonBGr+GPy70TsddyTq+bQ
         nmON/RZYyOPn0vLcoV0FiQil89fomzBe7d8QySJ1jw1rPwWtVUKjuF7DPqYYn72ynrfN
         Cnk2hszoDmlhZTQ14uixVtLQxJPRHv7TgfDfZe13u0lNUOJws++Cwh1yYEuVxBe4PZfp
         9Ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        fh=H+kYH4hYATH4LuJDaDnYvbMTvG8dzC3GFe9vgVm7wNA=;
        b=KVn6uhexItquehD8mVJppQMfrz2ZSIxxBOxD2LfcQZeTBz6fh+QqLEuLnsm8B2nwPw
         hf7k8w8orHFOeppDOPb01xK6C8eLNnZaGLNOuaR+Q1dNFnHO/HbuzH3hO8/rL62YncrO
         btumTTHOmU5U3PDsPy8l/LYMnk12rBppBq8wTF0AyJKHRDY+Z2wBSPbAIwVaqlFok6DV
         EK2H4HwJJ36frLCrkgRX4tIh6oRzhPIGhuWXMqvhxM+CZvfoAUzL0wAG/CL7ggprQnY2
         Vrpu9yPizCxuQPnqvaQx7NOFDZcUj632ASfoob4iSV2ODmBCFt6KPlY/6kb+xUP+4qMz
         NTlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192267; x=1794797067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=H+kwyYZEDd0R4A0FTkVD3QYfw31uPv8dnVBZ+nh7D3zue5lQXWlApwrN2t+qKvMO5X
         fosgAAv/Ifq3+tVChuvpbuxpExpKsio1+YJch0/8Z04kTStr1ucu4edsg9igk5Dn457P
         7empY6zGNQ92virgcqoWC7E30OTFchyuOBibYsJjx+oYXRRCP+9tKQyyFqdxCWicxT8H
         rPocIhDVNE2NPXXgM7mjHyytT9R0+bs/xEulfCq5iA19tOwiwOVtTElJbNUoHlgf3fy/
         rtbvX8kbhobLvbBzEFhBY+Eomy6OI2ZFLIfJl95SXChKq0pPhutZE/WaoHTKW0CHj+7X
         MqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192267; x=1794797067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=RNNv+0e4Bulk+2ZjsAT3D/6fzaMPijwF+ALDf1C9Lg/eitSd7/rX4veg0WTeZoN2OY
         tGYGlr2ZX3dafNWUAM1jXsuhIBPE6O1kORld1HCJPvofQxtNSn3XGQ2D9ft3kDUHKL5C
         GMddBgR0QBmPA1UYtX8RWCU/S/UxQPxT7r+mqQjAv6zVlD2oBd0L7+nZ1kyfP73hgQHw
         MVVNYtdnLJXqWCiR72Bkzn1+5xJZWJjlA0PH0qb4gte7/VnW53vIXyYDTMRvG095hTDR
         LMNo2EQslD+2dUjez4YAwCxpwSo+7oN4qI7mMFavwss+e3VpFyd6e2PYDR1EtdZ2x1m8
         3qyQ==
X-Forwarded-Encrypted: i=1; AL+hErH6G//hJ82ARLc16fxU+sli3pPjCgfHPgmuuhkdWrdrm+6iT7MgxOqQV3c6S2DaFmKsRpZM1MqcAugDuz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FYkktC1h+pfjX8MDiWZyHaFzt+MK3bG5uH5BUfTAovSVdlK6a
	NxoLBcuHuOUq7HAjXar+B5Jvz7hJmOwsDKZxBBiawiqb+DL1c0D9eja33V/gsIz6uWRSae8lfxb
	OO7UQh1/IV02ShaIrTtb0So8T6ve5sDY=
X-Gm-Gg: AYBFou0uENQR3J7yAMe+m92gI6Z9eu/WaNYFCDqTJ8QJGfdPEtDny4tqZnSgj/cFW4g
	3TL9iIKh/IxBJ9VvgzamKokD0Kq0kzUPG0EwSB5hgtGjDXQpQ7ExQhZ0SvMpuiZmwX54JolBd7E
	pP8w5Xte65rEoJuCIl3qNuNz1NxEbqAhZ2PyE5dDhCZbinB+pdj/Fwyt99BFJrOrfpb2WYN+/cD
	sWzOmvRiysbX6GhlvxlttJ2oJOLTHA+Vv+jFyay8QyWdTVUGfhcHgWomWLBvHtK1b+FHSJFUb1S
	j/p7GYC2CRMiQ6qtyMP5Q97eJN/UJWvtHF+mBdJwxGhlExHcb58k2VHzDliF7MubjBuCSYjMWao
	0FYknxwjz69YDzTCT0PW/I6wj347EJ9jVYYRbuZA=
X-Received: by 2002:a05:701b:2616:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b39fe291d2mr3839870c88.5.1794192266580; Sun, 08 Nov 2026
 18:44:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <20261106212939.GA1814035-robh@kernel.org>
In-Reply-To: <20261106212939.GA1814035-robh@kernel.org>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Mon, 9 Nov 2026 09:44:14 +0700
X-Gm-Features: AclHuK-MtGA26JxVmDU8vwHD7H1Dr6pcTzIJGZiqmr_2gGFPDRoc8BRW2dGJq-o
Message-ID: <CAAq9HC7Fk-duB0LKaDDKeEmLYvZuvWTBab-YpjS9x9QHm0z+7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The failure isn't fatal on MSM8917/MSM8937, so a runtime fallback
would work there. My concern is other platforms. Today, a rejected
PSCI_SET_SUSPEND_MODE makes the driver stop, which is the safe
outcome when firmware misbehaves in a way we can't diagnose (PSCI
has no call to read back the current mode, so we can't tell what
state it's in).

A generic "try, and avoid on failure" would turn that into
"continue", for every platform, including ones we haven't verified,
unexpected things could happen after that. The property lets a
platform that is known to be safe opt in explicitly.

Best regards,
Reza

On Sat, Nov 7, 2026 at 4:29=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 09:41:10AM +0000, Reza Kurniawan wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
>
> Is that call fatal? Why can't you just try the call and if it fails,
> avoid it. Then you don't require a DTB change to fix the issue.
>
> Rob
