Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323545;
	b=fGCsx48PhWkDXdv2cZbjFj3cSVd0PYpHKD4VviY5kG3ZkIp8sHLVgKFjxxY4zD/yPW/4
	 4WsHIcgLdvvIIWZMJiueoW6HHyNfBSK5PdDpnmxIyt2rTEU+PDTdL2xXrDoKxo0sZ8z1j
	 +xyujHpcf4qrBhBUVRVfo0X4AgfPAQZ5QmrJkPWyyutUuerSPS/iI1wqXoeXTUIL/eywc
	 PcKAoxjs6Vxq+3AqV0MeO7fBZ5FDLOdoGHp9ktD/y+yjGvyS9UbX5VfD17Pil6m5Pv1cj
	 t1wAUZU+M8RUBbl3eP8e3ihf2n8S1iwSCml+uSQoACx3gXuP+GPDy7F3xJYn3OkyE9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KpEwWty65XIKqwE7JeJ6p16oyvStp8N2eZzOQMIZadI=;
	b=v6Ni5SxKphIE0se0jcvyG2MIiFXQs3u1lidRxVzKk1XKlWQ6oavNlU/HSiKOEWxBw4ST
	 Xy93HHfiCTjNTB+PZqBR6CpHGym8cslHqQNWyy7Q7q34ItQ91GI06imGlqbspNUJZLlc3
	 yio2AgadZZqWe5rgCb9pxwZmae2AKPALAyZH7TesPQ8nMa6Z+Qg9FhhOwQZA5FNDN8ww1
	 k+bWCCzBcAdt/aZCiOkfXKf5TNNfyxLdTLSl2zu46gI56f7yIQsdwbHcFiu35mt7ScwLQ
	 wz0MI+ibLiO3mYdUQSQdCockWbQ/18MZtwEv54pz1P2rAO2t+xngdNFKO21QR75VYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="YOUBG/UJ";
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8126360A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8126360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YOUBG/UJ
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eabf243d05so658408e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794323544; x=1794928344; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KpEwWty65XIKqwE7JeJ6p16oyvStp8N2eZzOQMIZadI=;
        b=YOUBG/UJDUN4UyxvkhIoLhefkcKvcqtCc43YY9icyFLipWGwJr4yRhoF61ai04yb3G
         /3oA/YdYUik8WvsHFnI3gFCqTxtjsY0R+rgJT3k6h2A7QoXojCu8iohoASLyE0xrRsG6
         r77coPHPIo9sHj3xb1YOG5IhOJKV9qF8R6gyeeM54RzrM2UnL6uNga7Md3t05uiI9v6o
         5KldDRCzbIk9P4MYLEtb+lU5m6ZqVMMuwQ4336EDEh3PepvHzOcgNGzJe9mzOCIKRb4w
         P2iFaU19sefu/7GQ+UIx4MnWmqodZKnGvXovtykItH/b2HiCw11TEk6EiCg3vu0DA4qv
         p42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323544; x=1794928344;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpEwWty65XIKqwE7JeJ6p16oyvStp8N2eZzOQMIZadI=;
        b=w39lKL+0hnx3fWykxvmPeAIbousJWFjtZHQsb0zQSBbcehnFkgJNOs0+X3XuJWbTim
         5ulAsNL7gaCa7DaDW9OUSdmAKhfFjzx+iTEUzgJWT8RJKZkXCRg84n3/5y35u752e/Hf
         jBCGJ/Qv4jaNnyid6x9Y2TZF0RitQSmowfak+9l5aoA8mrBGDPC4Sk6DVYuNBMbU+RFX
         CTgyGAZAb4dTmcfl3p2RYLJSteSwplClOlVbt1rSS+cL9XJKeJes6XMmLUG/ZUXD8Iww
         fLAWSaEbfDczqMyg43g6J782/pC0XBayPLOdaMmN8YrCI2C0qUlQxSfDBuFcMhcuTWB8
         8gtg==
X-Forwarded-Encrypted: i=1; AL+hErHHmu4I7nzLbX9FMTALEKkdS75jeU5K7Ov1vPO/ATzKH/cNDRXd0dFbH9Kk1ho4gyvlLrDAMy3lHnnx3Zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pa/pzUTI2dxnI+4wTF+FGHgsPTIMOlPs5iUfB/B4/w7j+ZIap
	8U5teiyrYc/fTlYGUsCRaw4Zly9Q5KXP+Ipd2cT7YgYv5ePeQDd+oWS+jagHC6AnR1U=
