Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793351752;
	b=CUEcy61a7cE4sxDc/KCKD0TxweI6cQTWD4FajLCQRtKTfllPNYdftMoRErxxPfax1Wt/
	 ileeVKgeFQjHJF2wOVgUfQfebTihKDNQLfde6liA/RRc4OGy+aTIAgw4QtMO14C86PdF0
	 bonFrEPQ5JDgAawuD+hfRmD3Uj0FBHEJDErjpjCnUOtU5tVie7F+uUF1GbHNb8zXIM0KC
	 paqFS58AMVufuhd6fRVRLqGyJc5uVj5nkr65LsRymxY7nDgmYId0sZFfHlW7RRomBLxVs
	 SJTr06M94B62QOCdvv6YgtZh8AXKNLvHiHyICYdYefuMgRJtyGJxbbDR86qIZ2ge41w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ic0l6s4/vCSv2HTg51cnmOpg7vz5TShRFb99sP2LwP0=;
	b=XusZRm3wO3veFW25rIKokeBQk4eImvci8JxxfC5yZoZkEXt+fWDcjmVnYiW/LW37oVG9
	 SQo1v7XRfw0ohYwxMPi8+g+j1fwAzVLJK0eNR6Ya/ycPMe7Tw1vITSoOKZwWxP/+5P1UP
	 Cog4G+liPCaG07d+QMRRJqtDxCADpgGOnbgxL6q7K9LA1w4fE4XkOPeZgZa6gRjDUBCSC
	 5OsC+xszQiIkulksS5jHF+15dmbmAX/+J3qwQaYs0CPK9KD7Uvm4gVyD0N0Ww9vUJg4rJ
	 LdgFnwBaqdCMQaD8LJEdTUDZqEiQyfXJbg02iNa596CAvQHkiBAluAtX6AEo+hArZ3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfLBsasI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB91606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB91606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfLBsasI
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so523609e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793351750; cv=none;
        d=google.com; s=arc-20260327;
        b=b9B9tz1eKATUZnWHsLvP1kl8W71lRi80iz02TcJZIfdK5fBOsHytfPBDYKfZOiAI1J
         FfRiXBxxPOVvDw6+rXyiN9yVPfK07/sHREJ4PghYn4ZojRKmxOWgDankjv60kVzLgDRw
         G59V0ehuDeR6/6DP6RXCIICtcHT1t8nb+cNzoY+4AefuMfdCqSzbDfKHUyRNBPh7B9QA
         EC9D6PZBkQk8R/J3SgOZ5NuP6R2lgHGY9P/ZxSaP2aWkGjhWRp9h/jUC3nRNAtPLTBYI
         By+r2HwQrW+8lsvjOLwpcOX3NBhpnCExBRCyUNqnxf5tlpHXawin+Cu8br2GCQDAq5mM
         tmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ic0l6s4/vCSv2HTg51cnmOpg7vz5TShRFb99sP2LwP0=;
        fh=5TmA0Pouy7nCeXQrYSCldpJcdwbBI1AIWZFh3StPBIk=;
        b=TCnyn7KIZK7pXYnzDCiPXRkHz+Nk9v005GAz1bFMt++g3kuVAaWvgTOvnLrqhh0/3Z
         /Sads49h//WIY3apicUEytTE3+16+5dimzhKWHK0TD1B/N1G8o04yras7/KkUv0HiRF7
         M6wEwjnRfmabSzBbHYauWzsJeBTBFPfhpDzCvkcqKaPc1stdapcWL6CujkTK1xGWuYf8
         QxQu+pOUNEABxt9TtK8pOjjJQksV7fFrF/gBJHN1FKoiS+F3RNWltDcphUl6weOmzSoj
         Ys0/Ayvbk2ZgkDJWEYW6UImT3FajV7f4DBejEsXfNtGX8+Q+baHUdDJNB3ayVlDv/Jyx
         6mwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351750; x=1793956550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ic0l6s4/vCSv2HTg51cnmOpg7vz5TShRFb99sP2LwP0=;
        b=qfLBsasIj0ueC2Rm80cM4nkkefayvn27KbmgG9N1xFUzMEPOSqzCiMGte6z7f09SF4
         QmWsSi62JZAp1RCu0wer6f6lUJX1sJ82VugRSHYhS8MY3FDXFsBB/dBcPf5cY78sljLS
         29tbFUMSzh46Yk+v0t8EEiyT++a/3d1cuXI6gpTD/vwdTq6cONvNdeZsBWQTIt4qQPEI
         g0jTMXVQjRwnlAANKJN6lmCYJaFnWZTIOD11otdk2g0iz/rbU7Jly1s8j0J00HNX/cyS
         m4urrgVCOlPkuR9hRQpEhUNOot9aqiTcAYJL2bCL1P+kYfL3FhVAdBp+etp1DtqyniQW
         vZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351750; x=1793956550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic0l6s4/vCSv2HTg51cnmOpg7vz5TShRFb99sP2LwP0=;
        b=RBa64M+hOOML7oweqrwT9gQiy81oP56dYV28Ri8Ys5KPmjE9B6loaS3x8HKvzBawnh
         rfcakTRO0561AWT3UYjlgSwE5MAFnrRrnd3yLhMIM9ZIqwqsw2/GH/WGvSzvMl85mjei
         ZJsE31Or+PrHuPUec5K5Hb4IFL9u8wybOS5tMq/M+7AySOztq1rgVLUlNkPRD9aw9psJ
         heuxaJPmjSZKqcbQy7xlF72R0xx7X/ugxHZWvDrrfNuwT1+BzcerbXpm0r3INc2SKQy2
         5l9kigCEihnVV6lgXZoUM4MfWJj6tq+q3fwPpoXTUhoehUFssa4Z29dFJ1NNjYFG0hpN
         ulrg==
