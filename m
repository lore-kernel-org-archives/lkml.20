Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900451;
	b=k2Ch/+oX+oYuEIuzXXL40MHlXpXJ6uPsz0bMpUP1YI293wYqOg9qgjSBW+rHAOdA4/4X
	 yn19N4XgoIpklT8cv8CuWGdBRB/opRGJr5RhoAA5ctfnbpL/t5uEEfX9HTNZyf9vwMMEu
	 SIhA48tnV8LBJ97h77ZsQKoq/0eEbJMDjGNM2Sq4K+tbo2jB+6MIndhwWbdvaApcFVVdj
	 lsh4qlUlIqIsfVkmOIR+r+d7WojGZ9SyK6pXWeKxQIL0YUAVgEpBrQBpVmzqCnPOABJyf
	 lF5MnorcWtCRB/aKyzQNJwH33BvifHnw8LTACV1USIAh2hO+gBn/5i9HmZy1bDURjqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
	b=rEA0hea0VJ4D++bdrBS9yE5Yl7009kI3GcEBrTaEOrmRNShbtPQ5CH9X8amWLLnuszO6
	 pdyy/Upn3lhHu7ED0FnOjqB6ie8lFu4MirGZSMrUwIp8ILKD+bNUCKZCDaEUOJIode3vE
	 SFdpAKPZO4yuPPsAZuHMHfHUtDUf6SfIDK0Stjnmh5tHjBXbqcLfwwKxQ32Y4nqwj5v9V
	 owTyzuTKBYqrF+HaBnI47Rqhy/BwSifbyhJg+TcxSLZEOHPUVaU677FJoDekSJHZlAPrx
	 jXtUvksaU7DZnZ3dz/4sWMIV8wEyNNIw+jsxjIea4zLdYN98CTH7upKG545dUwEmHeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdSQkgaj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9D606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF9D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdSQkgaj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10442075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900449; x=1794505249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=xdSQkgaj+H5AncEd1pKhW+t4h7JEgw/CiAuYSlUcaAbmZptKO9r00mubwDIf3U5fn2
         tLvAkLTSQKneChAZWUYnQbrdz+cZNHc/ytMh+H0WV795twzPSoJEzXGF7pcbKAq+LQYF
         kDTKxYNkxoicWq2MjD/bDC0tBxSis8nn08bKYVxVVImZ8PohlDQXRglOZC/8b5pj5ra/
         A2sduDQZK36rZSSNQ9HGGvfBvdTiEgFzzdJw6U23RHgVHgtlFAKwh4ZXceP0WUt9A+UX
         u4pjWFLhXWtLEMf+pRKdtJ298t1A5NGF5tavyWxW6dxTMJbdmX5AxQtEtFa0Jf8a+Tou
         qOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900449; x=1794505249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=mASkcdy/2THbi71Ze8yXX7CACscO1/jeQi+B/kGlEMpAUXAsauw5a7/Eyf3ozfljxt
         b0dSGPllPYUFefmrkByd2lWvNFH6SlH8nh+Bll1OEFD8dsoybNZnhFT7zcz9Rfhw0eI4
         xaq8akS4Jr89JlhC817AhTDjq2rVysmN4Z4ySG2pRHXqymJEd+2NvavsF5Aly6CNF6IJ
         0tp+2FP9nM7ZrlyX9N7ZJhJSE5QVebdahH9/z8Rbf+PZWS5PjF8u7BjyOchTbbecLGDc
         G7F2i4Hf/TU5YVgsLxVhZxSbkw480av0xHxF7V0HRmIPKG4WGe1sVUoa+jTJvGijynrF
         0FRg==
X-Forwarded-Encrypted: i=1; AKwUvBwzASSOrrvO84tP7tecD1fI90LoXayG3Uph1o3/N9N0zxb3u3EE8KK59hm4taj60sfTWQcAieSTk/ok7X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dLsylFqjBFCu0pGqRTE98QS8pP/W0FLM15YUVQnJDFUSCKtrS
	j5KomjCBXfra72PW94G4wSncP65Wa8jmiduBKBXupcth1IMBGqNJa2hT
