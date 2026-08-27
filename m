Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE52409635
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821158; cv=none; b=cJfpY4zdWLDl7l+Y7yCimtEFS4cLpjiYk44hBUNMQskZS6eeb77OjD5iqaFd3E5kmTEFShqycCC1ucFOmb2p/5wKsRgUknzdZN25g/TK7pCHYiC3IIguQusdzam2iGzjUbn/Dtd2JNxnHrpfnX+el7/aBYzQTrgU9sOh98qkS7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821158; c=relaxed/simple;
	bh=vMcrYLKb2rGiNl2lES7gb9jc/fRo/kFIrFythpqbA5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNVIdtImi/A4CHy4ZjLqnFJGZfANykXGrJojv/qDyS3DMaPnnRmmIXlVBnZf2YAW1937hT2G8dJI8GMxOhFiqciEoMgmwfDKk66zhDMuJ4upbDMxYo35pWDc5rWQdEadKm/muB5pQQSU+ySKSBACdRpfEgKxUzUUeOp91eCJQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vkr1iQ6w; arc=none smtp.client-ip=95.215.58.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vkr1iQ6w"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vMcrYLKb2rGiNl2lES7gb9jc/fRo/kFIrFythpqbA5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787821154; v=1; x=1788425954;
 b=Vkr1iQ6w9Bc5yFEbZq3zLJ5zgqAdckdyi96xt7fk9OXMy4IbWF04zb7cmLMBJgpyEcCE0BGX
 G8tG3zEQfGh+CCqy1DZZUMvmmHG3jdi2hOMwKcDJktziOq3wO9a/xwjYayaQZ76ck3PP5obudyF
 coQufdvTfUIPevqOstSWNFBE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca40fc3cf7b67411;
	Thu, 27 Aug 2026 08:59:14 +0000
X-Mizu-Trace-ID: ca40fc3cf7b67411
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso5078e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhsHq7LX3ZmGwOnfTrRgHl9aEuQ5LGy0Ek0bxtXkC6OkK6mwuUDc5r9sqyP9h9akbOt4d7Uxy5AT2tp3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n/blGD69mq6y8QmxiEiP6pxbB91NDVB7XFiuwd9QPjbNUT4Vcc
	RsJYffsZP/ozYPNOl4GXN2tVZ7FIoMlFtXTlLbFWmy7Hkll0DxfiCC8JLbgw177j6AbSFf4t9UO
	SeNwNHWwlJAW1zfFHop8grnTyacPO8V96AHCweN5U
X-Received: by 2002:a05:6512:2509:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b503826bb7mr82177e87.7.1787821148250; Thu, 27 Aug 2026
 01:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-2-fuad.tabba@linux.dev> <ao7uY-dpJocX6ety@arm.com>
In-Reply-To: <ao7uY-dpJocX6ety@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 27 Aug 2026 09:58:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzVVf_r2WU=2-WtNsQbmsCZ2iymS=7TXRZJUWgvN3ibcQ@mail.gmail.com>
X-Gm-Features: AcwNN1VmFyCYMk2mFQCC6IsCKuKvuxtYbRK_OCmChpUR57uHP893DFhxuwtdqPM
Message-ID: <CA+EHjTzVVf_r2WU=2-WtNsQbmsCZ2iymS=7TXRZJUWgvN3ibcQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: Apply overrides to CPU local capabilities
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Catalin,

On Wed, 26 Aug 2026 at 14:47, Catalin Marinas <catalin.marinas@arm.com> wrote:
...
> For completeness, we should add:
>
> Fixes: b3341ae0efa2  ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")

Ack

...
> > +     /* Apply the overrides */
> > +     new = override_cpu_ftr_reg(reg, new);
>
> Not sure we need this. The init value has already been clamped, made
> safe, so it won't change the result.

I'll fix both on the respin. I'll wait to see if Will or anyone else
has further comments before doing that.

> Otherwise:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for the reviews!
/fuad
