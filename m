Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF73CAE76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905333; cv=none; b=UZVWLBwxyfDzEfYLm5LBas+LfSlvxxc3XxX+WfSet7QVkipAW5zGsWFb3kIr9Ct40HOmDOvW3IYcF1M8330F+Tav6XPnQh/VzA/NSMjCcOeMe1T5kNNZBBP9OJuxJDsRRCKixeh27/fhrgsQPo//M+pmOhAv/BkefgKNptUWV0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905333; c=relaxed/simple;
	bh=8aistiWeZMxzO+GvP947JajSfgYMiS3/R9uGqVzCK70=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=K91YooqF26NuCCCHWTBw1Aj+87gz/xDqpFDjA8rDFPtpRzPjrjWpFtTOe+FxoZzsDXMkveCQo8EMvuP2QM/HPFPIclEnhnZk6GeToxf1S5D+Fdsvz5o8ZW85wpew5h9ylG+Q1kUYUZLs/udxf1buwPSC4/Vbvm24rCm40D27JMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LLoCsyWO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4EdPm54F; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LLoCsyWO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4EdPm54F"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905322; bh=8aistiWeZMxzO+GvP947Jaj
	SfgYMiS3/R9uGqVzCK70=; b=LLoCsyWOLc5se3POLxHYK/5KBn1PJirfzka6H2+793cDoQSITG
	QhbcOFCd9jCF+wg50awnETlEHrWyxQYgD+dLpmsIzwJq9LmY3Q2oMK8MgKK5YiX8nnNA6YhTQje
	B0Gb+/JXAFo/mBU3MR0AesokmHG1s/Jb8ZEcknh1raL7JixHG6QG627DADngMzp3K/y5NRPQ1gy
	kVGnpxwXw8piR4ua5eoEjCtEade9K/vB+wsd/IDo9j7RiyfEGZkNLOJG3Q97EZFksEMMk6EFP6E
	5ZhJbRfMJ3W2Qo4vdcdFN20ZvyaU/8Z0Aim1CWgFe06JZGenSJ2ijuizIMrAwQWUnkw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905322; bh=8aistiWeZMxzO+GvP947Jaj
	SfgYMiS3/R9uGqVzCK70=; b=4EdPm54FIWthVQ3ePOa4jN5vuK1rfux7A2qR9FN0yjXGfI+2tu
	vhFdS34LDpjLrURpvCznF8w3q+7WWQbNx0AQ==;
Date: Sun, 20 Sep 2026 12:55:22 +0100
From: Bradley Morgan <brads@mainlining.org>
To: ljs@kernel.org
CC: benquike@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 luto@amacapital.net, wad@chromium.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_seccomp=3A_restore_knotif-=3Estate_?=
 =?US-ASCII?Q?when_SECCOMP=5FADDFD=5FFLAG=5FSEND_is_interrupted?=
In-Reply-To: <aq-w4L8KNnLNFYNZ@gremlin>
Message-ID: <5574124D-52A7-40B9-912A-A915038B1BB2@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 September 2026 11:10:45 BST, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
wrote:
>On Sat, Sep 19, 2026 at 08:50:57PM -0700, Kees Cook wrote:
>> On Sat, Sep 19, 2026 at 08:35:14PM +0000, Hui Peng wrote:
>> > In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
>> > knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
>> > SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
>> > in wait_for_completion_interruptible(&kaddfd.completion).
>> >
>> > If wait_for_completion_interruptible() is interrupted by a signal
>before
>> > the target task processes the kaddfd entry, seccomp_notify_addfd()
>> > removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
>> > leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.
>>
>> Are you able to construct a regression test for this so we can catch
>> this race if it ever gets exposed again?
>
>I'd disregard this guy and treat this as, at best, an AI-generated bug
>report.
>
>He sent 115 patches across 40 subsystems in 2 hours.
>
>https://lore.kernel.org/all/?q=f%3Ahui+peng
>
>Unfortunately I feel we are only at the beginning of this kind of thing :(

Bruh, wasted my time on review. Mad..

I do believe it LGTM though, thanks Lorenzo for the tip.

>
>>
>> --
>> Kees Cook
>>
>
>--
>Cheers, Lorenzo
>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
