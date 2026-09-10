Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4E4A8A3F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053133; cv=pass; b=RCt8vyeNhHvPbRvHdcWc1NoRadCOg8h0IGvpWRp59niIAykA+uF/U42ICITzJRuN1wjwbU6jgXNNnm863lVUL8j5Rpb4haV6CeniLJMwqDcXTeQyTrky4yvUwTtU1SbHSLOE7n6ZjQhioGZ198rWzVV/ZPTf/jU4PST76bo8KvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053133; c=relaxed/simple;
	bh=IGzkZ29oQC5+zM7j41y1PzuVxI/kR6lS50DPmDPTu28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLhcT2RnkDvmmTBJWadQBL9uXtyk7zloFiKEpuckEHYlu8DWnq+UJIQFScoqK3mLfbzduyDHVsn197rdtgi3Ppvn7Ciep2WmML4MYHQ4jP4sTcnM2oPpvm0dGauBXAod2ZAIBJk1I5joEQwv8aToZmrk+jWwk69Xsnuoz2GeGqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NKSKHUpR; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NKSKHUpR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so2033973a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789053122; cv=none;
        d=google.com; s=arc-20260327;
        b=jPWPciih7qHmu8oo5WKxDy2psl3hY6MMblTjy7eSFQr3v7sgg9PHmEyvBxuFkCopCJ
         ek31AXe1E4wbpiPLi2eGFhAJh/kJ9GKtjTheJOEVKuGN6DL09soodzyuNemoJwjGCTxY
         ECmeITRQ6HSmkMSbOB0nsNkJYZN7TX1tT0rRHp3aJhq8ZGKcbAJ9pS3ziA2YdnrZ1NUn
         9CsJbxRIryC9S1LbEKbU+XF95R+t9FGS2cT5R0ArwWQOdRfdZr5MsZLyWxxI9Bu5IvOR
         cpMbVGF/+K8I51e2leFwZba1LAv8BFvI8D78l5fcCIN4baL15ERsrc3m+1PMSJaMFNlo
         LuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        fh=IpaFKu6597jJdNA225e0oAwMbzDCoGmjO2M8Tw4OEmw=;
        b=B3MBOLnvGkeHnVKP4iPRPHW8iCg8pQ+S8h98Y/BDk6Tyxeyy+HwTZxzu4Z8NKBjU2b
         62DB00orL5YLIvfZPolVqrRYbti94kLgJi3SBoQ3KPj9W0khJzxp3SBKckySeCw9W8if
         SZZoJIi4to4pKvWvxNtBtD/Vlbv590edoSa0WRhl4+yom0iqay/Odv+ofsV9YJhqR4yp
         dChKPhWPOGy2K4orcZmoD4IrZM7hyqG2S8YXXDNXY3dfntQEmo/6O58EKZc3WWVwyu75
         G8AbEsdkkgKx4oAswJG5UBatAx5lSUDQ4qYDzuelOgEWUaoR9sEOnwMiYrKP+/rHsbAp
         q9Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789053122; x=1789657922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=NKSKHUpR+thOvGcKNGXMcobP/XsY11DLiZ/1z/UZiNdz4uSNspyL6QbuGAi71u5cGu
         cTk91dQErjMDeNyiuyif+n6Tg1CwXembYTkJ6PWm4Fn3Q01VnqZfvUOmyGekcr92j7e0
         MQghOW9Se5OfWBpDRyIPerABjVq7B3PG4Lyy3j9GsurY77F+8aob6GnLexIVH1Are9tR
         HQj46GNo5muuZj+LOMWnjzIiBghR1Oc/rz8p9iYWsnCi2TO9pI0jVKQYL8SvatcXxn3P
         5jaOC/bTux3Vu54Fr12ooKh1VPEN62MRH/IhGldugaPd4haf9RktLIq49D4aC9/0K5sK
         22iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053122; x=1789657922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=nmzS9IcNOkWalhoKzCJFAYrdxwKEyZ+A+EfNEOvobGvUmKOED1lnZu0RH7jI93Qw5P
         XqMX3fjQ52a9q/tNCIDyrG3/Aespf3cjp6SIfBvfu2xu/3UXZgrFTEiRwSeuEBt2aN4T
         TZSQ/5bqtaRx8NExoQUR3IUwuBLPoCqpgqfrUfTvLxRy1Ewgmad3RkAeFpHCFKItYEIt
         CbTo/QtaEFfArXtNJu/4PdM6ClVdnTh5KfA78I8RH8MxXLCXW+wtuI3UT6kr2jmEEIo2
         RsddYNN0NdIRLlShgs+J8QM+NBsE8Q3zciCVsgheZXPeGe1Shy3K+KVqblXduIC+aqfE
         HLkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYAQK47j9XtQwp9jrfM/chUYlqhDI9M7g6NNjdAGPhQmijKzVVBU8mcZfK1F7XL7KhsRWFc2HvJMoaJEM=@vger.kernel.org