X-Gm-Gg: AYBFou2c3iJ5UEsVSqRrWLkeFGoe9z7L6+uhofX19MHRT32uoYSfiaC/ZwedRR/gnT3
	Rr4zoEvZusl1YvMLZkmwO+48/pgjhuj6iWN03bDEURuL43j37qUliW1HxmBdEi56jmZT8G59xp6
	ubZKLvBMDzlX+hXqA60bVdGl/YH1UUttMsVnMlfuzX/35lUm+nIpxB6lC0rwrwhRvueH91kJxom
	ma6r2ywk2axm/p/FpFmh50k/gUKyKZUdaGWFMXSITJZJ3ZukKtroQIfL5++WAZUO+fFBMEFwrQ1
	8ukZYQ957ZXV9124zXTgVj53nPRXP8TpM7TKGfZi00WzqV9DIHD0ofsxP83d4ZLU9WiEZqkXkDg
	uaxIaD+SAZVKA4HLo+ahhR75HNPtqhqmzFGJraHy1Bv36T9apV7ToupUD0BnpMOOdY1HsJRCtYx
	j8nbMaemMd11yZitzx2ggX0eETa9j5Ny/flDKvN36gMx5KPCcHFfURadmYeJbTlbicx9F5ahdU+
	BUQVDn6Aq6epKDn7QtZ/npVtxPzm6Lqgs9Jr9/cXS9W7EGwrx3FxY5IJpcank6DfXkVLJdt2PvG
	WUj38elZuI8O62E3dZLFHrcpLFLPDUnFrd7rInc02JMRQ7o5DTJ9RqpR6jxFVuiwAmemwoSWCrL
	7plpourvZdJWyqZG8CDrLLGkQqmVh
X-Received: by 2002:a05:6122:5313:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee0d0cd07bmr947867e0c.10.1794323544266;
        Tue, 10 Nov 2026 07:12:24 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c45a110sm2039560e0c.2.2026.11.10.07.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:12:23 -0800 (PST)
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
Date: Tue, 10 Nov 2026 10:12:22 -0500
Message-Id: <DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
 compatibility
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "David
 Matlack" <dmatlack@google.com>, "Alexander Graf" <graf@amazon.com>,
 <seanjc@google.com>, <jgg@nvidia.com>, <loganodell@google.com>,
 <arnd@arndb.de>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, <oupton@kernel.org>, <alex@shazbot.org>,
 <gle.com@google.com>, <pbonzini@redhat.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <kevin.tian@intel.com>, <joro@8bytes.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-6-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-6-tarunsahu@google.com>

On Tue Nov 10, 2026 at 12:01 AM EST, Tarun Sahu wrote:

> +/**
> + * DECLARE_KHO_SER - Register a serialized payload structure with KHO.
> + * @name:         Structure tag name (e.g. luo_ser).
> + * @payload_size: Compile-time expected size of struct @name in bytes.
> + * @nr_required:  Total number of defined required features.
> + * @nr_optional:  Total number of defined optional features.
> + *
> + * Size and 8-byte alignment are asserted under CONFIG_64BIT: KHO and LU=
O are
> + * 64-bit only, while !CONFIG_KEXEC_HANDOVER stubs pull ABI headers into
> + * 32-bit builds where u64 has 4-byte or 2-byte alignment.
> + */
> +#define DECLARE_KHO_SER(name, payload_size, nr_required, nr_optional)	\
> +	static_assert(!IS_ENABLED(CONFIG_64BIT) ||			\
> +		      sizeof(struct name) =3D=3D (payload_size),		\
> +		      "struct " #name " size mismatch");		\
> +	static_assert(!IS_ENABLED(CONFIG_64BIT) ||			\
> +		      __alignof__(struct name) =3D=3D 8,			\
> +		      "struct " #name " must be 8-byte aligned");	\
> +	extern struct kho_ser_hdr __kho_ser_hdr_##name;			\

Remove this extern.

> +	enum {								\
> +		__KHO_SER_SIZE_##name =3D (payload_size),			\
> +		__KHO_SER_NR_REQUIRED_##name =3D (nr_required),		\
> +		__KHO_SER_NR_OPTIONAL_##name =3D (nr_optional),		\
> +	}
> +
> +/**
> + * DECLARE_KHO_SER_HDR - Declare a feature header variable, field, or pa=
rameter.
> + * @name: Structure tag name registered with DECLARE_KHO_SER().
> + * @decl: Declarator (e.g. *fhdr, **out_fhdr, or * inside DECLARE_KHOSER=
_PTR).
> + *
> + * Declares @decl with type struct kho_ser_hdr while checking at compile=
 time
> + * that @name was registered with DECLARE_KHO_SER(), documenting which
> + * serialized payload structure a feature header pointer belongs to.
> + */
> +#define DECLARE_KHO_SER_HDR(name, decl)	typeof(__kho_ser_hdr_##name) dec=
l

Remove DECLARE_KHO_SER_HDR, use kho_ser_hdr directly.

--=20
Pasha