X-Gm-Gg: AYBFou0qx4h2g0Gm3GzpaDvpIu8D11HAK5g8+r3dD1MLZSUutg0jhUi4WzaYm5X86Uo
	UzvRxzZsvscUhD+E0r0ZKwWo9X8wheZtMN7AVvM7fOCCYdE3saVV30OcA8LOn5GQ0E2QZqRUtp2
	MamgQtzfTur1kJbtHix1Eb7GYFj6tFbu4dYCzJKukLd8f33YcAYRNCSzaxQZ4L6RaekbT0p0kP6
	eY2bF1x+m2Sd9j4WAI/2PQ3QNgtRNHdz8BCitYLxtQikf3Oac9+mWBtCsTQ6ubr7v+qfUIOwfoM
	27VEQJUmPdcC/qNzcPt391WlmqZ64yvC4ncLxaIR/hBm7Nbf/+AhOBV8xp12mgtNGhkX/qU3P/e
	TpvhOjvgotnKVjEipPNq1mLH3ep/FnW7FGBC5QfI/ZHAhO0DrrKnwIppQxD6WFQru8JezioZ1xj
	6P7Jw3QC8DlJGWhs86CDXUiYT1jhQCYz/nj7+r3uABEidyW7EGngsbQDmrs2ny8CR5cZcTuOXIX
	+3Gyejc9xkfgWfhZp6DXCIPuL24h2oQP248/AmTD2ymh5ChAQwYrbfUs3tqnNkqBnVh42SMdnr1
	V8Zk81xu6y+deYTYqH+R88y97pCdBBdSjHWDQQ+b4vTtklT3qi1i/agP7XPhGdMnOVn636bE/MW
	hCxLZUGXfDBHPd1I0wKlh4TsWQoFzcB25W8m8lHVGhvfUjg==
X-Received: by 2002:a05:600c:5289:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b55cf2fcc6mr61403365e9.6.1793900449296;
        Thu, 05 Nov 2026 09:40:49 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm81216185e9.1.2026.11.05.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:40:47 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: krzk@kernel.org
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Thu,  5 Nov 2026 17:40:42 +0000
Message-ID: <20261105174042.2307139-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
References: <20261104215848.2087944-1-ehbello@gmail.com> <20261104215848.2087944-2-ehbello@gmail.com> <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026, Krzysztof Kozlowski wrote:
> Vendor driver does not matter, it is antipattern. Do not mention it here
> as reason to do such change.
>
> No need to repeat the diff.

Understood, both go in the next version.

> us or ms?

ms. The 0 case is badly worded: the driver never holds PERST# for less
than 100 us, whatever the value, and 0 just ends up at that floor. I will
describe the floor instead of giving 0 a meaning of its own.

> What is the nature of this timing? 100 ms is a lot. Are you sure you are
> not describing RC delay (we have bindings for that already)

The 100 ms is not something the board needs. It is the driver's current
wait, T_PVPERL from the CEM spec, applied on every board. Because PERST#
is already asserted when that wait starts, it is also the width of the
reset pulse.

On my board (ROCK Pi 4C) the slot supply is regulator-always-on, so power
has been stable for seconds before probe and there is nothing left to
settle. The problem goes the other way: the JMB585 behind it stops
answering configuration reads when it is held in reset that long. A wait
of 0 to 15 ms enumerated 17 times out of 17, 20 ms once out of 3, and
100 ms never in 5. So the board needs a shorter value, not a longer one.
I do not know why this endpoint behaves this way.

Which binding did you have in mind for the RC delay? If an existing one
fits, I would rather use it.

I also plan to drop rockchip,s2r-perst-inactive-ms, since it describes
an OS power state rather than the hardware.

Thanks,
Enrique
