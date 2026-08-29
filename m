Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE873B5F63
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018786; cv=none; b=RNnGp64z0EMrsIHo7xyRhuIdEKCY7CjVYeKtUT07GiLFNd7wIIsyqrMR7JYlOJ9kgRM6E2ZwHSt6VWBYvxa801rmzI7Jv7mwXmVCvjVneXx0d0JK2kfLG0DsfCZHWLxT4xrxl+wxiPCWk7tN/sHSA/wTblXjQCK80sTU8qXR9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018786; c=relaxed/simple;
	bh=u/QcdMTFyvL/N8kNdZkXvPw5nH3ZXvrAXroaB5kwYPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNDW8xC5ABGiPYF8Ui9eZjthLLpO3Pl17yRUo9SJw35QKPbs+J80oVSiuP9PsfhVscukkAdgqlP3/fNKi8bpbHN7sUQ9NcSqrlJSNb4lCacw1FdB3Ll7rWf3fpbz2eWaUzAoTVwCJxrBy/juQAE8M8YMpwppsZxszwbq/Xj+OEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFI8qlPJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFI8qlPJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1321376f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018783; x=1788623583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=lFI8qlPJ6V2ZjAKioi4Q+RhnIlFDQ7LXTv4LzWnXJa2JHUtTzQL5E+qjXSGWLhnOSK
         SSkeT2zmb71LCwDhflFfmvP2vPkQdBWg/3V9DhSRDiulX09BTD1p3i7kTSjzX4SMNmdj
         gxA8xaQxibtBq6ARAkbKuZYokNtW44QTXZqBQ9GMho64wORLOShoQgHHwz+6mRu4L8kZ
         pcfSX/BwDO3RZpH5wm8dgIKBSu4elMAuaWNyiA1WVwPEjrBTaPXsHtmZQg/BoLVhtNuQ
         7QvrLdSkicsaeuFbBygrGq96eD7hpXtz9W3lWMeYlV54kaTJF83QwAYKPUZA/Z+2ezLY
         VhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018783; x=1788623583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=ZpwojDFCAj46jvKrJv1Y4KV7jeYbDlyyexC565WhV0AsHep4Oed4dysabIwslN6o2v
         wqfRYxRgQJy3JRdt2OOviZy2jYsJobGRGXmrRaRglsqU+JAV8eMBkFP3aUAmYsu+uGSe
         IQfKuBtZIBK2g7rGdHbfTMq11uWGpbu4SVQAZ1+8kxoL750ygtllALZVt/wlWZCBCxOs
         O9KnbfuicLUFV7Axx7U5XDMM4ASp9fJhizFOcNgIZ5RBJQxGLdu938GamlIMdR7ybAA2
         R4E4UY/VomDC3M56mhzmJDB5T//2nrsMyyIuTaCKlsvVXeIH9E1lhmDPoIZtQJkuGEzk
         8Cyg==
X-Forwarded-Encrypted: i=1; AKwUvBxHGP173WZT7pN4EsW7FZzaQIU4cXAL8pm2c0s3Hc7tk++v8rdvIH3lnMww+sKgY5S4fCY1uQrAIPiV0wM=@vger.kernel.org
X-Gm-Message-State: AFuF++l/jlsKfbmSiP5oJwMci50OWwqoX+cFpGcMZHxUqVglcfX3mDSN
	ZUZqyP8qow5Tezz7HfQe1ehjGr6Bx1Wg56ehVzh5hIR74TVIzYE9ZcP7
X-Gm-Gg: AYBFou0T9pMzAabD8P6znN9pIIdGXE8sMMtleXUjpOgsDDLpZ5h6E+lha3nzCh+n9Mw
	NkuuWGlDELVryYydJXwBUs3LMFdV5zKftESCx9RN6Mw9U0BZyk6UpJ4a5S5qvbNU+p82Mb9MvW1
	x5Up749+zXiFvaQyuYk4gbbR7yYR4j5E1bCgHlCK3bI5yGOV8dvoudsYkt6AG2vaKLKg+oLXV2c
	TAREUZfb3BPdXozIPpkRUiqtsOyDTMaPHNk1GnGdr6ZgO2xYej9m+tPtB6fDFvRTnlnlRjv25Ji
	VADHwAS3vMoHkVOvJjEhLkF0A1WHvhdMXeyNFGzhx+kbTgOQc2kx40yXOaqNyHXqK5/4eUsFh2p
	E9KuQFztClUHoG8CKvawG3z9WC4A3Ee1pO139yajoA8baLONlsFHYoot4D3kD3nyaOnWSC3xLV9
	yZX5PZeMKO/b0mkmxrrWaTgceU1eogglbI6yIfD9G3zhf+Kn/IyiMYu+ujttTto6iM30TPCrlQ7
	oHmTxf51MdEb2lg8On5CgLXGrWQBUsff1xVXOSEeifzPgdlYeNEKoYJEPCjc2upalHdcObG/9r4
	pbf7WZVi1WEtohstE/lTRaRpdeFombW7GbQV5tob0iLG4v59XtZuLnq8JKT3Umfjb4NwJA==
X-Received: by 2002:a05:6000:2287:b0:484:3310:f399 with SMTP id ffacd0b85a97d-4843310f41cmr3869418f8f.26.1788018782440;
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm10864679f8f.20.2026.08.29.08.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 17:53:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
Message-ID: <apL9jzg-KM_n3Vv2@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-2-kmehltretter@gmail.com>
 <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>

On Sat, Aug 29, 2026 at 04:04:01PM +0100, Fuad Tabba wrote:
> > Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> > Assisted-by: LLM
> 
> nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
> [TOOL2]` rather than LLM
> 

When I first saw 'LLM' in a patch I thought so too.

But it is now allowed, see recent discussion and merge: 

  https://lore.kernel.org/r/87qzkuahlr.fsf@trenco.lwn.net/

  816d9992d9ed ("coding-assistants: simplify attribution")
 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Thanks for the review and also testing!

Karl
