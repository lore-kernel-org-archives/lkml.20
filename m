Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44749F109
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948310; cv=none; b=CkIDkRl3g4kR2X1eovN+eBqtT7fSoSKrPCUL2viFnFcWVhWSJEqxIkbQS+oAwoMshAv1IS0GfrmwlFZWl3zGj996OExVho+UNBFAioSc5SIRyYVYGDBRixM8vSkWzEn9Ru8UVJyQlr2lbaB/vROLap7y1306WZF5+gUny2A8LIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948310; c=relaxed/simple;
	bh=ispYBB5sEcTKbtVy3MNVY1blcRMOieKTmsbt+otEJQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlDibDU4JygVzN3jbGY/w53JvU1MeAkSADUpRSJVR3Wt1GwDaXwGS5dHhhpChqfNpCX123VldPniTA4QJaMljAmNrQOvvdBSSaPaYTRJ7IV5Kuc5kdeECv9yTodPeOKjLVrBBQUI/tL8GnNwQgrcm1FjZbJuApW5XIs0oMfM1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=c8dljIe4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="c8dljIe4"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65B523F784
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788948305;
	bh=Ne0O7Jrbbh35lHn6AVgsM7/xJO5tCKCdyIfi82Y0KOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=c8dljIe4ZZMHX1u4S5lNwDz5WUuE7F0oEb90tBdy39DubmEtasvOqHqHj1j7YhUqf
	 H8QyOXx1viEKcj1EebaGlpcJNLMq+5WJT/oI0VCWkBfNo4J7teHXkGZp+nnkXG6jDA
	 2iMZ3kjcRS+9/S6h/dps3BWRFyd2u45GUqdFkF8ihKrQkSY0IDxDAfkLGC20rKJU0R
	 EATR9vNZMYdNdpOtfv9g/urg2ATj6hTXklyFwzRfppbNbPuWr0u1Zrsvi0lLLmh63c
	 fZ0MzvoNU0cl4rh7s+Yyrz1snH2ayNIceYL25WKGngPq2ny0rVb8nWZkeZW5J5Fykj
	 DOQAHt90WwKSwAxe8pUqGAqj8BGtbVvHaCqAT4ULGkdmAsuHXLOweas3fa46deoU1Q
	 XWlf1iGFolUOXuVWm+pU/hffKweIa1wHgyfdSojo25oGb+pZxJGXwaOQP74/5LGnUa
	 q+0W4AQkVumUp62FvVzgtKjUfukjqqJfdhhwhT5/m7AgLGDiTp2XRNCgQJqJWAnPhG
	 yeOlnhQBxVlX9abewkiYemopnty8bh6mZAjVjXkgQzbFbkHmpFYscaYDVQ6HHJrTEk
	 47z4U92zhPdK4j8jQ3mp+T7hxoKd3E2CvbGwuAOfmbQHN/aB20AVxfYW5LtjzmtFn4
	 jfA6LJVi5jDXkG0fSBmb+33c=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so4816021f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948304; x=1789553104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ne0O7Jrbbh35lHn6AVgsM7/xJO5tCKCdyIfi82Y0KOw=;
        b=liOgPl8a3jfOAOYOzLzP4jMsR/LaMgaKLjb2mkTjMh4VEfjz1MAa6ksuYLlAPQDykS
         4yoYOY8H6LSSyO0EJSN6+yrYm+zuRyG2OIx9n35XNcgwyRHGo1myXesDQF2vcH9ZXMd3
         2kMlXaOHlDLzt5FASoCzUac8wFgyFXCT488GeimPPrQvOJtKEh8s96FNZ2qu8vTncxy0
         Fj40+Ag1m/iGxlGLD/7rGxBtBsCmUmk2udKTHObJWxNZYmazhqpIOUTyIaJEjhVad6WL
         aULZsfRhWc1Ivi+DPmUOLPpUkZQTe5+yPh/4czWs7lsN9WEhb3WXPtVkakJoUX5UqZUH
         GAVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcsl2ZKDb5gk0ADSL/Csf10fg34ZCeJoag39N0yF0XtFgshSeazF22im/mluscr6nTIxSycj7MoEMIf74=@vger.kernel.org
