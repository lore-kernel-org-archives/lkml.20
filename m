Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B23B059D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315066; cv=none; b=qXreVvQt+GSo8BbQRDa83OCLT/MNF8k9B5usGJfPrzHRN3EbFQyVNr7epi4w8qzc7fuQuMIPclBrAQh3ZBdH6+L/eQKcHM1ADxhwECN8vXASDR05ed86sEqw7zBpQh+scMaD4BcjfzsOqB2UtodksXE7xz+INeWkuFSwXm6DcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315066; c=relaxed/simple;
	bh=67GYUl8STsCl088Jt3RsUfq3IYZiGYId+KAkuE3g1r4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Uvx30KFpihApx+j3fePh2l6k4PYla/Xnxr9BD12KNHZ5PXCHEYOos4fMAO1TPbOrUJiGc3ERBznXC6niydsD1+v1AyRRL7r/kD2M3w3eFZsqRLmzayEqyRAiZWiT8gUxE07/3flmsOv/IEC2h/1GH4s5kGQpdvtlva2XHptjiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHpnXVf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHpnXVf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044421F00893
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790315065;
	bh=67GYUl8STsCl088Jt3RsUfq3IYZiGYId+KAkuE3g1r4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=AHpnXVf1sCD+BpVv4JE2PR8dnWSUgcFesIsEvO04xiCBOkZ6oJ2CUznQ2t6BBuV09
	 Jy3S0zQHZgc6dHyFNxzS7lQ1BWjp5hATKLqUuIPNIl4agIgVMc+OQUHNyIZxEDxwZH
	 +VMkf9LQ3R6hTd9giDbiu2CcXnRF4Pv9HouwR3qPEw4dTaQcRfW1JYg5B7JWFiGB1a
	 K8rPTSpGQLNf9h82n1zCHaDjFXPP13XVuu47nQ5N6jF6QxuSXP35RQii53GYkD8iMY
	 rSqrFZYjafWH6G/oot+qHXlR56pRprvyQ7oRZzfk9Hh2sSC2sOUzNNrgZVq1pENE8/
	 xt+hqbPfShL+A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6665F198003A;
	Fri, 25 Sep 2026 01:44:23 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 01:44:23 -0400
X-ME-Sender: <xms:NQq2aiZWnVqJ0hxwwEc3erYiZdskOoVbbKq2xgM8X59wOAgBGIH4Gw>
    <xme:NQq2agOm-ioeYekRgJDrtg0lTRqqpfr1lKLfSDRXYRlfpNuTsHuJ7aknE7RQDHLNM
    DabBNI2Q_4e69Dvi8Ef-PQmkz9Jf7-gTq_uYC8yIbBeq-VURoDWYGZU>
X-ME-Proxy-Cause: dmFkZTFeBs0GiuL5MdRCgdmigJja3yUflRRiYZ6mMAeE7uzYP6MiBY0OtbhAObkN+r9gDR
    SA5jCD/0mMfM+s5h+fO6Uy2HA5XUfwcd6Pii8rpvrsNh+W1U6PnuWS/Sy+9J8akyJDg8Fu
    HL8thpp/mOEhxwj+04hw2auUN3eorbB9h71eTqgHHosatNxkyTNdJtj3Sr4ZmSVrIy2e9R
    7vkJJcjiLqnAzfNhuq9NsnOx67YYl6/QVeBjUokliY1vW+RZZsBeJg2Mq28uqXgDq9W+PJ
    7dUiKJSem0sJnJTpVgMiINRRAT+intiKD9D0EqiJ5nuoO+l99NcPQnmW0wOEIN6fSZKbCH
    rVuwVlJ4379829qho8uum6AWrJV805BDVrJTyLJOvCd+8jRv3QG/efD74cyof7MbN36kYS
    B5f+gSlR2K5R9BPm9y3Ato9EAXUST5FqDFNGnJ0upjmjKKMeItuoN0435Zv7Scy3Fd/bcg
    DdVX3SuR897bOEHGqIPASE9wOSIXCi8moXPfEdl3k2IFntOHK0flKQbXQ2scsWxrzZsB0g
    gCjV2hg4GpRuHI6T+egZwCOqUKG6T1S0p+rSUog/csAocemMBW5dSdIYdOB3fAbkyzzpM/
    1C4bPxfd1RIL8eX/C1QvfFh7l6bkvSuJWLsWRk9i1keM+873CQVZla8mROzg
X-ME-Proxy: <xmx:Nwq2aufQrG_8RQJJ0uCSrpqO08kFKxUW5itZYLp5LLMOMrt-CA4stA>
    <xmx:Nwq2apum2TwCHYabxckuV0MdUX6G8QYlEUgNiNtrhv2g-xKNDpY-2g>
    <xmx:Nwq2avnuVKqfHbVorgs4Fz-2OdR1PQVozj7W6G3-oSRJjX_okbr7UQ>
    <xmx:Nwq2arzPZRQLbjfDseTb2t2XGfnRmrcq1fbImPD-EOSiPVMmE2zjow>
    <xmx:Nwq2ahOjhQfAnGOYOyX0VkJaHIbznStZN4ne8e2vYpbXTTTMazql9gpE>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C2A12F80080; Fri, 25 Sep 2026 01:44:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJeyhlgySo_c
Date: Fri, 25 Sep 2026 08:44:00 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Borislav Petkov" <bp@alien8.de>
Cc: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <e4cb78e0-06fb-4498-a933-e790999a602c@app.fastmail.com>
In-Reply-To: <20260925044713.GEarX80eZzKR-DKfzJ@fat_crate.local>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
 <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
 <20260925044713.GEarX80eZzKR-DKfzJ@fat_crate.local>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP
 Guests - Guest Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, 25 Sep 2026, at 07:47, Borislav Petkov wrote:
> On Thu, Sep 24, 2026 at 09:06:00PM +0200, Ard Biesheuvel wrote:
>> What I would like to see is an abstraction implemented in OVMF that encapsulates
>> the logic that you are adding here. All the EFI stub would have to do is call
>> the protocol, nothing more.
>
> Out of pure curiosity, why?
>
> Is the answer something along the lines of, before ExitBootServices(), the
> firmware owns the machine, the kernel should not poke at anything but should
> call the fw and latter is supposed to do the init and synchronization and
> setup of resources, yadda yadda...
>

Essentially. It is a layering violation.

Before ExitBootServices(), the firmware runs with the timer interrupt enabled.
So poking at MSRs to reconfigure this behind the back of the firmware while
it thinks it is still in full control is not a great idea.

Instead, the EFI stub should inform the firmware that it wants alternate
injection, and the firmware can take care of that at EBS() time.

