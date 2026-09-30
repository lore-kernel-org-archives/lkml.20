Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7B371D11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783901; cv=none; b=F0qQTr+ont1JGy65NlNUXsrsFAT68fgVEHRkD2oGdDRaIDvr3RPicjzVGNGgQ6L++7knfq1HezErPa5BnN29Qn4aU6alGn3Bc07G7J9PD/8Q/IeqFKW+CWpY81U/jodjUiFUqIloLz0OkS4aHfLMYX/VAw5Ge5lXkUmioiQjK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783901; c=relaxed/simple;
	bh=EmKmSkLhxGbLF9kRqPw3WFa5r0F4tnxJ1OHbMC8xSXQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UF3dHp67HjP6BKYLYUkqd9oSHoZDO/uq3s1u92x7TWpbCEsEFV2QKOmmt6D7p8PHuQfl+XfxoysiubZQ4jRDfJukBSOiDC/IT0ZUchHhYBplOR85TMHUBA8ClqtUGQOg3aTbIYRR9V15n1OFe45r6QGaQ6e847CcParKOuxvpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QQOAxyqy; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+iSQwtFh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QQOAxyqy";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+iSQwtFh"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790783881; bh=15bf+Q65UcpCS3QKUeXU2Xh
	qWi+bE0+ceFmn77tnDF4=; b=QQOAxyqy2TCJX1Zx5PYna+utEOdOrM1Z43Ri8OBCm2rb3zSUdS
	FnFxFHKB6u4d5jGTFNX4J3M5xuTXoKByvn9PhYwXrRfWPMXTZBEHSmtm8uDdGY4baKKmMuh6NTf
	gOOrp7P6jYKaIOZ3YWotvZbh1XqVwoulhrrhgPBEJDUWw8F9fozvSzKiHXJ90iZFnShifIjV+YW
	Y7n1/3SYFEOqCx7QzHD8VvdTmPfu9GuhWb5NTUdIrZb+WITe6tYH7wZvUHnQCAyTuw2REa1nhGQ
	CiECQvCgJ7FWRX5PK+C95SNX4oxS0icOrRKP0VokW40RHsYFAaNYZ53Tuofti+MQpbQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790783881; bh=15bf+Q65UcpCS3QKUeXU2Xh
	qWi+bE0+ceFmn77tnDF4=; b=+iSQwtFhaxb8quEcrF6KgCExeQ0NTJ6kcbLbL3ZdUoS1jHarFw
	YY/f+MKi1wXk/C1sch63LFcwsRfStKf6fNDg==;
Date: Wed, 30 Sep 2026 16:57:17 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: scrub vector and pointer auth state on task death
In-Reply-To: <F37080C2-29E6-40A7-8784-0236C5700646@mainlining.org>
References: <20260930063647.1356613-1-brads@mainlining.org> <arzB_AJIohqhvoiu@willie-the-truck> <F37080C2-29E6-40A7-8784-0236C5700646@mainlining.org>
Message-ID: <075D5E61-2ACC-4C23-950A-77989A65D8F8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 16:43:09 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>On 30 September 2026 09:02:04 BST, Will Deacon <will@kernel.org> wrote:
>>On Wed, Sep 30, 2026 at 06:36:47AM +0000, Bradley Morgan wrote:
>>> When a task dies its SVE, SME and FPSIMD register state, and its
>>> pointer auth keys, stay in freed slab pages until the allocator hands
>>> them out again. init_on_free=1 users get this wiped for the whole heap
>>> but the option is expensive, so it is off in most builds.
>>> 
>>> The vector registers are not idle memory: userspace crypto runs
>>> AES-GCM and Argon2 through SVE, so key material ends up in
>>> sve_state, sme_state and thread_struct. On task exit and on the
>>> exec and vector length reallocation paths those buffers are
>>> dropped with a plain kfree(), and on task death the register file
>>> copy embedded in thread_struct is not wiped at all. Anything that
>>> reads the freed slab back (slab bugs, cold boot, a leaked page)
>>> gets the dead task's keys.
>>> 
>>> Scrub it. kfree_sensitive() already exists for this exact job,
>>> so the freeing sites just switch to it. The register file copy
>>> and the pointer auth keys embedded in thread_struct cannot go
>>> through kfree_sensitive(), so arch_release_task_struct() zeroes
>>> them directly with memzero_explicit().
>>
>>I don't really find this very compelling, tbh. Presumably this data can
>>end up all over the place: on the stack, in a vCPU structure, in a GPR
>>so it really just feels like doing something for the sake of feeling like
>>we're making the kernel more secure rather than actually adding any
>>tangible benefits. There are also lots of things you're not covering,
>>so it's not clear why this is either necessary or sufficient.
>>
>>What prompted you to do this?
>>
>
>Hi Will,
>
>I may be completely wrong here, but the "it ends up all over the place
>anyway" argument applies to the keys subsystem too, and we still scrub
>there. big_key, dh and friends use kfree_sensitive() on free, with the
>same acknowledgment that the key material passed through other memory
>on the way. iirc nobody argued those were pointless because the key
>also touched a stack or a GPR.
>
>The buffers here are not spill corners either:
>
>- sve_state is the task's whole vector register file, up to ~8KB, and
>  it holds whatever userspace crypto left there. OpenSSL has SVE2 AES
>  GCM assembly these days, so keys do end up in exactly this buffer
>- uw.fpsimd_state is 528 bytes of register file embedded in every
>  task_struct, one slab bug in that file away from being read
>
>And init_on_free, KSTACK_ERASE and kfree_sensitive itself are all the
>same idea, memory that held crypto state should not outlive its task.
>This is just the scoped version, a few KB of memset on task death and
>nothing anywhere else. Still true on today's next btw, sve_free() and
>friends are plain kfree() there.
>
>
>Honestly what prompted me to do this is, an audit of where a dead task's
>secrets
>stay.
>sve_state and
>sme_state free with plain kfree() on a path every exiting task takes,
>that was the whole trigger.
>
>But if "not necessary and not sufficient" is the bar, it bounces the
>keys precedent too, and I don't think you want to argue that. If the
>bar for arm64 is different from the one keys lives with, that's fine,
>I'll drop it, I'd just like to know where it is.
>
>
>>Will
>>
>>P.S. This ended up in my spam for some reason.
>
>Maybe this ended up on spam too?
>
>https://lore.kernel.org/all/20260919121044.13883-1-brads@mainlining.org/
>
>
>--- Thanks!
>"I'm not a very positive person" - Linus torvalds
Oh and if it helps, my mentality for these, is for like someone really
paranoid. Imagine that, if you don't like this, what would you suggest?
--- Thanks!
"I'm not a very positive person" - Linus torvalds
