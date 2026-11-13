Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567470;
	b=J+WbgkLqg3ITDGr+WLZiQoDJBgfljYjKhYnu562bJlOtiPo6xTDqCE1FzVLidi9rXQNY
	 nNl8m6JM0/I+l4uIRtHSJ0VkLZBbqf+9w2z5AlckiE8CUrtmVtpZdYf1rIT7LJLr16ldZ
	 xNhztAofLkGPlGkc3yBOfYizqz5Kwki6QuwtE18ZMaWlUOdUf70GEWjNXRCbjdClzVuAW
	 Kbbult4eJBY3mE7uzFz+9nPMW2m6/nMB6K+9mBcJG5K7xo8TWMtjZI39DcvnO12jLPs3f
	 +Aa0jOQpYQi+KeNoDNrhI9KI3Zfnq1BY5B/wn00qKxoyMLExInkCsEb42j1K/EfD1fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
	b=0PeOYcTIRBBjSeTWRiTBchiMj4Y8Y/sln6KGcLw9rLTkkqQKOJGHv6Mvcup3WB939mvZ
	 +Q+0MDUpp3RH2lO1h02gOLsK1sUYxICmSQ5DrM0mNvz9OiWcJPI7cKvMHfYS7G+SyWopj
	 4iNuKp2HnGzmuWHyMk8gnPGdu4FL9FEX9wYpoITSnf39gbfqMuJjF0MFcKz4Z+lDfjVZG
	 bToH0MWGjjW03nCbG9KrGMltOwYxBmMmAIv+F1VWM2vTyGb8ouD+Klu2V4hqjCir+fXO6
	 wpg2H2ASf7BL3oYJH9l7cB6sx3J78Lv+H+Ex+qFopkCwXBPhsEXZZtiF+r0Ywdj/b9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9118606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9118606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1588814a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567468; cv=none;
        d=google.com; s=arc-20260327;
        b=M7o7lz9a8oqO1Dw2b25WgqqONbCvvvul86FS7zqP4TpKOojg94Fh3sg9w6IJFQoHJ0
         u9W/gc0DsNgEv5Rik9QDZPcAiRRRtrgaQ+J1FMom6gRlXmDwxC02aUHdV7cNx/FNe+lj
         Pd1xE0Z81cy+NQ8/USwsO12EC+Aw1f3QWVm0MLmXtVBWb+yIAxj9zNQMrxy/Z59ZqNf3
         vIGmOMmpQfDPekmBLX+jPdyPuoogL8CshmJmgNg/P4ZGy0Ib4IYJXaFLIYa8Z2Al5PEM
         RA3gSxEq3mHHnbfUz3JY4g1tEB9H4eEKV21D9z1fL1Hh51q4HMoFwe8SyvP7mD3Nl5/i
         oBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        fh=BfM60IyymZYfjmTOtTaBw4nL835bz1ixHQzOVFWLsAw=;
        b=iWS5DD3FXowu7IwVd87OE4e+nsM4YMcP5dx+1q7hjZPP7lpdytP+9/l11DuNVcW8dt
         TrvrP05oaA5jy1IUiMTzQv6W3a6JNIzH6zevpfXENHmK3n++5uQaUH+IwMwVnQRmkpZl
         Mh7SxBQL0veemtKL6lL9S3zULuDEecbbkMgYDL14aWpllkgBMAhP1FLFvH/ghyVpYpL7
         pOJndvfVSRXdrPAB/JXD98LCpGv/eCk+tDa/rKL4vC8C/Se6U6WTDUDasHaZC9Ra3J/i
         Zd3UTO3vr4k/J2KZoTXMLALoWUJLs+k78Qr5RjUdCcDS6pRmcuuxGcqOR6LkNRgUyNZL
         zl0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567468; x=1795172268; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=AeF7+1yGPsZ3QmfWQDKuaH4XlBf4fgKulM1JWAT7w6hasBaoiDc0GGcbM20gyy7oNO
         j21U+7iUbis+Xdebn4EYFBsDglN772fKbxdeaNCqRrdckQJ+dnZpTw0UbxbUXvnZpwLZ
         TPrEWOrDkwKj2jh+YC1sLLS3RqspzA0MaL83n4vmbczTHKfypWXugHYAAlWxLriOhkHQ
         e2Us+G7V8bFuYV08OM4oEXyilnNAwYBkC5TnpOtVOQMrLx6n1DKbY94g5Itgp5Io33rO
         OAXb5K5AuaxWrM9wvYxoqazJJK7V9ATH6tH2LjM3Anjr5F+ht0QWFpjenlkz5qwjM/Kq
         URkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567468; x=1795172268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=zVw2+6+anpe99IsD4gRcDhJSg75wlnhCaaqOCdXr23PZx+BnOBxPUXNmDwZbvbxm36
         Vln9cTDi4jb2+NYXFnMx+SVq9XA1rZrnqScgdw6t3OqJJuyAEdPn7DNVJxsXCsXC5f/y
         W0+iDh0rG3HmK5zADuCoFTDONm+k40qfyAnXjyMe42D0VOIHRGe1ADmVwWp7nWbfb6AA
         mPFMTzKmCEUacoM2YykRYUF6sZxnkCyPNA6MbXZb9bEiWXtFOPoFbAuCWYX0tDHsXkfU
         4I1XDMEV1jy63m3wLXZqhnCnurrcvvh9yYRhJ3OJ8q+MxpUx3VawqPJWfMrl0nP+a9mO
         /9LQ==
