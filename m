Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199D38F624
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576315; cv=none; b=KR+S51GkPDp+BhqzT2pi5KZ3YsBy0aNzkttpSS7QFjuiWy1H10m9gOiQNLc7xWJBOdp3e7lwsA3P2C9cOAGKeFoIpEC/krs5QqawkBgwiDJ4KBQptCaV+0g/atBZAWEAK4BGF7KssOLseci+ok/j2rCa7hLsxf6KvTx1BgFG2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576315; c=relaxed/simple;
	bh=MBfI3S8vHgsRVnTVLpMs8zqJ64YFvIZ4Rp+VHUUMCF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bX7sQoteedEaCvACT7vKXCan7uhBiyjzs7WTMiUATjpcerCyI5PLWTwS1ol960zunPdtA6GK227UEBX7OxB+m3KvEferhbqnm7luUHmIPJ2R2qb0bhGC6j1HMu0xKjYPw5/ig8pZPjuC57FJ3zkI7765KOpQdN/KBneJcOazrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=WdA+crwM; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="WdA+crwM"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 673398128F;
	Mon, 28 Sep 2026 08:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=k1; bh=4aV56peU8WtbQLQO3SzOE2
	om988Ek3ZV5yif2if6ZAk=; b=WdA+crwMTqb5T3FSnbqguIhirqtKbIuBucYSNb
	QqiI36Qau7fq0M6ekJ6mBp7hiyNk5PF8Amqrkv/1c2rzsxjQMk8ynO0bpTrhP5+r
	54vtVlVZugN8xc3KwktFCnAsDCD+2mutqpHbWHihCjL2SfM9YcuPYLOffknvS08x
	jrdoIQO9Uqu8BzZAehhyhuuKjMvVCZJWF+sPw1olG/I9AmHzuMKWcf/NxcftrASO
	fEfXBiL43NYpzNPfFrcVZr3Ob9s9MbhSto7iZZ4O6gU46b52tCBim72FXAhpX7QY
	UL+phHNYCaeIE9pKcbdfKiUUEb8zcKiuFJieJLDvVJvM0RUA==
Message-ID: <86e4b5dc-2a74-40d9-9c45-55b279bff0e2@sysgo.com>
Date: Mon, 28 Sep 2026 09:18:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] printk: Remove console options before decoding the
 name
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
 <20260924070153.250783-2-david.engraf@sysgo.com>
 <arTUXC9zpqZhrPTP@tlindgre-MOBL1>
Content-Language: en-US, de-DE
From: David Engraf <david.engraf@sysgo.com>
In-Reply-To: <arTUXC9zpqZhrPTP@tlindgre-MOBL1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.09.26 10:42 wrote Tony Lindgren:
> On Thu, Sep 24, 2026 at 10:00:57AM +0300, David Engraf wrote:
>> This fixes a regression when a console option includes ':'. Commit
>> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
>> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
>> colon. If the colon is part of an option the name is handled as devname
>> instead of ttyname.
>>
>> Fix by handling the options first which will add a NULL terminator to the
>> string and refactor idx handling to clean up the code (thanks to Petr
>> Mladek).
> 
> Maybe clarify the above a bit to make it clear that the refactoring is
> needed for the fix. Something like:
> 
> Fix by handling the options first which will add a NULL terminator to the
> string. Note that parsing the options first means that also idx parsing
> needs changing. Handle the idx parsing by refactoring the code (thanks to
> Petr Mladek).
> 
> Other than that:
> 
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

Sure I can update the description. Should I create a v4 with the updated 
description and your review tag or how to proceed?

Best regards
- David


