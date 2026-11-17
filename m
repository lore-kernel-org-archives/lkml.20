Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936866;
	b=XTEyRcoGvsL5cl9QMzBvPk5PldCfTMlZ5JuLaUuhTTtyRKziT4cNcF7BkcBQf3d0nZU2
	 baAvdoZat1ReWqcLvylOkA1lvD/YmVSxwrtRe6IGGH5GG2mEYXKck+tkuEvLoDnqnlbF/
	 BFYv5ZyuDb2S05helPrkOyhMNKVNlBQttGajPdiIxEmpVIKT/fL+kQpZYSuU8ZY6OjGNB
	 N62H92ldD/i4SelZ/KcHhwAdVsbM+ERyl35ZZ1G2lMV/85BCQ5CkhZwP/CWgfsExgXRbe
	 GzgcdunmTKq/p0HfNSJAZHAwjRdz99pNCziGUl8iRZpU/V5PwVlGCQry6EcLoPvS4Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
	b=C9Yjrmk8Uo4erUY/93e/k8xMSuDJs2elE4p5fppm3mkgHGtWIOlV5s2cKajSF1jB6yhj
	 PGn2axOzIOjUCURzRtC6s0b1ydkqRMHWIhaly63tzERslLE5mYeGgyIbWKyQ5U27GGD30
	 Mt2Oibj1BoDoAWqx3LunjA3IMl0NzW5LzER8TftDjAq8aomuGJwdmKmD4N3mI8Zn4agFw
	 1eauicKMtgAYlcGTkp/25BhsOnq89yPM2qHk5qyH1irj0aeKOwf+ELmaPET1bA3F+1dbF
	 IGADKiC691h5iYyClmlLCN0UMJKzzTWIooBoJy4ZfpZegXbpUCBfBQ0pJD3p8gDWaJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr7XUmH6;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr7XUmH6
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-94965745d92so9631385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936865; x=1795541665; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
        b=Qr7XUmH6x8Z/p+YdIWnygkcR2vJShVVMJrdU+zOSWrQ5wZaG+5mXDdsYZq65eGEmao
         GbogGEj7gmhDe8I4Z+d96Ba1grCDYluAq46K//hsHcPLjbJFms1SK49YtUu9bYz4ztL1
         2aLBCzCaH+mLAPUwOZo7NeXwmkN5fTptUBwZOC2lidhDC5vNgHQvrE6P0S6BzU59GzYz
         wntVAsKhzTUN1HacDyMFsTDKVnj2KPZ089oSwjY6RjBC41n3xl+mG73QzADcyWYpaOql
         Bh8BciCQXirQzs2Vb8oXVdH5maxlxBPZ1W0p1mDAw1xcQHt3FtrEDW0xM4raCPKzaTcj
         Z06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936865; x=1795541665;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
        b=mtJ8xkYm+Na8TlHR3shZFxSleDk3H9Pp0aLhYJDlQbD73KeLxHsAKs7YX/zQ1hSIGG
         iGczn764uETQHciXwN5hHLQFRdQOzGU43xzyCqT5yRPEIUEE9Y7+KfkgdAhsJRzLM1Ny
         yu256vO/2+b3QAiVCoTps+YXpwYg3WZEL2A+UVK80sd2I/941cM8a02h6OG7hpKVvzA1
         e3MbUKP8hp6C/jy9JqhYdrGL1wrjHbRFYjMETaPtqWfxRcR9oKaeV/h2L02ByJ9cqYYO
         e8cOM/f2cBTm5O4WY21kQ59SMN+MjGG9rFt+J7XYpFRGse9JD32MRA5ll67jHF0gI3rD
         CpFQ==
X-Forwarded-Encrypted: i=1; AL+hErFvSQTXePvag1xGIZTdR715lenVutAH9WOeObUuivmlKDgS6CCME5rbGpWKPPDd5uatgMq+0CKzG25dHIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hl+6LCZoVjSzY3jpufGoRPAzeFFxSxUfb1L/6CDkzQC18PRi1
	0U29/McZywPgpNH4deU03FyP2rZ/HZUmo/gcONaZsE5/HQcSZ0Pn5Mya
