Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268105;
	b=b0RQ2Fj45la+j9k61VYr3Y1Kca8jZqCqycItGr+SgGGFSMNGe1mIUpl3Y5CG/VIRuDWm
	 ivRcuZcWnBI9d8QfpYFPe3dVw/WhkEd27rSbqiW1Fe960M0e1AngAziONEwisl1PTi67S
	 S1O0r/LzmQsWOEAkigrdZ9CZO1LyTvPI5Q5YWPzry16/3wYI1sm/Pgp0ft28qKkOW8/La
	 jGQJ4dUz68kQy9Pv+InlvEhm5jRZdXgrqTkFGk4kFEyai8kkGIj3UyFijHBcBdqQ9aSvg
	 9kspk5Izn85qDhyCESHeLfa42YL+2bsVtu9uzLq/GH8muaNw9WA8WxV4yG+8R4A+B0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=;
	b=w8z5lo96gCCGMk0QGIMLaG70alUts5WrckBR4iz+BfM1JBADUQ1R5FZrzwQSbTS6RBp1
	 +vGaReRvdeI0bvwA6ba9ZfhvAZHwylAHEUelozQ3djtYPIeK4D+FZZ4gVjjtJoiZJmO8o
	 ZtVGk9241PxPRzJkcOoHpTUCUkPpICa33mP0H4XaOFWZ9kBwoaezySKlWpnVnZ3dNfE1l
	 zJ18XfL6sCvDrz2tiIODhmZ+ndfXG1at7bj5uN7xTtExQr/r9qOEK7ua5z4tKOJBfCYma
	 17taHHQti1A9pmpDoRaOImrhqw6c9m7Qy2OQleLcpyXgzBfVsMf3iz6hbvHJq+sjBOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sfc1zqmY;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF7606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCF7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sfc1zqmY
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b904d10882so624585b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268104; x=1794872904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=;
        b=Sfc1zqmYTKpury5dmrguOwJHgijKhgPSOMtbSLBEkrFjUJoSHyGiUr49zJB6GILDxY
         hZ/PLdHu5mzLUBwfro/FlqtPwYACld97cwPlNBJUoMEJA5uUxc3ICOmsAk9tV0V01GVf
         cfl7XL0NeTP/CseHktJUI+RGifg6lTyYZHKTLABejvKsm+kVS84tPODSzpJVRjRyrtjd
         8JJ5kJrGNR1JAZG8kjkLSOCwkZlYeBvz/SyyJ2kFhXw4UDAs3MxdpPKqt4yzz/semOQY
         1NpdLTjh4YGA5T6G30F2w43gs6HoBvyC4qxVPRHyv1+QGmdqdVxMj3Ih/3IUVIeeXAwI
         rnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268104; x=1794872904;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=;
        b=PlzSikaAraFU9Xoc5hlJTZyJURVy1pTE6sori55I0UEx2LTun+xZORsWAXGZwctJfb
         RQ48yZCY71fxSHRyqd3FHDLVV9GvkeZZNtCN9PAigla43hSGac9twdlX8Ws7QJIDsVt3
         dRtfAk9HmzELEd2iQDM6onrcbVDJO1cLJYaKoLetQluMuFylcmibCenXMRtkEFYdXrFf
         IY2Yum8qRYtq2fzaasZxqre6+lAMxHGVYh7Xz10PmRFuiQF/xdeNcwjpQnBbNSEL2Tad
         qRritjBXWOY8d2agNlfJMRD+Wvlsgc+GHxw3J+LgQF6P4V/WzV6+oZPqPUHuV6OZEnux
         RVtg==
X-Forwarded-Encrypted: i=1; AL+hErEbuc+WDqV2S4o8FBlYd9Bf1Wq5oxPrpKNUYam2kM6hmq/9ATgjWVaea97CAtmATMsfaEPzaEFABSwTGwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oHQaoUqRx1gKTNcAEhbXotgZp5In2b7AbYNllyu02WJgymrm6
	4kUHUlEZ/ACwo/SAPgIaBk8fmEOAUWBEb+a8Om3FtXlzhrp51KcYDnn+3BoR5qgBddA=
X-Gm-Gg: AYBFou3eMqD1ZtKvK7qjcEfBUprqGMVd0LOhDiN5Xy/qc/dW3d2kPYEbaVw9wTBWSIZ
	pdd6eh7iiL6alr2OFogCF8XfSXmaXVc3cwC0YAHdO0XZIIK0XZPpYw4o/mpTPTFquxozZ56tZU+
	K4hfTYC+sQSO2O2lPgiBxOg0YxYwdRx7ypJlpiX1vr7dpa/02d7zxrMGl8gnrjHKrBvudm2K4P6
	cEj7UOMbEjU0GCfaoNc1xgiFKX9OqpxZsBGKDZPwI0M3yHqRcQVjYqOkuqNpdK0RiU+gp3U/HrX
	4M1jtE/7w396qA4wvMFK9wjYUA3OlBdbQcscTt42snxMwsNVbzjrDU7U6JiWkjRTNAzpU2pCJ8u
	OQqlRHCxuhbjHCND9nb2iCMoCAhy7m26rgYhCRBSgrI6Uh/0vp1KX59weA9dETkRH6+EMn9yU6I
	pfOkZ1DKGs6BA6L+pPCivCgJ1Z7Cm48wlfCVeY+hxeF9m+uaOUFndcGQR7gJicqA8BRmOzgkD2+
	FsiipjxEayG4rG+xxx1KOydvK92q6rFPqXnviqE6mpN0IQEaKqkvm6QKNbSjwGlWWcqtvMOreG7
	fOE1qUTjzBjRIKHjjcQ97Ce+
X-Received: by 2002:a05:6a20:4326:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3f18c10ea0cmr750328637.9.1794268104158;
        Mon, 09 Nov 2026 15:48:24 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d67e52esm204829a12.10.2026.11.09.15.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: paul@pwsan.com, aaro.koskinen@iki.fi, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20261031120519.655248-1-andreas@kemnade.info>
References: <20261031120519.655248-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap: omap_hwmod: do not WARN() on missing nodes
 for hwmods
Message-Id: <179426810249.2265990.13290382980271745471.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:22 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 31 Oct 2026 13:05:19 +0100, Andreas Kemnade wrote:
> If devices are converted from hwmod to ti-sysc, there might be an interim
> state with the hwmod data still present but the devicetree not referencing
> the hwmod. In such cases, the hwmod device data is still there,
> the hwmod infrastructure does ignore that device but prints out a big
> alarming WARN().
> Be more silent in that case to avoid needing putting devicetree and
> code changes into one patch but into one series, only require the
> hwmod cleanup to come after the devicetree conversion.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap: omap_hwmod: do not WARN() on missing nodes for hwmods
      commit: 540f8176aaa989b08eb66e4d5c4d4ea9093c1f80

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

