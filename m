Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5F3B9D98
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459841; cv=none; b=ubM5ds1SAdoc3fULoMFvOjwCsBHtqnfsm7QTHDjOa/LV/3ofiw2+9n7oArA7ktONCaWyXxwbarndGMr6FkR6eXbzvfDdkLRFixoVB4s7nRLqEE9EqFBpRMn++ExjptmZqyt93BhviS/sDll7hGiH7PVlkgH43ngybplw6ZVXQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459841; c=relaxed/simple;
	bh=jUPxCUFc3aTBCASOlFZdGH03w0fcbvkjqzP15izyvIg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=RiJSDmuTZbNQt9fcUS4YcgbsPAfhG618zLTHZRnIUkn/RuFLtvmdUkVsKOiBoot+MtmlF8u+xncUg4ZZmWxCWG3M0zL5sURRuYxMsmDeBbzEXzTWz9cls2ldQZyVs5ev3ZwwQFhKUlnnk4pBBiKs6Mtsa8FNKytBN/3j7nPX/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=cphJCRxP; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="cphJCRxP"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 79D24240101
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791459837;
	bh=QA4a4/0qY83QQNCueloKQP2TPYFXj/uUC4YZjubeRHI=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=cphJCRxPquv5vT62es7asTSu3dFCCXplZYii8lZ1hCkMRsOjSLW87+8ufdG+M/0Te
	 U77+zlgHzBFXs7bzLELYs5Hp/k/QjycwA8tSEovzyqs2Byf8Uwsc4XxZ9ZPLM8IHK1
	 1Kz+qiNz476D8JBmGKgMrEgT6f5cueC9F5nM7Qfcpl/rCmrZ100V53qNPo6OK+mWwV
	 uhKb3ln48oZabYtOmktnob0Fwc76oNKZLtbqfyBhNp7eUVQ5WrfjwA+s3m51fWfD85
	 lBh1u5mx2ynlyO4J1jZYQWGzPM8O8YrKRcyUyQBC2D4JymDlHvQLc0vrxBvFdjuQt+
	 sqQjdTruvD2pw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j0p6h1JRTz6ty0;
	Thu,  8 Oct 2026 13:43:55 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 08 Oct 2026 11:43:56 +0000
From: mateusz.nowicki@posteo.net
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
In-Reply-To: <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
 <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
Message-ID: <1baaa8cb024104ee6d201d55467f6718@posteo.net>
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

On 07.10.2026 11:22, Patrick DELAUNAY wrote:
> For STMicroelectronics boards, the STPMIC always-on regulator are
> managed on SCMI server side in OP-TEE.
>=20
> So no need to manage this constraint in Linux device tree.
>=20
> This always-on=C2=A0 regulator are exposed only for information or to be
> used are supply for some IP.

Thanks, that makes sense. OP-TEE keeps these rails on no matter what
Linux asks for, and the board keeps running fine.

The part I found confusing is what Linux reports. Since nothing in
Linux uses these regulators, the regulator core turns them off about
30 seconds after boot:

    [   31.713597] v1v8: disabling
    [   31.716454] v3v3: disabling

The SCMI call succeeds, so from then on regulator_summary shows
vddcore, v1v8 and v3v3 with a use count of 0, as if they were off.
In reality they are still powered.

With regulator-always-on, what Linux shows matches the hardware.
Would you still prefer to keep it out of the board DT? If so, I'm
happy to drop the patch.

Thanks,
Mateusz