X-Forwarded-Encrypted: i=1; AKwUvBz8CvgQ63vNCp03stJn2IOVYKoV82Kk9T4gmVXjEYS+YGipqZbo30+P6RQbRttiAl5D+REcP/inhXd6im4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6haobivGi9gC+z3Nvb6x2/DopzbQcP6rQh0+kkWVhkG5Yofoj
	Guikg5f1ZmnrVehIn9IGb0DlibdK6vrXlZhCLVGOO2/6UgKzHrx3DcHkjxYnonro69GUhBQdv6d
	pWjrfK1NDM8Rk+k48UEzSkpYiGEMgilY=
X-Gm-Gg: AYBFou2wZq/dVqdeS8V/dCh01VDuAbJMTbXn1lajassoO39764HdSX/4KybqC+pPEpa
	9BsNCOerQk5Oo3psgRRVDxZayFE4ITbc6EyTBJFfQxMyj+9UopWpEcUqbleDIsj1EejvbWDKP7r
	O4e6mtIHrXxlWOaZ55ToPwhWgO5uCaNC2J9En2o+iHwglZxPcgMHBuv1TqUMAb2OT2WsicOLhqF
	84Mu62tn3yIGOv6YZhJDgoxBiXoi2nFYp7jS2iH81TvHUVVdfvIcpHtEBmiixfJ6YvKV5sDVpbN
	oEyFyJchViB/JU1Rk8ZaTREV4d5LYjgvBGpSjs5IigMPO4/8U6u9C+ZB5FaQOUzrYeB0XP4LHey
	ePiULuCdO90yJOGuQ7adB+xcNvGEw6FU4rucOltIgfQtCWkaVk3LJg0HTQsaSs4Hz1r1nTOTYCg
	eRQFi7mV95vhUvSDwksfqZRBG/r/zftGhTN+Xq6dV0bo0dlEapXF8=
X-Received: by 2002:a05:6512:15a8:b0:5bf:a352:9c25 with SMTP id
 2adb3069b0e04-5bfd95200c1mr558923e87.5.1793351749887; Fri, 30 Oct 2026
 02:15:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com>
 <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com> <20261030084017.16202-1-testwrzwrz@gmail.com>
In-Reply-To: <20261030084017.16202-1-testwrzwrz@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 30 Oct 2026 17:15:11 +0800
X-Gm-Features: AclHuK_tqEbHK_O2Qvnq3pma3G6-PFR5lcMFBxShPN1h2GTemzUuLTxLrhij11k
Message-ID: <CAL+tcoBThTe7299eVU=tsUdi392dS9cioXX5RA5AKRsYAGbdVg@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:40=E2=80=AFPM Rongzheng Wang <testwrzwrz@gmail.co=
m> wrote:
>
> Hi Jason,
>
> Thanks for the review. This was a timing race, not intentional: your v3
> reply (the Reviewed-by plus the else-branch nit) arrived at 10:30, while
> v4 was sent at 10:32 and had already been prepared without it. I should
> have checked the thread before sending.
>
> I'll send a v5 as a new thread with the unnecessary else removed, exactly
> as you suggested, and your Reviewed-by carried on patch 1. Patch 2 is
> unchanged.

Thanks.

Since I'm not that familiar with the selftest, I would not comment on
that one. I believe Maciej and Bjorn will give their opinions, so I
highly recommend you to wait for their feedback on the selftest patch
:)

Thanks,
Jason
