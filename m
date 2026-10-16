Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3103D0934;
	Fri, 16 Oct 2026 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183434; cv=none; b=PfjsSlOAm7YQkwdbd6tWedJXSan2ijoI9kAKHosEJ5Ba5XO8LI2ySJCUsISd7bQ7v3kVm25W644UR6ZwAhd4rlTgY+meGdccr92+KiJUjpGvd9f1APgf5oLUH6UxbcRnJYmbHB3deUQP+bzLUEcRHm4gtBT+iI0CRa85hc7VJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183434; c=relaxed/simple;
	bh=9pFfdb1mqqzB2zkxg+3++6pQpqkGbfWo6kmaRppLBNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQ5X+je+Sqf38zDQyLI7FOubfiQQQqQ8QySKZXv84b78/v8tnkkfDK5pycIOLbAuosMKtvhGVp6xVrj+rx/R/jGufhheAkCKBAEXXvNdX8sHeKLHqVonPulYiA+JoBfOP9GNFwovROxyQNPaJVbB1rmo8fPuNl+OnhEUuC23gPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8jlt6ib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8jlt6ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B991F000C4;
	Fri, 16 Oct 2026 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792183433;
	bh=Bf5qdq81dvzp9rRdjUasKtuOogly+3hm0PHe3sSTBxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U8jlt6ibqFx7JchdbH4BHw8gYvPR64+hnJOzcuaqhblHDh4DSYrPruiMTnonCCt0n
	 NcQviVw7PlkNCbagtGio1mLpcpVFI+bXjjgAWz+EO8LCNgRVPmVCL0IuQrdzPCfcjZ
	 1PNCksFsaEo4/PH+dXkDkIaQ8uOJ8gxkMPnym0exe5BXRVll9cq92HdGxOW91hZfXB
	 P3CEB7kqhxPu06z0/cJYqbDjZWP/19wf5dHbsduqfcQpbaKufsPQTL9UDiV1A4nfOW
	 Jwg7PywfxekkPlHesMSjpCjZmxHeW+YUf0f0MvdD3iOunnUU1e5Re4g4d8psL0Xvpq
	 xtrh4VyReXwww==
Message-ID: <711e8518-5054-49ab-8432-346049a86cd1@kernel.org>
Date: Fri, 16 Oct 2026 21:43:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
To: George Neacsu <geocausa@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Sergey Lebedev
 <lsa.uz@pm.me>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com>
 <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org>
 <MauBAKkof1YpFlKvbDY7aCVPJ7mWZAEfTqh_cFY0daJOpY1UolMkV0PgU4LBc2A7dPrI2RmhQYAlVg5SLA9fmA==@protonmail.internalid>
 <20261016161618.209290-1-geocausa@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261016161618.209290-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:16, George Neacsu wrote:
> Hi Bryan,
> 
> On 16/10/2026 17:06, Bryan O'Donoghue wrote:
>> You describe regulators, clocks and resets in the yaml file which then
>> don't appear to be supported in this result code ?
>>
>> - regulator_bulk_;
>> - clock_bulk_
>> - reset gpio optional
>>
>> I don't think this driver would survive suspend/resume.
> 
> The power handling comes from a prerequisite: this series applies on
> top of Sergey's "media: i2c: ov13858: add regulator, clock and reset
> GPIO handling" v3, as the cover letter says, but that is easy to miss
> from 2/2 alone:
> https://lore.kernel.org/all/20260831130312.26296-1-lsa.uz@pm.me/


Hmm if you use b4 to generate your series, the tooling will pull this 
type of thing in for you and reviewers like me.
> With it, the driver gets the three supplies with
> devm_regulator_bulk_get(), enables and disables the clock it already
> takes with devm_v4l2_sensor_clk_get(), and takes an optional reset
> GPIO. Power on and power off are the runtime PM callbacks through
> DEFINE_RUNTIME_DEV_PM_OPS(), which also routes system sleep through
> pm_runtime_force_suspend() and pm_runtime_force_resume(). So the binding
> describes what the driver handles once both are applied. On its own,
> 2/2 only adds the OF match and the endpoint checks.
> 
> I cannot claim it survives system suspend on the Snapdragon model,
> though.

No its fine, I'll pull that series first. "Wouldn't survive reset" 
actually meant "I can't believe this works without powering on the 
rails" but the other series does that ;)

  System suspend is still an open problem on the Surface Pro 11
> under Linux and has not been validated, so I cannot exercise that path
> here yet. What I can test is the
> runtime PM path, which is where the supplies, clock and reset are
> switched: the sensor powering off between sessions and back on for the
> next stream. I will run repeated open, stream, close cycles and report
> the result. Sergey, if suspend works on the Intel model, a suspend and
> resume test there would cover the rest.
> 
> To make the dependency visible, I can carry Sergey's patch as 1/3 of
> the next version, with his authorship. Sergey, would that be all right
> with you, or would you rather post v4 yourself?

No need

b4 prep --edit-deps   # add: message-id: 
<20260831130312.26296-1-lsa.uz@pm.me>

b4 prep; b4 send

Then dependencies should be represented and sucked in automagically.

> 
> Thanks,
> George