X-Gm-Message-State: AFuF++mDxm6MQwnFYwZmGJqYcKG3SguSlovoUrtk4CgsAo3jnf9Y1kSa
	PP1mN06cvoGkg3uOWf854sV8MEiawxzDJOrufSLwP2o52+PoQb61AwIafWEEEL7ObA4wDkK1vWg
	LM3OCD5ECHJLalKJGEcPfKrMiL/Hg3ysjobIE0qonTHG6EvrVlON43RcsXtRFpJKVhku5DjIUd2
	cQ0vgBIw==
X-Gm-Gg: AYBFou1IqZ5KEL5fYVMxQ4Slsj6GA2pTC5hh3nSYwrkME3j6GEp9DXfUrfchfA71k/p
	/OM6POo+WdoM9DAq0lNmHG0zUfU/kSynlKNVdaf7nBGVKC4TrHylHkyJl90NY5tUiUWklPGhtDm
	N5yKRKCmAcKOh/4bYKIflrLF5c+l0KZifW8COU9qAFQiDSwG+2dmQ0EPQir+8l6hwG5nhMqY3qJ
	g5D2AVe0L8HaYwB+qbIvudmwOqmMwIw9XshzvwWSzuL6Qp9J3cerejB82r5nHIXQW2xxIyB0h/y
	lcrys7nHnXWN6WTIh5UXOSU/0XdRwBSRROokhQlvWCyE3IvJGlPnEKvKSI7oPoPdJwCHYQTGcV+
	iFsXGn8RdVHzLQ61jQVNPGX+LWzg2xMWKJiMpLAi2SNlb/DIYjOMrINRyo24T0ROK64r+LS/N3T
	+i5QDX0pi0ZTcE/zwf9Z/gWGvsxw4RJ003pcwEBsT5bUfrm+YUYe0IIFqEF59vrTAsbwN5y3WD8
	W5sD2hsSwo=
X-Received: by 2002:a05:6000:228a:b0:485:8c16:a331 with SMTP id ffacd0b85a97d-4858c16a578mr30841001f8f.38.1788948304409;
        Wed, 09 Sep 2026 03:05:04 -0700 (PDT)
X-Received: by 2002:a05:6000:228a:b0:485:8c16:a331 with SMTP id ffacd0b85a97d-4858c16a578mr30840951f8f.38.1788948303969;
        Wed, 09 Sep 2026 03:05:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb06:c054:d70d:4174:4522:1a58:40cc? (2a01cb06c054d70d417445221a5840cc.ipv6.abo.wanadoo.fr. [2a01:cb06:c054:d70d:4174:4522:1a58:40cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm35849463f8f.13.2026.09.09.03.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:05:02 -0700 (PDT)
Message-ID: <1940bd28-3dda-4a03-a8b9-37fd0731282a@canonical.com>
Date: Wed, 9 Sep 2026 12:05:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/powerpc/tm: Fix tcheck() reading uninitialised
 CR value
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Venkat <venkat88@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907215420.1258678-1-thibault.ferrante@canonical.com>
 <4206CE63-979B-4464-BECE-F89D0B1BDC91@linux.ibm.com>
 <d80d892c-8505-4530-a23f-e3b6daf72d03@kernel.org>
Content-Language: en-US
From: Thibault Ferrante <thibault.ferrante@canonical.com>
In-Reply-To: <d80d892c-8505-4530-a23f-e3b6daf72d03@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2026 10:56, Christophe Leroy (CS GROUP) wrote:
>>> diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
>>> index c03c6e778876..6024ce4ba6ff 100644
>>> --- a/tools/testing/selftests/powerpc/tm/tm.h
>>> +++ b/tools/testing/selftests/powerpc/tm/tm.h
>>> @@ -105,8 +105,12 @@ static inline bool failure_is_nesting(void)
>>> static inline int tcheck(void)
>>> {
>>> long cr;
>>> - asm volatile ("tcheck 0" : "=r"(cr) : : "cr0");
>>> - return (cr >> 28) & 4;
>>> + asm volatile("tcheck 0;"
> 
> Why not use cr7 instead of using cr0 and doing cr >> 28 below ?

That would work, but that's not consistent with other asm in selftest/powerpc: tbegin./tend./tabort. and vas_paste() all target cr0 and shift as needed.
