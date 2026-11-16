Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860006;
	b=Ghr2rqmRgoo9SbBv4a2+5l6SCTYT0rSTbIaLCsFTd5c1yPIEJC7EjRmdeG4R6m6RTdZm
	 JKu1p68wilz/ijsciptOrF9/qpTxng9UL7HZmZ/t0azJeqD4Jmv6q5PMzZC7wdNZcWsXk
	 1dUClNKmEZuywkY/kiEeNOAveI2aB1wt1jRpCrO9I6M7Kfrd94oonMCo5BwjWK6cl0H/u
	 oJRNrNm/zcfwxV1EZT8jW2YlkaWvlj8sXAsz4NwDaz2sngN4B/FYGMrF49wR6ln8aLRDL
	 SM5x6Kb0JGmFJ65CBmjZ4MKnHsPk/ADRf7EFEd09SlY0FAL0jKY8Jjf0GdhHzCdCChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
	b=iFDYM3E9SSiCJQWr+eHlNXUF4goToCRDKKbyQ76S0AbCcCGczxKViTOrU9iJSla0mHPR
	 y2ALAQH6FPUl/HuEN+Q7XoxJBWwpqOJXz6gSOIUOFP3U9kZV+QrW3Nw1MOOzRJmtnfODU
	 hJwv0rkzN/QkNrpSOUUYoxo6weCcktD3aChg7/EE4H47gA2WDPWJsEBvOnhzGYCn1Gz95
	 Ch8vP6sqrQ0UFaZV9kS/D4Uyo5hBTWPwjKSJw/0HC1fjDNyC2wiAsuGEgdz/DobA0T53r
	 Lu/nNe88VYGyLDtKzJw/lWIABDI0qVnPuopz+1KlSJybjPN5iZDqFCeOyL8f9RhKBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE72606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE72606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eae12762c9so1365714e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794860005; x=1795464805; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=XHjrS7sSi2aqtED+FVb0XnW5wGyB8px/TKyLxVErtD3ox/FRWwyDCJ7jml5uSMAvu4
         uU/iCNmdaNfMlSE0iz4MepKlSU1k4cdIi3KFDdQeK1xdRJ1i+2Di3a88QzJVc8TpT2eU
         p/0jI2fPQPmmmIkwmqi64abnaQSYKKoMVxWMyiP3dppxD6JK8DSfpQGHQwFKPB/5nFs5
         vasUkWbpzxx0i/SQDIQSGqXcpdrdkYswa4fLsdD2xSOxtGPrjqjbyY/Y8zdJFuE5sW3t
         olWQIO/RWE/whXGhRcsoxuA73nVd+Bmr5Ikn15yXVV1wRYAIqptPFchxhczFTLu04ihn
         RDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860005; x=1795464805;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=CvSge23u3XFql+sgl52bFYrQ2sd6do/GtTOmQN3WW05prUMYIoq8L5uRCwTX9Fo+XJ
         KMGPkang2ydf4sy/9vYQHL2R0dlJC+L+VFtUSpYr/SijGT0uPgAvuIJsPGVViJ1Cl49q
         4UQIHZk/ZtDM4SqLBP0gzghJ4pF9QlzmMleNL9Bvgnn5OQVXAKHNQZbawoovkcC8Flmq
         2gXfamzuM2jsPsA0aj5k4vH3plS72seu/ECfvbdUPR99WqYEIqjRMpYELPp1R7sipoqR
         X9ZRR15XcRyJuywohzexwe/lQKHrrYJ7BdTWtbFQMVAD1K0QSLoMT/GDUaxknMX6+fPb
         mw8g==
X-Forwarded-Encrypted: i=1; AL+hErENxGLRxIvo0Dl5p+EBp5brGL6z9/F5vJrBWVGKlNN8uL47L4tlhV8WHTnIMPWetonQDOMetOxXKbHByBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4xQTJjFTH8QsdmvSiMi79xoLYUlmFrVQpO/VDCpnHXgo+Wjr8
	S5ZuEAt24WuxvH2r0UfR4IdLvR8yaQJ6ODwc5FjTdLlwsF8V9cHGmSC5+rIgaJ7o5Kc=
