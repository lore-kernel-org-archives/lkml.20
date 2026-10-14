Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503181684B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944195; cv=none; b=YpU0kd/EqUZXksE9El+EHjjjTMeUUXyFUK0UwaaS4gAl3cimT1NfDbaA6JMHyabiOimtFd/vK6EHg4CN9ReO2FTxMryMp3uMpVUbnlKpgz94X4FPz6WAGYti0Q33Kf7FKFtzSpyOpe7p+pCeQhbVMwCZd9LekwsdvgGKdQarCuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944195; c=relaxed/simple;
	bh=ValUy6NcJ7XWvyFZxFe0+oYX+hzVPfARyjSGuOAeXz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg02SKPn6yFd2VY5Qa49n1YorgQwfP1wBiMR4GmbQN/2/hG1N5kuic+DDKokamICRzPYMsIlN7eDbYbV6X0qBQgu//ELOrRyTCSRHbU7MqCtY3KpLUCv3Vuu5YTavzBIcO2Vo2a+2RBDWmygaR9fbUiozyj6x1XVrLe9rBKNwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=VSwdPvqW; arc=none smtp.client-ip=139.138.36.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="VSwdPvqW"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791944194; x=1823480194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ValUy6NcJ7XWvyFZxFe0+oYX+hzVPfARyjSGuOAeXz0=;
  b=VSwdPvqWMMLxUh+PZ4xb/EN7pXBv15PbnV0DFvseSeoQaAOBEeJA4jvS
   iuU5pCsS05R9bc0eNYS71c8aB7YXP/Xc9dFYd/1Kc6UNZ3iPYgDSi6wtg
   JXt/fEMg3YsjO2sHqQpGDfxeWlBrBPUrU/HzzFHyTBdFBnOB5ZNpGjv+X
   pQHi8jvcj4dkO2UiWzBJAkf3VV39yliH9TY7TXSseJVSgM7NXM0EVmeb0
   E/kUcebYDR1njwaDPGTRH0bkjnA4/ofeYX2/AzNhVwbPFom19tqubGoCz
   1Zb8s9WGD59LDr5UqhlkjIJQRGoUX387qMWKiQJzEUzBDzBWAxCt7f2Q8
   w==;
X-CSE-ConnectionGUID: RlR3m1LNRNWK/Ckofh+hVg==
X-CSE-MsgGUID: AtoyDCtfQaaGPxnWVP2UcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="244307947"
X-IronPort-AV: E=Sophos;i="6.27,156,1786978800"; 
   d="scan'208";a="244307947"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:16:26 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DC5191C000EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:16:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8A68D1801EAA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:16:26 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.5.209])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 4848F180059D;
	Wed, 14 Oct 2026 02:16:21 +0000 (UTC)
Date: Wed, 14 Oct 2026 11:16:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
	Steven Price <steven.price@arm.com>, "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as7jnnH0hAvYa0UM@FCCLS0092175.localdomain>
References: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
 <as5ljILkGNxH0TTd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as5ljILkGNxH0TTd@arm.com>

On 10/13 18:08, Catalin Marinas wrote:
> On Tue, Sep 29, 2026 at 08:36:00PM +0900, Kohei Enju wrote:
> > The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> > realm_config::hash_algo is currently declared as unsigned long.
> > 
> > There are currently no upstream users of this field, so the mismatch
> > does not cause an observable issue today. However, a proposed series
> > adding support for Realm measurement registers uses this field and
> > exposes a bug caused by the incorrect type.
> > 
> > Change hash_algo to u8 to match the RMM specification while preserving
> > the size and layout of struct realm_config.
> 
> Doesn't the RMM spec say that the unused bits must be zero? B5.5.19.

You're right. The RMM must zero the unused bits, but TF-RMM does not
appear to do so. I agree that this should be fixed in TF-RMM as well.

> That said, I'm ok with the explicit u8 here.

Thanks.

> 
> > Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >  include/linux/arm-smccc-rsi.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> > index fddb77986f70..2fb6ec5e0298 100644
> > --- a/include/linux/arm-smccc-rsi.h
> > +++ b/include/linux/arm-smccc-rsi.h
> > @@ -128,7 +128,10 @@ struct realm_config {
> >  	union {
> >  		struct {
> >  			unsigned long ipa_bits; /* Width of IPA in bits */
> > -			unsigned long hash_algo; /* Hash algorithm */
> > +			union {
> > +				u8 hash_algo; /* Hash algorithm */
> > +				u8 pad_hash_algo[8];
> > +			};
> 
> I would skip the padding for now, we have one already. If we later add
> the next fields, I have a slight preference for a u8 reserved[7] field
> than another union.

Ack. I'll drop the inner union in v2.

Thanks,
Kohei

> 
> >  		};
> >  		u8 pad[0x200];
> >  	};
> 
> -- 
> Catalin
