Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563806;
	b=K1SrTSy5iwnblu1UaQWnR5Rok2PAKqbCfwKTEd2cRLmFZ3lG64jYN4HurGZEfyW4bIW9
	 ajmvb+ceYWpaEFfGpWrmgady6NtlsHaNHmI80mSYrpwIgceZfyrwn2Ki+oIkbC1kTok2G
	 CijTO2rksXHUzMIyX3AQ62M0UdaEcjBJ1T4D5j/EoTfGDUJRn29AOGIItnWffSpEu4cpW
	 2ZgzdoxR81eyMirCgzktByI7lRvsjvpG8iuGybk1xedckFo8ShEnQrt71g57ItSR1Sg8b
	 3HD6uMOQ6YAlgwjQ0qfMbGBNzSs7d/+p7xktD0YBabDNwsgUTcfISCvPFnOujr8QeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=;
	b=TV3/vekdo82IeRfr5PHS0PgOCG4UseCVRG8XQ1qyPmufTsf00M3D/iD5XHlPDMkJp8+r
	 QMDsdPud1xQh7PynRX7/DeqaCXLiWFpV2N2spGS3iKRwPOmYvslW23Wf7YHC9wH91JS2e
	 YB+ZkFixsubQMvjSVNmhwGGgbfxMGFuHt6RD6ZJ+lqYx/boItRutOh0w20wXgHn0C0n6n
	 yUAwQcqEcM/QvNFxyJf6kpPTqxQfS8n6tE8veUnXlSnSjYv1xpe7Wv46cr8BIjMUtYhuu
	 0CbxiYrMN7zDjsoOBC8D+qFRZpV9WTnF0qSPNRByu24Y2Dz9IbFtOkM2CYHW7LHYNDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7wzYuMY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F8A606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F8A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7wzYuMY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so4152125e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563804; x=1795168604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=;
        b=p7wzYuMYn7brPyloBx7mav2Z9jHCXjOnldCsKhPHo8MSBai+ow1PAU0djODR5o38dJ
         x74xWoL2nYvNOhHW9Ep9BJ4gEw733A/AWPy+Yx6UCXA5GcXMLP/kVyMoAxoEfkj3MX/l
         sB6cKjkU48UH2zhF2ob95aKfByOQVKAENq7BF0jj8U2HAHyXqWrFNsitIBApShyesq34
         P83vj6qH0eecVK7TXgVgZnhrZ1Rp0e8GNY+plEUZFK72hDhMSeHKiGGC+0aREJax8LEt
         wSFCxlZ399jgRaACJZGG+NAHtDlL7KeKeUYpeO6c13pCDh+NCX288O21ifmemvFI0Vdn
         RqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563804; x=1795168604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=;
        b=o+a9HZ4Wc4zB/o+3bzQYhx+XSi66PPPPmvZ9zD221fRgTcWp19tGpEzYUHwIzTkk1P
         qaGczKDoujqSzghN2TQ7Fh4Zxj33DtEL7zPeg3LHy6sC2d35phH5BfPyyj/G2M0SEqyT
         s2PBT28hCzI0hwTyZ5fsC3jFA70OgKdzzCQv2IjLT4VVWINOLdw0ntOhfWynZMEHLIWy
         0G+jOs5K4vEjz6IhUiKBoYweAPvad9F9OiWeuZzbAeLXz41nSzQFqE2XiuS2UVLxrEk4
         yjAc3QpITBfWYiCi8Xs0TKjOsxWfgz2c8GTm85tkEyRsvzussE8AMqurbH3nyHOybqMG
         JbcQ==
X-Forwarded-Encrypted: i=1; AL+hErGIRXIqS6lV0c7SVZN+HJN/YtoSW+Exx/2+pi9a5gOpqwTM72XNF/ilEjrukhPr4rmOvAECVqdPK2Wapa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V6GslmWh0a8XDaCbnRMpJBBB3VeOfpOApRfPQI6QqFz3ZwarZ
	FH2ib8Wwa1+Xpnji8Z89gVbCfDycfHEwLfF96OpmXQVBbLQfPLO3Oq/c
X-Gm-Gg: AYBFou3dQ7FnW8UhzJxxZidCAaOsepQPURj+KG/HCdK9EeJbajE7hgzE/0/ywQ3fM4u
	wAaEQ73z9j3Xz9SBqF1OVtoPE5/3Th76/rPaKNv1ImJQJG2BirGvXWVaO+l7vJEWA6OXhO0xzmI
	j6suYap/LL41nYeSgXrBmdWh72zligKTXF3sqar5Bk9POZUFs6+pDl35DSx4XVDdlNUeEFrE4Zz
	ts5iamyr42RiHeaboWOu1tt1sS8mUiywcQMqLbixrEPjxk53QHNTm948lefiEsO8ELznnNeHLyy
	6ZTvL1YSKGim1UVl5bMgeUJE3NvFCFlnNK7VrCJ75nOtH9LoNmsR2fyMAmM8ZzGrSOzMenfcEkc
	AX0ZoEuMX1IAveacOs/l/eZ4J0gGBZ1zmasUbE+soHti9qPRd7fj6KwRDuxDyo+EQjzNhfi2tYF
	r+JAFlKMjrq8xPuNwhU4A/Wh8DN4rtuIKdVE2wxROxPVb+j+05D5KzFwcPM6f2Vlr0IdcQZeMZw
	RsUUhZWcBnFc5Wx0dia5I6NxRPMISLM4/5NzmR7noKKtXOjxAKIwsmjHE93R8M+fUZV1UPID43N
	lKXWJC4eapXBaNy77dLzFhFEQu4IA4viX7Ee/T973/PEjcnG1K/Tg5tGzF0MywQ/+DOJq9LOQjf
	TO0uaAoZuDu53JqXfZtEHUNWccph385ex28BqluYkg/D7WtP8y/f5Y+jLVVEq0pND2Lc07cY6ao
	DXvt8+EM/4EqJqYAmz
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr37035575e9.5.1794563804181;
        Fri, 13 Nov 2026 01:56:44 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm28500015e9.3.2026.11.13.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:56:43 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Fri, 13 Nov 2026 09:56:39 +0000
Message-ID: <20261113095639.1667143-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95e7fc97-2bd1-4b68-a9ef-246302ed9ec7@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-17-ghahramani.navid@gmail.com> <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch> <20261113003655.3665572-1-ghahramani.navid@gmail.com> <95e7fc97-2bd1-4b68-a9ef-246302ed9ec7@lunn.ch>
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

Hi Andrew,

Andrew Lunn wrote:
> https://www.sanechips.com.cn/en/Products/WiredEn/fixedNetworkTerminalEn/1558027080778723330.html
>
> This says it is RGMII.

Thanks for the links, that settles it. I will treat the link to the
ZX5201 as RGMII.

> So picking SERDES is probably causing some of this confusion. SERDES
> implies there is a PCS, and the PCS is doing signalling for SGMII or
> 1000BaseX. With RGMII, none of that exists. The registers might be
> controlling clocks, or regulators etc.

Makes sense. I will drop the SerDes name for those registers, work out
what they really control and where the RGMII delays are set, before
the networking patches go out again.

Best regards,
Navid