X-Gm-Gg: AYBFou1JrhR/IEqsetfuDdvHAT+k3TQk1q+ijcdcee1at6OniKiiDSDV+Qr2NMCtP2O
	nNV8yAanAXl32b03yqQEe41rUeTENWqgiaORy+YvX5shPOiWrV+WlFlkkh6AAokFbxwzvrd6+4e
	Jjqt18EcNZnPh0e1E1Kb8f7QAtH4Wu6vW0RP+jwoZ00bQuiNmenOLLkpzfHw4L4sSxOisTj/TUK
	cNg4vaaC1hicBQ9SAmxqC2b2yaLKIZBBEQxscYBIG7Jrb5O5YzB3rEJAFgM7uqbpCbNgSpgnb27
	KtusyEqlOihZx71kIeYfdAySc9bLhxFspbhCfnyBXuVwzLJ7fbfu050nP0dHYWKnZcC64xQA4xc
	J9LQLaGAuIqEAl2pDGiHmkkkwauX5dgNpDKMxmwdenAhwZ9slrVu10zonW7cAVDzAvol2C5s5Jz
	lDLOXjJ1yGqFuz4wjPoUa676gvk3V9bNkCAQnBQWFE5VDko1icK/aINvCnh8VOAZlHyosEUDPtJ
	dcEMTH+UBBJ7d5GZLLquooP7zSWKyBm7n3wDZ7DxBi1xW7DhH25/oAEcywwjoKmnLDBbiqansgu
	T/7JJCMYxghvyojd4X4C6XqUxIUMmQrrbt8R3lTpd+3ggprwdX4IzAvpK7BucuPF9oUP8w6XO4L
	IANfGl4Xu1OSekehuySF91TwCbcstCBCEHR7q7h+QpxA17m/ilx9q
X-Received: by 2002:a05:6122:3c4b:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ee34aa9574mr3361794e0c.17.1794860005139;
        Mon, 16 Nov 2026 12:13:25 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e031bf0sm5639266e0c.5.2026.11.16.12.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:13:24 -0800 (PST)
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
Date: Mon, 16 Nov 2026 15:13:23 -0500
Message-Id: <DMWWRQTLNYH6.1LJ2K5HT60LK8@soleen.com>
Cc: <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 2/5] kho: build KHO objects into a single kho.o
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Alexander
 Graf" <graf@amazon.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Tarun Sahu"
 <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <20261116134013.1636689-3-pratyush@kernel.org>
In-Reply-To: <20261116134013.1636689-3-pratyush@kernel.org>

On Mon Nov 16, 2026 at 8:40 AM EST, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
> kho_block.o is part of the KHO infrastructure, but is currently built as
> part of luo.o, which ties it to CONFIG_LIVEUPDATE.
>
> Group all KHO objects into a composite kho.o, built for
> CONFIG_KEXEC_HANDOVER, the same way the LUO objects are grouped into
> luo.o. This also gives a single place to add new KHO objects.
>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  kernel/liveupdate/Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> index d9f4694625567..bc679905ce3f2 100644
> --- a/kernel/liveupdate/Makefile
> +++ b/kernel/liveupdate/Makefile
> @@ -1,13 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +kho-y :=3D								\
> +		kexec_handover.o				\
> +		kho_block.o
> +
> +kho-$(CONFIG_KEXEC_HANDOVER_DEBUGFS) +=3D kexec_handover_debugfs.o
> +
> +obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kho.o
> +
>  luo-y :=3D								\
> -		kho_block.o						\
>  		luo_core.o						\
>  		luo_file.o						\
>  		luo_flb.o						\
>  		luo_session.o
> =20
> -obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kexec_handover.o
> -obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+=3D kexec_handover_debugfs.o
> -
>  obj-$(CONFIG_LIVEUPDATE)		+=3D luo.o

Please send it as a separate patch. I have the same change included as=20
part of the kho-ro series, but let's fix it outside of both series=20
instead as a standalone fix. Also, maybe rename kexec_handover_debugfs.c=20
to kho_debugfs.c and kexec_handover.c to kho_core.c for consistency, now=20
that they are not shared with the rest of the kexec_* files in kernel/*?

--=20
Pasha

