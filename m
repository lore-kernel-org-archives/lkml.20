Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E652BDC0E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357095; cv=none; b=AXg0Hc922xQMKmiVE4JtLxPABrh0qg8H2VWtkL6xJJNFQlk234Q/F5uCeWwfzCog5WYVMmh0HQhX2GzEHnzZFGODZAZwWunmarHRImkLD2ePHpBxFlvhDJIuH1773TwKYX0aPPXpzG3xrJBWjIqtTpnJwEm8lH+lMOhvUf6gXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357095; c=relaxed/simple;
	bh=ViLd+exPl9a2OgtQK+sZhUvPVdUuBOKO6OeRwSKoq1U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=muWhb5VbTlLWAV7Hv5DtFTf++cf1i02/P17N7uMubSDlztgkipicGv1y7NmVVGTn8RwXCGob76w8Ll6DS2PoM7ifyjAlmALmk/E5wB7OkXQYgXenhtOrBnAsn3opzfH7tgEdZCwLZbgWeMihmSaNTYJ+Z9BIxHzRSgz3rz9czQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Xw263usu; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GnxnxnYv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Xw263usu";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GnxnxnYv"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357084; bh=KwIFfSx+XD5a7sC0XmkVh7Y
	DuYan2JuQeOfx7dPjlyo=; b=Xw263usuTobwVu3ZPe3GlstVM9g/1kVc3YoGnI1soFturQ1jgK
	gCYoojyovu42EKY+2coXrAakDWF/3uYZrnG0YjxvN4rEHMGYbXP3O0b/TQts/4/RivKgwfv+lyt
	QgFTWY7I+9nNRug02aXcg6poYp1ZXDzRFrUvvalHuW9c2mjg1//bXxMBnFSzbR6NeI7lLtVJRAI
	aLSZI4xdCRog2qZFpcO0o51Hp8YXyP1zkMNmcGI0tJJ0CLCVaQXSOtViVJhzGLd8u9czR1CuKNA
	MRj8ovw2cB/CGt1l10yRWK1fyEL+8HCJe9K4vcrNHr+pmlvyA8q2PgLOU7Kf47MZjWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357084; bh=KwIFfSx+XD5a7sC0XmkVh7Y
	DuYan2JuQeOfx7dPjlyo=; b=GnxnxnYvr14CijySVZRt67D3Nlk2N6u7awJgjyDCVoGJ0pWF0W
	4/8R+bVe08vreAyjdhyGW3JFBTpfet9v0oCg==;
Date: Wed, 02 Sep 2026 14:51:22 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
>> This comes out of the hibernate resume discussion where Will asked if
>> the restored kernel's hyp vectors are reinstalled before we come back
>> from swsusp_arch_suspend() and free the reserved pages. Rather than
>> answer with a one off fix, this series reworks resume to look like a
>> resume from idle, which makes the answer fall out on its own.
>> 
>> The series leans on Mark Rutland's old work for inspiration, he had the
>> same end goal in a branch from back then:
>> 
>>  
>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
>
>Most of the series seems to be a rebased of those patches, just with
>paraphrased commit messages and my S-o-B lines dropped. As commented on
>patch 4, I do not think that is appropriate.

Same question as patch 2

If you want your S-O-B added, ok fine, but yeah.

Do you think this series itself is good? 

>
>I'll take a more in-depth look shortly.

thanks!

>
>Catalin, Will, for the moment please do not pick these up.
>
>Mark.
>
>> The short answer to the question: yes, but only because the rework makes
>> resume look like a resume from idle. We enter cpu_resume() at the
>highest
>> available EL with the MMU off, and the resumed kernel installs its own
>> hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
>> else runs, so by the time swsusp_free() releases the trans_pgd copies
>> nothing points at them anymore.
>> 
>> The series is structured so the first patch stands alone as a stable
>> worthy fix for the missing hvc arguments. The rest is the cleanup: the
>> stale init_kernel_el() comment gets corrected, MTE tag pages get freed
>> after save instead of leaking on failed hibernates, the fragile
>> _cpu_resume() calling convention gets split, and the last patch reworks
>> hibernate to use the regular cpu_resume() logic end to end.
>> 
>> Everything object compiles and passes checkpatch and sparse. I could not
>> boot or run a hibernate cycle on real hardware here, so that still wants
>> doing before anyone gets excited.
>> 
>> Bradley Morgan (7):
>>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
>>   arm64: head: correct comment for init_kernel_el()
>>   arm64: hibernate: free MTE tag pages after saving
>>   arm64: hibernate: fix _cpu_resume() calling convention
>>   arm64: hibernate: use dcache_by_myline_op
>>   arm64: hibernate: only clean to PoC
>>   arm64: hibernate: use regular cpu_resume() logic
>> 
>>  arch/arm64/include/asm/suspend.h  |  1 -
>>  arch/arm64/kernel/head.S          |  6 +--
>>  arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
>>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
>>  arch/arm64/kernel/sleep.S         |  6 +--
>>  5 files changed, 88 insertions(+), 78 deletions(-)
>> 
>> -- 
>> 2.47.3

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