X-Gm-Message-State: AFuF++mcX/GouW4QnVvJ601dZo7eBnPgLi+UKCgkchz4FQfePhNq7DCm
	KUcHcswKbLVh8p2Sr3nvaTWB06yYqLwmihxHRY47I5rRWpP4t8SN0r/Atqaylflkd6GT6Sa0Juz
	2Dw7AaqRvvEB7s/Fy9bONNwb+cHF37RAcsWH9ImOFScCiblyzbuTHqLs=
X-Gm-Gg: AYBFou0PFG5qiz9fvAiLVyIuscunrrnYUVCw12xYl3X48vSEQSmVO1eY5jS6o8IKSGE
	9f6yabAHTw2t62w7pk+znSaJf9oLDI9vzji7jG6W5b/reXIjN3VDqmNG5FClhlZb96M1PKfQJlN
	xZgAm22qtg/ECNnsX0G8TnJwJwNA2CYxvp8ntF3n+5xCelN9wbpfME/k4s49k9miXmrweIW3OEV
	CLc3ZV+pueUAnBLlxTnc7cy4cNdiCwP5UzN/EjUQb+WM2GKrzzZ/SRkFQ0zMfr1HFT6keDqx0uf
	WcZC9qwXRX+pyzOCgJI6wqzf+ia9wEFMKp5mxnQvH5os3F3eaBSJhwutmfuddaY2pqIqD+amgeP
	ejQNkYF3Qk0Mrng==
X-Received: by 2002:a17:907:c5ce:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29418b652emr491393166b.2.1789051729432; Thu, 10 Sep 2026
 07:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 10 Sep 2026 18:48:33 +0400
X-Gm-Features: AcwNN1UfoxjgFqkNtB6Aosk9zTLZTrJucLfz7oY5DTmBgBUsxij8crpGNXoG4yA
Message-ID: <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flipper.net>=
 wrote:
>
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CP=
U
> ID and patch the resulting addresses into the device tree they hand over.
>
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivatio=
n,
> fall back to random MAC addresses which change on every boot.
>
> Formalize the derivation in the DT binding and add a Linux kernel driver
> implementing it, so that a Linux image can use the same stable addresses
> regardless of the boot flow.
>
> Only RK3576 is wired up here, that being the SoC I can test on. Other
> Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> than 0xa on RK3588, for instance - which makes supporting them a two-line
> addition to the driver's match table plus the layout node.
>
> Patch 1 is a prerequisite fix. The OTP hardware has its own internal stat=
e
> machine which only works correctly with serial access, but the current
> driver serializes nothing, which results in timeouts and/or corrupted
> reads (e.g. returning splicing a TSADC trim value into the buffer of a
> caller asking for the CPU ID, or mixing up trim values of different TSADC
> callers). Hence the Fixes: tag and Cc: stable.
>
> Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
> U-Boot match the ones derived by the new driver, and the driver correctly
> assigns them to the network interfaces when the kernel is booted without
> U-Boot proper at all (via Falcon mode).
>
> Sashiko also rightly pointed out a use-after-free in the nvmem core when
> a layout driver is unloaded leaving its sysfs nodes and the postprocessor
> function pointer dangling. This is fixed separately in [1].
>
> [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebe=
b518@flipper.net/
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Switched from a scope-based guard to explicit lock/unlock calls in the
>   OTP driver to avoid mixing styles in a function using goto error
>   handling (Sashiko)
> - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0=
-ea9135270fc2@flipper.net
>
> ---
> Alexey Charkov (4):
>       nvmem: rockchip-otp: Serialize reads

Incidentally, patch 1 of this series also fixes CPU thermal throttling
on my RK3576 device: apparently, the mis-read OTP-programmed thermal
trim values broke the thermal governor logic, which now works
correctly with properly serialized OTP reads. So it would be great to
have these merged.

Best regards,
Alexey
