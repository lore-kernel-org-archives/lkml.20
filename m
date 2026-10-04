Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ABE43A7E9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121216; cv=none; b=RjGTmWX8LttXzOGTyzyOTVgy5LVNRKRwbjvMlC89obLIwdpi+EcYRaaSyCLhBh4go2nPV5ZwSPXyLjz6EUOfDLdI1OrZi0eVn9xtF7E9T6xXgklZgBZrrWiSKoDFu0WRvhDs8nRxRl/VqxV6/1C/kCfnp5hybdtscPgZUdYJaBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121216; c=relaxed/simple;
	bh=PNI2qDnLiaqV8BxH9fuxXcoBvBHpUmc8du3BEbYd2ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyS9DfZpI6grV3/siNL6H4D7yRX6jppOWHItBjL2brclXUD60j2ry4qATjQDC09XgfC1y7GlSuTITtyuweKcQo/8PL2nsInQPrd13OKuaXDaCuVDC373POJ4L4DEp/hgH6XbTlWE9I6kT1Oj3ZU6nDfELU1tv3ovvrIKQ7WcAm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AvErFAan; arc=none smtp.client-ip=91.218.175.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AvErFAan"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PNI2qDnLiaqV8BxH9fuxXcoBvBHpUmc8du3BEbYd2ug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791121211; v=1; x=1791726011;
 b=AvErFAanDYBdpdolPesSV8v93qLBYj99QhhvJ780KVmGFkNy5M69qbLZoFqBQnUU4psIYDF2
 Gfh4e49o3EN3FiA5SRhQbbloy0uhmpewwPmQJRrR2loholW86YMBfex7ikLOK3Ye5y+0BfxP/Xg
 OQxDoB8TRZR9rvBw31ymKerY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5116ecf77ed4667d;
	Sun, 04 Oct 2026 13:40:11 +0000
X-Mizu-Trace-ID: 5116ecf77ed4667d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1082e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxl1vSzmxr8vHqe9Y1VhBjKc292VlIsP9jpmgf3gDRI1iZsDxzRvfymnCPEkiwjEA+CehLlf4FxWhrMQkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsIONYlrE/+0+vBiGS7OJeTfT/w4Y+k2s6D5s5BKQIl2uMP9ig
	rUtW4U8h5XzBhnvN4IxjXvlF3ZeV1iPxtMt4mNfiEBrhmg7wtErQp8U+aIbJRoBbikyjp5Pe6LV
	iYp/Rro/f7d259QGglzwwwT24DImCRZW5Eg3aEgt9
X-Received: by 2002:a05:6512:23a1:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcb62e44a6mr80016e87.15.1791121206347; Sun, 04 Oct 2026
 06:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck> <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck> <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
 <ar_QOXqCYTGargBe@arm.com> <asIQ1ZwUjkmNJbRP@willie-the-truck>
In-Reply-To: <asIQ1ZwUjkmNJbRP@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 4 Oct 2026 14:39:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwYMT6gKZiBf70S9JgNtzBj2jES_4xkzVUVKHHd6mPNvg@mail.gmail.com>
X-Gm-Features: AclHuK_ztBU3Lp4brNTuBuj0lY992tOQjsYAyS5cYhB7Md0NCpETrVALGjPVujw
Message-ID: <CA+EHjTwYMT6gKZiBf70S9JgNtzBj2jES_4xkzVUVKHHd6mPNvg@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 04 Oct 2026 09:39:49 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> I wonder if it would be worth having some #defines for some of the common
> conditions, so we could avoid having the bare immediates each time in
> future? (obviously, that would be a separate cleanup rather than part of
> this fix).

Thanks Will. I think it would. There are only a handful outside
arch/arm64/lib, so it's small. I'd name each value after the condition
the following branch tests, e.g. CCMP_NZCV_LT rather than #8, so
nobody has to work out the flags by hand. I'll send something once
this is in your tree.

Cheers,
/fuad