X-Forwarded-Encrypted: i=1; AL+hErHX3+SaSETiODGvg8uRWDRqM9ZztIQuTeCoh5rBfhmRFngWcTwDzgQ2efkzsZfH7gfESbvtxBqij9aeN2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7xc/h5e1EUGqCS4R+AdzX74nbWew2Rl/AK4VAzcb3CBQkWJPd
	nDN4+Brqcfk6w6ASZau1LphVpVCvdhYMQ1dlZt+XhDR1LO2ZUQsjX9+bM36BYUc+Ubj1NxmYHUa
	QxHkGF/s/j6pMpB2YVnMh5fBrifTezQDRdGLGHwLDpg==
X-Gm-Gg: AYBFou3Zn5rcXaU+IHOCIaDv6YXr4Pd6s/X9Pdb9DtkIvHGbl4Lma3BpijZLFV/6dKd
	Fqd9rt5iyM09pyK7ZaO0jkIjaZ369GvRSWZ/5aNEumBH1IONI1g8eS5S/YviriPipDav4MmoKrA
	hy2+EdGDpVf0SV3YXf4oyWrMZ6k/J8ZAC4fh2fzEBaFuADDCNNH49MI8VZWLm7Ws0OpSdRMIVwg
	BrXhwaGG7K69BDRDCHgqrK2oqTXm16kpx8TaTfZYzgdp9eEk5PytcyRrXg7xdnYuZHwwBAfoydv
	BHBnKxg8lPumUNS3mshq6BpCn3y45vsrMhWLT8SvZ/c33VTXfV0Yy0lgw2+JdwPtDvD2V3Ch20e
	p5kXfDR/GQqPd2WjbodCsZSLHhVG1VNdHZNX2P/UKsCgWnjKwYxCzZivV8/EMwsq3p36Y6S8G+n
	eFiWwYfy7Z0AFWy+0=
X-Received: by 2002:a05:6402:1ecf:b0:6b7:bffa:6f24 with SMTP id
 4fb4d7f45d1cf-6b7c05c0611mr1899644a12.0.1794567468098; Fri, 13 Nov 2026
 02:57:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-2-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 10:57:36 +0000
X-Gm-Features: AclHuK8LZ5o_QWvk6RKRY0YNYG96oQjtDx2eCj61VNIttrc76E2ZwU1wIUFE6TM
Message-ID: <CADrjBPrwZ+dH3==Z46PwEVtYR4xWdzS2T0ZFHHWR4+g=a87cTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Add exynos8855 sysreg compatibles in bindings
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index fcdb9ffd2644..845e0caba15a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -31,6 +31,10 @@ properties:
>                - samsung,exynos5-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> @@ -103,6 +107,10 @@ allOf:
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> --
> 2.34.1
>