X-Gm-Gg: AYBFou0UtzgInNe7xiRt1yO1RxVEZJjaYomfj9ZnEVmbpVSaY4EqsVbe0Kv1AOWv3W8
	gubcHyx0uQ2qRi6/Ap4LSGAUlkx8FPLD0n0rcTXwhnrjPCyBxheDMIpGh5csARGIyriSBncqzmz
	+P7AWGQutG208KkJBtQtSjm4058OAIJzBKAP4vvjoVkdqv8ICs2GSYtqx79eE0fJVIkDbZMNHNj
	dBTAHV63UeMrirgfsitWIO67uxA1TKG8Safbn3kXNKr6G4X6t+I2heGh4JSKg1Xt5FAlaofXpWM
	YizJ2Oii7fcVbPh6WSh7HPDCBWrbnQVbvXxjGErGPVv7H5iN2K0s3YW0NxyA9Yqwerw6fnuIZnN
	9rCzKiUTVuHukTK7+gfiBgYKVTPxzraWBhTkaeWzmx9eBkq5xswe6ihsMQrLCGdNSyqHM1xfw3Q
	nggLpSjqGBUaUVcMHcjvUzdyLsoRteKTrwxT9fRIlrgVBZxKI3Q+lMgpn2LFNbpLd5wFSnEYtDX
	mP4z4ey+1oALRmBECGj4/iEqgMwMgcF2e9bFtBsyFW2ea+sllxMgUzSckVphQnDoe6J2vJ1MOmB
	DL0nJC5S2wCXZz0CHg==
X-Received: by 2002:a05:620a:1714:b0:949:73f3:83c with SMTP id af79cd13be357-94999572b95mr73032085a.21.1794936864878;
        Tue, 17 Nov 2026 09:34:24 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::7:5db8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c831b7dsm1139318185a.20.2026.11.17.09.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:34:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 12:34:23 -0500
Message-Id: <DMXO0JIUCNYA.1940X1XHRX6SF@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 04/15] idpf: psp: add psp offload
 initialization
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-5-stani@google.com>
In-Reply-To: <20261117145522.1910636-5-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add the PSP offload initialization:
> - Introduce VIRTCHNL2_CAP_CRYPTO (bit 26 of the other capabilities)
>   and request it in VIRTCHNL2_OP_GET_CAPS if CONFIG_INET_PSP is
>   enabled.
> - Add struct idpf_adapter_psp to struct idpf_adapter.
> - Implement idpf_psp_init(), called from idpf_vc_core_init() on each
>   core init, including after a hard reset, and idpf_psp_free(), called
>   from idpf_remove(). PSP is enabled if VIRTCHNL2_CAP_CRYPTO was
>   granted, see idpf_is_psp_ena(). A failure disables PSP instead of
>   failing the core init.
> - Add the PSP device ops with idpf_psp_set_config(), and
>   idpf_psp_register()/idpf_psp_unregister(). The PSP device is
>   registered in a later patch, once all mandatory PSP device ops and the
>   datapath are implemented.
> - Build idpf_psp.c only with CONFIG_INET_PSP, with static inline stubs
>   in idpf_psp.h otherwise.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---
> +
> +/**
> + * idpf_psp_set_config - Set the PSP device configuration
> + * @psd: PSP device
> + * @conf: new configuration
> + * @extack: netlink extended ack for error reporting
> + *
> + * The configuration is applied by the PSP core.
> + *
> + * Return: 0.
> + */
> +static int idpf_psp_set_config(struct psp_dev *psd, struct psp_dev_confi=
g *conf,
> +			       struct netlink_ext_ack *extack)
> +{
> +	return 0;

this is supposed to enable/disable PSP Rx on the device. It should
probably either do something or have a TODO or comment explaining that
the HW doesn't support disabling parsing packets as PSP.
