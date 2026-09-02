Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D449F12D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357011; cv=none; b=uYoq22PlHMZVWwyUrkWWPaliQXHUlWHYtR222odIuDXCohyqwkjs7pwdkgzcfOJc4o+xvB4tjWcoXakBft1pUcegkaIas45EBFfDzTabZ2mhX2f38X5XKp2b1OmDkDeaJkKaxWqfloor6Z8Str2WE5VuEX4Jp1kaw9mE3a6umls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357011; c=relaxed/simple;
	bh=MP286PhoofKXkVrHKkQU7Et1mZIkGFIWksAzrg7rwWI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Nd+/tYuXseSnrvlZ9A1NXPl1AI0bldMdkEto3bANdqtkuFXqJhwV1kv99mlnZWXP+rDunUSvhkn8vK2Y2qPD/6wbpDyROxgj7Hvx7DmvGPl7DDO7vO/Ds7wPFOhKNLQYMXsGBuOD17KJhr7U2lAf97Q6KWRInAOmyPW8IeEfOQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ybsh1orw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WeB03xa/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ybsh1orw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WeB03xa/"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357000; bh=K/h0gd3tsw6WVxtngvlRpT0
	LRl09JE+dXR5GPsvQ4AY=; b=Ybsh1orwoyhmldOacuLSs9JJKS3igIdRl4JoAslSDFnZv+gbPd
	HCzTvT5ubkAG8k6SIr7b82Y1NA7fGa9U4n4mk2+VANYcW6/mvN9EXGqm1TwSDtJV0KU857o0CBn
	PH+woCX9hKZ68rV5PE4VnIuoaLct8Ii9nMjqKFjQ5flpb6x8u9YCf8qMJi4tzen9XV2kIckSZFO
	qQzvQrBqq6MpRCPTPX74/Cf+EDb3NYVzyUWPCGRthV5cAAiuide3wCg9oGSQvdNESiNf0GH50rY
	DfvyvhgR0ExdQb617+aZjL5MHhWw4qFtXuJr6r9kgdHgLl1i0cYlzTpKtlzorhF2rhw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357000; bh=K/h0gd3tsw6WVxtngvlRpT0
	LRl09JE+dXR5GPsvQ4AY=; b=WeB03xa/zNXqvscdV52NjVm81qj90g5YwK6bmyxVKqozl2V0Qf
	c0QI5WqV7DJcVxx5C2fVjcKkGgbVhypqGJCQ==;
Date: Wed, 02 Sep 2026 14:49:57 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
In-Reply-To: <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <20260825205839.14571-3-brads@mainlining.org> <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <FBC45096-70E5-4F97-B2F0-863BCC91BB4F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 14:46:36 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Tue, Aug 25, 2026 at 08:58:34PM +0000, Bradley Morgan wrote:
>> The comment above init_kernel_el() still says the function configures
>> the CPU to execute at the highest reachable EL, but that stopped being
>> true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
>> sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
>> and it is finalise_el2() that brings us back up to EL2 when we want it.
>> 
>> Update the comment to match what the code actually does.
>> 
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Will Deacon <will@kernel.org>
>> ---
>>  arch/arm64/kernel/head.S | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
>This looks to be my patch [1], but with a (partially) rewritten commit
>message, and my S-o-B dropped.
>
>There was admittedly one typo in that commit message that needed to be
>fixed, but I don't think the rest of the changes were necessary, and I
>don't think it's approriate to drop my S-o-B.
>
>I think similar is true for the rest of the series. The patch fixing the
>_cpu_resume() only seems to have a paraphrased commit message.
>
>[1]
>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee4323ff6a2ba4c3989b38f13b2c1a516d6c27e4
>
>Mark.
>
>> 
>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> index 87a822e5c4ca..c6301557eee1 100644
>> --- a/arch/arm64/kernel/head.S
>> +++ b/arch/arm64/kernel/head.S
>> @@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
>>  	.section ".idmap.text","a"
>>  
>>  /*
>> - * Starting from EL2 or EL1, configure the CPU to execute at the
>highest
>> - * reachable EL supported by the kernel in a chosen default state. If
>dropping
>> - * from EL2 to EL1, configure EL2 before configuring EL1.
>> + * Starting from EL2 or EL1, configure the CPU to execute at EL1.
>> + * If dropping from EL2 to EL1, configure EL2 before configuring EL1.
>> + * To use VHE we'll upgrade back to EL2 later in finalise_el2().
>>   *
>>   * Since we cannot always rely on ERET synchronizing writes to sysregs
>(e.g. if
>>   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
>> -- 
>> 2.47.3
Hi mark, do you **WANT** your sob? I don't mind.

I dropped it because it seemed you didn't care about it (or were too
busy),hence, yeah.


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
